import re
import sys
import angr
import subprocess
assert(len(sys.argv) > 2) # path_to_taint.out x1 path_to_pinTrace x1
hexReg = re.compile('^[a-fA-F0-9]+$')
debugMode = False

imageWeakness = {}
def parseImageInfo(line):
    global imageWeakness
    terms = line.split()
    if len(terms) == 5:
        imgId, imgSize, imgPath, imgStart, imgEnd = terms
        imgId, imgSize = int(imgId, 16), int(imgSize, 16)
        imgStart, imgEnd = int(imgStart, 16), int(imgEnd, 16)
        imageWeakness[imgId] = { 'path': imgPath, 'size': imgSize, 'start': imgStart, 'end': imgEnd }

def parseWeakness(line):
    global imageWeakness
    terms = line.split()
    if len(terms) == 7:
        imgId, offset, width, sr, sw, pr, pw = terms
        imgId, offset, width = int(imgId, 16), int(offset, 16), int(width)
        sr, sw, pr, pw = int(sr), int(sw), int(pr), int(pw)
        imageWeakness[imgId][offset] = { 'width': width, 'sr': sr, 'sw': sw, 'pr': pr, 'pw': pw }

def parseTaints(taintsName):
    # 1: img info, 2: stack layout, 3: heap & static var layout, 4: callstack, 5: weak mem access, 6: weakness
    sectionIdx = 0
    with open(taintsName, 'r') as f:
        for line in f.readlines():
            if line.startswith('[INFO]'): sectionIdx += 1
            elif sectionIdx == 1: parseImageInfo(line)
            elif sectionIdx == 6: parseWeakness(line)
#----------------------------------------------------------------#

routineTables = {}
def extractRoutines():
    global routineTables
    for imageId in imageWeakness:
        imagePath = imageWeakness[imageId]['path']
        imageDisasm = subprocess.run(['objdump', '-drwC', imagePath], capture_output=True).stdout
        imageDisasm = imageDisasm.decode().split('\n')
        if len(imageDisasm) == 0: print('[WARNING] extractRoutines: no disasm for %s' % imagePath)

        nameCollisions, routinesAsTable = {}, {}
        for line in imageDisasm:
            terms = line.split()
            if (len(terms) == 2) and (len(terms[0]) == 16) and (hexReg.match(terms[0]) != None):
                routineOffset = int(terms[0], 16)
                routineName = terms[1].strip('<>:').split('@')[0]
                nameCollisions[routineName] = (nameCollisions[routineName] + 1) if (routineName in nameCollisions) else 1
                routineName += '/' + str(nameCollisions[routineName])
                routinesAsTable[routineName] = { 'offset': routineOffset }
        routineTables[imageId] = routinesAsTable
#----------------------------------------------------------------#

def labelMemoryAccess(traceName):
    global routineTables
    runtimeAddrs = []

    with open(traceName, 'r') as f:
        nameCollisions = { imgId: {} for imgId in imageWeakness }
        for line in f.readlines():
            terms = line.split()
            if (len(terms) == 5) and (terms[0] == 'RTN'):
                _, imgName, rtnName, addr, size = terms
                addr, size = int(addr, 16), int(size, 16)
                shortName, imageId = imgName.split('/')[-1], None
                rtnName = rtnName.split('@')[0]

                for i in imageWeakness:
                    shortRef = imageWeakness[i]['path'].split('/')[-1]
                    if shortName == shortRef: imageId = i
                nameCollisions[imageId][rtnName] = (nameCollisions[imageId][rtnName] + 1) if (rtnName in nameCollisions[imageId]) else 1
                rtnName += '/' + str(nameCollisions[imageId][rtnName])

                # handle the case where rtn/(i+1) loaded, but not rtn/(i)
                while rtnName in routineTables[imageId]:
                    vaddrStr = '%08x' % addr
                    offsetStr = '%08x' % routineTables[imageId][rtnName]['offset']
                    if vaddrStr[-3 : ] == offsetStr[-3 : ]: break
                    rtnName = '/'.join((rtnName.split('/'))[ : -1])
                    nameCollisions[imageId][rtnName] += 1
                    rtnName += '/' + str(nameCollisions[imageId][rtnName])

                if rtnName not in routineTables[imageId]:
                    for r in routineTables[imageId]:
                        predecessor = routineTables[imageId][r]
                        if 'size' not in predecessor: continue
                        offset = predecessor['offset'] + predecessor['size']
                        if predecessor['end'] == addr:
                            routineTables[imageId][rtnName] = { 'offset': offset }
                            break
                if rtnName in routineTables[imageId]:
                    routineTables[imageId][rtnName]['size'] = size
                    routineTables[imageId][rtnName]['start'] = addr
                    routineTables[imageId][rtnName]['end'] = addr + size
                runtimeAddrs.append((addr, addr + size, imageId, rtnName))
        runtimeAddrs.sort()

    with open(traceName, 'r') as f:
        segStart, segEnd, segImg, segRtn = -1, 0, 0, ''
        for line in f.readlines():
            terms = line.split()
            if (len(terms) == 9) and ((terms[4] == 'R') or (terms[4] == 'W')):
                _, iAddr, _, mAddr, rwType, _, dVal, _, dSize = terms
                iAddr, mAddr, dVal, dSize = int(iAddr, 16), int(mAddr, 16), int(dVal, 16), int(dSize)

                if (iAddr < segStart) or (iAddr >= segEnd):
                    for segment in runtimeAddrs:
                        segStart, segEnd, segImg, segRtn = segment
                        if (iAddr >= segStart) and (iAddr < segEnd): break
                    else: continue
                if segRtn in routineTables[segImg]:
                    opOffset = iAddr - segStart
                    if opOffset not in routineTables[segImg][segRtn]:
                        routineTables[segImg][segRtn][opOffset] = {}
                    routineTables[segImg][segRtn][opOffset][rwType] = 'safe'
#----------------------------------------------------------------#

def labelWeakness():
    global routineTables
    for imageId in imageWeakness:
        for opOffset in imageWeakness[imageId]:
            if not isinstance(opOffset, int): continue
            for rtnName in routineTables[imageId]:
                rtnInfo = routineTables[imageId][rtnName]
                if 'size' in rtnInfo:
                    rtnStart = rtnInfo['offset']
                    rtnEnd = rtnStart + rtnInfo['size']
                    if (opOffset >= rtnStart) and (opOffset < rtnEnd): break
            else:
                print('[ERROR] labelWeakness: homeless weakness %d %08x' % (imageId, opOffset))
                continue

            props = imageWeakness[imageId][opOffset]
            if props['sr'] + props['pr'] > 0:
                routineTables[imageId][rtnName][opOffset - rtnStart]['R'] = 'protected'
            if props['sw'] + props['pw'] > 0:
                routineTables[imageId][rtnName][opOffset - rtnStart]['W'] = 'protected'
#----------------------------------------------------------------#

def printWeakness():
    for imageId in routineTables:
        print('IMAGE %d' % imageId)
        for rtnName in routineTables[imageId]:
            rtnInfo = routineTables[imageId][rtnName]
            rwOffsets = [ offset for offset in rtnInfo if isinstance(offset, int) ]
            rwOffsets.sort()
            readCount, writeCount = 0, 0
            for offset in rwOffsets:
                if 'R' in rtnInfo[offset]:
                    if rtnInfo[offset]['R'] == 'protected':
                        print('R %d %s %08x' % (readCount, rtnName, offset + rtnInfo['offset']))
                    readCount += 1
                if 'W' in rtnInfo[offset]:
                    if rtnInfo[offset]['W'] == 'protected':
                        print('W %d %s %08x' % (writeCount, rtnName, offset + rtnInfo['offset']))
                    writeCount += 1
#----------------------------------------------------------------#

def collectBlocks(imagePath):
    funcMap = {}
    nameCollisions = {}
    p = angr.Project(imagePath, auto_load_libs=False)
    cfg = p.analyses.CFGFast()

    for funcAddr in cfg.kb.functions:
        funcProps = cfg.kb.functions[funcAddr]
        funcBlocks = [ (b.addr, b.addr + b.size) for b in funcProps.blocks ]
        funcBlocks.sort()
        funcCallouts = list(funcProps.get_call_sites())
        CalloutEnds = { bE: True for bS, bE in funcBlocks if bS in funcCallouts }

        for blockIdx in range(1, len(funcBlocks)):
            prevStart, prevEnd = funcBlocks[blockIdx - 1]
            currStart, currEnd = funcBlocks[blockIdx]
            if (prevEnd in CalloutEnds) and (currStart == prevEnd):
                funcBlocks[blockIdx - 1], funcBlocks[blockIdx] = None, (prevStart, currEnd)
        funcOffset = funcProps.offset
        funcBase = funcAddr - funcOffset
        llvmBlocks = [ ((b[0] - funcBase), (b[1] - funcBase)) for b in funcBlocks if b != None ]

        funcName, funcSize = (funcProps.name).split('@')[0], funcProps.size
        nameCollisions[funcName] = (nameCollisions[funcName] + 1) if (funcName in nameCollisions) else 1
        funcName += '/' + str(nameCollisions[funcName])
        funcMap[funcOffset] = { 'name': funcName, 'addr': funcAddr,  'size': funcSize, 'blocks': llvmBlocks }
    return (cfg, funcMap)

def calibrateOffsets(imageId, funcMap):
    disasmCursors = [ (routineTables[imageId][rtnName]['offset'], rtnName) for rtnName in routineTables[imageId] ]
    disasmCursors.sort()
    cfgCursors = list(funcMap.keys())
    cfgCursors.sort()

    calibratedMap = {}
    if len(disasmCursors) > 0:
        calibration = 0x0
        # if imageId == 4: calibration = 0x400000

        for funcOffset in funcMap:
            newOffset = funcOffset - calibration
            newName = funcMap[funcOffset]['name']
            newAddr = funcMap[funcOffset]['addr']
            newSize = funcMap[funcOffset]['size']
            oldBlocks = funcMap[funcOffset]['blocks']
            newBlocks = [ (bS - calibration, bE - calibration) for bS, bE in oldBlocks ]
            calibratedMap[newOffset] = { 'name': newName, 'addr': newAddr,  'size': newSize, 'blocks': newBlocks }
        cfgCursors = [ (c - calibration) for c in cfgCursors ]

    return disasmCursors, cfgCursors, calibratedMap


def mapRoutineBlocks():
    global routineTables
    for imageId in imageWeakness:
        if (imageId == 2) or (imageId == 3): continue # ignore linker and VDSO
        cfg, funcMap = collectBlocks(imageWeakness[imageId]['path'])
        disasmCursors, cfgCursors, funcMap = calibrateOffsets(imageId, funcMap)

        for disCursor, disName in disasmCursors:
            if 'size' in routineTables[imageId][disName]:
                shouldBeMapped = False
                for opOffset in routineTables[imageId][disName]:
                    if isinstance(opOffset, int):
                        rwRecord = routineTables[imageId][disName][opOffset]
                        if ('W' in rwRecord) and (rwRecord['W'] == 'protected'): shouldBeMapped = True
                        if ('R' in rwRecord) and (rwRecord['R'] == 'protected'): shouldBeMapped = True
                if not shouldBeMapped: continue

                if disCursor not in cfgCursors:
                    print('[ERROR] mapRoutineBlocks: no blocks for %d %s' % (imageId, disName))
                    continue
                disEnd = disCursor + routineTables[imageId][disName]['size']
                disBlocks, cfgIdx = [], cfgCursors.index(disCursor)
                while cfgIdx < len(cfgCursors):
                    if cfgCursors[cfgIdx] >= disEnd: break
                    llvmBlocks = funcMap[cfgCursors[cfgIdx]]['blocks']
                    for bStart, bEnd in llvmBlocks:
                        if (bStart >= disCursor) and (bEnd <= disEnd):
                            disBlocks.append((len(disBlocks), bStart, bEnd))
                    cfgIdx += 1
                routineTables[imageId][disName]['blocks'] = disBlocks

                for opOffset in routineTables[imageId][disName]:
                    if isinstance(opOffset, int):
                        rwRecord = routineTables[imageId][disName][opOffset]
                        wStr = 'W-masked' if ('W' in rwRecord) and (rwRecord['W'] == 'protected') else ''
                        rStr = 'R-masked' if ('R' in rwRecord) and (rwRecord['R'] == 'protected') else '' 
                        if (len(wStr) == 0) and (len(rStr) == 0): continue
                        opOffset += routineTables[imageId][disName]['offset']
                        for bbIdx, bStart, bEnd in disBlocks:
                            if (opOffset >= bStart) and (opOffset < bEnd):
                                print('IMAGE %d RTN %s BB %d %08x-%08x %s %s' %
                                      (imageId, disName, bbIdx, bStart, bEnd, wStr, rStr))
                                break
                        else: print('[ERROR] mapRoutineBlocks: no block for IMAGE %d RTN %s OP %08x' %
                                    (imageId, disName, opOffset))
#----------------------------------------------------------------#

print('[+] Parse taint.out ...')
parseTaints(sys.argv[1])
print('[+] Disassemble all images + Record their routines ...')
extractRoutines()
print('[+] Parse our Pintool trace + Label all reads/writes ...')
labelMemoryAccess(sys.argv[2])
print('[+] Label vulnerable reads/writes ...')
labelWeakness()
if debugMode:
    print('[+] List all to-be-masked reads/writes ...')
    printWeakness()
print('[+] Map CFG blocks to disasm/Pin-trace routines ...')
mapRoutineBlocks()

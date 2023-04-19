
import sys
assert(len(sys.argv) > 1) # header_list

cmd = []
with open(sys.argv[1], 'r') as f:
    for line in f.readlines():
        line = line.strip()
        cmd.append('-I /usr/include/%s' % line)

print('llvm-mctoll -d --filter-functions-file=restrict.txt app %s' % ' '.join(cmd))

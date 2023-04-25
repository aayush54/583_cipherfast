#include <unordered_map>

using namespace std;

int main() {
  unordered_map< void*, int > m;
  void* ptr =(void*)(&m);
  for (int i = 0; i < 257; ++i, ptr += 1) m[ptr] = i;
  return 0;
}


#define INTEL_RET_INSTRUCTION 0xc3
#define INTEL_INT3_INSTRUCTION 0xcc

pid_t findProcessByName(char* processName);
long freespaceaddr(pid_t pid);
long getlibaddr(pid_t pid, char *prefix);
int checkloaded(pid_t pid, char* libname);
long getFunctionAddress(char* funcName, char* libName);
unsigned char* findRet(void* endAddr);
void usage(char* name);

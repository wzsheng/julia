#include "../../src/jl_exported_funcs.inc"

// On macOS, we need to prepend underscores on symbols
#if defined(__APPLE__) && defined(__MACH__)
#define UNDERSCORE(x) _##x
#else
#define UNDERSCORE(x) x
#endif

#define XX(name) \
.global name; \
name##:; \
    endbr64; \
    mov UNDERSCORE(name##_addr)(%rip),%rax; \
    jmpq *%rax; \
    ud2; \

JL_EXPORTED_FUNCS(XX)
#undef XX

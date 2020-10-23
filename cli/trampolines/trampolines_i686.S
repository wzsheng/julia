#include "../../src/jl_exported_funcs.inc"

// On Windows, we need to prepend underscores on symbols
#if defined(_WIN32)
#define UNDERSCORE(x) _##x
#else
#define UNDERSCORE(x) x
#endif

#define XX(name) \
.global name; \
name##:; \
    endbr32; \
    jmpl *(UNDERSCORE(name##_addr)); \
    ud2; \

JL_EXPORTED_FUNCS(XX)
#undef XX

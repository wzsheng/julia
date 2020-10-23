#include "../../src/jl_exported_funcs.inc"

#define XX(name) \
.global name; \
name##: ; \
    std 2,24(1); \
    ld 12,name##_addr@toc(2); \
    mtctr 12; \
    bctr; \

JL_EXPORTED_FUNCS(XX)
#undef XX

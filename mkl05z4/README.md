# NXP / Freescale MKL05Z4 from scratch

# Standard Freescale header files
- MKL05Z4.h : includes core_cm0plus.h and system_MKL05Z4.h
- system_MKL05Z4.h


# Standard CMSIS header files
- core_cm0plus.h : includes core_cmFunc.h and core_cmInstr.h
- core_cmFunc.h
- core_cmInstr.h : includes cmsis_gcc.h

# Files to be implemented by the integrator / developer
- MKL05Z4.ld : linker script for GCC
- startup_MKL05Z4.s : assembly startup
- system_MKL05Z4.c : system configuration

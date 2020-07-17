#include <stdint.h>
#include "MKL05Z4.h"

uint32_t SystemCoreClock;

void SystemInit(void) {
	SystemCoreClock = DEFAULT_SYSTEM_CLOCK;
	// do other system initialisation then,
	// call main() here
}


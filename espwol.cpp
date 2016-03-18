#include "espmissingincludes.h"
extern "C" {
#include "ets_sys.h"
#include "osapi.h"
#include "gpio.h"
#include "os_type.h"
  void ICACHE_FLASH_ATTR user_init(void);
  
}
//#include <iostream>
//int os_printf_plus(cost char *format, ...) __attribute__ ((format (printf, 1,2)));



void ICACHE_FLASH_ATTR user_init()
{
  // init gpio subsystem
  gpio_init();
  os_printf("In user_init\n.");
}
 

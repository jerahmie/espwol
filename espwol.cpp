#include "espmissingincludes.h"
extern "C" {
#include "ets_sys.h"
#include "osapi.h"
#include "gpio.h"
#include "os_type.h"
#include "user_interface.h"
#include "driver/uart.h"
}
#include "user_config.h"

void user_rf_pre_init(void){};

void init(){
  os_printf("After system_init_done.");
}

void ICACHE_FLASH_ATTR user_init()
{
  // init gpio subsystem
  uart_init(BIT_RATE_115200, BIT_RATE_115200);
  //gpio_init();

  // Print a message after system init done.
  system_init_done_cb(init);
}
 

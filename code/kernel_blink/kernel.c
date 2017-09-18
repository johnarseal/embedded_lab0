/**
 * @file   kernel.c
 *
 * @brief  entry point to the raspberry pi kernel
 *
 * @date   September 2 2015
 * @author Aaron Reyes <areyes@andrew.cmu.edu>
 */

#include <arm.h>
#include <leds.h>
#include <gpio.h>

void kernel_main(void) {
  volatile uint32_t cnt;
  // turn off both LEDs
  led_init();
  led_clr_red();
  led_clr_green();

  cnt = 0;
  // loop and turn on each LED after *some* time delay
  while (1) {
    delay_cycles(100000);
    led_set_red();
    led_clr_green();
    delay_cycles(100000);
    led_set_green();
    led_clr_red();
    cnt++;
  }
}

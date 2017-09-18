/**
 * @file   leds.c
 *
 * @brief  helper functions for interacting with in-chip leds
 *
 * @date   July 15 2015
 * @author Aaron Reyes <areyes@andrew.cmu.edu>
 */

#include <gpio.h>

/* helper defines for accessing the LEDs on the pi
 *  note this is not documented. just some hacks people have found out.
 *  ~~ this is also specific to the pi model B 2 only! ~~
 */

/** @brief GPIO pin number for green led */
#define LED_GRN_PIN 47
/** @brief GPIO pin number for red led */
#define LED_RED_PIN 35


void led_init(void) {
  gpio_config(LED_GRN_PIN, GPIO_FUN_OUTPUT);
  gpio_config(LED_RED_PIN, GPIO_FUN_OUTPUT);
}


void led_set_green(void) {
  gpio_set(LED_GRN_PIN);
}


void led_clr_green(void) {
  gpio_clr(LED_GRN_PIN);
}


void led_set_red(void) {
  gpio_set(LED_RED_PIN);
}


void led_clr_red(void) {
  gpio_clr(LED_RED_PIN);
}

/**
 * @file   leds.h
 *
 * @brief  helper functions for interacting with on-chip LEDS on pi
 *
 * @date   July 15 2015
 * @author Aaron Reyes <areyes@andrew.cmu.edu>
 */

#ifndef _LEDS_H_
#define _LEDS_H_

/**
 * @brief initializes the on-chip LEDs. only call this once.
 */
void led_init(void);

/**
 * @brief turn the green LED labeled ACT on
 */
void led_set_green(void);

/**
 * @brief turn the green LED labeled ACT off
 */
void led_clr_green(void);

/**
 * @brief turn the red LED labeled PWR on
 */
void led_set_red(void);

/**
 * @brief turn the red LED labeled PWR off
 */
void led_clr_red(void);

#endif /* _LEDS_H_ */
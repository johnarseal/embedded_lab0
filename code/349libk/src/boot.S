/**
 * @file   boot.S
 *
 * @brief  kernel entry point
 *
 * @date   July 15 2015
 * @author Aaron Reyes <areyes@andrew.cmu.edu>
 */

#include <BCM2836.h>
#include <psr.h>

// label to make sure this code is executed first
.section ".text.boot"


/**
 * @brief Entry point for the kernel
 *
 * @param r15 should begin execution at 0x8000
 * @param r0 = always zero
 * @param r1 = ARM Linux machine type
 * @param r2 = address of start of ATAGS
 */
.global _start
_start:
  // setup a default irq stack
  mrs r0, cpsr                          // stash cpsr so we can go back
  msr cpsr_c, #(PSR_MODE_IRQ | PSR_IRQ | PSR_FIQ) // jump to IRQ
  ldr sp, =__irq_stack_top              // setup the irq stack
  msr cpsr_c, r0                        // jump back to the original mode
  // setup the stack to start where the kernel is loaded and grow DOWN as needed
  ldr sp, =__svc_stack_top
  ldr r0, =__bss_start
  ldr r1, =__bss_end
  mov r2, #0
  mov r3, #0
  mov r4, #0
  mov r5, #0
  // clear out bss
bss_loop:
  stmia r0!, {r2-r5}
  cmp r0, r1
  blo bss_loop
  // no need to initialize .data or .rodata since rpi runs out of ram entirely
  // call kernel_main()
  bl  kernel_main

  // stop a bad kernel
.global hang
hang:
  wfi
  b hang

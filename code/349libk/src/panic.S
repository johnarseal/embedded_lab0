/** @file panic.S
 *
 *  @brief  Low level implementation for panic() and breakpoint() gdb helpers.
 *
 *  @author Ian Hartwig <ihartwig@andrew.cmu.edu>
 */

 
.section ".text"


/** @brief Cause a breakpoint in gdb and stop executing forever */
.global panic
panic:
  bkpt             // cause a breakpoint in gdb
panic_loop:        // loop around nops to avoid gdb crashing on loop to self
  nop
  nop
  nop
  b panic_loop


/** @brief Cause a breakpoint in gdb that can be returned from */
.global breakpoint
breakpoint:
  bkpt             // cause a breakpoint in gdb
  mov pc, lr       // but return to caller if continued or stepped

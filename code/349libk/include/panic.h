/** @file panic.h
 *
 *  @brief Definitions for panic() and breakpoint() gdb helpers.
 *
 *  @author Ian Hartwig <ihartwig@andrew.cmu.edu>
 */

#ifndef _PANIC_H_
#define _PANIC_H_

/** @brief Cause a breakpoint in gdb and stop executing forever */
void panic(void);

/** @brief Cause a breakpoint in gdb that can be returned from
 *
 *  Since OpenOCD didn't make this breakpoint, you'll have to manually run the
 *  gdb command `set $pc=$pc+4` to skip the breakpoint.
 */
void breakpoint(void);

#endif /* _PANIC_H_ */
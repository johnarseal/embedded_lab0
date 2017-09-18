/**
 * @file   swi_num.h
 *
 * @brief  Definitions for SWI numbers used by kernel and newlib syscalls.
 *
 * @date   September 25, 2015
 * @author Kenneth Li <kyli@andrew.cmu.edu>
 */

#ifndef _SWI_NUM_H_
#define _SWI_NUM_H_

/** @brief SWI number for sbrk() */
#define SWI_SBRK    0
/** @brief SWI number for write() */
#define SWI_WRITE   1
/** @brief SWI number for close() */
#define SWI_CLOSE   2
/** @brief SWI number for fstat() */
#define SWI_FSTAT   3
/** @brief SWI number for isatty() */
#define SWI_ISATTY  4
/** @brief SWI number for lseek() */
#define SWI_LSEEK   5
/** @brief SWI number for read() */
#define SWI_READ    6
/** @brief SWI number for exit() */
#define SWI_EXIT    7

/** @brief SWI number for adc_start() */
#define SWI_ADC_START  8
/** @brief SWI number for adc_stop() */
#define SWI_ADC_STOP   9

/** @brief SWI number for thread_init() */
#define SWI_THR_INIT    10
/** @brief SWI number for thread_fork() */
#define SWI_THR_CREATE  11
/** @brief SWI number for mutex_init() */
#define SWI_MUT_INIT    12
/** @brief SWI number for mutex_lock() */
#define SWI_MUT_LOK     13
/** @brief SWI number for mutex_unlock() */
#define SWI_MUT_ULK     14
/** @brief SWI number for wait_until_next_period() */
#define SWI_WAIT        15
/** @brief SWI number for get_time() */
#define SWI_TIME        16
/** @brief SWI number for scheduler_start() */
#define SWI_SCHD_START  17


#endif /* _SWI_NUM_H_ */

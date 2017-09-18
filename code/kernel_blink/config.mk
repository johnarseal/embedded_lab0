###########################################################################
# This is the project configuration file for the makefile.
# You should have to edit only this file to get things to build.
# This file is included when PROJECT is set to the parent directory of this
# file. you should set that variable in the Makefile first before editing
# this file.
#
# Available Variables:
#
# PROJECT - readable user project path this config file belongs to
# PROJECT_INC - settable list of paths to look for include files in
# PROJECT_CCFLAGS - settable list of flags to send to the compiler & assembler
# PROJECT_ASFLAGS - settable list of flags to send to the assembler only
# PROJECT_LDFLAGS - settable list of flags to send to the linker
# K_C_SRC - settable list of c source files to compile
# K_AS_SRC - settable list of asm source files to compile
#
###########################################################################

# Enable debug symbols
PROJECT_CCFLAGS = -g

###########################################################################
# Kernel include directories
###########################################################################
# A list of all include directories where you have .h files
# ex: PROJECT_INC += $(PROJECT)/inc/

PROJECT_INC =

###########################################################################
# Kernel C source code files
###########################################################################
# A list of all C files you want compiled
# ex: K_C_SRC += $(PROJECT)/kernel/src/file.c

K_C_SRC += 349libk/src/gpio.c
K_C_SRC += 349libk/src/leds.c
K_C_SRC += $(PROJECT)/kernel.c

###########################################################################
# Kernel assembly source files
###########################################################################
# A list of all ARM assembly files you want compiled
# ex: K_AS_SRC += $(PROJECT)/kernel/src/file.S

K_AS_SRC += 349libk/src/boot.S
K_AS_SRC += 349libk/src/arm.S

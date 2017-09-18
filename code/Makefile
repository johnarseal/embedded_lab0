##################################################################
# set PROJECT to the name of the directory which holds all the   #
# source code for your kernel inside of the code/ directory      #
##################################################################

PROJECT = kernel

##################################################################
#      Do not edit below this!  Edit config.mk instead!          #
#      Do not edit below this!  Edit config.mk instead!          #
#      Do not edit below this!  Edit config.mk instead!          #
#      Do not edit below this!  Edit config.mk instead!          #
#      Do not edit below this!  Edit config.mk instead!          #
##################################################################

############## VARIABLE DEFINITIONS #################

TOOL = arm-none-eabi
CC = $(TOOL)-gcc
LD = $(TOOL)-ld
AR = $(TOOL)-ar
OBJCOPY = $(TOOL)-objcopy
OBJDUMP = $(TOOL)-objdump
GDB = $(TOOL)-gdb

# Where the user program is loaded, also defined in kernel.ld and user.ld
USER_PROG_ADDR = 0x300000

################ CONFIGURATION INCLUSION #################

# include student KERNEL/USER source files
-include $(PROJECT)/config.mk
-include $(USER_PROJ)/config.mk

# define all KERNEL and USER object files to be compiled
KOBJ = $(K_C_SRC:.c=.o) $(K_AS_SRC:.S=.o)
UOBJ = $(U_C_SRC:.c=.o) $(U_AS_SRC:.S=.o)

# kernel and user include directories, variables set in config.mk
KERNEL_INC = 349libk/include $(PROJECT_INC)
USER_INC = $(USER_PROJ_INC)

# define ALL object files to be compiled
OBJ = $(KOBJ) $(UOBJ)

############# BUILD PARAMETER VARIABLES ################

ARCH = -mfloat-abi=soft -march=armv7-a

CCFLAGS = -nostdlib -Wall -O1 -Werror -ffreestanding $(ARCH)
# PROJECT_CCFLAGS and USER_PROJ_CCFLAGS settable in project config.mk
K_CCFLAGS = $(CCFLAGS) -nostdinc $(addprefix -I ,$(KERNEL_INC)) $(PROJECT_CCFLAGS)
U_CCFLAGS = $(CCFLAGS) $(addprefix -I ,$(USER_INC)) $(addprefix -I ,$(KERNEL_INC)) $(USER_PROJ_CCFLAGS)

# PROJECT_ASFLAGS and USER_PROJ_ASFLAGS settable in project config.mk
K_ASFLAGS = -DASSEMBLER $(K_CCFLAGS) $(PROJECT_ASFLAGS)
U_ASFLAGS = -DASSEMBLER $(U_CCFLAGS) $(USER_PROJ_ASFLAGS)

# PROJECT_LDFLAGS and USER_PROJ_LDFLAGS settable in project config.mk
K_LDFLAGS = $(LDFLAGS) $(PROJECT_LDFLAGS)
U_LDFLAGS = $(LDFLAGS) $(USER_PROJ_LDFLAGS)

# location of libgcc.a for machine specific routines like
# 64 bit division, modulus, etc
LIBGCC = $(shell $(CC) -print-libgcc-file-name)

# all shared object libraries in order of dependence!
KLIBS = $(PROJECT_LIBS) $(LIBGCC)
ULIBS = $(USER_PROJ_LIBS) $(LIBGCC)

################### ROOT RULES #########################

.PHONY: all doc gdb openocd

# If a user program was specified, the gdb script will load both the kernel
# and the user program, and add the symbol file for the user program
ifdef USER_PROJ
all: $(PROJECT)/kernel.img $(USER_PROJ)/user.elf

gdb: $(PROJECT)/kernel.elf $(USER_PROJ)/user.elf
	$(GDB) -x 349util/init.gdb \
	-ex "load $(USER_PROJ)/user.elf" \
	-ex "load $(PROJECT)/kernel.elf" \
	-ex "set confirm off" \
	-ex "add-symbol-file $(USER_PROJ)/user.elf $(USER_PROG_ADDR)" \
	-ex "set confirm on" \
	$(PROJECT)/kernel.elf
else
all: $(PROJECT)/kernel.img

gdb: $(PROJECT)/kernel.elf
	$(GDB) -x 349util/init.gdb -ex "load $(PROJECT)/kernel.elf" $(PROJECT)/kernel.elf
endif

doc:
	doxygen 349util/doxygen.conf

openocd:
	-killall -9 openocd
	openocd -f 349util/rpi2.cfg & sleep 5;echo "halt" | nc localhost 4444; kill -2 $$!
	sleep 5
	openocd -f 349util/rpi2.cfg

################### GENERIC RULES ######################

$(USER_PROJ)/src/%.o: $(USER_PROJ)/src/%.S
	@echo
	@echo "Compiling:" $<
	$(CC) $(U_ASFLAGS) -c $< -o $@

$(USER_PROJ)/src/%.o: $(USER_PROJ)/src/%.c
	@echo
	@echo "Compiling:" $<
	$(CC) $(U_CCFLAGS) -c $< -o $@

%.o: %.S
	@echo
	@echo "Compiling:" $<
	$(CC) $(K_ASFLAGS) -c $< -o $@

%.o: %.c
	@echo
	@echo "Compiling:" $<
	$(CC) $(K_CCFLAGS) -c $< -o $@

%.o: %.s
	@echo
	@echo "You should use the .S file extension rather than .s"
	@echo ".s does not support precompiler directives (like #include)"
	@false

%.a:
	@echo
	@echo "Creating library:" $@
	rm -f $@
	$(AR) rc $@ $^

################# KERNEL RULES #####################

$(PROJECT)/kernel.elf: $(KOBJ)
	@echo
	@echo "Linking kernel..."
	$(LD) $(K_LDFLAGS) -T 349util/kernel.ld -o $(PROJECT)/kernel.elf $(KOBJ) $(KLIBS)
	@echo
	@echo "Dumping kernel assembly to kernel.asm..."
	$(OBJDUMP) -D $(PROJECT)/kernel.elf > $(PROJECT)/kernel.asm

$(PROJECT)/kernel.img: $(PROJECT)/kernel.elf
	@echo
	@echo "Creating kernel image..."
	$(OBJCOPY) $(PROJECT)/kernel.elf -O binary $(PROJECT)/kernel.img
	@echo $(KOBJ)


################# USER PROGRAM RULES #####################

$(USER_PROJ)/user.elf: $(UOBJ)
	@echo
	@echo "Linking user program..."
	$(LD) $(U_LDFLAGS) -T 349util/user.ld -o $(USER_PROJ)/user.elf $(UOBJ) $(ULIBS)
	@echo
	@echo "Dumping user program assembly to user.asm..."
	$(OBJDUMP) -D $(USER_PROJ)/user.elf > $(USER_PROJ)/user.asm


################# CLEANING RULES #####################
.PHONY: clean

clean:
	rm -rf $(PROJECT)/kernel.img $(PROJECT)/kernel.elf $(PROJECT)/kernel.asm
	rm -rf $(USER_PROJ)/user.elf $(USER_PROJ)/user.asm
	rm -rf $(OBJ)
	rm -rf doc doxygen.warn

/* kernel entry point */
ENTRY(_start)

SECTIONS {

  /* note: Raspberry Pi GPU loads kernel and starts CPU running at 0x8000 */
  . = 0x8000;
  __start = .;

  __text_start = .;
  .text : {
    KEEP(*(.text.boot))
    *(.text)
  }
  . = ALIGN(4096); /* align to page size */
  __text_end = .;

  __rodata_start = .;
  .rodata : {
    *(.rodata)
  }
  . = ALIGN(4096); /* align to page size */
  __rodata_end = .;

  __data_start = .;
  .data : {
    *(.data)
  }
  . = ALIGN(4096); /* align to page size */
  __data_end = .;

  __bss_start = .;
  .bss : {
    bss = .;
    *(.bss)
  }
  . = ALIGN(4096); /* align to page size */
  __bss_end = .;

  . = ALIGN(8);
  __heap_low = .; /* for _sbrk */
  . = . + 0x100000; /* 1mB of heap memory */
  __heap_top = .; /* for _sbrk */
  . = . + 0x10000; /* 64kB of svc stack memory */
  __svc_stack_top = .;
  . = . + 0x10000; /* 64kB of user stack memory */
  __user_stack_top = .;
  . = . + 0x1000; /* 4kB of irq stack memory */
  __irq_stack_top = .;
  __end = .;

  __user_program = 0x300000; /* define where the user program will be loaded */
}
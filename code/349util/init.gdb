target extended-remote :3333
set remote hardware-watchpoint-limit 4
set remote hardware-breakpoint-limit 6
monitor gdb_breakpoint_override hard
handle SIGINT nostop noprint ignore

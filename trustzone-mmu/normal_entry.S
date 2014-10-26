
.global normal_world
normal_world:
	bl boot_normal
	bl .


# during startup, kernel stack uses user address, now switch it to kernel addr
.global jump_stack	
jump_stack:
	MOV     r0, sp
	ADD     r0, r0, #0x40000000
	MOV     sp, r0
	MOV     pc, lr

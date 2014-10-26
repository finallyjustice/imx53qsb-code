.equ AIPS1_BASE_ADDR,	0x53F00000
.equ AIPS2_BASE_ADDR,	0x63F00000
.equ CCM_BASE_ADDR,		(AIPS1_BASE_ADDR + 0x000D4000)

.equ PLL1_BASE_ADDR,    (AIPS2_BASE_ADDR + 0x00080000)
.equ PLL2_BASE_ADDR,    (AIPS2_BASE_ADDR + 0x00084000)
.equ PLL3_BASE_ADDR,    (AIPS2_BASE_ADDR + 0x00088000)
.equ PLL4_BASE_ADDR,    (AIPS2_BASE_ADDR + 0x0008c000)

.equ ARM_BASE_ADDR,		(AIPS2_BASE_ADDR + 0x000A0000)

.equ DP_OP_400,   ((8 << 4) + ((2 - 1)  << 0))
.equ DP_MFD_400,  (3 - 1)
.equ DP_MFN_400,  1

.equ DP_OP_455,   ((9 << 4) + ((2 - 1)  << 0))
.equ DP_MFD_455,  (48 - 1)
.equ DP_MFN_455,  23

.equ DP_OP_216,   ((6 << 4) + ((3 - 1)  << 0))
.equ DP_MFD_216,  (4 - 1)
.equ DP_MFN_216,  3

.equ DP_OP_800,   ((8 << 4) + ((1 - 1)  << 0))
.equ DP_MFD_800,  (3 - 1)
.equ DP_MFN_800,  1

.equ CLKCTL_CCMR, 0 /* offsetof(struct clkctl, ccr)   @ */
.equ CLKCTL_CCDR, 4 /* offsetof(struct clkctl, ccdr)  @ */
.equ CLKCTL_CSR, 8 /* offsetof(struct clkctl, csr)    @ */
.equ CLKCTL_CCSR, 12 /* offsetof(struct clkctl, ccsr) @ */
.equ CLKCTL_CACRR, 16 /* offsetof(struct clkctl, cacrr)   @ */
.equ CLKCTL_CBCDR, 20 /* offsetof(struct clkctl, cbcdr)   @ */
.equ CLKCTL_CBCMR, 24 /* offsetof(struct clkctl, cbcmr)   @ */
.equ CLKCTL_CSCMR1, 28 /* offsetof(struct clkctl, cscmr1) @ */
.equ CLKCTL_CSCMR2, 32 /* offsetof(struct clkctl, cscmr2) @ */
.equ CLKCTL_CSCDR1, 36 /* offsetof(struct clkctl, cscdr1) @ */
.equ CLKCTL_CS1CDR, 40 /* offsetof(struct clkctl, cs1cdr) @ */
.equ CLKCTL_CS2CDR, 44 /* offsetof(struct clkctl, cs2cdr) @ */
.equ CLKCTL_CDCDR, 48 /* offsetof(struct clkctl, cdcdr)   @ */
.equ CLKCTL_CHSCCDR, 52 /* offsetof(struct clkctl, chsccdr)   @ */
.equ CLKCTL_CSCDR2, 56 /* offsetof(struct clkctl, cscdr2) @ */
.equ CLKCTL_CSCDR3, 60 /* offsetof(struct clkctl, cscdr3) @ */
.equ CLKCTL_CSCDR4, 64 /* offsetof(struct clkctl, cscdr4) @ */
.equ CLKCTL_CWDR, 68 /* offsetof(struct clkctl, cwdr) @ */
.equ CLKCTL_CDHIPR, 72 /* offsetof(struct clkctl, cdhipr) @ */
.equ CLKCTL_CDCR, 76 /* offsetof(struct clkctl, cdcr) @ */
.equ CLKCTL_CTOR, 80 /* offsetof(struct clkctl, ctor) @ */
.equ CLKCTL_CLPCR, 84 /* offsetof(struct clkctl, clpcr)   @ */
.equ CLKCTL_CISR, 88 /* offsetof(struct clkctl, cisr) @ */
.equ CLKCTL_CIMR, 92 /* offsetof(struct clkctl, cimr) @ */
.equ CLKCTL_CCOSR, 96 /* offsetof(struct clkctl, ccosr)   @ */
.equ CLKCTL_CGPR, 100 /* offsetof(struct clkctl, cgpr)    @ */
.equ CLKCTL_CCGR0, 104 /* offsetof(struct clkctl, ccgr0)  @ */
.equ CLKCTL_CCGR1, 108 /* offsetof(struct clkctl, ccgr1)  @ */
.equ CLKCTL_CCGR2, 112 /* offsetof(struct clkctl, ccgr2)  @ */
.equ CLKCTL_CCGR3, 116 /* offsetof(struct clkctl, ccgr3)  @ */
.equ CLKCTL_CCGR4, 120 /* offsetof(struct clkctl, ccgr4)  @ */
.equ CLKCTL_CCGR5, 124 /* offsetof(struct clkctl, ccgr5)  @ */
.equ CLKCTL_CCGR6, 128 /* offsetof(struct clkctl, ccgr6)  @ */
.equ CLKCTL_CMEOR, 136 /* offsetof(struct clkctl, cmeor)  @ */
.equ CLKCTL_CCGR7, 132 /* offsetof(struct clkctl, ccgr7)  @ */
.equ PLL_DP_CTL, 0 /* offsetof(struct dpll, dp_ctl)   @ */
.equ PLL_DP_CONFIG, 4 /* offsetof(struct dpll, dp_config) @ */
.equ PLL_DP_OP, 8 /* offsetof(struct dpll, dp_op) @ */
.equ PLL_DP_MFD, 12 /* offsetof(struct dpll, dp_mfd)  @ */
.equ PLL_DP_MFN, 16 /* offsetof(struct dpll, dp_mfn)  @ */
.equ PLL_DP_HFS_OP, 28 /* offsetof(struct dpll, dp_hfs_op)    @ */
.equ PLL_DP_HFS_MFD, 32 /* offsetof(struct dpll, dp_hfs_mfd)  @ */
.equ PLL_DP_HFS_MFN, 36 /* offsetof(struct dpll, dp_hfs_mfn)  @ */

.equ W_DP_OP,     0
.equ W_DP_MFD,    4
.equ W_DP_MFN,    8

/* last 5 bit of Program Status Register (PSR) */
.equ Mode_USR, 0x10 @ User Mode
.equ Mode_FIQ, 0x11 @ Fast Interrupt Mode
.equ Mode_IRQ, 0x12 @ Interrupt Mode
.equ Mode_SVC, 0x13 @ Supervisor Mode
.equ Mode_ABT, 0x17 @ Abort Mode
.equ Mode_UND, 0x1B @ Undefined Mode
.equ Mode_SYS, 0x1F @ System Mode
.equ Mode_MON, 0x16 @ Monitor Mode

/* 6th and 7th bit of Program Status Register (PSR) */
.equ I_Bit,    0x80 @ IRQ interrupts disabled 
.equ F_Bit,    0x40 @ FIQ interrupts disabled

.equ NS_BIT,   0x1

/* memory reserved (in bytes) for stacks of different mode */
.equ Len_FIQ_Stack,  64
.equ Len_IRQ_Stack,  64
.equ Len_ABT_Stack,  64
.equ Len_UND_Stack,  64
.equ Len_SVC_Stack,  512
.equ Len_USR_Stack,  512

.equ Offset_FIQ_Stack, 0
.equ Offset_IRQ_Stack, Offset_FIQ_Stack + Len_FIQ_Stack
.equ Offset_ABT_Stack, Offset_IRQ_Stack + Len_IRQ_Stack
.equ Offset_UND_Stack, Offset_ABT_Stack + Len_ABT_Stack
.equ Offset_SVC_Stack, Offset_UND_Stack + Len_UND_Stack
.equ Offset_USR_Stack, Offset_SVC_Stack + Len_SVC_Stack

.code 32

# entry of the bare metal program
.globl _start
_start:
	b reset
	ldr pc, UndefAddr    
	ldr pc, SWIAddr      
	ldr pc, PAbortAddr
	ldr pc, DAbortAddr  
	ldr pc, ReservedAddr 
	ldr pc, IRQAddr 
	ldr pc, FIQAddr

UndefAddr:		.word UndefHandler
SWIAddr:        .word SWIHandler
PAbortAddr:     .word PAbortHandler
DAbortAddr:     .word DAbortHandler
ReservedAddr:   .word 0
IRQAddr:        .word IRQHandler
FIQAddr:        .word FIQHandler	

# reset handler
.global reset
.align 4
reset:
	bl lowlevel_init	
	ldr sp, =svc_stktop  @works even disabled

	ldr r0, =svc_stktop

	cps #Mode_MON
	ldr sp, =svc_stktop

	msr cpsr_c, #Mode_FIQ | I_Bit | F_Bit /* Disable interrupts*/
	sub sp, r0, #Offset_FIQ_Stack
 
	msr cpsr_c, #Mode_IRQ | I_Bit | F_Bit /* Disable interrupts */
	sub     sp, r0, #Offset_IRQ_Stack
	 
	msr cpsr_c, #Mode_ABT | I_Bit | F_Bit /* Disable interrupts */
	sub sp, r0, #Offset_ABT_Stack
	
	msr cpsr_c, #Mode_UND | I_Bit | F_Bit  
	sub sp, r0, #Offset_UND_Stack   
	
	msr cpsr_c, #Mode_SVC | I_Bit | F_Bit /* Disable interrupts */
	sub sp, r0, #Offset_SVC_Stack	

	bl bootmain
	b .

.global monitor
.align 5
monitor:
	@ Monitor
	nop @ Reset		 - not used by Monitor
	nop @ Undef      - not used by Monitor
	b   smc_handler
	nop @ Prefetch   - can by used by Monitor
	nop @ Data abort - can by used by Monitor
	nop @ RESERVED
	nop @ IRQ        - can by used by Monitor
	nop @ FIQ        - can by used by Monitor

/* 
 * SMC Handler
 *
 * - Detect which world executed SMC
 * - Saves state to appropriate stack
 * - Restores other worlds state
 * - Switches world
 * - Performs exception return
 */

.global smc_handler
smc_handler:
	push {r0-r3}							@ R0-r3 contain args to be passed between worlds
											@ Temporarily stack, so can be used as scratch regs

	@ Which world have we come from
	@ ------------------------------
	mrc p15, 0, r0, c1, c1, 0				@ Read Secure Configuration Register data
	tst r0, #NS_BIT							@ Is the NS bit set?
	eor r0, r0, #NS_BIT						@ Toggle NS bit
	mcr p15, 0, r0, c1, c1, 0				@ Write Secure Configuration Register data

	@ Load save to pointer
	@ ---------------------
	ldreq  r0, =S_STACK_SP					@ If NS bit set, was in Normal world.  So restore Secure state
	ldrne  r0, =NS_STACK_SP
	ldr    r2, [r0]

	@ Load restore from pointer
	@ --------------------------
	ldreq  r1, =NS_STACK_SP
	ldrne  r1, =S_STACK_SP
	ldr    r3, [r1]

	@ r2  <-- save to
	@ r3  <-- restore from
 
	@ Save general purpose registers, SPSR and LR
	@ --------------------------------------------
	stmfd   r2!, {r4-r12}					@ Save r4 to r12
	@ ADD SUPPORT FOR SPs
	mrs     r4, spsr						@ Also get a copy of the SPSR
	stmfd   r2!, {r4, lr}					@ Save original SPSR and LR
	
	str     r2, [r0]						@ Save updated pointer back, r0 and r2 now free
	
	@ Restore other world registers, SPSR and LR
	@ ---------------------------------------------
	ldmfd   r3!, {r0, lr}					@ Get SPSR and LR from
	@ ADD SUPPORT FOR SPs
	msr     spsr_cxsf, r0					@ Restore SPSR
	ldmfd   r3!, {r4-r12}					@ Restore registers r4 to r12

	str r3, [r1]							@ Save updated pointer back, r1 and r3 now free
	
	@ Clear local monitor
	@ --------------------
	clrex									@ Not strictly required in this example, as not using LDR EX/STREX
											@ However, architecturally should execute CLREX on a context switch

	@ Now restore args (r0-r3)
	@ -------------------------
	pop {r0-r3}
	
	
	@ Perform exception return
	@ -------------------------
	movs pc, lr

/*
 * Monitor Initialization
 *
 * This is called the first time the Secure world wishes to
 * transit to the Normal world.
 */

.global init_secure_monitor
init_secure_monitor:
	@ Install Secure Monitor
	@ -----------------------
	ldr r1, =ns_image					@ R1 is used
	str r0, [r1]
	ldr r0, =monitor					@ Get address of Monitors vector table
	mcr p15, 0, r0, c12, c0, 1			@ Write Monitor Vector Base Address Register

	@ Save Secure state
	@ ------------------
	ldr    r0, =S_STACK_LIMIT			@ Get address of Secure state stack
	stmfd  r0!, {r4-r12}				@ Save general purpose registers
	@ ADD support for SPs
	mrs    r1, cpsr						@ Also get a copy of the CPSR
	stmfd  r0!, {r1, lr}				@ Save CPSR and LR

	@ Switch to Monitor mode
	@ -----------------------
	cps    #Mode_MON					@ Move to Monitor mode after saving Secure state

	@ Save Secure state stack pointer
	@ --------------------------------
	ldr r1, =S_STACK_SP					@ Get address of global
	str r0, [r1]						@ Save pointer


	@ Set up initial NS state stack pointer
	@ --------------------------------------
	ldr r0, =NS_STACK_SP				@ Get address of global
	ldr r1, =NS_STACK_LIMIT				@ Get top of Normal state stack (assuming FD model)
	str r1, [r0]						@ Save pointer


	@ Set up exception return information
	@ ------------------------------------
	@IMPORT  ns_image
	 
	ldr lr, ns_image					@ ns_image
	msr spsr_cxsf, #Mode_SVC			@ Set SPSR to be SVC mode

	@ Switch to Normal world
	@ -----------------------
	mrc p15, 0, r4, c1, c1, 0			@ Read Secure Configuration Register data
	orr r4, #NS_BIT						@ Set NS bit
	mcr p15, 0, r4, c1, c1, 0			@ Write Secure Configuration Register data
	 
	 
	@ Clear general purpose registers
	@ --------------------------------
	mov r0,  #0
	mov r1,  #0
	mov r2,  #0
	mov r3,  #0
	mov r4,  #0
	mov r5,  #0
	mov r6,  #0
	mov r7,  #0
	mov r8,  #0
	mov r9,  #0
	mov r10, #0
	mov r11, #0
	mov r12, #0
 
	movs pc, lr

.macro setup_pll pll, freq
		ldr r0, =\pll
		adr r2, W_DP_\freq
		bl setup_pll_func
.endm

.global lowlevel_init
.align 4
lowlevel_init:
	mov r10, lr
	ldr r0, =CCM_BASE_ADDR

	/* Gate of clocks to the peripherals first */
	ldr r1, =0x3FFFFFFF
	str r1, [r0, #CLKCTL_CCGR0]
	str r4, [r0, #CLKCTL_CCGR1]
	str r4, [r0, #CLKCTL_CCGR2]
	str r4, [r0, #CLKCTL_CCGR3]
	str r4, [r0, #CLKCTL_CCGR7]
	ldr r1, =0x00030000
	str r1, [r0, #CLKCTL_CCGR4]
	ldr r1, =0x00FFF030
	str r1, [r0, #CLKCTL_CCGR5]
	ldr r1, =0x0F00030F
	str r1, [r0, #CLKCTL_CCGR6]

	/* Switch ARM to step clock */
	mov r1, #0x4
	str r1, [r0, #CLKCTL_CCSR]

	setup_pll PLL1_BASE_ADDR, 800

	setup_pll PLL3_BASE_ADDR, 400	

	/* Switch peripheral to PLL3 */
	ldr r0, =CCM_BASE_ADDR
	ldr r1, =0x00015154
	str r1, [r0, #CLKCTL_CBCMR]
	ldr r1, =0x02898945
	str r1, [r0, #CLKCTL_CBCDR]
	/* make sure change is effective */
1:      ldr r1, [r0, #CLKCTL_CDHIPR]
		cmp r1, #0x0
		bne 1b

	setup_pll PLL2_BASE_ADDR, 400

	
	/* Switch peripheral to PLL2 */
	ldr r0, =CCM_BASE_ADDR
	ldr r1, =0x00888945
	str r1, [r0, #CLKCTL_CBCDR]

	ldr r1, =0x00016154
	str r1, [r0, #CLKCTL_CBCMR]

	/*change uart clk parent to pll2*/
	ldr r1, [r0, #CLKCTL_CSCMR1]
	and r1, r1, #0xfcffffff
	orr r1, r1, #0x01000000
	str r1, [r0, #CLKCTL_CSCMR1]

	/* make sure change is effective */
1:      ldr r1, [r0, #CLKCTL_CDHIPR]
		cmp r1, #0x0
		bne 1b

	setup_pll PLL3_BASE_ADDR, 216

	setup_pll PLL4_BASE_ADDR, 455

	/* Set the platform clock dividers */
	ldr r0, =ARM_BASE_ADDR
	ldr r1, =0x00000124
	str r1, [r0, #0x14]

	ldr r0, =CCM_BASE_ADDR
	mov r1, #0
	str r1, [r0, #CLKCTL_CACRR]

	/* Switch ARM back to PLL 1. */
	mov r1, #0x0
	str r1, [r0, #CLKCTL_CCSR]
	
	/* make uart div=6 */
	ldr r1, [r0, #CLKCTL_CSCDR1]
	and r1, r1, #0xffffffc0
	orr r1, r1, #0x0a
	str r1, [r0, #CLKCTL_CSCDR1]

	/* Restore the default values in the Gate registers */
	ldr r1, =0xFFFFFFFF
	str r1, [r0, #CLKCTL_CCGR0]
	str r1, [r0, #CLKCTL_CCGR1]
	str r1, [r0, #CLKCTL_CCGR2]
	str r1, [r0, #CLKCTL_CCGR3]
	str r1, [r0, #CLKCTL_CCGR4]
	str r1, [r0, #CLKCTL_CCGR5]
	str r1, [r0, #CLKCTL_CCGR6]
	str r1, [r0, #CLKCTL_CCGR7]

	mov r1, #0x00000
	str r1, [r0, #CLKCTL_CCDR]

	/* for cko - for ARM div by 8 */
	mov r1, #0x000A0000
	add r1, r1, #0x00000F0
	str r1, [r0, #CLKCTL_CCOSR]
	
	mov pc, r10

setup_pll_func:
	ldr r1, =0x00001232
	str r1, [r0, #PLL_DP_CTL] /* Set DPLL ON (set UPEN bit): BRMO=1 */
	mov r1, #0x2
	str r1, [r0, #PLL_DP_CONFIG] /* Enable auto-restart AREN bit */

	ldr r1, [r2, #W_DP_OP]
	str r1, [r0, #PLL_DP_OP]
	str r1, [r0, #PLL_DP_HFS_OP]

	ldr r1, [r2, #W_DP_MFD]
	str r1, [r0, #PLL_DP_MFD]
	str r1, [r0, #PLL_DP_HFS_MFD]

	ldr r1, [r2, #W_DP_MFN]
	str r1, [r0, #PLL_DP_MFN]
	str r1, [r0, #PLL_DP_HFS_MFN]

	ldr r1, =0x00001232
	str r1, [r0, #PLL_DP_CTL]
	1:  ldr r1, [r0, #PLL_DP_CTL]
		ands r1, r1, #0x1
		beq 1b

	/* r10 saved upper lr */
	mov pc, lr

W_DP_216:       .word DP_OP_216
				.word DP_MFD_216
				.word DP_MFN_216
W_DP_400:		.word DP_OP_400
				.word DP_MFD_400
				.word DP_MFN_400
W_DP_455:       .word DP_OP_455
				.word DP_MFD_455
				.word DP_MFN_455
W_DP_800:       .word DP_OP_800
				.word DP_MFD_800
				.word DP_MFN_800

@ ------------------------------------------------------------
@ Space reserved for secure and non-secure stacks
@ ------------------------------------------------------------
NS_STACK_BASE:
	.word     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
NS_STACK_LIMIT:

S_STACK_BASE:
	.word     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
S_STACK_LIMIT:

NS_STACK_SP:
	.word     0
	
S_STACK_SP:
	.word     0

ns_image :
	.word     0

@.end
@ ------------------------------------------------------------
@ End
@ ------------------------------------------------------------

UndefHandler:
	b UndefHandler 
	
SWIHandler:
	b SWIHandler
 
PAbortHandler:
	b PAbortHandler

DAbortHandler:
	b DAbortHandler

IRQHandler:
	b IRQHandler

FIQHandler:
	b FIQHandler

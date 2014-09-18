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

# entry of the bare metal program
.globl _start
_start:
	b reset
	b .
	b .
	b .
	b .
	b .
	b .
	b .

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

# reset handler
.global reset
.align 4
reset:
	bl lowlevel_init	
	ldr sp, =(0xf801ff20)  @works even disabled
	bl bootmain
	b .

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

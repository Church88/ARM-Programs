	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"locksmith2.cc"
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"clear\000"
	.text
	.align	2
	.global	_Z6launchv
	.type	_Z6launchv, %function
_Z6launchv:
	.fnstart
.LFB970:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	ldr	r0, .L2
	bl	system
	mov	r0, #4
	bl	exit
.L3:
	.align	2
.L2:
	.word	.LC0
	.fnend
	.size	_Z6launchv, .-_Z6launchv
	.section	.text._Z3diev,"axG",%progbits,_Z3diev,comdat
	.align	2
	.weak	_Z3diev
	.type	_Z3diev, %function
_Z3diev:
	.fnstart
.LFB971:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #16
	sub	sp, sp, #16
	bl	rand
	mov	r2, r0
	mov	r3, r2, asr #31
	mov	r3, r3, lsr #31
	add	r2, r2, r3
	and	r2, r2, #1
	rsb	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L5
	bl	rand
	mov	r2, r0
	mov	r3, r2, asr #31
	mov	r3, r3, lsr #31
	add	r2, r2, r3
	and	r2, r2, #1
	rsb	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L6
	mov	r0, #1
	bl	exit
.L6:
	mov	r0, #2
	bl	exit
.L5:
	bl	rand
	mov	r2, r0
	mov	r3, r2, asr #31
	mov	r3, r3, lsr #31
	add	r2, r2, r3
	and	r2, r2, #1
	rsb	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L7
	mov	r0, #3
	bl	exit
.L7:
	bl	_Z6launchv
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.fnend
	.size	_Z3diev, .-_Z3diev
	.section	.rodata
	.align	2
.LC1:
	.ascii	"echo \000"
	.align	2
.LC2:
	.ascii	"\"Jrypbzr gb gur tnzr!\"\000"
	.align	2
.LC3:
	.ascii	"| cryptomatic9000\000"
	.align	2
.LC4:
	.ascii	"Reports have it that our last copyright protection "
	.ascii	"scheme has been broken.\012\000"
	.align	2
.LC5:
	.ascii	"WARNING: Editing this file may be in violation of F"
	.ascii	"ederal Law!\012\000"
	.align	2
.LC6:
	.ascii	"Welcome to CopyMAX LockSmith 2000(tm). The greatest"
	.ascii	" copy protection ever made! (On this server.)\012\000"
	.align	2
.LC7:
	.ascii	"Please enter the two numbers found on page \000"
	.align	2
.LC8:
	.ascii	" of your game manual.\012\000"
	.align	2
.LC9:
	.ascii	"The answer must be a pair of numbers!\012\000"
	.align	2
.LC10:
	.ascii	"No, the password is not \000"
	.align	2
.LC11:
	.ascii	".\012\000"
	.align	2
.LC12:
	.ascii	"Sheesh.\012\000"
	.align	2
.LC13:
	.ascii	"Password incorrect!\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	.fnstart
.LFB972:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #56
	sub	sp, sp, #56
	mov	r0, #0
	bl	time
	mov	r3, r0
	mov	r0, r3
	bl	srand
	sub	r3, fp, #32
	mov	r0, r3
	bl	_ZNSaIcEC1Ev
	sub	r2, fp, #36
	sub	r3, fp, #32
	mov	r0, r2
	ldr	r1, .L30
	mov	r2, r3
.LEHB0:
	bl	_ZNSsC1EPKcRKSaIcE
.LEHE0:
	sub	r3, fp, #32
	mov	r0, r3
	bl	_ZNSaIcED1Ev
	sub	r3, fp, #28
	mov	r0, r3
	bl	_ZNSaIcEC1Ev
	sub	r2, fp, #40
	sub	r3, fp, #28
	mov	r0, r2
	ldr	r1, .L30+4
	mov	r2, r3
.LEHB1:
	bl	_ZNSsC1EPKcRKSaIcE
.LEHE1:
	sub	r3, fp, #28
	mov	r0, r3
	bl	_ZNSaIcED1Ev
	sub	r3, fp, #24
	mov	r0, r3
	bl	_ZNSaIcEC1Ev
	sub	r2, fp, #44
	sub	r3, fp, #24
	mov	r0, r2
	ldr	r1, .L30+8
	mov	r2, r3
.LEHB2:
	bl	_ZNSsC1EPKcRKSaIcE
.LEHE2:
	sub	r3, fp, #24
	mov	r0, r3
	bl	_ZNSaIcED1Ev
	bl	rand
	mov	r2, r0
	ldr	r3, .L30+12
	smull	r1, r3, r3, r2
	mov	r1, r3, asr #5
	mov	r3, r2, asr #31
	rsb	r3, r3, r1
	mov	r1, #100
	mul	r3, r1, r3
	rsb	r3, r3, r2
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L9
	ldr	r0, .L30+16
	ldr	r1, .L30+20
.LEHB3:
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	r0, .L30+16
	ldr	r1, .L30+24
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
.L9:
	ldr	r0, .L30+16
	ldr	r1, .L30+28
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	r0, .L30+16
	ldr	r1, .L30+32
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	r3, r0
	mov	r0, r3
	ldr	r1, [fp, #-8]
	bl	_ZNSolsEi
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L30+36
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	sub	r3, fp, #48
	ldr	r0, .L30+40
	mov	r1, r3
	bl	_ZNSirsERi
	mov	r3, r0
	mov	r2, r3
	sub	r3, fp, #52
	mov	r0, r2
	mov	r1, r3
	bl	_ZNSirsERi
	ldr	r0, .L30+44
	bl	_ZNKSt9basic_iosIcSt11char_traitsIcEEntEv
	mov	r3, r0
	cmp	r3, #0
	beq	.L10
	ldr	r0, .L30+16
	ldr	r1, .L30+48
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	bl	_Z3diev
.L10:
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #1
	cmp	r3, #84
	beq	.L11
	ldr	r3, [fp, #-52]
	mov	r3, r3, asl #2
	cmp	r3, #168
	bne	.L12
.L11:
	ldr	r0, .L30+16
	ldr	r1, .L30+52
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	r3, r0
	mov	r0, r3
	mov	r1, #42
	bl	_ZNSolsEi
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L30+56
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	r0, .L30+16
	ldr	r1, .L30+60
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	bl	_Z3diev
.L12:
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-48]
	rsb	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-12]
	mov	r3, r2, asl r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bal	.L13
	ldr	r0, .L30+16
	ldr	r1, .L30+64
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	bl	_Z3diev
.L13:
	sub	r1, fp, #20
	sub	r2, fp, #36
	sub	r3, fp, #40
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	_ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_ERKS6_S8_
.LEHE3:
	sub	r1, fp, #56
	sub	r2, fp, #20
	sub	r3, fp, #44
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
.LEHB4:
	bl	_ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_ERKS6_S8_
.LEHE4:
	sub	r3, fp, #20
	mov	r0, r3
.LEHB5:
	bl	_ZNSsD1Ev
	sub	r3, fp, #56
	mov	r0, r3
	bl	_ZNKSs5c_strEv
	mov	r3, r0
	mov	r0, r3
	bl	system
.LEHE5:
	sub	r3, fp, #56
	mov	r0, r3
.LEHB6:
	bl	_ZNSsD1Ev
.LEHE6:
	sub	r3, fp, #44
	mov	r0, r3
.LEHB7:
	bl	_ZNSsD1Ev
.LEHE7:
	sub	r3, fp, #40
	mov	r0, r3
.LEHB8:
	bl	_ZNSsD1Ev
.LEHE8:
	sub	r3, fp, #36
	mov	r0, r3
.LEHB9:
	bl	_ZNSsD1Ev
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L22:
	sub	r3, fp, #32
	mov	r0, r3
	bl	_ZNSaIcED1Ev
	bl	__cxa_end_cleanup
.LEHE9:
.L23:
	sub	r3, fp, #28
	mov	r0, r3
	bl	_ZNSaIcED1Ev
	b	.L16
.L25:
	sub	r3, fp, #24
	mov	r0, r3
	bl	_ZNSaIcED1Ev
	b	.L18
.L28:
	sub	r3, fp, #20
	mov	r0, r3
	bl	_ZNSsD1Ev
	b	.L20
.L29:
	sub	r3, fp, #56
	mov	r0, r3
	bl	_ZNSsD1Ev
	b	.L20
.L27:
.L20:
	sub	r3, fp, #44
	mov	r0, r3
	bl	_ZNSsD1Ev
	b	.L18
.L26:
.L18:
	sub	r3, fp, #40
	mov	r0, r3
	bl	_ZNSsD1Ev
	b	.L16
.L24:
.L16:
	sub	r3, fp, #36
	mov	r0, r3
	bl	_ZNSsD1Ev
.LEHB10:
	bl	__cxa_end_cleanup
.LEHE10:
.L31:
	.align	2
.L30:
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	1374389535
	.word	_ZSt4cout
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	_ZSt3cin
	.word	_ZSt3cin+8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.global	__gxx_personality_v0
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA972:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE972-.LLSDACSB972
.LLSDACSB972:
	.uleb128 .LEHB0-.LFB972
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L22-.LFB972
	.uleb128 0
	.uleb128 .LEHB1-.LFB972
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L23-.LFB972
	.uleb128 0
	.uleb128 .LEHB2-.LFB972
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L25-.LFB972
	.uleb128 0
	.uleb128 .LEHB3-.LFB972
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L27-.LFB972
	.uleb128 0
	.uleb128 .LEHB4-.LFB972
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L28-.LFB972
	.uleb128 0
	.uleb128 .LEHB5-.LFB972
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L29-.LFB972
	.uleb128 0
	.uleb128 .LEHB6-.LFB972
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L27-.LFB972
	.uleb128 0
	.uleb128 .LEHB7-.LFB972
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L26-.LFB972
	.uleb128 0
	.uleb128 .LEHB8-.LFB972
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L24-.LFB972
	.uleb128 0
	.uleb128 .LEHB9-.LFB972
	.uleb128 .LEHE9-.LEHB9
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB10-.LFB972
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
.LLSDACSE972:
	.text
	.fnend
	.size	main, .-main
	.section	.text._ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_ERKS6_S8_,"axG",%progbits,_ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_ERKS6_S8_,comdat
	.align	2
	.weak	_ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_ERKS6_S8_
	.type	_ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_ERKS6_S8_, %function
_ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_ERKS6_S8_:
	.fnstart
.LFB987:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	.save {fp, lr}
	.setfp fp, sp, #4
	add	fp, sp, #4
	.pad #16
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
.LEHB11:
	bl	_ZNSsC1ERKSs
.LEHE11:
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-16]
.LEHB12:
	bl	_ZNSs6appendERKSs
.LEHE12:
	b	.L35
.L34:
	ldr	r0, [fp, #-8]
	bl	_ZNSsD1Ev
.LEHB13:
	bl	__cxa_end_cleanup
.LEHE13:
.L35:
	ldr	r0, [fp, #-8]
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA987:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE987-.LLSDACSB987
.LLSDACSB987:
	.uleb128 .LEHB11-.LFB987
	.uleb128 .LEHE11-.LEHB11
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB12-.LFB987
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L34-.LFB987
	.uleb128 0
	.uleb128 .LEHB13-.LFB987
	.uleb128 .LEHE13-.LEHB13
	.uleb128 0
	.uleb128 0
.LLSDACSE987:
	.section	.text._ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_ERKS6_S8_,"axG",%progbits,_ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_ERKS6_S8_,comdat
	.fnend
	.size	_ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_ERKS6_S8_, .-_ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_ERKS6_S8_
	.text
	.align	2
	.type	_Z41__static_initialization_and_destruction_0ii, %function
_Z41__static_initialization_and_destruction_0ii:
	.fnstart
.LFB1009:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	bne .L36
	ldr	r2, [fp, #-12]
	ldr	r3, .L38
	cmp	r2, r3
	bne	.L36
	ldr	r0, .L38+4
	bl	_ZNSt8ios_base4InitC1Ev
	ldr	r3, .L38+8
	ldr	r0, .L38+4
	mov	r1, r3
	ldr	r2, .L38+12
	bl	__aeabi_atexit
.L36:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L39:
	.align	2
.L38:
	.word	65535
	.word	_ZStL8__ioinit
	.word	_ZNSt8ios_base4InitD1Ev
	.word	__dso_handle
	.cantunwind
	.fnend
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.align	2
	.type	_GLOBAL__sub_I__Z6launchv, %function
_GLOBAL__sub_I__Z6launchv:
	.fnstart
.LFB1010:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	mov	r0, #1
	ldr	r1, .L41
	bl	_Z41__static_initialization_and_destruction_0ii
	ldmfd	sp!, {fp, pc}
.L42:
	.align	2
.L41:
	.word	65535
	.cantunwind
	.fnend
	.size	_GLOBAL__sub_I__Z6launchv, .-_GLOBAL__sub_I__Z6launchv
	.section	.init_array,"aw",%init_array
	.align	2
	.word	_GLOBAL__sub_I__Z6launchv(target1)
	.section	.rodata
	.align	2
	.type	_ZZL18__gthread_active_pvE20__gthread_active_ptr, %object
	.size	_ZZL18__gthread_active_pvE20__gthread_active_ptr, 4
_ZZL18__gthread_active_pvE20__gthread_active_ptr:
	.word	_ZL22__gthrw_pthread_cancelm
	.weakref	_ZL20__gthrw_pthread_oncePiPFvvE,pthread_once
	.weakref	_ZL27__gthrw_pthread_getspecificj,pthread_getspecific
	.weakref	_ZL27__gthrw_pthread_setspecificjPKv,pthread_setspecific
	.weakref	_ZL22__gthrw_pthread_createPmPK14pthread_attr_tPFPvS3_ES3_,pthread_create
	.weakref	_ZL20__gthrw_pthread_joinmPPv,pthread_join
	.weakref	_ZL21__gthrw_pthread_equalmm,pthread_equal
	.weakref	_ZL20__gthrw_pthread_selfv,pthread_self
	.weakref	_ZL22__gthrw_pthread_detachm,pthread_detach
	.weakref	_ZL22__gthrw_pthread_cancelm,pthread_cancel
	.weakref	_ZL19__gthrw_sched_yieldv,sched_yield
	.weakref	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t,pthread_mutex_lock
	.weakref	_ZL29__gthrw_pthread_mutex_trylockP15pthread_mutex_t,pthread_mutex_trylock
	.weakref	_ZL31__gthrw_pthread_mutex_timedlockP15pthread_mutex_tPK8timespec,pthread_mutex_timedlock
	.weakref	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t,pthread_mutex_unlock
	.weakref	_ZL26__gthrw_pthread_mutex_initP15pthread_mutex_tPK19pthread_mutexattr_t,pthread_mutex_init
	.weakref	_ZL29__gthrw_pthread_mutex_destroyP15pthread_mutex_t,pthread_mutex_destroy
	.weakref	_ZL30__gthrw_pthread_cond_broadcastP14pthread_cond_t,pthread_cond_broadcast
	.weakref	_ZL27__gthrw_pthread_cond_signalP14pthread_cond_t,pthread_cond_signal
	.weakref	_ZL25__gthrw_pthread_cond_waitP14pthread_cond_tP15pthread_mutex_t,pthread_cond_wait
	.weakref	_ZL30__gthrw_pthread_cond_timedwaitP14pthread_cond_tP15pthread_mutex_tPK8timespec,pthread_cond_timedwait
	.weakref	_ZL28__gthrw_pthread_cond_destroyP14pthread_cond_t,pthread_cond_destroy
	.weakref	_ZL26__gthrw_pthread_key_createPjPFvPvE,pthread_key_create
	.weakref	_ZL26__gthrw_pthread_key_deletej,pthread_key_delete
	.weakref	_ZL30__gthrw_pthread_mutexattr_initP19pthread_mutexattr_t,pthread_mutexattr_init
	.weakref	_ZL33__gthrw_pthread_mutexattr_settypeP19pthread_mutexattr_ti,pthread_mutexattr_settype
	.weakref	_ZL33__gthrw_pthread_mutexattr_destroyP19pthread_mutexattr_t,pthread_mutexattr_destroy
	.ident	"GCC: (Debian 4.6.3-14+rpi1) 4.6.3"
	.section	.note.GNU-stack,"",%progbits

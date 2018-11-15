From: jarkko.sakkinen@linux.intel.com (Jarkko Sakkinen)
Date: Thu, 15 Nov 2018 22:37:44 +0200
Subject: [PATCH RFC] selftests/x86: Add a selftest for SGX
In-Reply-To: <20181114160941.GA1387@linux.intel.com>
References: <20181113214038.16136-1-jarkko.sakkinen@linux.intel.com>
 <20181114160941.GA1387@linux.intel.com>
Message-ID: <20181115203744.GD26875@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181115203744.2UorK2toWkhFlgp7_cHeVzeB5a4FTmL0ylVMDzV69Zg@z>

On Wed, Nov 14, 2018@08:09:42AM -0800, Sean Christopherson wrote:
> On Tue, Nov 13, 2018@11:40:09PM +0200, Jarkko Sakkinen wrote:
> > Add a selftest for SGX. It is a trivial test where a simple enclave
> > copies one 64-bit word of memory between two memory locations given to
> > the enclave as arguments.
> > 
> > Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen at linux.intel.com>
> > ---
> > +SUBDIRS_64 := sgx
> > +ASSERT(!DEFINED(.altinstructions), "ALTERNATIVES are not supported in the SGX LE")
> > +ASSERT(!DEFINED(.altinstr_replacement), "ALTERNATIVES are not supported in the SGX LE")
> > +ASSERT(!DEFINED(.discard.retpoline_safe), "RETPOLINE ALTERNATIVES are not supported in the SGX LE")
> > +ASSERT(!DEFINED(.discard.nospec), "RETPOLINE ALTERNATIVES are not supported in the SGX LE")
> 
> Maybe this?
> 
> s/LE/Test Enclave

Sure.

> > diff --git a/tools/testing/selftests/x86/sgx/encl_bootstrap.S b/tools/testing/selftests/x86/sgx/encl_bootstrap.S
> > new file mode 100644
> > index 000000000000..62251c7d9927
> > --- /dev/null
> > +++ b/tools/testing/selftests/x86/sgx/encl_bootstrap.S
> > @@ -0,0 +1,94 @@
> > +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> > +/*
> > + * Copyright(c) 2016-18 Intel Corporation.
> > + */
> > +
> > +	.macro ENCLU
> > +	.byte 0x0f, 0x01, 0xd7
> > +	.endm
> > +
> > +	.section ".tcs", "a"
> > +	.balign	4096
> > +
> > +	.fill	1, 8, 0			# STATE (set by CPU)
> > +	.fill	1, 8, 0			# FLAGS
> > +	.long	encl_ssa		# OSSA
> 
> Any reason not to do .quad for OSSA and OENTRY?

Probably not.

> > +	.fill	1, 4, 0
> > +	.fill	1, 4, 0			# CSSA (set by CPU)
> > +	.fill	1, 4, 1			# NSSA
> > +	.long	encl_entry		# OENTRY
> > +	.fill	1, 4, 0
> > +	.fill	1, 8, 0			# AEP (set by EENTER and ERESUME)
> > +	.fill	1, 8, 0			# OFSBASE
> > +	.fill	1, 8, 0			# OGSBASE
> > +	.fill	1, 4, 0xFFFFFFFF 	# FSLIMIT
> > +	.fill	1, 4, 0xFFFFFFFF	# GSLIMIT
> > +	.fill	503, 8, 0		# Reserved
> 
> I'd prefer to do 1-byte fill with a size of 4024 to match the SDM.

Sure.

> > +
> > +	.text
> > +
> > +encl_entry:
> > +	# %rbx contains the base address for TCS, which is also the first
> > +	# address inside the enclave. By adding $le_stack_end to it, we get the
> > +	# absolute address for the stack.
> > +	lea	(encl_stack)(%rbx), %rax
> > +	xchg	%rsp, %rax
> > +	push	%rax
> > +
> > +	push	%rcx # push the address after EENTER
> > +	push	%rbx # push the enclave base address
> > +
> > +	call	encl_body
> > +
> > +	pop	%rbx # pop the enclave base address
> > +
> > +	# Restore XSAVE registers to a synthetic state.
> > +	mov     $0xFFFFFFFF, %rax
> > +	mov     $0xFFFFFFFF, %rdx
> > +	lea	(xsave_area)(%rbx), %rdi
> > +	fxrstor	(%rdi)
> > +
> > +	# Clear GPRs
> > +	xor     %rcx, %rcx
> > +	xor     %rdx, %rdx
> > +	xor     %rdi, %rdi
> > +	xor     %rsi, %rsi
> > +	xor     %r8, %r8
> > +	xor     %r9, %r9
> > +	xor     %r10, %r10
> > +	xor     %r11, %r11
> > +	xor     %r12, %r12
> > +	xor     %r13, %r13
> > +	xor     %r14, %r14
> > +	xor     %r15, %r15
> > +
> > +	# Reset status flags
> > +	add     %rdx, %rdx # OF = SF = AF = CF = 0; ZF = PF = 1
> > +
> > +	pop	%rbx # pop the address after EENTER
> 
> Probably worth expanding the comment to explain that ENCLU[EEXIT] takes the
> target address via %rbx, i.e. we're "returning" from the EENTER "call".

Thank you for the feedback. I'll do all of these updates.

/Jarkko

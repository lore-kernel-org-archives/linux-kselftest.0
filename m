Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED3C4D6C2A;
	Wed, 30 Sep 2026 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771990; cv=none; b=k5soScqcNtZoSPeRPun8oyF/TZiThis7I9am8HMJBqXQgT6U9v0pwnJ9jqsELQrNdQhBxzu6+k9R7EDKaQ0z9I25kfg9wHljSX8TnB12p6LrHdpN/vbef0hndUnKNQbqTD2PsJ3vih9JAfszv9wiHWiSLeiRtLVZwHk6WUjumxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771990; c=relaxed/simple;
	bh=ggByx/lROyhXZPADhcavdwYctbJcGGnuthpG1zd2q2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axjZOnyNt7uTyznipVPGG8IpO9YSf7Rtj2D/N+IuZgF7libLT6FnqTREWBm6aYbNsqpEj4gt2x0/CbxyqL3Zg0y64gQ4QcB6+YvaguGvqZIciomFDwpYSqNUvGb7yaE3XNFQxXilFrlQrbEvfAug7KOaHPi7hJJLrORukpTu7Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvojMLFI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvojMLFI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7981F000FF;
	Wed, 30 Sep 2026 12:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790771986;
	bh=onTXsWNcK6coYuyKGAiakvl0/9dyJ+KTSwMmtusrWc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GvojMLFI1x1mxP+dnb+2XCi0DOjueoJVJozeAYDBmEeNnCcuGTbo7uQIjdJAN2rsJ
	 l0DmEc1Eyclbt2WgXNNHXYh3xvaCzPXfvfZGeVGbut62jtoW/3qQ6l3InwtWFwvfvf
	 qqYXDn0jTDbjMH6Zrij4yeyVkhBjnGK90SSzcRl3ZdSeb1LloUBIbcNJa/7krdJdZ5
	 uJ4Yj3LaBON0rsfQ2GdSHXOwLje6bS9ajJWEDxS18UUXjDDYD8YPGfJwgDAPxpvm5T
	 xK9Qpo5Hkj7dX/Hv59VMnETuxmvsPdnNQfoerUlKFSoa+ode6F1XZHz3JVNgh2ADDT
	 dAzYCVIpt9nmQ==
Date: Wed, 30 Sep 2026 13:39:41 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 06/11] kselftest/arm64: Factor startup code out of
 fp-stress load programs
Message-ID: <arzjdxKC2Mr-TAnq@gremlin>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-6-31bce995b49b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-6-31bce995b49b@kernel.org>

On Tue, Sep 01, 2026 at 06:06:46PM +0100, Mark Brown wrote:
> The fp-stress load programs all start up with some startup code which
> installs signal handlers and fetches and reports the current PID into
> x20. In order to facilitate running as KVM guests and reduce duplication
> factor this code out into a asm-utils-linux.S, making the per-test entry
> point main() similarly to more normal environments. As the
> irritator_handler varies per test they are left in place.
>
> Since the PID is now reported before main() runs it is printed before
> rather than after the vector length for those programs that report one,
> fp-stress does not parse the output so this has no impact.
>
> Since asm-utils is also used by fp-pidbench that also gets converted to
> the new _start implementation, this will install some signal handlers
> that were not previously there and report a PID which was not previously
> reported but should otherwise have no impact. Since it does not need an

You're adding enable_gcs to fp-pidbench too, maybe worth mentioning as
well?

> irritator none is provided and a weak definition left in
> asm-utils-linux.S, this will end up as 0 which happens to be SIG_DFL
> which is what we would have anyway.

Hm I'm a bit confused by the SIG_DFL thing here? You directly check for 0
if irritator_handler is not available?

>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Aside from commit message nits I've had a good dig through here and it LGTM
so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/arm64/fp/asm-utils-linux.S | 87 ++++++++++++++++++++++
>  tools/testing/selftests/arm64/fp/fp-pidbench.S     |  6 +-
>  tools/testing/selftests/arm64/fp/fpsimd-test.S     | 76 +------------------
>  tools/testing/selftests/arm64/fp/sve-test.S        | 76 +------------------
>  tools/testing/selftests/arm64/fp/za-test.S         | 75 +------------------
>  tools/testing/selftests/arm64/fp/zt-test.S         | 75 +------------------
>  6 files changed, 106 insertions(+), 289 deletions(-)
>
> diff --git a/tools/testing/selftests/arm64/fp/asm-utils-linux.S b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
> index 9cd31dc47709..9519be4d8f1e 100644
> --- a/tools/testing/selftests/arm64/fp/asm-utils-linux.S
> +++ b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
> @@ -92,3 +92,90 @@ function exit_error
>  	svc	#0
>  endfunction
>  .globl	exit_error
> +
> +// Install a signal handler
> +//
> +// w0: signal number
> +// x1: sa_action
> +// w2: sa_flags
> +// Clobbers x0-x6,x8
> +function setsignal
> +	str	x30, [sp, #-((sa_sz + 15) / 16 * 16 + 16)]!
> +
> +	mov	w4, w0
> +	mov	x5, x1
> +	mov	w6, w2
> +
> +	add	x0, sp, #16
> +	mov	x1, #sa_sz
> +	bl	memclr
> +
> +	mov	w0, w4
> +	add	x1, sp, #16
> +	str	w6, [x1, #sa_flags]
> +	str	x5, [x1, #sa_handler]
> +	mov	x2, #0
> +	mov	x3, #sa_mask_sz
> +	mov	x8, #__NR_rt_sigaction
> +	svc	#0
> +
> +	cbz	w0, 1f
> +
> +	puts	"sigaction failure\n"
> +	b	exit_error
> +
> +1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
> +	ret
> +endfunction
> +.globl	setsignal

LGTM, I went through manually and confirmed that this is verbatim what
every other setsignal function was doing.

> +
> +// Programs which want to be interrupted by SIGUSR1 provide an
> +// irritator_handler(), for those that don't the signal is left alone.
> +.weak	irritator_handler
> +
> +// Main program entry point.  Install the signal handlers shared by the
> +// programs, zeroing the signal count in x23 that the handlers maintain,
> +// read and report the PID the programs use for uniqueness in x20, then
> +// run the program specific main().
> +.globl _start
> +function _start
> +	enable_gcs
> +
> +	mov	x23, #0		// signal count
> +
> +	mov	w0, #SIGINT
> +	adr	x1, terminate_handler
> +	mov	w2, #SA_SIGINFO
> +	bl	setsignal
> +
> +	mov	w0, #SIGTERM
> +	adr	x1, terminate_handler
> +	mov	w2, #SA_SIGINFO
> +	bl	setsignal
> +

> +	// Load as a literal, adr can't reference the symbol when the
> +	// program provides no handler and it resolves to 0
> +	ldr	x1, =irritator_handler
> +	cbz	x1, 1f
> +	mov	w0, #SIGUSR1
> +	mov	w2, #SA_SIGINFO
> +	orr	w2, w2, #SA_NODEFER
> +	bl	setsignal

Looking through the code, I confirmed by hand that _start is the same everywhere
except for this block.

Before this was:

	mov	w0, #SIGUSR1
	adr	x1, irritator_handler
	mov	w2, #SA_SIGINFO
	orr	w2, w2, #SA_NODEFER
	bl	setsignal

So the delta is:

-	mov	w0, #SIGUSR1
-	adr	x1, irritator_handler
+	ldr	x1, =irritator_handler
+	cbz	x1, 1f

And also you've marked irritator_handler as .weak, So my understanding is
'adr' loads irritator_handler as a relative offset in x1, but since you
need to check for zero due to .weak, that can't work, hence the ldr, and
the = just puts the absolute address of irritator_handler in x1.

The 'cbz x1, 1f' is compare + branch if zero, and the 1f is 'next 1 label'
i.e. look forward for it, which is just below.

> +
> +1:	mov	w0, #SIGUSR2
> +	adr	x1, tickle_handler
> +	mov	w2, #SA_SIGINFO
> +	orr	w2, w2, #SA_NODEFER
> +	bl	setsignal
> +
> +	// Obtain our PID, to ensure test pattern uniqueness between processes
> +	mov	x8, #__NR_getpid
> +	svc	#0
> +	mov	x20, x0
> +
> +	puts	"PID:\t"
> +	mov	x0, x20
> +	bl	putdecn
> +
> +	b	main

And ack on what you mention in the commit msg, the PID output comes first
but necessary to hoist that up into the linux-specific bits.

And obviously then -> main for the rest of it.

> +endfunction
> diff --git a/tools/testing/selftests/arm64/fp/fp-pidbench.S b/tools/testing/selftests/arm64/fp/fp-pidbench.S
> index 881dfa3b342e..80f45560290d 100644
> --- a/tools/testing/selftests/arm64/fp/fp-pidbench.S
> +++ b/tools/testing/selftests/arm64/fp/fp-pidbench.S
> @@ -28,9 +28,9 @@
>  	puts	"\n"
>  .endm
>
> -// Main program entry point
> -.globl _start
> -function _start
> +// Program specific main function
> +.globl main
> +function main
>  	puts	"Iterations per test: "
>  	mov	x20, #10000
>  	lsl	x20, x20, #12
> diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
> index fcbb3a872490..df040283d076 100644
> --- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
> +++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
> @@ -148,69 +148,11 @@ function irritator_handler
>
>  	ret
>  endfunction
> +.globl	irritator_handler
>
> -// w0: signal number
> -// x1: sa_action
> -// w2: sa_flags
> -// Clobbers x0-x6,x8
> -function setsignal
> -	str	x30, [sp, #-((sa_sz + 15) / 16 * 16 + 16)]!
> -
> -	mov	w4, w0
> -	mov	x5, x1
> -	mov	w6, w2
> -
> -	add	x0, sp, #16
> -	mov	x1, #sa_sz
> -	bl	memclr
> -
> -	mov	w0, w4
> -	add	x1, sp, #16
> -	str	w6, [x1, #sa_flags]
> -	str	x5, [x1, #sa_handler]
> -	mov	x2, #0
> -	mov	x3, #sa_mask_sz
> -	mov	x8, #__NR_rt_sigaction
> -	svc	#0
> -
> -	cbz	w0, 1f
> -
> -	puts	"sigaction failure\n"
> -	b	exit_error
> -
> -1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
> -	ret
> -endfunction
> -
> -// Main program entry point
> -.globl _start
> -function _start
> -	enable_gcs
> -
> -	mov	x23, #0		// signal count
> -
> -	mov	w0, #SIGINT
> -	adr	x1, terminate_handler
> -	mov	w2, #SA_SIGINFO
> -	bl	setsignal
> -
> -	mov	w0, #SIGTERM
> -	adr	x1, terminate_handler
> -	mov	w2, #SA_SIGINFO
> -	bl	setsignal
> -
> -	mov	w0, #SIGUSR1
> -	adr	x1, irritator_handler
> -	mov	w2, #SA_SIGINFO
> -	orr	w2, w2, #SA_NODEFER
> -	bl	setsignal
> -
> -	mov	w0, #SIGUSR2
> -	adr	x1, tickle_handler
> -	mov	w2, #SA_SIGINFO
> -	orr	w2, w2, #SA_NODEFER
> -	bl	setsignal
> -
> +// Program specific main function
> +.globl main
> +function main
>  	// Sanity-check and report the vector length
>
>  	mov	x19, #128
> @@ -231,16 +173,6 @@ function _start
>  	bl	putdec
>  	puts	" bits\n"
>
> -	// Obtain our PID, to ensure test pattern uniqueness between processes
> -
> -	mov	x8, #__NR_getpid
> -	svc	#0
> -	mov	x20, x0
> -
> -	puts	"PID:\t"
> -	mov	x0, x20
> -	bl	putdecn
> -
>  	mov	x22, #0		// generation number, increments per iteration
>  .Ltest_loop:
>
> diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
> index 88c3220caf7c..c7d9514f964e 100644
> --- a/tools/testing/selftests/arm64/fp/sve-test.S
> +++ b/tools/testing/selftests/arm64/fp/sve-test.S
> @@ -316,69 +316,11 @@ function irritator_handler
>
>  	ret
>  endfunction
> +.globl	irritator_handler
>
> -// w0: signal number
> -// x1: sa_action
> -// w2: sa_flags
> -// Clobbers x0-x6,x8
> -function setsignal
> -	str	x30, [sp, #-((sa_sz + 15) / 16 * 16 + 16)]!
> -
> -	mov	w4, w0
> -	mov	x5, x1
> -	mov	w6, w2
> -
> -	add	x0, sp, #16
> -	mov	x1, #sa_sz
> -	bl	memclr
> -
> -	mov	w0, w4
> -	add	x1, sp, #16
> -	str	w6, [x1, #sa_flags]
> -	str	x5, [x1, #sa_handler]
> -	mov	x2, #0
> -	mov	x3, #sa_mask_sz
> -	mov	x8, #__NR_rt_sigaction
> -	svc	#0
> -
> -	cbz	w0, 1f
> -
> -	puts	"sigaction failure\n"
> -	b	exit_error
> -
> -1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
> -	ret
> -endfunction
> -
> -// Main program entry point
> -.globl _start
> -function _start
> -	enable_gcs
> -
> -	mov	x23, #0		// Irritation signal count
> -
> -	mov	w0, #SIGINT
> -	adr	x1, terminate_handler
> -	mov	w2, #SA_SIGINFO
> -	bl	setsignal
> -
> -	mov	w0, #SIGTERM
> -	adr	x1, terminate_handler
> -	mov	w2, #SA_SIGINFO
> -	bl	setsignal
> -
> -	mov	w0, #SIGUSR1
> -	adr	x1, irritator_handler
> -	mov	w2, #SA_SIGINFO
> -	orr	w2, w2, #SA_NODEFER
> -	bl	setsignal
> -
> -	mov	w0, #SIGUSR2
> -	adr	x1, tickle_handler
> -	mov	w2, #SA_SIGINFO
> -	orr	w2, w2, #SA_NODEFER
> -	bl	setsignal
> -
> +// Program specific main function
> +.globl main
> +function main
>  #ifdef SSVE
>  	puts	"Streaming mode "
>  	smstart_sm
> @@ -404,16 +346,6 @@ function _start
>  	bl	putdec
>  	puts	" bits\n"
>
> -	// Obtain our PID, to ensure test pattern uniqueness between processes
> -
> -	mov	x8, #__NR_getpid
> -	svc	#0
> -	mov	x20, x0
> -
> -	puts	"PID:\t"
> -	mov	x0, x20
> -	bl	putdecn
> -
>  #ifdef SSVE
>  	smstart_sm		// syscalls will have exited streaming mode
>  #endif
> diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
> index 4a5b4b37d475..a0165a81a937 100644
> --- a/tools/testing/selftests/arm64/fp/za-test.S
> +++ b/tools/testing/selftests/arm64/fp/za-test.S
> @@ -161,69 +161,11 @@ function irritator_handler
>
>  	ret
>  endfunction
> +.globl	irritator_handler
>
> -// w0: signal number
> -// x1: sa_action
> -// w2: sa_flags
> -// Clobbers x0-x6,x8
> -function setsignal
> -	str	x30, [sp, #-((sa_sz + 15) / 16 * 16 + 16)]!
> -
> -	mov	w4, w0
> -	mov	x5, x1
> -	mov	w6, w2
> -
> -	add	x0, sp, #16
> -	mov	x1, #sa_sz
> -	bl	memclr
> -
> -	mov	w0, w4
> -	add	x1, sp, #16
> -	str	w6, [x1, #sa_flags]
> -	str	x5, [x1, #sa_handler]
> -	mov	x2, #0
> -	mov	x3, #sa_mask_sz
> -	mov	x8, #__NR_rt_sigaction
> -	svc	#0
> -
> -	cbz	w0, 1f
> -
> -	puts	"sigaction failure\n"
> -	b	exit_error
> -
> -1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
> -	ret
> -endfunction
> -
> -// Main program entry point
> -.globl _start
> -function _start
> -	enable_gcs
> -
> -	mov	x23, #0		// signal count
> -
> -	mov	w0, #SIGINT
> -	adr	x1, terminate_handler
> -	mov	w2, #SA_SIGINFO
> -	bl	setsignal
> -
> -	mov	w0, #SIGTERM
> -	adr	x1, terminate_handler
> -	mov	w2, #SA_SIGINFO
> -	bl	setsignal
> -
> -	mov	w0, #SIGUSR1
> -	adr	x1, irritator_handler
> -	mov	w2, #SA_SIGINFO
> -	orr	w2, w2, #SA_NODEFER
> -	bl	setsignal
> -
> -	mov	w0, #SIGUSR2
> -	adr	x1, tickle_handler
> -	mov	w2, #SA_SIGINFO
> -	orr	w2, w2, #SA_NODEFER
> -	bl	setsignal
> -
> +// Program specific main function
> +.globl main
> +function main
>  	puts	"Streaming mode "
>  	smstart_za
>
> @@ -247,15 +189,6 @@ function _start
>  	bl	putdec
>  	puts	" bits\n"
>
> -	// Obtain our PID, to ensure test pattern uniqueness between processes
> -	mov	x8, #__NR_getpid
> -	svc	#0
> -	mov	x20, x0
> -
> -	puts	"PID:\t"
> -	mov	x0, x20
> -	bl	putdecn
> -
>  	mov	x22, #0		// generation number, increments per iteration
>  .Ltest_loop:
>  	rdsvl	0, 8
> diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
> index 82a76bb2307a..1c7db1298fb1 100644
> --- a/tools/testing/selftests/arm64/fp/zt-test.S
> +++ b/tools/testing/selftests/arm64/fp/zt-test.S
> @@ -130,80 +130,13 @@ function irritator_handler
>
>  	ret
>  endfunction
> +.globl	irritator_handler
>
> -// w0: signal number
> -// x1: sa_action
> -// w2: sa_flags
> -// Clobbers x0-x6,x8
> -function setsignal
> -	str	x30, [sp, #-((sa_sz + 15) / 16 * 16 + 16)]!
> -
> -	mov	w4, w0
> -	mov	x5, x1
> -	mov	w6, w2
> -
> -	add	x0, sp, #16
> -	mov	x1, #sa_sz
> -	bl	memclr
> -
> -	mov	w0, w4
> -	add	x1, sp, #16
> -	str	w6, [x1, #sa_flags]
> -	str	x5, [x1, #sa_handler]
> -	mov	x2, #0
> -	mov	x3, #sa_mask_sz
> -	mov	x8, #__NR_rt_sigaction
> -	svc	#0
> -
> -	cbz	w0, 1f
> -
> -	puts	"sigaction failure\n"
> -	b	exit_error
> -
> -1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
> -	ret
> -endfunction
> -
> -// Main program entry point
> -.globl _start
> -function _start
> -	enable_gcs
> -
> -	mov	x23, #0		// signal count
> -
> -	mov	w0, #SIGINT
> -	adr	x1, terminate_handler
> -	mov	w2, #SA_SIGINFO
> -	bl	setsignal
> -
> -	mov	w0, #SIGTERM
> -	adr	x1, terminate_handler
> -	mov	w2, #SA_SIGINFO
> -	bl	setsignal
> -
> -	mov	w0, #SIGUSR1
> -	adr	x1, irritator_handler
> -	mov	w2, #SA_SIGINFO
> -	orr	w2, w2, #SA_NODEFER
> -	bl	setsignal
> -
> -	mov	w0, #SIGUSR2
> -	adr	x1, tickle_handler
> -	mov	w2, #SA_SIGINFO
> -	orr	w2, w2, #SA_NODEFER
> -	bl	setsignal
> -
> +// Program specific main function
> +.globl main
> +function main
>  	smstart_za
>
> -	// Obtain our PID, to ensure test pattern uniqueness between processes
> -	mov	x8, #__NR_getpid
> -	svc	#0
> -	mov	x20, x0
> -
> -	puts	"PID:\t"
> -	mov	x0, x20
> -	bl	putdecn
> -
>  	mov	x22, #0		// generation number, increments per iteration
>  .Ltest_loop:
>  	mov	x0, x20
>
> --
> 2.47.3
>

--
Cheers, Lorenzo

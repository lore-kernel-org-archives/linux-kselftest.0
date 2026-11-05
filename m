Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888061;
	b=TYuMn0epSryFJ5Xv4az1bH10NSpM/Q358qB7QkrvF4AWhTxu2yYIP7tLhWu078WFZovm
	 R+UA9NH/eLo+gO8h1CnHPMwDNS3slH746Vo8NanIbJXJ9o6yvr+y2bSGp2GWDW1JNvd+7
	 wulKnfUf6cjAXEIlNZWQMf95ehDCrnc39hWcowm904abHAuipeaYEv+3fQOS3kiKNKR7A
	 1OgxmWFjG6dc3w9/YycABbrcDXoTOSoZcHeBqo+Fbn1D+v/QvoWTxjZtm4S1QyZ+aM/KK
	 z+rNdatACMJGjSillh2pZKs+/vwGRG5idVqa343saRkSLGNNw2kSsQNf7OhtF0ich3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888061;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9o8d4hiTOOwTkRtTLTXLCRK3aNU7pqZJPZXu3lxBqEE=;
	b=5m9VFzTCWfBmGwL5SLLyeuWJ0/3zaAlkeb5WI1Pi+Xsq5oWi4uDnVt35FOTm6JkXLllI
	 6mWQdkeyh0bkDnpqves+9WiSid70qBFny0+Y/RrkhdMsvo0RLYG8jXG2Vm8EbVr9nU405
	 cvPIusQgm40nyrT7u1RfRqTZhEucYLuIkIMHeDRAnGRbP0zBDs28W4pHPIMe0U0g5Y8qy
	 HPnUA7asZmngU0mWbl0/f/L1xxY+o86sMLl816IYuMf7vZDuiJZfN1DJ1osj4/uxI88AV
	 qOVqK+UDkKjpVZaM74tBRYcitwYPvPZXGLwcRfrE+SjpUsv/Q3jpJADjb54L3fzFFWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hM1ieG+M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE606606D82C;
	Thu,  5 Nov 2026 14:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hM1ieG+M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6478D1F000C1;
	Thu,  5 Nov 2026 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888060;
	bh=9o8d4hiTOOwTkRtTLTXLCRK3aNU7pqZJPZXu3lxBqEE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hM1ieG+MaT4kQJDDkG1dyTZEVITmNA/9Qsa3w+/Ut2GFnkARU+uCOeeWh7hcUYJL4
	 xsA2APTlFzptj+sYVrHVZSSQJaRK/Qaf45Nd4DcrRUdqMA3woTGGBRTgvUqQNZ4BWs
	 S4t0W1S0ihlXvOt9kRQVUPpgrQdktpGb8C/lasd+0e8qllR+yEJnjSbdfb5Py9zlax
	 I/0Zu4otbvdsjev2x8fBtSf18yM6QtLAyrsXwLUnh5wM58hB3+btXF0FJk8LlHXr87
	 LHw3yBw4fSbslP1viKIp06m3pgLBd4Il9nCFO59HW/r462xTwJtId2eIa5E3Jco1w0
	 y1I/2v8ujbhAQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:19 +0000
Subject: [PATCH v2 06/11] kselftest/arm64: Factor startup code out of
 fp-stress load programs
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-fp-stress-kvm-v2-6-81a5172468f0@kernel.org>
References: <20261105-arm64-fp-stress-kvm-v2-0-81a5172468f0@kernel.org>
In-Reply-To: <20261105-arm64-fp-stress-kvm-v2-0-81a5172468f0@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=11975; i=broonie@kernel.org;
 h=from:subject:message-id; bh=q3b1eGQdxDEBjSpi5TVW+MGzgEyJNUbj5FC2Ius8GWg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9Gt0/D4Zxnrd/rq9hYtY18t+I5W3Mwsv7tgVUnJSs
 Vnt4/FHHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIqxJGhs8Hotxqvm/8/2jJ
 6denqvsvKJle/Nx/4qfMnb3KSwQ6o9QZ/ll9aqx95FlqwOiz6XEaT22qrklu34RL9zbwvj8XtSl
 OjgUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The fp-stress load programs all start up with some startup code which
installs signal handlers and fetches and reports the current PID into
x20. In order to facilitate running as KVM guests and reduce duplication
factor this code out into a asm-utils-linux.S, making the per-test entry
point main() similarly to more normal environments. As the
irritator_handler varies per test they are left in place.

Since the PID is now reported before main() runs it is printed before
rather than after the vector length for those programs that report one,
fp-stress does not parse the output so this has no impact.

Since asm-utils is also used by fp-pidbench that also gets converted to
the new _start implementation, this will install some signal handlers
that were not previously there, enable GCS and report a PID which was
not previously reported but should otherwise have no impact. Since it
does not need an irritator none is provided and a weak definition left
in asm-utils-linux.S, sending signals to the test while it is running
would disrupt it anyway.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/asm-utils-linux.S | 87 ++++++++++++++++++++++
 tools/testing/selftests/arm64/fp/fp-pidbench.S     |  6 +-
 tools/testing/selftests/arm64/fp/fpsimd-test.S     | 76 +------------------
 tools/testing/selftests/arm64/fp/sve-test.S        | 76 +------------------
 tools/testing/selftests/arm64/fp/za-test.S         | 75 +------------------
 tools/testing/selftests/arm64/fp/zt-test.S         | 75 +------------------
 6 files changed, 106 insertions(+), 289 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/asm-utils-linux.S b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
index 9cd31dc47709..9519be4d8f1e 100644
--- a/tools/testing/selftests/arm64/fp/asm-utils-linux.S
+++ b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
@@ -92,3 +92,90 @@ function exit_error
 	svc	#0
 endfunction
 .globl	exit_error
+
+// Install a signal handler
+//
+// w0: signal number
+// x1: sa_action
+// w2: sa_flags
+// Clobbers x0-x6,x8
+function setsignal
+	str	x30, [sp, #-((sa_sz + 15) / 16 * 16 + 16)]!
+
+	mov	w4, w0
+	mov	x5, x1
+	mov	w6, w2
+
+	add	x0, sp, #16
+	mov	x1, #sa_sz
+	bl	memclr
+
+	mov	w0, w4
+	add	x1, sp, #16
+	str	w6, [x1, #sa_flags]
+	str	x5, [x1, #sa_handler]
+	mov	x2, #0
+	mov	x3, #sa_mask_sz
+	mov	x8, #__NR_rt_sigaction
+	svc	#0
+
+	cbz	w0, 1f
+
+	puts	"sigaction failure\n"
+	b	exit_error
+
+1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
+	ret
+endfunction
+.globl	setsignal
+
+// Programs which want to be interrupted by SIGUSR1 provide an
+// irritator_handler(), for those that don't the signal is left alone.
+.weak	irritator_handler
+
+// Main program entry point.  Install the signal handlers shared by the
+// programs, zeroing the signal count in x23 that the handlers maintain,
+// read and report the PID the programs use for uniqueness in x20, then
+// run the program specific main().
+.globl _start
+function _start
+	enable_gcs
+
+	mov	x23, #0		// signal count
+
+	mov	w0, #SIGINT
+	adr	x1, terminate_handler
+	mov	w2, #SA_SIGINFO
+	bl	setsignal
+
+	mov	w0, #SIGTERM
+	adr	x1, terminate_handler
+	mov	w2, #SA_SIGINFO
+	bl	setsignal
+
+	// Load as a literal, adr can't reference the symbol when the
+	// program provides no handler and it resolves to 0
+	ldr	x1, =irritator_handler
+	cbz	x1, 1f
+	mov	w0, #SIGUSR1
+	mov	w2, #SA_SIGINFO
+	orr	w2, w2, #SA_NODEFER
+	bl	setsignal
+
+1:	mov	w0, #SIGUSR2
+	adr	x1, tickle_handler
+	mov	w2, #SA_SIGINFO
+	orr	w2, w2, #SA_NODEFER
+	bl	setsignal
+
+	// Obtain our PID, to ensure test pattern uniqueness between processes
+	mov	x8, #__NR_getpid
+	svc	#0
+	mov	x20, x0
+
+	puts	"PID:\t"
+	mov	x0, x20
+	bl	putdecn
+
+	b	main
+endfunction
diff --git a/tools/testing/selftests/arm64/fp/fp-pidbench.S b/tools/testing/selftests/arm64/fp/fp-pidbench.S
index 881dfa3b342e..80f45560290d 100644
--- a/tools/testing/selftests/arm64/fp/fp-pidbench.S
+++ b/tools/testing/selftests/arm64/fp/fp-pidbench.S
@@ -28,9 +28,9 @@
 	puts	"\n"
 .endm
 
-// Main program entry point
-.globl _start
-function _start
+// Program specific main function
+.globl main
+function main
 	puts	"Iterations per test: "
 	mov	x20, #10000
 	lsl	x20, x20, #12
diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
index fcbb3a872490..df040283d076 100644
--- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
+++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
@@ -148,69 +148,11 @@ function irritator_handler
 
 	ret
 endfunction
+.globl	irritator_handler
 
-// w0: signal number
-// x1: sa_action
-// w2: sa_flags
-// Clobbers x0-x6,x8
-function setsignal
-	str	x30, [sp, #-((sa_sz + 15) / 16 * 16 + 16)]!
-
-	mov	w4, w0
-	mov	x5, x1
-	mov	w6, w2
-
-	add	x0, sp, #16
-	mov	x1, #sa_sz
-	bl	memclr
-
-	mov	w0, w4
-	add	x1, sp, #16
-	str	w6, [x1, #sa_flags]
-	str	x5, [x1, #sa_handler]
-	mov	x2, #0
-	mov	x3, #sa_mask_sz
-	mov	x8, #__NR_rt_sigaction
-	svc	#0
-
-	cbz	w0, 1f
-
-	puts	"sigaction failure\n"
-	b	exit_error
-
-1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
-	ret
-endfunction
-
-// Main program entry point
-.globl _start
-function _start
-	enable_gcs
-
-	mov	x23, #0		// signal count
-
-	mov	w0, #SIGINT
-	adr	x1, terminate_handler
-	mov	w2, #SA_SIGINFO
-	bl	setsignal
-
-	mov	w0, #SIGTERM
-	adr	x1, terminate_handler
-	mov	w2, #SA_SIGINFO
-	bl	setsignal
-
-	mov	w0, #SIGUSR1
-	adr	x1, irritator_handler
-	mov	w2, #SA_SIGINFO
-	orr	w2, w2, #SA_NODEFER
-	bl	setsignal
-
-	mov	w0, #SIGUSR2
-	adr	x1, tickle_handler
-	mov	w2, #SA_SIGINFO
-	orr	w2, w2, #SA_NODEFER
-	bl	setsignal
-
+// Program specific main function
+.globl main
+function main
 	// Sanity-check and report the vector length
 
 	mov	x19, #128
@@ -231,16 +173,6 @@ function _start
 	bl	putdec
 	puts	" bits\n"
 
-	// Obtain our PID, to ensure test pattern uniqueness between processes
-
-	mov	x8, #__NR_getpid
-	svc	#0
-	mov	x20, x0
-
-	puts	"PID:\t"
-	mov	x0, x20
-	bl	putdecn
-
 	mov	x22, #0		// generation number, increments per iteration
 .Ltest_loop:
 
diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index d2ed2a44bdb5..a1925761ae39 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -316,69 +316,11 @@ function irritator_handler
 
 	ret
 endfunction
+.globl	irritator_handler
 
-// w0: signal number
-// x1: sa_action
-// w2: sa_flags
-// Clobbers x0-x6,x8
-function setsignal
-	str	x30, [sp, #-((sa_sz + 15) / 16 * 16 + 16)]!
-
-	mov	w4, w0
-	mov	x5, x1
-	mov	w6, w2
-
-	add	x0, sp, #16
-	mov	x1, #sa_sz
-	bl	memclr
-
-	mov	w0, w4
-	add	x1, sp, #16
-	str	w6, [x1, #sa_flags]
-	str	x5, [x1, #sa_handler]
-	mov	x2, #0
-	mov	x3, #sa_mask_sz
-	mov	x8, #__NR_rt_sigaction
-	svc	#0
-
-	cbz	w0, 1f
-
-	puts	"sigaction failure\n"
-	b	exit_error
-
-1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
-	ret
-endfunction
-
-// Main program entry point
-.globl _start
-function _start
-	enable_gcs
-
-	mov	x23, #0		// Irritation signal count
-
-	mov	w0, #SIGINT
-	adr	x1, terminate_handler
-	mov	w2, #SA_SIGINFO
-	bl	setsignal
-
-	mov	w0, #SIGTERM
-	adr	x1, terminate_handler
-	mov	w2, #SA_SIGINFO
-	bl	setsignal
-
-	mov	w0, #SIGUSR1
-	adr	x1, irritator_handler
-	mov	w2, #SA_SIGINFO
-	orr	w2, w2, #SA_NODEFER
-	bl	setsignal
-
-	mov	w0, #SIGUSR2
-	adr	x1, tickle_handler
-	mov	w2, #SA_SIGINFO
-	orr	w2, w2, #SA_NODEFER
-	bl	setsignal
-
+// Program specific main function
+.globl main
+function main
 #ifdef SSVE
 	puts	"Streaming mode "
 	smstart_sm
@@ -404,16 +346,6 @@ function _start
 	bl	putdec
 	puts	" bits\n"
 
-	// Obtain our PID, to ensure test pattern uniqueness between processes
-
-	mov	x8, #__NR_getpid
-	svc	#0
-	mov	x20, x0
-
-	puts	"PID:\t"
-	mov	x0, x20
-	bl	putdecn
-
 #ifdef SSVE
 	smstart_sm		// syscalls will have exited streaming mode
 #endif
diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index e1ba559b66e9..3fb9ac5c8f8b 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -161,69 +161,11 @@ function irritator_handler
 
 	ret
 endfunction
+.globl	irritator_handler
 
-// w0: signal number
-// x1: sa_action
-// w2: sa_flags
-// Clobbers x0-x6,x8
-function setsignal
-	str	x30, [sp, #-((sa_sz + 15) / 16 * 16 + 16)]!
-
-	mov	w4, w0
-	mov	x5, x1
-	mov	w6, w2
-
-	add	x0, sp, #16
-	mov	x1, #sa_sz
-	bl	memclr
-
-	mov	w0, w4
-	add	x1, sp, #16
-	str	w6, [x1, #sa_flags]
-	str	x5, [x1, #sa_handler]
-	mov	x2, #0
-	mov	x3, #sa_mask_sz
-	mov	x8, #__NR_rt_sigaction
-	svc	#0
-
-	cbz	w0, 1f
-
-	puts	"sigaction failure\n"
-	b	exit_error
-
-1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
-	ret
-endfunction
-
-// Main program entry point
-.globl _start
-function _start
-	enable_gcs
-
-	mov	x23, #0		// signal count
-
-	mov	w0, #SIGINT
-	adr	x1, terminate_handler
-	mov	w2, #SA_SIGINFO
-	bl	setsignal
-
-	mov	w0, #SIGTERM
-	adr	x1, terminate_handler
-	mov	w2, #SA_SIGINFO
-	bl	setsignal
-
-	mov	w0, #SIGUSR1
-	adr	x1, irritator_handler
-	mov	w2, #SA_SIGINFO
-	orr	w2, w2, #SA_NODEFER
-	bl	setsignal
-
-	mov	w0, #SIGUSR2
-	adr	x1, tickle_handler
-	mov	w2, #SA_SIGINFO
-	orr	w2, w2, #SA_NODEFER
-	bl	setsignal
-
+// Program specific main function
+.globl main
+function main
 	puts	"Streaming mode "
 	smstart_za
 
@@ -247,15 +189,6 @@ function _start
 	bl	putdec
 	puts	" bits\n"
 
-	// Obtain our PID, to ensure test pattern uniqueness between processes
-	mov	x8, #__NR_getpid
-	svc	#0
-	mov	x20, x0
-
-	puts	"PID:\t"
-	mov	x0, x20
-	bl	putdecn
-
 	mov	x22, #0		// generation number, increments per iteration
 .Ltest_loop:
 	rdsvl	0, 8
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index 7fbd96face01..39af1c96a4e5 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -130,80 +130,13 @@ function irritator_handler
 
 	ret
 endfunction
+.globl	irritator_handler
 
-// w0: signal number
-// x1: sa_action
-// w2: sa_flags
-// Clobbers x0-x6,x8
-function setsignal
-	str	x30, [sp, #-((sa_sz + 15) / 16 * 16 + 16)]!
-
-	mov	w4, w0
-	mov	x5, x1
-	mov	w6, w2
-
-	add	x0, sp, #16
-	mov	x1, #sa_sz
-	bl	memclr
-
-	mov	w0, w4
-	add	x1, sp, #16
-	str	w6, [x1, #sa_flags]
-	str	x5, [x1, #sa_handler]
-	mov	x2, #0
-	mov	x3, #sa_mask_sz
-	mov	x8, #__NR_rt_sigaction
-	svc	#0
-
-	cbz	w0, 1f
-
-	puts	"sigaction failure\n"
-	b	exit_error
-
-1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
-	ret
-endfunction
-
-// Main program entry point
-.globl _start
-function _start
-	enable_gcs
-
-	mov	x23, #0		// signal count
-
-	mov	w0, #SIGINT
-	adr	x1, terminate_handler
-	mov	w2, #SA_SIGINFO
-	bl	setsignal
-
-	mov	w0, #SIGTERM
-	adr	x1, terminate_handler
-	mov	w2, #SA_SIGINFO
-	bl	setsignal
-
-	mov	w0, #SIGUSR1
-	adr	x1, irritator_handler
-	mov	w2, #SA_SIGINFO
-	orr	w2, w2, #SA_NODEFER
-	bl	setsignal
-
-	mov	w0, #SIGUSR2
-	adr	x1, tickle_handler
-	mov	w2, #SA_SIGINFO
-	orr	w2, w2, #SA_NODEFER
-	bl	setsignal
-
+// Program specific main function
+.globl main
+function main
 	smstart_za
 
-	// Obtain our PID, to ensure test pattern uniqueness between processes
-	mov	x8, #__NR_getpid
-	svc	#0
-	mov	x20, x0
-
-	puts	"PID:\t"
-	mov	x0, x20
-	bl	putdecn
-
 	mov	x22, #0		// generation number, increments per iteration
 .Ltest_loop:
 	mov	x0, x20

-- 
2.47.3


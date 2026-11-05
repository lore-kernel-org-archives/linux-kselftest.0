Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888051;
	b=hE+igjDD0SbMkPIoTashAZvF2J5euv0csdsQv9QOo2jOjbPgIL3oIly0Nkj1XE/h0gvz
	 0nL0CyXZeBwzMpVQxKMqybK9mFiGbry4hQ9iJqs3nzhQwx+V5GwMIcQ3FCtYuJoTvoYBp
	 r9LXFEv7lelk9wuRnkKWh+R7JZj3D6YSIKHfbgztgYXVwDUc4fs3qs5Loqyt+edq7g5VS
	 z7DP49iW0rRvy8s3Ha68nVU61Z0iCVEVZ6gBCWSKu9qbcLuobyZj+fc2Q66ZzKLkNlSuz
	 lIecw8I/+Yuy54AfOIdDP/2fK/i0K/YzfAvGrdtoawzgZclKkDBNYJWg9P79An6po+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888051;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=THbpDPbbYpeEzEvt4/1B8C87Int4ybsMYNsa0r/4B/U=;
	b=f6uCzMF3R2E4Iqn6UN/bEnH8d/YqcBJR7Zki8eybHSorzDBTN7m6H0OAjzp6kBS92qf8
	 +TatUBmGQ76slvLYHrAYSjIxKVEDG4Nel6Q3Bg9ZVQd5K562TRxEZANyQffVdgU1pPzPh
	 VbeS6+2kypWxjbKkTy5fN6byXVHhOmCwu+cASHRf4lnZ5IlOjhhQd5n9DDTuJO+CnJwFJ
	 OHcTnaTN5g2QBhjqusl3fG31E7p8nCwajl+uxA9T8Xg9hzoyqnwP18gKtArnmz+jVqlWe
	 aSldf+Z+WeDRY+mKN10Csib13i6na0qG6T9ai2rIWwM07OG9aOHpjMttz7F4ahgvhGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IdVRU0Ws;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD25606A334;
	Thu,  5 Nov 2026 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IdVRU0Ws
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B9F1F00919;
	Thu,  5 Nov 2026 14:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888050;
	bh=THbpDPbbYpeEzEvt4/1B8C87Int4ybsMYNsa0r/4B/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IdVRU0WsuEAfDP0wtB10DA0it6GhL6NovU93t5zGyhOPddhtcprZw628+RZiX3F3/
	 VMsJQp4S2VVJfuuiH/gK5s6UCq4I0+/HLdYgq7o8JAKQa7Ku0tAO64BMAtKPShPB5z
	 y6PCszGlEgA/6eanwR+8Bg8jLf8vW9NAXvg6xpeZhcnN+DMzVbB7TnGuW8tPbV1w4C
	 IFQg+nfg61C4XohNzYP9rJn/k6GN5XVTS/GlCx993XhvKm+PSNn0H281oq/SbgeXTG
	 82mTGAD1NlbSROTV1ltjMN1/HzjvXqP4jS+9Sdzue3iCKrH0xrDWWS9xKKjun5QUxR
	 pcWie2djpCmXg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:15 +0000
Subject: [PATCH v2 02/11] kselftest/arm64: Factor shared signal handlers
 out of fp-stress loads
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
Message-Id: <20261105-arm64-fp-stress-kvm-v2-2-81a5172468f0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6061; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UBKnFOIQAcrAazCRamLNIRRtMttXvJYS8Eu5Nk5XQEw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9GvkHFrlFL43onnp7jmK2+bd1Hlhtnel48zDaTkPb
 oiKbDm8oaOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATeTufkeEwu2qH8E6Fu6wP
 l4a9mTH52pq/mxa3MXm2iT+onzFFlOkYI8ND0a/Tr0uo9SdPPO3yvUzCvrrHMl+q7XDMrZMMr9w
 Oq/MBAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The assembly programs run by fp-stress all have identical signal
handlers for cleanly exiting the program and simply count signal
deliveries, consolidate them into a single copy in asm-utils-linux.S.

No functional change.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/asm-utils-linux.S | 43 ++++++++++++++++++++++
 tools/testing/selftests/arm64/fp/fpsimd-test.S     | 28 --------------
 tools/testing/selftests/arm64/fp/sve-test.S        | 28 --------------
 tools/testing/selftests/arm64/fp/za-test.S         | 28 --------------
 tools/testing/selftests/arm64/fp/zt-test.S         | 28 --------------
 5 files changed, 43 insertions(+), 112 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/asm-utils-linux.S b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
index e6c22b41dc5e..3effeb1fbf50 100644
--- a/tools/testing/selftests/arm64/fp/asm-utils-linux.S
+++ b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
@@ -6,6 +6,7 @@
 
 #include <asm/unistd.h>
 #include "assembler.h"
+#include "asm-offsets.h"
 
 // Print a single character x0 to stdout
 // Clobbers x0-x2,x8
@@ -41,3 +42,45 @@ function puts
 	ret
 endfunction
 .globl	puts
+
+// Signal handler which reports a clean exit and terminates the program.
+// The tests keep their iteration count in x22 and their signal count in
+// x23, report those from the interrupted context.
+//
+// w0: signal number
+// x2: ucontext
+function terminate_handler
+	mov	w21, w0
+	mov	x20, x2
+
+	puts	"Terminated by signal "
+	mov	w0, w21
+	bl	putdec
+	puts	", no error, iterations="
+	ldr	x0, [x20, #ucontext_regs + 8 * 22]
+	bl	putdec
+	puts	", signals="
+	ldr	x0, [x20, #ucontext_regs + 8 * 23]
+	bl	putdecn
+
+	mov	x0, #0
+	mov	x8, #__NR_exit
+	svc	#0
+endfunction
+.globl	terminate_handler
+
+// Signal handler which only records that the program was interrupted.
+// The tests keep their signal count in x23, update that in the
+// interrupted context.
+//
+// w0: signal number
+// x2: ucontext
+function tickle_handler
+	// Increment the signal count (x23):
+	ldr	x0, [x2, #ucontext_regs + 8 * 23]
+	add	x0, x0, #1
+	str	x0, [x2, #ucontext_regs + 8 * 23]
+
+	ret
+endfunction
+.globl	tickle_handler
diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
index f89d67894c2e..9db7b5419397 100644
--- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
+++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
@@ -149,34 +149,6 @@ function irritator_handler
 	ret
 endfunction
 
-function tickle_handler
-	// Increment the signal count (x23):
-	ldr	x0, [x2, #ucontext_regs + 8 * 23]
-	add	x0, x0, #1
-	str	x0, [x2, #ucontext_regs + 8 * 23]
-
-	ret
-endfunction
-
-function terminate_handler
-	mov	w21, w0
-	mov	x20, x2
-
-	puts	"Terminated by signal "
-	mov	w0, w21
-	bl	putdec
-	puts	", no error, iterations="
-	ldr	x0, [x20, #ucontext_regs + 8 * 22]
-	bl	putdec
-	puts	", signals="
-	ldr	x0, [x20, #ucontext_regs + 8 * 23]
-	bl	putdecn
-
-	mov	x0, #0
-	mov	x8, #__NR_exit
-	svc	#0
-endfunction
-
 // w0: signal number
 // x1: sa_action
 // w2: sa_flags
diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index 7ef7835389e7..2aadb5c3c0f3 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -317,34 +317,6 @@ function irritator_handler
 	ret
 endfunction
 
-function tickle_handler
-	// Increment the signal count (x23):
-	ldr	x0, [x2, #ucontext_regs + 8 * 23]
-	add	x0, x0, #1
-	str	x0, [x2, #ucontext_regs + 8 * 23]
-
-	ret
-endfunction
-
-function terminate_handler
-	mov	w21, w0
-	mov	x20, x2
-
-	puts	"Terminated by signal "
-	mov	w0, w21
-	bl	putdec
-	puts	", no error, iterations="
-	ldr	x0, [x20, #ucontext_regs + 8 * 22]
-	bl	putdec
-	puts	", signals="
-	ldr	x0, [x20, #ucontext_regs + 8 * 23]
-	bl	putdecn
-
-	mov	x0, #0
-	mov	x8, #__NR_exit
-	svc	#0
-endfunction
-
 // w0: signal number
 // x1: sa_action
 // w2: sa_flags
diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index 9c33e13e9dc4..84e63e510f23 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -162,34 +162,6 @@ function irritator_handler
 	ret
 endfunction
 
-function tickle_handler
-	// Increment the signal count (x23):
-	ldr	x0, [x2, #ucontext_regs + 8 * 23]
-	add	x0, x0, #1
-	str	x0, [x2, #ucontext_regs + 8 * 23]
-
-	ret
-endfunction
-
-function terminate_handler
-	mov	w21, w0
-	mov	x20, x2
-
-	puts	"Terminated by signal "
-	mov	w0, w21
-	bl	putdec
-	puts	", no error, iterations="
-	ldr	x0, [x20, #ucontext_regs + 8 * 22]
-	bl	putdec
-	puts	", signals="
-	ldr	x0, [x20, #ucontext_regs + 8 * 23]
-	bl	putdecn
-
-	mov	x0, #0
-	mov	x8, #__NR_exit
-	svc	#0
-endfunction
-
 // w0: signal number
 // x1: sa_action
 // w2: sa_flags
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index a8df05771670..afcadb5aff23 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -131,34 +131,6 @@ function irritator_handler
 	ret
 endfunction
 
-function tickle_handler
-	// Increment the signal count (x23):
-	ldr	x0, [x2, #ucontext_regs + 8 * 23]
-	add	x0, x0, #1
-	str	x0, [x2, #ucontext_regs + 8 * 23]
-
-	ret
-endfunction
-
-function terminate_handler
-	mov	w21, w0
-	mov	x20, x2
-
-	puts	"Terminated by signal "
-	mov	w0, w21
-	bl	putdec
-	puts	", no error, iterations="
-	ldr	x0, [x20, #ucontext_regs + 8 * 22]
-	bl	putdec
-	puts	", signals="
-	ldr	x0, [x20, #ucontext_regs + 8 * 23]
-	bl	putdecn
-
-	mov	x0, #0
-	mov	x8, #__NR_exit
-	svc	#0
-endfunction
-
 // w0: signal number
 // x1: sa_action
 // w2: sa_flags

-- 
2.47.3


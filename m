Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888053;
	b=HOMrWPIzaZtI/iu/dAOYpDfgKRhR6DtBmd/KZSkNMkrohdneUSl2Zqt7OuUhHuZhN1h8
	 SOGgFxHIiR889ZAHOXIZI07hkL5/FThYcb0Gc75DOrKIRQb81Dx2gvtpveT+DVfZY8HR8
	 zNaYRz4Wq0Kp5i74RUAvFN9eQaRcPXSPkj+8GyFvgjn2dp3bwut9G1dgaS1uADjVuYzX7
	 yoe/XVFIdGZqbEZZI5Q9ebveDZ4Cs/Ekj1UjS+gaB97x8uWmngdjmiFSekVqq9d/3Zttn
	 O0BlxKOyimQ/VRtZ9QG+xZK1sUZZY7H3A9WwRfP8cnYSoTOQhFpPysB40yku4en3fGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888053;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Zl4zcjQaew3f7yJ/IqqdyTpPy7p13iqyV5dL8PG0RfM=;
	b=SJbqPdyvYkBUbbEo/XNYxSRx2arZaIeimeysCXYUA43gWyiDMFLrk5Zr9toIhKUNket+
	 fHBDfqTlYIj6mnSarW35DfzHvJ4VG2MazCjOe1o37v2ZjXpcLjrSQHFVqJoyk4bkOFo03
	 oxc+1rt0hdDeT4io+bYl1fP0Fq7FqTFZ1uVl4BGAIyIJdN6ezvzHD00861QXDsEddNMQz
	 hzSvd/0e6SR2be0dri9GKPOMFYZ9UEDk0JF66NGOwew785oNmPo3E028xsqEW5VFSsznp
	 am5jQq31itX3eDEvQ4Mnn9wCsyMq8zQKvM+93cS2rkYrAP8PD4rjmBoaDpuYmLypAIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DTH+wFxC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B89606D80D;
	Thu,  5 Nov 2026 14:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DTH+wFxC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCEBC1F000C1;
	Thu,  5 Nov 2026 14:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888053;
	bh=Zl4zcjQaew3f7yJ/IqqdyTpPy7p13iqyV5dL8PG0RfM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DTH+wFxCisQmpU/QtATllxNBGmKPOrn9tDyRxMqJk7wjubdFS/4s1zpu1ls448R6F
	 0L/XMPCKv8/UniiyrXXNACbTMdEtRtzKPf3Af2dILd96cFZUV2Tk6NUjBPHGwiAhR/
	 ayHHR8DFLcW6eu3FwGDWf8DhPa41siQeb8ao/Czus1gSe2oaYX+Z3TIvo2hRNS3+hy
	 pTlhh0HlNqsBLjH979xuaOFtxLbpMCAOZdLlLFJ/KJWATawBJxYPXrS2HaXD32KCju
	 eOpHWfUERcWilDQjxS8ZBZempixDjGUQksXyg9MH1I3mzQY+OepXtnXIqgQ4RC35II
	 CWG17TTmOtlXA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:16 +0000
Subject: [PATCH v2 03/11] kselftest/arm64: Move exit calls out of fp-stress
 loads
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
Message-Id: <20261105-arm64-fp-stress-kvm-v2-3-81a5172468f0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3766; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qjxu/5RIE28bIxXQDoZnPILxTHbpIszFwwnTqg6oCfI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9Guoc/VGnGX+uWjBqpvzlG/VCb36k2akrPiba9e/4
 BUKJzpNOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRSFeG/wE83M82/Nc8EsHq
 6HUkO/Nsw7w98lp/4lUelVwvq/vSE8nI8PBvNNuWWYtv3Oe9eNqtavHihrvysa1fpc66b/7LFjO
 RkwUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

When they detect corruption the fp-stress test loads print load specific
diagnostics and exits with a failure status.  In preparation for
building versions intended to run as simple bare metal KVM guests factor
the exits into asm-utils-linux.S.

In the process we fix the call to the exit syscall in many of the
locations to pass an initialised value as the exit code in x0, rather
than setting x1 and letting whatever random value happened to already be
in x0 be the exit code.  This happened to work in context since
fp-stress only checks for non-zero values and we always print a
diagnostic before exiting, the return value of the write syscall doing
the print would be either a non-zero length or a negative errno leaving
the low 8 bits non-zero and in all cases nothing resets x0 before we exit.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/asm-utils-linux.S | 8 ++++++++
 tools/testing/selftests/arm64/fp/fpsimd-test.S     | 4 +---
 tools/testing/selftests/arm64/fp/sve-test.S        | 8 ++------
 tools/testing/selftests/arm64/fp/za-test.S         | 8 ++------
 tools/testing/selftests/arm64/fp/zt-test.S         | 4 +---
 5 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/asm-utils-linux.S b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
index 3effeb1fbf50..9cd31dc47709 100644
--- a/tools/testing/selftests/arm64/fp/asm-utils-linux.S
+++ b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
@@ -84,3 +84,11 @@ function tickle_handler
 	ret
 endfunction
 .globl	tickle_handler
+
+// Terminate the program, reporting failure.  Does not return.
+function exit_error
+	mov	x0, #1
+	mov	x8, #__NR_exit
+	svc	#0
+endfunction
+.globl	exit_error
diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
index 9db7b5419397..5ee8ef51ea4e 100644
--- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
+++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
@@ -298,7 +298,5 @@ function barf
 	bl	dumphex
 	puts	"]\n"
 
-	mov	x8, #__NR_exit
-	mov	x1, #1
-	svc	#0
+	b	exit_error
 endfunction
diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index 2aadb5c3c0f3..3447fe0e5554 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -543,9 +543,7 @@ function vl_barf
 	mov	x0, x10
 	bl	putdecn
 
-	mov	x8, #__NR_exit
-	mov	x1, #1
-	svc	#0
+	b	exit_error
 endfunction
 
 function svcr_barf
@@ -555,7 +553,5 @@ function svcr_barf
 	mov	x0, x10
 	bl	putdecn
 
-	mov	x8, #__NR_exit
-	mov	x1, #1
-	svc	#0
+	b	exit_error
 endfunction
diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index 84e63e510f23..33dc4ce8bfa1 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -354,9 +354,7 @@ function vl_barf
 	mov	x0, x10
 	bl	putdecn
 
-	mov	x8, #__NR_exit
-	mov	x1, #1
-	svc	#0
+	b	exit_error
 endfunction
 
 function svcr_barf
@@ -366,7 +364,5 @@ function svcr_barf
 	mov	x0, x10
 	bl	putdecn
 
-	mov	x8, #__NR_exit
-	mov	x1, #1
-	svc	#0
+	b	exit_error
 endfunction
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index afcadb5aff23..c67242c2d5ab 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -284,7 +284,5 @@ function svcr_barf
 	mov	x0, x10
 	bl	putdecn
 
-	mov	x8, #__NR_exit
-	mov	x1, #1
-	svc	#0
+	b	exit_error
 endfunction

-- 
2.47.3


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888061;
	b=zH25ADqxmWgT2fXz05S0edobwSLsTmCF9aRZ+/uo9sqZ/fNsoytrqUI+vr5GQNOoUGNJ
	 Pu/0LGvaYZRgmsoqR83uwXkOiyPparGOpfPQrcHf2t0vkjxlikp+k8qvZRrVaVLGcJpn9
	 AddzN95E7l5aTHiHKtS1DcjqXCRPYmoQGPM2u3yEqVO8cQwvGxpLLGzxhTGdTwLQnADKh
	 5VsZU8g63va1TzrqKmqYsebyqBmkMDksm2rygv3OiZyWC3jrtMswyh859X6zfw59macBE
	 lgpLoMylrZIMUfnUtHllY0eewwzhgPFfPbGps8RpB3Xm7Jm42K/jyOG6BJrHBzKk3Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888061;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=C510kth/CBVLazESEsxRzArI7oc7963TMqt8w5w865M=;
	b=LCOFkalv6fRko+w4YKLHucmiBeV8u4TI2R6luZwjFAnxm0yIY88SSlboJFyfdnobMv7r
	 AN90TzMZs1HSJAq3uhiF8VYH4cjWhwWp10HE/IR5JEnzq/Xy3g7CAnf1dGjjx97h17f2M
	 KrPceUEIzVWQk0mFg8FS3RLlIyKPLOTZ+c/aRRuJt/0hNRBr2BLEQrIjigb2B0pd/hKoM
	 chLx2NbvouQq0lgBd5AhmtsSilW95s9F0QFbzkeUvPz/6TLdIXh1+YH8F7qRGtb+zt6YB
	 1n0LnBQVs563Mz79Nl3hA1AaYj7GWE0HpJIeF9oPf+9yrWw+EtBw8a/x+veFfZvxdkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QrjHL5HO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA911606D823;
	Thu,  5 Nov 2026 14:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QrjHL5HO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C26A1F0093A;
	Thu,  5 Nov 2026 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888055;
	bh=C510kth/CBVLazESEsxRzArI7oc7963TMqt8w5w865M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QrjHL5HOEl8CuY4h06Ec+V9T8RSJ+k2veQODDwns+l/8GaLiL6v+3Ql4DoRs9CTUK
	 RoftER9gCuyP2jVmoHJNSHmEUaiYWnqN2E31ltT/H++Cn3fe274uC04aayDfIbG8GC
	 PctJExkivVs+QNCU/ar+sF9DaObMl0dW7LLyFB8ds3ge4Ll9PEgbgtouGRon2oXJUs
	 pOla/EqdGAV0whiF9JknaOUXU6UXgNH20wdDan+fEFfOpfTMrQsncdbE087j/rjFGB
	 MDxUBfdF+6nGTYMs8YfPO7AAgawmlJVhleOXi7z/mMBRS+6xSDSaA3YSkST2teHkdh
	 DbmflQRohHJvg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:17 +0000
Subject: [PATCH v2 04/11] kselftest/arm64: Use exit_error() rather than
 SIGABRT in fp-stress
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
Message-Id: <20261105-arm64-fp-stress-kvm-v2-4-81a5172468f0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3938; i=broonie@kernel.org;
 h=from:subject:message-id; bh=J/tK2tkelFUN0/4GFmBHelNZo1hOb68bre/CQsIpqVY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9Gsw1/v77MvbfvOc0rKNR3xvyef5JTp+vXKe592/o
 MjX77V1O0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRGeUM/0s1TPxOPPHMPFb5
 Om2L8XHlt8+FVFM9dqRMVH0fxGXqeImR4a75gQMuQQvyGl1C10twq9zyPhXsUPKwWIV7quIem5Q
 +HgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The fp-stress test loads all deliver a SIGABRT to the process group to
report some errors they detect. There is no particular reason to use
this mechanism over exiting with an error code, the fp-stress harness does
not want this.  In order to facilitate running as KVM guests replace
this with use of the exit_error() function we added.

This also avoids loss of diagnostics due to the entire process group
getting killed if any of these cases trigger.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fpsimd-test.S | 10 ++--------
 tools/testing/selftests/arm64/fp/sve-test.S    | 10 ++--------
 tools/testing/selftests/arm64/fp/za-test.S     | 10 ++--------
 tools/testing/selftests/arm64/fp/zt-test.S     |  8 +-------
 4 files changed, 7 insertions(+), 31 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
index 5ee8ef51ea4e..fcbb3a872490 100644
--- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
+++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
@@ -176,7 +176,7 @@ function setsignal
 	cbz	w0, 1f
 
 	puts	"sigaction failure\n"
-	b	.Labort
+	b	exit_error
 
 1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
 	ret
@@ -224,7 +224,7 @@ function _start
 1:	puts	"Bad vector length: "
 	mov	x0, x19
 	bl	putdecn
-	b	.Labort
+	b	exit_error
 
 2:	puts	"Vector length:\t"
 	mov	x0, x19
@@ -266,12 +266,6 @@ function _start
 
 	add	x22, x22, #1
 	b	.Ltest_loop
-
-.Labort:
-	mov	x0, #0
-	mov	x1, #SIGABRT
-	mov	x8, #__NR_kill
-	svc	#0
 endfunction
 
 function barf
diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index 3447fe0e5554..26efdbdd88f9 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -344,7 +344,7 @@ function setsignal
 	cbz	w0, 1f
 
 	puts	"sigaction failure\n"
-	b	.Labort
+	b	exit_error
 
 1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
 	ret
@@ -397,7 +397,7 @@ function _start
 1:	puts	"Bad vector length: "
 	mov	x0, x19
 	bl	putdecn
-	b	.Labort
+	b	exit_error
 
 2:	puts	"Vector length:\t"
 	mov	x0, x19
@@ -474,12 +474,6 @@ function _start
 
 	add	x22, x22, #1
 	b	.Ltest_loop
-
-.Labort:
-	mov	x0, #0
-	mov	x1, #SIGABRT
-	mov	x8, #__NR_kill
-	svc	#0
 endfunction
 
 function barf
diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index 33dc4ce8bfa1..7208bb2db9f1 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -189,7 +189,7 @@ function setsignal
 	cbz	w0, 1f
 
 	puts	"sigaction failure\n"
-	b	.Labort
+	b	exit_error
 
 1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
 	ret
@@ -240,7 +240,7 @@ function _start
 1:	puts	"bad vector length: "
 	mov	x0, x19
 	bl	putdecn
-	b	.Labort
+	b	exit_error
 
 2:	puts	"vector length:\t"
 	mov	x0, x19
@@ -288,12 +288,6 @@ function _start
 
 	add	x22, x22, #1	// Everything still working
 	b	.Ltest_loop
-
-.Labort:
-	mov	x0, #0
-	mov	x1, #SIGABRT
-	mov	x8, #__NR_kill
-	svc	#0
 endfunction
 
 function barf
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index c67242c2d5ab..c6cfbdeb2f0c 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -158,7 +158,7 @@ function setsignal
 	cbz	w0, 1f
 
 	puts	"sigaction failure\n"
-	b	.Labort
+	b	exit_error
 
 1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
 	ret
@@ -222,12 +222,6 @@ function _start
 
 	add	x22, x22, #1	// Everything still working
 	b	.Ltest_loop
-
-.Labort:
-	mov	x0, #0
-	mov	x1, #SIGABRT
-	mov	x8, #__NR_kill
-	svc	#0
 endfunction
 
 function barf

-- 
2.47.3


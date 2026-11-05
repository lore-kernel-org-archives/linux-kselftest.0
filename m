Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888058;
	b=I7EG/j3a8gwwrPsdX+Lyb4V4/8/uJvu3z+1RZYZeocBl1aAz4PLNCgBpLPP+tTppxz5g
	 laouJQKbOzStFtJHJ6P6QK5oAi/W8GgPe0YqcVG4sefDfbXjygBxIy9s+Efb+uU4TrpLD
	 0N3MY5WYYdDHrNTQfGjKelI3q4CL7jv7qXjNw6ZhLQZhAyNjaaGFVB9/X2mnpN57qoGUE
	 Ozp+0tty2tijYClPcnUPt9BN5RWPOoDX2n7KCpuYAp9CSnuy0E8nB2wWVS2/F7mUOjCkW
	 FK8AikraloSaHw/tB0DOQAj6hOF7XoD3VBQFS/kuDv+TWakyUop4Eej1S/FEnqMX94g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888058;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ByEnk8nMNqCzJm/evBrs6o2hhpCWKZBrJlQlHPA57Lk=;
	b=ckYldFbUyipfVcs2wn/m02AhCOuob7LrIUenuCwKqIT6gs/TQpQWhXfc5PfwVONA5LJD
	 HQg1qcV5fxM6jKbr6rZZFceez39V0d2zqC9AbJnL450uch0yjMUY/j3k3ZwtKzkN+RqY7
	 39EkvEYk5vu20K6DjWf81UdcX7uhNFT7TNPQqMVj+Fd5C6H6xIPHnUAT1uMoHEHFNlINu
	 X5FF9OSeiiM8cLZH++3mtoo9Re7MPpSOf7UzsACaWaraaOW2FIV+BfpHLEhmYfUcOv+pX
	 B2k1Jkv44FYcZkd8m7awSOAcY8vPRGvE00dj0GjEIvORFCk/BuGXj5WLI9BCPBLJbsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C5E4noKP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225A9606A32F;
	Thu,  5 Nov 2026 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C5E4noKP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A3F1F00A17;
	Thu,  5 Nov 2026 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888058;
	bh=ByEnk8nMNqCzJm/evBrs6o2hhpCWKZBrJlQlHPA57Lk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C5E4noKPcRZSOyvH4/JDe/ZnnXu17CxbYA9IRo9mXLZF4GjRFQk1Oc0epNj0GnbXt
	 Njl6MG0QMvFaSvwrNFLYlLUChl3uJA5iw4Q/whgFcTbEIUMS0GNubk29jCTTdtdu3R
	 eToTbE7U1QDyCA2CJUiLUAeNNeSzBLc8aiQL9gYw5T++glX9znxyPZYuXz70prjlRp
	 RCJ2oToor6oW0WCd3oviGcAe2xugawp6mWKL4lcUjo8rfyQ11XDITEzyPE+WYqLCc9
	 Al2Awsw/7P2gusu0XcqM1eR7HQetFws/a1jv1yNpHTHt22vmJ/t8V8HEH+hk675JNc
	 5d8jGKV+GNo8A==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:18 +0000
Subject: [PATCH v2 05/11] kselftest/arm64: Exit with an error code on data
 mismatches in fp-stress
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
Message-Id: <20261105-arm64-fp-stress-kvm-v2-5-81a5172468f0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3633; i=broonie@kernel.org;
 h=from:subject:message-id; bh=B/wiVzqMsKKQjQD0tXgLQZUYsmzwz0h2eEJ53nNGjEo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9GtE3H12pFba2CvlZFk9Y/IpSZUJBolFdVv/z/lYF
 14wQY+zo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABN5p87I0HBtk2DcD+7FIgd9
 s3p8rFU45BfynrQ4yfx0jYXkt6zUhQy/2cT3Xdu/Z46ZCAebtPiltl7FI7eU5s94du5trV2+g2k
 XEwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Several of the fp-stress test loads have blocks at the end of their barf
functions with a range of commented out options for how to exit the program
after logging an error. Comments indicate that these were intended to
interact with some long gone debugging code in the kernel. At the minute
the option selected by all the programs is to deliver a SIGABRT to
themselves but there is no need to do this over a normal exit with a non
zero status. In order to facilitate running as a simple bare metal KVM
guest replace these repeated blocks with calls to exit_error(), this
will integrate just as well with the fp-stress harness.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-test.S | 19 +------------------
 tools/testing/selftests/arm64/fp/za-test.S  | 20 +-------------------
 tools/testing/selftests/arm64/fp/zt-test.S  | 20 +-------------------
 3 files changed, 3 insertions(+), 56 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index 26efdbdd88f9..d2ed2a44bdb5 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -477,11 +477,6 @@ function _start
 endfunction
 
 function barf
-// fpsimd.c acitivty log dump hack
-//	ldr	w0, =0xdeadc0de
-//	mov	w8, #__NR_exit
-//	svc	#0
-// end hack
 	mov	x10, x0	// expected data
 	mov	x11, x1	// actual data
 	mov	x12, x2	// data size
@@ -515,19 +510,7 @@ function barf
 	bl	putdecn
 #endif
 
-	mov	x8, #__NR_getpid
-	svc	#0
-// fpsimd.c acitivty log dump hack
-//	ldr	w0, =0xdeadc0de
-//	mov	w8, #__NR_exit
-//	svc	#0
-// ^ end of hack
-	mov	x1, #SIGABRT
-	mov	x8, #__NR_kill
-	svc	#0
-//	mov	x8, #__NR_exit
-//	mov	x1, #1
-//	svc	#0
+	b	exit_error
 endfunction
 
 function vl_barf
diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index 7208bb2db9f1..e1ba559b66e9 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -291,12 +291,6 @@ function _start
 endfunction
 
 function barf
-// fpsimd.c acitivty log dump hack
-//	ldr	w0, =0xdeadc0de
-//	mov	w8, #__NR_exit
-//	svc	#0
-// end hack
-
 	mrs	x13, S3_3_C4_C2_2
 
 	smstop
@@ -326,19 +320,7 @@ function barf
 	mov	x0, x13
 	bl	putdecn
 
-	mov	x8, #__NR_getpid
-	svc	#0
-// fpsimd.c acitivty log dump hack
-//	ldr	w0, =0xdeadc0de
-//	mov	w8, #__NR_exit
-//	svc	#0
-// ^ end of hack
-	mov	x1, #SIGABRT
-	mov	x8, #__NR_kill
-	svc	#0
-//	mov	x8, #__NR_exit
-//	mov	x1, #1
-//	svc	#0
+	b	exit_error
 endfunction
 
 function vl_barf
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index c6cfbdeb2f0c..7fbd96face01 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -225,12 +225,6 @@ function _start
 endfunction
 
 function barf
-// fpsimd.c acitivty log dump hack
-//	ldr	w0, =0xdeadc0de
-//	mov	w8, #__NR_exit
-//	svc	#0
-// end hack
-
 	mrs	x13, S3_3_C4_C2_2
 	smstop
 	mov	x10, x0	// expected data
@@ -256,19 +250,7 @@ function barf
 	mov	x0, x13
 	bl	putdecn
 
-	mov	x8, #__NR_getpid
-	svc	#0
-// fpsimd.c acitivty log dump hack
-//	ldr	w0, =0xdeadc0de
-//	mov	w8, #__NR_exit
-//	svc	#0
-// ^ end of hack
-	mov	x1, #SIGABRT
-	mov	x8, #__NR_kill
-	svc	#0
-//	mov	x8, #__NR_exit
-//	mov	x1, #1
-//	svc	#0
+	b	exit_error
 endfunction
 
 function svcr_barf

-- 
2.47.3


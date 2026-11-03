Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717102;
	b=DyIXMFaDPxLpR7sFbW4YyUiuXhgmdMwkoym8jpM/Hihf6RtMP/p5TSbC/94M5zyTe+Nw
	 nLeSHLyx3hul3J42B0RzHXBPD/IFVJyu3w0VX9240/LNFvLQ4Kh5gseSSDPf4s3Qe0jg5
	 4kYdoTHNM7nxDHUfpE8CcSn1PIg5FrJRE7CNKdoGCRFFAYC9DCLolrmB11iqNdhpzCtw6
	 FrbsxcZV/0ixvZET6d26FDGQw5QAE+COstbNestGCJvqZyHKWQCZ5yCBoKigdtvvcBv9O
	 Rrk/FlgvLa69Vjs7obsmBHalqfrGic6//ApcHU9N48NO+MnlnlSqmqUO2o+kbUwsA1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717102;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uJvYEUew1JHkHj/dhPylyYrqAryCHhap4K6++Evtw2U=;
	b=5iq8AjwLemGnsme2/2Xr8EIECnK6yWRXVJYmdegPg6Pr7Lp12zZwM4B2vaj5jtQodJhT
	 2/g9qRd3BOHWNtczj1lIsESf+rKoxAtIIhVnHlyP8FniKHobcGY+0aCsEIKycyvoGvSz4
	 yd0lCWwt8AJBoegh3Y/pS2dl6IAeBJWwBBuTsUm7f3yCHgBjInIkijgnBMScRzFSu0FIa
	 GdpOpk5+AAf239122kp6eG/G4jEd73efBfSdrNsmnkj4ONhiqREveu8hcAOZJ630IZAwY
	 3ZlS1IKetdQzzgzuLd1BNxiaRCNMFAuHZCBZitVrsTpUA2cwn5joEfk+33uEyj5ObEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ViRV4QG+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C433606A32E;
	Tue,  3 Nov 2026 14:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ViRV4QG+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254921F000C1;
	Tue,  3 Nov 2026 14:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717101;
	bh=uJvYEUew1JHkHj/dhPylyYrqAryCHhap4K6++Evtw2U=;
	h=From:To:Cc:Subject:Date;
	b=ViRV4QG+DpQ15R1veRMJ+sXpb9WbJ+6JOWbdEjJDxKrXtOlH3NeuqYP0r/4qj8CN6
	 ZR8BhjiH+19blJnaujqe7Z3S5wQHz3Omczasi/4osDYYkAfzQrJQsf8jQIXBiRNOy/
	 hjqTIogsRPYc3Nxf4pX9o1EMHJZwoF4qjOFvRJGMPbvxeB55a5sOiv46UDoj+R+vuB
	 9eXNlbhdpdpbwIug1gFZbmKItK9a+cBjGX1IULiNfv9eWSQxWLjTs3Fi1pqSzAuF1D
	 q2KvrtYY3sk7tTSaBartwi7IaNB/jdEscrS577jLSOKtYAxpfIRZHxphXI6N8BMhN7
	 Z9S8/D7K7XDzA==
From: Sasha Levin <sashal@kernel.org>
To: Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: harness: print pointers through uintptr_t
Date: Tue,  3 Nov 2026 09:44:59 -0500
Message-ID: <20261103144459.194046-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__EXPECT() casts both operands to intmax_t or uintmax_t to print them
when an assertion fails. When an operand is a pointer, as in
ASSERT_NE(ptr, MAP_FAILED) or ASSERT_NULL(ptr), gcc warns about the cast
to an integer of a different size on 32-bit architectures, once for
each case of the signedness switch. A 32-bit arm kselftest build in
KernelCI has over 4000 of these warnings, and a suite that builds with
-Werror fails:

  kselftest_harness.h:797:49: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]

Convert pointers to uintptr_t before widening them. Other types are
cast as before, so the printed values do not change.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
The -Werror case is the configfs test, which I've also sent a separate
fix for. Testing:

- A test that fails assertions on pointers, signed and unsigned integers
  of each width, bool, an enum and a double prints the same values
  before and after with gcc and clang on x86_64 and with clang on i386.
  The harness selftest still matches its expected output on all three.

- Building alsa, filesystems, iommu, landlock, lsm, mm, nfsd, pidfd and
  seccomp with gcc -m32 goes from 3221 of these warnings to none from
  the harness. 53 remain, from casts in the tests themselves.

- Full native gcc and clang builds of the selftests (without bpf,
  sched_ext and hid) produce the same binaries and warnings as before.

 tools/testing/selftests/kselftest_harness.h | 25 ++++++++++++++-------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 29a19bc870846..a4404699a6dee 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -762,6 +762,15 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
 
 #define is_signed_var(var)	(!!(((__typeof__(var))(-1)) < (__typeof__(var))1))
 
+/*
+ * Pointers go through uintptr_t before they are widened for printing, as
+ * casting them straight to an integer of a different size warns on 32-bit.
+ * 5 is the pointer type class of __builtin_classify_type().
+ */
+#define __printable_var(var) \
+	__builtin_choose_expr(__builtin_classify_type(var) == 5, \
+			      (uintptr_t)(var), (var))
+
 #define __EXPECT(_expected, _expected_str, _seen, _seen_str, _t, _assert) do { \
 	/* Avoid multiple evaluation of the cases */ \
 	__typeof__(_expected) __exp = (_expected); \
@@ -770,32 +779,32 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
 		/* Report with actual signedness to avoid weird output. */ \
 		switch (is_signed_var(__exp) * 2 + is_signed_var(__seen)) { \
 		case 0: { \
-			uintmax_t __exp_print = (uintmax_t)__exp; \
-			uintmax_t __seen_print = (uintmax_t)__seen; \
+			uintmax_t __exp_print = (uintmax_t)__printable_var(__exp); \
+			uintmax_t __seen_print = (uintmax_t)__printable_var(__seen); \
 			__TH_LOG("Expected %s (%ju) %s %s (%ju)", \
 				 _expected_str, __exp_print, #_t, \
 				 _seen_str, __seen_print); \
 			break; \
 			} \
 		case 1: { \
-			uintmax_t __exp_print = (uintmax_t)__exp; \
-			intmax_t  __seen_print = (intmax_t)__seen; \
+			uintmax_t __exp_print = (uintmax_t)__printable_var(__exp); \
+			intmax_t  __seen_print = (intmax_t)__printable_var(__seen); \
 			__TH_LOG("Expected %s (%ju) %s %s (%jd)", \
 				 _expected_str, __exp_print, #_t, \
 				 _seen_str, __seen_print); \
 			break; \
 			} \
 		case 2: { \
-			intmax_t  __exp_print = (intmax_t)__exp; \
-			uintmax_t __seen_print = (uintmax_t)__seen; \
+			intmax_t  __exp_print = (intmax_t)__printable_var(__exp); \
+			uintmax_t __seen_print = (uintmax_t)__printable_var(__seen); \
 			__TH_LOG("Expected %s (%jd) %s %s (%ju)", \
 				 _expected_str, __exp_print, #_t, \
 				 _seen_str, __seen_print); \
 			break; \
 			} \
 		case 3: { \
-			intmax_t  __exp_print = (intmax_t)__exp; \
-			intmax_t  __seen_print = (intmax_t)__seen; \
+			intmax_t  __exp_print = (intmax_t)__printable_var(__exp); \
+			intmax_t  __seen_print = (intmax_t)__printable_var(__seen); \
 			__TH_LOG("Expected %s (%jd) %s %s (%jd)", \
 				 _expected_str, __exp_print, #_t, \
 				 _seen_str, __seen_print); \
-- 
2.53.0


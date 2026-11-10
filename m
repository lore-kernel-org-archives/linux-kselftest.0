Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282218;
	b=JfdGUiWAOl3X9hJgT8UqSNBrfKWZqYyShlfr+bkxzQ1DfIHbCzprAj1ODQ8PLEVtRNwB
	 qCoVxZDq/o0ml7dkk7buezQhKuBXWdB14UhTSBUPyStmN5LFCamrzeZ1z5+Rk9uDf+Pb5
	 iTMXCiK5UzFuGIOkwNe255TFp5KgA5DBitWzHgW+B+n65FZs6DrPb1s1qO1vMNqyde8LH
	 n2I2fCbtYK5daarSOArH4OyofT43LAZj8zZTcRYEQZKKxl9NxTuKqbFtJZXmBEsahRyAY
	 vtYrgXEDGNVPdMrg6rOHOhQBDWQMi3R+oebIIOnhD7ZQ1ZZkr57BdRI9ZRdJtQL5i6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282218;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6hBL4LjiAhAYhhVnP8JxFJXj0fiJan4H+zlCZCvhGiM=;
	b=XCcXiTbqtkIp19VB6ukcU7oOX7UjcHrEGZ5dD/KG//1vchSkWxEuY+5XZvxNdQBF/tn1
	 kUWqqfTnVDpNE5H35K2cazvXWx0MqLsQ7OWy47inlmXCrS9CCltFWg/7BxjRSY6pNVepy
	 4Su8ufOgU0I500a0BRLpN2KzMboXbFkyI3gi9Osq0tcIxASTfDA9oRNkkun5cCqXhWEuq
	 OZXodtN0KCgXaEgWyxVLTTRkcD+aB7KJC3HTlHjEP2bM9gR469uRXl2uhSdL48xHBq21o
	 BQ6L/ZH3OGz0TZd3UzMRAni20+DhaOd0XLkWB8LvLzWzosnkNcIG8x+qU/qxG6N5jcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mbse5rpz;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF8D606A325;
	Tue, 10 Nov 2026 03:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF8D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mbse5rpz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794282216; x=1825818216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vt6v9bMj92+9GYmTfSMQIJpVNkI2mVHUo2tULXcuIVs=;
  b=Mbse5rpzsCbZAd1UalCxVuUIzjiJPAH1qp5GdUS/CaN3P7znozTshfpS
   UmVh2P9xZOqPPZqfVDDE3rtmsLUhwev0eP7yinWyoCaxC8zWUOTCL5lNa
   qvCHhHOtqDOhSJ/o28Lv5EjHsrdDr3mDs158S0uw2J8+SegBZCujOa9cf
   v7y8f58B8KR1Cww1unOH9qi52ydGHIEt0jN8RVJPnl0f/X81KzGct2WYx
   5HzcdhSpj0a2qTMhx+9KIMUwWqKMmPKwon/CLPW9GdsfAo+tpbtgPdsAS
   9GOFDEpzY3mz9RIWgWyEVo2Kg4W8QEI7+dHAvIkXnq0epV1EejeEKKZc+
   g==;
X-CSE-ConnectionGUID: 0/iEWIwVRAOWE/egMajEhQ==
X-CSE-MsgGUID: RJ1CnMhSTJaW41UgUxS+DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3018014"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3018014"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 19:43:35 -0800
X-CSE-ConnectionGUID: lqyeEymUSeWVoGxjiU7P9w==
X-CSE-MsgGUID: uouYE0fXSi6Y0XOfg5YI0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8218834"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa003.fm.intel.com with ESMTP; 09 Nov 2026 19:43:35 -0800
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: x86@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	shuah@kernel.org,
	chang.seok.bae@intel.com
Subject: [PATCH 1/6] selftests/x86/xstate: Track testing status by kselftest API
Date: Tue, 10 Nov 2026 03:15:58 +0000
Message-ID: <20261110031603.698635-2-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110031603.698635-1-chang.seok.bae@intel.com>
References: <20261110031603.698635-1-chang.seok.bae@intel.com>
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

The XSTATE facility is shared across different component testing.
Currently, it relies on plain printf() for reporting results, which
provides less convenient way to track failures or determine the overall
test status.

Convert the test code to use the kselftest framework for result tracking
and and a return value in the end.

While at it, also shorten and refine the test messages a bit.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 tools/testing/selftests/x86/amx.c    |   5 +-
 tools/testing/selftests/x86/apx.c    |   2 +-
 tools/testing/selftests/x86/avx.c    |  33 +++++-
 tools/testing/selftests/x86/xstate.c | 155 +++++++++++++++++++--------
 tools/testing/selftests/x86/xstate.h |   2 +-
 5 files changed, 142 insertions(+), 55 deletions(-)

diff --git a/tools/testing/selftests/x86/amx.c b/tools/testing/selftests/x86/amx.c
index 40769c16de1b..1e4206c8a03a 100644
--- a/tools/testing/selftests/x86/amx.c
+++ b/tools/testing/selftests/x86/amx.c
@@ -482,6 +482,7 @@ int main(void)
 {
 	unsigned long features;
 	long rc;
+	int ret;
 
 	rc = syscall(SYS_arch_prctl, ARCH_GET_XCOMP_SUPP, &features);
 	if (rc || (features & XFEATURE_MASK_XTILE) != XFEATURE_MASK_XTILE) {
@@ -509,10 +510,10 @@ int main(void)
 	 * Perform generic xstate tests for context switching, ptrace,
 	 * and signal.
 	 */
-	test_xstate(XFEATURE_XTILEDATA);
+	ret = test_xstate(XFEATURE_XTILEDATA);
 
 	clearhandler(SIGILL);
 	free_stashed_xsave();
 
-	return 0;
+	return ret;
 }
diff --git a/tools/testing/selftests/x86/apx.c b/tools/testing/selftests/x86/apx.c
index d9c8d41b8c5a..8d353b75bca1 100644
--- a/tools/testing/selftests/x86/apx.c
+++ b/tools/testing/selftests/x86/apx.c
@@ -6,5 +6,5 @@
 
 int main(void)
 {
-	test_xstate(XFEATURE_APX);
+	return test_xstate(XFEATURE_APX);
 }
diff --git a/tools/testing/selftests/x86/avx.c b/tools/testing/selftests/x86/avx.c
index 11d5367c235f..2b79da16ee2b 100644
--- a/tools/testing/selftests/x86/avx.c
+++ b/tools/testing/selftests/x86/avx.c
@@ -3,10 +3,35 @@
 #define _GNU_SOURCE /* Required for inline xstate helpers */
 #include "xstate.h"
 
+static uint32_t avx_features[] = {
+	XFEATURE_YMM,
+	XFEATURE_OPMASK,
+	XFEATURE_ZMM_Hi256,
+	XFEATURE_Hi16_ZMM,
+};
+
 int main(void)
 {
-	test_xstate(XFEATURE_YMM);
-	test_xstate(XFEATURE_OPMASK);
-	test_xstate(XFEATURE_ZMM_Hi256);
-	test_xstate(XFEATURE_Hi16_ZMM);
+	unsigned int failed = 0, skipped = 0;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(avx_features); i++) {
+		switch (test_xstate(avx_features[i])) {
+		case KSFT_FAIL:
+			failed++;
+			break;
+		case KSFT_SKIP:
+			skipped++;
+			break;
+		case KSFT_PASS:
+		default:
+		}
+	}
+
+	if (skipped == ARRAY_SIZE(avx_features))
+		return KSFT_SKIP;
+	else if (failed)
+		return KSFT_FAIL;
+	else
+		return KSFT_PASS;
 }
diff --git a/tools/testing/selftests/x86/xstate.c b/tools/testing/selftests/x86/xstate.c
index 0ab577157cd7..c26dbe33622f 100644
--- a/tools/testing/selftests/x86/xstate.c
+++ b/tools/testing/selftests/x86/xstate.c
@@ -198,15 +198,16 @@ static void affinitize_cpu0(void)
 		ksft_exit_fail_msg("sched_setaffinity to CPU 0 failed\n");
 }
 
-static void test_context_switch(uint32_t num_threads, uint32_t iterations)
+static void test_context_switch(void)
 {
+	const unsigned int num_threads = 5, iterations = 10;
 	struct futex_info *finfo;
 
 	/* Affinitize to one CPU to force context switches */
 	affinitize_cpu0();
 
-	printf("[RUN]\t%s: check context switches, %d iterations, %d threads.\n",
-	       xstate.name, iterations, num_threads);
+	ksft_print_msg("[RUN]\t%s: check context switches, %d iterations, %d threads.\n",
+		       xstate.name, iterations, num_threads);
 
 	finfo = malloc(sizeof(*finfo) * num_threads);
 	if (!finfo)
@@ -228,9 +229,9 @@ static void test_context_switch(uint32_t num_threads, uint32_t iterations)
 
 	/* Wait for all the threads to finish: */
 	if (checkout_threads(num_threads, finfo))
-		printf("[OK]\tNo incorrect case was found.\n");
+		ksft_test_result_pass("%s for %s\n", __func__, xstate.name);
 	else
-		printf("[FAIL]\tFailed with context switching test.\n");
+		ksft_test_result_fail("%s for %s\n", __func__, xstate.name);
 
 	free(finfo);
 }
@@ -256,6 +257,40 @@ static inline void ptracee_touch_xstate(void)
 	free(xbuf);
 }
 
+static bool validate_ptracer_xstate(pid_t target, struct iovec iov,
+				    struct xsave_buffer *xbuf,
+				    struct xsave_buffer *expected)
+{
+	unsigned int failed = 0;
+
+	if (ptrace(PTRACE_SETREGSET, target, (uint32_t)NT_X86_XSTATE, &iov))
+		ksft_exit_fail_msg("PTRACE_SETREGSET failed\n");
+
+	if (ptrace(PTRACE_GETREGSET, target, (uint32_t)NT_X86_XSTATE, &iov))
+		ksft_exit_fail_msg("PTRACE_GETREGSET failed\n");
+
+	/*
+	 * To track this whole result only, use printf() for skipping sub-test
+	 * counting.
+	 */
+
+	if (*(uint64_t *)get_fpx_sw_bytes(xbuf) == xgetbv(0)) {
+		printf("#\tok\tSW reserved area\n");
+	} else {
+		printf("#\tnot ok\tSW reserved area\n");
+		failed++;
+	}
+
+	if (validate_xstate_same(xbuf, expected)) {
+		printf("#\tok\txstate area\n");
+	} else {
+		printf("#\tnot ok\txstate area\n");
+		failed++;
+	}
+
+	return failed == 0;
+}
+
 /*
  * Ptracer injects the randomized xstate data. It also reads before and
  * after that, which will execute the kernel's state copy functions.
@@ -281,26 +316,15 @@ static void ptracer_inject_xstate(pid_t target)
 	if (ptrace(PTRACE_GETREGSET, target, (uint32_t)NT_X86_XSTATE, &iov))
 		ksft_exit_fail_msg("PTRACE_GETREGSET failed\n");
 
-	printf("[RUN]\t%s: inject xstate via ptrace().\n", xstate.name);
+	ksft_print_msg("[RUN]\t%s: inject xstate via ptrace().\n", xstate.name);
 
 	load_rand_xstate(&xstate, xbuf1);
 	copy_xstate(xbuf2, xbuf1);
 
-	if (ptrace(PTRACE_SETREGSET, target, (uint32_t)NT_X86_XSTATE, &iov))
-		ksft_exit_fail_msg("PTRACE_SETREGSET failed\n");
-
-	if (ptrace(PTRACE_GETREGSET, target, (uint32_t)NT_X86_XSTATE, &iov))
-		ksft_exit_fail_msg("PTRACE_GETREGSET failed\n");
-
-	if (*(uint64_t *)get_fpx_sw_bytes(xbuf1) == xgetbv(0))
-		printf("[OK]\t'xfeatures' in SW reserved area was correctly written\n");
+	if (validate_ptracer_xstate(target, iov, xbuf1, xbuf2))
+		ksft_test_result_pass("%s for %s\n", __func__, xstate.name);
 	else
-		printf("[FAIL]\t'xfeatures' in SW reserved area was not correctly written\n");
-
-	if (validate_xstate_same(xbuf2, xbuf1))
-		printf("[OK]\txstate was correctly updated.\n");
-	else
-		printf("[FAIL]\txstate was not correctly updated.\n");
+		ksft_test_result_fail("%s for %s\n", __func__, xstate.name);
 
 	free(xbuf1);
 	free(xbuf2);
@@ -347,13 +371,26 @@ static void test_ptrace(void)
  */
 #define SIGNAL_BUF_LEN 1000
 static char signal_message_buffer[SIGNAL_BUF_LEN];
-static void sig_print(char *msg)
+static inline void sig_print(char *msg)
 {
 	int left = SIGNAL_BUF_LEN - strlen(signal_message_buffer) - 1;
 
 	strncat(signal_message_buffer, msg, left);
 }
 
+static unsigned int sig_failed;
+
+static inline void sig_print_pass(char *msg)
+{
+	sig_print(msg);
+}
+
+static inline void sig_print_fail(char *msg)
+{
+	sig_failed++;
+	sig_print(msg);
+}
+
 static struct xsave_buffer *stashed_xbuf;
 
 static void validate_sigfpstate(int sig, siginfo_t *si, void *ctx_void)
@@ -368,30 +405,30 @@ static void validate_sigfpstate(int sig, siginfo_t *si, void *ctx_void)
 
 	sw_bytes = get_fpx_sw_bytes(xbuf);
 	if (sw_bytes->magic1 == FP_XSTATE_MAGIC1)
-		sig_print("[OK]\t'magic1' is valid\n");
+		sig_print_pass("#\tok\tmagic1\n");
 	else
-		sig_print("[FAIL]\t'magic1' is not valid\n");
+		sig_print_fail("#\tnot ok\tmagic1\n");
 
 	if (get_fpx_sw_bytes_features(xbuf) & xstate.mask)
-		sig_print("[OK]\t'xfeatures' in SW reserved area is valid\n");
+		sig_print_pass("#\tok\tSW reserved area\n");
 	else
-		sig_print("[FAIL]\t'xfeatures' in SW reserved area is not valid\n");
+		sig_print_fail("#\tnot ok\tSW reserved area\n");
 
 	if (get_xstatebv(xbuf) & xstate.mask)
-		sig_print("[OK]\t'xfeatures' in XSAVE header is valid\n");
+		sig_print_pass("#\tok\tXSTATE_BV\n");
 	else
-		sig_print("[FAIL]\t'xfeatures' in XSAVE header is not valid\n");
+		sig_print_fail("#\tnot ok\tXSTATE_BV\n");
 
 	if (validate_xstate_same(stashed_xbuf, xbuf))
-		sig_print("[OK]\txstate delivery was successful\n");
+		sig_print_pass("#\tok\txstate area\n");
 	else
-		sig_print("[FAIL]\txstate delivery was not successful\n");
+		sig_print_fail("#\tnot ok\txstate area\n");
 
 	magic2 = *(uint32_t *)(xbuf + sw_bytes->xstate_size);
 	if (magic2 == FP_XSTATE_MAGIC2)
-		sig_print("[OK]\t'magic2' is valid\n");
+		sig_print_pass("#\tok\tmagic2\n");
 	else
-		sig_print("[FAIL]\t'magic2' is not valid\n");
+		sig_print_fail("#\tnot ok\tmagic2\n");
 
 	set_rand_data(&xstate, xbuf);
 	copy_xstate(stashed_xbuf, xbuf);
@@ -399,7 +436,7 @@ static void validate_sigfpstate(int sig, siginfo_t *si, void *ctx_void)
 
 static void test_signal(void)
 {
-	bool valid_xstate;
+	bool sigreturn_failed;
 
 	/*
 	 * The signal handler will access this to verify xstate context
@@ -409,49 +446,62 @@ static void test_signal(void)
 	if (!stashed_xbuf)
 		ksft_exit_fail_msg("unable to allocate XSAVE buffer\n");
 
-	printf("[RUN]\t%s: load xstate and raise SIGUSR1\n", xstate.name);
+	ksft_print_msg("[RUN]\t%s: validate signal delivery\n", xstate.name);
 
 	sethandler(SIGUSR1, validate_sigfpstate, 0);
 
 	load_rand_xstate(&xstate, stashed_xbuf);
 
+	sig_failed = 0;
 	raise(SIGUSR1);
 
 	/*
 	 * Immediately record the test result, deferring printf() to
 	 * prevent unintended state contamination by that.
 	 */
-	valid_xstate = validate_xregs_same(stashed_xbuf);
+	sigreturn_failed = !validate_xregs_same(stashed_xbuf);
 	printf("%s", signal_message_buffer);
+	if (!sig_failed)
+		ksft_test_result_pass("%s (delivery) for %s\n", __func__, xstate.name);
+	else
+		ksft_test_result_fail("%s (delivery) for %s\n", __func__, xstate.name);
 
-	printf("[RUN]\t%s: load new xstate from sighandler and check it after sigreturn\n",
-	       xstate.name);
+	ksft_print_msg("[RUN]\t%s: update xstate on sigframe, then validate xstate on sigreturn\n",
+		       xstate.name);
 
-	if (valid_xstate)
-		printf("[OK]\txstate was restored correctly\n");
+	if (!sigreturn_failed)
+		ksft_test_result_pass("%s (return) for %s\n", __func__, xstate.name);
 	else
-		printf("[FAIL]\txstate restoration failed\n");
+		ksft_test_result_fail("%s (return) for %s\n", __func__, xstate.name);
 
 	clearhandler(SIGUSR1);
 	free(stashed_xbuf);
 }
 
-void test_xstate(uint32_t feature_num)
+static struct test_info {
+	void (*fn)(void);
+	unsigned int nr;
+} tests[] = {
+	{ .nr = 1, .fn = test_context_switch, },
+	{ .nr = 1, .fn = test_ptrace, },
+	{ .nr = 2, .fn = test_signal, },
+};
+
+int test_xstate(uint32_t feature_num)
 {
-	const unsigned int ctxtsw_num_threads = 5, ctxtsw_iterations = 10;
 	unsigned long features;
-	long rc;
+	long rc, i, nr = 0;
 
 	if (!(XFEATURE_MASK_TEST_SUPPORTED & (1 << feature_num))) {
 		ksft_print_msg("The xstate test does not fully support the component %u, yet.\n",
 			       feature_num);
-		return;
+		return KSFT_SKIP;
 	}
 
 	rc = syscall(SYS_arch_prctl, ARCH_GET_XCOMP_SUPP, &features);
 	if (rc || !(features & (1 << feature_num))) {
 		ksft_print_msg("The kernel does not support feature number: %u\n", feature_num);
-		return;
+		return KSFT_SKIP;
 	}
 
 	xstate = get_xstate_info(feature_num);
@@ -460,7 +510,18 @@ void test_xstate(uint32_t feature_num)
 				   xstate.size, xstate.xbuf_offset);
 	}
 
-	test_context_switch(ctxtsw_num_threads, ctxtsw_iterations);
-	test_ptrace();
-	test_signal();
+	ksft_reset_state();
+	ksft_print_header();
+
+	for (i = 0; i < ARRAY_SIZE(tests); i++)
+		nr += tests[i].nr;
+
+	ksft_set_plan(nr);
+
+	for (i = 0; i < ARRAY_SIZE(tests); i++)
+		tests[i].fn();
+
+	ksft_print_cnts();
+
+	return (ksft_cnt.ksft_fail == 0) ? KSFT_PASS : KSFT_FAIL;
 }
diff --git a/tools/testing/selftests/x86/xstate.h b/tools/testing/selftests/x86/xstate.h
index eedf0cab7ccb..5e712c979dc1 100644
--- a/tools/testing/selftests/x86/xstate.h
+++ b/tools/testing/selftests/x86/xstate.h
@@ -212,6 +212,6 @@ static inline void set_rand_data(struct xstate_info *xstate, struct xsave_buffer
 }
 
 /* Testing kernel's context switching and ABI support for the xstate. */
-void test_xstate(uint32_t feature_num);
+int test_xstate(uint32_t feature_num);
 
 #endif /* __SELFTESTS_X86_XSTATE_H */
-- 
2.53.0


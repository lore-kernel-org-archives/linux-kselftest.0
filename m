Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282218;
	b=PWDeB1LT/x3gHuz255MN0yxRVrlet+INLzFJqoR60EER9pKmEXf+e3YYI/hp90KSOE8x
	 NBXG46jUWzKFsn54nPJetazq+RErzsDQ/xvWkUUYfNlZzZVl5ZeJnynOmi6H6LaoEbkDN
	 McXT3nR/em9uFxYb78nvAiQgB5EETsG+FwfI/bPYrymskB7eX1ljFpzEle6GSZqhw6ONZ
	 G6s5CJVpadePtOFPG1WT+X3NgTApUf5vT7hMCxHyPOH2Lm659WuqzLaglK8ylVdnKwep7
	 MkCyd4NnEchokp0oU3pT33FTrVrDe4dQzJ5ScOb7GmkihGHtsM7TeWm5sV1iiocwevg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282218;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qdX+/MK7KLAU6geezRlMw4WuJg677PGGURWzpr73r24=;
	b=MMfSjFUoImgHhj7Ku8k7/Td+2uJjqsqr0pqGtyu2MQ3lV4DR9b8tGJp2YBiALSNzH8eX
	 snJlB53iTKEwf3ZUfMyyZgcg5Ng+5FJq/x17d2kwY+Yi7KoAhiX5rM1WKfqe4bD/5aPjn
	 U4SjnJth7bSHnzocMhpVB43GAHGoqwdraXMFLiyxKOiN2WeT7UM2fyTeaXp4FuAEelrJF
	 Ji8bSUG/bT8m616ti0hCuPwY1KMEcnqKSA8siFsVLWs095s+5K/62cZKEYWDAu5jN9FYk
	 2oy3o2Zapd7JO/Z37zpCA69MlFosMaCEyarIF1z1vFOrUrlcKoQY7YOVnPh/mYoF1WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kLVvewir;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2967D606A32A;
	Tue, 10 Nov 2026 03:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2967D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kLVvewir
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794282217; x=1825818217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IrKJJwGai/hmbvqZLOA5YRIj7DKSJdOStS5KuRv3j6I=;
  b=kLVvewirXn23xtLfrRwiIF9/NSyb5Pq9otGX6fklvmR2QKZX04DA5XQn
   Z4evuDt/1KoHsyEjB7D6QLA3m5Y6v2N41zjs3/xpttfSUgwfCnA0Ria8m
   ml9xV82904kExTXJbO6lW58/+3K0x0EmQ6lsVXplPufAZLH3d10xo1lrt
   xoq7voaPfW0ffWhrhAsAYUiLAKolbm8qdEpsD/iMci8pYtZJHw1EmyMJU
   ssWqcKS4bqrODDufFpiTh0jmLtmof4Y+tBSesnF/b3eojrQhQc3eku7wG
   t1NxPXz/ZZhlHopTYkCxsAsf3a7cu4l8H6j5teBQqNxSKaoA4LS5OuVEm
   w==;
X-CSE-ConnectionGUID: mfLV5cQ0S8a1i4o1/0fiaQ==
X-CSE-MsgGUID: dBn05dw6QR684c6DMd5zyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3018021"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3018021"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 19:43:37 -0800
X-CSE-ConnectionGUID: UuvkdFUJSK+NR6M0A7NCFQ==
X-CSE-MsgGUID: PlbOmM+MQZaX4PCPHEKj2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8218850"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa003.fm.intel.com with ESMTP; 09 Nov 2026 19:43:36 -0800
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
Subject: [PATCH 2/6] selftests/x86/xstate: Pre-allocate ptracee XSAVE buffer
Date: Tue, 10 Nov 2026 03:15:59 +0000
Message-ID: <20261110031603.698635-3-chang.seok.bae@intel.com>
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

Currently, the ptrace test does not handle XSAVE buffer allocation
failures in the child process. But such a failure can lead to an
unexpected exit path, complicating error handling.

Instead, allocate the buffer in the parent process so that
allocation and error handling are handled before forking the child.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 tools/testing/selftests/x86/xstate.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/x86/xstate.c b/tools/testing/selftests/x86/xstate.c
index c26dbe33622f..240567e79e96 100644
--- a/tools/testing/selftests/x86/xstate.c
+++ b/tools/testing/selftests/x86/xstate.c
@@ -236,6 +236,8 @@ static void test_context_switch(void)
 	free(finfo);
 }
 
+static struct xsave_buffer *stashed_xbuf;
+
 /*
  * Ptrace test for the ABI format as described in arch/x86/include/asm/user.h
  */
@@ -247,14 +249,8 @@ static void test_context_switch(void)
  */
 static inline void ptracee_touch_xstate(void)
 {
-	struct xsave_buffer *xbuf;
-
-	xbuf = alloc_xbuf();
-
-	load_rand_xstate(&xstate, xbuf);
-	load_init_xstate(&xstate, xbuf);
-
-	free(xbuf);
+	load_rand_xstate(&xstate, stashed_xbuf);
+	load_init_xstate(&xstate, stashed_xbuf);
 }
 
 static bool validate_ptracer_xstate(pid_t target, struct iovec iov,
@@ -335,6 +331,10 @@ static void test_ptrace(void)
 	pid_t child;
 	int status;
 
+	stashed_xbuf = alloc_xbuf();
+	if (!stashed_xbuf)
+		ksft_exit_fail_msg("unable to allocate XSAVE buffer\n");
+
 	child = fork();
 	if (child < 0) {
 		ksft_exit_fail_msg("fork() failed\n");
@@ -358,6 +358,8 @@ static void test_ptrace(void)
 	wait(&status);
 	if (!WIFEXITED(status) || WEXITSTATUS(status))
 		ksft_exit_fail_msg("ptracee exit error\n");
+
+	free(stashed_xbuf);
 }
 
 /*
@@ -391,8 +393,6 @@ static inline void sig_print_fail(char *msg)
 	sig_print(msg);
 }
 
-static struct xsave_buffer *stashed_xbuf;
-
 static void validate_sigfpstate(int sig, siginfo_t *si, void *ctx_void)
 {
 	ucontext_t *ctx = (ucontext_t *)ctx_void;
-- 
2.53.0


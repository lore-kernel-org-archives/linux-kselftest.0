Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AD619F40B;
	Mon, 19 Oct 2026 01:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792371801; cv=none; b=Dj6qY/OaSlm5qRBncHBUfVtIn9P0ObuHb4Wsc1dzfx1hM4xz6/F2bdoezt+RtRf8+bfAXfLUU1ltiY0/qkvdD7B+HYqHxRGWRZsbyqNjPqWGSBpe8af1saw7HTlk+RiJ5ARMEKcAAQH7O03880dOC+1DdVboGh+x4maLUeWq6kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792371801; c=relaxed/simple;
	bh=FuVEwrPoSM9QmABv+wUt83bI9ZZJJBMdAQ/rlOWfEbA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=LFJyl+AGOtso2jJzkqAeGugrbhe9gqouFi/JZTXo69h7/fB+4xPKfJnXh6CB0uBlSRkJDvlRYyfyOiPyVSVVKCIXkbozyFBDVHMUwpKAGkbZ5hwBfXWDXkl7hqZOfkSwgmeEsDgE2zBrtT+I+XPwU5dJ3uGJ2ihKOHNyVaF/9zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQmZ0Pkd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQmZ0Pkd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792371798; x=1823907798;
  h=message-id:date:mime-version:from:subject:to:cc:
   content-transfer-encoding;
  bh=FuVEwrPoSM9QmABv+wUt83bI9ZZJJBMdAQ/rlOWfEbA=;
  b=WQmZ0PkdYUAy/3npeDhwxANGaoChL5nkG1FcDi1YlHNU5LgR3a+BHe/E
   g0Ie+O7tI1rzWOCD32WvJaw4Q3al7hbqr3vJIgMYxTH0dhLL6nFjCrIAb
   QlckmuxD6Or5THLsAUQp8DXa5HYLL+wwQ12DbBHxFYdWXKWFjvKgCQkWB
   9D/qLwq3k3AheHKMS9c+Sk0pyvYStUQOfYyvr9uwJO2bHTiBCdjAfDeAR
   aZ5VIElBH6GPnDTF3ckNmUGi31+Ms/rT7EKu2SVnVnY374K9oZrrLVCvk
   wViVvufhmK+GUUdFwUOlEXM05YQ2vm7oMPsYM0U+Uknjrc4lfp4/BmU0a
   Q==;
X-CSE-ConnectionGUID: YzZtkxjiQAS2Y2o4SqiR3A==
X-CSE-MsgGUID: 8B1fw0RSQUyDTJLm3GvA2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="935524"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="935524"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 18:03:18 -0700
X-CSE-ConnectionGUID: 0wU4b/vWTWaYS1QoootfwA==
X-CSE-MsgGUID: 68KfW9o+Rfai1WxNDtpvFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2400264"
Received: from unknown (HELO [10.238.0.109]) ([10.238.0.109])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 18:03:15 -0700
Message-ID: <3b3e0a35-e664-40ab-84ad-afa3e31e3aea@linux.intel.com>
Date: Mon, 19 Oct 2026 09:03:12 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Ning, Hongyu" <hongyu.ning@linux.intel.com>
Subject: [PATCH] selftests/x86: Fix userfaultfd test for shadow stack
 rejection
To: x86@kernel.org, shuah@kernel.org, rick.p.edgecombe@intel.com
Content-Language: en-US
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, ljs@kernel.org, rppt@kernel.org,
 akpm@linux-foundation.org, david@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, hongyu.ning@intel.com, jolsa@kernel.org,
 dwindsor@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Commit 3c58f641e813 ("userfaultfd: prevent registration of special
VMAs") prevents userfaultfd registration on shadow stack VMAs to avoid
bypassing shadow stack protections through UFFDIO_COPY.

The existing shadow stack selftest still expects UFFDIO_REGISTER to
succeed and uses UFFDIO_COPY to populate the shadow stack. This causes
the selftest to fail on Kernels containing this security fix.

Update the selftest to verify that UFFDIO_REGISTER rejects shadow stack
VMAs with EINVAL. Remove the obsolete userfaultfd fault handling thread
and UFFDIO_COPY test path.

Tested on: Intel shadow stack capable x86_64 platform

Before fix:
	[FAIL]  Userfaultfd test with return code 1

After fix:
	[OK]    Userfaultfd rejects shadow stack registration (EINVAL)

Fixes: 3c58f641e813 ("userfaultfd: prevent registration of special VMAs")

Signed-off-by: Hongyu Ning <hongyu.ning@linux.intel.com>

ChatGPT was used to assist with root-cause analysis and patch
preparation. The changes were reviewed and validated on Intel shadow
stack capable x86_64 platform, with all 12 shadow stack tests passing.
---
 .../testing/selftests/x86/test_shadow_stack.c | 105 ++++++------------
 1 file changed, 34 insertions(+), 71 deletions(-)

diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 3d6ca33edba4..d8d3122cbb43 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -27,7 +27,6 @@
 #include <sys/prctl.h>
 #include <stdint.h>
 #include <signal.h>
-#include <pthread.h>
 #include <sys/ioctl.h>
 #include <linux/userfaultfd.h>
 #include <setjmp.h>
@@ -450,48 +449,16 @@ int test_mprotect(void)
 	return 0;
 }
 
-char zero[4096];
-
-static void *uffd_thread(void *arg)
-{
-	struct uffdio_copy req;
-	int uffd = *(int *)arg;
-	struct uffd_msg msg;
-	int ret;
-
-	while (1) {
-		ret = read(uffd, &msg, sizeof(msg));
-		if (ret > 0)
-			break;
-		else if (errno == EAGAIN)
-			continue;
-		return (void *)1;
-	}
-
-	req.dst = msg.arg.pagefault.address;
-	req.src = (__u64)zero;
-	req.len = 4096;
-	req.mode = 0;
-
-	if (ioctl(uffd, UFFDIO_COPY, &req))
-		return (void *)1;
-
-	return (void *)0;
-}
-
+/*
+ * Shadow stack VMAs must not be registered with userfaultfd. In particular,
+ * UFFDIO_COPY must not be able to populate a shadow stack with arbitrary data.
+ */
 int test_userfaultfd(void)
 {
-	struct uffdio_register uffdio_register;
-	struct uffdio_api uffdio_api;
-	struct sigaction sa = {};
-	pthread_t thread;
-	void *res;
-	int uffd;
-
-	sa.sa_sigaction = test_access_fix_handler;
-	sa.sa_flags = SA_SIGINFO;
-	if (sigaction(SIGSEGV, &sa, NULL))
-		return 1;
+	struct uffdio_register uffdio_register = {};
+	struct uffdio_api uffdio_api = {};
+	void *shstk;
+	int uffd, ret = 1;
 
 	uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
 	if (uffd < 0) {
@@ -499,43 +466,39 @@ int test_userfaultfd(void)
 		return 0;
 	}
 
-	reset_test_shstk(0);
+	shstk = create_shstk(0);
+	if (shstk == MAP_FAILED) {
+		printf("[FAIL]\tCould not create shadow stack\n");
+		close(uffd);
+		return 1;
+	}
 
 	uffdio_api.api = UFFD_API;
-	uffdio_api.features = 0;
-	if (ioctl(uffd, UFFDIO_API, &uffdio_api))
-		goto err;
+	if (ioctl(uffd, UFFDIO_API, &uffdio_api)) {
+		printf("[FAIL]\tUFFDIO_API failed: %s\n", strerror(errno));
+		goto out;
+	}
 
-	uffdio_register.range.start = (__u64)shstk_ptr;
-	uffdio_register.range.len = 4096;
+	uffdio_register.range.start = (__u64)shstk;
+	uffdio_register.range.len = PAGE_SIZE;
 	uffdio_register.mode = UFFDIO_REGISTER_MODE_MISSING;
-	if (ioctl(uffd, UFFDIO_REGISTER, &uffdio_register))
-		goto err;
-
-	if (pthread_create(&thread, NULL, &uffd_thread, &uffd))
-		goto err;
-
-	reset_shstk(shstk_ptr);
-	test_shstk_access(shstk_ptr);
-
-	if (pthread_join(thread, &res))
-		goto err;
-
-	if (test_shstk_access(shstk_ptr))
-		goto err;
-
-	free_shstk(shstk_ptr);
+	if (!ioctl(uffd, UFFDIO_REGISTER, &uffdio_register)) {
+		printf("[FAIL]\tUserfaultfd registered a shadow stack VMA\n");
+		goto out;
+	}
 
-	signal(SIGSEGV, SIG_DFL);
+	if (errno != EINVAL) {
+		printf("[FAIL]\tUFFDIO_REGISTER: expected EINVAL, got %s\n",
+		       strerror(errno));
+		goto out;
+	}
 
-	if (!res)
-		printf("[OK]\tUserfaultfd test\n");
-	return !!res;
-err:
-	free_shstk(shstk_ptr);
+	printf("[OK]\tUserfaultfd rejects shadow stack registration (EINVAL)\n");
+	ret = 0;
+out:
+	free_shstk(shstk);
 	close(uffd);
-	signal(SIGSEGV, SIG_DFL);
-	return 1;
+	return ret;
 }
 
 /* Simple linked list for keeping track of mappings in test_guard_gap() */
-- 
2.43.0


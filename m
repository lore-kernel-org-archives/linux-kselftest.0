Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5ED46D2DB;
	Wed, 22 Jul 2026 09:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711442; cv=none; b=N9t0dK5CrqTVXpPeMZoaa0nhnjeyhwzIiFCY87a98xe1zDaFUTnAuFvuCdg/LKP8rC0cWL+LJgDTn8IYUQGdXIVaGJh5BZnrRcNE8kfFFc/DwDW2E0jWev1EBmYFdOuuUcT6i+Cz/730FpDa7Elpw84+SSR5A2UB07yMjDRBbBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711442; c=relaxed/simple;
	bh=Kq34AL8sTs1lk9mVauctyl4w6kvH5J+t3A+tMnnwzow=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=XnvBgvRupE/zDQ1qR4h1cLhmgEnDtdmqcLTJ59hPnFFiLaMUCaK8G+9qWxDidjJJiF+IAuOqZN5DZ8av5ebipD1GCZJzOwVUKqQ4K4xnUNF87jE2Q6E3pGNxdx5jktEytX1fUt4RkQoLiOBGQCEVAprB0WmUg6V1xj3mncg+T3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name; spf=pass smtp.mailfrom=cyyself.name; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ZzMF9oZB; arc=none smtp.client-ip=203.205.221.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyyself.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ZzMF9oZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784711424; bh=ywO2kDac9NDoTIOZ6pj/hyQ52rfOMrUFIVHCDa9+1W0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZzMF9oZB5wpw397pR8PX+02Ia67YlWmSPQvD/Mc/SpOC0GNIFb12QlzhM7dC4rEoT
	 JAjUkTMxWmmHMoUQ7j4NkIIciwzYdyBYlj7fbdB8vFE3Pdv0sugFyDWJVcSLpzMFdZ
	 xb7/6rqiw6ppPGCDPZWkdh3kABJ0QptMyGHmKrwE=
Received: from localhost.localdomain ([240e:37c:2242:cf00:5054:a3ff:fe89:345b])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 2950BA47; Wed, 22 Jul 2026 17:10:21 +0800
X-QQ-mid: xmsmtpt1784711421t6wjxam2q
Message-ID: <tencent_1C887FE33A1F8E608436A623366E400C4706@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GpmgsbjapwPVKCTfLcbqp0pCLKbaxab7tvRE4lCIiWmgiNv7H24
	 8H945UHmbxl4KzHsvWO3FFN9K2cVydShUjmFdr9Hda8b8TGCPKVgYDRkBMwAu57F++v5k8H8zD18
	 rYwoOMjbBmyPDaNU9ZEbBZSzasD3Mpt3RR0QVWtvHQKRalaIfJYLnrZmSEIeii+df5H6S2nzkKT7
	 osn1AbUP4QNAsM6HI0xWlgj26CqqsGEJUgbudjg0MLILTm1KvzfhVU70gWNS5O0KuyZ7oBlR9TL2
	 XXaz0WScFHWDeLOVqtbqVu6V1ntfi2EtVB4hz6cwaDha18C0OX/XVioj727mJhhRlyzEQeHmm7oh
	 CqYBJJT3dflWITei4Kwgk1FsH357BWU9ozN8/NLUgI1gmsv9ZZh5A8U7le0k6rVTFKsvU7E7G8fn
	 XHlxv2i47/dtzgtj7jj0HjV/R0i92Hv8Ph3pL7kqAiyOoi0/ZKQfg+3MvVRInVs7jBddlwEzzoir
	 m//y4etMaQLr4r4yZnej+yiZutr2balD034tv87gDTKTfGvNkkbPbkXblGC4BrT6GCbumvGVn7rD
	 Aa/f2j9kmpsAdqqCc8v5LPzql7hCtTvJX8cURcwoYOpmZ6WUMMxU5fmaax4ncm/Fe3YjyerX5Y5P
	 fvldSv+/7PnHKd1/SL9iX0WPdYYQbHAjP3Lcn7QFBaxvU4HN6PRJDsNI06evk4SQ3x1wDHXQWrJh
	 gmhtmYCpdk68yR6iTbrhJzw+5o9+1LONoj5sLPUju+4B/NejokVvHZOX+sFcsJtaNS5ygbRNyt+A
	 mXwGr+1cQE3CmKFF32GXY79UcjtvYi/wPv/3SY6HlQD6GCAJVKVwqTE7seMM5uPfFmkhxFh0toPx
	 f5XSvNZFROlvTKsBkB2UunmNh+jTWu9BXWQ4cLTm8lrnCfHQs3qCuJNV2f5NS2aqeKD2aZSY+U/K
	 nFWSPajMVjDwSO00039izQF3jLwtpCcFlSnn7cr6rVEpoaBJYG9TvBlIZiZhc1xoqTSkwBgSZLWa
	 eUpUvIgItgNm9mFcMq4QX8XnBSjMsL3TvBJyRw7EVJT14Ssq+toHD9peThzGaHWZIRQCuGOlsvPW
	 tw0TizHG8976RGu6u3fTzwPyEIAtR23eG558NKnxCINWCzOA4=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Yangyu Chen <cyy@cyyself.name>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Chen Yu <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yangyu Chen <yangyu.chen@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH 3/4] selftests/prctl: Add PR_SCHED_CACHE tests
Date: Wed, 22 Jul 2026 17:10:20 +0800
X-OQ-MSGID: <20260722091020.1594137-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_93116D14C771DC8C988C10E3C634BE0CC107@qq.com>
References: <tencent_93116D14C771DC8C988C10E3C634BE0CC107@qq.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Test the per-mm cache aware scheduling prctl: get/set round trips
for every attribute including resets via PR_SCHED_CACHE_DEFAULT in
both its sign-extended and 32-bit truncated form, argument
validation (out of range values, unknown attributes and sub-commands,
nonzero unused arguments, a faulting GET pointer, and that rejected
values are not stored), that attribute values live on the shared mm
while the inherit mask stays per thread, that fork() always inherits
without changes leaking back to the parent, and that execve() resets
attributes unless selected in the inherit mask, verified by
re-executing the test binary in a checker mode.

All tests SKIP on kernels without PR_SCHED_CACHE.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 tools/testing/selftests/prctl/.gitignore    |   1 +
 tools/testing/selftests/prctl/Makefile      |  15 +-
 tools/testing/selftests/prctl/config        |   1 +
 tools/testing/selftests/prctl/sched-cache.c | 394 ++++++++++++++++++++
 4 files changed, 406 insertions(+), 5 deletions(-)
 create mode 100644 tools/testing/selftests/prctl/sched-cache.c

diff --git a/tools/testing/selftests/prctl/.gitignore b/tools/testing/selftests/prctl/.gitignore
index 05d5e31661df..1b22c9f45c4b 100644
--- a/tools/testing/selftests/prctl/.gitignore
+++ b/tools/testing/selftests/prctl/.gitignore
@@ -2,5 +2,6 @@
 disable-tsc-ctxt-sw-stress-test
 disable-tsc-on-off-stress-test
 disable-tsc-test
+sched-cache
 set-anon-vma-name-test
 set-process-name
diff --git a/tools/testing/selftests/prctl/Makefile b/tools/testing/selftests/prctl/Makefile
index e770e86fad9a..f889721a0749 100644
--- a/tools/testing/selftests/prctl/Makefile
+++ b/tools/testing/selftests/prctl/Makefile
@@ -1,14 +1,19 @@
 # SPDX-License-Identifier: GPL-2.0
-ifndef CROSS_COMPILE
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
 override ARCH := $(shell echo $(ARCH) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
 
+# sched-cache tests an arch-independent prctl
+TEST_PROGS := sched-cache
+
+ifndef CROSS_COMPILE
 ifeq ($(ARCH),x86)
-TEST_PROGS := disable-tsc-ctxt-sw-stress-test disable-tsc-on-off-stress-test \
+TEST_PROGS += disable-tsc-ctxt-sw-stress-test disable-tsc-on-off-stress-test \
 		disable-tsc-test set-anon-vma-name-test set-process-name
+endif
+endif
+
+LDLIBS += -pthread
+
 all: $(TEST_PROGS)
 
 include ../lib.mk
-
-endif
-endif
diff --git a/tools/testing/selftests/prctl/config b/tools/testing/selftests/prctl/config
index c6ed03c544e5..f44bf7e888e6 100644
--- a/tools/testing/selftests/prctl/config
+++ b/tools/testing/selftests/prctl/config
@@ -1 +1,2 @@
 CONFIG_ANON_VMA_NAME=y
+CONFIG_SCHED_CACHE=y
diff --git a/tools/testing/selftests/prctl/sched-cache.c b/tools/testing/selftests/prctl/sched-cache.c
new file mode 100644
index 000000000000..6babbf205a0f
--- /dev/null
+++ b/tools/testing/selftests/prctl/sched-cache.c
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Tests for prctl(PR_SCHED_CACHE): per-process (per-mm) control of
+ * cache aware scheduling.
+ *
+ * The prctl stores attributes on the calling process's mm, so values
+ * are shared by all threads, always inherited over fork(), and
+ * inherited over execve() according to the per-thread
+ * PR_SCHED_CACHE_INHERIT mask.
+ */
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <pthread.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/prctl.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "kselftest_harness.h"
+
+#ifndef PR_SCHED_CACHE
+#define PR_SCHED_CACHE				82
+# define PR_SCHED_CACHE_GET			1
+# define PR_SCHED_CACHE_SET			2
+# define PR_SCHED_CACHE_ENABLE			1
+# define PR_SCHED_CACHE_AGGR_TOLERANCE_NR	2
+# define PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE	3
+# define PR_SCHED_CACHE_OVERAGGR_PCT		4
+# define PR_SCHED_CACHE_INHERIT			5
+# define PR_SCHED_CACHE_DEFAULT			(-1)
+# define PR_SCHED_CACHE_INHERIT_ENABLE			(1UL << 0)
+# define PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_NR	(1UL << 1)
+# define PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_SIZE	(1UL << 2)
+# define PR_SCHED_CACHE_INHERIT_OVERAGGR_PCT		(1UL << 3)
+# define PR_SCHED_CACHE_INHERIT_MASK			\
+	(PR_SCHED_CACHE_INHERIT_ENABLE |		\
+	 PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_NR |	\
+	 PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_SIZE |	\
+	 PR_SCHED_CACHE_INHERIT_OVERAGGR_PCT)
+#endif
+
+static int sc_get(unsigned long attr, int *val)
+{
+	if (prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_GET, attr, val, 0))
+		return -errno;
+	return 0;
+}
+
+static int sc_set(unsigned long attr, unsigned long val)
+{
+	if (prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_SET, attr, val, 0))
+		return -errno;
+	return 0;
+}
+
+static int sc_supported(void)
+{
+	int val;
+
+	return sc_get(PR_SCHED_CACHE_ENABLE, &val) == 0;
+}
+
+static void sc_reset_all(void)
+{
+	sc_set(PR_SCHED_CACHE_ENABLE, PR_SCHED_CACHE_DEFAULT);
+	sc_set(PR_SCHED_CACHE_AGGR_TOLERANCE_NR, PR_SCHED_CACHE_DEFAULT);
+	sc_set(PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE, PR_SCHED_CACHE_DEFAULT);
+	sc_set(PR_SCHED_CACHE_OVERAGGR_PCT, PR_SCHED_CACHE_DEFAULT);
+	sc_set(PR_SCHED_CACHE_INHERIT, 0);
+}
+
+TEST(get_set_roundtrip)
+{
+	int val;
+
+	if (!sc_supported())
+		SKIP(return, "PR_SCHED_CACHE not supported");
+
+	sc_reset_all();
+
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_ENABLE, &val));
+	ASSERT_EQ(PR_SCHED_CACHE_DEFAULT, val);
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_AGGR_TOLERANCE_NR, &val));
+	ASSERT_EQ(PR_SCHED_CACHE_DEFAULT, val);
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE, &val));
+	ASSERT_EQ(PR_SCHED_CACHE_DEFAULT, val);
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_OVERAGGR_PCT, &val));
+	ASSERT_EQ(PR_SCHED_CACHE_DEFAULT, val);
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_INHERIT, &val));
+	ASSERT_EQ(0, val);
+
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_ENABLE, 0));
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_ENABLE, &val));
+	ASSERT_EQ(0, val);
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_ENABLE, 1));
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_ENABLE, &val));
+	ASSERT_EQ(1, val);
+
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_AGGR_TOLERANCE_NR, 7));
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_AGGR_TOLERANCE_NR, &val));
+	ASSERT_EQ(7, val);
+
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE, 13));
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE, &val));
+	ASSERT_EQ(13, val);
+
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_OVERAGGR_PCT, 155));
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_OVERAGGR_PCT, &val));
+	ASSERT_EQ(155, val);
+
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_INHERIT,
+			    PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_NR));
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_INHERIT, &val));
+	ASSERT_EQ(PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_NR, (unsigned long)val);
+
+	/* DEFAULT resets the inherit mask to empty */
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_INHERIT, PR_SCHED_CACHE_DEFAULT));
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_INHERIT, &val));
+	ASSERT_EQ(0, val);
+
+	/* both the sign-extended and the 32-bit truncated DEFAULT reset */
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_AGGR_TOLERANCE_NR,
+			    PR_SCHED_CACHE_DEFAULT));
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_AGGR_TOLERANCE_NR, &val));
+	ASSERT_EQ(PR_SCHED_CACHE_DEFAULT, val);
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE, 0xffffffffUL));
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE, &val));
+	ASSERT_EQ(PR_SCHED_CACHE_DEFAULT, val);
+
+	sc_reset_all();
+}
+
+TEST(invalid_arguments)
+{
+	int val;
+
+	if (!sc_supported())
+		SKIP(return, "PR_SCHED_CACHE not supported");
+
+	sc_reset_all();
+
+	/* out of range values */
+	ASSERT_EQ(-EINVAL, sc_set(PR_SCHED_CACHE_ENABLE, 2));
+	ASSERT_EQ(-EINVAL, sc_set(PR_SCHED_CACHE_AGGR_TOLERANCE_NR, 101));
+	ASSERT_EQ(-EINVAL, sc_set(PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE, 101));
+	ASSERT_EQ(-EINVAL, sc_set(PR_SCHED_CACHE_OVERAGGR_PCT, 1001));
+	ASSERT_EQ(-EINVAL, sc_set(PR_SCHED_CACHE_INHERIT,
+				  PR_SCHED_CACHE_INHERIT_MASK + 1));
+
+	/* unknown attribute */
+	ASSERT_EQ(-EINVAL, sc_set(0, 1));
+	ASSERT_EQ(-EINVAL, sc_set(PR_SCHED_CACHE_INHERIT + 1, 1));
+	ASSERT_EQ(-EINVAL, sc_get(0, &val));
+	ASSERT_EQ(-EINVAL, sc_get(PR_SCHED_CACHE_INHERIT + 1, &val));
+
+	/* unknown op */
+	errno = 0;
+	ASSERT_EQ(-1, prctl(PR_SCHED_CACHE, 0, PR_SCHED_CACHE_ENABLE, 0, 0));
+	ASSERT_EQ(EINVAL, errno);
+	errno = 0;
+	ASSERT_EQ(-1, prctl(PR_SCHED_CACHE, 3, PR_SCHED_CACHE_ENABLE, 0, 0));
+	ASSERT_EQ(EINVAL, errno);
+
+	/* nonzero unused argument */
+	errno = 0;
+	ASSERT_EQ(-1, prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_SET,
+			    PR_SCHED_CACHE_ENABLE, 1, 1));
+	ASSERT_EQ(EINVAL, errno);
+
+	/* bad GET pointer */
+	errno = 0;
+	ASSERT_EQ(-1, prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_GET,
+			    PR_SCHED_CACHE_ENABLE, NULL, 0));
+	ASSERT_EQ(EFAULT, errno);
+
+	/* values rejected with -EINVAL must not be stored */
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_ENABLE, &val));
+	ASSERT_EQ(PR_SCHED_CACHE_DEFAULT, val);
+}
+
+struct thread_ctx {
+	int nr_seen;
+	int inherit_seen;
+	int ret;
+};
+
+static void *thread_fn(void *arg)
+{
+	struct thread_ctx *ctx = arg;
+
+	ctx->ret = sc_get(PR_SCHED_CACHE_AGGR_TOLERANCE_NR, &ctx->nr_seen);
+	if (!ctx->ret)
+		ctx->ret = sc_get(PR_SCHED_CACHE_INHERIT, &ctx->inherit_seen);
+	if (!ctx->ret)
+		ctx->ret = sc_set(PR_SCHED_CACHE_AGGR_TOLERANCE_NR, 42);
+	/* clearing this thread's mask must not affect the creator's */
+	if (!ctx->ret)
+		ctx->ret = sc_set(PR_SCHED_CACHE_INHERIT, 0);
+
+	return NULL;
+}
+
+TEST(values_shared_by_threads_inherit_mask_is_not)
+{
+	struct thread_ctx ctx = { .nr_seen = -2, .inherit_seen = -2 };
+	pthread_t thread;
+	int val;
+
+	if (!sc_supported())
+		SKIP(return, "PR_SCHED_CACHE not supported");
+
+	sc_reset_all();
+
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_AGGR_TOLERANCE_NR, 31));
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_INHERIT,
+			    PR_SCHED_CACHE_INHERIT_ENABLE));
+
+	ASSERT_EQ(0, pthread_create(&thread, NULL, thread_fn, &ctx));
+	ASSERT_EQ(0, pthread_join(thread, NULL));
+	ASSERT_EQ(0, ctx.ret);
+
+	/* attribute values live on the shared mm */
+	ASSERT_EQ(31, ctx.nr_seen);
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_AGGR_TOLERANCE_NR, &val));
+	ASSERT_EQ(42, val);
+
+	/*
+	 * The inherit mask is per thread: the new thread starts with a
+	 * copy of its creator's mask, and clearing it in the thread
+	 * does not touch the creator's.
+	 */
+	ASSERT_EQ(PR_SCHED_CACHE_INHERIT_ENABLE,
+		  (unsigned long)ctx.inherit_seen);
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_INHERIT, &val));
+	ASSERT_EQ(PR_SCHED_CACHE_INHERIT_ENABLE, (unsigned long)val);
+
+	sc_reset_all();
+}
+
+TEST(fork_always_inherits)
+{
+	pid_t pid;
+	int status;
+	int val;
+
+	if (!sc_supported())
+		SKIP(return, "PR_SCHED_CACHE not supported");
+
+	sc_reset_all();
+
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_ENABLE, 1));
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_AGGR_TOLERANCE_NR, 9));
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE, 11));
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_OVERAGGR_PCT, 77));
+
+	pid = fork();
+	ASSERT_LE(0, pid);
+	if (pid == 0) {
+		int val;
+
+		if (sc_get(PR_SCHED_CACHE_ENABLE, &val) || val != 1)
+			_exit(1);
+		if (sc_get(PR_SCHED_CACHE_AGGR_TOLERANCE_NR, &val) || val != 9)
+			_exit(2);
+		if (sc_get(PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE, &val) || val != 11)
+			_exit(3);
+		if (sc_get(PR_SCHED_CACHE_OVERAGGR_PCT, &val) || val != 77)
+			_exit(4);
+
+		/* changes in the child must not leak back to the parent */
+		if (sc_set(PR_SCHED_CACHE_AGGR_TOLERANCE_NR, 50))
+			_exit(5);
+
+		_exit(0);
+	}
+
+	ASSERT_EQ(pid, waitpid(pid, &status, 0));
+	ASSERT_TRUE(WIFEXITED(status));
+	ASSERT_EQ(0, WEXITSTATUS(status));
+
+	ASSERT_EQ(0, sc_get(PR_SCHED_CACHE_AGGR_TOLERANCE_NR, &val));
+	ASSERT_EQ(9, val);
+
+	sc_reset_all();
+}
+
+static int exec_check(int expect_enable, int expect_nr,
+		      int expect_size, int expect_pct)
+{
+	char enable[16], nr[16], size[16], pct[16];
+	pid_t pid;
+	int status;
+
+	snprintf(enable, sizeof(enable), "%d", expect_enable);
+	snprintf(nr, sizeof(nr), "%d", expect_nr);
+	snprintf(size, sizeof(size), "%d", expect_size);
+	snprintf(pct, sizeof(pct), "%d", expect_pct);
+
+	pid = fork();
+	if (pid < 0)
+		return -1;
+
+	if (pid == 0) {
+		setenv("SCHED_CACHE_EXEC_MODE", "1", 1);
+		setenv("SCHED_CACHE_EXPECT_ENABLE", enable, 1);
+		setenv("SCHED_CACHE_EXPECT_NR", nr, 1);
+		setenv("SCHED_CACHE_EXPECT_SIZE", size, 1);
+		setenv("SCHED_CACHE_EXPECT_PCT", pct, 1);
+		execl("/proc/self/exe", "sched-cache", NULL);
+		_exit(126);
+	}
+
+	if (waitpid(pid, &status, 0) != pid)
+		return -1;
+	if (!WIFEXITED(status))
+		return -1;
+
+	return WEXITSTATUS(status);
+}
+
+TEST(execve_inheritance)
+{
+	if (!sc_supported())
+		SKIP(return, "PR_SCHED_CACHE not supported");
+
+	sc_reset_all();
+
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_ENABLE, 1));
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_AGGR_TOLERANCE_NR, 21));
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE, 22));
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_OVERAGGR_PCT, 23));
+
+	/* without inherit flags execve() resets everything */
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_INHERIT, 0));
+	ASSERT_EQ(0, exec_check(PR_SCHED_CACHE_DEFAULT,
+				PR_SCHED_CACHE_DEFAULT,
+				PR_SCHED_CACHE_DEFAULT,
+				PR_SCHED_CACHE_DEFAULT));
+
+	/* selected attributes survive execve() */
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_INHERIT,
+			    PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_NR |
+			    PR_SCHED_CACHE_INHERIT_OVERAGGR_PCT));
+	ASSERT_EQ(0, exec_check(PR_SCHED_CACHE_DEFAULT, 21,
+				PR_SCHED_CACHE_DEFAULT, 23));
+
+	/* all of them */
+	ASSERT_EQ(0, sc_set(PR_SCHED_CACHE_INHERIT,
+			    PR_SCHED_CACHE_INHERIT_MASK));
+	ASSERT_EQ(0, exec_check(1, 21, 22, 23));
+
+	sc_reset_all();
+}
+
+static int exec_expect(const char *env, unsigned long attr)
+{
+	const char *str = getenv(env);
+	int val;
+
+	if (!str)
+		return 1;
+	if (sc_get(attr, &val))
+		return 1;
+	if (val != atoi(str))
+		return 1;
+
+	return 0;
+}
+
+static int exec_check_main(void)
+{
+	int bad = 0;
+
+	bad |= exec_expect("SCHED_CACHE_EXPECT_ENABLE", PR_SCHED_CACHE_ENABLE);
+	bad |= exec_expect("SCHED_CACHE_EXPECT_NR",
+			   PR_SCHED_CACHE_AGGR_TOLERANCE_NR);
+	bad |= exec_expect("SCHED_CACHE_EXPECT_SIZE",
+			   PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE);
+	bad |= exec_expect("SCHED_CACHE_EXPECT_PCT",
+			   PR_SCHED_CACHE_OVERAGGR_PCT);
+
+	return bad;
+}
+
+int main(int argc, char **argv)
+{
+	if (getenv("SCHED_CACHE_EXEC_MODE"))
+		return exec_check_main();
+
+	return test_harness_run(argc, argv);
+}
-- 
2.47.3


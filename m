Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDCC3EBF08
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 02:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770257350; cv=none; b=mEIwYpvH9nJbGB3sOo5ZNlTehpI6OGe4CPrYH2bD4IYLNZh1Fw+azLTjAXydBSs9H/R1iD2nUNPDoUNWY5AzDOgO8kqvAqSdrWp3x94q6tsEJaNswTSiURkOoEn87FGwcT2GCwMHHBBvcjT0W/383B/MqNszud4eF2Gc09IPriE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770257350; c=relaxed/simple;
	bh=X2aFiO01Xw5u2hTsgLF52lwI82N8ITzn9ULd9Oux3WQ=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=GSKcZ7cLGf2mi8z1rakFrFsGuQOAp0xI45OKLnA80dcwuNKd0opiQaq4NPqYJVZYB9u1Otk7xDKXznRLfWklKKKCJPfkLSGdenood2FSte8dt+TsgPn5oPes3CK9VJb0jh6BqCBhzKUrQJ7p3Zj8gV+m48D86WtQuJqfsZJtYvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=Lp3Ecs5q; arc=none smtp.client-ip=203.205.221.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="Lp3Ecs5q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1770257342;
	bh=pGCAHk4dPntEKYsvD6msUZm89M+RyLEzt6O3giZaQDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Lp3Ecs5qYJo/SSKsiNqs/uvoAdU4HocGKn5bGpoOGu+JVUjgrvW+t2WYu9EMlbeHr
	 7SgFQppVl8qZLcfwyXyx8d40/eZ9IroW6DUXvAqziJ3FEzEC+V0BKiIQu70uh8eLCY
	 9hbMl/DgAU8HuYA6iBmnhMagv4q7sbJo3yXekh3E=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.152])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 239B1C97; Thu, 05 Feb 2026 10:08:57 +0800
X-QQ-mid: xmsmtpt1770257337t8fw46hdv
Message-ID: <tencent_7C6BB90BA288915B621CD975E9FC368FF305@qq.com>
X-QQ-XMAILINFO: NuWMYPidmbsn1v0giJIfZAfkVW5z+H9MQKwi+FCoZp2TgqYrUHstZA0ErGgzyc
	 qNZyiyqho7PmO6F90bp3wGUeDfTbDl3I4JJd0rgJgh39JRaE9YqHROYCaVRVGaLsHW7YaV/DiBWM
	 xX2RK9ARxCU+N8qVb3n+zH8c0CmPcczeYPcPLr/vF1iokNMXska9F1yJKU8mIfNQiVIrZgNKwCjq
	 vROvhfoecXKbqJZXAlP5H/XuHiofFqs4JQGyidkRRMBY99JOdq5xgJRr094ojYPoavicgTI1J2bE
	 k6gYG41QgCX2ilN007Hns0qglGFelLDJzoCFY4QZc54xc2fktEZoEygf0oFXlr0g2FJC4cSmPgDx
	 /RDqA+bf+Pr0H1p8oPiCxZMuw1auGrpY+Lva5u6KKMxPuZdRZFamkqPWPFVcTJdxHY3ukzbAQb+1
	 uQgFtJr2gHESZVLwOeFu+mW8coVx+Q18FgvcKQIqIcz2ssRnr+jBQOHCG9GQoVMcIw2m3tpS3fIL
	 5gvGvM7Ok5KLPgSJbxDca9GShGyxYqbTYpne5d67c/kYjzb1x27WLDnq6eq63xQCFAqe+SIesF3C
	 mNt3VNge5TrqDSVr28EBUGpSbvEdmWypY7ZrRp8x6ECiLo9c2Mhb9HAJppwNfXxCoTMQAr0n9o78
	 NslJNfAlBApDKD8sh35al5SsVMbQFJ1CHhfcm0C/P4Ckjxf0q3aFSXphGfiQKj4ZGWgTcpT8HCdq
	 1Wa56P7uO/RX8FktPdIr2e4ADGFBlopSx0j4LJCh0XMDtrmCkzH1mstQaMgGx+VPdWSWAv0VziuJ
	 QV1YzFvt9lb7KWO8MY3jm3tlW9Q5pkSIUTMeif0OcPBcMftIh0uWDxXUi9yuKLMtLB/LtfNkUWi1
	 XhU3thcXBL0MfPKzv4mRQCEyFkuYwkdyik/S3dTvetMkj2OwCx7WrerC+FYkcVxwkJPcJLoXQW61
	 vNqSpdaou9SZdqBUZOkIl6lkv58nRpsSc8Qpv4+gc99XksgCSnZ6HrKPBj+x2SYXxrk5Vbg9R0KD
	 idULTM+CGGSOCpTAd5BRTQuyAqpwfj7RT6G0H6Ewxbulf8g6Vzano0JoQU+HzcrcG+VbEhI1+x72
	 6uDGTmnIkLStNXAnQHQlvnptxJdkyJ3RmIFYIOH7z9ZyoVUnNEQeQLhqAUdwLjAZOyRkXfdeSXpx
	 8AODLPOxm5Fd5k++8qnc/9rCl4FsuhyKjQ+T3Hw+MtuGb95VWHExERkagQ
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: ywen.chen@foxmail.com
Cc: akpm@linux-foundation.org,
	andrealmeid@igalia.com,
	bigeasy@linutronix.de,
	colin.i.king@gmail.com,
	dave@stgolabs.net,
	dvhart@infradead.org,
	edliaw@google.com,
	justinstitt@google.com,
	kernel-team@android.com,
	licayy@foxmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	luto@mit.edu,
	mingo@redhat.com,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	peterz@infradead.org,
	shuah@kernel.org,
	tglx@kernel.org,
	usama.anjum@collabora.com,
	wakel@google.com
Subject: [PATCH v5 1/2] selftests/futex: implement the interfaces related to threads
Date: Thu,  5 Feb 2026 10:08:56 +0800
X-OQ-MSGID: <20260205020856.72921-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_35CFB8AE9D4BE7917D95763D15B972638C0A@qq.com>
References: <tencent_35CFB8AE9D4BE7917D95763D15B972638C0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are timing issues in the use of threads in some unit test cases
for futex. A potentially good solution is to check whether the thread
is in the sleep state after creating it.

This patch adds a file named futex_thread.h, in which several thread
related functions are implemented to facilitate the solution of this
problem.

Signed-off-by: Yuwen Chen <ywen.chen@foxmail.com>
---
 .../selftests/futex/include/futex_thread.h    | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 tools/testing/selftests/futex/include/futex_thread.h

diff --git a/tools/testing/selftests/futex/include/futex_thread.h b/tools/testing/selftests/futex/include/futex_thread.h
new file mode 100644
index 0000000000000..4f31299fe32c1
--- /dev/null
+++ b/tools/testing/selftests/futex/include/futex_thread.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef _FUTEX_THREAD_H
+#define _FUTEX_THREAD_H
+#include <stdio.h>
+#include <string.h>
+#include <errno.h>
+
+#define USEC_PER_SEC 1000000L
+#define WAIT_THREAD_RETRIES 100
+#define WAIT_THREAD_CREATE_TIMEOUT_USECS (USEC_PER_SEC)
+
+struct futex_thread {
+	pthread_t		thread;
+	pthread_barrier_t	barrier;
+	pid_t			tid;
+	int			(*threadfn)(void *arg);
+	void			*arg;
+	int			retval;
+};
+
+static int __wait_for_thread(FILE *fp)
+{
+	char buf[80] = "";
+
+	for (int i = 0; i < WAIT_THREAD_RETRIES; i++) {
+		if (!fgets(buf, sizeof(buf), fp))
+			return -EIO;
+		if (!strncmp(buf, "futex", 5))
+			return 0;
+		usleep(WAIT_THREAD_CREATE_TIMEOUT_USECS / WAIT_THREAD_RETRIES);
+		rewind(fp);
+	}
+	return -ETIMEDOUT;
+}
+
+static void *__futex_thread_fn(void *arg)
+{
+	struct futex_thread *t = arg;
+
+	t->tid = gettid();
+	pthread_barrier_wait(&t->barrier);
+	t->retval = t->threadfn(t->arg);
+	return NULL;
+}
+
+/**
+ * futex_wait_for_thread - Wait for the child thread to sleep in the futex context
+ * @t: Thread handle.
+ */
+static int futex_wait_for_thread(struct futex_thread *t)
+{
+	char fname[80];
+	FILE *fp;
+	int res;
+
+	snprintf(fname, sizeof(fname), "/proc/%d/wchan", t->tid);
+	fp = fopen(fname, "r");
+	if (!fp) {
+		usleep(USEC_PER_SEC / 10);
+		return -EIO;
+	}
+
+	res = __wait_for_thread(fp);
+	if (res == -EIO)
+		usleep(USEC_PER_SEC / 10);
+
+	fclose(fp);
+	return res;
+}
+
+/**
+ * futex_thread_create - Create a new thread for testing.
+ * @t:        The handle of the newly created thread.
+ * @threadfn: The new thread starts execution by invoking threadfn
+ * @arg:      The parameters passed to threadfn.
+ */
+static int futex_thread_create(struct futex_thread *t, int (*threadfn)(void *), void *arg)
+{
+	int ret;
+
+	pthread_barrier_init(&t->barrier, NULL, 2);
+	t->tid = 0;
+	t->threadfn = threadfn;
+	t->arg = arg;
+
+	ret = pthread_create(&t->thread, NULL, __futex_thread_fn, t);
+	if (ret)
+		return ret;
+
+	pthread_barrier_wait(&t->barrier);
+	return 0;
+}
+
+/**
+ * futex_thread_destroy - Wait for and reclaim the resources of the thread.
+ * @t:      Thread handle.
+ */
+static int futex_thread_destroy(struct futex_thread *t)
+{
+	pthread_join(t->thread, NULL);
+	pthread_barrier_destroy(&t->barrier);
+	return t->retval;
+}
+
+#endif
-- 
2.34.1


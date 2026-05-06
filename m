Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1023223BCED
	for <linux-kselftest@vger.kernel.org>; Wed,  6 May 2026 03:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778037912; cv=none; b=U+MqkaqIXTIHoj1VtifRqUQ+JOkLu+G8viTwxa0u0/f1bjt0BEsZNcg0gvfbWrOwIG4J0NBP6XQe+In7KGKohTUcVjPF9wMyYVe+7my48u1nmw1iE5SeqHOOA/Ht8UwFrLOAQXDI1s0vbag947vDnAQJnvi1avXkJ6L+eVa/7ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778037912; c=relaxed/simple;
	bh=KdlpfSzdLJS+ZnHAHkWjeMNR9b0/cOrGq7rjgLErlAo=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=XGqUyk8M6YLRqKqhSJXEW9eOUDhkJBDrqeqZDJ6eahoyfShwGUQ4CkeQeTgVMW0L6eDmEmlUUz9JIFiHhYORxmNfRg3ng2Mu8tC9HwnU0xQ1XQjvGG4ZjDFlJogtReHC9Lifk/UgEV6r/BJ/Cye1/OI8q5c5okRtMg7h1OCgAVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=xjEALyfz; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="xjEALyfz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1778037906;
	bh=8NGz/HoD6RdoWzonlE7LVL6nviLzdmhAaLYAVCOwKog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=xjEALyfzMDFcAbxKQwcoiP5kmLcit9WeEfaukI5SS7vAHLCK0xdakcGDm4Op9Ijl1
	 vCDuqjJt44Xx23AuT8djVMcLJmq52XO3MLCNUuodrzQc58H1kG35vHcyjclbFPvnr5
	 xEwerDD8KH2Ct6wFcFxHzpgWpoOWvrcwoYrhmFU4=
Received: from meizu-Precision-3660.meizu.com ([112.91.84.73])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 64222ABF; Wed, 06 May 2026 11:25:02 +0800
X-QQ-mid: xmsmtpt1778037902t57huedkl
Message-ID: <tencent_E9CFDBF2DCBE8ABA5C8A76B833C6795C1309@qq.com>
X-QQ-XMAILINFO: Obm66aqhQKBkoE5tQjYNTCKi8gk+9C/GXMNqepNnI6Pxb5QG9Qm0fCjAPl/sbW
	 XrV+2i8lGn5tdyxPvz+N/hbOrBMPxRZJFxBrZv4L7c88NIPR/o4ntUw9NDlM6zNKFCeEGKTsOzMr
	 kEcFfND+sqdj6aSBwOnPqcIIFeYYEuMnQ2vg2g7HUCokVflIuU7De8cVQTajAVP07FqKrX45bRR2
	 hw6Yq1/mUSkgXi0ckwBWgGlll9pv9b0NtY/BgHjBGsrT218U4ccQ8xXwYXxmPnobZW5TLX1vR/gC
	 v0z0Z3ndshnVqy1OtQh8+kWQJC6W//birL0xfy9tdrWVp/kXxy/0DSvhsifjtZVqlV7qPRYTiu7z
	 KKfsFmfF1OO7U53u+7saSNEdtfBOa5UpW6JadLB/mTaFcd29sTJMtUlKvXaeZV72IjbWubas0Tyt
	 zMPNON/OCXeB3piWRk0zeU4u9zF+eHr2QR0FVKFo4SV5lqtoHisS/Z0N8cME1Tw+BTQw9s1TdOp9
	 1C1n5IH0raKYNVatKPgTjqsRdZ++iIQisSruJy9+UViRME+pnimddYBydRKkACeAIdWIyqoVafTR
	 YWmH8TFcbiQC6yfkULbd1H1wGCMLn0IRjKSWQtIUmAt5Oivn9VE7UGnDlRKgEZlY77qyJs1OvEB8
	 GKlax6oV/qnHeIEgll46702xn1MT8K62t6BwfFgJhViOO+Fu2flbjpcgg86DJ//VvcNCQL7XqHia
	 2l+0tSBFgTKhVcw5VVx2Wrj3WtSpjrR98VFMaBD522dIgu/2WftQqovohJWacXTTHSYU30Osxv0R
	 eVy+WzDA8krh3NaDp6I7cYyizGBP8XuSz3Mbj/DoN75TKkBLlcDSjbhGYtl/ikgFT2medCSwUB4r
	 nysi5eKz2ILt3/sgFiAvOP6JPa5/VwLNv7V0NArmAmoL/55h2HBYgPiRzDe4PsN3IZzdjBBUQtPL
	 7xxOnxZbaOrDpNKEN8k+CpdNa39E3Nrr196atVjrOofdHM7AMQCFipPYAOrdNNfCrWsDlDgeRuUc
	 e/HtHPZTatSnKLzKFIIIV9Z5tGkhWd/iw2V+Lzy9Ij656d9S9lHmMeJn9vb9eYvmKgpJNRt0Sub+
	 2RYVNIWbayGgxoXDGx9VvdPKRuXu9eY3nTSj0MCLmxDX0uN3HgJS+T1y+ENYgKOBvTdPf5rCvJLR
	 sJ/A0=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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
Subject: [PATCH v6 1/2] selftests/futex: implement the interfaces related to threads
Date: Wed,  6 May 2026 11:25:01 +0800
X-OQ-MSGID: <20260506032501.3984323-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_D6D5FA3C2F6FE52BA6ABA1A88C1B6E1CC605@qq.com>
References: <tencent_D6D5FA3C2F6FE52BA6ABA1A88C1B6E1CC605@qq.com>
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

A file named futex_thread.h is added, in which several thread-related
functions are implemented to facilitate the solution of this problem.

Signed-off-by: Yuwen Chen <ywen.chen@foxmail.com>
---
 .../selftests/futex/include/futex_thread.h    | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 tools/testing/selftests/futex/include/futex_thread.h

diff --git a/tools/testing/selftests/futex/include/futex_thread.h b/tools/testing/selftests/futex/include/futex_thread.h
new file mode 100644
index 0000000000000..7520ea8e8f885
--- /dev/null
+++ b/tools/testing/selftests/futex/include/futex_thread.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef _FUTEX_THREAD_H
+#define _FUTEX_THREAD_H
+#include <stdio.h>
+#include <string.h>
+#include <errno.h>
+#include <pthread.h>
+#include <unistd.h>
+
+#define USEC_PER_SEC 1000000L
+#define WAIT_THREAD_RETRIES 100
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
+static int __wait_for_thread(FILE *fp, int timeout_us)
+{
+	char buf[80] = "";
+	int i;
+
+	for (i = 0; i < WAIT_THREAD_RETRIES; i++) {
+		if (!fgets(buf, sizeof(buf), fp))
+			return -EIO;
+		if (!strncmp(buf, "futex", 5))
+			return 0;
+		usleep(timeout_us / WAIT_THREAD_RETRIES);
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
+ * @t:          Thread handle.
+ * @timeout_us: The timeout for waiting for the thread to enter the sleep state.
+ */
+static int futex_wait_for_thread(struct futex_thread *t, int timeout_us)
+{
+	char fname[80];
+	FILE *fp;
+	int res;
+
+	snprintf(fname, sizeof(fname), "/proc/%d/wchan", t->tid);
+	fp = fopen(fname, "r");
+	if (!fp) {
+		usleep(USEC_PER_SEC / 10); /* 100ms */
+		return -EIO;
+	}
+
+	res = __wait_for_thread(fp, timeout_us);
+	if (res == -EIO)
+		usleep(USEC_PER_SEC / 10); /* 100ms */
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


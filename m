Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FDB246788;
	Thu,  5 Feb 2026 02:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770257207; cv=none; b=Fh06CaHYSphgsWX3fB2DJ1kXHl57TCAFwqFeqdkc/clog2YMGTLnZaaBBWDQTlbXk8SbgmmTDl5FzOVPRp8PckoSqkk59Jtdsa9w9J8g6nYRLGG02KLlzXKpPBO3fwIkKIsshNbisyEDTStyW0tdagtrf0NRi1FWnPz5IS0JhRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770257207; c=relaxed/simple;
	bh=X2aFiO01Xw5u2hTsgLF52lwI82N8ITzn9ULd9Oux3WQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=izXI4ibmYB+ojh/1spPvxshx1NioG5bz20mnPPo3UrkjNGOtVqDEmOr8Jl7kuNqQ5WcizvEAcTORYrBU8DleF3V1RLC4KG8Ibszvpne/jVQD+D7l3RSuGvv6MDCgsSa+BdDhDtmp1vLtuX3wKV8Nnca5Uskd/pngT48MYofbgfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=XnEceqn9; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="XnEceqn9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1770257201;
	bh=pGCAHk4dPntEKYsvD6msUZm89M+RyLEzt6O3giZaQDM=;
	h=From:To:Cc:Subject:Date;
	b=XnEceqn9RaispkYuUdO/3Ec1xZPHW9JpWfmNcTtqgfmJmS9hH4NfjPPztdq1wrpYa
	 0SoOSLKk41m2JC6qBPCYqQ3tOWuiDGIHWclsdghZP8vjOCdG/QoDTTwvffUGQ73Vcx
	 5MJXPm6eumsWVgrV8Oz4O01OKnSgQuQao5sZFZ8c=
Received: from meizu-Precision-3660.meizu.com ([112.91.84.72])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 15DB5006; Thu, 05 Feb 2026 10:05:29 +0800
X-QQ-mid: xmsmtpt1770257129t9vcjf5o0
Message-ID: <tencent_547122D7CA73A23CF0AFB22EF2226EEEB207@qq.com>
X-QQ-XMAILINFO: MAUQIEZVArhLgDSo6EuD9WGetoA85zUJm+fly8qFOKR8ZmbPo+YXZ1FJOeviuh
	 XBQjUxvYmxsfd8EkXO5C5DFMhdxhy6kP9OyS93HKboUfVxYEzPdcBo090t0lOzT6gtYozbPH+pKF
	 Y94W7laMv+9whC5J2O6PZmD/l+ivd/JvB4ji5Z01seLa7XiEdhBUixhMKSwcdOKsM+mfSh7eyOOB
	 F6D5zj2yXKlrMkiGtM+A1AjElZAWwSqac9mJsZF31o4m3emu3Fatbx9sq9XAnSoEuV2JM6aVWMtb
	 KBnobY2efKCFPR/Hr/v4BpNIKleI+6Yr7uOkf1CPcGywFB5T39w4RbEscdU0K8IuSpkROA4Q+xbZ
	 kxB3q9eFzxfeyFST9zg3svkgeOJEOHy9y9aaiwMFDf8JunVOYoCOyvCOHn/qRWsCY9QoUu29scHN
	 ecMOEFLLyyWNCXjGPsh1or3Q0C6OEj5DnU4mnD1Ih88yM1ze8UmJgMayET+wtlRx29bD4nVbqVZQ
	 s7+nhIMNQ0IxUFugw5QNZS8SJkqO9xYgRFgw2r5YxiLXBhZ5xTKJYWKgdjHWVPACC4LhMZrFIiBl
	 N8MrOBhU8gxcS+v+OvTM6OWMTLBtVhADhEObt2mXd7ZySTM7F2ywIlh2znZMhJ+rBtwdq8fISJoD
	 q4gbLAg7ixlWxc6LqoLzqenLl1m+VcuEj6Bo3Qs269St8lwtYJRmJ/8LHD9nS9nAiedgAbNqWhXV
	 5djom7mXLZMN4v8Z8FYyX/i6DSMWN/8icQ546Ny1BX1ACbxcxxyDgkKsRBdJt8Jb2EAEiY6UxJRq
	 LFzFgOAf9uZwOwrg19ivkniZwvJqyHYkFa7u2iuNHK6suHXNPKho0hWhcbyJX6fUVuXiUqgODXK6
	 xl1AYAFCPxae3HUkb5vqxMM1xqTNSTiS5IJadTuxc/oBJjolFNmjs3VsHdRKUbQvBLO2yv5R0p5c
	 u4Rv7pjFn1AGJlPHDxj51EBEGvPiX49a7HPgGbt7L1S4+P4ztrwxpR6u0c/h8m2CMvpWQWo7JfTs
	 7KpoQmbZpmoVvcrHR+FiwhZGod6ZOhYGOolB81i3eR32FxoitTlLhszM8/Xhr6O+6aVdUm7tO7Uq
	 f1fopi7MfhuFpsA7Q=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: tglx@kernel.org
Cc: ywen.chen@foxmail.com,
	akpm@linux-foundation.org,
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
	usama.anjum@collabora.com,
	wakel@google.com
Subject: [PATCH v5 1/2] selftests/futex: implement the interfaces related to threads
Date: Thu,  5 Feb 2026 10:05:28 +0800
X-OQ-MSGID: <20260205020528.72836-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
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


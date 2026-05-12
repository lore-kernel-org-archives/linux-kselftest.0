Received: from out203-205-221-236.mail.qq.com (out203-205-221-236.mail.qq.com [203.205.221.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B1A47CC80
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 07:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778570013; cv=none; b=VDhuk9XkU84C5coYqGjUiZV1shdLjbNXPMwstV8g3hiFDbdlLfb2Aiob2US/Xyojc+m394Y3EYgWgVc2Ocb+PxHJDy1FtgECZ9YFMMSe08yyUVxhiCf3v9kLkO2r+2QfsJohVcLnBXwgFpZm717vzgb/QLkCbpZC0uwUcgz598Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778570013; c=relaxed/simple;
	bh=HFD9M5t1P4aIhMmAv30q0/GRAkcUUMoFUh+ZZ5DqTwY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=JO4/lMzpc2fNt37cPhNORuYI5ald5/K8Uoy43IiQqJ1f0uWb7GNQ3VftYIA68xT7ap63MXvupsB73O3nL81ofLyGllkni76JoBV6o5AfdpRTjsJSthwTcWC+AqHRAK9eElmsuZSS8Ewqn+T+0gVaHNvlebWqdCQ6GzLbqU16JRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=Mh2Qnky+; arc=none smtp.client-ip=203.205.221.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="Mh2Qnky+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1778570000;
	bh=Lkc4p2kMOO2gidUulgWb5kkE5ShGQu/O14IAX3jTqVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mh2Qnky+vQozPss8JgO+rLTArPKAd8eS05a3svBzoIMcHh3QOSfY44K1+340ivkZi
	 FpdTOg5aPhu9Dmi96YQB4DKmWfhw4H7nyOfd9Cr2GY9i7mXZTcQgwbZ8614HnjIhg8
	 BNVrhSHZETVgqDVcqMm02eJMBuMvcjhlYE+tkwl0=
Received: from meizu-Precision-3660.meizu.com ([112.91.84.73])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 350AB046; Tue, 12 May 2026 15:13:16 +0800
X-QQ-mid: xmsmtpt1778569996tblhq1jbl
Message-ID: <tencent_F5BEABD979711ECA5778D74CD11337E1B806@qq.com>
X-QQ-XMAILINFO: N7IHLsEATiKziGWcPfl1eNrOtr1OIwpeID8ic6dnPy6XT7jYTa4tbiMcFgzD40
	 87xmKwuazzVgKlPAVlEwEiwbakn4jarfUF9ZPwmrD9rt1f0Tv+dIj38Vk7DvggNB9VvnO8/uXIpU
	 xqTxn6/qPto0yhS0j+vrDHduhjnyVsW6TSxCcmTXV6Ry5EssCpwH9cfwjZg59i3FrKvEjQdV18Im
	 q0hZDulzb6V+pTlyTNL+QyKe4On8g1S/jKuBUTosCpYWvZRk07F545SR/YLiTEM0YtepGhGPoxd7
	 P0uvGN82QRozLabQb3drJ2a/UWDqpVdNKajQLuovOtKMNTuw7akeTLcEwXS7QFYOKCxrRvBSBnZD
	 wmMkqr7f/QF7bdrmP6I156OI87ycPJO5gTvKqbPCK/llX0c8MzQ3uxSdE8XL3b3WIZj4WBfJ4Vm3
	 goTnO4QdMf381eVusCcFlDZgZayvfmt0n7iODAH/UAs40sbqSDiATNwl7om1EAaoaTessBNIFGUL
	 xET1IYJqTh7Y6Zk0x453oIIuYaCT/R2njI95Rc7pXiv2/7n4OaOoMfZhRBsn6QzLnL6/waa+PQyP
	 ABB5+NkQnpDf1H8+wMzCtSFU9gcMv6sv7D+5MTab5vWpU/yFtH1uhyCWKSh+k8LCu4T/6AUMx1eG
	 BZnsZuRF4eX1Uh6RIgMp8h3molUi4YG6gyqfar2zTYv+iGqIE2s34t+UfFsbZQwM2rtZEEmin6em
	 9Ufj9oCabYLkSJ1sJpsZ+hnLU04nGjXNApTPg+u6kgSx9VV6M/kKbGlEiaEBO/h4EMnAFtY/a5ue
	 VIWdfr7FNAF4y4nmYf5F/35iSZXAK51+Ee1XhSi0w4lqh8O6+DClN8Ho+FJU57t6Scsz/sDwZGul
	 ps75PdVfHfve3EoR6OCD2usZmB03bz1yvlqTytNta+7HqJCjiZcorzP+dlhdAd1TOSTAFlH2cfWA
	 MBVrfHrXwSyJGjh7Z7NbJmjlbEe5pANJPiqUKpu3blD+qi7eHpDGAHf0kaQxKgzZpUf10bKlqQSw
	 blBy/F4iqU8nt5vmt/1YlNh3R08++K/5PfVwFaUWQvBLvPXaq+sQ/jTondsW33plj7B7ZJUhj5oH
	 OfmHaLVwMgET/6neMGPvJIbnsWNym2BJNGqRHn90qHcSYPnHM9KUrfI9FpDg==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
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
Subject: [PATCH v7 1/2] selftests/futex: implement the interfaces related to threads
Date: Tue, 12 May 2026 15:13:14 +0800
X-OQ-MSGID: <20260512071314.3105991-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_0C775F885D7D4560DC59E359AE7DE74C7908@qq.com>
References: <tencent_0C775F885D7D4560DC59E359AE7DE74C7908@qq.com>
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
v6->v7:
    1. Changed `static` to `static inline` for all functions to prevent
       compiler warnings about unused functions.
    2. Added `sleep_time_us` variable with zero-guard in __wait_for_thread()
       to prevent tight loop when timeout_us < WAIT_THREAD_RETRIES.
    3. Removed fallback usleep(100ms) from futex_wait_for_thread(); the
       caller is now responsible for handling errors.
    4. Added return value check for pthread_barrier_init().
    5. Added pthread_barrier_destroy() cleanup on pthread_create() failure.

 .../selftests/futex/functional/Makefile       |   3 +-
 .../selftests/futex/include/futex_thread.h    | 114 ++++++++++++++++++
 2 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/futex/include/futex_thread.h

diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/testing/selftests/futex/functional/Makefile
index 5c1c824f97400..724e8216e41b1 100644
--- a/tools/testing/selftests/futex/functional/Makefile
+++ b/tools/testing/selftests/futex/functional/Makefile
@@ -11,7 +11,8 @@ endif
 
 LOCAL_HDRS := \
 	../include/futextest.h \
-	../include/atomic.h
+	../include/atomic.h \
+	../include/futex_thread.h
 TEST_GEN_PROGS := \
 	futex_wait_timeout \
 	futex_wait_wouldblock \
diff --git a/tools/testing/selftests/futex/include/futex_thread.h b/tools/testing/selftests/futex/include/futex_thread.h
new file mode 100644
index 0000000000000..49ae687012fe5
--- /dev/null
+++ b/tools/testing/selftests/futex/include/futex_thread.h
@@ -0,0 +1,114 @@
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
+static inline int __wait_for_thread(FILE *fp, int timeout_us)
+{
+	char buf[80] = "";
+	int i;
+	int sleep_time_us = timeout_us / WAIT_THREAD_RETRIES;
+
+	if (sleep_time_us <= 0)
+		sleep_time_us = 1;
+
+	for (i = 0; i < WAIT_THREAD_RETRIES; i++) {
+		if (!fgets(buf, sizeof(buf), fp))
+			return -EIO;
+		if (!strncmp(buf, "futex", 5))
+			return 0;
+		usleep(sleep_time_us);
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
+static inline int futex_wait_for_thread(struct futex_thread *t, int timeout_us)
+{
+	char fname[80];
+	FILE *fp;
+	int res;
+
+	snprintf(fname, sizeof(fname), "/proc/%d/wchan", t->tid);
+	fp = fopen(fname, "r");
+	if (!fp) {
+		return -EIO;
+	}
+
+	res = __wait_for_thread(fp, timeout_us);
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
+static inline int futex_thread_create(struct futex_thread *t, int (*threadfn)(void *), void *arg)
+{
+	int ret;
+
+	ret = pthread_barrier_init(&t->barrier, NULL, 2);
+	if (ret)
+		return ret;
+
+	t->tid = 0;
+	t->threadfn = threadfn;
+	t->arg = arg;
+
+	ret = pthread_create(&t->thread, NULL, __futex_thread_fn, t);
+	if (ret) {
+		pthread_barrier_destroy(&t->barrier);
+		return ret;
+	}
+
+	pthread_barrier_wait(&t->barrier);
+	return 0;
+}
+
+/**
+ * futex_thread_destroy - Wait for and reclaim the resources of the thread.
+ * @t:      Thread handle.
+ */
+static inline int futex_thread_destroy(struct futex_thread *t)
+{
+	pthread_join(t->thread, NULL);
+	pthread_barrier_destroy(&t->barrier);
+	return t->retval;
+}
+
+#endif
-- 
2.34.1


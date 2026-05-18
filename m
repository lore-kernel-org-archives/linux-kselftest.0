Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1479D2DF6E9
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 02:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779070615; cv=none; b=sX8qzfXnVbM+04N7/7gBwi5DJWpOC6QSfm7d3nIYJh7nvIRvvZxlDdqeM8VcfMlrFa1xKp0lDm3x/2N7azcgeoEWodpJfGlqtWqWDRoNrAX2upq4EVnukGnXXAoXGpBfOPml0hucbQ46uCdIyIgwQ+hjclETAFP9V4Y1feFYdOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779070615; c=relaxed/simple;
	bh=D2XPhB4t7SdSvpZyS8CbT4SxHBam6QagXIpE0qa8t7Q=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=DqKPHnq+KwNZ+DbZp+imm3aMKGmANYUlkYWuZvNUNIWlyi4dCfLZiV6g7cRSaNIIkvUMtyPg7oH7OY0fN6gLdLKJ642rue1MqTu06fmoOuuzD5u317MwVXIt1ulTwmiu1fSHSaM4X/tL/gcg/df946BP7+lpqRYRT2jTsXE3kJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=lnHqXfbY; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="lnHqXfbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779070605;
	bh=3Em7e9AKHtqBdVL7JeC4OerFIv/XC0EWeNGtGktKRrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lnHqXfbYOeBk8CFjGbfhz5QyLhmzdUXaew/KEoD680t82FoLq08UgVKRtVva0D9RN
	 cL38QTNj10TLW1Wzdq/btxZBvENFldfO31eNGBbiLovu9zlPhRjGibFdFZSJaKx3xH
	 DEf7e4Gjbh3x+Hcbnl1r47AY8Sd+UZMK7tV5ysP4=
Received: from meizu-Precision-3660.meizu.com ([112.91.84.73])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 429A827F; Mon, 18 May 2026 10:16:41 +0800
X-QQ-mid: xmsmtpt1779070601tkhm5oe5u
Message-ID: <tencent_4C90BE98BBC48B38B9FBC6A95C45CF49F309@qq.com>
X-QQ-XMAILINFO: OTdDBJCpIhk9pa2jx3Og2KXRtYXRrN/+P1oqYyvfkGzg2BYKFa/P8A4DgStuTo
	 l0pCaLM3anLEIGHcHPXCUIxYDPEOkBofPFMU6zD29pDREIT0m2edOsEYvm66k6bakHWxQGt8bL05
	 IgHXMeFR5zzwkHYMBYEIX9YB5ZbiRGtqk4E8KJVhgCRXKVpN1kJ14flMs0xwROM+wkjT9t48p0gG
	 MVEfG7VIVlRyXLgdRIZxRcSGtjCsN3B93oXaNb+34lgIcQcIfztGNqTBHPZreanFXGFfmc+FBqjb
	 xmwckCP8qrktUoaeH5DYXVXPwYJKELtztWnxKpGnhCyHigivpJ9oOvDlBv8vC/Bn4C2yIllxVo3t
	 e075OPUzDUkxUGQB4B6pVkQV90FdVzAsxpPq0dKZ9q5t2UNuonQT1RPprGpTwj9MGtwhtHYM+aho
	 FxNwnLcnXiogCUnpucqpXpRD5Q7sMyGlb0EEJVNlOF29IjVYUbSm1sERQAOXufMj1qtlLp4Bbp58
	 NyFt/v6yEm44qq9vHjeb6vJNi7flogjZplpv3tDZChVt38FGaxL0iiZrGbR84No+igX5N7qyhbs6
	 iY7/eCfHGs3g60wsgwi8e2TddGdfLMH6H4t2yZC5WJPTTtX1UjgxD8GyRdPxSRc+t4xwvoRLnV9O
	 JAmxugMa0YTXOAIcZPku+liLZdB/MWtRvTnBAkihazDonw+I4Uwhmnkm/tDV9SpW99MjIbtg+c9z
	 hgpk76qE53bKyIZBCJ4Rx/5Wwrj6eqy4Ft9dvFt0uGIEuUal7qCnRuBwcOH7b12zTNPMf0oTuk/0
	 7+EKTYK2RynsrjELEpG19sUsiS3y6j7itnFaphS9GqOcOghZwb7cBuHNaMUx6lbI4Dsbmeh24iZL
	 PWh95vmXHlOwfmr/gICBam8hg0G9INByNeCT9b4c4qPB3+YeMx0eaxn4SHCyHKc53HcmH3ZTWeZq
	 LselztCQqz9vzAMn3Ep2cgvQBSX/wCaUPT+xd2miL4M7fepsVxzFM43OrXoEmK6UchOsNXc6/Fvb
	 LIriNJaWGpwMcEX7drJtrcrjKthCj8T4HQrOw/cDgKVrDv0ObxEWBcmWlVCfQhFsZjTbzaWAVL98
	 UxEgDiGfoktrZKB3E7kDgDmsbRw/2OYJlwmUvAOCByUOp8LCon4zu0AnwatTFJ3j/5GJpI
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
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
Subject: [PATCH v8 1/2] selftests/futex: implement the interfaces related to threads
Date: Mon, 18 May 2026 10:16:40 +0800
X-OQ-MSGID: <20260518021640.283725-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_A68F2BD3395C9EFE1759975A511BB7D9F806@qq.com>
References: <tencent_A68F2BD3395C9EFE1759975A511BB7D9F806@qq.com>
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


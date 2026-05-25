Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FC639A80E
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 09:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700810; cv=none; b=IOZc8WQY1/rVJiDmSKMo+did78+VbobhT8ObkVw5e1KG8GxWXz1CXdSSzIMDBQQtwcCjEeKI72yxU0dMh3yGmitOhK6zsz/E22dSOEa/vfWLi7viXq87f9KSB7orDKPOjq+WTkb0OLib4T3/9efEJsjTAMsvfdrUVD/EeU3e6zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700810; c=relaxed/simple;
	bh=kWqFkiHe76KEg8h6wRQq06fEaCSgYX8ATRUxr7MIA0s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r1ZgJIYskbPB36PzMBnuDNIwKNdpXxiXbAAhcT/NQua+UQHueiSGbc0gU4pK7J42xZFu5VqcFID/7sj7J9RZG1nsDNXzmF6KXFcjuvUpIQnt2bfmDbUB/6KT3EiyGL/qo6PpdZeST64R1kmAo3WV1OPNUxCNxnmsuwWPDUsJBM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IC7n2kXl; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IC7n2kXl"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c828f0f5c23so4465936a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 02:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779700809; x=1780305609; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vHJboG/TgtXeVPCljhjnqt/N6w+2uxNP4jcRivG2kgc=;
        b=IC7n2kXllhp+oVIhKoF+VezO2kAKrhM0iJ79MORnv+0s70DxNGZcgnqRDMl5ZLPwnt
         L5PpvAaAflEgzUokd5DPAKRzm8MQQ13M5ypT6q/RhpzpQodp4C9UmomVMke//eVOSh3U
         LQwZjBRcmmF4VPN6q+Fb+N0E9zN8UvndeZhsY6I9TZa0rOpHaDQ91NNoSeb2mief54yR
         ZYvk/4nrLfhnk+14maq4UF/cqt2XKPD6FReIkZa367zIIWE5lU104/vPV3G3ybNfQ/NW
         Sd4g7WqMqkjJglhmF+825Tmu8xta/BnaSvQTyapu2DZLCLXjMiZEPcVKpISwzS1/Wgkt
         Lhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779700809; x=1780305609;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vHJboG/TgtXeVPCljhjnqt/N6w+2uxNP4jcRivG2kgc=;
        b=Q1yteeuzoZ5CJ88+FdF3x/Q24QxFaHzvtEa9+SWwuZGZFq5XraorXInSe+rdxW8A4J
         1ldRzcezXOdbKmirQJQaPsYYSDGLS6AQYIuUDxDEPWVg5ndKhSIbmOWhbfTuCItLMJQI
         uXvfja1bR9P94T/i83dfvjl9638jvFgBKelhzRQmDF82g1XLC9kV7HQMwON4YlNF9Hy7
         KcTUA8hS3iFVBu9GnhIu+KH76br9Oo89jqVvAQBEjJUyUPZ7v/4Z8/RXc20dZia4dwaK
         Oj0BCEgCPkBh7VQacFSAlNcmDeGHr7DJ9mQtUPYwT9LIWIXYlq4876Tcz3RhINsRYRC6
         A3fw==
X-Forwarded-Encrypted: i=1; AFNElJ83ot7BzhNvrylEmG/RO/shMzja8wIzxEwtz4wkFuRCGK3NYObT02lxR+ywV8KbTOyayfVR+n2Xvj44zq0cj24=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuZW9QYBEv1k4d7/2+eFc6D+yUc85PqxuD97ofN62ILExF+77o
	eCn5a5NBC1LAhwdRrDbizwW3/IL8Gmxrtdwz1beHQcajZFuP9vF0KVVqa6nv6KYYuDIoHI8kq9I
	lAw==
X-Received: from pfbfp6.prod.google.com ([2002:a05:6a00:6086:b0:841:9a22:890c])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:430d:b0:829:8a84:b9fc
 with SMTP id d2e1a72fcca58-8415f0ebe54mr12973292b3a.8.1779700808265; Mon, 25
 May 2026 02:20:08 -0700 (PDT)
Date: Mon, 25 May 2026 09:20:01 +0000
In-Reply-To: <20260525092002.3762888-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260525092002.3762888-1-wakel@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260525092002.3762888-3-wakel@google.com>
Subject: [PATCH 2/3] selftests/futex: Migrate futex_wait_private_mapped_file
 to harness
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	linux-kernel@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

Migrate futex_wait_private_mapped_file test to the kselftest harness framework,
removing mixed legacy ksft_* API usages and passing test metadata to helper thread.

Signed-off-by: Wake Liu <wakel@google.com>
---
 .../futex_wait_private_mapped_file.c          | 26 +++++++++----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c b/tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c
index 2a749f9b14eb..b4d0502a6611 100644
--- a/tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c
+++ b/tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c
@@ -26,6 +26,7 @@
 #include <pthread.h>
 #include <libgen.h>
 #include <signal.h>
+#include <string.h>
 
 #include "futextest.h"
 #include "kselftest_harness.h"
@@ -41,17 +42,18 @@ struct timespec wait_timeout = { .tv_sec = 5, .tv_nsec = 0};
 
 void *thr_futex_wait(void *arg)
 {
+	struct __test_metadata *_metadata = (struct __test_metadata *)arg;
 	int ret;
 
-	ksft_print_dbg_msg("futex wait\n");
+	TH_LOG("futex wait");
 	ret = futex_wait(&val, 1, &wait_timeout, 0);
 	if (ret && errno != EWOULDBLOCK && errno != ETIMEDOUT)
-		ksft_exit_fail_msg("futex error.\n");
+		ASSERT_TRUE(0) TH_LOG("futex error: %s", strerror(errno));
 
 	if (ret && errno == ETIMEDOUT)
-		ksft_exit_fail_msg("waiter timedout\n");
+		ASSERT_TRUE(0) TH_LOG("waiter timedout");
 
-	ksft_print_dbg_msg("futex_wait: ret = %d, errno = %d\n", ret, errno);
+	TH_LOG("futex_wait: ret = %d, errno = %d", ret, errno);
 
 	return NULL;
 }
@@ -61,22 +63,18 @@ TEST(wait_private_mapped_file)
 	pthread_t thr;
 	int res;
 
-	res = pthread_create(&thr, NULL, thr_futex_wait, NULL);
-	if (res < 0)
-		ksft_exit_fail_msg("pthread_create error\n");
+	res = pthread_create(&thr, NULL, thr_futex_wait, _metadata);
+	ASSERT_EQ(res, 0) TH_LOG("pthread_create error");
 
-	ksft_print_dbg_msg("wait a while\n");
+	TH_LOG("wait a while");
 	usleep(WAKE_WAIT_US);
 	val = 2;
 	res = futex_wake(&val, 1, 0);
-	ksft_print_dbg_msg("futex_wake %d\n", res);
-	if (res != 1)
-		ksft_exit_fail_msg("FUTEX_WAKE didn't find the waiting thread.\n");
+	TH_LOG("futex_wake %d", res);
+	EXPECT_EQ(res, 1) TH_LOG("FUTEX_WAKE didn't find the waiting thread");
 
-	ksft_print_dbg_msg("join\n");
+	TH_LOG("join");
 	pthread_join(thr, NULL);
-
-	ksft_test_result_pass("wait_private_mapped_file");
 }
 
 TEST_HARNESS_MAIN
-- 
2.54.0.746.g67dd491aae-goog


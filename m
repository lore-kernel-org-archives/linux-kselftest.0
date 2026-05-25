Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873793DF006
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700812; cv=none; b=La7BQUuI7hOvPh/cuigREx3yCJHrqED8xf9yMeINVrwFB2u5sK8/JSTcM345YRSrKxXhtDGhnDiZlRmoJvaiuPk8wVVpGYLQnoDxl1c3zZ9R48wkkO8fQQCnAqYG5uHwkKb03Ur20rKk7s0XbJvpYLYnb5kmDgjmZyWLJiYBAUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700812; c=relaxed/simple;
	bh=UjNgp/l8IfR0ufhjmYSDKZagxt6lpAcyv8eIgEIuRv0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gJDv+HdPaT09jOwJX7DsO1Z/co0YasA87E+DvLyLYi806ibRs9YEXGUJZSZ9dsyzef7GtIMqZMQSMJYntKI+hFfUyLqkC1FjY9tTjHa4VuQa6Y+vQgwu9ywp6r2tOjt57GXrZFeTxBLhxm4Q0loTn0Q7Wizq4Q5NQv4otWNKOAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L55d9ODM; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L55d9ODM"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-366122e01fcso9203951a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 02:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779700811; x=1780305611; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YxamJpJTdi3VHVTfOnkpOEJCHh7lF42Wf7zmG8DNdAg=;
        b=L55d9ODMw4kDCS3v6p6/qy8EngsVr+wPMMAjJQhzu6Ku49zoTEliA012PtB81fe9Ew
         zIeBVbW9p5TYGCfUuExsiDkzhFpcq0E/hJwkVOvA0O1yj7yTC6Sm/ps5A/H4gkXFbfU7
         1hSXbFX6KxO9KdbOU6ebj4avn004DrV7mOU25Jfrw7tNZZ4B1hCbXDcS8edv2m0/MXmE
         9DD9Q8dXX8Zugw4gSVUY7npPE/yRliifzjqseFgLRObKSYFfDDVWCRsadYFTZCEewIc4
         3ODx9Z/PzY8fB7g8FbkJ0C+gL6cDIE1eliQ0vpbgDAzcoK55hDQA1afX2yYJb/AA2FQk
         GtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779700811; x=1780305611;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YxamJpJTdi3VHVTfOnkpOEJCHh7lF42Wf7zmG8DNdAg=;
        b=a+jnhbEnuA9lcf9zlY+4susinPnBQtXa+DCTSjEhty4EahAtQ1t9vXrTs1amQ1aWfU
         9ZCW1khHwz0GUFKM34ZFDEg61w2fUpvaA8bh8NBCp4gasZBzyRCNC1HUompM+XuftmRH
         inJfaAxofRc0srW+o5eV6ctzVKom789SEZzG2i691HJfpgeRC/jY/Qp2Mi/V4PRP3zIW
         B7JuiaOn18zL+rk69Fy6L5YepFWG60K8pPydKPdsVTTjgE1cxPCoXQ4yvf2LhW0uOY8+
         AvmJ+IuQdEAsv85IRvNK+Zy2DFVbifgYkO5PkXDbHqXs8Na2iwJo0nvTa01SNrmSFuXM
         YCgA==
X-Forwarded-Encrypted: i=1; AFNElJ/anQmE1khXf/1AAWVM+N0QeGcv2xGczdzrPaMqRh+QvxE0S4M/OehKjGLisjqdSbbqKmJMnJgqWnmwXG6pfaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxxR7jkxujqlwJL++LOFuYOjwm+RJ42qXdn1SaRiaJ0tgHxrb7
	94s5CUy3FG8HMAdGtYdzBbVOQuiCAF0CJKyUmaEpGj1tJ2FOTtaiX0b1iNXkLJf5ZHgBDy0XgPB
	ZcA==
X-Received: from pjbdt2.prod.google.com ([2002:a17:90a:fa42:b0:369:be75:6dd])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:380b:b0:35d:a3b4:2f0d
 with SMTP id 98e67ed59e1d1-36a6773cb46mr11796036a91.6.1779700810665; Mon, 25
 May 2026 02:20:10 -0700 (PDT)
Date: Mon, 25 May 2026 09:20:02 +0000
In-Reply-To: <20260525092002.3762888-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260525092002.3762888-1-wakel@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260525092002.3762888-4-wakel@google.com>
Subject: [PATCH 3/3] selftests/futex: Migrate futex_wait_uninitialized_heap to harness
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	linux-kernel@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

Migrate futex_wait_uninitialized_heap test to the kselftest harness framework,
removing mixed legacy ksft_* API usages and ensuring proper thread joining.

Signed-off-by: Wake Liu <wakel@google.com>
---
 .../futex_wait_uninitialized_heap.c           | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_wait_uninitialized_heap.c b/tools/testing/selftests/futex/functional/futex_wait_uninitialized_heap.c
index b07d68a67f31..ae1da2c6c8ad 100644
--- a/tools/testing/selftests/futex/functional/futex_wait_uninitialized_heap.c
+++ b/tools/testing/selftests/futex/functional/futex_wait_uninitialized_heap.c
@@ -28,6 +28,7 @@
 #include <errno.h>
 #include <linux/futex.h>
 #include <libgen.h>
+#include <string.h>
 
 #include "futextest.h"
 #include "kselftest_harness.h"
@@ -40,6 +41,7 @@ void *buf;
 
 void *wait_thread(void *arg)
 {
+	struct __test_metadata *_metadata = (struct __test_metadata *)arg;
 	int res;
 
 	child_ret = true;
@@ -47,7 +49,7 @@ void *wait_thread(void *arg)
 	child_blocked = 0;
 
 	if (res != 0 && errno != EWOULDBLOCK) {
-		ksft_exit_fail_msg("futex failure\n");
+		EXPECT_EQ(res, 0) TH_LOG("futex failure: %s", strerror(errno));
 		child_ret = false;
 	}
 	pthread_exit(NULL);
@@ -63,21 +65,19 @@ TEST(futex_wait_uninitialized_heap)
 
 	buf = mmap(NULL, page_size, PROT_READ|PROT_WRITE,
 		   MAP_PRIVATE|MAP_ANONYMOUS, 0, 0);
-	if (buf == (void *)-1)
-		ksft_exit_fail_msg("mmap\n");
+	ASSERT_NE(buf, MAP_FAILED) TH_LOG("mmap failed: %s", strerror(errno));
 
-	ret = pthread_create(&thr, NULL, wait_thread, NULL);
-	if (ret)
-		ksft_exit_fail_msg("pthread_create\n");
+	ret = pthread_create(&thr, NULL, wait_thread, _metadata);
+	ASSERT_EQ(ret, 0) TH_LOG("pthread_create failed");
 
-	ksft_print_dbg_msg("waiting %dus for child to return\n", WAIT_US);
+	TH_LOG("waiting %dus for child to return", WAIT_US);
 	usleep(WAIT_US);
 
-	if (child_blocked)
-		ksft_test_result_fail("child blocked in kernel\n");
+	EXPECT_EQ(child_blocked, 0) TH_LOG("child blocked in kernel");
+	EXPECT_TRUE(child_ret) TH_LOG("child error");
 
-	if (!child_ret)
-		ksft_test_result_fail("child error\n");
+	pthread_join(thr, NULL);
+	munmap(buf, page_size);
 }
 
 TEST_HARNESS_MAIN
-- 
2.54.0.746.g67dd491aae-goog


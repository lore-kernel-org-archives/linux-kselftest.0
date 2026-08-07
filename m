Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D623A83B1
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 08:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092615; cv=none; b=jLAtathO0Rx2qfS3zjSmXfp6g10miVz4zHtCbri79aDPHVqvpMZ1sumTqyonncOzdYkZHsDuOeIxzOiSM6HX2vC6vrHvepi2wXE0P2YW//ma+JVyM4sI50ZC0rvHcPSIvHuyWLgTADEX/aWWbgjpvLQ79g0tIs4fLVqb569aaWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092615; c=relaxed/simple;
	bh=CTQZsGDI9TPZjkUIpf8+5qwmQrcb3M446ixCQasL3Os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kwxUX8MyFq1VzhzN3qJcC6Wwek7+Zk030lc4FaJYbwowpp94ZBEpx48jTAZjzZejG9hs49iMsmQsGQV4C6+Ut/sp4sANys9yS2OxJCAzaEWkfj9WP/DkbZW8FNSmLKIFEx9DYUtxOii2Hu1SczSdl93LaNgqu/ickxYTCx/wl14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ika3O+Xd; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ika3O+Xd"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ceaf8a1265so46025715ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 01:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786092614; x=1786697414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IFdBh9N9nroM19fp325fQEiej14i8CjED2CqbjDJhhw=;
        b=Ika3O+Xd4FLNbzziWlxZ++rQs2pvvzxDCsEdgHHWMdgrNBHWhOOPbNlnVE6ShL3bXJ
         MDq3HKp/sjYn7AWLTAp3P7KwU9ebLVS3eWesFWVn951LkXzDyxrDIyYeQAeVLvtslXmY
         rOsHQo3G5ZUgsY/Uurc6K+F8wXMkczq2b0dNLrPf4QmSHPAnuYPpoWTGKYKf3xsz2fup
         gVzodzaQcJZ2uC/VXKwA1Ew8dSyJR3w0C7MvwkpMMfqJJJM06DR88YxwO2fZyjen14xZ
         YalUUcBGLEHX8Y1ihTAUqaUutY0ikrc0cp3ZlcQ1IU7YQoop7IeYqdfW1Lfk4YdNqf94
         Y//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786092614; x=1786697414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFdBh9N9nroM19fp325fQEiej14i8CjED2CqbjDJhhw=;
        b=JL4uNs65P5XZRP+PVqUgwCIKeywm7G2B6sYVyiUkqPmjqrsddxh9orHdnOl0lusGNO
         ECk3EnCaQglob20hhdUs2KByq6KOST2G4LsrO+2dO6I541ABCnrvpeIfVj4kH+VnoSqq
         Vwfs1oZUHMYcTPP/x1E/YUkhITUOhJvhHkUr6Sf8SpKfUWhBYUWfRC+P/Ajy7hFInAoB
         BuyBfNvKtcndeSG/UhET/fsorkI2QxPKL0i3WVvBVxowgSTbGT6kJT83+OPHkVC7OCMJ
         qOItZCGOWwxiPW2hUYF2bozjAQBd3M4ead+fg4qCPUUG/bKHXrBNXeaSXywPp62jHpf1
         qmcA==
X-Forwarded-Encrypted: i=1; AHgh+RqNGO6wjXEFeJ28VIsa5GtmBwMDuivwQxB91L6MTjy08ydYBvzm4sasCwHv3NikRGfhyJu3i7L9ecv5lE5iEmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBbgGupgbrCl57RFu4HHrao7jw/JhN7IFS7n4Sr4Y4nIFXIZp+
	dq76VO7rDyaQECLMcTLRgGWuXfX/mt9GirbJk+ZaH61g7HaVd9slGHfd
X-Gm-Gg: AR+sD125vgbIWt50K098+mSDVgFqvD/+huFft0pVz/w08Gk8tKlQv0IrEzKU9Yeya+3
	BuyDG9a1lLoa2zAy/DCYPaomkPZHeYigo9FvFFP3G8OTFiYiDw4j6TAQyzJtxs17hWZZlqV81KQ
	hVioygSbUTUvdsWU/tnCRJ+zbsSZLQFP52S220oDGu+h6YQ7Ivq0gPuaqklL7gDWePc0z//+5Pg
	dbjpUX0TDbHLB9FCkd4FTgxUr+Ff11JuQi/n1ds8i3yMBuMuXpnD7cBZWF043xGki/aGgIkK7Ug
	6eh6Iu85A9+u80s/t00XvX7nUQWy/oIL2zcQIKfiboMdvXJQ9yAai17JYvCw98BVB/zwGXTJfVl
	NcGsZIHMgwoMUnVUL1g6Wz+PdjpSDrxZqS2V8bJ/fLxonyyBfZKUckc8A11Y8Og/B78YjG4VCTq
	24VUoly3pxRTRJFPOLjDUzCqLR4t75g8bC74w6cW/mciuLg9kVuK6E796jEVGMvoyJVYpGuFyO
X-Received: by 2002:a17:903:1a10:b0:2cc:f5b8:4c2e with SMTP id d9443c01a7336-2d0ca767b88mr280023755ad.9.1786092613585;
        Fri, 07 Aug 2026 01:50:13 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccadef6sm5692415ad.11.2026.08.07.01.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:50:12 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH] selftests/futex: Add test for robust exit with a foreign futex owner
Date: Fri,  7 Aug 2026 16:50:05 +0800
Message-ID: <20260807085005.1215188-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 6d4514ca9cdf ("futex: Prevent robust futex exit race some more")
fixed a lost wakeup in handle_futex_death(): when a robust waiter dies
mid-lock (list_op_pending set) while the futex is owned by a third thread
with FUTEX_WAITERS clear, the kernel must still wake the next waiter,
otherwise a waiter parked behind that futex sleeps forever. Since the
dying thread is not the owner, FUTEX_OWNER_DIED must not be set either.

Add a regression test to robust_list.c reproducing this "state B"
sequence: a waiter parks on a futex whose word is a foreign TID without
FUTEX_WAITERS, and a robust thread then dies with that futex in its
list_op_pending. It reuses the existing robust-list scaffolding.

Without the fix the wakeup is lost and futex_wait() times out at
FUTEX_TIMEOUT; with it handle_futex_death() issues the wakeup. Checked
both ways: the test fails on a kernel without the fix and passes on one
with it.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 .../selftests/futex/functional/robust_list.c  | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tools/testing/selftests/futex/functional/robust_list.c b/tools/testing/selftests/futex/functional/robust_list.c
index b3fab60181d5..be8149cc67f8 100644
--- a/tools/testing/selftests/futex/functional/robust_list.c
+++ b/tools/testing/selftests/futex/functional/robust_list.c
@@ -434,6 +434,85 @@ TEST(test_set_list_op_pending)
 		ksft_test_result_fail("%s\n", __func__);
 }
 
+/*
+ * State B reproducer for commit 6d4514ca9cdf ("futex: Prevent robust futex
+ * exit race some more").
+ *
+ * Model the sequence where the original owner unlocked and woke us, a third
+ * thread then took the futex uncontended (so the futex word holds a foreign
+ * TID with FUTEX_WAITERS clear), and we die mid-lock before acquiring it or
+ * re-arming FUTEX_WAITERS. handle_futex_death() must still wake the next
+ * waiter, otherwise a waiter parked behind a foreign-owned futex whose
+ * FUTEX_WAITERS bit was lost sleeps forever. As the dying thread is not the
+ * owner, it must not set FUTEX_OWNER_DIED either.
+ */
+#define FOREIGN_TID 0x00c0ffee
+
+static int child_fn_foreign_owner(void *arg)
+{
+	struct lock_struct *lock = arg;
+	struct robust_list_head head;
+
+	if (set_list(&head)) {
+		ksft_test_result_fail("set_robust_list error\n");
+		return -1;
+	}
+	if ((unsigned int)gettid() == FOREIGN_TID) {
+		ksft_test_result_fail("TID collided with FOREIGN_TID\n");
+		return -1;
+	}
+
+	/* We are mid-lock ... */
+	head.list_op_pending = &lock->list;
+	/* ... and the futex is owned by a third thread, FUTEX_WAITERS clear. */
+	atomic_store(&lock->futex, FOREIGN_TID);
+
+	/* Let the parent enter futex_wait() before we die (see child_fn_lock). */
+	pthread_barrier_wait(&barrier);
+	usleep(SLEEP_US);
+
+	return 0;
+}
+
+/*
+ * A waiter is parked on a futex whose word is a foreign TID with no
+ * FUTEX_WAITERS bit (state B). A robust thread dies with that futex in its
+ * list_op_pending. The kernel must wake the parked waiter even though the
+ * dying thread does not own the futex, and it must not set FUTEX_OWNER_DIED.
+ */
+TEST(test_robust_death_foreign_owner_wakeup)
+{
+	struct lock_struct lock = { .futex = 0 };
+	struct timespec to = { .tv_sec = FUTEX_TIMEOUT, .tv_nsec = 0 };
+	int ret, pid, wstatus;
+
+	ret = pthread_barrier_init(&barrier, NULL, 2);
+	ASSERT_EQ(ret, 0);
+
+	pid = create_child(&child_fn_foreign_owner, &lock);
+	ASSERT_NE(pid, -1);
+
+	pthread_barrier_wait(&barrier);
+
+	/*
+	 * *futex == FOREIGN_TID here, so this blocks. With the fix the dying
+	 * child's robust walk wakes us; without it, futex_wait() times out.
+	 */
+	ret = futex_wait((futex_t *)&lock.futex, FOREIGN_TID, &to, 0);
+	ASSERT_EQ(ret, 0);
+
+	/* The dying thread was not the owner: OWNER_DIED must not be set. */
+	ASSERT_FALSE(lock.futex & FUTEX_OWNER_DIED);
+
+	wait(&wstatus);
+	pthread_barrier_destroy(&barrier);
+
+	if (!WEXITSTATUS(wstatus))
+		ksft_test_result_pass("%s\n", __func__);
+	else
+		ksft_test_result_fail("%s\n", __func__);
+}
+
 #define CHILD_NR 10
 
 static int child_lock_holder(void *arg)
-- 
2.43.0


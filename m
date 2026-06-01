Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3E33815D0
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 06:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296709; cv=none; b=Y9d0Aba5RH/Wgr4b+t+DxVMNCJWK2FYlRyzhsl8U5yen3cg/4WtekMmMr2g4o74sruqPTbLNubmaIX7NfVbPm83ZEIHO+V7NAkhyg2MkHrsz9qE94yax77jvI7jNo7I2c1U8pFwQLcHSQoRgDtQNWHq1VoJqZzXK08emt89J9ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296709; c=relaxed/simple;
	bh=gwxob2EZvulYK9ds/Mqv1DMR+vDx8ag+CcujK4k5Wow=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F2geEeCI1+xC729irwh8lCjuGDqADJ6zyW7SM/WMB1KMGnAsN6xNEhxmYcLMEnzAMAO5jh77cNv8wdr+lfBh1UTA+d3GBPRyTm0Ix9UK2yEPVxtmpe2dyTAUnelgLdkPMnPbfshs1SvQDpr0gdf6dpYagnI3GTZL/CePpbB1fZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p6LXqWc9; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p6LXqWc9"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c85a2bf5388so510793a12.1
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 23:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780296704; x=1780901504; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gj/zqebitZEjvXoiM48+KkCnu32ZUykHthRZNwA4NOU=;
        b=p6LXqWc9lIAN+CrneIYmW/Ngqx9E/VqUWU2wSbX6s/z1FUSCQZzuozgWBKWdZqq2Jh
         BUG8VLJ2wWIItgTWlx/5/Hzms4iHaxuUPOU8UV8wm5gmletfloM3URKg6qtouyUmwRgh
         F2uoKCpJw/MNHRr/4SD450gkPhEQM7HpuQMHPYTB29M7J23AxuqUrssI8rLoeQUbHfYp
         vEK0BaYuMI1Bu9lHVGJCS7UHONrztqguX4zMIG4TNmmZj/0b7YrGqFRFxUtZGXvA083T
         2/jUjboICqvOrxaO6CpmUnmnVsyo5WI5CrrPYdU04OHfqH2C9diTdI3twk/8EcRPH2z9
         4Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296704; x=1780901504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gj/zqebitZEjvXoiM48+KkCnu32ZUykHthRZNwA4NOU=;
        b=pYTOqa99kuntOlQ5ae3EbK5UqtQtCaqL6j6uWcA6Ys3KF3kVvtqoCyrJC+a+GkBAHt
         WkfMX49ywtAzR74WhIvOjtNSLp4W2wdvFuHAuMr/XNwmvpNTEukZg322E2WeDPUmdJrd
         wZjftVcVlBZWlM0kEeU50gXvfX5zw1bxs+v+WDYEpzaq7RIISqK2vTsuII8s5QuaRMSk
         fS13IAF2ioqbzniB4MmQYBYqULCifzFs0D5G0hRz7hDS+kRuxMA9UJF/5mdQAzO1sP3T
         lv/3mXAji2CF4J4uzpACM8dAqBBsQ1048rCc/24/2e5pHcKVZAUE5Hlw8O+6SBpvPDbL
         GXsw==
X-Forwarded-Encrypted: i=1; AFNElJ+vtcVM31hNWWVppPwpJB04s8J66YJviOm4BicANcUQF6vWpbim0pcC76EiCRqbrmc50EMgBD9lsyaPLAliC4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjT2WVn6OZu8tTYSoFR0rxVjUUiZTf/lwb19VDiCy9BjvjSgga
	6St8u8URyqATWu9sElyEYC7YE72C4RRjoCv5GjLcPnfdtt/eIU4se2G339batYK8TZdQQFZXIoZ
	BDw==
X-Received: from pgc24.prod.google.com ([2002:a05:6a02:2f98:b0:c85:121a:8a22])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:b08d:b0:3b2:a86f:d38e
 with SMTP id adf61e73a8af0-3b427f5a847mr9719886637.36.1780296703565; Sun, 31
 May 2026 23:51:43 -0700 (PDT)
Date: Mon,  1 Jun 2026 06:51:26 +0000
In-Reply-To: <20260601065126.3623867-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260601065126.3623867-1-wakel@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260601065126.3623867-8-wakel@google.com>
Subject: [PATCH 7/7] selftests/futex: Migrate robust_list to harness
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	linux-kernel@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

Migrate robust_list test to the kselftest harness framework,
removing mixed legacy ksft_* API usages and passing test metadata
to cloned child functions via child_args struct.

Also, fix an out-of-bounds waitpid bug during multithreaded tests.

Signed-off-by: Wake Liu <wakel@google.com>
---
 .../selftests/futex/functional/robust_list.c  | 166 +++++++++---------
 1 file changed, 85 insertions(+), 81 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/robust_list.c b/tools/testing/selftests/futex/functional/robust_list.c
index e7d1254e18ca..d0b461962586 100644
--- a/tools/testing/selftests/futex/functional/robust_list.c
+++ b/tools/testing/selftests/futex/functional/robust_list.c
@@ -25,7 +25,7 @@
 #define _GNU_SOURCE
 
 #include "futextest.h"
-#include "../../kselftest_harness.h"
+#include "kselftest_harness.h"
 
 #include <errno.h>
 #include <pthread.h>
@@ -35,11 +35,11 @@
 #include <stddef.h>
 #include <sys/mman.h>
 #include <sys/wait.h>
+#include <stdlib.h>
+#include <string.h>
 
 #define STACK_SIZE (1024 * 1024)
-
 #define FUTEX_TIMEOUT 3
-
 #define SLEEP_US 100
 
 static pthread_barrier_t barrier, barrier2;
@@ -58,30 +58,46 @@ static int get_robust_list(int pid, struct robust_list_head **head, size_t *len_
  * Basic lock struct, contains just the futex word and the robust list element
  * Real implementations have also a *prev to easily walk in the list
  */
+typedef _Atomic(unsigned int) atomic_futex_t;
+
 struct lock_struct {
-	_Atomic(unsigned int)	futex;
+	atomic_futex_t		futex;
 	struct robust_list	list;
 };
 
+struct child_args {
+	struct __test_metadata *_metadata;
+	void *arg;
+};
+
 /*
  * Helper function to spawn a child thread. Returns -1 on error, pid on success
  */
-static int create_child(int (*fn)(void *arg), void *arg)
+static int create_child(struct __test_metadata *_metadata, int (*fn)(void *arg), void *arg)
 {
 	char *stack;
 	pid_t pid;
+	struct child_args *cargs = malloc(sizeof(*cargs));
+
+	if (!cargs)
+		return -1;
+	cargs->_metadata = _metadata;
+	cargs->arg = arg;
 
 	stack = mmap(NULL, STACK_SIZE, PROT_READ | PROT_WRITE,
 		     MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);
-	if (stack == MAP_FAILED)
+	if (stack == MAP_FAILED) {
+		free(cargs);
 		return -1;
+	}
 
 	stack += STACK_SIZE;
 
-	pid = clone(fn, stack, CLONE_VM | SIGCHLD, arg);
-
-	if (pid == -1)
+	pid = clone(fn, stack, CLONE_VM | SIGCHLD, cargs);
+	if (pid == -1) {
+		free(cargs);
 		return -1;
+	}
 
 	return pid;
 }
@@ -110,7 +126,7 @@ static int set_list(struct robust_list_head *head)
  */
 static int mutex_lock(struct lock_struct *lock, struct robust_list_head *head, bool error_inject)
 {
-	_Atomic(unsigned int) *futex = &lock->futex;
+	atomic_futex_t *futex = &lock->futex;
 	unsigned int zero = 0;
 	pid_t tid = gettid();
 	int ret = -1;
@@ -170,21 +186,19 @@ static int mutex_lock(struct lock_struct *lock, struct robust_list_head *head, b
  */
 static int child_fn_lock(void *arg)
 {
-	struct lock_struct *lock = arg;
+	struct child_args *cargs = arg;
+	struct __test_metadata *_metadata = cargs->_metadata;
+	struct lock_struct *lock = cargs->arg;
 	struct robust_list_head head;
 	int ret;
 
+	free(cargs);
+
 	ret = set_list(&head);
-	if (ret) {
-		ksft_test_result_fail("set_robust_list error\n");
-		return ret;
-	}
+	ASSERT_EQ(ret, 0) TH_LOG("set_robust_list error");
 
 	ret = mutex_lock(lock, &head, false);
-	if (ret) {
-		ksft_test_result_fail("mutex_lock error\n");
-		return ret;
-	}
+	ASSERT_EQ(ret, 0) TH_LOG("mutex_lock error");
 
 	pthread_barrier_wait(&barrier);
 
@@ -207,7 +221,7 @@ static int child_fn_lock(void *arg)
 TEST(test_robustness)
 {
 	struct lock_struct lock = { .futex = 0 };
-	_Atomic(unsigned int) *futex = &lock.futex;
+	atomic_futex_t *futex = &lock.futex;
 	struct robust_list_head head;
 	int ret, pid, wstatus;
 
@@ -221,7 +235,7 @@ TEST(test_robustness)
 	ret = pthread_barrier_init(&barrier, NULL, 2);
 	ASSERT_EQ(ret, 0);
 
-	pid = create_child(&child_fn_lock, &lock);
+	pid = create_child(_metadata, &child_fn_lock, &lock);
 	ASSERT_NE(pid, -1);
 
 	pthread_barrier_wait(&barrier);
@@ -238,9 +252,7 @@ TEST(test_robustness)
 	wait(&wstatus);
 	pthread_barrier_destroy(&barrier);
 
-	/* Pass only if the child hasn't return error */
-	if (!WEXITSTATUS(wstatus))
-		ksft_test_result_pass("%s\n", __func__);
+	EXPECT_EQ(WEXITSTATUS(wstatus), 0) TH_LOG("child failed");
 }
 
 /*
@@ -266,8 +278,6 @@ TEST(test_set_robust_list_invalid_size)
 	ret = set_robust_list(&head, 0);
 	ASSERT_EQ(ret, -1);
 	ASSERT_EQ(errno, EINVAL);
-
-	ksft_test_result_pass("%s\n", __func__);
 }
 
 /*
@@ -294,20 +304,19 @@ TEST(test_get_robust_list_self)
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(get_head, &head2);
 	ASSERT_EQ(head_size, len_ptr);
-
-	ksft_test_result_pass("%s\n", __func__);
 }
 
 static int child_list(void *arg)
 {
-	struct robust_list_head *head = arg;
+	struct child_args *cargs = arg;
+	struct __test_metadata *_metadata = cargs->_metadata;
+	struct robust_list_head *head = cargs->arg;
 	int ret;
 
+	free(cargs);
+
 	ret = set_robust_list(head, sizeof(*head));
-	if (ret) {
-		ksft_test_result_fail("set_robust_list error\n");
-		return -1;
-	}
+	ASSERT_EQ(ret, 0) TH_LOG("set_robust_list error");
 
 	/*
 	 * After setting the list head, wait until the main thread can call
@@ -337,7 +346,7 @@ TEST(test_get_robust_list_child)
 	ret = pthread_barrier_init(&barrier2, NULL, 2);
 	ASSERT_EQ(ret, 0);
 
-	tid = create_child(&child_list, &head);
+	tid = create_child(_metadata, &child_list, &head);
 	ASSERT_NE(tid, -1);
 
 	pthread_barrier_wait(&barrier);
@@ -352,28 +361,24 @@ TEST(test_get_robust_list_child)
 	pthread_barrier_destroy(&barrier);
 	pthread_barrier_destroy(&barrier2);
 
-	/* Pass only if the child hasn't return error */
-	if (!WEXITSTATUS(wstatus))
-		ksft_test_result_pass("%s\n", __func__);
+	EXPECT_EQ(WEXITSTATUS(wstatus), 0) TH_LOG("child failed");
 }
 
 static int child_fn_lock_with_error(void *arg)
 {
-	struct lock_struct *lock = arg;
+	struct child_args *cargs = arg;
+	struct __test_metadata *_metadata = cargs->_metadata;
+	struct lock_struct *lock = cargs->arg;
 	struct robust_list_head head;
 	int ret;
 
+	free(cargs);
+
 	ret = set_list(&head);
-	if (ret) {
-		ksft_test_result_fail("set_robust_list error\n");
-		return -1;
-	}
+	ASSERT_EQ(ret, 0) TH_LOG("set_robust_list error");
 
 	ret = mutex_lock(lock, &head, true);
-	if (ret) {
-		ksft_test_result_fail("mutex_lock error\n");
-		return -1;
-	}
+	ASSERT_EQ(ret, 0) TH_LOG("mutex_lock error");
 
 	pthread_barrier_wait(&barrier);
 
@@ -391,7 +396,7 @@ static int child_fn_lock_with_error(void *arg)
 TEST(test_set_list_op_pending)
 {
 	struct lock_struct lock = { .futex = 0 };
-	_Atomic(unsigned int) *futex = &lock.futex;
+	atomic_futex_t *futex = &lock.futex;
 	struct robust_list_head head;
 	int ret, wstatus;
 
@@ -401,7 +406,7 @@ TEST(test_set_list_op_pending)
 	ret = pthread_barrier_init(&barrier, NULL, 2);
 	ASSERT_EQ(ret, 0);
 
-	ret = create_child(&child_fn_lock_with_error, &lock);
+	ret = create_child(_metadata, &child_fn_lock_with_error, &lock);
 	ASSERT_NE(ret, -1);
 
 	pthread_barrier_wait(&barrier);
@@ -414,21 +419,21 @@ TEST(test_set_list_op_pending)
 	wait(&wstatus);
 	pthread_barrier_destroy(&barrier);
 
-	/* Pass only if the child hasn't return error */
-	if (!WEXITSTATUS(wstatus))
-		ksft_test_result_pass("%s\n", __func__);
-	else
-		ksft_test_result_fail("%s\n", __func__);
+	EXPECT_EQ(WEXITSTATUS(wstatus), 0) TH_LOG("child failed");
 }
 
 #define CHILD_NR 10
 
 static int child_lock_holder(void *arg)
 {
-	struct lock_struct *locks = arg;
+	struct child_args *cargs = arg;
+	struct __test_metadata *_metadata = cargs->_metadata;
+	struct lock_struct *locks = cargs->arg;
 	struct robust_list_head head;
 	int i;
 
+	free(cargs);
+
 	set_list(&head);
 
 	for (i = 0; i < CHILD_NR; i++) {
@@ -447,22 +452,20 @@ static int child_lock_holder(void *arg)
 
 static int child_wait_lock(void *arg)
 {
-	struct lock_struct *lock = arg;
+	struct child_args *cargs = arg;
+	struct __test_metadata *_metadata = cargs->_metadata;
+	struct lock_struct *lock = cargs->arg;
 	struct robust_list_head head;
 	int ret;
 
+	free(cargs);
+
 	pthread_barrier_wait(&barrier2);
 	ret = mutex_lock(lock, &head, false);
+	ASSERT_EQ(ret, 0) TH_LOG("mutex_lock error");
 
-	if (ret) {
-		ksft_test_result_fail("mutex_lock error\n");
-		return -1;
-	}
-
-	if (!(lock->futex & FUTEX_OWNER_DIED)) {
-		ksft_test_result_fail("futex not marked with FUTEX_OWNER_DIED\n");
-		return -1;
-	}
+	ASSERT_TRUE(lock->futex & FUTEX_OWNER_DIED)
+		TH_LOG("futex not marked with FUTEX_OWNER_DIED");
 
 	return 0;
 }
@@ -482,18 +485,20 @@ TEST(test_robust_list_multiple_elements)
 	ret = pthread_barrier_init(&barrier2, NULL, CHILD_NR + 1);
 	ASSERT_EQ(ret, 0);
 
-	pids[0] = create_child(&child_lock_holder, &locks);
+	pids[0] = create_child(_metadata, &child_lock_holder, &locks);
+	ASSERT_NE(pids[0], -1);
 
 	/* Wait until the locker thread takes the look */
 	pthread_barrier_wait(&barrier);
 
-	for (i = 0; i < CHILD_NR; i++)
-		pids[i+1] = create_child(&child_wait_lock, &locks[i]);
+	for (i = 0; i < CHILD_NR; i++) {
+		pids[i+1] = create_child(_metadata, &child_wait_lock, &locks[i]);
+		ASSERT_NE(pids[i+1], -1);
+	}
 
-	/* Wait for all children to return */
+	/* Wait for all children to return (holder + all waiters) */
 	ret = 0;
-
-	for (i = 0; i < CHILD_NR; i++) {
+	for (i = 0; i < CHILD_NR + 1; i++) {
 		waitpid(pids[i], &wstatus, 0);
 		if (WEXITSTATUS(wstatus))
 			ret = -1;
@@ -502,22 +507,21 @@ TEST(test_robust_list_multiple_elements)
 	pthread_barrier_destroy(&barrier);
 	pthread_barrier_destroy(&barrier2);
 
-	/* Pass only if the child hasn't return error */
-	if (!ret)
-		ksft_test_result_pass("%s\n", __func__);
+	EXPECT_EQ(ret, 0) TH_LOG("One or more children failed");
 }
 
 static int child_circular_list(void *arg)
 {
+	struct child_args *cargs = arg;
+	struct __test_metadata *_metadata = cargs->_metadata;
 	static struct robust_list_head head;
 	struct lock_struct a, b, c;
 	int ret;
 
+	free(cargs);
+
 	ret = set_list(&head);
-	if (ret) {
-		ksft_test_result_fail("set_list error\n");
-		return -1;
-	}
+	ASSERT_EQ(ret, 0) TH_LOG("set_list error");
 
 	head.list.next = &a.list;
 
@@ -539,14 +543,14 @@ static int child_circular_list(void *arg)
 TEST(test_circular_list)
 {
 	int wstatus;
+	pid_t pid;
 
-	create_child(child_circular_list, NULL);
+	pid = create_child(_metadata, child_circular_list, NULL);
+	ASSERT_NE(pid, -1);
 
 	wait(&wstatus);
 
-	/* Pass only if the child hasn't return error */
-	if (!WEXITSTATUS(wstatus))
-		ksft_test_result_pass("%s\n", __func__);
+	EXPECT_EQ(WEXITSTATUS(wstatus), 0) TH_LOG("child failed");
 }
 
 TEST_HARNESS_MAIN
-- 
2.54.0.823.g6e5bcc1fc9-goog


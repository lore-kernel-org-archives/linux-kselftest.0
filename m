Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3895F3E170E
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700808; cv=none; b=E6NXMpQ5jCyKmdb/vinjyDng021xpCGjVc81VSiF2W7dNY8HYBHNFkqnXR4U1184OA2wVxZRuEzNiQZyn4QjBdpK+Nr18S0/aBIWjWBy3LcJekPl3DZ9H6O2TfUV915VZTC29wr+mn+yD1R3YL2u3SHKXaZoqZRhfpz+7t0M9C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700808; c=relaxed/simple;
	bh=rvEK/iPW4RtRD8O8VyOSwmZPo8hSedYLVeoRRc6cBQQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F1nH6lwLquJyIkG4iHxAn+W97UnetfaIVXcSisn5RyzYO2f0rUhODI3P22b11/7i4PU6rRrexl/zVZ60hKFcZ7pYVqZMzBxP5Tylm3ByvDRXSY4s4msdiOK7gujWYrpDeohMbju/o4iItvUD5bxsB65uDyYIXziu9VC43FigEfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qPB5KBwF; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qPB5KBwF"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso18892178a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 02:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779700806; x=1780305606; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=izyWWdSFXUefAHwONWZHlFgfT9Xkrh+4p3hJFMuUItU=;
        b=qPB5KBwFexrDhQFepWFgrpI82tDS6/iYGTYwLgvmPM0Dl6va8AtSEZeWclyuB8jpg9
         3rebJ6lMMygT0FqtcvrxWo1N9wAIplFguvcVg5CCcBrYYHg/p9umRL4bRIzVyXnBUxH8
         SULATFc58/lWeLUZN7zwkyD4PapsgHgiXG9rZUjH1Jdt9vJvqRNnMXNQ0Q18hTgsr5ln
         JAR8zki+Y3HYcs5fbP0vsaJ3GxSnkfUn9XziIVx/gXTAaJjD3XscbZAyiDK2Pgd3pbWT
         lRsRKnHpyJPSHyoWuKTgn5+gYB4JiYDpW4vk/qXqOhHBmIn+KDPh0797wqbx1gZJOveW
         ThJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779700806; x=1780305606;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=izyWWdSFXUefAHwONWZHlFgfT9Xkrh+4p3hJFMuUItU=;
        b=cqEx4PbQsHRRAk8zUSiRzY/PEJ+ONr5gMDskHm4ayGMZEztzyCCNd7x/WtdXq555s2
         Pz+Od9MYey6ahBLgAeqXqE//TFHGXzQqJU+rvNA0R6ChPpx8RQ7B+YdC9y56tid6bwyx
         E7+rH8ErcLPEGlSHOKKFw5N/fhbSvQjslz/QSS+V8Euo9lx8pQp24hryU66VngKTTpmt
         LC3MzEzLn30EvnGmQcCMbTAgQzMjoNKd1Nk+d7vKH4evuaeNeMb4uTlRdgTJQ68+9z9i
         FdyxzxeqKo03OypT4SygqeQ1m0Bwz1VqwZUtknVJ6wgzKJGs1GahLjjRXTFOZRC7YYZc
         004Q==
X-Forwarded-Encrypted: i=1; AFNElJ8k2tOleWddueUzamVfhFbsddLhYyajqEB6FNmEyi9kDkHapUigQnXTi7dTyEzYVXFIdXs/Sw0FYmHFID0heAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgbPtxAo3CBe3Qp2Ef4Y1jZ0IMgbqMQ7BXkqbHoQaPvdiRn9BF
	wrekzb/9vDdjpRy4A1pqPBwSYlDzUPDSq5qTmClMTZgKQIc5Of4IkWKjF7nwbMBQqwojJKjkHCN
	Xuw==
X-Received: from pjsk5.prod.google.com ([2002:a17:90a:62c5:b0:369:6a36:2fe2])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d50:b0:364:e97f:64e7
 with SMTP id 98e67ed59e1d1-36a676372f2mr13955686a91.27.1779700806272; Mon, 25
 May 2026 02:20:06 -0700 (PDT)
Date: Mon, 25 May 2026 09:20:00 +0000
In-Reply-To: <20260525092002.3762888-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260525092002.3762888-1-wakel@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260525092002.3762888-2-wakel@google.com>
Subject: [PATCH 1/3] selftests/futex: Migrate futex_wait to harness
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	linux-kernel@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

Migrate futex_wait test to the kselftest harness framework,
removing mixed legacy ksft_* API usages and ensuring proper thread joining.

Signed-off-by: Wake Liu <wakel@google.com>
---
 .../selftests/futex/functional/futex_wait.c   | 125 +++++++++++-------
 1 file changed, 77 insertions(+), 48 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_wait.c b/tools/testing/selftests/futex/functional/futex_wait.c
index 7b8879409007..ed4b040600b8 100644
--- a/tools/testing/selftests/futex/functional/futex_wait.c
+++ b/tools/testing/selftests/futex/functional/futex_wait.c
@@ -9,6 +9,7 @@
 #include <sys/shm.h>
 #include <sys/mman.h>
 #include <fcntl.h>
+#include <stdlib.h>
 
 #include "futextest.h"
 #include "kselftest_harness.h"
@@ -19,125 +20,153 @@
 
 void *futex;
 
+struct waiter_args {
+	struct __test_metadata *_metadata;
+	unsigned int flags;
+};
+
 static void *waiterfn(void *arg)
 {
+	struct waiter_args *args = (struct waiter_args *)arg;
+	struct __test_metadata *_metadata = args->_metadata;
 	struct timespec to;
-	unsigned int flags = 0;
-
-	if (arg)
-		flags = *((unsigned int *) arg);
+	int res;
 
 	to.tv_sec = 0;
 	to.tv_nsec = timeout_ns;
 
-	if (futex_wait(futex, 0, &to, flags))
-		printf("waiter failed errno %d\n", errno);
+	res = futex_wait(futex, 0, &to, args->flags);
+	if (res) {
+		EXPECT_EQ(res, 0)
+			TH_LOG("waiter failed errno %d: %s", errno, strerror(errno));
+	}
 
+	free(args);
 	return NULL;
 }
 
 TEST(private_futex)
 {
-	unsigned int flags = FUTEX_PRIVATE_FLAG;
+	struct waiter_args *args = malloc(sizeof(*args));
 	u_int32_t f_private = 0;
 	pthread_t waiter;
 	int res;
 
+	args->_metadata = _metadata;
+	args->flags = FUTEX_PRIVATE_FLAG;
 	futex = &f_private;
 
 	/* Testing a private futex */
-	ksft_print_dbg_msg("Calling private futex_wait on futex: %p\n", futex);
-	if (pthread_create(&waiter, NULL, waiterfn, (void *) &flags))
-		ksft_exit_fail_msg("pthread_create failed\n");
+	TH_LOG("Calling private futex_wait on futex: %p", futex);
+	ASSERT_EQ(pthread_create(&waiter, NULL, waiterfn, args), 0)
+		TH_LOG("pthread_create failed");
 
 	usleep(WAKE_WAIT_US);
 
-	ksft_print_dbg_msg("Calling private futex_wake on futex: %p\n", futex);
+	TH_LOG("Calling private futex_wake on futex: %p", futex);
 	res = futex_wake(futex, 1, FUTEX_PRIVATE_FLAG);
-	if (res != 1) {
-		ksft_test_result_fail("futex_wake private returned: %d %s\n",
-				      errno, strerror(errno));
-	} else {
-		ksft_test_result_pass("futex_wake private succeeds\n");
-	}
+	EXPECT_EQ(res, 1)
+		TH_LOG("futex_wake private returned: %d %s", res, res < 0 ? strerror(errno) : "");
+
+	pthread_join(waiter, NULL);
 }
 
 TEST(anon_page)
 {
+	struct waiter_args *args = malloc(sizeof(*args));
 	u_int32_t *shared_data;
 	pthread_t waiter;
 	int res, shm_id;
 
+	args->_metadata = _metadata;
+	args->flags = 0;
+
 	/* Testing an anon page shared memory */
 	shm_id = shmget(IPC_PRIVATE, 4096, IPC_CREAT | 0666);
 	if (shm_id < 0) {
-		if (errno == ENOSYS)
-			ksft_exit_skip("shmget syscall not supported\n");
-		perror("shmget");
-		exit(1);
+		if (errno == ENOSYS) {
+			free(args);
+			SKIP(return, "shmget syscall not supported");
+		}
+		ASSERT_GE(shm_id, 0)
+			TH_LOG("shmget failed: %s", strerror(errno));
 	}
 
 	shared_data = shmat(shm_id, NULL, 0);
+	if (shared_data == (void *)-1) {
+		free(args);
+		ASSERT_NE(shared_data, (void *)-1)
+			TH_LOG("shmat failed: %s", strerror(errno));
+	}
 
 	*shared_data = 0;
 	futex = shared_data;
 
-	ksft_print_dbg_msg("Calling shared (page anon) futex_wait on futex: %p\n", futex);
-	if (pthread_create(&waiter, NULL, waiterfn, NULL))
-		ksft_exit_fail_msg("pthread_create failed\n");
+	TH_LOG("Calling shared (page anon) futex_wait on futex: %p", futex);
+	ASSERT_EQ(pthread_create(&waiter, NULL, waiterfn, args), 0)
+		TH_LOG("pthread_create failed");
 
 	usleep(WAKE_WAIT_US);
 
-	ksft_print_dbg_msg("Calling shared (page anon) futex_wake on futex: %p\n", futex);
+	TH_LOG("Calling shared (page anon) futex_wake on futex: %p", futex);
 	res = futex_wake(futex, 1, 0);
-	if (res != 1) {
-		ksft_test_result_fail("futex_wake shared (page anon) returned: %d %s\n",
-				      errno, strerror(errno));
-	} else {
-		ksft_test_result_pass("futex_wake shared (page anon) succeeds\n");
-	}
+	EXPECT_EQ(res, 1)
+		TH_LOG("futex_wake shared (page anon) returned: %d %s", res, res < 0 ? strerror(errno) : "");
 
+	pthread_join(waiter, NULL);
 	shmdt(shared_data);
 }
 
 TEST(file_backed)
 {
+	struct waiter_args *args = malloc(sizeof(*args));
 	u_int32_t f_private = 0;
 	pthread_t waiter;
 	int res, fd;
 	void *shm;
 
+	args->_metadata = _metadata;
+	args->flags = 0;
+
 	/* Testing a file backed shared memory */
-	fd = open(SHM_PATH, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
-	if (fd < 0)
-		ksft_exit_fail_msg("open\n");
+	fd = open(SHM_PATH, O_RDWR | O_CREAT, 0600);
+	if (fd < 0) {
+		free(args);
+		ASSERT_GE(fd, 0)
+			TH_LOG("open failed: %s", strerror(errno));
+	}
 
-	if (ftruncate(fd, sizeof(f_private)))
-		ksft_exit_fail_msg("ftruncate\n");
+	if (ftruncate(fd, sizeof(f_private))) {
+		free(args);
+		close(fd);
+		ASSERT_TRUE(0)
+			TH_LOG("ftruncate failed: %s", strerror(errno));
+	}
 
 	shm = mmap(NULL, sizeof(f_private), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
-	if (shm == MAP_FAILED)
-		ksft_exit_fail_msg("mmap\n");
+	if (shm == MAP_FAILED) {
+		free(args);
+		close(fd);
+		ASSERT_NE(shm, MAP_FAILED)
+			TH_LOG("mmap failed: %s", strerror(errno));
+	}
 
 	memcpy(shm, &f_private, sizeof(f_private));
 
 	futex = shm;
 
-	ksft_print_dbg_msg("Calling shared (file backed) futex_wait on futex: %p\n", futex);
-	if (pthread_create(&waiter, NULL, waiterfn, NULL))
-		ksft_exit_fail_msg("pthread_create failed\n");
+	TH_LOG("Calling shared (file backed) futex_wait on futex: %p", futex);
+	ASSERT_EQ(pthread_create(&waiter, NULL, waiterfn, args), 0)
+		TH_LOG("pthread_create failed");
 
 	usleep(WAKE_WAIT_US);
 
-	ksft_print_dbg_msg("Calling shared (file backed) futex_wake on futex: %p\n", futex);
+	TH_LOG("Calling shared (file backed) futex_wake on futex: %p", futex);
 	res = futex_wake(shm, 1, 0);
-	if (res != 1) {
-		ksft_test_result_fail("futex_wake shared (file backed) returned: %d %s\n",
-				      errno, strerror(errno));
-	} else {
-		ksft_test_result_pass("futex_wake shared (file backed) succeeds\n");
-	}
+	EXPECT_EQ(res, 1)
+		TH_LOG("futex_wake shared (file backed) returned: %d %s", res, res < 0 ? strerror(errno) : "");
 
+	pthread_join(waiter, NULL);
 	munmap(shm, sizeof(f_private));
 	remove(SHM_PATH);
 	close(fd);
-- 
2.54.0.746.g67dd491aae-goog


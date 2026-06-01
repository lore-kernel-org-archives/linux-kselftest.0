Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACE638237A
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 06:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296705; cv=none; b=fFly/FeI+CWIlDf44RQ5HZ04UboYqpG8nPQjsdM9sTYtZBnmZOpiFT3F3bw/oMIY8bSpbY28hOPKaR9K0Ok4caxY6CA4mkT35+/p3tjB0ECAIUWL+jBwxX44cJhAf68hWyoXXf3KxdccX16CJbbU88Lt+CCEe9HyawZAgxOXE+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296705; c=relaxed/simple;
	bh=RhbZjldDEvRmcXRUgBq8zs621qLiWWhWxGM9YPdTZFU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PRmmwm7o4zC/V6+kwItBFgEXWQKOEGcJirCplruWhVWhCNT0zfKI18Etfihe00rbdIrtJpP/x70Ew7dkKQGwV5LIif5nWgFtmkEFbiW/YHpV/CpWSN9CJq0oGZU7GobYOHJNEAxHp8ZOuP2X5k7qXffuGtY6D7dKzkbIOfoNmCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H50tEFWA; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H50tEFWA"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c85a2ed88c8so1312359a12.3
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 23:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780296700; x=1780901500; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dEuvk7i7rqZfwCAbLKkptmIQlUbXcNoFD9xb5HxF2jE=;
        b=H50tEFWA33pctHyuQVj9SMjh6JyyFxqHYMOxjEWbUvlPRkXzKS12aDApJFHSjv+XT7
         1OjHXSVjbXefW9Joh31OeqcVDz5uANqnItU6GGRfkrghbT86tqBBIkLsbeqGiMF4Gnpv
         TyE9eKSfDZ5lnLhVmvw/qGYBVkIVVVA9ueOACUl6t89VfB4KF5m7XIi1ObcZkSJcq7iy
         CNEoQwLlECfvu5jYjKGyvJc5KqEjTAbmqA4/DGXm3WBFa2CRzkD8bvrRNNvLmXYVgQlZ
         i02X44R1IVK94KLXwuRAejRhsFQv9R01xbNUzQsIYEoEvJqjA8UUYgOeQ6zLuVU58XU1
         obFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296700; x=1780901500;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dEuvk7i7rqZfwCAbLKkptmIQlUbXcNoFD9xb5HxF2jE=;
        b=lS6nI4c7QPcpqGRIG7sE1UTQFJAcQb/U4MWF6GoGoBjbL+jqHlRTeq8NBY1gMy/xs0
         QeTK34M4eSw3St/GEvLpePvymJ6BmkhDKVXNcVxi6gwf2mtrxTCiljdvxWuAV6xVk07o
         YZb871DL3L7MIHqDCyFoEVa1V5btsn9V6YuRhT7GkSTO7/WcafQ3GGZLZNTWRXZAnFlY
         3GhuM9xMdNj4lkxYXWq+dKE0AUfC3YOv30uC2yEClZ6H+Kx2+Kq6TfJ7WdSFyNmvBq4n
         PzLhnx3z+/zLEgLt5N/sIbEouVbG9+cfNflkVOFlEOKG9426d45/Jj88yPO1RjqWMmtd
         BIzw==
X-Forwarded-Encrypted: i=1; AFNElJ9j153wjilMnW/lscLaozVFaUxND3iW5OwnEYIbKCBhbnN6wv7maHmAvresK0DsWzgUpE1ldKoBEsiJ/mZ0zDc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8dHzKihwrsJ7g24gco0Anlw9tozWoXk5NNLewzXlbYCx/69Mg
	KC+yvb112ZMblhY+sqMuq6G6ApCG172OKMu7nnkqxu/e7wW21Tle3MYH/Gamdg692SgpV/mvqN9
	yqg==
X-Received: from pgng19.prod.google.com ([2002:a63:3753:0:b0:c85:7a10:54e4])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:5482:b0:3b2:8675:4866
 with SMTP id adf61e73a8af0-3b4280a5aa4mr8928004637.31.1780296699772; Sun, 31
 May 2026 23:51:39 -0700 (PDT)
Date: Mon,  1 Jun 2026 06:51:24 +0000
In-Reply-To: <20260601065126.3623867-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260601065126.3623867-1-wakel@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260601065126.3623867-6-wakel@google.com>
Subject: [PATCH 5/7] selftests/futex: Migrate futex_numa_mpol to harness
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	linux-kernel@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

Migrate futex_numa_mpol test to the kselftest harness framework,
removing mixed legacy ksft_* API usages and passing test metadata to helper functions.

Signed-off-by: Wake Liu <wakel@google.com>
---
 .../futex/functional/futex_numa_mpol.c        | 109 ++++++++----------
 1 file changed, 51 insertions(+), 58 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_numa_mpol.c b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
index 78c0f7a59e17..18dc8e54aa96 100644
--- a/tools/testing/selftests/futex/functional/futex_numa_mpol.c
+++ b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
@@ -10,6 +10,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
+#include <string.h>
 #ifdef LIBNUMA_VER_SUFFICIENT
 #include <numa.h>
 #include <numaif.h>
@@ -54,7 +55,7 @@ static void *thread_lock_fn(void *arg)
 	return NULL;
 }
 
-static void create_max_threads(void *futex_ptr)
+static void create_max_threads(struct __test_metadata *_metadata, void *futex_ptr)
 {
 	int i, ret;
 
@@ -63,28 +64,26 @@ static void create_max_threads(void *futex_ptr)
 		thread_args[i].flags = FUTEX2_SIZE_U32 | FUTEX_PRIVATE_FLAG | FUTEX2_NUMA;
 		thread_args[i].result = 0;
 		ret = pthread_create(&threads[i], NULL, thread_lock_fn, &thread_args[i]);
-		if (ret)
-			ksft_exit_fail_msg("pthread_create failed\n");
+		ASSERT_EQ(ret, 0) TH_LOG("pthread_create failed");
 	}
 }
 
-static void join_max_threads(void)
+static void join_max_threads(struct __test_metadata *_metadata)
 {
 	int i, ret;
 
 	for (i = 0; i < MAX_THREADS; i++) {
 		ret = pthread_join(threads[i], NULL);
-		if (ret)
-			ksft_exit_fail_msg("pthread_join failed for thread %d\n", i);
+		ASSERT_EQ(ret, 0) TH_LOG("pthread_join failed for thread %d", i);
 	}
 }
 
-static void __test_futex(void *futex_ptr, int err_value, unsigned int futex_flags)
+static void __test_futex(struct __test_metadata *_metadata, void *futex_ptr, int err_value, unsigned int futex_flags)
 {
-	int to_wake, ret, i, need_exit = 0;
+	int to_wake, ret, i;
 
 	pthread_barrier_init(&barrier_main, NULL, MAX_THREADS + 1);
-	create_max_threads(futex_ptr);
+	create_max_threads(_metadata, futex_ptr);
 	pthread_barrier_wait(&barrier_main);
 	to_wake = MAX_THREADS;
 
@@ -92,45 +91,43 @@ static void __test_futex(void *futex_ptr, int err_value, unsigned int futex_flag
 		ret = futex2_wake(futex_ptr, to_wake, futex_flags);
 
 		if (err_value) {
-			if (ret >= 0)
-				ksft_exit_fail_msg("futex2_wake(%d, 0x%x) should fail, but didn't\n",
-						   to_wake, futex_flags);
+			EXPECT_LT(ret, 0)
+				TH_LOG("futex2_wake(%d, 0x%x) should fail, but didn't",
+				       to_wake, futex_flags);
 
-			if (errno != err_value)
-				ksft_exit_fail_msg("futex2_wake(%d, 0x%x) expected error was %d, but returned %d (%s)\n",
-						   to_wake, futex_flags, err_value, errno, strerror(errno));
+			EXPECT_EQ(errno, err_value)
+				TH_LOG("futex2_wake(%d, 0x%x) expected error was %d, but returned %d (%s)",
+				       to_wake, futex_flags, err_value, errno, strerror(errno));
 
 			break;
 		}
 		if (ret < 0) {
-			ksft_exit_fail_msg("Failed futex2_wake(%d, 0x%x): %m\n",
-					   to_wake, futex_flags);
+			ASSERT_GE(ret, 0)
+				TH_LOG("Failed futex2_wake(%d, 0x%x): %s",
+				       to_wake, futex_flags, strerror(errno));
 		}
 		if (!ret)
 			usleep(50);
 		to_wake -= ret;
 
 	} while (to_wake);
-	join_max_threads();
+	join_max_threads(_metadata);
 
 	for (i = 0; i < MAX_THREADS; i++) {
-		if (err_value && thread_args[i].result != -1) {
-			ksft_print_msg("Thread %d should fail but succeeded (%d)\n",
+		if (err_value) {
+			EXPECT_EQ(thread_args[i].result, -1)
+				TH_LOG("Thread %d should fail but succeeded (%d)",
 				       i, thread_args[i].result);
-			need_exit = 1;
-		}
-		if (!err_value && thread_args[i].result != 0) {
-			ksft_print_msg("Thread %d failed (%d)\n", i, thread_args[i].result);
-			need_exit = 1;
+		} else {
+			EXPECT_EQ(thread_args[i].result, 0)
+				TH_LOG("Thread %d failed (%d)", i, thread_args[i].result);
 		}
 	}
-	if (need_exit)
-		ksft_exit_fail_msg("Aborting due to earlier errors.\n");
 }
 
-static void test_futex(void *futex_ptr, int err_value)
+static void test_futex(struct __test_metadata *_metadata, void *futex_ptr, int err_value)
 {
-	__test_futex(futex_ptr, err_value, FUTEX2_SIZE_U32 | FUTEX_PRIVATE_FLAG | FUTEX2_NUMA);
+	__test_futex(_metadata, futex_ptr, err_value, FUTEX2_SIZE_U32 | FUTEX_PRIVATE_FLAG | FUTEX2_NUMA);
 }
 
 TEST(futex_numa_mpol)
@@ -141,43 +138,41 @@ TEST(futex_numa_mpol)
 
 	mem_size = sysconf(_SC_PAGE_SIZE);
 	futex_ptr = mmap(NULL, mem_size * 2, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
-	if (futex_ptr == MAP_FAILED)
-		ksft_exit_fail_msg("mmap() for %d bytes failed\n", mem_size);
+	ASSERT_NE(futex_ptr, MAP_FAILED)
+		TH_LOG("mmap() for %d bytes failed: %s", mem_size, strerror(errno));
 
 	/* Create an invalid memory region for the "Memory out of range" test */
 	mprotect(futex_ptr + mem_size, mem_size, PROT_NONE);
 
 	futex_numa = futex_ptr;
 
-	ksft_print_msg("Regular test\n");
+	TH_LOG("Regular test");
 	futex_numa->futex = 0;
 	futex_numa->numa = FUTEX_NO_NODE;
-	test_futex(futex_ptr, 0);
+	test_futex(_metadata, futex_ptr, 0);
 
-	if (futex_numa->numa == FUTEX_NO_NODE)
-		ksft_exit_fail_msg("NUMA node is left uninitialized\n");
+	EXPECT_NE(futex_numa->numa, FUTEX_NO_NODE)
+		TH_LOG("NUMA node is left uninitialized");
 
 	/* FUTEX2_NUMA futex must be 8-byte aligned */
-	ksft_print_msg("Mis-aligned futex\n");
-	test_futex(futex_ptr + mem_size - 4, EINVAL);
+	TH_LOG("Mis-aligned futex");
+	test_futex(_metadata, futex_ptr + mem_size - 4, EINVAL);
 
-	ksft_print_msg("Memory out of range\n");
-	test_futex(futex_ptr + mem_size, EFAULT);
+	TH_LOG("Memory out of range");
+	test_futex(_metadata, futex_ptr + mem_size, EFAULT);
 
 	futex_numa->numa = FUTEX_NO_NODE;
 	mprotect(futex_ptr, mem_size, PROT_READ);
-	ksft_print_msg("Memory, RO\n");
-	test_futex(futex_ptr, EFAULT);
+	TH_LOG("Memory, RO");
+	test_futex(_metadata, futex_ptr, EFAULT);
 
 	mprotect(futex_ptr, mem_size, PROT_NONE);
-	ksft_print_msg("Memory, no access\n");
-	test_futex(futex_ptr, EFAULT);
+	TH_LOG("Memory, no access");
+	test_futex(_metadata, futex_ptr, EFAULT);
 
 	mprotect(futex_ptr, mem_size, PROT_READ | PROT_WRITE);
-	ksft_print_msg("Memory back to RW\n");
-	test_futex(futex_ptr, 0);
-
-	ksft_test_result_pass("futex2 memory boundary tests passed\n");
+	TH_LOG("Memory back to RW");
+	test_futex(_metadata, futex_ptr, 0);
 
 	/* MPOL test. Does not work as expected */
 #ifdef LIBNUMA_VER_SUFFICIENT
@@ -190,25 +185,23 @@ TEST(futex_numa_mpol)
 			    sizeof(nodemask) * 8, 0);
 		if (ret == 0) {
 			ret = numa_set_mempolicy_home_node(futex_ptr, mem_size, i, 0);
-			if (ret != 0)
-				ksft_exit_fail_msg("Failed to set home node: %m, %d\n", errno);
+			ASSERT_EQ(ret, 0)
+				TH_LOG("Failed to set home node: %s, %d", strerror(errno), errno);
 
-			ksft_print_msg("Node %d test\n", i);
+			TH_LOG("Node %d test", i);
 			futex_numa->futex = 0;
 			futex_numa->numa = FUTEX_NO_NODE;
 
 			ret = futex2_wake(futex_ptr, 0, FUTEX2_SIZE_U32 | FUTEX_PRIVATE_FLAG | FUTEX2_NUMA | FUTEX2_MPOL);
-			if (ret < 0)
-				ksft_test_result_fail("Failed to wake 0 with MPOL: %m\n");
-			if (futex_numa->numa != i) {
-				ksft_exit_fail_msg("Returned NUMA node is %d expected %d\n",
-						   futex_numa->numa, i);
-			}
+			EXPECT_GE(ret, 0)
+				TH_LOG("Failed to wake 0 with MPOL: %s", strerror(errno));
+			EXPECT_EQ(futex_numa->numa, i)
+				TH_LOG("Returned NUMA node is %d expected %d",
+				       futex_numa->numa, i);
 		}
 	}
-	ksft_test_result_pass("futex2 MPOL hints test passed\n");
 #else
-	ksft_test_result_skip("futex2 MPOL hints test requires libnuma 2.0.18+\n");
+	SKIP(return, "futex2 MPOL hints test requires libnuma 2.0.18+");
 #endif
 	munmap(futex_ptr, mem_size * 2);
 }
-- 
2.54.0.823.g6e5bcc1fc9-goog


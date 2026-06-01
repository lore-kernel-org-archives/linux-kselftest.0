Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AAB380FF0
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 06:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296700; cv=none; b=WSyi5wbmfmuljuzW1Bst/8sp4XuvrXYC2f7V+yV185NadWxZfTWAZi5c6B6eXcK+9jRdPBca7Md7v82Ml6178SNgG7d50lAfe0vBAzqZm0ArbCvkUTf8fo4s+b9Q5qBOJhSxAZ/XdaFEu73C1TqRPopwOyjY/+8D8AC6GJy7dAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296700; c=relaxed/simple;
	bh=zQyElqJggpdAoRCfqjPth8BzP2CEJO+096dvpyMO/58=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UTSFs2/hFb2b67cuM5D5HY48274c42aCDRP9oV68ngdOFrKqUEUNdtOfIXCq40Y4ZfL2ULm3AZ88zD1eTk7aaVxEHTXTgb4T/Z4/T+cOULy2N470WZ2CPLkh792nNEOAtmocQy08PRMfxnTvjmnrgv+C0ohSGcVH55qEoAXzLek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u9gNx47r; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u9gNx47r"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8423d4d7419so1774285b3a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 23:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780296696; x=1780901496; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1hNLATkHbi9kvgAQrnw7X+32QULnpyW2fwEQdl2tOKs=;
        b=u9gNx47rgs+cOMCbfZhaLasmWvP3V9hNxDa1zF5pSB/8ABVHgNEEF8jLURpGyV/TYB
         RKyW/v9KVndwUDWoacszTForcQmkgfC+JwNbPhK6UyyAA0AX7cH1fKtAY3OFhP0JxVtv
         kYw9OBjgH9J3Bj3Q8C9Iwhk8SeAy4A5PXxZtw534gHhrfcPFrQDy3ej8CMS6ltC68coc
         vwwVfZy+F+JXTNPQdquBvbH7XZeYjzYykBPOYWZ0u3bo7CvkVysq9vyIYowx0bQcKcWL
         OcdQHMJbdvTcYuJY7eWdG5g5dTpAizFYGhI5JqUj7CM3htvdeJiy9X/Pji+joyIVXJ1a
         FBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296696; x=1780901496;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1hNLATkHbi9kvgAQrnw7X+32QULnpyW2fwEQdl2tOKs=;
        b=URLZtjHyFv+mAEQqORSCCqHXefyDO9aQyqEoVJSg2D0ToBv7A4hJYQ0pbceA3/W8gg
         cl6pGeTKxRuekzrTN5EaD40fPJmTIRnPFetn5JP4ofuBfygC9NyQRHe8y4HtfbenqEDv
         q7ZGnw3PHgkjQUdGNQPU8rgYLIXcWlhPPs3FX2b7MDBh36XZEd7mkFXpc1pwns4FbRE5
         KN3NXN1yo3Th7CHtzJDOwu92MGTt2YrrK956ZWm/SEZNtCQPQZ4nYDe6MWrU81h16TKe
         drMOATyMFpxXIM2yq1lwI+OC9E4pGyrJ+E4Yvk06e4rDYom3DsV72UKeTjExwTyfZsAq
         +rfA==
X-Forwarded-Encrypted: i=1; AFNElJ+6nE7kugRZFpfy3aLkMhZavr9SOnYw06JD478Eb6dDHnOfl675b6/K4bk3jRXkCRwToO8/lNaufPWJ0AEKRH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGq0wXzKUBUx+LsfhVKrZaC93wAOSfy3kxzGpIZAj/6uf914SJ
	UyKT8/sKMb69Bq5h3SA55C3g3jkOwpm0+jugfdUuDsZj9O8ARKCcKxHML9b1PVF6b5nWw6UxErY
	YOQ==
X-Received: from pfbmu27.prod.google.com ([2002:a05:6a00:6e9b:b0:842:414c:de5f])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:9a8c:0:b0:83d:b0a0:90e3
 with SMTP id d2e1a72fcca58-84225478823mr8881984b3a.31.1780296695741; Sun, 31
 May 2026 23:51:35 -0700 (PDT)
Date: Mon,  1 Jun 2026 06:51:22 +0000
In-Reply-To: <20260601065126.3623867-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260601065126.3623867-1-wakel@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260601065126.3623867-4-wakel@google.com>
Subject: [PATCH 3/7] selftests/futex: Migrate futex_requeue_pi_mismatched_ops
 to harness
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	linux-kernel@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

Migrate futex_requeue_pi_mismatched_ops test to the kselftest harness framework,
removing mixed legacy ksft_* API usages and passing test metadata to helper thread.

Signed-off-by: Wake Liu <wakel@google.com>
---
 .../futex_requeue_pi_mismatched_ops.c         | 39 +++++++++++--------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue_pi_mismatched_ops.c b/tools/testing/selftests/futex/functional/futex_requeue_pi_mismatched_ops.c
index f686e605359c..c55eadd261da 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue_pi_mismatched_ops.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue_pi_mismatched_ops.c
@@ -29,14 +29,17 @@
 
 futex_t f1 = FUTEX_INITIALIZER;
 futex_t f2 = FUTEX_INITIALIZER;
-int child_ret = 0;
+int child_ret;
 
 void *blocking_child(void *arg)
 {
+	struct __test_metadata *_metadata = (struct __test_metadata *)arg;
+
 	child_ret = futex_wait(&f1, f1, NULL, FUTEX_PRIVATE_FLAG);
 	if (child_ret < 0) {
 		child_ret = -errno;
-		ksft_exit_fail_msg("futex_wait\n");
+		ASSERT_EQ(child_ret, 0)
+			TH_LOG("futex_wait failed: %s", strerror(errno));
 	}
 	return (void *)&child_ret;
 }
@@ -46,8 +49,8 @@ TEST(requeue_pi_mismatched_ops)
 	pthread_t child;
 	int ret;
 
-	if (pthread_create(&child, NULL, blocking_child, NULL))
-		ksft_exit_fail_msg("pthread_create\n");
+	ASSERT_EQ(pthread_create(&child, NULL, blocking_child, _metadata), 0)
+		TH_LOG("pthread_create failed");
 
 	/* Allow the child to block in the kernel. */
 	sleep(1);
@@ -67,27 +70,31 @@ TEST(requeue_pi_mismatched_ops)
 			 * FUTEX_WAKE.
 			 */
 			ret = futex_wake(&f1, 1, FUTEX_PRIVATE_FLAG);
-			if (ret == 1)
+			if (ret == 1) {
 				ret = 0;
-			else if (ret < 0)
-				ksft_exit_fail_msg("futex_wake\n");
-			else
-				ksft_exit_fail_msg("futex_wake did not wake the child\n");
+			} else if (ret < 0) {
+				ASSERT_GE(ret, 0)
+					TH_LOG("futex_wake failed: %s", strerror(errno));
+			} else {
+				ASSERT_TRUE(0)
+					TH_LOG("futex_wake did not wake the child");
+			}
 		} else {
-			ksft_exit_fail_msg("futex_cmp_requeue_pi\n");
+			ASSERT_TRUE(0)
+				TH_LOG("futex_cmp_requeue_pi failed with unexpected errno: %s", strerror(errno));
 		}
 	} else if (ret > 0) {
-		ksft_test_result_fail("futex_cmp_requeue_pi failed to detect the mismatch\n");
+		EXPECT_EQ(ret, 0)
+			TH_LOG("futex_cmp_requeue_pi failed to detect the mismatch");
 	} else {
-		ksft_exit_fail_msg("futex_cmp_requeue_pi found no waiters\n");
+		ASSERT_TRUE(0)
+			TH_LOG("futex_cmp_requeue_pi found no waiters");
 	}
 
 	pthread_join(child, NULL);
 
-	if (!ret && !child_ret)
-		ksft_test_result_pass("futex_requeue_pi_mismatched_ops passed\n");
-	else
-		ksft_test_result_pass("futex_requeue_pi_mismatched_ops failed\n");
+	EXPECT_EQ(ret, 0) TH_LOG("Test failed: ret=%d", ret);
+	EXPECT_EQ(child_ret, 0) TH_LOG("Child failed: child_ret=%d", child_ret);
 }
 
 TEST_HARNESS_MAIN
-- 
2.54.0.823.g6e5bcc1fc9-goog


Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9108C3630A7;
	Mon,  4 May 2026 10:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777891215; cv=none; b=TGwjGVxMVsdvhIST9HxfdTfzKUjar6Z8kC2n8/ql5/jdsOS6TbmiaIrGo27VyvVJFP915TFJwF3YeKbrYTYKngRSXBEGUESooO1Pum+rf0JguY0O4ba1wfktHT+HJM+vngCnELmE492PKOM6OrKmAMpJav3EtVsbO0aLUR2KsmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777891215; c=relaxed/simple;
	bh=btZRigMueH6OKDWZ9ekIWb8rnt/fzRtQrYAOjs6BBrM=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=I2M3Kj0flpTh1LkxVK99PB5VML6KIT3WcAl/HIeHSwNRJIkYKfnZ7UqWsmCUhLxzkksHhCuP1z0AhZjmEbEImKiDzCvQ3vnPDa8IlobGhKatDjb1Jh9G2w0/1MpP3ZsbmVa7x2kv1InAVIWEObp8ak6HZNUTB45xqbn3sqtOong=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=mjxda/MQ; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="mjxda/MQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777891200; bh=b2vTPHZkDssdQy0Ud6aa3PxnglQtX5EZhwc+C22TTQs=;
	h=From:To:Cc:Subject:Date;
	b=mjxda/MQBqJx9OUVPC2QKWG1ylzLxSvAbbn0tMsqiZg/+cHkwg0gcWfIzxmASwJ1A
	 W2BzE/7W2OH8/CFsrjht/qNxuzCrCZaV+dDlpz5Cbf4Ntc3QMxLjUGipVcgcVdxpNc
	 Z50gT5qVV4unos81DDQlQ359CuZ+z5zfHMX4Nawo=
Received: from node68.. ([166.111.236.25])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 9F9018A9; Mon, 04 May 2026 18:39:57 +0800
X-QQ-mid: xmsmtpt1777891197t65lmu5od
Message-ID: <tencent_C3AEB0E769C5F4F9370F9411B69B7F8B2907@qq.com>
X-QQ-XMAILINFO: NUYPVyrd/y6PevZ8Dpjp2K92IKJ+O9dw51e/4sHyDu901vM4U9OCewHI4V3wm6
	 ppJpiK0A+OkEyMvaKp3LrEVZ5XxVMeKHRhQJM9Y3QemX8vJLiZWdq9owIZP0Unf2YezSo6jBUCei
	 f85Pr+DVOp6024uvHZxhjWJNT4VvQddSeOSXBMYvLS6Go2dv8su7gdgHr0oz/0WYjd8lvFCA80KL
	 wu9giFrGtEPTCfYbiN48jKtxnEpYFgDwGBHBkWEAsT3ccTFy81rFdTo0PqivCHrzJtwlhZ+llSKw
	 zKXvdt322XspNg2yQC5codDYne3cvupYJZfsbc7UOYHhZ/tA1I9n8uJZadYGSlkf17dXxI3wDZw8
	 THwYWWF5+NSRIunnGhx3fitAbbWuRYbuVARPna1sOiiUrM0CwhzNdDFRJPfVOPBtFGTIwFjg27oy
	 kooSM+R6jqeXq776auF2ZZdAfIPqQOSOmgc/kMN7/UmfyDwU1DInuvHPIRiHXpNOmDue3k85CRUU
	 npBVD5tMbJNKOgrIKTeVanG03CHS5zBdwRqqzelaKWNw5/R42nfvgrnj0JAetV1gQamMoe/zsaQd
	 4gANnL0/9Cfe5AmM3CUAwHarcvtmA1bF9mQ3SivVPKWpNw8IpT7aSo8jvtlye1NhpJDlIwPQyENw
	 ruQ/ACjoVXEC0mNjkj23Pvu9HSnlDmsbci/4xr/dvdpRDE4aF6H90vE3dNN2zw6uzntvxUnQHC+w
	 MkmrUk5GkkTdMT6opoD4NiM/x4EB8jdLAzNoL3SuE1h7nSMIMXPs3XbATH3AepVpP7W7Hl5YRJPz
	 /Fa6AD0ycEBWFPvpn4dcmHgcnHOTPtaMr6wkYSQZuIGiA1H3gmfFUVG+O39pWWPAVa61ob1pJIWt
	 cjVKYUjaWVAgLOPVMDip5R4j4FPa+Qm3UAnZZOa7klwAxKeWWBNaowDqA1YD8TroC8R4aYIzacix
	 aj7rMkmtOu9sqkY+zQ1ZRZJOvSZsM7oc2eb5KTkBmvoAED/mGkpkcQ0P/sfEU2GvhTBu2zAqXYq6
	 7SCVqIb/RMKcfT4E/mn0yBQZMH0j0=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: fujunjie <fujunjie1@qq.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	SeongJae Park <sj@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fujunjie <fujunjie1@qq.com>
Subject: [PATCH v3] mm/madvise: reject invalid process_madvise() advice for zero-length vectors
Date: Mon,  4 May 2026 10:39:57 +0000
X-OQ-MSGID: <20260504103957.842255-1-fujunjie1@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

process_madvise() used to validate the advice while walking each
imported iovec. If the vector has zero total length, vector_madvise()
does not enter the loop and can return success without checking whether
the advice value is valid.

For a local mm, such as process_madvise(PIDFD_SELF, ...), the remote-only
process_madvise_remote_valid() check is skipped. As a result, an invalid
advice can be reported as success when the vector has zero total length.
This differs from madvise(), which rejects an invalid advice before
returning success for a zero-length range.

Validate the generic madvise behavior at the syscall-facing entry points
before any vector walk. In process_madvise(), do this before the
remote-only advice restriction so unsupported advice is rejected with the
same priority for local and remote mm.

Use an errno-returning helper for address/length validation, and handle
zero-length ranges explicitly at the call sites. Requests with valid
advice and zero total length remain a noop and continue to return 0. Add
a selftest that covers invalid advice with a zero-length iovec and an
empty vector, while also checking that a request with valid advice and
zero length still succeeds.

Fixes: 021781b01275 ("mm/madvise: unrestrict process_madvise() for current process")
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: SeongJae Park <sj@kernel.org>
Signed-off-by: fujunjie <fujunjie1@qq.com>
---
v3:
- Rework range validation into check_input_range() and handle zero-length
  ranges explicitly at the call sites, per Lorenzo.
- Drop the unnecessary errno reset in the selftest, per SJ.

Testing: built mm/madvise.o, bzImage and process_madv; process_madv
passes 7/7 in QEMU.

 mm/madvise.c                              | 60 +++++++++++++------------------
 tools/testing/selftests/mm/process_madv.c | 28 ++++++++++++++++
 2 files changed, 53 insertions(+), 35 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 69708e953cf56..cd9bb077072c 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1834,50 +1834,29 @@ static void madvise_finish_tlb(struct madvise_behavior *madv_behavior)
 		tlb_finish_mmu(madv_behavior->tlb);
 }
 
-static bool is_valid_madvise(unsigned long start, size_t len_in, int behavior)
+/**
+ * check_input_range() - Check if the requested range is valid.
+ * @start:	Start address of madvise-requested address range.
+ * @len_in:	Length of madvise-requested address range.
+ *
+ * Returns: 0 if the input range is valid, otherwise an error code.
+ */
+static int check_input_range(unsigned long start, size_t len_in)
 {
 	size_t len;
 
-	if (!madvise_behavior_valid(behavior))
-		return false;
-
 	if (!PAGE_ALIGNED(start))
-		return false;
+		return -EINVAL;
 	len = PAGE_ALIGN(len_in);
 
 	/* Check to see whether len was rounded up from small -ve to zero */
 	if (len_in && !len)
-		return false;
+		return -EINVAL;
 
 	if (start + len < start)
-		return false;
-
-	return true;
-}
+		return -EINVAL;
 
-/*
- * madvise_should_skip() - Return if the request is invalid or nothing.
- * @start:	Start address of madvise-requested address range.
- * @len_in:	Length of madvise-requested address range.
- * @behavior:	Requested madvise behavior.
- * @err:	Pointer to store an error code from the check.
- *
- * If the specified behaviour is invalid or nothing would occur, we skip the
- * operation.  This function returns true in the cases, otherwise false.  In
- * the former case we store an error on @err.
- */
-static bool madvise_should_skip(unsigned long start, size_t len_in,
-		int behavior, int *err)
-{
-	if (!is_valid_madvise(start, len_in, behavior)) {
-		*err = -EINVAL;
-		return true;
-	}
-	if (start + PAGE_ALIGN(len_in) == start) {
-		*err = 0;
-		return true;
-	}
-	return false;
+	return 0;
 }
 
 static bool is_madvise_populate(struct madvise_behavior *madv_behavior)
@@ -2013,8 +1992,13 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
 		.tlb = &tlb,
 	};
 
-	if (madvise_should_skip(start, len_in, behavior, &error))
+	if (!madvise_behavior_valid(behavior))
+		return -EINVAL;
+
+	error = check_input_range(start, len_in);
+	if (error || !len_in)
 		return error;
+
 	error = madvise_lock(&madv_behavior);
 	if (error)
 		return error;
@@ -2056,7 +2040,8 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 		size_t len_in = iter_iov_len(iter);
 		int error;
 
-		if (madvise_should_skip(start, len_in, behavior, &error))
+		error = check_input_range(start, len_in);
+		if (error || !len_in)
 			ret = error;
 		else
 			ret = madvise_do_behavior(start, len_in, &madv_behavior);
@@ -2131,6 +2116,11 @@ SYSCALL_DEFINE5(process_madvise, int, pidfd, const struct iovec __user *, vec,
 		goto release_task;
 	}
 
+	if (!madvise_behavior_valid(behavior)) {
+		ret = -EINVAL;
+		goto release_mm;
+	}
+
 	/*
 	 * We need only perform this check if we are attempting to manipulate a
 	 * remote process's address space.
diff --git a/tools/testing/selftests/mm/process_madv.c b/tools/testing/selftests/mm/process_madv.c
index cd4610baf5d7d..3fffd5f7e6fb4 100644
--- a/tools/testing/selftests/mm/process_madv.c
+++ b/tools/testing/selftests/mm/process_madv.c
@@ -309,6 +309,34 @@ TEST_F(process_madvise, invalid_vlen)
 	ASSERT_EQ(munmap(map, pagesize), 0);
 }
 
+/*
+ * Test that invalid advice is rejected even when the iovec has zero total
+ * length. A request with valid advice and zero length is a noop, but
+ * invalid advice should still fail with EINVAL.
+ */
+TEST_F(process_madvise, invalid_advice_zero_length)
+{
+	struct iovec vec = {
+		.iov_base = NULL,
+		.iov_len = 0,
+	};
+	int pidfd = self->pidfd;
+	ssize_t ret;
+
+	errno = 0;
+	ret = sys_process_madvise(pidfd, &vec, 1, -1, 0);
+	ASSERT_EQ(ret, -1);
+	ASSERT_EQ(errno, EINVAL);
+
+	errno = 0;
+	ret = sys_process_madvise(pidfd, &vec, 1, MADV_DONTNEED, 0);
+	ASSERT_EQ(ret, 0);
+
+	ret = sys_process_madvise(pidfd, NULL, 0, -1, 0);
+	ASSERT_EQ(ret, -1);
+	ASSERT_EQ(errno, EINVAL);
+}
+
 /*
  * Test process_madvise() with an invalid flag value. Currently, only a flag
  * value of 0 is supported. This test is reserved for the future, e.g., if
base-commit: 1b55f8358e35a67bf3969339ea7b86988af92f66
-- 
2.34.1


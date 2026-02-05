Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA119AD5C;
	Thu,  5 Feb 2026 03:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770260750; cv=none; b=g57TZFcD2aSop6SBWgMjn923ic7YKW6SQ7Qg44lBMo5l0W8oxFbpT2XWKJYLDEnBFYFYLH3K67pOi+0Zpj0ZP5Xkbr95OwhdqpifN03LGdmvNcD0as2r2GrXvVg8x+RJuLOOalpwMGGFTuvkkiFXW/WdZUUbhChA56aO43ZZMzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770260750; c=relaxed/simple;
	bh=lTMA8WoLg/OYeQ5OBQIYfsVsEna6sCOEySBDAKxJYcA=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=sng2uXaCG9PCdMuWhiMY8agFwJ+Fgwx5/iUCB8z0y220J+sf9C8kJIYHgtS6CqO+XxZCBOyp3ldRDg0HvStJRNAfnuuKy+D05IiqLJc1AMaIs8d5r0H1TadAZbQ5YAC6UQg8bYkY4tcM4yeqHhuz828bI2YrSW+OLXgBtGqAVS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=M1mPaZJW; arc=none smtp.client-ip=43.163.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="M1mPaZJW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1770260740;
	bh=Y12lsiAwkX3O8VAU9kOpXG+LcfBLWN9TIM/N/v6zoho=;
	h=From:To:Cc:Subject:Date;
	b=M1mPaZJWDLv1ZGqd1pSfjRIKou6mb4gogzZkkBpCGMqCbYxj4ajj1NlTPLShD5t+K
	 kzHC+m8EtWhDTFTh0Qk+nkGqeo70UCYpjieIJq99FlvwbWqE0D44u5IWJSO4A/22Yn
	 /P0RLvTyvCF9Y2BF9OQ3tCorgF4eZmGKC52QSSwk=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.152])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 1639F258; Thu, 05 Feb 2026 11:05:35 +0800
X-QQ-mid: xmsmtpt1770260735tlxci1n25
Message-ID: <tencent_7D6D776D157570FF8C9FB9DE9D9FE5257C0A@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+sQ4hzXKvMJ4VkyPu9FUmml5XQIz1qZ+vj7AU5GqTN+g/TGWJHR
	 o/rbLJI/qXfeMFvsshsrFhlRyqvzfAG6lxoyCHt7/bl1OMwXNoS3omx7yXy7F26HeTEu7P6oHHLa
	 qfSdC43Wcaq2O9mWx0P8wstt1OvBaIzTVVxp/MFMySq4ctE2eoSiBMUC9OSlHQZKL2UIGGdKuFPM
	 6SuIMX7ViBSWLSZa8eEg4+EHlTdjzhMf2+tafvsKprwyiLztIGL7MunPnEIAR2Fuyb+URq3lyo0U
	 Mp3Syt5/8CMy9spFbdiVahsIJhILg/Qz4X1p8PUPMuvB+5yQt4gi+dbWQVdA0NJdeZJnI46EQhT6
	 XearcBsIKJ4M55gSzKwFbIkITJz0a3JE49V3qtBBYd3+UXze+xqKM8W51qXlJ//GNNLgrVIE2mj7
	 WJ2nCsGA7jcb87bF1UqErjNmlhE5tzBDZzYWpiNAH+B/2l3otoendFEFDCMV0AW1XKLe59LCYsiM
	 qoxJDuILUH9hgYfCRAvFchoWCGmeRzIpivY31IlePieyhKuviANMhr5kh3ju50PlVw8O3e2Jlr3W
	 eKwXbylriE3YGcmb4TdBhjWb8HbDTUsX4VIosoKH1r53wBh50Wf/NvcgeN6eIqmRL6Bi/qnUkY94
	 vd9owzc55vyZHsg1AoG2q1L5hk4p2yBZNWgg0ggiNVXJAetgoIpPP5Oa5/UvTnwwBduU4PXGeg4A
	 O5bdRpTEEcHAEu2VmHJZ3DjaBhqZGmL9wz7CmlOdOt/vRhGpxlGr4OqzdzJyNmYi5N0sYmKCvSmF
	 8gY2jKgDCTamJ/srvE2NdE8MpLM4jmDl6dlPyHWqG1KcsKA5NDhsytWyEg5cHOjZCOsK9fBGJJUI
	 wS6dLwi/s16+MNQwAHNZzsv3xAn1Rsrp0LqIROXE3U29juxqRIFWtZIZJbdXY6SmrJUdoW0GFKma
	 aGbKmhhGClJ6FgtXo24dc7S+RiXA+P5pCqQIiDhvoX0joSR6XENZ50foslK6U/Q3XEGYMmrdKQwu
	 TJY1xTjhdQz9pWMsq50FPvkOgj9354ETH7Urh9u7j6MDlqE+NUhan3cIctB6ts+AR1Vxr3zVGWgk
	 msOtxWEZ7jTti8J0OnsrkeVtW5kA==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: tglx@kernel.org
Cc: ywen.chen@foxmail.com,
	akpm@linux-foundation.org,
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
	usama.anjum@collabora.com,
	wakel@google.com
Subject: [PATCH] selftests/futex: fix incorrect result reporting of futex_wait test item
Date: Thu,  5 Feb 2026 11:05:34 +0800
X-OQ-MSGID: <20260205030534.74877-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the code to use EXPECT/ASSERT() variants, which ensures that the
overall test result is fail if one of the EXPECT()s fails.

Signed-off-by: Yuwen Chen <ywen.chen@foxmail.com>
---
 .../selftests/futex/functional/futex_wait.c   | 64 ++++---------------
 1 file changed, 14 insertions(+), 50 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_wait.c b/tools/testing/selftests/futex/functional/futex_wait.c
index 7b88794090071..4361809e669db 100644
--- a/tools/testing/selftests/futex/functional/futex_wait.c
+++ b/tools/testing/selftests/futex/functional/futex_wait.c
@@ -41,61 +41,39 @@ TEST(private_futex)
 	unsigned int flags = FUTEX_PRIVATE_FLAG;
 	u_int32_t f_private = 0;
 	pthread_t waiter;
-	int res;
 
 	futex = &f_private;
 
 	/* Testing a private futex */
-	ksft_print_dbg_msg("Calling private futex_wait on futex: %p\n", futex);
-	if (pthread_create(&waiter, NULL, waiterfn, (void *) &flags))
-		ksft_exit_fail_msg("pthread_create failed\n");
+	ASSERT_EQ(0, pthread_create(&waiter, NULL, waiterfn, (void *) &flags));
 
 	usleep(WAKE_WAIT_US);
 
-	ksft_print_dbg_msg("Calling private futex_wake on futex: %p\n", futex);
-	res = futex_wake(futex, 1, FUTEX_PRIVATE_FLAG);
-	if (res != 1) {
-		ksft_test_result_fail("futex_wake private returned: %d %s\n",
-				      errno, strerror(errno));
-	} else {
-		ksft_test_result_pass("futex_wake private succeeds\n");
-	}
+	EXPECT_EQ(1, futex_wake(futex, 1, FUTEX_PRIVATE_FLAG));
 }
 
 TEST(anon_page)
 {
 	u_int32_t *shared_data;
 	pthread_t waiter;
-	int res, shm_id;
+	int shm_id;
 
 	/* Testing an anon page shared memory */
 	shm_id = shmget(IPC_PRIVATE, 4096, IPC_CREAT | 0666);
-	if (shm_id < 0) {
-		if (errno == ENOSYS)
-			ksft_exit_skip("shmget syscall not supported\n");
-		perror("shmget");
-		exit(1);
-	}
+	if (shm_id < 0 && errno == ENOSYS)
+		SKIP(return, "shmget syscall not supported");
+	ASSERT_LE(0, shm_id);
 
 	shared_data = shmat(shm_id, NULL, 0);
 
 	*shared_data = 0;
 	futex = shared_data;
 
-	ksft_print_dbg_msg("Calling shared (page anon) futex_wait on futex: %p\n", futex);
-	if (pthread_create(&waiter, NULL, waiterfn, NULL))
-		ksft_exit_fail_msg("pthread_create failed\n");
+	ASSERT_EQ(0, pthread_create(&waiter, NULL, waiterfn, NULL));
 
 	usleep(WAKE_WAIT_US);
 
-	ksft_print_dbg_msg("Calling shared (page anon) futex_wake on futex: %p\n", futex);
-	res = futex_wake(futex, 1, 0);
-	if (res != 1) {
-		ksft_test_result_fail("futex_wake shared (page anon) returned: %d %s\n",
-				      errno, strerror(errno));
-	} else {
-		ksft_test_result_pass("futex_wake shared (page anon) succeeds\n");
-	}
+	EXPECT_EQ(1, futex_wake(futex, 1, 0));
 
 	shmdt(shared_data);
 }
@@ -104,39 +82,25 @@ TEST(file_backed)
 {
 	u_int32_t f_private = 0;
 	pthread_t waiter;
-	int res, fd;
+	int fd;
 	void *shm;
 
 	/* Testing a file backed shared memory */
-	fd = open(SHM_PATH, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
-	if (fd < 0)
-		ksft_exit_fail_msg("open\n");
-
-	if (ftruncate(fd, sizeof(f_private)))
-		ksft_exit_fail_msg("ftruncate\n");
+	ASSERT_LE(0, (fd = open(SHM_PATH, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR)));
+	ASSERT_EQ(0, ftruncate(fd, sizeof(f_private)));
 
 	shm = mmap(NULL, sizeof(f_private), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
-	if (shm == MAP_FAILED)
-		ksft_exit_fail_msg("mmap\n");
+	ASSERT_NE(MAP_FAILED, shm);
 
 	memcpy(shm, &f_private, sizeof(f_private));
 
 	futex = shm;
 
-	ksft_print_dbg_msg("Calling shared (file backed) futex_wait on futex: %p\n", futex);
-	if (pthread_create(&waiter, NULL, waiterfn, NULL))
-		ksft_exit_fail_msg("pthread_create failed\n");
+	ASSERT_EQ(0, pthread_create(&waiter, NULL, waiterfn, NULL));
 
 	usleep(WAKE_WAIT_US);
 
-	ksft_print_dbg_msg("Calling shared (file backed) futex_wake on futex: %p\n", futex);
-	res = futex_wake(shm, 1, 0);
-	if (res != 1) {
-		ksft_test_result_fail("futex_wake shared (file backed) returned: %d %s\n",
-				      errno, strerror(errno));
-	} else {
-		ksft_test_result_pass("futex_wake shared (file backed) succeeds\n");
-	}
+	EXPECT_EQ(1, futex_wake(shm, 1, 0));
 
 	munmap(shm, sizeof(f_private));
 	remove(SHM_PATH);
-- 
2.34.1


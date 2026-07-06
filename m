Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6424E13B7A3;
	Mon,  6 Jul 2026 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783310351; cv=none; b=TSgw5fhk0Ro4cpwXOFVt9BsPL8LT8NlgnZdctNmRkJ+vUCfRzkZPgR2AcTFvdY7uIn7iucNI0dOnJLZuJ7KhDfUfiVpKn7UIGz5VWXhoHg4Yc3vvhvJ2udGmN2kDJht6RfEM5nc6fDF0pZn1a69A5AaizwGl3yr2P87fvXYQLFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783310351; c=relaxed/simple;
	bh=KcUjECmT8qbvu9cy91WCloTJtked/iHjGwMhNy3Dh0I=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=AwWc25n7PzkhqQ2CVcr+Gu9qjjvj7YWL4FK22k4uiOmfthVlIlFO0Obn6HGzna2nbO7J9WjZaPCORWxpt2SDJ9EDGayy2em/L0b/VKKG0Sy7CLons18oWgHdpyBSHoBX2rHzj0E4PV3v7h5sh8kwfJJfe3eFxLZk8UZllExoUGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=fER2xBB/; arc=none smtp.client-ip=203.205.221.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="fER2xBB/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783310341; bh=o64tfF3fYPyjWfeVM/TEZZt/j8xUqNhbk93+0xG+eHs=;
	h=From:To:Cc:Subject:Date;
	b=fER2xBB/a2ZM3ieFF+sr/E9ZkYCQP44YUfA8teF0Q4UJFbVpje3LmsCyqlY//p7vf
	 DhBxJktsWnGF5YK50+RUf53yVZBJhQF6cZQpXPn07td7Z26o6+9bdb2ZM7jIAiXv+d
	 wt4Hw/+hSSySoWCSp9WaLzKP21gli0v6Cs4hZhE0=
Received: from LAPTOP-KNA43L24 ([2409:895b:392d:412a:acbe:c97a:332c:6a13])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id EB6B2081; Mon, 06 Jul 2026 11:58:54 +0800
X-QQ-mid: xmsmtpt1783310334tw6o8csby
Message-ID: <tencent_A5250C60EEEE40527F79A6EC54C28CB7C205@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+z5JTMGSvk3GGmkBULpUW0/ewzfSgf3zCQ/r6XWYQg/ZqoQQJnC
	 pa+0nGR0dMG9EIz8luFksoP89jrOhCuvRJFcVxEKJQuR+eQXcMvEK4UjXUZOF2cKWqNbfv70Tue2
	 yTrcQ55+wQDlMvkh7accNOSAd2WodohmYb2SMeYurEyvdBDkZwkIpJo9SLBpI+sbWhRkPNc/HRg/
	 iLgLQbLHVM1ETqBdGhkIK0P+nX3kUhVzR6wUGNRiXXMIB9iCIqTXwnTcqqpsLyK1Zo4QhJWFiqDG
	 eiFRkuogGGAwUDl8QAfiiBnssU4kCHMnAra6p7o6SmQQ9PMilwWsn+ozzLoSuRkLDRQFrOXtXEP5
	 uc1YKSAtQ4nZCJX0DRmEQyOL5dWjoWzx6wazI5gJU74HYH8fgpzien42l0BBls2UcsCkab2jO7XA
	 SpVW382+jIBjHxbq1bJ/af7tUyfcbs/irp1hL+LHEXYzJUb5m2Sha6nkcTq3NVXamJXVzgXMwVlG
	 0Hq3BSKBeqYGm+1jAW/A+T2+Zn+BeYvhOaNoEnuYxgUw4Rm1BYZ23Y5fFKD52EhrQ5KhX1SsUaJ1
	 E5rFZ7jB09yKuQzXx9qMsbHzDtTAG1JXRezGlaB5C52iHrm5UosH4KNz/3Fro3L08tQtRLjeuEre
	 MKF8Wd29SFlp3EMIxY2D1Rjg6vwhQKzkI143I6RwhZ2y0aUE+iKbHJuTAuvJDTnWaaVNZP7HqJH+
	 0gfznopFpQ21BkTqZpNAk6pSrXpxnWyUkv86CRWZ1SCarF4VzZV8WnjTQNDLKEKbNsGnaP1zVu8L
	 Kg2UISi87qhEMVCBbhYmtZUpOzYV4emEqiwU5DFwqRscRkzM1MFrjGlkQpgWO6dUTpgxw6nc4PGE
	 jjCmb0T7Qcn4RzeuM4sgEy6FHp1I/7MzXNEC36b3UvaeLmHzScLRFv1Lk1lOCy8EaZSbEh33CivP
	 h3p84w2hopvusgq2FcWGXa104mQjjD/Am5woflGRF6MqP9W2KmgaXyitIZ7dvQNgpoRvTFb0uUbE
	 e7hIdhtEbms0VtG+4jkDhfzu+84AU=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Ding Junlin <1746193727@qq.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ding Junlin <1746193727@qq.com>
Subject: [PATCH] selftests/core: Allow file descriptor 0 in close_range_test
Date: Mon,  6 Jul 2026 11:58:47 +0800
X-OQ-MSGID: <20260706035847.1812-1-1746193727@qq.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

File descriptors returned by open() and dup2() are valid when they are
greater than or equal to 0. Checking for strictly greater than 0 can make
close_range_test fail when descriptor 0 is available, for example if stdin
is closed before the test runs.

Use EXPECT_GE(..., 0) for file descriptor validity checks.

Signed-off-by: Ding Junlin <1746193727@qq.com>
---
 .../testing/selftests/core/close_range_test.c  | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/core/close_range_test.c b/tools/testing/selftests/core/close_range_test.c
index f14eca63f20c..3fd0eadfdc74 100644
--- a/tools/testing/selftests/core/close_range_test.c
+++ b/tools/testing/selftests/core/close_range_test.c
@@ -389,10 +389,10 @@ TEST(close_range_cloexec_syzbot)
 
 	/* Create a huge gap in the fd table. */
 	fd1 = open("/dev/null", O_RDWR);
-	EXPECT_GT(fd1, 0);
+	EXPECT_GE(fd1, 0);
 
 	fd2 = dup2(fd1, 1000);
-	EXPECT_GT(fd2, 0);
+	EXPECT_GE(fd2, 0);
 
 	flags = fcntl(fd1, F_DUPFD_QUERY, fd2);
 	if (flags < 0) {
@@ -423,7 +423,7 @@ TEST(close_range_cloexec_syzbot)
 		EXPECT_EQ(flags & FD_CLOEXEC, FD_CLOEXEC);
 
 		fd3 = dup2(fd1, 42);
-		EXPECT_GT(fd3, 0);
+		EXPECT_GE(fd3, 0);
 
 		flags = fcntl(fd1, F_DUPFD_QUERY, fd3);
 		if (flags < 0) {
@@ -462,7 +462,7 @@ TEST(close_range_cloexec_syzbot)
 	EXPECT_EQ(flags & FD_CLOEXEC, FD_CLOEXEC);
 
 	fd3 = dup2(fd1, 42);
-	EXPECT_GT(fd3, 0);
+	EXPECT_GE(fd3, 0);
 
 	flags = fcntl(fd1, F_DUPFD_QUERY, fd3);
 	if (flags < 0) {
@@ -472,7 +472,7 @@ TEST(close_range_cloexec_syzbot)
 	}
 
 	fd4 = open("/dev/null", O_RDWR);
-	EXPECT_GT(fd4, 0);
+	EXPECT_GE(fd4, 0);
 
 	/* Same inode, different file pointers. */
 	flags = fcntl(fd1, F_DUPFD_QUERY, fd4);
@@ -516,10 +516,10 @@ TEST(close_range_cloexec_unshare_syzbot)
 	 * to be sure.
 	 */
 	fd1 = open("/dev/null", O_RDWR);
-	EXPECT_GT(fd1, 0);
+	EXPECT_GE(fd1, 0);
 
 	fd2 = dup2(fd1, 1000);
-	EXPECT_GT(fd2, 0);
+	EXPECT_GE(fd2, 0);
 
 	for (i = 0; i < 100; i++) {
 
@@ -546,7 +546,7 @@ TEST(close_range_cloexec_unshare_syzbot)
 			EXPECT_EQ(flags & FD_CLOEXEC, FD_CLOEXEC);
 
 			fd3 = dup2(fd1, 42);
-			EXPECT_GT(fd3, 0);
+			EXPECT_GE(fd3, 0);
 
 			/*
 			 * Duplicating the file descriptor must remove the
@@ -582,7 +582,7 @@ TEST(close_range_cloexec_unshare_syzbot)
 	EXPECT_EQ(flags & FD_CLOEXEC, 0);
 
 	fd3 = dup2(fd1, 42);
-	EXPECT_GT(fd3, 0);
+	EXPECT_GE(fd3, 0);
 
 	flags = fcntl(fd3, F_GETFD);
 	EXPECT_GT(flags, -1);
-- 
2.50.1.windows.1


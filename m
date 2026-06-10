Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6A6381AE2
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 23:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781132962; cv=none; b=i7LEPZFIzZiEYDQw9+JZys/d2/SE7ATQo+qO07B4VloepCeZQW5rWunV4haAIVeeNpaKGizSYPxS28um9mO0zk399BY0m5sGm11Ptb1VEq9HFqddJYcda9HS35goSQEPnieMy6Ojm7shqdSVWQtmn0Y7OtX3+uGZ6NtGJ7+LzVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781132962; c=relaxed/simple;
	bh=BSW8r03YPXdKsG4OQyl5SVUyiP+PW1zHpUiy/nAKiHc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F/NJt5K8ub3jDhl1UVqq1OOYhX4sw7lM7WyhIJwVeCdhZsqEcE7h+/nFvIkdts5eHga70qUIpmC6tftPc4VS+N48iYhshfUrbBrIlMp8h3geeu+El+fHMkKZqCIQ2Qgi82lrjBSFa9WeG/NZpwtjpomQpbb/zjCrRX0Vqsicc3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W9C9G/PW; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W9C9G/PW"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2beff6b6e74so72928345ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 16:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781132957; x=1781737757; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xiUkUKbbG5deAylPZ6LVrWFSOhIO30paK4vC1S4mCjU=;
        b=W9C9G/PWfYy04Tq4uxiOG9lhqm5FPLxNY1qrB40przVH9Wyz3YgthnclzXRXeo9Fiv
         sTZKSECLUhsD6ZeGGptCS8BdhGn500z39KI9M7ST8UhgjotPM55zc5Q7uiyoBzqFbtbH
         gF8gflr2T6fxSrJFGmSF4iKTFwrZrUbiKmkeESsRNjND/q+CaOB0kf8W/FUVo9gZLBq4
         Cs914B0L6BkFQSiUQDGgLWzSGnUv+Y2vQXT03+w9UlHWVUciitiIyG8D7Nb/G9BY8Hxd
         DIeRwt2yYHZz7UMreQ2ZTDJephUwaNw3zB0P0nqtZaQ3LS+t+eJSyJ0dnjBW1gvyOkv7
         C0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132957; x=1781737757;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xiUkUKbbG5deAylPZ6LVrWFSOhIO30paK4vC1S4mCjU=;
        b=KxrdfVmFmyEoXlCLJmu1KhDBnGBs8tF1gPRmQ46Bi4icV3wIq0BMe8udqfrHqZnCH1
         6gc7u2LpwfK6/ZOOwfOL3i8DlcppXIW3NbV5BenooSK+z9IiXyKEgD3GSbjmac0eirkV
         twaTR4o4tBprgxd4czLUEQL/LtFyneYTBSzKFDhBqwVjQ6cwKrJIs5/zw/htF5ZPaLaX
         lrCv0AuJUyQHql5HWkbaZg4pczP5+Oleix7BcYY+dfJQjyIVkz/ZE99/avM5cFewNgk0
         r9CsibPt5+syqopebvxYqpe2SSXn1675iiiQWRZRIHiePUPvfmmkhdXg5sLK3skB7o3W
         UURA==
X-Forwarded-Encrypted: i=1; AFNElJ+y9VYdMFICITIcqWYiDzxDQaeITZvIVOAVCYun2WiOZR8kbxSt0ue9KMI+ksQhn+0r3EgYOs/z8XJ73BbVtHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP6zo67E4NqJLbasWyLkJG2o97NcfR0gkx3CawaT1I8IzhQyUq
	C2G1MFdQWDXPSISjJVd74teMJfdFmEDEo6LXJZxDUsv/NxqgbG95RdQKQkCr339tckBBulTdCeB
	RXahzzZb0kQ==
X-Received: from plom12.prod.google.com ([2002:a17:903:3c0c:b0:2bf:1486:2669])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3d10:b0:2c2:2a8a:af69
 with SMTP id d9443c01a7336-2c2f0f1f8a2mr906585ad.9.1781132956533; Wed, 10 Jun
 2026 16:09:16 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:09:08 -0700
In-Reply-To: <20260610230909.876546-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260610230909.876546-1-vipinsh@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260610230909.876546-3-vipinsh@google.com>
Subject: [PATCH v2 2/2] selftests/liveupdate: Add helpers to preserve/retrieve FDs
From: Vipin Sharma <vipinsh@google.com>
To: pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org
Cc: tarunsahu@google.com, skhawaja@google.com, shuah@kernel.org, 
	dmatlack@google.com, linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Add helper functions to preserve and retrieve file descriptors from an
LUO session. This allows library users to work with FD preservation.

Now that there are helpers, use them instead of direct ioctl calls
in liveupdate.c

No functional change intended.

Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |  2 +
 .../selftests/liveupdate/lib/liveupdate.c     | 41 +++++++++++++++----
 .../testing/selftests/liveupdate/liveupdate.c | 38 ++++++-----------
 3 files changed, 46 insertions(+), 35 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index 6ff71d7c3d9c..2c6a6f6a2733 100644
--- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
+++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
@@ -27,6 +27,8 @@ int luo_retrieve_session(int luo_fd, const char *name);
 int luo_session_finish(int session_fd);
 
 int luo_ensure_nofile_limit(long min_limit);
+int luo_session_preserve_fd(int session_fd, int fd, __u64 token);
+int luo_session_retrieve_fd(int session_fd, __u64 token);
 
 int create_and_preserve_memfd(int session_fd, int token, const char *data);
 int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
diff --git a/tools/testing/selftests/liveupdate/lib/liveupdate.c b/tools/testing/selftests/liveupdate/lib/liveupdate.c
index 897c200f3845..961a732b541d 100644
--- a/tools/testing/selftests/liveupdate/lib/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/lib/liveupdate.c
@@ -78,9 +78,35 @@ int luo_retrieve_session(int luo_fd, const char *name)
 	return arg.fd;
 }
 
+int luo_session_preserve_fd(int session_fd, int fd, __u64 token)
+{
+	struct liveupdate_session_preserve_fd arg = {
+		.size = sizeof(arg),
+		.fd = fd,
+		.token = token,
+	};
+
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg) < 0)
+		return -errno;
+
+	return 0;
+}
+
+int luo_session_retrieve_fd(int session_fd, __u64 token)
+{
+	struct liveupdate_session_retrieve_fd arg = {
+		.size = sizeof(arg),
+		.token = token,
+	};
+
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_RETRIEVE_FD, &arg) < 0)
+		return -errno;
+
+	return arg.fd;
+}
+
 int create_and_preserve_memfd(int session_fd, int token, const char *data)
 {
-	struct liveupdate_session_preserve_fd arg = { .size = sizeof(arg) };
 	long page_size = sysconf(_SC_PAGE_SIZE);
 	void *map = MAP_FAILED;
 	int mfd = -1, ret = -1;
@@ -99,9 +125,8 @@ int create_and_preserve_memfd(int session_fd, int token, const char *data)
 	snprintf(map, page_size, "%s", data);
 	munmap(map, page_size);
 
-	arg.fd = mfd;
-	arg.token = token;
-	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg) < 0)
+	ret = luo_session_preserve_fd(session_fd, mfd, token);
+	if (ret)
 		goto out;
 
 	ret = 0;
@@ -116,15 +141,13 @@ int create_and_preserve_memfd(int session_fd, int token, const char *data)
 int restore_and_verify_memfd(int session_fd, int token,
 			     const char *expected_data)
 {
-	struct liveupdate_session_retrieve_fd arg = { .size = sizeof(arg) };
 	long page_size = sysconf(_SC_PAGE_SIZE);
 	void *map = MAP_FAILED;
 	int mfd = -1, ret = -1;
 
-	arg.token = token;
-	if (ioctl(session_fd, LIVEUPDATE_SESSION_RETRIEVE_FD, &arg) < 0)
-		return -errno;
-	mfd = arg.fd;
+	mfd = luo_session_retrieve_fd(session_fd, token);
+	if (mfd < 0)
+		return mfd;
 
 	map = mmap(NULL, page_size, PROT_READ, MAP_SHARED, mfd, 0);
 	if (map == MAP_FAILED)
diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index 6bfd4e53528c..e17a13136330 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -170,20 +170,6 @@ TEST_F(liveupdate_device, create_distinct_sessions)
 	ASSERT_EQ(close(session_fd2), 0);
 }
 
-static int preserve_fd(int session_fd, int fd_to_preserve, __u64 token)
-{
-	struct liveupdate_session_preserve_fd args = {};
-
-	args.size = sizeof(args);
-	args.fd = fd_to_preserve;
-	args.token = token;
-
-	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &args))
-		return -errno;
-
-	return 0;
-}
-
 /*
  * Test Case: Preserve MemFD
  *
@@ -208,7 +194,7 @@ TEST_F(liveupdate_device, preserve_memfd)
 	ASSERT_GE(mem_fd, 0);
 
 	ASSERT_EQ(write(mem_fd, test_str, strlen(test_str)), strlen(test_str));
-	ASSERT_EQ(preserve_fd(session_fd, mem_fd, 0x1234), 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd, 0x1234), 0);
 	ASSERT_EQ(close(session_fd), 0);
 
 	ASSERT_EQ(lseek(mem_fd, 0, SEEK_SET), 0);
@@ -247,8 +233,8 @@ TEST_F(liveupdate_device, preserve_multiple_memfds)
 	ASSERT_EQ(write(mem_fd1, test_str1, strlen(test_str1)), strlen(test_str1));
 	ASSERT_EQ(write(mem_fd2, test_str2, strlen(test_str2)), strlen(test_str2));
 
-	ASSERT_EQ(preserve_fd(session_fd, mem_fd1, 0xAAAA), 0);
-	ASSERT_EQ(preserve_fd(session_fd, mem_fd2, 0xBBBB), 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd1, 0xAAAA), 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd2, 0xBBBB), 0);
 
 	memset(read_buf, 0, sizeof(read_buf));
 	ASSERT_EQ(lseek(mem_fd1, 0, SEEK_SET), 0);
@@ -303,10 +289,10 @@ TEST_F(liveupdate_device, preserve_complex_scenario)
 	mem_fd_empty2 = memfd_create("empty2", 0);
 	ASSERT_GE(mem_fd_empty2, 0);
 
-	ASSERT_EQ(preserve_fd(session_fd1, mem_fd_data1, 0x1111), 0);
-	ASSERT_EQ(preserve_fd(session_fd1, mem_fd_empty1, 0x2222), 0);
-	ASSERT_EQ(preserve_fd(session_fd2, mem_fd_data2, 0x3333), 0);
-	ASSERT_EQ(preserve_fd(session_fd2, mem_fd_empty2, 0x4444), 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd1, mem_fd_data1, 0x1111), 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd1, mem_fd_empty1, 0x2222), 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd2, mem_fd_data2, 0x3333), 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd2, mem_fd_empty2, 0x4444), 0);
 
 	ASSERT_EQ(lseek(mem_fd_data1, 0, SEEK_SET), 0);
 	ASSERT_EQ(read(mem_fd_data1, read_buf, sizeof(read_buf)), strlen(data1));
@@ -355,7 +341,7 @@ TEST_F(liveupdate_device, preserve_unsupported_fd)
 	unsupported_fd = open("/dev/null", O_RDWR);
 	ASSERT_GE(unsupported_fd, 0);
 
-	ret = preserve_fd(session_fd, unsupported_fd, 0xDEAD);
+	ret = luo_session_preserve_fd(session_fd, unsupported_fd, 0xDEAD);
 	EXPECT_EQ(ret, -ENOENT);
 
 	ASSERT_EQ(close(unsupported_fd), 0);
@@ -388,14 +374,14 @@ TEST_F(liveupdate_device, prevent_double_preservation)
 	ASSERT_GE(mem_fd, 0);
 
 	/* First preservation should succeed */
-	ASSERT_EQ(preserve_fd(session_fd1, mem_fd, 0x1111), 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd1, mem_fd, 0x1111), 0);
 
 	/* Second preservation in a different session should fail with EBUSY */
-	ret = preserve_fd(session_fd2, mem_fd, 0x2222);
+	ret = luo_session_preserve_fd(session_fd2, mem_fd, 0x2222);
 	EXPECT_EQ(ret, -EBUSY);
 
 	/* Second preservation in the same session (different token) should fail with EBUSY */
-	ret = preserve_fd(session_fd1, mem_fd, 0x3333);
+	ret = luo_session_preserve_fd(session_fd1, mem_fd, 0x3333);
 	EXPECT_EQ(ret, -EBUSY);
 
 	ASSERT_EQ(close(mem_fd), 0);
@@ -565,7 +551,7 @@ TEST_F(liveupdate_device, preserve_many_files)
 	for (i = 0; i < MANY_FILES; i++) {
 		mem_fds[i] = memfd_create("test-memfd", 0);
 		ASSERT_GE(mem_fds[i], 0);
-		ASSERT_EQ(preserve_fd(session_fd, mem_fds[i], i), 0);
+		ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fds[i], i), 0);
 	}
 
 	for (i = 0; i < MANY_FILES; i++)
-- 
2.54.0.1099.g489fc7bff1-goog


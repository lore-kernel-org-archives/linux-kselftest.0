Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A873C9EE5
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 20:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579530; cv=none; b=Ewzy9T97B0TSOMUaKZRVswkt1uhlkzQjADPNwMKzSoxlD8N/DqRqTUU+eoMn8OvuaAfOto/Q/dfKmwlA/ZrKt09L7r4gzNLUmNs8CIQYF1ihiRGcVBSmdE+cRNxV6Qi10qGL0Sbln1gX+s0/NVELtsj4zIutCl/JKPp4zg06Y1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579530; c=relaxed/simple;
	bh=5MvrFjRMYK2s0gs1A9vvtO4sbeJ5TNHDaWeV7xw6huY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aDlMg6kRIN6r452KpndRvIZOYcnnxOAEESIBUOJQvoxWX9lHmD3KnM2ArIk/CAWhUqBlpLVAtCGtJbzJbdkypvzngseVDpaqRvaDbuaHz668A6V8WVTYFNuiMrh9dIr4SepqYD9g+nXLvzvPAUYpOeL9DxgdUvmJU7/3MEvoSkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pRa71yrD; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pRa71yrD"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-384419c6c74so13392695a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 13:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784579527; x=1785184327; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fi8xeCp6XPPBE7dFzJmCqzaIXOtrA82+UGnJsprXgM8=;
        b=pRa71yrDpwf5BoIBC/VKA0UCEeR2AcZbVspLkoRgHVl8itD4g2Xr7rKskiOCRQzzpT
         Z6WlGiqZW3GzycBKIo7351a0qIITOFZrl3pdL9n2xEHJ19nb5UCPlUE5ylKgXqLjwoh0
         RI4L43Zx1ujW0cb/PNSicbwoDYwBPyAB26lpic5joJj1TWwLGcttDmPSXaBFtBQ8W+u6
         39zdNv04VHWYo9x+HEWTrsVqCh1gtyfwyJEz+2CtcXsCLmh6NcMBj1YjKptRbH/WRWbA
         6UXxuES1S63PtinvR1+rVcQtcN+kBVtJckrcH/IPw/l2eMSlMJTqoAIW11kyH0jTx0W7
         wd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784579527; x=1785184327;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fi8xeCp6XPPBE7dFzJmCqzaIXOtrA82+UGnJsprXgM8=;
        b=eH25+4T7UJowSc6tR5lsS1CusEU1OCmbD6JieuJwTnUNXAY2AuTm2gPZhl0euokBSR
         W3A4NYsjYRmAZ+nZibUa04QsEts8SirXWQkcC045vp73VuUirtcCa8CyYv5c+ER2vOMB
         aqsyaP0LqzuZPvZqXu8HLZD77tLQv867vLALsUFplshrinYFIwIPee2Ey+r/mIyX/QAp
         +UVvQjVLgvCXZoitEvB8eGI7OncT2u99/dkrPJfU6WyEVZXG5gHPcL3PLTAVPYueQBI2
         GpfEMvYltD4XZ+b4+lbOdr1DL9ubcF9I9ONal3n04gVPU1C//BpZcQjo3ht476ITo1zu
         Tn/A==
X-Forwarded-Encrypted: i=1; AHgh+Rp874s0UKUhZmxQENOXe6L0NXmgmeaLuCuuG7X/FqIXeXsXDyqTO8zjiz5U01Ocwl9Dtqkpsiyhsf6DCrga4kI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO7sVWAmvbQIbkz2iuxI19bcUwbYFFqu+IE5f6zanFLmP8FThx
	vGEjB0hCvXZkXdXqMNoH/1J8reOspqDgysqszy0tPrXJjFUYhReIIEngYzC2Mjc8mtz1KHz/9uQ
	uXef4KYj7Xg==
X-Received: from pjkk7.prod.google.com ([2002:a17:90b:57e7:b0:380:fc48:584e])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1844:b0:37f:9ce1:cdb2
 with SMTP id 98e67ed59e1d1-38e4b55aeebmr16648660a91.32.1784579526707; Mon, 20
 Jul 2026 13:32:06 -0700 (PDT)
Date: Mon, 20 Jul 2026 13:32:01 -0700
In-Reply-To: <20260720203202.1964557-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260720203202.1964557-1-vipinsh@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720203202.1964557-2-vipinsh@google.com>
Subject: [PATCH v4 1/2] selftests/liveupdate: Use luo_test_utils.c for
 liveupdate ioctl APIs
From: Vipin Sharma <vipinsh@google.com>
To: pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org
Cc: tarunsahu@google.com, skhawaja@google.com, shuah@kernel.org, 
	dmatlack@google.com, linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Use luo_test_utils.c for all live update ioctl calls. Remove direct
ioctl calls in liveupdate.c. This avoids code duplication and use common
interface.

While at it, make ioctl error check stricter as liveupdate APIs don't
return postive numbers as a valid result.

Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../testing/selftests/liveupdate/liveupdate.c | 104 +++++-------------
 .../selftests/liveupdate/luo_test_utils.c     |  61 ++++++++--
 .../selftests/liveupdate/luo_test_utils.h     |   3 +
 3 files changed, 83 insertions(+), 85 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index 502fb3567e38..5c7ed2512710 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -89,36 +89,6 @@ TEST_F(liveupdate_device, exclusive_open)
 	EXPECT_EQ(errno, EBUSY);
 }
 
-/* Helper function to create a LUO session via ioctl. */
-static int create_session(int lu_fd, const char *name)
-{
-	struct liveupdate_ioctl_create_session args = {};
-
-	args.size = sizeof(args);
-	strncpy((char *)args.name, name, sizeof(args.name) - 1);
-
-	if (ioctl(lu_fd, LIVEUPDATE_IOCTL_CREATE_SESSION, &args))
-		return -errno;
-
-	return args.fd;
-}
-
-/* Helper function to get a session name via ioctl. */
-static int get_session_name(int session_fd, char *name, size_t name_len)
-{
-	struct liveupdate_session_get_name args = {};
-
-	args.size = sizeof(args);
-
-	if (ioctl(session_fd, LIVEUPDATE_SESSION_GET_NAME, &args))
-		return -errno;
-
-	strncpy(name, (char *)args.name, name_len - 1);
-	name[name_len - 1] = '\0';
-
-	return 0;
-}
-
 /*
  * Test Case: Create Duplicate Session
  *
@@ -135,10 +105,10 @@ TEST_F(liveupdate_device, create_duplicate_session)
 
 	ASSERT_GE(self->fd1, 0);
 
-	session_fd1 = create_session(self->fd1, "duplicate-session-test");
+	session_fd1 = luo_create_session(self->fd1, "duplicate-session-test");
 	ASSERT_GE(session_fd1, 0);
 
-	session_fd2 = create_session(self->fd1, "duplicate-session-test");
+	session_fd2 = luo_create_session(self->fd1, "duplicate-session-test");
 	EXPECT_LT(session_fd2, 0);
 	EXPECT_EQ(-session_fd2, EEXIST);
 
@@ -160,30 +130,16 @@ TEST_F(liveupdate_device, create_distinct_sessions)
 
 	ASSERT_GE(self->fd1, 0);
 
-	session_fd1 = create_session(self->fd1, "distinct-session-1");
+	session_fd1 = luo_create_session(self->fd1, "distinct-session-1");
 	ASSERT_GE(session_fd1, 0);
 
-	session_fd2 = create_session(self->fd1, "distinct-session-2");
+	session_fd2 = luo_create_session(self->fd1, "distinct-session-2");
 	ASSERT_GE(session_fd2, 0);
 
 	ASSERT_EQ(close(session_fd1), 0);
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
@@ -201,14 +157,14 @@ TEST_F(liveupdate_device, preserve_memfd)
 		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
 	ASSERT_GE(self->fd1, 0);
 
-	session_fd = create_session(self->fd1, "preserve-memfd-test");
+	session_fd = luo_create_session(self->fd1, "preserve-memfd-test");
 	ASSERT_GE(session_fd, 0);
 
 	mem_fd = memfd_create("test-memfd", 0);
 	ASSERT_GE(mem_fd, 0);
 
 	ASSERT_EQ(write(mem_fd, test_str, strlen(test_str)), strlen(test_str));
-	ASSERT_EQ(preserve_fd(session_fd, mem_fd, 0x1234), 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd, 0x1234), 0);
 	ASSERT_EQ(close(session_fd), 0);
 
 	ASSERT_EQ(lseek(mem_fd, 0, SEEK_SET), 0);
@@ -236,7 +192,7 @@ TEST_F(liveupdate_device, preserve_multiple_memfds)
 		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
 	ASSERT_GE(self->fd1, 0);
 
-	session_fd = create_session(self->fd1, "preserve-multi-memfd-test");
+	session_fd = luo_create_session(self->fd1, "preserve-multi-memfd-test");
 	ASSERT_GE(session_fd, 0);
 
 	mem_fd1 = memfd_create("test-memfd-1", 0);
@@ -247,8 +203,8 @@ TEST_F(liveupdate_device, preserve_multiple_memfds)
 	ASSERT_EQ(write(mem_fd1, test_str1, strlen(test_str1)), strlen(test_str1));
 	ASSERT_EQ(write(mem_fd2, test_str2, strlen(test_str2)), strlen(test_str2));
 
-	ASSERT_EQ(preserve_fd(session_fd, mem_fd1, 0xAAAA), 0);
-	ASSERT_EQ(preserve_fd(session_fd, mem_fd2, 0xBBBB), 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd1, 0xAAAA), 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd2, 0xBBBB), 0);
 
 	memset(read_buf, 0, sizeof(read_buf));
 	ASSERT_EQ(lseek(mem_fd1, 0, SEEK_SET), 0);
@@ -284,9 +240,9 @@ TEST_F(liveupdate_device, preserve_complex_scenario)
 		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
 	ASSERT_GE(self->fd1, 0);
 
-	session_fd1 = create_session(self->fd1, "complex-session-1");
+	session_fd1 = luo_create_session(self->fd1, "complex-session-1");
 	ASSERT_GE(session_fd1, 0);
-	session_fd2 = create_session(self->fd1, "complex-session-2");
+	session_fd2 = luo_create_session(self->fd1, "complex-session-2");
 	ASSERT_GE(session_fd2, 0);
 
 	mem_fd_data1 = memfd_create("data1", 0);
@@ -303,10 +259,10 @@ TEST_F(liveupdate_device, preserve_complex_scenario)
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
@@ -349,13 +305,13 @@ TEST_F(liveupdate_device, preserve_unsupported_fd)
 		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
 	ASSERT_GE(self->fd1, 0);
 
-	session_fd = create_session(self->fd1, "unsupported-fd-test");
+	session_fd = luo_create_session(self->fd1, "unsupported-fd-test");
 	ASSERT_GE(session_fd, 0);
 
 	unsupported_fd = open("/dev/null", O_RDWR);
 	ASSERT_GE(unsupported_fd, 0);
 
-	ret = preserve_fd(session_fd, unsupported_fd, 0xDEAD);
+	ret = luo_session_preserve_fd(session_fd, unsupported_fd, 0xDEAD);
 	EXPECT_EQ(ret, -ENOENT);
 
 	ASSERT_EQ(close(unsupported_fd), 0);
@@ -379,23 +335,23 @@ TEST_F(liveupdate_device, prevent_double_preservation)
 		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
 	ASSERT_GE(self->fd1, 0);
 
-	session_fd1 = create_session(self->fd1, "double-preserve-session-1");
+	session_fd1 = luo_create_session(self->fd1, "double-preserve-session-1");
 	ASSERT_GE(session_fd1, 0);
-	session_fd2 = create_session(self->fd1, "double-preserve-session-2");
+	session_fd2 = luo_create_session(self->fd1, "double-preserve-session-2");
 	ASSERT_GE(session_fd2, 0);
 
 	mem_fd = memfd_create("test-memfd", 0);
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
@@ -441,7 +397,7 @@ TEST_F(liveupdate_device, create_session_empty_name)
 		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
 	ASSERT_GE(self->fd1, 0);
 
-	session_fd = create_session(self->fd1, "");
+	session_fd = luo_create_session(self->fd1, "");
 	EXPECT_EQ(session_fd, -EINVAL);
 }
 
@@ -462,10 +418,10 @@ TEST_F(liveupdate_device, get_session_name)
 		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
 	ASSERT_GE(self->fd1, 0);
 
-	session_fd = create_session(self->fd1, session_name);
+	session_fd = luo_create_session(self->fd1, session_name);
 	ASSERT_GE(session_fd, 0);
 
-	ASSERT_EQ(get_session_name(session_fd, name_buf, sizeof(name_buf)), 0);
+	ASSERT_EQ(luo_get_session_name(session_fd, name_buf, sizeof(name_buf)), 0);
 	ASSERT_STREQ(name_buf, session_name);
 
 	ASSERT_EQ(close(session_fd), 0);
@@ -491,10 +447,10 @@ TEST_F(liveupdate_device, get_session_name_max_length)
 		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
 	ASSERT_GE(self->fd1, 0);
 
-	session_fd = create_session(self->fd1, long_name);
+	session_fd = luo_create_session(self->fd1, long_name);
 	ASSERT_GE(session_fd, 0);
 
-	ASSERT_EQ(get_session_name(session_fd, name_buf, sizeof(name_buf)), 0);
+	ASSERT_EQ(luo_get_session_name(session_fd, name_buf, sizeof(name_buf)), 0);
 	ASSERT_STREQ(name_buf, long_name);
 
 	ASSERT_EQ(close(session_fd), 0);
@@ -528,7 +484,7 @@ TEST_F(liveupdate_device, preserve_many_sessions)
 		char name[64];
 
 		snprintf(name, sizeof(name), "many-session-%d", i);
-		session_fds[i] = create_session(self->fd1, name);
+		session_fds[i] = luo_create_session(self->fd1, name);
 		ASSERT_GE(session_fds[i], 0);
 	}
 
@@ -554,7 +510,7 @@ TEST_F(liveupdate_device, preserve_many_files)
 		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
 	ASSERT_GE(self->fd1, 0);
 
-	session_fd = create_session(self->fd1, "many-files-test");
+	session_fd = luo_create_session(self->fd1, "many-files-test");
 	ASSERT_GE(session_fd, 0);
 
 	ret = luo_ensure_nofile_limit(MANY_FILES + 10);
@@ -565,7 +521,7 @@ TEST_F(liveupdate_device, preserve_many_files)
 	for (i = 0; i < MANY_FILES; i++) {
 		mem_fds[i] = memfd_create("test-memfd", 0);
 		ASSERT_GE(mem_fds[i], 0);
-		ASSERT_EQ(preserve_fd(session_fd, mem_fds[i], i), 0);
+		ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fds[i], i), 0);
 	}
 
 	for (i = 0; i < MANY_FILES; i++)
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/luo_test_utils.c
index 1439b2b48ed0..885712a65075 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.c
+++ b/tools/testing/selftests/liveupdate/luo_test_utils.c
@@ -60,7 +60,7 @@ int luo_create_session(int luo_fd, const char *name)
 	snprintf((char *)arg.name, LIVEUPDATE_SESSION_NAME_LENGTH, "%.*s",
 		 LIVEUPDATE_SESSION_NAME_LENGTH - 1, name);
 
-	if (ioctl(luo_fd, LIVEUPDATE_IOCTL_CREATE_SESSION, &arg) < 0)
+	if (ioctl(luo_fd, LIVEUPDATE_IOCTL_CREATE_SESSION, &arg))
 		return -errno;
 
 	return arg.fd;
@@ -73,15 +73,57 @@ int luo_retrieve_session(int luo_fd, const char *name)
 	snprintf((char *)arg.name, LIVEUPDATE_SESSION_NAME_LENGTH, "%.*s",
 		 LIVEUPDATE_SESSION_NAME_LENGTH - 1, name);
 
-	if (ioctl(luo_fd, LIVEUPDATE_IOCTL_RETRIEVE_SESSION, &arg) < 0)
+	if (ioctl(luo_fd, LIVEUPDATE_IOCTL_RETRIEVE_SESSION, &arg))
 		return -errno;
 
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
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg))
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
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_RETRIEVE_FD, &arg))
+		return -errno;
+
+	return arg.fd;
+}
+
+/* Helper function to get a session name via ioctl. */
+int luo_get_session_name(int session_fd, char *name, size_t name_len)
+{
+	struct liveupdate_session_get_name args = {};
+
+	args.size = sizeof(args);
+
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_GET_NAME, &args))
+		return -errno;
+
+	strncpy(name, (char *)args.name, name_len - 1);
+	name[name_len - 1] = '\0';
+
+	return 0;
+}
+
 int create_and_preserve_memfd(int session_fd, int token, const char *data)
 {
-	struct liveupdate_session_preserve_fd arg = { .size = sizeof(arg) };
 	long page_size = getpagesize();
 	void *map = MAP_FAILED;
 	int mfd = -1, ret = -1;
@@ -100,9 +142,8 @@ int create_and_preserve_memfd(int session_fd, int token, const char *data)
 	snprintf(map, page_size, "%s", data);
 	munmap(map, page_size);
 
-	arg.fd = mfd;
-	arg.token = token;
-	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg) < 0)
+	ret = luo_session_preserve_fd(session_fd, mfd, token);
+	if (ret)
 		goto out;
 
 	ret = 0;
@@ -117,15 +158,13 @@ int create_and_preserve_memfd(int session_fd, int token, const char *data)
 int restore_and_verify_memfd(int session_fd, int token,
 			     const char *expected_data)
 {
-	struct liveupdate_session_retrieve_fd arg = { .size = sizeof(arg) };
 	long page_size = getpagesize();
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
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.h b/tools/testing/selftests/liveupdate/luo_test_utils.h
index 6a0d85386613..49931ab90593 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.h
+++ b/tools/testing/selftests/liveupdate/luo_test_utils.h
@@ -25,8 +25,11 @@ int luo_open_device(void);
 int luo_create_session(int luo_fd, const char *name);
 int luo_retrieve_session(int luo_fd, const char *name);
 int luo_session_finish(int session_fd);
+int luo_get_session_name(int session_fd, char *name, size_t name_len);
 
 int luo_ensure_nofile_limit(long min_limit);
+int luo_session_preserve_fd(int session_fd, int fd, __u64 token);
+int luo_session_retrieve_fd(int session_fd, __u64 token);
 
 int create_and_preserve_memfd(int session_fd, int token, const char *data);
 int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
-- 
2.55.0.229.g6434b31f56-goog


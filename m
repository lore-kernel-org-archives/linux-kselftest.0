Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F2C502548
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057121; cv=none; b=Ub20l8VKvpb6mXfpCkOrsm2Nv0Zih/ysGbqzp21Ut2q/2uCPy1G1Sn6u43efikJNMpqQ5ouY8Z2Ylwrc8P0dQPRMqlcG3GKXUkdhpU8WyoleC+zA4bs/moJ3nvvcld+ixRUWG1VSMYJv4lENS3ipfV1AsZApJL1ZIrDiZlTu/4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057121; c=relaxed/simple;
	bh=CTRoBmKe0FKK2YiL30FHBy2QLvdXUu5p7o6nnrQvACE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EnFAWnr50XRv16WAY6llo37GCgrejK4W5+GFyEFOWM1VL+hRbynJH4g018oKqohz6ufHeAsJtdBmsfsbnIJYqzyXePmQSfmKEnHld6TlsoXJJ+4TGrjgjvQE/CDvLjIbQZ14F8P80VqAnPNJY9EFXAYgFCPxIbt6BLZmUyUuzpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Pqf4Nmck; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Pqf4Nmck"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5e9a1f1681dso223491e0c.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 02:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792057113; x=1792661913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZWkatgtkqZBCSGS/DoNd/wVrCRwtNmgFeYJzwykKUrU=;
        b=Pqf4NmckcyrVcCcOOAgpkFvSRHDVWoLQ+cVFoPxWeN190QHfqw9upKgncrtrvFLF+y
         fM5A9Kqzxbn1HOWwLWuXXn0IctX81pzyXlGsgO/DhVqKTOUmcAG8nol9VIIIXXCBZlX2
         1OpWmN3Rl4IhtdKBcvx8angvKX3P0yNa9lhEJ6AArGTwuqmxxEI1GeBnHtqAs/k8ahSI
         Saoohv9mQOR35wIAnBzMgYPhmzk0RZc05zF8eoTb2hRV1VQArHysbw1I1Ky3EtAUH/dE
         NRvmVmf5uGad0jxg5p39cnEJm/ZWGQyizqGV27cTC9EoZjKzz5iiaufP1xe1d6xC5yek
         q2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057113; x=1792661913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZWkatgtkqZBCSGS/DoNd/wVrCRwtNmgFeYJzwykKUrU=;
        b=Kc7mvVQw3eoyhe/Gfgp/CsVFjfcq7ijaa0wHo3vwe+Q1vcVbV7udx0fbBtQ9zHBtND
         2mJEp1pUnO2UTfCWTxa/pIizRkgQiopGGyL5SX0S4qjtdx7uXEKjwOMMbO8iI09V/wdE
         QOSamJnLuXeJJKRt1cHvan7VrU6WZ7PPyIDphJlt2PsCfw6WTM34h89+/ED/YcqFtLlS
         EBFvBoOkp6qWKg64+dtJRuBAU1dLJr0yJU0fR7jVYu98/dCjLaQ2/SOW1fbspTYt9ueY
         moy6nr6pszS0NIr9rWMQdXn+kkvRibedahwQMhiYU0x3WGKmtwhEbJSQmveIDEiC4yZw
         CUZA==
X-Gm-Message-State: AFq9FYIwnZ6T7jNX6UH9E6YxPkqXfHDEjNkKrr0Y8GkuyGh2DaLqMmKM
	Xy1jBz9o3O23cUhPZBGxw/SfEW7rZoV6yRlU+NwcSxXbtQ1J98k7/aQ9SUX6DWJSlw9NWWEOo2o
	UUgby
X-Gm-Gg: AYBFou2dVDKNgD7lOwQf8631EndV74dv5brDk4ov1FCffrfXLiDvbJtnu6yrvKckJ1D
	/gjZkx7w0P2arqZaoa7yjwyZc+O4pIB5h5qm8OxgcPwUTIkgngwvqp8cVWsHOjQWDVW7Caz7LG4
	3wkzYKpePc4GbYPLqNDw3MN3hojERd4aaJi/ahA4/ayZy0bNHWVThJrkSX8CThGPGXUa0wOChCi
	pFlWgiL06x6uYNcLLE+o5ujrnCAag8Tr2LWcC7cts01BIAeXftgXsCG22wEi6fbZKJksGciMaAx
	pYXZD+ItkxTknAEYq4PQUwbZEATVHjKnIdA7rcSu1ic1gBDUqD9D2V01GJnyS0gA9wN7jov4tMA
	1QdgoZLfdPUIL4P9ivWQv8A3rBx1b8GsSPM3USfWDvyO5HdHfcgOPZNWUxOmVEZhsLZ5VhQbTXj
	E8XAH1zX20lt0UlJnlmkechVQytNbT1zoxYxudsWEvWpstJbtMY1s3hJszzg95Fcb1k2U8hREzC
	AE2vKyovx2MHXxYh9r3awT8hMloxIPIwD+qT+I+DROQAO5PGpSQGFAfxxVPaWdcJcS6xVksBxO/
	PWLZLM9aSadnTsf9v1Y=
X-Received: by 2002:a05:6102:2c85:b0:7cb:288a:b678 with SMTP id ada2fe7eead31-7cb372a8aa2mr5907427137.19.1792057112741;
        Thu, 15 Oct 2026 02:38:32 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003d37009sm12275672241.2.2026.10.15.02.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:38:31 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [PATCH v1 4/7] selftests: liveupdate: Add tests for preserve and retrieve user argument
Date: Thu, 15 Oct 2026 05:38:13 -0400
Message-ID: <20261015093816.2438942-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
References: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify the user argument support in LIVEUPDATE_SESSION_PRESERVE_FD and
LIVEUPDATE_SESSION_RETRIEVE_FD. Add luo_session_preserve_fd_arg() and
luo_session_retrieve_fd_arg() helpers to libliveupdate so tests can pass
a handler-specific argument.

Add a preserve_memfd_with_arg test case to verify that memfd
preservation rejects a non-zero argument with -EOPNOTSUPP, accepts an
explicit zero argument, and remains compatible with callers passing the
legacy struct size up to the token field.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |  3 ++
 .../selftests/liveupdate/lib/lu_utils.c       | 17 ++++++-
 .../testing/selftests/liveupdate/liveupdate.c | 44 +++++++++++++++++++
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index 15a7db3a6b3e8..8a38268e89dee 100644
--- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
+++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
@@ -30,7 +30,10 @@ int luo_session_freeze(int session_fd);
 
 int luo_ensure_nofile_limit(long min_limit);
 int luo_session_preserve_fd(int session_fd, int fd, __u64 token);
+int luo_session_preserve_fd_arg(int session_fd, int fd, __u64 token,
+				__u64 user_arg);
 int luo_session_retrieve_fd(int session_fd, __u64 token);
+int luo_session_retrieve_fd_arg(int session_fd, __u64 token, __u64 user_arg);
 
 int create_and_preserve_memfd(int session_fd, int token, const char *data);
 int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
diff --git a/tools/testing/selftests/liveupdate/lib/lu_utils.c b/tools/testing/selftests/liveupdate/lib/lu_utils.c
index 6315746ff08f8..5c6f8bf80b297 100644
--- a/tools/testing/selftests/liveupdate/lib/lu_utils.c
+++ b/tools/testing/selftests/liveupdate/lib/lu_utils.c
@@ -79,12 +79,14 @@ int luo_retrieve_session(int luo_fd, const char *name)
 	return arg.fd;
 }
 
-int luo_session_preserve_fd(int session_fd, int fd, __u64 token)
+int luo_session_preserve_fd_arg(int session_fd, int fd, __u64 token,
+				__u64 user_arg)
 {
 	struct liveupdate_session_preserve_fd arg = {
 		.size = sizeof(arg),
 		.fd = fd,
 		.token = token,
+		.arg = user_arg,
 	};
 
 	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg))
@@ -93,11 +95,17 @@ int luo_session_preserve_fd(int session_fd, int fd, __u64 token)
 	return 0;
 }
 
-int luo_session_retrieve_fd(int session_fd, __u64 token)
+int luo_session_preserve_fd(int session_fd, int fd, __u64 token)
+{
+	return luo_session_preserve_fd_arg(session_fd, fd, token, 0);
+}
+
+int luo_session_retrieve_fd_arg(int session_fd, __u64 token, __u64 user_arg)
 {
 	struct liveupdate_session_retrieve_fd arg = {
 		.size = sizeof(arg),
 		.token = token,
+		.arg = user_arg,
 	};
 
 	if (ioctl(session_fd, LIVEUPDATE_SESSION_RETRIEVE_FD, &arg))
@@ -106,6 +114,11 @@ int luo_session_retrieve_fd(int session_fd, __u64 token)
 	return arg.fd;
 }
 
+int luo_session_retrieve_fd(int session_fd, __u64 token)
+{
+	return luo_session_retrieve_fd_arg(session_fd, token, 0);
+}
+
 /* Helper function to get a session name via ioctl. */
 int luo_get_session_name(int session_fd, char *name, size_t name_len)
 {
diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index 9de068f31c3ec..83e0978f3818d 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -20,6 +20,7 @@
 
 #include <errno.h>
 #include <fcntl.h>
+#include <stddef.h>
 #include <string.h>
 #include <sys/ioctl.h>
 #include <unistd.h>
@@ -570,4 +571,47 @@ TEST_F(liveupdate_device, session_freeze)
 	ASSERT_EQ(close(mem_fd2), 0);
 }
 
+/*
+ * Test Case: Preserve MemFD with User Argument
+ *
+ * Verifies that passing a non-zero user argument to memfd preservation fails
+ * with -EOPNOTSUPP, while passing a zero argument or using the minimum struct
+ * size without the arg field succeeds.
+ */
+TEST_F(liveupdate_device, preserve_memfd_with_arg)
+{
+	struct liveupdate_session_preserve_fd min_arg = {};
+	int session_fd, mem_fd1, mem_fd2;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	session_fd = luo_create_session(self->fd1, "preserve-arg-test");
+	ASSERT_GE(session_fd, 0);
+
+	mem_fd1 = memfd_create("arg-memfd-1", 0);
+	ASSERT_GE(mem_fd1, 0);
+
+	/* Non-zero arg is not supported by memfd handler */
+	EXPECT_EQ(luo_session_preserve_fd_arg(session_fd, mem_fd1, 0x1111, 1),
+		  -EOPNOTSUPP);
+
+	/* Legacy struct size (up to token) should zero-fill arg and succeed */
+	min_arg.size = offsetof(struct liveupdate_session_preserve_fd, arg);
+	min_arg.fd = mem_fd1;
+	min_arg.token = 0x1111;
+	ASSERT_EQ(ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &min_arg), 0);
+
+	/* Explicit zero arg with full struct size should also succeed */
+	mem_fd2 = memfd_create("arg-memfd-2", 0);
+	ASSERT_GE(mem_fd2, 0);
+	ASSERT_EQ(luo_session_preserve_fd_arg(session_fd, mem_fd2, 0x2222, 0), 0);
+
+	ASSERT_EQ(close(session_fd), 0);
+	ASSERT_EQ(close(mem_fd1), 0);
+	ASSERT_EQ(close(mem_fd2), 0);
+}
+
 TEST_HARNESS_MAIN
-- 
2.56.0.385.gd3acb90ef8-goog


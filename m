Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667747;
	b=RXFi534/5Cve4tz9LFITAjE9H8xSGBLYfRCvRAVAkzxynYaf2aTTHFG5deswXhp5LdL+
	 UxH9V8UCOaAEoSlDHNrJSs5LC1WTWpE43DApyDMWR38m7+HCP/aYn78t80WKKeN+QnYzk
	 uviMSFDd9OIMKG+e8xVBPLIqswIs/ygswGrb3MMLr3vryySDZmvVsaiwq9TXTUO5Mwy9G
	 cm2R96ziziXj8bIqpR5OLc10wtZbNr9Odfxhay4tV/j0mQQwGIo2rIhwlrXa5SkhQLoNW
	 6LrhtljQYBgEYti7dAA0N7/GOdQDbP7nAbxM+HsY4BxP6uZCCl6ZLOjyuQvYgK8DHZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=vwwQG+MUKlnnlHmIxe7elcqJvGDbiOqx5PQ/fNouiDw=;
	b=PrmmccRzQwYgxZrZFd6XzHTWmjuWZ9nFlpq3i/Xzza/lE76TbXj6vTI76noPcBugyLf9
	 v/yGAUu5UWww4qQrZ+UTV4Lum/PsHZRNvE/I3TTG6AFgfdm3QSCvO2JscCEC7VISpQLdn
	 oWMza7ek/I7K8xfmk8FcpkX0/Z1z9L6iPMZj0oaVTfyFp55vQCWSpbSyMtdSrLsYrXgJh
	 vdwKD05mty5Kj3kwOYsXylrFe/7r+HO9F0zbLick9X9BuxHh7Mpp+2YdUUETePCpon8IQ
	 X0l/N/IqYZWmFaeYRC+EIjYeXBSD1uqAVg7qxuPstSkUN3tlfuUzTQclw6yMQurlHvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dVACHpHS;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0479F606A33A
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 01:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0479F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dVACHpHS
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso2802951a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 17:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793667746; x=1794272546; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwwQG+MUKlnnlHmIxe7elcqJvGDbiOqx5PQ/fNouiDw=;
        b=dVACHpHSIb/ir4gt1P7eZJR98lDOtUG1oZP40MsTQh+k7HCJPgoM8zZP7tNq15Mrwa
         Su5wLkhp6FsfSmmRwDUrirSmL235CHz+wynhqK8t/G1/RG3Y92PuPH+mUogY6d8FtARv
         FbPOmNNXu4gjNNRIM0xq2bUdjr3ezh2tVXR0evoamL/qZ14EVab9+sjUqKKgm+IFKX5i
         2HYr6JOSRRe8qNlEc/VMyQz/q8dIt60aaD9FSDDYCTe+lY+8Jrs1RJKTtIGr3L1rhQp4
         EGdnkzjoXIRoUpFhBzGmaNx78xCShjIARQXbFKu9wCB3vuUApgVMoh7HVhiM/7ooS948
         LD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667746; x=1794272546;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vwwQG+MUKlnnlHmIxe7elcqJvGDbiOqx5PQ/fNouiDw=;
        b=n489pF2QU0gso7nlpzQ9HJf81VkJGbvGLi9UAuvMIOclZL+IwlgH30+6+reLtDe+O2
         C7VJdb9Pdrn14sSafpw0dPyu9rTNYSYeUt0Fr/sRzUh3Y70Wheh7/jGPp/AdWruNAOvy
         85dg36b00gQ/fUlwXkkZCrsHJ42obNZoGrIxM4McI2s/XxFcGIiotdOGCL5GvR40rnab
         x9+7ZmGqi5gudamfEpwAj7J6oTO3TE9V5zsHVfNGbqOhEO/aBc5liyeaMtTEWxpOAajd
         aEEdijaWAx0NOSj1UuW3yNdOOPWJicU6WvFWVhAPLD/O8PUQhwXVycrsUIEbeQqLjKih
         S+Vw==
X-Forwarded-Encrypted: i=1; AKwUvBxM5SpHpxmGbsAOTkgj5p/vbalu5rHg0Q3H/EjUp6krehKU4WjMHQedjsiA3UYnF6ah4bvAgRI4cDXZpecw6WM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bo7XimUC/nPrxciuC8s/Ink9ys+eBxB20+jen7E7Mz36teD/A
	xHZGdbKmoXWs14E4q2VLmxqHoHPLiaTLeN7DLeeejOAr+TTQK38Lohy675lmJDE7L6lawnWMG4E
	BDfsoYB3BPSCVXQ==
X-Received: from pgbm15-n2.prod.google.com ([2002:a05:6a02:618f:20b0:cc7:9d5b:c2a1])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2d04:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3ae898392c2mr9426033a91.41.1793667746054;
 Mon, 02 Nov 2026 17:02:26 -0800 (PST)
Date: Tue,  3 Nov 2026 01:02:08 +0000
In-Reply-To: <20261103010216.3447716-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103010216.3447716-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103010216.3447716-3-dmatlack@google.com>
Subject: [PATCH v3 02/10] selftests: liveupdate: Add tests for preserve and
 retrieve user argument
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pasha Tatashin <pasha.tatashin@soleen.com>

Verify the user argument support in LIVEUPDATE_SESSION_PRESERVE_FD and
LIVEUPDATE_SESSION_RETRIEVE_FD. Add luo_session_preserve_fd_arg() and
luo_session_retrieve_fd_arg() helpers to libliveupdate so tests can pass
a handler-specific argument.

Add a preserve_memfd_with_arg test case to verify that memfd
preservation rejects a non-zero argument with -EOPNOTSUPP, accepts an
explicit zero argument, and remains compatible with callers passing the
legacy struct size up to the token field.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |  3 ++
 .../selftests/liveupdate/lib/lu_utils.c       | 17 ++++++-
 .../testing/selftests/liveupdate/liveupdate.c | 44 +++++++++++++++++++
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index fa07fed08364..cd1d843a0d3d 100644
--- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
+++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
@@ -29,7 +29,10 @@ int luo_get_session_name(int session_fd, char *name, size_t name_len);
 
 int luo_ensure_nofile_limit(long min_limit);
 int luo_session_preserve_fd(int session_fd, int fd, __u64 token);
+int luo_session_preserve_fd_arg(int session_fd, int fd, __u64 token,
+				__u64 user_arg);
 int luo_session_retrieve_fd(int session_fd, __u64 token);
+int luo_session_retrieve_fd_arg(int session_fd, __u64 token, __u64 user_arg);
 
 int create_and_preserve_memfd(int session_fd, int token, const char *data);
 int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
diff --git a/tools/testing/selftests/liveupdate/lib/lu_utils.c b/tools/testing/selftests/liveupdate/lib/lu_utils.c
index 74d41115c281..db7a90b002cb 100644
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
index 2dedd5fc2534..4c4272167635 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -20,6 +20,7 @@
 
 #include <errno.h>
 #include <fcntl.h>
+#include <stddef.h>
 #include <string.h>
 #include <sys/ioctl.h>
 #include <unistd.h>
@@ -530,4 +531,47 @@ TEST_F(liveupdate_device, preserve_many_files)
 	ASSERT_EQ(close(session_fd), 0);
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
2.56.0.385.gac671c819a-goog


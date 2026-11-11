Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356652;
	b=ph5kaw2ZOhck4fFIEKkCM9yjSPl3Z+IX7mLVZWVz6vHPHnYbpizQTG2+1Y/bru1lsmV5
	 pYT6m+aDbntjGv8EXJ4K+YvQ1sKTAkE2Ca0jEYu0AJx7Zo6PHs9b5tkiaAa4DN/IuXKo3
	 TIlwFM/6qu1tRjLzX/8+wkRURqSn+QUQD+pen48JJZqM2n9iReJlkQD+uSNWTDpbSh2Rh
	 /5UVBz7aptFh9wykRhTowfG0rCKbhZs32V+xDzOYd7iKoiKbbBsE/HZwA0oPJMMgB/vKY
	 6LsOXiecd46TTTKWIPkVdwbzzwQvm/cTTBAoay2yb5AqE9VFuR1tQYxaPULMlc+VfeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6pksLN3i9UP8nq6v/POjqMIUemdvKGeqKKQAaazi0ic=;
	b=f7qB2K+0xugFDqZhE5SGCuO0f2AQ59PKx2bg4RJqLgLjzCqXXHQa+Lzv+zWvwoi9Ys3F
	 EIXTXn4MtBeE2jGlhQ7Y0jgX5fb3BHJwx/aXH5Vn6L3dwnIHMlU/mg1KxLGGHoH7BcleV
	 pnXb4kFqJIs5NOkU3UVJQci2Fzp8B+KwFe7SJ2dZuQk1vyGHmMRBz4aXgcNEmtJsR2kSz
	 k+Mt5UFNgv6AX1SzpLXJ/N1DaA/LC5BSryZ0/LnDWbIApqkSD34/9kmhrgaCiMZQ3rtv6
	 +GcvilLxEpD6iU9qAQRTh14TadreKRZLqT+ZgSBPyD8ORjkDXFDay/jMKEuInDodFNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eigH2qWk;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10EC606A32E
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 00:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10EC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eigH2qWk
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-84586110393so2971598a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356651; x=1794961451; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6pksLN3i9UP8nq6v/POjqMIUemdvKGeqKKQAaazi0ic=;
        b=eigH2qWkGhH5tiAgGSbUgDvFYuskoZbI+YP83rHFmlZ7ch41yBJ0Q2uxTmqSEG2C4K
         84Ioqp5wQfdASP97HgKBpJSkVK4eYgkCDRLysgKi1A/Ff56dM2eUp/Qyp0YUOb63o1WB
         jW0/Y0XS6E6MREG3u2c45zIQA65T60R8nAuw5VTyuhksqvKFFV8Pk/DpsWN+sbqLXKL9
         EqhdxQOlRcAMjFLecHl8hGR3QUi/9WYOxgTaj5hPns8L0lR7PnW6tu0coApL9ecq4mcG
         nXTmomivZ0o2MzJgRGTolqThh0wEbC4+muhB3OPibybYUfWjAZoAxi66dupe1JAZvFFL
         OPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356651; x=1794961451;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pksLN3i9UP8nq6v/POjqMIUemdvKGeqKKQAaazi0ic=;
        b=AHhUzpSTFtPYHjGVAooq1lSHHNlzjPrXQyHmW2npL64SIg2x+XnaVk5oBgX77c3Zd9
         IyUbVeBeJ94FwqGfVnWAda67oegk3TqEnjVUGJ4JZo5kOsAG8MHTX3sUfgtThOIxHNpS
         3+1/SJ34mdhTFRcpMixHezdgBiMgCFec8YoBMdshMSbm5TxNa5l42YeNJjoBZ2Xvo83+
         DXiPu9/uTVZNBPgPM7ky0EuV4zgfi4KKrn/sCfi0c0IoAEKE6hIJb+2iZvmdgSSy/mc7
         vsFklEsQr93ciO1wVQ7H0VKKg3SSg7ao6MyHNAQFsbr3pcUiT6tdDR39RXdOd8/9jEqK
         67kw==
X-Forwarded-Encrypted: i=1; AL+hErHAG+3n7I71VLtsVaI0DQUNXWujbRS7EF45cFV8AaNjBFU5r4peEtuRK9QxynuHkoaheoTSCgsqrdQTkkF+Wmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SPqiQmMH6TjW6aGZ1luyMs0KPDmwV8o8ZWGuIJUGowGXmZNHC
	hA6E/N4eF7bx3U/HR/fLPpnw6NGaGdTKP9+swvGzrka15BkP5SkMj1oMOq+g6K61OabMbm/Z6gp
	znV+HD8vZ62/4Og==
X-Received: from iohk8-n1.prod.google.com ([2002:a05:6602:a608:10b0:9ca:dc6e:2262])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:148e:b0:4f5:20:d847 with SMTP id 5614622812f47-56b97611f9dmr681603b6e.36.1794356650705;
 Tue, 10 Nov 2026 16:24:10 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:41 +0000
In-Reply-To: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111002358.1842967-4-dmatlack@google.com>
Subject: [PATCH v4 03/19] selftests/liveupdate: Add tests for preserve and
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
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
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
2.56.0.542.g3ef89b7020-goog


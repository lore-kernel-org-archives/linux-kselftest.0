Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477174;
	b=ywwobfOxUBiOqo+Prv2qIFm1iRPXYFOR6ovJ7PjvFeQioBAEKrwlvcCOaO2Ler7tgIMc
	 jSWJ3nx2YZCP7MbpPMt8qTF9SJSerlBrOQYL4xrvWBlgNo/PAwDYi2mJEtUHpJS1UQA6G
	 MFJYryA5OZgBrPlH+qOXKLUCTTnQ7ozzOFLS/OlVH+LQH2FZATBg9XHyXk6a8n/X7bA4x
	 fgijKq70oap5WEMPa4EeA3cmGP1YXtk2hSaTI7Xn/NkshcOSsaJgGPAv3YJMC5qpyiIvF
	 6uDjqEiNNr6g3FMqvYpk7UJOm1JcbrlvkDrUQCdRoXt+cRXFz4+mSyvp1XxlUIAlVdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EeRPz4sZOybVhfqP/WD/7fCihnY2rWbCdbzpXQtgwmc=;
	b=dcSOBOXx0tHZIIRpH5H9DpAjP2jx/cGqOk1Rn52SBNsxy++UYTwY1a12Z4pLYZgG22Ia
	 KSFcA14aCdABwsVlTWliEpIrY4AihNC1sByNmCQArnsebX2E5y8ArkHJDJ2NmxxVr+zqP
	 nAdKxHuRdatVMZIgPl/y0DJeyd7pyfo0f9W1LnI8WbGB5omHeNkYQSuWdJa3met26AWZA
	 YS63HihVx/1ypD5qWNdNGYruLyoAVzqyjm/VVn3dRcKXENSARDcJzyYs7hTea47tYuNSV
	 OyotY30PWAJGrrK6AZFIWEifm1fsK4GxoE7Fo4FHy+XPbHcmFjzKwR8QO5OV4j5PbjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N5Sz8hl3;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301E5606A322
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 23:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 301E5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N5Sz8hl3
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ea2c058e67so4396905b6e.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795477173; x=1796081973; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EeRPz4sZOybVhfqP/WD/7fCihnY2rWbCdbzpXQtgwmc=;
        b=N5Sz8hl3BK6Wus+dA4iR4/YluDgy390oeWI4OR8S+cIERP4cMeZVOSB0EpNj2o+Q/P
         eqhc2F0GH38RWVJx4EeahnBVR+SuFz+fiyjY+HXX60PbiQwkB0yhWA51eGUxnC1Kqzrg
         0lZim1oorPlfkv5nb0aPGW59a++H+Wpc4KpPenmMaBNsAshU1qxNw3/t5jA9T7uzNqoP
         YSkP8tQHQ8MHk06C1568WPRvnUfPXGEsb8u5c701tcMiBunDN6wowX0+mA7p+3iNky+K
         izrRXQuha5iB6BIhQZO7xjze78Yh3oiBMEa7AS6DhOYy1GkNddI4/eloBFl544GqtUqL
         khrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477173; x=1796081973;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EeRPz4sZOybVhfqP/WD/7fCihnY2rWbCdbzpXQtgwmc=;
        b=DdjGIpmmAZR64k5jNR9aH2E4eZVQipoAB7zhitSFIdjjDpVhWIX8qnrZ2zxaD1bE4+
         lGUzBsCItWljecAAISM+4huEoMsMsUiP62zwRwwWbI77mjlWNYijq99N5k40HNWNbm2N
         lYlRbzmee0Y2NzZlmhN/38jwbo6VgAk42Od01B2YtAG2JZNbyKBMBcqu4kgvpraEirN5
         WFRGy6xamYY4twxUDxwbFTwD/l4ivaheZ+xHydsJui8OJus+gNe2nBm4h9zegGkphizA
         JGoc3bVieNPeGjjZvzUIYHukEIGfLkbYQI5kAeyRh+rc+FTl6w4qdyK7jz8CnNfG0hge
         8MPA==
X-Forwarded-Encrypted: i=1; AL+hErESIZJvYpCpgNlpf9vTqFeeXn3aDCf4dPh5724TXfu0L0ufuZdubnZ4dAkLZidskXA72jgowpL5ABC1Sr7cdzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BVctMtou17Mc25grTChXcHzTfYbRH7Dhk+EUNUO8dvWmPBl6W
	O8Zh/FZwSVORARe9oQWO8yvUCvnUKnO2DUnpTcd4WjcvZxsToGCEo2wkZcqyGpkcJuo50nL876W
	HvNWuu73fZ36ejg==
X-Received: from oixz16-n2.prod.google.com ([2002:a05:6809:410:20b0:4f4:549a:d85d])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4fe1:b0:575:39f9:df7c with SMTP id 5614622812f47-57a06504990mr14793633b6e.2.1795477172875;
 Mon, 23 Nov 2026 15:39:32 -0800 (PST)
Date: Mon, 23 Nov 2026 23:39:08 +0000
In-Reply-To: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123233924.3970932-4-dmatlack@google.com>
Subject: [PATCH v5 03/18] selftests/liveupdate: Add tests for preserve and
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
 .../testing/selftests/liveupdate/liveupdate.c | 48 +++++++++++++++++++
 3 files changed, 66 insertions(+), 2 deletions(-)

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
index 2dedd5fc2534..8b6e61695a35 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -20,6 +20,7 @@
 
 #include <errno.h>
 #include <fcntl.h>
+#include <stddef.h>
 #include <string.h>
 #include <sys/ioctl.h>
 #include <unistd.h>
@@ -530,4 +531,51 @@ TEST_F(liveupdate_device, preserve_many_files)
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
+	/*
+	 * Legacy struct size (up to token) should succeed. The kernel must
+	 * ignore arg, so set it to a value the memfd handler would reject.
+	 */
+	min_arg.size = offsetof(struct liveupdate_session_preserve_fd, arg);
+	min_arg.fd = mem_fd1;
+	min_arg.token = 0x1111;
+	min_arg.arg = 1;
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
2.56.1.809.ga0b61035b5-goog


Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49843D3016
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 22:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797608; cv=none; b=N2t+UHlQ8y2pvAKkV0xlDfrViqftrXT9O+jKmKqknAx6YoU1gZs/mg/Vnsqbs8x0aU92Wya0ewRfdLkOvsWlvjBmo9rSJzGxwZLjv2dFR87faifSUEucuO9plUhLZMVBrLcFao6OrqO4piBtndwEXmcTorBR3ErzcT9RgXdC84c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797608; c=relaxed/simple;
	bh=OWTM90yu1niJ/qeDOpSCZ+9Fa6JVVNlhhw5OiEwaYdE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJ/NC8ytbQYgRZOP5QePdGAoE0fvdDu1dP2X5XaHsSfZKLbpf+8fBwwS9HGfmMUz4eH+FC8JV6RE9uxYqz9skB4IRyoxnKbgF5nMNfwql2ar6+/ksmUDKLQP/UggDsURh7rlHPxaEAKj1AWLcoKRygzaHZNA7aSNVrFzthuyslA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=DMRc+JFo; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="DMRc+JFo"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-512f09ecc67so59903921cf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 15:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1778797606; x=1779402406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14TtfdaLNy/StuYSb6NEiZW+KT+gZJT0aVK824S/d4k=;
        b=DMRc+JFoX0z8R0e7u9OLl64WFd/ny8Fj3rlQryr5ZL72n1WQzPGeHnvY0VPRpqWe3O
         uc3YX5eXuiF6qCuFORNOtNS2tjUu8ips/OzCq4xObshcNDWEopuj+4X5yakMOHgpeuNy
         zzHwNEmLfyG1nI7Jk+lHhHUbSkVNOGrHMI6NaBzZeV7ewFgWFip4mtsnHVqADqK7jG+c
         ytn11NEqfJojdwo7GZveKyYnG4kIbvNiL3qhBODqhiYrq3qDwxI0PX4xnszdBurc+R4K
         lZAmihYZKmIEuHHMtoJ0633qKX7qJpvPmxR1wFEUxlCN+npBd5+tArC+kKG6EfTzhfMt
         Qdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778797606; x=1779402406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=14TtfdaLNy/StuYSb6NEiZW+KT+gZJT0aVK824S/d4k=;
        b=syxupeD8KP8UP8LeNXPceHvtuOQv0gCdBcR7kzqgPs/S7yGUGOMkoMlOVwvaBm71e8
         npFZroDwKI4xzdP6IeZcY702rP/cde/IeMmrcvqkhWfOBRsZaX9/rOfRM+2ROM3kPtMR
         ER9uQthen4DTW2WKLHPYiVta2gExvjKyqm2zZhRzZKMJFkt0XDK5vxSlePHqVaVb6Udd
         71cbTixWUjMRzfhjnVV4uSKX7CTDLbkkBFL9wGGLte+WYQPEA72GkkeaPfemvbKfYRam
         FJnSwTyvKvWqC/cvxu0qm8W9CNQMZnpe7htKEkctYmwCVzNqYnCKJdl7YwT6NEsjXgAi
         ztyg==
X-Gm-Message-State: AOJu0YxSk92xtFvB0LDbVkNyFgRAmrFxjFD2JMj+pERoQqRhAFeOK3P1
	suDkKQixsrRcwiZHa3NnYgvnZ8OYXKxn/OLAQxay8EE92OnHr5VGWX5TQ9hpETh43pidvQ7MEK4
	v2S/eMew=
X-Gm-Gg: Acq92OEjrByCHOGXJqAuY3lP/jKSv9KE/m0gqtaSsAfmQc7yaA69LCTN9E2lL3Mid6B
	M/dvI4n6ppGdPOymTqMwrCHTIGfwL1TSUDlahAuMvqIUhaLwA4WF23U+2YUPsJFSXnxTcNDAfi2
	aplafsW8HFuEK9KtILNWZl/kMFmzg+y3EDoKPN9NT2nxg7WatOjOyVGWOMEkBHXY9+G0ZUBPAMZ
	dxqPv+tobOS5Ch+rdTxW0iV0q9Hsf2OLKKAA1lN9KH2rJxkySGQnvoU9q4cxFEWqhUZNdLStWnL
	7wAtcPlzLuGZhMyuq0QxdlocHo2VIn3O9iEZ7YKrEVPdrBp2d8Qk0lgUWCGO+ObBmu2B7+05p0F
	G6J1j/V230DkDmNBjQzp5smTSXi2SLjU84dk19UsZQcFV+aRWXpmyihWJxFXY4HPSYWH9jyVSp2
	UMj4T0E4qY/Xhl4SizkJ0/nkf8LOSgoo9EZm12K8zJ4ozJgV6N6gahutndyLBpQw==
X-Received: by 2002:a05:622a:59cc:b0:50d:7406:8f05 with SMTP id d75a77b69052e-5165a0010a3mr18527381cf.9.1778797605925;
        Thu, 14 May 2026 15:26:45 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456ba92fsm28671901cf.9.2026.05.14.15.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:26:45 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v2 08/10] selftests/liveupdate: Test session and file limit removal
Date: Thu, 14 May 2026 22:26:26 +0000
Message-ID: <20260514222628.931312-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514222628.931312-1-pasha.tatashin@soleen.com>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the removal of static limits on the number of sessions and files per
session, the orchestrator now uses dynamic allocation.

Add new test cases to verify that the system can handle a large number of
sessions and files. These tests ensure that the dynamic block allocation
and reuse logic for session metadata and outgoing files work correctly
beyond the previous static limits.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../testing/selftests/liveupdate/liveupdate.c | 75 +++++++++++++++++++
 .../selftests/liveupdate/luo_test_utils.c     | 24 ++++++
 .../selftests/liveupdate/luo_test_utils.h     |  2 +
 3 files changed, 101 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index c7d94b9181e1..502fb3567e38 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -26,6 +26,7 @@
 
 #include <linux/liveupdate.h>
 
+#include "luo_test_utils.h"
 #include "../kselftest.h"
 #include "../kselftest_harness.h"
 
@@ -499,4 +500,78 @@ TEST_F(liveupdate_device, get_session_name_max_length)
 	ASSERT_EQ(close(session_fd), 0);
 }
 
+/*
+ * Test Case: Manage Many Sessions
+ *
+ * Verifies that a large number of sessions can be created and then
+ * destroyed during normal system operation. This specifically tests the
+ * dynamic block allocation and reuse logic for session metadata management
+ * without preserving any files.
+ */
+TEST_F(liveupdate_device, preserve_many_sessions)
+{
+#define MANY_SESSIONS 2000
+	int session_fds[MANY_SESSIONS];
+	int ret, i;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	ret = luo_ensure_nofile_limit(MANY_SESSIONS);
+	if (ret == -EPERM)
+		SKIP(return, "Insufficient privileges to set RLIMIT_NOFILE");
+	ASSERT_EQ(ret, 0);
+
+	for (i = 0; i < MANY_SESSIONS; i++) {
+		char name[64];
+
+		snprintf(name, sizeof(name), "many-session-%d", i);
+		session_fds[i] = create_session(self->fd1, name);
+		ASSERT_GE(session_fds[i], 0);
+	}
+
+	for (i = 0; i < MANY_SESSIONS; i++)
+		ASSERT_EQ(close(session_fds[i]), 0);
+}
+
+/*
+ * Test Case: Preserve Many Files
+ *
+ * Verifies that a large number of files can be preserved in a single session
+ * and then destroyed during normal system operation. This tests the dynamic
+ * block allocation and management for outgoing files.
+ */
+TEST_F(liveupdate_device, preserve_many_files)
+{
+#define MANY_FILES 500
+	int mem_fds[MANY_FILES];
+	int session_fd, ret, i;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	session_fd = create_session(self->fd1, "many-files-test");
+	ASSERT_GE(session_fd, 0);
+
+	ret = luo_ensure_nofile_limit(MANY_FILES + 10);
+	if (ret == -EPERM)
+		SKIP(return, "Insufficient privileges to set RLIMIT_NOFILE");
+	ASSERT_EQ(ret, 0);
+
+	for (i = 0; i < MANY_FILES; i++) {
+		mem_fds[i] = memfd_create("test-memfd", 0);
+		ASSERT_GE(mem_fds[i], 0);
+		ASSERT_EQ(preserve_fd(session_fd, mem_fds[i], i), 0);
+	}
+
+	for (i = 0; i < MANY_FILES; i++)
+		ASSERT_EQ(close(mem_fds[i]), 0);
+
+	ASSERT_EQ(close(session_fd), 0);
+}
+
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/luo_test_utils.c
index 3c8721c505df..333a3530051b 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.c
+++ b/tools/testing/selftests/liveupdate/luo_test_utils.c
@@ -17,6 +17,7 @@
 #include <sys/syscall.h>
 #include <sys/mman.h>
 #include <sys/types.h>
+#include <sys/resource.h>
 #include <sys/stat.h>
 #include <errno.h>
 #include <stdarg.h>
@@ -28,6 +29,29 @@ int luo_open_device(void)
 	return open(LUO_DEVICE, O_RDWR);
 }
 
+int luo_ensure_nofile_limit(long min_limit)
+{
+	struct rlimit hl;
+
+	/* Allow to extra files to be used by test itself */
+	min_limit += 32;
+
+	if (getrlimit(RLIMIT_NOFILE, &hl) < 0)
+		return -errno;
+
+	if (hl.rlim_cur >= min_limit)
+		return 0;
+
+	hl.rlim_cur = min_limit;
+	if (hl.rlim_cur > hl.rlim_max)
+		hl.rlim_max = hl.rlim_cur;
+
+	if (setrlimit(RLIMIT_NOFILE, &hl) < 0)
+		return -errno;
+
+	return 0;
+}
+
 int luo_create_session(int luo_fd, const char *name)
 {
 	struct liveupdate_ioctl_create_session arg = { .size = sizeof(arg) };
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.h b/tools/testing/selftests/liveupdate/luo_test_utils.h
index 90099bf49577..6a0d85386613 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.h
+++ b/tools/testing/selftests/liveupdate/luo_test_utils.h
@@ -26,6 +26,8 @@ int luo_create_session(int luo_fd, const char *name);
 int luo_retrieve_session(int luo_fd, const char *name);
 int luo_session_finish(int session_fd);
 
+int luo_ensure_nofile_limit(long min_limit);
+
 int create_and_preserve_memfd(int session_fd, int token, const char *data);
 int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
 
-- 
2.53.0


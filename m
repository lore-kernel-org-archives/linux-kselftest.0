Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F62D36D506
	for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 03:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780024883; cv=none; b=qVMatE9cZUyD1GT/9iLJRVx80t2HlmMp/zBU7+lzT38PPs3EB9UilgEhNmPfjfnBM9gTv2WScv+Q8m4+74Tju6oG0ig3NpfEGt317ryijFRp2eGXB6IC86VAbDzY8UwaMqu4SOuIxfjaonoy/bXxGMD3qR88uMjUO4vSJb+YI/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780024883; c=relaxed/simple;
	bh=l5sCPInN24558zDa0DI5TQ1DcCXBUgAOZ3PiWzJQJoI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1ctCQqOP7al83WY/jOkEeEWjhuJc/0JvqtGOGpAEtkyVVkXke2LDqWqf37PaJaVp0ofZKCp/ZI5F4jP0DgyDtKTWp2PN+lz/g/90C5EpYtRT7AJC1mDceLaFnTp9fPp83fpX41AmdDBajNtroxUhiNrAI+29t3YWEArUh3FlOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=GDsGEhr7; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="GDsGEhr7"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-516d634956fso81577601cf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 20:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780024880; x=1780629680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/PRPWvWF9f7qW0XjjBpwGc/NadY8LWCtXHDn2RYoSI=;
        b=GDsGEhr7SUn9cHIzAHtJ+z7aKPPj7z7LFgjgMomXYOwqW+oPrYdoi2iCrwfOqLb46O
         3qbKq1r9mvabkhHr1eQ24xuEAVfu10tG1jznBVrsfFT6phslbQITj+SWCKiiGBNvshBM
         bZoLQQDEVBVFJYMs7zC3W9e6vtAean03kvr6oeJLpV68aJjuW/x8eFNpls22UIUeX+aY
         WVj7XFZ3aEoh3cGfGtlNKa1BlSyQr8d9uE3GLluOypOD4I0v6caV++WoTvxT/A3uve2q
         C/J9e69a17B/XZ1mZ9VRx/0AB3bA5CuSZ4IH65oWYfxCNouWdkThhXJtpXjjYSXH+obF
         QODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780024880; x=1780629680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l/PRPWvWF9f7qW0XjjBpwGc/NadY8LWCtXHDn2RYoSI=;
        b=pnxs3cAA7sGQeNMdVSUUG6Q3xhBfq82TZggf5fr+BclG8tjLIypSk8LBVwthUjw1cf
         wbHOj9+T2BG+WTmuIYuqvQ7jDeKHyBGtDlml1z3qaHLuUKKkcSpqYSsvQCvZHGXun0iD
         6bzImSfJzpqTJ5ZEYov9qF5MZAtAx7sagWgh/C5F+d/xw9+7Hui/LMLcb+nwEMV5C5VR
         5PZrmHmxtOBjOknUNYgAj8nZ7fqSmzD3g0N4j9GEySHQi1eXjKOuAwpCBItQUjEJHjEZ
         W4cOGGC3NWpVM5aaheRuCbw07e11uCm9HFfHDywdRVw/H/PFo/n9tjHSstSAva2N5k56
         OkFQ==
X-Gm-Message-State: AOJu0Yy9M+VsZa+Rp5/iHF07sdRPFBtkAl8Vt2MZYyJNoxEDCrXiUEB0
	28Gl1xfuiADyefCLxMphPhQ1QkbnVoEvA32q8rosq8ybHNwLGiack5Ply8gJL4XWuLofR6b7E0F
	E0HrW
X-Gm-Gg: Acq92OG5bJVcAZhJFdsgZzZcyy4Y+RcsrSIiO5jsRPVsquUKG30tvPEoEW/9mrf1PDS
	YojYhE71yRN6ell3iZB1I9mU2BE7GUVXMdEqBgJ9NKixRglMyXDb+6Mq6TjElc2rTtuoSWEuVIm
	zOKwwfkepTaQBI8TPCWLRlKzRiXIQHrFs+ifY3BD2Pg/LmKrb/8SdhnfHuGt8yr2EnXOvkVKg+v
	xUil50XVcoWb4qV92JM1AbzpW8PDxd59+cuEzu8C4uL7zSYc62mcuyw3cB5e3/f4b5Pma1UVwG7
	7DGdr0UjVWvzT6eX+6a+aQ+Vqpz639p2Sr+HERyJXUUf8+pWKVgvA5CSiAF2d7vqzVo4YPzFRLh
	/oSEQMea251TWbfM6CuOVknJouWC9AeGxL8O7M87tTYYQ7WJh+RlRS94uFkOwo3S+l8ZECFmFhd
	wt6QAiDveNReJ0qplCqCrEZHY1T3S+zFmIkXxIaoPQPtXgovpLVKwIlTENNdXWteRP1KzGyVbu
X-Received: by 2002:a05:622a:5805:b0:516:e722:5ed1 with SMTP id d75a77b69052e-5172dd1e2a1mr15106211cf.29.1780024880588;
        Thu, 28 May 2026 20:21:20 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea26d286sm1179476d6.48.2026.05.28.20.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 20:21:20 -0700 (PDT)
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
Subject: [PATCH v3 09/11] selftests/liveupdate: Test session and file limit removal
Date: Fri, 29 May 2026 03:21:04 +0000
Message-ID: <20260529032106.1505796-10-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529032106.1505796-1-pasha.tatashin@soleen.com>
References: <20260529032106.1505796-1-pasha.tatashin@soleen.com>
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

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
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


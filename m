Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C656A3557F3
	for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 22:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179605; cv=none; b=nSQGL2W51Nj8zHmLCI5iw/jboKRmD9EI3oeNSOgqzFmhSh05wd6Ma7w4i6rlvXma5XBtQ8j1Ou2i3JiycLZFB/GpIxk4EVTz5pMmHECGAShN8PI7pRt3XAZjFDMGchReIVjfKR7Kou8Z4XJ09UQFBnCsK2kBA0V3vS+tarb9NiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179605; c=relaxed/simple;
	bh=l5sCPInN24558zDa0DI5TQ1DcCXBUgAOZ3PiWzJQJoI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ULV6bREGqhEzwVf7tW732dc1M3Iz10ABk6ROJ8Nw+QawpcF63NTR+wlGruUqVAf3Bpcd//8BcjZexr5/URsROQHcx5cMCuPd9PAlPO4rgzKjMhP+F6ln42EsN8C2jSxgC2rFMTHYbESeGgtPKkh98cM2HbG4Xj8BgnNZ0pFp6wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=UbRANhl7; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="UbRANhl7"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-914ad42e617so1038404385a.2
        for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 15:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780179602; x=1780784402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/PRPWvWF9f7qW0XjjBpwGc/NadY8LWCtXHDn2RYoSI=;
        b=UbRANhl7Z1zD09kwlBAc/uuNUHzbsyQ2LsqHRGtyaAG2B41vtl5s1pD7T/CeVP2XZz
         3KTGvbXNifl2Wa0wy0n/GPr3BA7b4mlKk5Mz9IzlZi6yNLw+mqznhH4sI8Nnq3afhQEc
         5qhwTbTkMWbq2iW4iVaVtEeCqF9/2IAVLxSkkfRxGgUhEKxWxpEepkf63QBst0N+gh2Y
         jFcrezpQq0Dj0/8patMbr3nKoIIhvLQj17pmx5dAIlugLKChItZIzL+2ar0AN99eB8U2
         KB+UXO2TKodW2pG8EuzwixWYqNqepQ8ianS1o4biX3XNYcG0+fhFSFJmBEdev3/7jju9
         WBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179602; x=1780784402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l/PRPWvWF9f7qW0XjjBpwGc/NadY8LWCtXHDn2RYoSI=;
        b=M7k96PipGFCfk5WV/FAO78uuHFbJDKi3KirheREhilmPtezv8Wvdej5w5maULL3G4F
         yPGi4eSjhjvS7S62tVdL4OiK9AgHNJgfGYkjUifLm+xK6RpLtsPa4BLcFrPrzBvhkHnu
         0AuSwPmJ9w7TA0+bYQAycuUHFsjQpwQUjyD5QxyqKoepcCrXY3JNMGbsd1C4clk/N3SN
         KyhXB9V6bhI4LWfo+c9tklbo8qyqxXdyeWBzR3e6r3nlkE87zlYaTPtPU+3swMoPu9ab
         0kL8/Al1s3wRbD4sgtaHTTvbD5/UljtTLkmj4WZvT5uQIMcK563FSxd4vq/SU4ezB/yL
         xE5w==
X-Gm-Message-State: AOJu0YyvLd50GtG2E32OqLNnLe3INm0VTjaEr6SvmyqzUrgjXp6M/QH2
	QkWMZPBNz1DjdlSPDXx7Macly0KuiVNuibAZX0nn6PIYOZdlHEO2YXiRXtMHxIymH3uWVkp2XDZ
	+T1Bv
X-Gm-Gg: Acq92OHfZw6bhw7Lg0UWezK6zZ/IMf3kTMUJL36wvl+Fycpi5nqYpnUFU0rOCzo2cMZ
	lXqV83kRS5baz1wdHeKw57N11D9qD4mvrnCkFunx17iDiQhYEnCRYirNfBE0fheUILXbc78TlO0
	qvu+OxPURiTI2IBMuxSFHtSs+VKnnbuiemW+24knUPTvXp9j065S8KRQJhuSMV3EqVDXXgNngLi
	aZUPoThGtVsCsOJU7f9W1nrX7EzIKKWUUUv6ABvHJoJBesE+4e9M7nIsPobDNbcreNP/hhoehJ+
	UweG/HgmwhYvAfAFrQci9RMcHkkNavCui5snYL6iGdCVGJhLhxTNKMuzwjZ4xyK+VUMkJRLqDQH
	QQsqRqvZLkj4Y2RFdIFcgAO74TU+PugYhUHxsCpw9Pk2+HSAIY62LEu/E6QkfvVjY2yCKxxtVxZ
	ipv0UGo8XpXa1ATWUMjupkL0+FULJD3KnP2K7fAWKIRCQ3T4wki9mx5pOPOmR7wYs2MBhEpOKu
X-Received: by 2002:a05:620a:648d:b0:914:db82:f791 with SMTP id af79cd13be357-9153dc29a52mr727746685a.49.1780179601868;
        Sat, 30 May 2026 15:20:01 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915324868a0sm651790085a.18.2026.05.30.15.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:20:01 -0700 (PDT)
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
Subject: [PATCH v4 11/13] selftests/liveupdate: Test session and file limit removal
Date: Sat, 30 May 2026 22:19:36 +0000
Message-ID: <20260530221938.115978-12-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260530221938.115978-1-pasha.tatashin@soleen.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
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


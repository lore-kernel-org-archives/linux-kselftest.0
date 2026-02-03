Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55789369201
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 18:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770142585; cv=none; b=BcYS1qIZIv5e55485b2f7M4T463GUKb0oO0wvbXh+tQDCOZVFSWMyEiojmzwsfNv67MWuPZmyhdiQh/tv4Jxg15978R1uPoRfnF+u+1lH7VhB4/b56nfgi+D0Fdvz/ThQ4LgRoZQbmGXrDDeZK4/se6CV54+pHoTIc7SMlKVdCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770142585; c=relaxed/simple;
	bh=4uJPwTtGdOf+GukpMdunMop58+8Bn2s7OyEFP8RIwsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RHujVjeLra+D6qVJsIorcX3Q+Ofuh0G1LBUxA8us2P2Ag1d2eGg1d0aYX0GimorC18wdhT1nxSQQrn0cKItqr/jASpi6BO5jPHGGObXZ+fgx9NCp9t9rIqban1dkfOqPvVLYVhvfs+uO3XqMARZHCe+U5R24+ApMSZXp79cckZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqDfhQT+; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqDfhQT+"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-34f634dbfd6so4544665a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 10:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770142583; x=1770747383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mjla1q3jju6XkNYbTp39sGOpZWNK/5G6gOcu20xqemI=;
        b=dqDfhQT+YSiilM+/jAV4Di0mctg5/N+hXgFPCxfncdCoDexOjpEPPpr00uLcXWXHEy
         IejN0XxY+tM4sFdMrAZW1DnuvofJzpgYGWf4aCCJYoESWKvzTC7Vnxjrk3CLDiIktRCq
         uNCZDY7YqJSo3zLF2PWAvYREXc7cLmdeL5BFGB+xa3BRqQrlzLelcsCdJnONFW1JQ8e3
         pYV3XdVvUDAIPzclEkKkQlkzW2E42kS+KFWQXANI03K2TN9pBF0PGWfGyydDw1xT/ofe
         zUKx8kFJVcwEGr6ICOwwIauOIt5/0ZCtTs/xSlZfW1s7OC2CrS6UMCfn2YCS+rqwKzNo
         xYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770142583; x=1770747383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjla1q3jju6XkNYbTp39sGOpZWNK/5G6gOcu20xqemI=;
        b=BwUxbvIPOkO00fAJVW/NYpbNAvQpyepnYYiKMbu1pN5VMWpCsuIRO9/GIeWWGqcDkD
         xKca9WOSPJKiPRKeLDxyQKnxpmvqULGyK0BbCXKSnXIFr3J8FbviNTcyhtJfmk2+/5Ye
         GKR5w/P6tGLow/N9tuQ1PzJ0SRgIYEKdba6Hv20EqUJFaQwx+bfVXdabQ24m7NPJDV0P
         Eb9eC8pLmgOaKGm0pK+hebKOWLFo8SIoaIjpR9LK/tZhDcgpbEbNdyN3okMlyyCqRW8o
         GxLIUT9LMMudRDD/jmLecwwZOxl0p3GIspjFJDZ+GqPITnr/aiP5o5ZTFBDUcVuLTSWj
         WEog==
X-Forwarded-Encrypted: i=1; AJvYcCXMKdvJT455cjHJy7q6i+hjaB3L1cv1qhQeIdBLAILh7twBHqWLI4uUwjNV1JBvDpIgD5BTF3I1K3O17bIkuXY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx54ntd17lkLvXBAj2EJJTBqtme48jWz9sYJKYVC9rakz+rl9Km
	/EoFqecXZSciFvIWzgjTPvubqMiQPXPtvAIX9CTFynrvASN+N637a7w=
X-Gm-Gg: AZuq6aJvjz2Wf7WRpwwmGuKLs5w3KmSZO1UdsxXuoat34lLgZzmljQF6drG+EzAe6Zu
	jdmOW+JAqzWbp6nULa8ETKhd/wcflxIxJvlFF4fDlWeiNviBK8neblIW4SzSlhyeiH2A0xP4wIS
	HLCUTHHkjt9YX3K2yJWxDrveYUaThd8bpt5d7I88OCRIAjOkAfp5x0uLwooh9Y+d6rVhhNKB3se
	x9YibKrTBNgvdBTghYfbT4OM/JN3V09Hj/jPdjjmf3wsGHoEyRQRyU7WTD6G/vW3Fbk4y+pr7Tg
	mzt9kawx3LJcR0T+8bK9y++9D07ZA3DDMlZ/nQFUaUiv2jyTbteuQMQ33s3YJRdSvzAaVG4NanY
	F34K8NRFHE04EB33cxCJiAek0MuPBQRgF89QYXomWD3EFqyzDWozZ1e2YhwxHiA+9dVg4T/Rin3
	qYwaalZVdp3wqoXC6pqN6ClDI7icoN+Ddk/Wpi8C+J
X-Received: by 2002:a17:90a:ec8f:b0:340:bde5:c9e8 with SMTP id 98e67ed59e1d1-3548719372cmr167467a91.22.1770142582737;
        Tue, 03 Feb 2026 10:16:22 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35485eb8dc6sm313230a91.9.2026.02.03.10.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 10:16:22 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: shuah@kernel.org
Cc: Jan Kara <jack@suse.cz>,
	Amir Goldstein <amir73il@gmail.com>,
	Matthew Bobrowski <repnop@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [RFC PATCH] selftests: fanotify: Add basic create/modify/delete event test
Date: Wed,  4 Feb 2026 03:15:43 +0900
Message-ID: <20260203181549.21750-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

Currently there are almost no automated selftests for fanotify notification
events in tools/testing/selftests/ (only mount namespace
related tests exist).

This patch adds a very basic selftest that exercises three fundamental
fanotify events:
    - FAN_CREATE (file creation)
    - FAN_MODIFY (file content modification via write())
    - FAN_DELETE (file removal)

The test
    - creates a test file, appends data, and removes it
    - verifies that corresponding events are received and the masks contain
      the expected bits (0x100, 0x2, 0x200)

Test TAP output:
    ok 1 FAN_CREATE detected
    ok 2 FAN_MODIFY detected
    ok 3 FAN_DELETE detected
    # PASSED: 1 / 1 tests passed.

This is intentionally kept minimal as a starting point.

Future work ideas (not in this patch):
    - Test permission events
    - Test rename/move events
    - Verify file names
    - Run under different filesystems

Any feedback on the direction, style, or additional test cases
would be greatly appreciated.

Thanks,
Jinseok.

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 tools/testing/selftests/filesystems/Makefile  |   7 +
 .../selftests/filesystems/fanotify_basic.c    | 122 ++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 tools/testing/selftests/filesystems/Makefile
 create mode 100644 tools/testing/selftests/filesystems/fanotify_basic.c

diff --git a/tools/testing/selftests/filesystems/Makefile b/tools/testing/selftests/filesystems/Makefile
new file mode 100644
index 0000000..c0e0242
--- /dev/null
+++ b/tools/testing/selftests/filesystems/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+CFLAGS += $(KHDR_INCLUDES)
+TEST_GEN_PROGS := devpts_pts file_stressor anon_inode_test kernfs_test fclog fanotify_basic
+TEST_GEN_PROGS_EXTENDED := dnotify_test
+
+include ../lib.mk
diff --git a/tools/testing/selftests/filesystems/fanotify_basic.c b/tools/testing/selftests/filesystems/fanotify_basic.c
new file mode 100644
index 0000000..4a4fbb4
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fanotify_basic.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <fcntl.h>
+#include <sys/fanotify.h>
+#include <linux/fanotify.h>
+#include "../kselftest_harness.h"
+#include "wrappers.h"
+
+static void create_file(const char *filename)
+{
+	int fd;
+	int ret;
+
+	fd = open(filename, O_CREAT | O_WRONLY | O_TRUNC, 0644);
+	if (fd == -1)
+		ksft_exit_fail_msg("(create)open failed: %s\n", strerror(errno));
+	ret = write(fd, "create_file", 11);
+	if (ret == -1)
+		ksft_exit_fail_msg("(create) writing failed: %s\n", strerror(errno));
+	close(fd);
+}
+
+static void modify_file(const char *filename)
+{
+	int fd;
+	int ret;
+
+	fd = open(filename, O_RDWR);
+	if (fd == -1)
+		ksft_exit_fail_msg("(modify)open failed :%s\n", strerror(errno));
+	if (lseek(fd, 0, SEEK_END) < 0)
+		ksft_exit_fail_msg("(modify)lseek failed");
+	ret = write(fd, "modify_file", 11);
+	if (ret == -1)
+		ksft_exit_fail_msg("(modify)write failed :%s\n", strerror(errno));
+	if (fsync(fd) == -1)
+		ksft_exit_fail_msg("(modify)fsync failed: %s\n", strerror(errno));
+
+	close(fd);
+}
+
+TEST(fanotify_cud_test)
+{
+	int fan_fd;
+	char buf[4096];
+	int ret;
+	ssize_t len;
+	struct fanotify_event_metadata *meta;
+
+	fan_fd = fanotify_init(FAN_CLASS_NOTIF | FAN_REPORT_FID, O_RDONLY);
+	ASSERT_GE(fan_fd, 0)
+	TH_LOG("fanotify_init failed: %s", strerror(errno));
+
+	ret = fanotify_mark(fan_fd, FAN_MARK_ADD,
+				  FAN_EVENT_ON_CHILD | FAN_CREATE |
+				  FAN_MODIFY | FAN_DELETE,
+				  AT_FDCWD, "/tmp");
+	ASSERT_GE(ret, 0)
+	TH_LOG("fanotify_mark failed: %s", strerror(errno));
+
+	// FAN_CREATE Test
+	create_file("/tmp/fanotify_test");
+	len = read(fan_fd, buf, sizeof(buf));
+	ASSERT_GT(len, 0)
+	TH_LOG("No event after create_file");
+
+	meta = (void *)buf;
+	if (FAN_EVENT_OK(meta, len)) {
+		TH_LOG("Event after create: mask = 0x%llx, pid=%d",
+		       (unsigned long long)meta->mask, meta->pid);
+		if (meta->mask & FAN_CREATE)
+			ksft_test_result_pass("FAN_CREATE detected\n");
+		else
+			TH_LOG("FAN_CREATE missing");
+	} else
+		ksft_test_result_fail("Invalid event metadata after create\n");
+
+	// FAN_MODIFY Test
+	modify_file("/tmp/fanotify_test");
+	len = read(fan_fd, buf, sizeof(buf));
+	ASSERT_GT(len, 0)
+		TH_LOG("No event after modify_file");
+
+	meta = (void *)buf;
+	if (FAN_EVENT_OK(meta, len)) {
+		TH_LOG("Event after modify: mask = 0x%llx, pid=%d",
+		       (unsigned long long)meta->mask, meta->pid);
+		if (meta->mask & FAN_MODIFY)
+			ksft_test_result_pass("FAN_MODIFY detected\n");
+		else
+			ksft_test_result_fail("FAN_MODIFY missing\n");
+	} else
+		ksft_test_result_fail("Invalid event metadata after modify\n");
+
+	// FAN_DELETE
+	ASSERT_EQ(unlink("/tmp/fanotify_test"), 0)
+		TH_LOG("unlink failed: %s", strerror(errno));
+
+	len = read(fan_fd, buf, sizeof(buf));
+	ASSERT_GT(len, 0)
+		TH_LOG("No event after unlink");
+
+	meta = (void *)buf;
+	if (FAN_EVENT_OK(meta, len)) {
+		TH_LOG("Event after delete: mask = 0x%llx, pid=%d",
+		       (unsigned long long)meta->mask, meta->pid);
+		if (meta->mask & FAN_DELETE)
+			ksft_test_result_pass("FAN_DELETE detected\n");
+		else
+			ksft_test_result_fail("FAN_DELETE missing\n");
+	} else
+		ksft_test_result_fail("Invalid event metadata after delete\n");
+
+	// Clean up
+	if (fan_fd >= 0) {
+		fanotify_mark(fan_fd, FAN_MARK_REMOVE, 0, AT_FDCWD, ".");
+		close(fan_fd);
+	}
+}
+
+TEST_HARNESS_MAIN
--
2.43.0

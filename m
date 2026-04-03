Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442173D75BF;
	Fri,  3 Apr 2026 19:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775245233; cv=none; b=UykVadA5R/p5gPM6dMyVKoEraSOwPzYXaasG9dVZvG4ihcSGoIDCoOxt39fhg200PUbo9c5Q7IGeQEhoW3W8ZfjljC+khu70F9aT59G7SxxgZnbAuOvFI0o5mAlpWkB/H4+DJSemrLcAuqHymcaHacXqtcT6QEQ9zCteiphj0vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775245233; c=relaxed/simple;
	bh=4sQ2am7P1fIKmx4JakwbC3BEjgsHp2lmwc8hACFKRSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCXzH2FJ+gh5LXe9mX3Muw3+gAVelKdTAf9JGWddifm8D3/gw12SvSd266eT882zZmvLGNkyyY8f4gr0r2dt6QQsD7l9lSXCHJvflMVuCEu5Yyqp5C4+pA4UwTltfC2p60D/n7ntOZpdXQJEl+o+g0U8cnI+Kf7hzEzSf68igrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Go2tvX9v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Go2tvX9v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2E5C2BCB3;
	Fri,  3 Apr 2026 19:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775245232;
	bh=4sQ2am7P1fIKmx4JakwbC3BEjgsHp2lmwc8hACFKRSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Go2tvX9vIXO8EQ7FnchajHLDwJAyDeUd2ba9pglp4R8p4TfPwtbTRxvwWW8nAex8z
	 riJFtzogQZha0TsAVk6oEpL5fa6Q1IDjFFZirOhY2UxemaonhgAqvut8CQ/gE4f7Ne
	 SNMgJq17zo4XkmuluRT1n2FCChbhIcTWBPfI4smS2mjYs+MYHr+t6PhRWSL5lbEoMB
	 SSpZZ4DBKE6SvQPew1OX2ROC5OgUOLteIWDz+pX4rV5+DgXIFzIDztY/h21VJNhvNB
	 reMVhu3ewxbXcTdsYDbJvmYi0jwjpJX4QNxMcI4tvAP7WwQGRDBznGTwfm8N7onmLv
	 3C3Pz6cKJsRPg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Usama Arif <usama.arif@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	Pratyush Yadav <ptyadav@amazon.de>
Subject: [PATCH v2 3/6] selftests/liveupdate: add test for memfd content preservation
Date: Fri,  3 Apr 2026 19:40:09 +0000
Message-ID: <20260403194014.3704180-4-pratyush@kernel.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <20260403194014.3704180-1-pratyush@kernel.org>
References: <20260403194014.3704180-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

Add a selftest that makes sure the contents of a memfd are correctly
preserved across a live update. In stage 1, create a memfd and fill it
with random data, and preserve it. Save the random data to the file
system. This will be used by stage 2 to verify the contents are correct.

In stage 2, retrieve the memfd and compare its contents with the
contents saved on the file system.

Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 tools/testing/selftests/liveupdate/Makefile   |  1 +
 .../testing/selftests/liveupdate/luo_memfd.c  | 80 +++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/Makefile b/tools/testing/selftests/liveupdate/Makefile
index 051daae55eec..8e2eb6500c07 100644
--- a/tools/testing/selftests/liveupdate/Makefile
+++ b/tools/testing/selftests/liveupdate/Makefile
@@ -13,6 +13,7 @@ TEST_FILES += do_kexec.sh
 include ../lib.mk
 
 CFLAGS += $(KHDR_INCLUDES)
+CFLAGS += -I$(top_srcdir)/tools/include
 CFLAGS += -Wall -O2 -Wno-unused-function
 CFLAGS += -MD
 
diff --git a/tools/testing/selftests/liveupdate/luo_memfd.c b/tools/testing/selftests/liveupdate/luo_memfd.c
index 47d2c3163b62..70eb96950f04 100644
--- a/tools/testing/selftests/liveupdate/luo_memfd.c
+++ b/tools/testing/selftests/liveupdate/luo_memfd.c
@@ -3,6 +3,9 @@
 /*
  * Copyright (c) 2026, Google LLC.
  * Pratyush Yadav (Google) <pratyush@kernel.org>
+ *
+ * Copyright (C) 2025 Amazon.com Inc. or its affiliates.
+ * Pratyush Yadav <ptyadav@amazon.de>
  */
 
 /*
@@ -11,11 +14,14 @@
 
 #include <errno.h>
 #include <fcntl.h>
+#include <stdlib.h>
 #include <string.h>
 #include <sys/ioctl.h>
+#include <sys/mman.h>
 #include <unistd.h>
 
 #include <linux/liveupdate.h>
+#include <linux/sizes.h>
 
 #include "../kselftest.h"
 #include "../kselftest_harness.h"
@@ -25,9 +31,83 @@
 #define STATE_SESSION_NAME "luo-state"
 #define STATE_MEMFD_TOKEN 1
 
+#define MEMFD_DATA_SESSION_NAME "memfd_data_session"
+#define MEMFD_DATA_TOKEN 1
+#define MEMFD_DATA_BUFFER_SIZE SZ_1M
+#define MEMFD_DATA_FS_COPY "memfd_data_fs_copy.bin"
+
 static int luo_fd = -1;
 static int stage;
 
+static void memfd_data_stage_1(struct __test_metadata *_metadata)
+{
+	int fd, session;
+	char *buffer;
+	struct liveupdate_session_preserve_fd preserve_arg = { .size = sizeof(preserve_arg) };
+
+	buffer = malloc(MEMFD_DATA_BUFFER_SIZE);
+	ASSERT_NE(buffer, NULL);
+
+	session = luo_create_session(luo_fd, MEMFD_DATA_SESSION_NAME);
+	ASSERT_GE(session, 0);
+
+	fd = create_random_memfd("memfd_data", buffer, MEMFD_DATA_BUFFER_SIZE);
+	ASSERT_GE(fd, 0);
+
+	ASSERT_EQ(save_test_data(MEMFD_DATA_FS_COPY, buffer, MEMFD_DATA_BUFFER_SIZE), 0);
+
+	preserve_arg.fd = fd;
+	preserve_arg.token = MEMFD_DATA_TOKEN;
+	ASSERT_GE(ioctl(session, LIVEUPDATE_SESSION_PRESERVE_FD, &preserve_arg), 0);
+
+	daemonize_and_wait();
+}
+
+static void memfd_data_stage_2(struct __test_metadata *_metadata)
+{
+	int fd, session;
+	char *buffer;
+	struct liveupdate_session_retrieve_fd retrieve_arg = { .size = sizeof(retrieve_arg) };
+
+	buffer = malloc(MEMFD_DATA_BUFFER_SIZE);
+	ASSERT_NE(buffer, NULL);
+
+	session = luo_retrieve_session(luo_fd, MEMFD_DATA_SESSION_NAME);
+	ASSERT_GE(session, 0);
+
+	ASSERT_EQ(load_test_data(MEMFD_DATA_FS_COPY, buffer, MEMFD_DATA_BUFFER_SIZE), 0);
+
+	retrieve_arg.token = MEMFD_DATA_TOKEN;
+	ASSERT_GE(ioctl(session, LIVEUPDATE_SESSION_RETRIEVE_FD, &retrieve_arg), 0);
+	fd = retrieve_arg.fd;
+	ASSERT_GE(fd, 0);
+
+	ASSERT_EQ(verify_fd_content_read(fd, buffer, MEMFD_DATA_BUFFER_SIZE), 0);
+
+	ASSERT_EQ(luo_session_finish(session), 0);
+}
+
+/*
+ * Test that a memfd with its data is preserved across live update.
+ */
+TEST(memfd_data)
+{
+	if (cwd_is_tmpfs())
+		SKIP(return, "test saves data to rootfs, cannot run on tmpfs");
+
+	switch (stage) {
+	case 1:
+		memfd_data_stage_1(_metadata);
+		break;
+	case 2:
+		memfd_data_stage_2(_metadata);
+		break;
+	default:
+		TH_LOG("Unknown stage %d\n", stage);
+		ASSERT_FALSE(true);
+	}
+}
+
 int main(int argc, char *argv[])
 {
 	int expected_stage = 0;
-- 
2.53.0.1213.gd9a14994de-goog


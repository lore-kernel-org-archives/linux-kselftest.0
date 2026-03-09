Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD17C3A7855;
	Mon,  9 Mar 2026 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057297; cv=none; b=fcbMhVIWSNikLprOO6b0kT201hpVzJqWZiW6jzHerB00IQmNEVU+Rw+kpihuGNjSP7gVpFv9BRmpfx05qLgAU1uoLQicWAJLIOIlHBWl27EDqEMHVxdhYV/nGYLgTYyHepyjC+77ahgi0adQYLsVRJACZ/Zhk5bx2c8YCUquoHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057297; c=relaxed/simple;
	bh=aukVArEnfq1vpcp1oDLYNMSSeQUJHmSNYgjjmrkbTRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mg/oaUvAWO+S7wYXCeTj+T8gD47fyte8oeeUVRiMFLqU+LhnqyrqPG+ncETwIZnE96PFmmm0S+hf9YSSoTYJau//WpY7eDNpbaurBspUI66JVK+0wAd6vMWEnbHWIUL7NyTW05fJMVOw8Qws8MTbmj+aBNn64puR6FTL6Iubc9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+V272oD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+V272oD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF58C2BCB3;
	Mon,  9 Mar 2026 11:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773057297;
	bh=aukVArEnfq1vpcp1oDLYNMSSeQUJHmSNYgjjmrkbTRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h+V272oDbkvOesj7cS1BfEoE2WszM4TfVldXlBBN7FHsPHmmU1wSSAeLBK4g024Lr
	 Gp0Zz69XpjGr2mm4qQzw2Q/KWj1A8kp9Qjj7BwCGbqcMEAVdolh0wrKtv9gshb4cgn
	 kn//cXAoPr5C3IBPgHPPKEDX77h3VqoU7F/ztuqNtnWtM5eGZpwV5y51Fus0UjEkh6
	 Lf0bh5McIuQz6HfUyCP9D80ZWjOzFIXQmLTxMphUxFh6H/yYy4gnbC0ykCxnUe1GA+
	 pasfd3hbqDrfdrWUsRrzJb1/rod++t47KYmNqYtC4LjX1LZgUplCKuZP+8wifeZNmX
	 AUQg612eBKvGg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 3/6] selftests/liveupdate: add test for memfd content preservation
Date: Mon,  9 Mar 2026 11:54:36 +0000
Message-ID: <20260309115441.266805-4-pratyush@kernel.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260309115441.266805-1-pratyush@kernel.org>
References: <20260309115441.266805-1-pratyush@kernel.org>
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
 .../testing/selftests/liveupdate/luo_memfd.c  | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)

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
index b779eee18387..52b5f6b16e19 100644
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
@@ -25,9 +31,64 @@
 #define STATE_SESSION_NAME "luo-state"
 #define STATE_MEMFD_TOKEN 1
 
+#define MEMFD_DATA_SESSION_NAME "memfd_data_session"
+#define MEMFD_DATA_TOKEN 1
+#define MEMFD_DATA_BUFFER_SIZE SZ_1M
+#define RANDOM_DATA_FILE "luo_random_data.bin"
+
 #define LIVEUPDATE_DEV "/dev/liveupdate"
 static int luo_fd = -1, stage;
 
+/*
+ * Test that a memfd with its data is preserved across live update.
+ */
+TEST(memfd_data)
+{
+	int fd, session;
+	char *buffer;
+	struct liveupdate_session_preserve_fd preserve_arg = { .size = sizeof(preserve_arg) };
+	struct liveupdate_session_retrieve_fd retrieve_arg = { .size = sizeof(retrieve_arg) };
+
+	buffer = malloc(MEMFD_DATA_BUFFER_SIZE);
+	ASSERT_NE(buffer, NULL);
+
+	switch (stage) {
+	case 1:
+		session = luo_create_session(luo_fd, MEMFD_DATA_SESSION_NAME);
+		ASSERT_GE(session, 0);
+
+		fd = create_random_memfd("memfd_data", buffer, MEMFD_DATA_BUFFER_SIZE);
+		ASSERT_GE(fd, 0);
+
+		ASSERT_EQ(save_test_data(RANDOM_DATA_FILE, buffer, MEMFD_DATA_BUFFER_SIZE), 0);
+
+		preserve_arg.fd = fd;
+		preserve_arg.token = MEMFD_DATA_TOKEN;
+		ASSERT_GE(ioctl(session, LIVEUPDATE_SESSION_PRESERVE_FD, &preserve_arg), 0);
+
+		daemonize_and_wait();
+		break;
+	case 2:
+		session = luo_retrieve_session(luo_fd, MEMFD_DATA_SESSION_NAME);
+		ASSERT_GE(session, 0);
+
+		ASSERT_EQ(load_test_data(RANDOM_DATA_FILE, buffer, MEMFD_DATA_BUFFER_SIZE), 0);
+
+		retrieve_arg.token = MEMFD_DATA_TOKEN;
+		ASSERT_GE(ioctl(session, LIVEUPDATE_SESSION_RETRIEVE_FD, &retrieve_arg), 0);
+		fd = retrieve_arg.fd;
+		ASSERT_GE(fd, 0);
+
+		ASSERT_EQ(verify_fd_content(fd, buffer, MEMFD_DATA_BUFFER_SIZE), 0);
+
+		ASSERT_EQ(luo_session_finish(session), 0);
+		break;
+	default:
+		TH_LOG("Unknown stage %d\n", stage);
+		ASSERT_FALSE(true);
+	}
+}
+
 int main(int argc, char *argv[])
 {
 	int session, expected_stage = 0;
-- 
2.53.0.473.g4a7958ca14-goog


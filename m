Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE463A9DAD;
	Sat,  4 Apr 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775298307; cv=none; b=X6jvoJy7G4cC5n4L1MBtWaBkkB9czOKcrA3WqdodHJVRZh9eyn2pl6zkdq3dMRG7fJwZ+DzE6rHpcY/+yfShP7ZRdPeG5dM+fFvxqrq0wrnF9oilTVMbOxuc7T5oSUfu9ZylBwGb3djIRv+fgau06xKqJHn+HaQGMDxiys1HtKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775298307; c=relaxed/simple;
	bh=4wUqlSk5F6JPXlOV4nO49t1axV7aX2mPAkRXPiBcSU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uKvv8QV+NokFVu8xC9KZA0L/RVer7L+L4pbkY+At85YDEtDZBWZuWH+6UssBZiLhdvS5kcpK3AJaCBYH9UDb0mNG7s9GVzjlCfEVeBuKPje9CSvTrUZQioDXlOUWdfmuvpphNsMglt5/Owwseu8D1ktG46xfVkUDZZ8QsRX98xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRW6hSC5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRW6hSC5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821CEC2BCB3;
	Sat,  4 Apr 2026 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775298307;
	bh=4wUqlSk5F6JPXlOV4nO49t1axV7aX2mPAkRXPiBcSU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iRW6hSC5CY+es5Pz7Wk3TJeZUOI0x46U73T6qNo+XSobA8Up1tzhuDhurEq37oMlG
	 EkCTyNJhMK0O1w20IYtoyDl/Bttv6DqIP5knyo9gGXFNF6azYe9rB1kBo2zv0/Hst8
	 8fBgtGHqGFU88oiH70jUrekPj+Sr013diNBm5OqqLx31daCba1UHcp4pqgaRRPGnwZ
	 TNlkE7vPNeVd2cw2LiRzbwYZ7x6Y1nAocXNPV+UgMO7SVCa6fbBjCtV5r2L11ifPX4
	 geSMcZAifHECsMVI04oUcbgwuQueTMFDBpIaPE4IVf3Tfvvg3SlomEQwLBCaN2e1ko
	 pz4tEX2p2pbag==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Usama Arif <usama.arif@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v3 2/6] selftests/liveupdate: add helper functions for memfd tests
Date: Sat,  4 Apr 2026 10:24:45 +0000
Message-ID: <20260404102452.4091740-3-pratyush@kernel.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <20260404102452.4091740-1-pratyush@kernel.org>
References: <20260404102452.4091740-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

Add some helper functions that will be used by memfd tests. This moves
some of the complexity out of the test itself, which results in better
test readability and less code duplication.

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 .../selftests/liveupdate/luo_test_utils.c     | 191 +++++++++++++++++-
 .../selftests/liveupdate/luo_test_utils.h     |  10 +
 2 files changed, 200 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/luo_test_utils.c
index 3c8721c505df..ceb918ef9813 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.c
+++ b/tools/testing/selftests/liveupdate/luo_test_utils.c
@@ -1,8 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /*
- * Copyright (c) 2025, Google LLC.
+ * Copyright (c) 2025-2026, Google LLC.
  * Pasha Tatashin <pasha.tatashin@soleen.com>
+ * Pratyush Yadav (Google) <pratyush@kernel.org>
+ *
+ * Copyright (C) 2025 Amazon.com Inc. or its affiliates.
+ * Pratyush Yadav <ptyadav@amazon.de>
  */
 
 #define _GNU_SOURCE
@@ -20,9 +24,194 @@
 #include <sys/stat.h>
 #include <errno.h>
 #include <stdarg.h>
+#include <sys/vfs.h>
+#include <linux/magic.h>
 
 #include "luo_test_utils.h"
 
+int cwd_is_tmpfs(void)
+{
+	struct statfs buf;
+
+	if (statfs(".", &buf) < 0)
+		return -errno;
+
+	return buf.f_type == TMPFS_MAGIC;
+}
+
+/* Read exactly specified size from fd. Any less results in error. */
+int read_size(int fd, char *buffer, size_t size)
+{
+	size_t remain = size;
+	ssize_t bytes_read;
+
+	while (remain) {
+		bytes_read = read(fd, buffer, remain);
+		if (bytes_read == 0)
+			return -ENODATA;
+		if (bytes_read < 0) {
+			if (errno == EINTR)
+				continue;
+			else
+				return -errno;
+		}
+
+		remain -= bytes_read;
+		buffer += bytes_read;
+	}
+
+	return 0;
+}
+
+/* Write exactly specified size from fd. Any less results in error. */
+int write_size(int fd, const char *buffer, size_t size)
+{
+	size_t remain = size;
+	ssize_t written;
+
+	while (remain) {
+		written = write(fd, buffer, remain);
+		if (written == 0)
+			return -EIO;
+		if (written < 0) {
+			if (errno == EINTR)
+				continue;
+			else
+				return -errno;
+		}
+
+		remain -= written;
+		buffer += written;
+	}
+
+	return 0;
+}
+
+int generate_random_data(char *buffer, size_t size)
+{
+	int fd, ret;
+
+	fd = open("/dev/urandom", O_RDONLY);
+	if (fd < 0)
+		return -errno;
+
+	ret = read_size(fd, buffer, size);
+	close(fd);
+	return ret;
+}
+
+int save_test_data(const char *filename, const char *buffer, size_t size)
+{
+	int fd, ret;
+
+	fd = open(filename, O_RDWR | O_CREAT | O_TRUNC, 0666);
+	if (fd < 0)
+		return -errno;
+
+	ret = write_size(fd, buffer, size);
+	fsync(fd);
+	close(fd);
+	return ret;
+}
+
+int load_test_data(const char *filename, char *buffer, size_t size)
+{
+	int fd, ret;
+
+	fd = open(filename, O_RDONLY);
+	if (fd < 0)
+		return -errno;
+
+	ret = read_size(fd, buffer, size);
+	close(fd);
+	return ret;
+}
+
+/* Create and initialize a memfd with random data. */
+int create_random_memfd(const char *memfd_name, char *buffer, size_t size)
+{
+	int fd;
+	int ret;
+
+	fd = memfd_create(memfd_name, 0);
+	if (fd < 0)
+		return -errno;
+
+	ret = generate_random_data(buffer, size);
+	if (ret < 0) {
+		close(fd);
+		return ret;
+	}
+
+	ret = write_size(fd, buffer, size);
+	if (ret < 0) {
+		close(fd);
+		return ret;
+	}
+
+	/* Reset file position to beginning */
+	if (lseek(fd, 0, SEEK_SET) < 0) {
+		ret = -errno;
+		close(fd);
+		return ret;
+	}
+
+	return fd;
+}
+
+/*
+ * Make sure fd contains expected data up to size. Returns 0 on success, 1 on
+ * data mismatch, -errno on error.
+ */
+int verify_fd_content_read(int fd, const char *expected_data, size_t size)
+{
+	char *buffer;
+	int ret;
+
+	buffer = malloc(size);
+	if (!buffer)
+		return -ENOMEM;
+
+	/* Reset file position to beginning */
+	if (lseek(fd, 0, SEEK_SET) < 0) {
+		ret = -errno;
+		goto out;
+	}
+
+	ret = read_size(fd, buffer, size);
+	if (ret < 0)
+		goto out;
+
+	if (memcmp(buffer, expected_data, size) != 0) {
+		ret = 1;
+		goto out;
+	}
+
+	ret = 0;
+
+out:
+	free(buffer);
+	return ret;
+}
+
+/*
+ * Verify fd content using mmap. Returns 0 on success, 1 on data mismatch,
+ * -errno on error.
+ */
+int verify_fd_content_mmap(int fd, const char *expected_data, size_t size)
+{
+	char *mapped_mem;
+	int ret;
+
+	mapped_mem = mmap(NULL, size, PROT_READ, MAP_SHARED, fd, 0);
+	if (mapped_mem == MAP_FAILED)
+		return -errno;
+
+	ret = memcmp(mapped_mem, expected_data, size) ? 1 : 0;
+	munmap(mapped_mem, size);
+	return ret;
+}
+
 int luo_open_device(void)
 {
 	return open(LUO_DEVICE, O_RDWR);
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.h b/tools/testing/selftests/liveupdate/luo_test_utils.h
index 90099bf49577..a69dce2649b0 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.h
+++ b/tools/testing/selftests/liveupdate/luo_test_utils.h
@@ -35,6 +35,16 @@ void restore_and_read_stage(int state_session_fd, int token, int *stage);
 
 void daemonize_and_wait(void);
 
+int cwd_is_tmpfs(void);
+int read_size(int fd, char *buffer, size_t size);
+int write_size(int fd, const char *buffer, size_t size);
+int generate_random_data(char *buffer, size_t size);
+int save_test_data(const char *filename, const char *buffer, size_t size);
+int load_test_data(const char *filename, char *buffer, size_t size);
+int create_random_memfd(const char *memfd_name, char *buffer, size_t size);
+int verify_fd_content_read(int fd, const char *expected_data, size_t size);
+int verify_fd_content_mmap(int fd, const char *expected_data, size_t size);
+
 typedef void (*luo_test_stage1_fn)(int luo_fd);
 typedef void (*luo_test_stage2_fn)(int luo_fd, int state_session_fd);
 
-- 
2.53.0.1213.gd9a14994de-goog


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939E13A7F52;
	Mon,  9 Mar 2026 11:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057295; cv=none; b=JTdNreDlzvWvD4CEgHB47KPsdxPEo6n8V+1LehaCAVVASBAUDyGeaKncojWteXIxp+FVMEoBx9kuIcFVC/j6FfTMpLEUb15yzPWHYqqihAdvTFZNtdYTF/4OjTnsd8gTqhamnmOsMSnvhC+W+7i/0R7hslgaU1w00tFPYzixQYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057295; c=relaxed/simple;
	bh=PghrAoUWQBw2NUIGa/NJWkd6SAFY/nFx+VVc64+OWJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dt6gvMVdJMWaaOpwXKlSdud/M5VbhCgBdJvKx5W/MrTicsDTO3UsZBqvfQwMDYJyKe0HmGrFtOjE8BHCEYX8lJAXEPUvleDKaV4/Wo0Lm4g005Km5MoPXsNXVty4f3/mBPIeg4q9Lq2tJVB/hdCuS650pt0KMUqG2SMmv7YojNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNUsru5j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNUsru5j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941C6C2BC9E;
	Mon,  9 Mar 2026 11:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773057295;
	bh=PghrAoUWQBw2NUIGa/NJWkd6SAFY/nFx+VVc64+OWJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TNUsru5jubWi2MbJKJBuu3usla6/Z1udHfgghCkcSPNQPkz7iUVrHtG3JgprG2w+D
	 a9KONyqqvjdcrsjH4N3Ulg80eqb5X6+2AFZotV2egl2jzV/qaHBGMfm+2vdPWZRXmN
	 e3Hg91eeplQkzr5L1XtSYd+bHogb7SZfHcsoXLD0zXHhV2hqLuX+n9p1A77p6Imasa
	 V+HqEqiAkvyUVN25DP0hP+bso+5VZGiLNkC4jVO8vtgOu+Kuiq512MCw2M9Hn+27+i
	 kfzQa7S6sRGIIJ8KIBj+pT5VqxXsFH8mHZx6VM2AE6ohvd120npMtjV6IBjvRssl0b
	 yKqT3B0U4pSpQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 2/6] selftests/liveupdate: add helper functions for memfd tests
Date: Mon,  9 Mar 2026 11:54:35 +0000
Message-ID: <20260309115441.266805-3-pratyush@kernel.org>
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

Add some helper functions that will be used by memfd tests. This moves
some of the complexity out of the test itself, which results in better
test readability and less code duplication.

Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 .../selftests/liveupdate/luo_test_utils.c     | 175 +++++++++++++++++-
 .../selftests/liveupdate/luo_test_utils.h     |   9 +
 2 files changed, 183 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/luo_test_utils.c
index 3c8721c505df..45ace3697ee6 100644
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
@@ -23,6 +27,175 @@
 
 #include "luo_test_utils.h"
 
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
+		if (bytes_read < 0)
+			return -errno;
+
+		remain -= bytes_read;
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
+		if (written < 0)
+			return -errno;
+
+		remain -= written;
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
+	fd = open(filename, O_RDWR | O_CREAT, 0666);
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
+	if (write_size(fd, buffer, size) < 0) {
+		close(fd);
+		return -errno;
+	}
+
+	/* Reset file position to beginning */
+	if (lseek(fd, 0, SEEK_SET) < 0) {
+		close(fd);
+		return -errno;
+	}
+
+	return fd;
+}
+
+/*
+ * Make sure fd contains expected data up to size. Returns 0 on success, 1 on
+ * data mismatch, -errno on error.
+ */
+int verify_fd_content(int fd, const char *expected_data, size_t size)
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
+	/* ret = memcmp(mapped_mem, expected_data, size) ? 1 : 0; */
+	ret = 0;
+	for (size_t i = 0; i < size; i++) {
+		if (mapped_mem[i] != expected_data[i]) {
+			ret = 1;
+			break;
+		}
+	}
+
+	munmap(mapped_mem, size);
+	return ret;
+}
+
 int luo_open_device(void)
 {
 	return open(LUO_DEVICE, O_RDWR);
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.h b/tools/testing/selftests/liveupdate/luo_test_utils.h
index 90099bf49577..d1b85703708b 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.h
+++ b/tools/testing/selftests/liveupdate/luo_test_utils.h
@@ -35,6 +35,15 @@ void restore_and_read_stage(int state_session_fd, int token, int *stage);
 
 void daemonize_and_wait(void);
 
+int read_size(int fd, char *buffer, size_t size);
+int write_size(int fd, const char *buffer, size_t size);
+int generate_random_data(char *buffer, size_t size);
+int save_test_data(const char *filename, const char *buffer, size_t size);
+int load_test_data(const char *filename, char *buffer, size_t size);
+int create_random_memfd(const char *memfd_name, char *buffer, size_t size);
+int verify_fd_content(int fd, const char *expected_data, size_t size);
+int verify_fd_content_mmap(int fd, const char *expected_data, size_t size);
+
 typedef void (*luo_test_stage1_fn)(int luo_fd);
 typedef void (*luo_test_stage2_fn)(int luo_fd, int state_session_fd);
 
-- 
2.53.0.473.g4a7958ca14-goog


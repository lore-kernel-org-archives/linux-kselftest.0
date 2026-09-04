Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81EE4078EA;
	Fri,  4 Sep 2026 10:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518338; cv=none; b=KYE5eC+8tJ/2jcKp6FTAgbkZXQ6vjw9FyPEzJpSzHGUiBTZgkZHaHThsgRd7DAftLNfLMvQZbttJZv5okYtvvaKa/NeItPrFfPaBfm8TMW5fqv/c0EWdtHfYpUcc0nO7RZIGXWw5UR26hcAk0UtEcLFs8P2MlqUcznTzSYOd5Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518338; c=relaxed/simple;
	bh=M6VPZSP4N7Tdl7alnu4MXD0zXNdQWm8noHuUEkT12l0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OaCwgaeKiYIdguZkM5lBlLSpCIFVXvUiqscYZ7DDjn6qrRTr8PsxU5qC9f5cDFxH+Hxy8T1AUNkumzZjofTzx9GVkDE2DpGrYYXaQtTJjApU0m+fDR3Oo7cTcX0juVWZQQTVHoz0uSg/g+pUbkph4KNiDFzqgFW5iBozhEFT5xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=qoUjr8yF; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="qoUjr8yF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=NM1eSMoCqUMUlgdICsVdSOO0iW8qsu55z6uJhM9FWVU=; b=
	qoUjr8yFtOeWyPrlWrxqWfpO27QX6LzwC3KFrKTV93GO+HVW8T5sVtxK3UATbMtw2FXk+67q/zkue
	17wL/NpJbQKCvTO9BCVmlTxw86xU9lOjG72I1ICHKOfA+9W6B+YhKf6ZiGFtAYkKK6CcOdM7l90PA
	AMx2Lv9FFhnTWqfqHx+6MReeJMQJdVZzx4mywgdcSRLTLPVtqV7KnBdVE/WxXFX9NDn0zD9N0hQuY
	ZUh5jAI8ewxbdbdiwAYQtrX6sg7J//UelKdhfpfL0lvJh46K9/jFcFz8VzggrvGi03qmzNiXnyBpi
	2ycpkRw4kpkTkQ0u6s+O69iNo9EWe3DCsQ==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x2RJo-00Eq1O-5D; Fri, 04 Sep 2026 12:38:48 +0200
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Amir Goldstein <amir73il@gmail.com>,
	Chen Linxuan <me@black-desk.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matt Harvey <mharvey@jumptrading.com>,
	kernel-dev@igalia.com,
	Luis Henriques <luis@igalia.com>
Subject: [RFC PATCH v3 8/8] selftests/fuse: add fuse readdir caching test
Date: Fri,  4 Sep 2026 11:39:20 +0100
Message-ID: <20260904103920.4471-9-luis@igalia.com>
In-Reply-To: <20260904103920.4471-1-luis@igalia.com>
References: <20260904103920.4471-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This new test will check the caching behaviour using combinations of two
opendir flags: FOPEN_KEEP_CACHE and FOPEN_CACHE_DIR.

Signed-off-by: Luis Henriques <luis@igalia.com>
---
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   2 +
 .../fuse/fuse_readdir_cache_test.c            | 274 ++++++++++++++++++
 3 files changed, 277 insertions(+)
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c

diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/testing/selftests/filesystems/fuse/.gitignore
index ebfe7133d811..ffa356f23e8c 100644
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@ -4,3 +4,4 @@ fusectl_test
 write_extend_eof_test
 fuse_acl_cache_test
 fuse_symlink_cache_test
+fuse_readdir_cache_test
diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/testing/selftests/filesystems/fuse/Makefile
index 3a5a557dde7a..570ced181168 100644
--- a/tools/testing/selftests/filesystems/fuse/Makefile
+++ b/tools/testing/selftests/filesystems/fuse/Makefile
@@ -6,6 +6,7 @@ TEST_GEN_PROGS := fusectl_test
 TEST_GEN_PROGS += write_extend_eof_test
 TEST_GEN_PROGS += fuse_acl_cache_test
 TEST_GEN_PROGS += fuse_symlink_cache_test
+TEST_GEN_PROGS += fuse_readdir_cache_test
 TEST_GEN_FILES := fuse_mnt
 
 include ../../lib.mk
@@ -30,5 +31,6 @@ $(OUTPUT)/fuse_mnt: LDLIBS += $(VAR_LDLIBS)
 
 $(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
 $(OUTPUT)/fuse_symlink_cache_test: fuse_common.c fuse_symlink_cache_test.c
+$(OUTPUT)/fuse_readdir_cache_test: fuse_common.c fuse_readdir_cache_test.c
 
 EXTRA_CLEAN := fuse_common.o
diff --git a/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c b/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
new file mode 100644
index 000000000000..7c49cc6a23e3
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Simple filesystem to test FUSE readdir cache
+ *
+ * It will simply perform readdir operations on a directory checking how many
+ * times a request is sent to user-space using all the possible caching
+ * combination setting (FOPEN_KEEP_CACHE and FOPEN_CACHE_DIR flags).
+ */
+
+#include <stdio.h>
+#include <limits.h>
+#include <dirent.h>
+
+#include "kselftest_harness.h"
+
+#include "fuse_common.h"
+
+#define DIRNAME "mydir"
+#define FILENAME "myfile"
+
+#define DIR_INO 42
+#define FILE_INO 43
+#define DOT_INO 40
+#define DOTDOT_INO 41
+
+#define TIMEOUT	86400.0f
+
+struct test_state {
+	pthread_mutex_t lock;
+	bool cache_readdir;
+	bool keep_cache;
+	int readdir_counter;
+} test_state = {
+	.lock = PTHREAD_MUTEX_INITIALIZER,
+};
+
+static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
+{
+	struct fuse_entry_param e = {};
+
+	if (parent != FUSE_ROOT_ID || strcmp(name, DIRNAME) != 0)
+		fuse_reply_err(req, ENOENT);
+	else {
+		if (!strcmp(name, DIRNAME)) {
+			e.ino = DIR_INO;
+			e.attr.st_mode = S_IFDIR | 0755;
+			e.attr.st_nlink = 1;
+		} else {
+			e.ino = FUSE_ROOT_ID;
+			e.attr.st_mode = S_IFDIR | 0755;
+			e.attr.st_nlink = 2;
+		}
+		e.attr.st_mtime = time(NULL);
+		e.attr_timeout = TIMEOUT;
+		e.entry_timeout = TIMEOUT;
+		fuse_reply_entry(req, &e);
+	}
+}
+
+static int fill_stat(fuse_ino_t ino, struct stat *st)
+{
+	int ret = 0;
+
+	st->st_ino = ino;
+	st->st_mtime = time(NULL);
+
+	switch (ino) {
+	case FUSE_ROOT_ID:
+		st->st_mode = S_IFDIR | 0755;
+		st->st_nlink = 2;
+		break;
+	case DOT_INO:
+	case DOTDOT_INO:
+	case DIR_INO:
+		st->st_mode = S_IFDIR | 0755;
+		st->st_nlink = 1;
+		break;
+	case FILE_INO:
+		st->st_mode = S_IFREG | 0444;
+		st->st_nlink = 1;
+		break;
+	default:
+		ret = -1;
+		break;
+	}
+
+	return ret;
+}
+
+static void fs_getattr(fuse_req_t req, fuse_ino_t ino,
+		       struct fuse_file_info *fi)
+{
+	struct stat st = {};
+
+	if (fill_stat(ino, &st) < 0)
+		fuse_reply_err(req, ENOENT);
+	else
+		fuse_reply_attr(req, &st, TIMEOUT);
+}
+
+static void fs_opendir(fuse_req_t req, fuse_ino_t ino,
+		       struct fuse_file_info *fi)
+{
+	pthread_mutex_lock(&test_state.lock);
+	fi->keep_cache = test_state.keep_cache;
+	fi->cache_readdir = test_state.cache_readdir;
+	pthread_mutex_unlock(&test_state.lock);
+	fuse_reply_open(req, fi);
+}
+
+static void fs_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
+		       off_t offset, struct fuse_file_info *fi)
+{
+	struct stat st = {};
+	char buf[1024];
+	char *pbuf;
+	size_t rem = size;
+	size_t sz;
+	int nextoff = 0;
+
+	if (ino != DIR_INO) {
+		fuse_reply_err(req, ENOTDIR);
+		return;
+	}
+	if (offset) {
+		fuse_reply_buf(req, NULL, 0);
+		return;
+	}
+	pbuf = buf;
+	fill_stat(DOT_INO, &st);
+	sz = fuse_add_direntry(req, pbuf, rem, ".", &st, nextoff++);
+	rem -= sz;
+	pbuf += sz;
+	fill_stat(DOTDOT_INO, &st);
+	sz = fuse_add_direntry(req, pbuf, rem, "..", &st, nextoff++);
+	rem -= sz;
+	pbuf += sz;
+	fill_stat(FILE_INO, &st);
+	sz = fuse_add_direntry(req, pbuf, rem, FILENAME, &st, nextoff++);
+	rem -= sz;
+
+	fuse_reply_buf(req, buf, size - rem);
+
+	pthread_mutex_lock(&test_state.lock);
+	test_state.readdir_counter++;
+	pthread_mutex_unlock(&test_state.lock);
+}
+
+static const struct fuse_lowlevel_ops fs_ops = {
+	.lookup		= fs_lookup,
+	.getattr	= fs_getattr,
+	.opendir	= fs_opendir,
+	.readdir	= fs_readdir,
+};
+
+FIXTURE(readdir_cache)
+{
+	struct fuse_session *se;
+	char mountpoint[MOUNTPOINT_SZ];
+	pthread_t thread;
+};
+
+FIXTURE_VARIANT(readdir_cache)
+{
+	bool cache_readdir;
+	bool keep_cache;
+};
+FIXTURE_VARIANT_ADD(readdir_cache, nocache)
+{
+	.cache_readdir = false,
+	.keep_cache = false,
+};
+FIXTURE_VARIANT_ADD(readdir_cache, cache_readdir)
+{
+	.cache_readdir = true,
+	.keep_cache = false,
+};
+FIXTURE_VARIANT_ADD(readdir_cache, keep_cache)
+{
+	.cache_readdir = false,
+	.keep_cache = true,
+};
+FIXTURE_VARIANT_ADD(readdir_cache, cache)
+{
+	.cache_readdir = true,
+	.keep_cache = true,
+};
+
+FIXTURE_SETUP(readdir_cache)
+{
+	char err[MAX_ERR_MSG];
+
+	pthread_mutex_lock(&test_state.lock);
+	test_state.readdir_counter = 0;
+	test_state.cache_readdir = variant->cache_readdir;
+	test_state.keep_cache = variant->keep_cache;
+	pthread_mutex_unlock(&test_state.lock);
+
+	if (fs_setup(&self->se, self->mountpoint, &fs_ops, &self->thread, err))
+		SKIP(return, err);
+}
+
+FIXTURE_TEARDOWN(readdir_cache)
+{
+	fs_teardown(self->se, self->thread, self->mountpoint);
+}
+
+TEST_F(readdir_cache, test_readdir_cache)
+{
+	struct dirent *dentry;
+	DIR *dir;
+	char pathname[PATH_MAX];
+	int total_counter, rewind_counter;
+	int dentrycount;
+
+	sprintf(pathname, "%s/%s", self->mountpoint, DIRNAME);
+
+	dir = opendir(pathname);
+	if (dir == NULL)
+		TH_LOG("opendir(): %s", strerror(errno));
+	ASSERT_NE(dir, NULL);
+
+	errno = 0;
+	dentrycount = 0;
+	while ((dentry = readdir(dir)))
+		dentrycount++;
+	ASSERT_EQ(errno, 0);
+	ASSERT_EQ(dentrycount, 3);
+
+	rewinddir(dir);
+	errno = 0;
+	dentrycount = 0;
+	while ((dentry = readdir(dir)))
+		dentrycount++;
+	ASSERT_EQ(errno, 0);
+	ASSERT_EQ(dentrycount, 3);
+
+	ASSERT_EQ(closedir(dir), 0);
+
+	pthread_mutex_lock(&test_state.lock);
+	rewind_counter = test_state.readdir_counter;
+	pthread_mutex_unlock(&test_state.lock);
+
+	dir = opendir(pathname);
+	if (dir == NULL)
+		TH_LOG("opendir(): %s", strerror(errno));
+	ASSERT_NE(dir, NULL);
+
+	errno = 0;
+	dentrycount = 0;
+	while ((dentry = readdir(dir)))
+		dentrycount++;
+	ASSERT_EQ(errno, 0);
+	ASSERT_EQ(dentrycount, 3);
+
+	ASSERT_EQ(closedir(dir), 0);
+
+	pthread_mutex_lock(&test_state.lock);
+	total_counter = test_state.readdir_counter;
+	pthread_mutex_unlock(&test_state.lock);
+
+	if (!variant->cache_readdir) {
+		ASSERT_EQ(rewind_counter, 2);
+		ASSERT_EQ(total_counter, 3);
+	} else if (!variant->keep_cache) {
+		ASSERT_EQ(rewind_counter, 1);
+		ASSERT_EQ(total_counter, 2);
+	} else {
+		ASSERT_EQ(rewind_counter, 1);
+		ASSERT_EQ(total_counter, 1);
+	}
+}
+
+TEST_HARNESS_MAIN

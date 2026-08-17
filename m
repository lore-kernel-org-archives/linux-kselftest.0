Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54958418A39;
	Mon, 17 Aug 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975905; cv=none; b=sbrbVXP6XDA9/Up9muZe7mgXG8XJsJs32UQiA7M2HP65H8YkhvOPFqwMPp1g6mQcOstVUsDrZnQKhvPN6Xl6cQ6JTOKIVL9KhmZ/jPHRZFog4cCLiJVhmGrlz8WAc9qwM1qln6b5LdVtk8zmLfDyeoMxc81SUrTR+8ivRH7oab4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975905; c=relaxed/simple;
	bh=EdkVfWWVIBsnI7+jEPrkxyrlpgsSVb4/vxyDf63d/38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AbWsyPMbiNHkxrzYUL+/t0DYowZSvyrbbylTvOdhhdlA8UxgnFOFcm9ePmcxpKxC550kuviO9U45ilyGaGhG0xYRH35G3ki3H4LlTF/FzOr2/KlT1yqlmSm4tZQZoSecGauiM/xniCu6xBIP7zL6kX8Hvod7EiAyagSAHb6oFkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=jteKXTfa; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="jteKXTfa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=WCMQDNc2nK8EKBHf0iDMqF+QAhCW7epGtgewEhDk/oM=; b=
	jteKXTfaMS/U8iUzOp0ZHNoqRbmSYKrHprXknao0vnk25uwg39TmFse5inbEIetMl/FpKS/wZwMga
	ZmoVoqR82q+t+mJW/Dl91rkRW9PQV2JGYgfw26lWYy02h3p8dlrt8lcJYIBNZHWXYG2gZAUab9N7J
	a4vFE3vDhUTkZr8nsdIpMb41lIxMnELkfctY/0YrI6yPo/8owOTCuta8qfBmouUOQ0Jx3lI8px4Mq
	1PX0+eCFyZZJJ44J3ESFr7lNWmkMUNLg4MTgIE5gh18Nl26D0TyZO+g2vQ82k5ayOb2m+sBaZXVkJ
	BMW3FayjSGJXloICW5rIbSEMbWWvGCPb9w==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wvy3r-004Xyy-IU; Mon, 17 Aug 2026 16:11:35 +0200
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
Subject: [RFC PATCH v2 8/8] selftests/fuse: add fuse readdir caching test
Date: Mon, 17 Aug 2026 15:11:56 +0100
Message-ID: <20260817141156.6079-9-luis@igalia.com>
In-Reply-To: <20260817141156.6079-1-luis@igalia.com>
References: <20260817141156.6079-1-luis@igalia.com>
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
 .../selftests/filesystems/fuse/Makefile       |   6 +-
 .../fuse/fuse_readdir_cache_test.c            | 314 ++++++++++++++++++
 3 files changed, 320 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c

diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/testing/selftests/filesystems/fuse/.gitignore
index d5061752e2b0..7c9fc24a0b61 100644
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@ -3,3 +3,4 @@ fuse_mnt
 fusectl_test
 fuse_symlink_cache_test
 fuse_acl_cache_test
+fuse_readdir_cache_test
diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/testing/selftests/filesystems/fuse/Makefile
index 4091b1cc939e..6edcd25169de 100644
--- a/tools/testing/selftests/filesystems/fuse/Makefile
+++ b/tools/testing/selftests/filesystems/fuse/Makefile
@@ -2,7 +2,8 @@
 
 CFLAGS += -Wall -O2 -g $(KHDR_INCLUDES)
 
-TEST_GEN_PROGS := fusectl_test fuse_acl_cache_test fuse_symlink_cache_test
+TEST_GEN_PROGS := fusectl_test fuse_acl_cache_test fuse_symlink_cache_test \
+	fuse_readdir_cache_test
 TEST_GEN_FILES := fuse_mnt
 
 include ../../lib.mk
@@ -25,3 +26,6 @@ $(OUTPUT)/fuse_acl_cache_test: LDLIBS += $(VAR_LDLIBS)
 
 $(OUTPUT)/fuse_symlink_cache_test: CFLAGS += $(VAR_CFLAGS)
 $(OUTPUT)/fuse_symlink_cache_test: LDLIBS += $(VAR_LDLIBS)
+
+$(OUTPUT)/fuse_readdir_cache_test: CFLAGS += $(VAR_CFLAGS)
+$(OUTPUT)/fuse_readdir_cache_test: LDLIBS += $(VAR_LDLIBS)
diff --git a/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c b/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
new file mode 100644
index 000000000000..181c08d9391a
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Simple filesystem to test FUSE readdir cache
+ *
+ * It will simply perform readdir operations on a directory checking how many
+ * times a request is sent to user-space using all the possible caching
+ * combination setting (FOPEN_KEEP_CACHE and FOPEN_CACHE_DIR flags).
+ */
+
+#define FUSE_USE_VERSION 31
+
+#include <stdio.h>
+#include <limits.h>
+#include <string.h>
+#include <pthread.h>
+#include <dirent.h>
+#include <fuse_lowlevel.h>
+
+#include "kselftest_harness.h"
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
+#define FS_MOUNTPOINT "/tmp/readdir_cache_test_XXXXXX"
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
+static void *run_daemon(void *arg)
+{
+	struct fuse_session *se = (struct fuse_session *)arg;
+
+	fuse_session_loop(se);
+
+	return NULL;
+}
+
+FIXTURE(readdir_cache)
+{
+	struct fuse_session *se;
+	char mountpoint[PATH_MAX];
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
+	char *fuse_argv[] = { "fuse_readdir_cache_test", NULL };
+	struct fuse_args args = FUSE_ARGS_INIT(1, fuse_argv);
+
+	pthread_mutex_lock(&test_state.lock);
+	test_state.readdir_counter = 0;
+	test_state.cache_readdir = variant->cache_readdir;
+	test_state.keep_cache = variant->keep_cache;
+	pthread_mutex_unlock(&test_state.lock);
+
+	strcpy(self->mountpoint, FS_MOUNTPOINT);
+	if (!mkdtemp(self->mountpoint))
+		SKIP(return, "mkdtemp: %s", strerror(errno));
+
+	self->se = fuse_session_new(&args, &fs_ops,
+				    sizeof(fs_ops), NULL);
+	if (!self->se) {
+		rmdir(self->mountpoint);
+		SKIP(return, "Failed to created FUSE session");
+	}
+	if (fuse_session_mount(self->se, self->mountpoint)) {
+		fuse_session_destroy(self->se);
+		rmdir(self->mountpoint);
+		SKIP(return, "Failed to mount FUSE session");
+	}
+	if (pthread_create(&self->thread, NULL, run_daemon, self->se)) {
+		fuse_session_unmount(self->se);
+		fuse_session_destroy(self->se);
+		rmdir(self->mountpoint);
+		SKIP(return, "pthread_create: %s", strerror(errno));
+	}
+
+	fuse_opt_free_args(&args);
+}
+
+FIXTURE_TEARDOWN(readdir_cache)
+{
+	fuse_session_exit(self->se);
+	fuse_session_unmount(self->se);
+	pthread_join(self->thread, NULL);
+	fuse_session_destroy(self->se);
+	rmdir(self->mountpoint);
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

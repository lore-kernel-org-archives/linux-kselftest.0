Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF9F46D552;
	Fri,  4 Sep 2026 10:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518339; cv=none; b=i0yDnwpfCfCIfoX23sZny5mT1bX2eA8nSmFHkknUgpvuaH8v9SNgDXQ2Z7dkC+UsfX24fND1N/SqxLKzAmGUIA8MbWka5mDdCP1qdzBsYVJzlnshUCavTlUwk1WErAjc30DiDibdVd09TWAkjp9yQ/tdKgcMjizlKJKGYZ/jU+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518339; c=relaxed/simple;
	bh=HVNKdp8QPBnhWmS003IJ4brEGD7nc6YWJDSBz5Z80LU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNQATFWpPdliKnlx1xrrpXI/DCYzH/rqiKRkoOHC1Ds8b37eYdq2P1BKVq3djDRiJTf63plj1372FMBXUdAP+MFLDQgyFnoPPdsUaU6Ve3XkYJy24cVZKBf5jTpGKoV3kfO46cgruPmFPt8gJ/RPeIoiq2LJ0VnCbYmI/USbdko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=faJXZTdc; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="faJXZTdc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=v8GJCPhpqC0YaeiDUyqTquvAFBuyMrVORsJ8zBdozZw=; b=
	faJXZTdc3s36z2IQGJUSQ7HI+OpG16cw7UnJVNhUi/FmqLPWTNL8UgQhxR06NBq1x6DZcw/RzTZKe
	5Mt4pVrah3khRhbjGGEdDqmdTh227+JneBS7G0HjBJwe6I86zrDv0QAl2DvHRvqAaV6Xkm21p2wIk
	nQOUyd1DGVLAzvQJbznFLjWVphBtK7TMAUIaVv2oS2ipWb0dU0sBg0IfQm5yWe6R8AN/EmO31Yc8+
	MS9IE9LWy3hu9eC9zK57e2UiOFVbvHKvxIf2vhSUrDWntQE0jE1r6slXopeNZ7nzvYLuNhnqSVceh
	7FeqLUvoc7Q7Q4Us8bcSBnO3cdzfyI74dA==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x2RJn-00Eq1I-Mt; Fri, 04 Sep 2026 12:38:47 +0200
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
Subject: [RFC PATCH v3 7/8] selftests/fuse: add fuse symlink caching test
Date: Fri,  4 Sep 2026 11:39:19 +0100
Message-ID: <20260904103920.4471-8-luis@igalia.com>
In-Reply-To: <20260904103920.4471-1-luis@igalia.com>
References: <20260904103920.4471-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds a simple test that allows to verify that, when resolving a
symlink, user-space is called only the first time when caching is enabled
or, if caching is disabled, every time the symlink resolution is requested.

Signed-off-by: Luis Henriques <luis@igalia.com>
---
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   2 +
 .../fuse/fuse_symlink_cache_test.c            | 167 ++++++++++++++++++
 3 files changed, 170 insertions(+)
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c

diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/testing/selftests/filesystems/fuse/.gitignore
index f7f3dd345a50..ebfe7133d811 100644
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@ -3,3 +3,4 @@ fuse_mnt
 fusectl_test
 write_extend_eof_test
 fuse_acl_cache_test
+fuse_symlink_cache_test
diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/testing/selftests/filesystems/fuse/Makefile
index 7744f796eb06..3a5a557dde7a 100644
--- a/tools/testing/selftests/filesystems/fuse/Makefile
+++ b/tools/testing/selftests/filesystems/fuse/Makefile
@@ -5,6 +5,7 @@ CFLAGS += -Wall -O2 -g $(KHDR_INCLUDES)
 TEST_GEN_PROGS := fusectl_test
 TEST_GEN_PROGS += write_extend_eof_test
 TEST_GEN_PROGS += fuse_acl_cache_test
+TEST_GEN_PROGS += fuse_symlink_cache_test
 TEST_GEN_FILES := fuse_mnt
 
 include ../../lib.mk
@@ -28,5 +29,6 @@ $(OUTPUT)/fuse_mnt: CFLAGS += $(VAR_CFLAGS)
 $(OUTPUT)/fuse_mnt: LDLIBS += $(VAR_LDLIBS)
 
 $(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
+$(OUTPUT)/fuse_symlink_cache_test: fuse_common.c fuse_symlink_cache_test.c
 
 EXTRA_CLEAN := fuse_common.o
diff --git a/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c b/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c
new file mode 100644
index 000000000000..ca3c5cdaf578
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Simple filesystem to test FUSE symlink cache
+ *
+ * This is a simple FUSE filesystem that contains two objects: a file named
+ * 'file' and a symlink to that file named 'link'.  If symlink caching is
+ * disabled (i.e. FUSE_CAP_CACHE_SYMLINKS is reset during FUSE_INIT), whenever
+ * the ->readlink() is executed to resolve 'link' a counter will be incremented.
+ *
+ * If symlink caching is enabled (i.e. FUSE_CAP_CACHE_SYMLINKS is set during
+ * FUSE_INIT), resolving a symlink will only call into user-space the first
+ * time.
+ */
+
+#define FUSE_USE_VERSION 31
+
+#include <stdio.h>
+#include <limits.h>
+#include <fuse_lowlevel.h>
+
+#include "kselftest_harness.h"
+
+#include "fuse_common.h"
+
+#define FILENAME "file"
+#define FILE_INO 42
+
+#define LINKNAME "link"
+#define LINK_INO 43
+
+#define TIMEOUT	86400.0f
+
+struct test_state {
+	pthread_mutex_t lock;
+	bool cache;
+	int readlink_counter;
+} test_state = {
+	.lock = PTHREAD_MUTEX_INITIALIZER,
+};
+
+static void fs_init(void *userdata, struct fuse_conn_info *conn)
+{
+	pthread_mutex_lock(&test_state.lock);
+	if (test_state.cache)
+		fuse_set_feature_flag(conn, FUSE_CAP_CACHE_SYMLINKS);
+	else
+		fuse_unset_feature_flag(conn, FUSE_CAP_CACHE_SYMLINKS);
+	pthread_mutex_unlock(&test_state.lock);
+}
+
+static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
+{
+	struct fuse_entry_param e = {};
+
+	if (parent != FUSE_ROOT_ID ||
+	    (!strcmp(name, FILENAME) && !(strcmp(name, LINKNAME))))
+		fuse_reply_err(req, ENOENT);
+	else {
+		if (!strcmp(name, FILENAME)) {
+			e.ino = FILE_INO;
+			e.attr.st_mode = S_IFREG | 0444;
+			e.attr.st_nlink = 2;
+		} else if (!strcmp(name, LINKNAME)) {
+			e.ino = LINK_INO;
+			e.attr.st_mode = S_IFLNK | 0444;
+			e.attr.st_nlink = 1;
+			e.attr.st_size = strlen(FILENAME);
+		} else {
+			e.ino = FUSE_ROOT_ID;
+			e.attr.st_mode = S_IFDIR | 0755;
+			e.attr.st_nlink = 2;
+		}
+		e.attr_timeout = TIMEOUT;
+		e.entry_timeout = TIMEOUT;
+		fuse_reply_entry(req, &e);
+	}
+}
+
+static void fs_readlink(fuse_req_t req, fuse_ino_t ino)
+{
+	char buf[PATH_MAX];
+	size_t sz = strlen(FILENAME);
+
+	if (ino != LINK_INO) {
+		fuse_reply_err(req, ENOENT);
+		return;
+	}
+
+	memcpy(buf, FILENAME, sz);
+	buf[sz] = '\0';
+	pthread_mutex_lock(&test_state.lock);
+	test_state.readlink_counter++;
+	pthread_mutex_unlock(&test_state.lock);
+
+	fuse_reply_readlink(req, buf);
+}
+
+static const struct fuse_lowlevel_ops fs_ops = {
+	.init           = fs_init,
+	.lookup		= fs_lookup,
+	.readlink	= fs_readlink,
+};
+
+FIXTURE(symlink_cache)
+{
+	struct fuse_session *se;
+	char mountpoint[MOUNTPOINT_SZ];
+	pthread_t thread;
+};
+FIXTURE_VARIANT(symlink_cache)
+{
+	const bool cache;
+};
+FIXTURE_VARIANT_ADD(symlink_cache, symlinks_nocache)
+{
+	/* Variant with symlink cache disabled */
+	.cache = false,
+};
+FIXTURE_VARIANT_ADD(symlink_cache, symlinks_cache)
+{
+	/* Variant with symlink cache enabled */
+	.cache = true,
+};
+
+FIXTURE_SETUP(symlink_cache)
+{
+	char err[MAX_ERR_MSG];
+
+	pthread_mutex_lock(&test_state.lock);
+	test_state.readlink_counter = 0;
+	test_state.cache = variant->cache;
+	pthread_mutex_unlock(&test_state.lock);
+
+	if (fs_setup(&self->se, self->mountpoint, &fs_ops, &self->thread, err))
+		SKIP(return, err);
+}
+
+FIXTURE_TEARDOWN(symlink_cache)
+{
+	fs_teardown(self->se, self->thread, self->mountpoint);
+}
+
+TEST_F(symlink_cache, test_symlink_cache)
+{
+	char pathname[PATH_MAX];
+	char buf[PATH_MAX];
+	ssize_t sz;
+	int counter;
+	int i;
+
+	sprintf(pathname, "%s/%s", self->mountpoint, LINKNAME);
+	for (i = 0; i < 100; i++) {
+		sz = readlink(pathname, buf, PATH_MAX);
+		ASSERT_NE(sz, -1);
+	}
+	pthread_mutex_lock(&test_state.lock);
+	counter = test_state.readlink_counter;
+	pthread_mutex_unlock(&test_state.lock);
+
+	if (variant->cache) {
+		ASSERT_EQ(counter, 1);
+	} else {
+		ASSERT_EQ(counter, 100);
+	}
+}
+
+TEST_HARNESS_MAIN

Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FFB3C945A;
	Thu,  1 Oct 2026 16:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873307; cv=none; b=EXpUvKn+3p0wI5nN/SkaFvpr3LRcGVVrug+Uf2IEgNFvZcQRMvV5VJf8GB0BcAVJWnGAqfRTJ1x0Lr1hnry1Tilks/qJnt/gdulwMfWjCGTNpJbCy9QU4OQW8XqLxmJwJe4uu17VfLEtEhXsHZcmg0ykMZoTpNT5am/9gBxgiwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873307; c=relaxed/simple;
	bh=Pbvzl3fegsu2puZ3g258aXSl1ZIFkS0wSrGpOrqhT88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VO8iuGarmZuyzV/pOic2cFMUg0fzKxT3UHwXkRTIavRYpSPbwcNxJpMm7WQuJzlR7jmzkYQ5alEaJRsoz0fWJ4x03mbiPfVFgy9XIbrPAlcspZ4g1sI+wZetK5XJKzOm2FKV0yV4MEwGooo5uxTghK8+0kHYy2Ar8nsJPLNaAzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=GN8cxSxH; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="GN8cxSxH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=WAuGsJhLhg9VRXF1Kt/sgeyukS8mFgIw573v21wmQtg=; b=
	GN8cxSxHM/924VZEy8v+V7wTl+0+RhSEhhNIfYQg1CntLpflr7eDb1A4ZeT76q/B26LbIavawVOco
	qzTTmw/VqQrv1PusmWZBvj/CjI0OrjUzXYjFraUgPxBuz7w9Ve0NsoYd40bHB5MURMWhGhu2a5+1a
	fmA6+sSOh4tAGHkQPN0HChXNahH1hd+g3uHm1leZFKTadws4c0Z9qkl8Bw1RmS5G4dgeYeLyyx0aG
	RTGwKT0QSM/hZeEQs+Qa0zGGkx2CyZ8NkIKNy4E0UujipRSd1pPRyBBmX1sxZpR0xtOFcGnirPsZK
	gjsTX/Ipr0Qe3vCeTG+jLEsQ4Lrc8i7j0Q==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xCJxC-00AD1H-KC; Thu, 01 Oct 2026 18:48:18 +0200
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
Subject: [RFC PATCH v5 7/8] selftests/fuse: add fuse symlink caching test
Date: Thu,  1 Oct 2026 17:49:15 +0100
Message-ID: <20261001164916.15311-8-luis@igalia.com>
In-Reply-To: <20261001164916.15311-1-luis@igalia.com>
References: <20261001164916.15311-1-luis@igalia.com>
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
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
---
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   2 +
 .../fuse/fuse_symlink_cache_test.c            | 162 ++++++++++++++++++
 3 files changed, 165 insertions(+)
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
index 000000000000..7b5373499573
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c
@@ -0,0 +1,162 @@
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
+	int readlink_counter;
+	bool cache;
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
+	    (strcmp(name, FILENAME) != 0 && strcmp(name, LINKNAME) != 0)) {
+		fuse_reply_err(req, ENOENT);
+		return;
+	}
+
+	if (!strcmp(name, FILENAME)) {
+		e.ino = FILE_INO;
+		e.attr.st_mode = S_IFREG | 0444;
+		e.attr.st_nlink = 2;
+	} else if (!strcmp(name, LINKNAME)) {
+		e.ino = LINK_INO;
+		e.attr.st_mode = S_IFLNK | 0444;
+		e.attr.st_nlink = 1;
+		e.attr.st_size = strlen(FILENAME);
+	}
+	e.attr_timeout = TIMEOUT;
+	e.entry_timeout = TIMEOUT;
+
+	fuse_reply_entry(req, &e);
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
+	struct fuse_common_ctx ctx;
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
+	if (fs_setup(&fs_ops, &self->ctx, err))
+		SKIP(return, err);
+}
+
+FIXTURE_TEARDOWN(symlink_cache)
+{
+	fs_teardown(&self->ctx);
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
+	sprintf(pathname, "%s/%s", self->ctx.mountpoint, LINKNAME);
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

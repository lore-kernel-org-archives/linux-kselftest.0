Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299463B6362;
	Wed, 16 Sep 2026 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574166; cv=none; b=NsKEFqyLqZCNx/IMkv31UFgg0vJsPzVXWZ8WWXWd0DXDIcSfJBrNwAVfFWBvfitQB+Qr1fVS8r99Ex9rPSnmgMXO7ea86GSmEVMQaRelE/W4ybZhC201Qf9fh+9+0/TnrEk3sU0vSDa6XsvpQltOtVHwtQuSnl7sZF3GLpDCf6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574166; c=relaxed/simple;
	bh=S3yiUGo74MZYLKfatQvdKRDjKX+AEGa8XuqANprEQrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hmlMYKDntLoSC7V6xVyYOVKr176o44P7JyillBGCVsoSW2P6Nq5e5EmgirCvagBr0ktUjVp16HGH9L8ji2jJ2w3LAN4u/Dlj/lmxnGXcxufsetAGiS0A+RVqODy9eiWkofu4J21omwFDCWqxofqf4M2BGSc1GXuMTGi/RVwGMB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=McVaEY3Y; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="McVaEY3Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=k6wyE5sVu4T19/0ruj9Rq3mkqvb6mznMUt0SJ5BVkDg=; b=
	McVaEY3YRX+dJMpx8sxfASmZoF6/EbggnmXKnIBaqi0BimY6/4sNWqjaQs+o5Lqd8DWKI1zb2iTk1
	m4SnN3ehIMycpl9ME33ExGL8b967AXVOH2cW+MjaKeWegMSvrsjmZkH4CN3A6p8AH4gaOfj0LV270
	XO8oWlW5pRQAwKVku1Jn5fLLX52cCRlTnEFx6cuI/ILARBczBD6Imt/RqkjnImaJZaOGCQ36VyvYc
	cwyWRHPVdRQJqCehq3JQhJmFWc39ItTtTMwNMPAbeb7F7d7KmjAkoXvX8RBpYYBCuhAzFi+Jvq9/7
	Q9x3dDnti1P5pVv9RW9jjRE9Hft2UCT+iQ==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6ryy-0031KC-U9; Wed, 16 Sep 2026 17:55:36 +0200
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
Subject: [RFC PATCH v4 7/8] selftests/fuse: add fuse symlink caching test
Date: Wed, 16 Sep 2026 16:56:28 +0100
Message-ID: <20260916155629.32421-8-luis@igalia.com>
In-Reply-To: <20260916155629.32421-1-luis@igalia.com>
References: <20260916155629.32421-1-luis@igalia.com>
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
 .../fuse/fuse_symlink_cache_test.c            | 163 ++++++++++++++++++
 3 files changed, 166 insertions(+)
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
index 000000000000..dd001736ebca
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c
@@ -0,0 +1,163 @@
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
+	struct fuse_common_ctx ctx;
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
+FIXTURE(symlink_cache) {};
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
+
+	if (fs_setup(&fs_ops, &test_state.ctx, err))
+		SKIP(goto out, err);
+out:
+	pthread_mutex_unlock(&test_state.lock);
+}
+
+FIXTURE_TEARDOWN(symlink_cache)
+{
+	pthread_mutex_lock(&test_state.lock);
+	fs_teardown(&test_state.ctx);
+	pthread_mutex_unlock(&test_state.lock);
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
+	sprintf(pathname, "%s/%s", test_state.ctx.mountpoint, LINKNAME);
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

Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A7643BDCD;
	Mon, 17 Aug 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975905; cv=none; b=izEsNpx84EvifjrDyAFhkHqPKmclK0qUW+5Xt1q7Jio0u+7MnNbpmp5pGhdVKWDZuyOl2sshhyNyJiD7kpejx8rNssQOrpQgsyR1eGtoZ0KVTDgj+MJRPWdUXee8KClSTxoiPVvkkmS12KYF/jIv4gwda6BVHpfU8LB+ElT72Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975905; c=relaxed/simple;
	bh=xNe3ocTe33Er3vieooNBkUBf0xS8WtLtVsylzb0nOzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKsRysgvHQFevBPWZSoZInrbxRHMP43f5dVteVvexKxZlZQ+b9Qu4EXZLuvWxD5Y0BH9ThCQA1p21JqFh8BLT3ZPKNptCo5lAwls/or9/NMSBbE6TcaKxv12JlIluIfwwsNLWPGSjmMNzvPCTHt5/5TQC30IOBxzqUWQa/ZEXx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hc79EFDX; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hc79EFDX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=vzt8+0kE+12ca/bfqPHftapgOIcUtreJoiZgTf5pCDc=; b=
	hc79EFDXA5xnUxwm8rFnN+4EHxUVFF1HcqVCiT0xYHvaFvGv4p5srWExsWo3M2h6eEOUkilxLlm4l
	AZpJB4wvGOdIBVfC23A94BsQMP/nc3FOcCYp5XGR5vxOo55Eh6UxMtl/evYCcyNwEY8QQVHiA+3oV
	bTTdOKK/pfPvQVEAwde3vSHJXf9neshsvi9iqVAc3mqmC4SpCtWUX1WGd+QdcHSngQptsi1R3wday
	bAB0GDXLqOMiFvh0xofPlWavMZwlxPDLsHFnmn/6plIlnZq0kK1qRcHR8yt04gy3j/74wVXAclpp1
	4SrTUy5H51IKcCJjdK5Pr/HpSLGBycgaDg==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wvy3p-004XyA-Gi; Mon, 17 Aug 2026 16:11:33 +0200
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
Subject: [RFC PATCH v2 4/8] selftests/fuse: add fuse symlink caching test
Date: Mon, 17 Aug 2026 15:11:52 +0100
Message-ID: <20260817141156.6079-5-luis@igalia.com>
In-Reply-To: <20260817141156.6079-1-luis@igalia.com>
References: <20260817141156.6079-1-luis@igalia.com>
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
 .../selftests/filesystems/fuse/Makefile       |   5 +-
 .../fuse/fuse_symlink_cache_test.c            | 204 ++++++++++++++++++
 3 files changed, 209 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c

diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/testing/selftests/filesystems/fuse/.gitignore
index 3e72e742d08e..873304f8d1a1 100644
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 fuse_mnt
 fusectl_test
+fuse_symlink_cache_test
diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/testing/selftests/filesystems/fuse/Makefile
index 54411bc349d2..4091b1cc939e 100644
--- a/tools/testing/selftests/filesystems/fuse/Makefile
+++ b/tools/testing/selftests/filesystems/fuse/Makefile
@@ -2,7 +2,7 @@
 
 CFLAGS += -Wall -O2 -g $(KHDR_INCLUDES)
 
-TEST_GEN_PROGS := fusectl_test fuse_acl_cache_test
+TEST_GEN_PROGS := fusectl_test fuse_acl_cache_test fuse_symlink_cache_test
 TEST_GEN_FILES := fuse_mnt
 
 include ../../lib.mk
@@ -22,3 +22,6 @@ $(OUTPUT)/fuse_mnt: LDLIBS += $(VAR_LDLIBS)
 
 $(OUTPUT)/fuse_acl_cache_test: CFLAGS += $(VAR_CFLAGS)
 $(OUTPUT)/fuse_acl_cache_test: LDLIBS += $(VAR_LDLIBS)
+
+$(OUTPUT)/fuse_symlink_cache_test: CFLAGS += $(VAR_CFLAGS)
+$(OUTPUT)/fuse_symlink_cache_test: LDLIBS += $(VAR_LDLIBS)
diff --git a/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c b/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c
new file mode 100644
index 000000000000..c922db832c68
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c
@@ -0,0 +1,204 @@
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
+#include <string.h>
+#include <pthread.h>
+#include <fuse_lowlevel.h>
+
+#include "kselftest_harness.h"
+
+#define FILENAME "file"
+#define FILE_INO 42
+
+#define LINKNAME "link"
+#define LINK_INO 43
+
+#define TIMEOUT	86400.0f
+
+#define SYMLINK_MOUNTPOINT "/tmp/symlink_cache_test_XXXXXX"
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
+static const struct fuse_lowlevel_ops symlink_ops = {
+	.init           = fs_init,
+	.lookup		= fs_lookup,
+	.readlink	= fs_readlink,
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
+FIXTURE(symlink_cache)
+{
+	struct fuse_session *se;
+	char mountpoint[PATH_MAX];
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
+	char *fuse_argv[] = { "fuse_symlink_cache_test", NULL };
+	struct fuse_args args = FUSE_ARGS_INIT(1, fuse_argv);
+
+	pthread_mutex_lock(&test_state.lock);
+	test_state.readlink_counter = 0;
+	test_state.cache = variant->cache;
+	pthread_mutex_unlock(&test_state.lock);
+
+	strcpy(self->mountpoint, SYMLINK_MOUNTPOINT);
+	if (!mkdtemp(self->mountpoint))
+		SKIP(return, "mkdtemp: %s", strerror(errno));
+
+	self->se = fuse_session_new(&args, &symlink_ops,
+				    sizeof(symlink_ops), NULL);
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
+FIXTURE_TEARDOWN(symlink_cache)
+{
+	fuse_session_exit(self->se);
+	fuse_session_unmount(self->se);
+	pthread_join(self->thread, NULL);
+	fuse_session_destroy(self->se);
+	rmdir(self->mountpoint);
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

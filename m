Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537F6281369;
	Wed,  8 Jul 2026 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516270; cv=none; b=iwPyHG+MvK2NYsCFTfBBLNahTwFIP1pIsamXr6dpP+CTv7JsoYW5kwMruVOKT/BYUjfgkVLFQCrfzWRfyM2L1SYSHDQnBQRfSdgX25k1G5UllH2o6Mo67233UHJdv1yEDynxc9hvgBRcvVjDSLSwr+1E6mBjAG04pZQAA11uB+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516270; c=relaxed/simple;
	bh=HvLWy75FIp7v543w2L6+8xkZO54pCq9kgjuYFQFS5b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JskwEH8cRL3L6AmwIFDDpbIfPkINXwg5MFM6XqgvhmyoLhVJy9yN0croWBuiovGc0B9GN3Esc/g33dx+6V23wgW+XrZKBE5AW/IvaBXblq3V/rweKcKoJhgsWKlyt3uiuwEZAuim/nOCRsiqHohheBcLoYGnM8+Ckwc8L2hi7pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=rvkKNkyY; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="rvkKNkyY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nHM/jv+LLnXkVU3lel8IjMIoiyB/Y9tT25vuIx0ywFM=; b=rvkKNkyYl7qcW9BM0h4Wp3oP7V
	LtUzILrUwjWnZx49HPzaM3j4RgnUbkwUuMnA/qcIKWOslFxToYfE8AaVUN5w2QeTnuzhJa3hUquGk
	8QWb7lsjXDEof02Cmz7TgU0hu8KwyHh2zr9GoYbeU9c9q3UEj1AkdmX3PAMPcdY9WdO5g0KNc2XZw
	zhYd6Ar6zX3kLHF7XQ+Ij1LBQaodVCdmU3nPfa2TnGblPLUIfF9NsSWTp/YUmHKDVN34tDGiW/Kzm
	UXeZoZ+uYi2f6PLbuZV6X5CSKjm/+r5QgN2DDOQEulHQMQfIlpzwxtgLX60VAWqNvDRL38NqpJdNf
	IJmItL6Q==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1whS3L-00BiUB-BZ; Wed, 08 Jul 2026 15:11:03 +0200
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matt Harvey <mharvey@jumptrading.com>,
	kernel-dev@igalia.com,
	Luis Henriques <luis@igalia.com>
Subject: [RFC PATCH v1 4/5] selftests/filesystems: add fuse symlink caching test
Date: Wed,  8 Jul 2026 14:11:21 +0100
Message-ID: <20260708131122.2917-5-luis@igalia.com>
In-Reply-To: <20260708131122.2917-1-luis@igalia.com>
References: <20260708131122.2917-1-luis@igalia.com>
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
 .../selftests/filesystems/fuse/Makefile       |   6 +-
 .../selftests/filesystems/fuse/symlink_fs.c   | 115 ++++++++++++++++++
 .../filesystems/fuse/symlink_test.sh          |  52 ++++++++
 4 files changed, 173 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/symlink_fs.c
 create mode 100755 tools/testing/selftests/filesystems/fuse/symlink_test.sh

diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/testing/selftests/filesystems/fuse/.gitignore
index 3e72e742d08e..cfdc5ca3ded4 100644
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 fuse_mnt
 fusectl_test
+symlink_fs
diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/testing/selftests/filesystems/fuse/Makefile
index 422cd1b1688d..342da0878006 100644
--- a/tools/testing/selftests/filesystems/fuse/Makefile
+++ b/tools/testing/selftests/filesystems/fuse/Makefile
@@ -3,7 +3,8 @@
 CFLAGS += -Wall -O2 -g $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS := fusectl_test
-TEST_GEN_FILES := fuse_mnt
+TEST_PROGS := symlink_test.sh
+TEST_GEN_FILES := fuse_mnt symlink_fs
 
 include ../../lib.mk
 
@@ -19,3 +20,6 @@ endif
 
 $(OUTPUT)/fuse_mnt: CFLAGS += $(VAR_CFLAGS)
 $(OUTPUT)/fuse_mnt: LDLIBS += $(VAR_LDLIBS)
+
+$(OUTPUT)/symlink_fs: CFLAGS += $(VAR_CFLAGS)
+$(OUTPUT)/symlink_fs: LDLIBS += $(VAR_LDLIBS)
diff --git a/tools/testing/selftests/filesystems/fuse/symlink_fs.c b/tools/testing/selftests/filesystems/fuse/symlink_fs.c
new file mode 100644
index 000000000000..1aee26c91b3f
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/symlink_fs.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Simple filesystem to test FUSE symlink cache
+ *
+ * This is a simple FUSE filesystem that contains two objects: a file named
+ * 'file' and a symlink to that file named 'link'.  Whenever the ->readlink() is
+ * executed to resolve 'link' a counter will be incremented.  A ->read() to any
+ * filesystem object will return the value in this counter.
+ *
+ * A '--cache' argument will allow to enable symlink caching (disabled by
+ * default).  This means that, if caching is enabled, resolving a symlink will
+ * only call into user-space the first time.
+ */
+
+#define FUSE_USE_VERSION 31
+
+#include <fuse.h>
+#include <stdio.h>
+#include <string.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <stddef.h>
+#include <assert.h>
+
+#define FILE	"file"
+#define LINK	"link"
+
+static struct options {
+	int cache_symlinks;
+} options;
+
+static const struct fuse_opt option_spec[] = {
+	{ "--cache", offsetof(struct options, cache_symlinks), 1 },
+	FUSE_OPT_END
+};
+
+static int readlink_counter = 0;
+
+static void *symlink_init(struct fuse_conn_info *conn, struct fuse_config *cfg)
+{
+	if (options.cache_symlinks)
+		fuse_set_feature_flag(conn, FUSE_CAP_CACHE_SYMLINKS);
+
+	return NULL;
+}
+
+static int symlink_getattr(const char *path, struct stat *stbuf,
+			   struct fuse_file_info *fi)
+{
+	int res = 0;
+
+	memset(stbuf, 0, sizeof(struct stat));
+	if (strcmp(path, "/") == 0) {
+		stbuf->st_mode = S_IFDIR | 0755;
+		stbuf->st_nlink = 2;
+	} else if (strcmp(path + 1, FILE) == 0) {
+		char data[64];
+
+		stbuf->st_mode = S_IFREG | 0444;
+		stbuf->st_nlink = 1;
+		stbuf->st_size = sprintf(data, "%d\n", readlink_counter);
+	} else if (strcmp(path + 1, LINK) == 0) {
+		stbuf->st_mode = S_IFLNK | 0444;
+		stbuf->st_nlink = 1;
+		stbuf->st_size = strlen(FILE);
+	} else
+		res = -ENOENT;
+
+	return res;
+}
+
+static int symlink_readlink(const char *path, char *buf, size_t size)
+{
+	if (strcmp(path + 1, LINK) != 0)
+		return -ENOENT;
+
+	memcpy(buf, FILE, strlen(FILE));
+	readlink_counter++;
+
+	return 0;
+}
+
+static int symlink_read(const char *path, char *buf, size_t sz, off_t off,
+			struct fuse_file_info *fi)
+{
+	char data[64];
+	int len;
+
+	len = sprintf(data, "%d\n", readlink_counter);
+	memcpy(buf, data, len);
+
+	return len;
+}
+
+static const struct fuse_operations symlink_oper = {
+	.init           = symlink_init,
+	.getattr	= symlink_getattr,
+	.readlink	= symlink_readlink,
+	.read		= symlink_read,
+};
+
+int main(int argc, char *argv[])
+{
+	int ret;
+	struct fuse_args args = FUSE_ARGS_INIT(argc, argv);
+
+	options.cache_symlinks = 0;
+	if (fuse_opt_parse(&args, &options, option_spec, NULL) == -1)
+		return 1;
+
+	ret = fuse_main(args.argc, args.argv, &symlink_oper, NULL);
+	fuse_opt_free_args(&args);
+
+	return ret;
+}
diff --git a/tools/testing/selftests/filesystems/fuse/symlink_test.sh b/tools/testing/selftests/filesystems/fuse/symlink_test.sh
new file mode 100755
index 000000000000..546541c1920e
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/symlink_test.sh
@@ -0,0 +1,52 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+exit_cleanup()
+{
+	fusermount -u ./mnt
+	rmdir ./mnt
+}
+
+assert_value ()
+{
+	if [ $1 -ne $2 ]; then
+		echo "FAILED"
+		echo $3
+		exit 1
+	fi
+}
+
+set -e
+
+trap exit_cleanup EXIT
+
+mkdir -p mnt
+
+./symlink_fs ./mnt
+
+echo -n "Testing symlink without cached: "
+
+# When symlink caching is disabled every access to a symlink is expected to
+# result in a call to user-space
+for i in $(seq 1 10); do
+	readlink ./mnt/link > /dev/null
+done
+
+res=$(cat ./mnt/file)
+assert_value $res $i "Got $res, expected $i"
+echo "PASSED"
+
+fusermount -u ./mnt
+
+./symlink_fs --cache ./mnt
+
+echo -n "Testing symlink with cache: "
+
+# With caching enabled, there will only be a single call into user-space
+for i in $(seq 0 10); do
+	readlink ./mnt/link > /dev/null
+done
+
+res=$(cat ./mnt/file)
+assert_value 1 $res "Got $ res, expected 1"
+echo "PASSED"

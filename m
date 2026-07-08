Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A46F274B3C;
	Wed,  8 Jul 2026 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516270; cv=none; b=qySZLc+ZGcZOBovpJDkoeoCwZ02bGo3YhhFGmBuuCSGBFUMaOrvN4/9MuPL+k8fBgt4tgVDttwTK67kL74yUKWpEpy8TXcVDQjH6FxiVQlQSnY0OFUyrwzmhFZ2HClxYrLhObMyeKoe/3IoGaBnnugP9VlfIdEJgaJHkhSLIdZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516270; c=relaxed/simple;
	bh=ZMUyjLAUmLzhST28f/dCYbqU/rukUVVEL0SliRH4Yh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7JI34zHnPXPjSkr24nuUDrEqcFY7R7/rXDmk5t7oOmRyJxT2m7xAKAPCUj2guMcLLf9/G6qclySy+2pEM7ndbs8iUfoq3lDsrlreBdPGb0pm8pYlS9u19jKIl8bGqzjycykTUgEordOK2vAikSVPrIF3HT/K++45XS4tO02Xqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ATEZ8fC2; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ATEZ8fC2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IU6VyyEMKqW7FQYx5w5EtAKP5xrjjXJbEWmPRyazH20=; b=ATEZ8fC2imd9GKmxaJZeV6Ib/Q
	zUOWY0Irm6yLG5h4r5ZRWtYAl9AJnTgdb3FuwfF9wANL1XhN1X689EUK3v0uopXYVhhbofnLzzPoB
	t83EYXJ0W8cshI6cn4oHV209XkShcGYYrlh1QtRW6ZBJOoHxTqERJ1MZ6OuCDyJHOoQoBXrVOngRV
	3rOIncSzK4iAFLtgOET0XLk65UtmAEz3UtZPJ3FaxiuJsbOwc81bxo5FFZo+BRwAm9Oev3O2yr/En
	FXx06rUDuX8bFg6fBrSM3l4Q0v/9cqbubYPHZPLJG7j7I9QyincWd93cWXZ/i1VawQ7Wgb/DD+5nR
	T1FU1FrQ==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1whS3L-00BiUF-QR; Wed, 08 Jul 2026 15:11:03 +0200
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
Subject: [RFC PATCH v1 5/5] selftests/filesystems: add fuse ACLs caching test
Date: Wed,  8 Jul 2026 14:11:22 +0100
Message-ID: <20260708131122.2917-6-luis@igalia.com>
In-Reply-To: <20260708131122.2917-1-luis@igalia.com>
References: <20260708131122.2917-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds a simple test that allows to verify that ACLs caching is
working as expected.  I.e. it verifies that, if FUSE_POSIX_ACL flag is set,
user-space is only called once when accessing an inode ACL and that
subsequent accesses are cached in the kernel.

Signed-off-by: Luis Henriques <luis@igalia.com>
---
 .../selftests/filesystems/fuse/.gitignore     |   2 +
 .../selftests/filesystems/fuse/Makefile       |  13 +-
 .../selftests/filesystems/fuse/acl_fs.c       | 216 ++++++++++++++++++
 .../selftests/filesystems/fuse/acl_test.sh    |  66 ++++++
 .../selftests/filesystems/fuse/setgetacl.c    |  62 +++++
 5 files changed, 357 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/acl_fs.c
 create mode 100755 tools/testing/selftests/filesystems/fuse/acl_test.sh
 create mode 100644 tools/testing/selftests/filesystems/fuse/setgetacl.c

diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/testing/selftests/filesystems/fuse/.gitignore
index cfdc5ca3ded4..1733ebb9d7fd 100644
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@ -2,3 +2,5 @@
 fuse_mnt
 fusectl_test
 symlink_fs
+acl_fs
+setgetacl
diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/testing/selftests/filesystems/fuse/Makefile
index 342da0878006..3bbf9d837e9a 100644
--- a/tools/testing/selftests/filesystems/fuse/Makefile
+++ b/tools/testing/selftests/filesystems/fuse/Makefile
@@ -3,8 +3,8 @@
 CFLAGS += -Wall -O2 -g $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS := fusectl_test
-TEST_PROGS := symlink_test.sh
-TEST_GEN_FILES := fuse_mnt symlink_fs
+TEST_PROGS := symlink_test.sh acl_test.sh
+TEST_GEN_FILES := fuse_mnt symlink_fs acl_fs setgetacl
 
 include ../../lib.mk
 
@@ -18,8 +18,17 @@ ifeq ($(VAR_LDLIBS),)
 VAR_LDLIBS := -lfuse3 -pthread
 endif
 
+ACL_CFLAGS := $(shell pkg-config libacl --cflags 2>/dev/null)
+ACL_LDLIBS := $(shell pkg-config libacl --libs 2>/dev/null)
+
 $(OUTPUT)/fuse_mnt: CFLAGS += $(VAR_CFLAGS)
 $(OUTPUT)/fuse_mnt: LDLIBS += $(VAR_LDLIBS)
 
 $(OUTPUT)/symlink_fs: CFLAGS += $(VAR_CFLAGS)
 $(OUTPUT)/symlink_fs: LDLIBS += $(VAR_LDLIBS)
+
+$(OUTPUT)/acl_fs: CFLAGS += $(VAR_CFLAGS)
+$(OUTPUT)/acl_fs: LDLIBS += $(VAR_LDLIBS)
+
+$(OUTPUT)/setgetacl: CFLAGS += $(ACL_CFLAGS)
+$(OUTPUT)/setgetacl: LDLIBS += $(ACL_LDLIBS)
diff --git a/tools/testing/selftests/filesystems/fuse/acl_fs.c b/tools/testing/selftests/filesystems/fuse/acl_fs.c
new file mode 100644
index 000000000000..4b5e0073ab4f
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/acl_fs.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Simple filesystem to test FUSE ACLs cache
+ *
+ * This is a simple FUSE filesystem that contains a single object (a file named
+ * 'file') and which allows to set the 'system.posix_acl_access' ACL on that
+ * object.  Whenever this ACL is read from the FUSE filesystem, a counter is
+ * incremented.  And value for this counter can be obtained from reading from
+ * this file.
+ *
+ * When ACLs are being cached (the '--cache' argument was used to mount this
+ * filesystem), this counter will only be incremented the first time the ACL is
+ * read, as the kernel won't be calling into user-space again until that cache
+ * is invalidated.
+ */
+#define FUSE_USE_VERSION FUSE_MAKE_VERSION(3, 12)
+
+#include <fuse_lowlevel.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <time.h>
+#include <sys/stat.h>
+#include <sys/param.h>
+#include <sys/xattr.h>
+
+#define FILE	"file"
+#define TIMEOUT	86400.0f
+
+static struct options {
+	int cache_acls;
+} options;
+
+static const struct fuse_opt option_spec[] = {
+	{ "--cache", offsetof(struct options, cache_acls), 1 },
+	FUSE_OPT_END
+};
+
+static int getxattr_counter = 0;
+
+static void acl_init(void *userdata, struct fuse_conn_info *conn)
+{
+	if (options.cache_acls)
+		fuse_set_feature_flag(conn, FUSE_CAP_POSIX_ACL);
+	else
+		fuse_unset_feature_flag(conn, FUSE_CAP_POSIX_ACL);
+}
+
+static int acl_stat(fuse_ino_t ino, struct stat *stbuf)
+{
+	char data[64];
+
+	stbuf->st_ino = ino;
+	switch (ino) {
+	case 1:
+		stbuf->st_mode = S_IFDIR | 0755;
+		stbuf->st_nlink = 2;
+		break;
+	case 42:
+		stbuf->st_mode = S_IFREG | 0444;
+		stbuf->st_nlink = 1;
+		stbuf->st_size = sprintf(data, "%d\n", getxattr_counter);
+		break;
+	default:
+		return -1;
+	}
+
+	stbuf->st_uid = getuid();
+	stbuf->st_gid = getgid();
+	stbuf->st_atime = stbuf->st_mtime = stbuf->st_ctime = time(NULL);
+
+	return 0;
+}
+
+static void acl_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
+{
+	struct fuse_entry_param e;
+
+	memset(&e, 0, sizeof(e));
+
+	if (parent != 1 || strcmp(name, FILE) != 0)
+		fuse_reply_err(req, ENOENT);
+	else {
+		e.ino = 42;
+		e.attr_timeout = TIMEOUT;
+		e.entry_timeout = TIMEOUT;
+		acl_stat(e.ino, &e.attr);
+		fuse_reply_entry(req, &e);
+	}
+}
+
+static void acl_getattr(fuse_req_t req, fuse_ino_t ino,
+			struct fuse_file_info *fi)
+{
+	struct stat attr;
+
+	memset(&attr, 0, sizeof(struct stat));
+	if (acl_stat(ino, &attr) == -1)
+		fuse_reply_err(req, ENOENT);
+	else
+		fuse_reply_attr(req, &attr, TIMEOUT);
+}
+
+static void acl_read(fuse_req_t req, fuse_ino_t ino, size_t size,
+		     off_t off, struct fuse_file_info *fi)
+{
+	char data[64];
+	int len;
+
+	len = sprintf(data, "%d\n", getxattr_counter);
+	if (off < len)
+		fuse_reply_buf(req, data + off, MIN(len - off, size));
+	else
+		fuse_reply_buf(req, NULL, 0);
+}
+
+char *xattr_value = NULL;
+size_t xattr_value_sz = 0;
+
+static void acl_setxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
+			 const char *value, size_t size, int flags)
+{
+	int ret = 0;
+
+	if (ino != 42)
+		ret = ENOENT;
+	else if (!strcmp(name, "system.posix_acl_access")) {
+		if (xattr_value)
+			free(xattr_value);
+		xattr_value = malloc(size);
+		memcpy(xattr_value, value, size);
+		xattr_value_sz = size;
+	} else
+		ret = ENOTSUP;
+
+	fuse_reply_err(req, ret);
+}
+
+static void acl_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
+			 size_t size)
+{
+	if (ino != 42)
+		fuse_reply_err(req, ENOENT);
+	else if (!xattr_value || strcmp(name, "system.posix_acl_access"))
+		fuse_reply_err(req, ENODATA);
+	else if (size) {
+		fuse_reply_buf(req, xattr_value, xattr_value_sz);
+		getxattr_counter++;
+	} else
+		fuse_reply_xattr(req, xattr_value_sz);
+}
+
+static const struct fuse_lowlevel_ops acl_op = {
+	.init           = acl_init,
+	.lookup		= acl_lookup,
+	.getattr	= acl_getattr,
+	.getxattr	= acl_getxattr,
+	.setxattr	= acl_setxattr,
+	.read		= acl_read,
+};
+
+int main(int argc, char *argv[])
+{
+	struct fuse_session *se;
+	struct fuse_loop_config *config;
+	struct fuse_args args = FUSE_ARGS_INIT(argc, argv);
+	struct fuse_cmdline_opts opts;
+	int ret = -1;
+
+	options.cache_acls = 0;
+
+	if (fuse_parse_cmdline(&args, &opts) != 0)
+		return ret;
+
+	if (opts.mountpoint == NULL) {
+		printf("usage: %s [options] <mountpoint>\n", argv[0]);
+		goto out_args;
+	}
+
+	if (fuse_opt_parse(&args, &options, option_spec, NULL) == -1)
+		goto out_args;
+
+	se = fuse_session_new(&args, &acl_op, sizeof(acl_op), NULL);
+	if (!se)
+		goto out_args;
+	if (fuse_set_signal_handlers(se))
+		goto out_session;
+	if (fuse_session_mount(se, opts.mountpoint))
+		goto out_signal;
+
+	fuse_daemonize(opts.foreground);
+	if (opts.singlethread) {
+		ret = fuse_session_loop(se);
+	} else {
+		config = fuse_loop_cfg_create();
+		fuse_loop_cfg_set_clone_fd(config, opts.clone_fd);
+		fuse_loop_cfg_set_max_threads(config, opts.max_threads);
+		ret = fuse_session_loop_mt(se, config);
+		fuse_loop_cfg_destroy(config);
+		config = NULL;
+	}
+	fuse_session_unmount(se);
+
+out_signal:
+	fuse_remove_signal_handlers(se);
+out_session:
+	fuse_session_destroy(se);
+out_args:
+	free(opts.mountpoint);
+	fuse_opt_free_args(&args);
+
+	return ret;
+}
diff --git a/tools/testing/selftests/filesystems/fuse/acl_test.sh b/tools/testing/selftests/filesystems/fuse/acl_test.sh
new file mode 100755
index 000000000000..9070c51c6784
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/acl_test.sh
@@ -0,0 +1,66 @@
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
+#sudo su -
+#cd /home/miguel/kernel/linux/tools/testing/selftests/filesystems/fuse
+#dmesg -c > /dev/null
+#tmux -S ./bla -f a
+#./acl_fs -d --cache ./mnt
+#setfacl -m u:daemon:r mnt/file
+#getfacl mnt/file
+
+./acl_fs ./mnt
+
+echo -n "Testing ACLs without cache: "
+
+# set ACL
+./setgetacl ACCESS u::rw-,g::rw-,o::rw-,u:nobody:r--,m::rw- mnt/file
+
+# When symlink caching is disabled every access to a symlink is expected to
+# result in a call to user-space
+for i in $(seq 1 10); do
+	./setgetacl ACCESS mnt/file > /dev/null
+done
+
+res=$(cat ./mnt/file)
+assert_value $res $i "Got $res, expected $i"
+echo "PASSED"
+
+fusermount -u ./mnt
+
+./acl_fs --cache ./mnt
+
+echo -n "Testing ACLs with cache: "
+
+# set ACL
+./setgetacl ACCESS u::rw-,g::rw-,o::rw-,u:nobody:r--,m::rw- mnt/file
+
+# With caching enabled, there will be a single call into user-space
+for i in $(seq 1 10); do
+	./setgetacl ACCESS mnt/file > /dev/null
+done
+res=$(cat ./mnt/file)
+assert_value $res 1 "Got $res, expected 1"
+
+echo "PASSED"
diff --git a/tools/testing/selftests/filesystems/fuse/setgetacl.c b/tools/testing/selftests/filesystems/fuse/setgetacl.c
new file mode 100644
index 000000000000..035e7daa1c5d
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/setgetacl.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Simple ACL set/get wrapper */
+
+#include <stdio.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/types.h>
+#include <sys/acl.h>
+
+int main(int argc, char *argv[])
+{
+	acl_t acl;
+	acl_type_t type;
+	char *buf;
+
+	if ((argc != 3) && (argc != 4)) {
+		fprintf(stderr, "Usage: %s <acl type> [<value>] <file>\n",
+			argv[0]);
+		fprintf(stderr, "where <acl type> is ACCESS or DEFAULT\n");
+		return 1;
+	}
+
+	if (!strcmp(argv[1], "ACCESS"))
+		type = ACL_TYPE_ACCESS;
+	else if (!strcmp(argv[1], "DEFAULT"))
+		type = ACL_TYPE_DEFAULT;
+	else {
+		fprintf(stderr, "Invalid ACL type\n");
+		return 1;
+	}
+
+	if (argc == 3) {
+		/* Get ACL */
+		acl = acl_get_file(argv[2], type);
+		if (acl == NULL) {
+			perror("acl_get_file");
+			return 1;
+		}
+		buf = acl_to_text(acl, NULL);
+		if (buf == NULL)
+			perror("acl_from_text");
+		else {
+			fprintf(stdout, "%s\n", buf);
+			acl_free(buf);
+		}
+	} else {
+		/* Set ACL */
+		acl = acl_from_text(argv[2]);
+		if (acl == NULL) {
+			perror("acl_from_text");
+			return 1;
+		}
+		if (acl_set_file(argv[3], type, acl) != 0)
+			perror("acl_set_file");
+	}
+
+	acl_free(acl);
+
+	return 0;
+}

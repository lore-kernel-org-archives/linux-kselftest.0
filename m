Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B59331EB6;
	Tue, 11 Aug 2026 06:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786429993; cv=none; b=LdCxvA/oeHWxwts1Uq9KxB/z/gTPLai1gFUklTmpzlwyCQ24F/wcnnef+pdXFVZqJl3X/J7J/cTTcmIiZqKAMuTGJ0O7zrvbaXeDLQoPNPeCoq5O1K29lFmzDqzs9aoxt1BhMx4o+eSQIPezA/xwPzWAahc6ecGA2rU1tZ2rlr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786429993; c=relaxed/simple;
	bh=SjyE6VhXV0/BlQm5WZrrxOQtHb+Ykr7ATKnpCoxbQLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r6JzaGH3BFN/ERhGNgBd4S/k93vfO5PwgSomrpSWjnc1sOArzaRKwmYMrgTDhwivRWZvnrKh5j40I/s1GG0qPQIKgYnzNa7xqK5IhEQDULcTrmyPlZL0XiCv4aspXw75ozALlLcDHgPhk2mf3tqN+qrTiJjIPw9cXYXH5mTOnSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=m9MTFYQf; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="m9MTFYQf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=wc
	SDGjdHEjlf6qp0a3RkN+YWXjCnPzLaJAb0wsHH0xg=; b=m9MTFYQfYLFA+jWRNu
	YfbImfA0mL3k3eNKM7u9I6uIS812mH+U+M/FT5vAiOi8yVI4ONUeBTIW/qyHb49X
	dUtpIjNwFDtez4XkD0xkyZYcaHfGVmXiEUu8Obe65aM8ZiOkxNLVajjh+fT/G1Ec
	r+w9hDtu34CMhlQSH/CK5fUSU=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgD3_ykOwnpqXx7FLg--.29704S2;
	Tue, 11 Aug 2026 14:32:48 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: shuah@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	liubaolin12138@163.com,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH] selftests/filesystems: add fileattr ioctl tests
Date: Tue, 11 Aug 2026 14:32:40 +0800
Message-ID: <20260811063240.2815042-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgD3_ykOwnpqXx7FLg--.29704S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKw18KrWDGw1rXr4rXr4ktFb_yoW3CF1fpa
	95Ga1DKr48tF4xGa4xGF4UAa17Jr1DAFWUXryrWF1UAF17JFn7JFWIkFy8JF1fX397u398
	CasxtFWa9rW3JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE_-B9UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwRDtuGp6whDlagAA3J

From: Baolin Liu <liubaolin@kylinos.cn>

Add a selftest for the legacy fileattr ioctls
(FS_IOC_FSGETXATTR/FS_IOC_FSSETXATTR).

Cover FS_IOC_FSGETXATTR on regular files, directories,
and FIFOs, and verify FS_XFLAG_NODUMP and FS_XFLAG_NOATIME
round-trips on regular files.

Allow the test to run in a caller-specified writable base
directory via FILEATTR_TEST_DIR.
If unset, fall back to P_tmpdir.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 tools/testing/selftests/Makefile              |   1 +
 .../selftests/filesystems/fileattr/.gitignore |   2 +
 .../selftests/filesystems/fileattr/Makefile   |   6 +
 .../filesystems/fileattr/fileattr_test.c      | 256 ++++++++++++++++++
 4 files changed, 265 insertions(+)
 create mode 100644 tools/testing/selftests/filesystems/fileattr/.gitignore
 create mode 100644 tools/testing/selftests/filesystems/fileattr/Makefile
 create mode 100644 tools/testing/selftests/filesystems/fileattr/fileattr_test.c

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 450f13ba4cca..459251b08648 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -34,6 +34,7 @@ TARGETS += filesystems
 TARGETS += filesystems/binderfs
 TARGETS += filesystems/epoll
 TARGETS += filesystems/fat
+TARGETS += filesystems/fileattr
 TARGETS += filesystems/overlayfs
 TARGETS += filesystems/statmount
 TARGETS += filesystems/mount-notify
diff --git a/tools/testing/selftests/filesystems/fileattr/.gitignore b/tools/testing/selftests/filesystems/fileattr/.gitignore
new file mode 100644
index 000000000000..2eaf3e266eb6
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fileattr/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+fileattr_test
diff --git a/tools/testing/selftests/filesystems/fileattr/Makefile b/tools/testing/selftests/filesystems/fileattr/Makefile
new file mode 100644
index 000000000000..2295e7c9bdb5
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fileattr/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+CFLAGS += -O2 -g -Wall $(KHDR_INCLUDES)
+TEST_GEN_PROGS := fileattr_test
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/filesystems/fileattr/fileattr_test.c b/tools/testing/selftests/filesystems/fileattr/fileattr_test.c
new file mode 100644
index 000000000000..cd6a6681d2f7
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fileattr/fileattr_test.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <linux/fs.h>
+#include <linux/limits.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include "kselftest_harness.h"
+
+FIXTURE(fileattr) {
+	char workdir[PATH_MAX];
+};
+
+static int open_nofollow(const char *path)
+{
+	return open(path, O_RDONLY | O_CLOEXEC | O_NOFOLLOW | O_NONBLOCK);
+}
+
+static int get_xattr(int fd, struct fsxattr *fa)
+{
+	memset(fa, 0, sizeof(*fa));
+	return ioctl(fd, FS_IOC_FSGETXATTR, fa);
+}
+
+static int set_xattr(int fd, struct fsxattr *fa)
+{
+	return ioctl(fd, FS_IOC_FSSETXATTR, fa);
+}
+
+static int build_path(char *buf, size_t size, const char *dir, const char *name)
+{
+	int ret;
+
+	ret = snprintf(buf, size, "%s/%s", dir, name);
+	if (ret < 0 || ret >= size) {
+		errno = ENAMETOOLONG;
+		return -1;
+	}
+
+	return 0;
+}
+
+static int make_workdir(char *workdir, size_t size)
+{
+	const char *base = getenv("FILEATTR_TEST_DIR");
+	int ret;
+
+	if (!base || !*base)
+		base = P_tmpdir;
+
+	if (base[0] != '/') {
+		errno = EINVAL;
+		return -1;
+	}
+
+	ret = snprintf(workdir, size, "%s/fileattr.XXXXXX", base);
+	if (ret < 0 || ret >= (int)size) {
+		errno = ENAMETOOLONG;
+		return -1;
+	}
+
+	return mkdtemp(workdir) ? 0 : -1;
+}
+
+static int cleanup_workdir(const char *workdir)
+{
+	struct dirent *de;
+	DIR *dir;
+	int ret;
+
+	dir = opendir(workdir);
+	if (!dir)
+		return -1;
+
+	while ((de = readdir(dir))) {
+		struct stat st;
+		char path[PATH_MAX];
+
+		if (!strcmp(de->d_name, ".") || !strcmp(de->d_name, ".."))
+			continue;
+
+		ret = build_path(path, sizeof(path), workdir, de->d_name);
+		if (ret) {
+			closedir(dir);
+			return -1;
+		}
+
+		ret = lstat(path, &st);
+		if (ret) {
+			closedir(dir);
+			return -1;
+		}
+
+		if (S_ISDIR(st.st_mode))
+			ret = rmdir(path);
+		else
+			ret = unlink(path);
+		if (ret) {
+			closedir(dir);
+			return -1;
+		}
+	}
+
+	closedir(dir);
+	return rmdir(workdir);
+}
+
+FIXTURE_SETUP(fileattr)
+{
+	if (make_workdir(self->workdir, sizeof(self->workdir)))
+		SKIP(return, "failed to create workdir: %s", strerror(errno));
+}
+
+FIXTURE_TEARDOWN(fileattr)
+{
+	EXPECT_EQ(cleanup_workdir(self->workdir), 0);
+}
+
+TEST_F(fileattr, get_regular_file)
+{
+	char path[PATH_MAX];
+	struct fsxattr fa;
+	int fd;
+
+	ASSERT_EQ(build_path(path, sizeof(path), self->workdir, "regular.XXXXXX"), 0);
+
+	fd = mkstemp(path);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(close(fd), 0);
+
+	fd = open_nofollow(path);
+	ASSERT_GE(fd, 0);
+
+	ASSERT_EQ(get_xattr(fd, &fa), 0);
+
+	EXPECT_EQ(close(fd), 0);
+	EXPECT_EQ(unlink(path), 0);
+}
+
+TEST_F(fileattr, get_directory)
+{
+	char template[PATH_MAX];
+	struct fsxattr fa;
+	char *dir;
+	int fd;
+
+	ASSERT_EQ(build_path(template, sizeof(template), self->workdir, "dir.XXXXXX"), 0);
+
+	dir = mkdtemp(template);
+	ASSERT_NE(dir, NULL);
+
+	fd = open_nofollow(dir);
+	ASSERT_GE(fd, 0);
+
+	ASSERT_EQ(get_xattr(fd, &fa), 0);
+
+	EXPECT_EQ(close(fd), 0);
+	EXPECT_EQ(rmdir(dir), 0);
+}
+
+TEST_F(fileattr, get_fifo)
+{
+	char path[PATH_MAX];
+	struct fsxattr fa;
+	int fd;
+
+	ASSERT_EQ(build_path(path, sizeof(path), self->workdir, "fifo.XXXXXX"), 0);
+
+	fd = mkstemp(path);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(close(fd), 0);
+	ASSERT_EQ(unlink(path), 0);
+	ASSERT_EQ(mkfifo(path, 0600), 0);
+
+	fd = open_nofollow(path);
+	ASSERT_GE(fd, 0);
+
+	memset(&fa, 0, sizeof(fa));
+	ASSERT_LT(ioctl(fd, FS_IOC_FSGETXATTR, &fa), 0);
+	EXPECT_EQ(errno, ENOTTY);
+
+	EXPECT_EQ(close(fd), 0);
+	EXPECT_EQ(unlink(path), 0);
+}
+
+TEST_F(fileattr, set_nodump_roundtrip)
+{
+	char path[PATH_MAX];
+	struct fsxattr fa, orig;
+	int fd;
+
+	ASSERT_EQ(build_path(path, sizeof(path), self->workdir, "nodump.XXXXXX"), 0);
+
+	fd = mkstemp(path);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(close(fd), 0);
+
+	fd = open_nofollow(path);
+	ASSERT_GE(fd, 0);
+
+	ASSERT_EQ(get_xattr(fd, &orig), 0);
+	fa = orig;
+	fa.fsx_xflags |= FS_XFLAG_NODUMP;
+	ASSERT_EQ(set_xattr(fd, &fa), 0);
+	ASSERT_EQ(get_xattr(fd, &fa), 0);
+	EXPECT_TRUE(fa.fsx_xflags & FS_XFLAG_NODUMP);
+
+	fa = orig;
+	ASSERT_EQ(set_xattr(fd, &fa), 0);
+	ASSERT_EQ(get_xattr(fd, &fa), 0);
+	EXPECT_EQ(fa.fsx_xflags, orig.fsx_xflags);
+
+	EXPECT_EQ(close(fd), 0);
+	EXPECT_EQ(unlink(path), 0);
+}
+
+TEST_F(fileattr, set_noatime_roundtrip)
+{
+	char path[PATH_MAX];
+	struct fsxattr fa, orig;
+	int fd;
+
+	ASSERT_EQ(build_path(path, sizeof(path), self->workdir, "noatime.XXXXXX"), 0);
+
+	fd = mkstemp(path);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(close(fd), 0);
+
+	fd = open_nofollow(path);
+	ASSERT_GE(fd, 0);
+
+	ASSERT_EQ(get_xattr(fd, &orig), 0);
+	fa = orig;
+	fa.fsx_xflags |= FS_XFLAG_NOATIME;
+	ASSERT_EQ(set_xattr(fd, &fa), 0);
+	ASSERT_EQ(get_xattr(fd, &fa), 0);
+	EXPECT_TRUE(fa.fsx_xflags & FS_XFLAG_NOATIME);
+
+	fa = orig;
+	ASSERT_EQ(set_xattr(fd, &fa), 0);
+	ASSERT_EQ(get_xattr(fd, &fa), 0);
+	EXPECT_EQ(fa.fsx_xflags, orig.fsx_xflags);
+
+	EXPECT_EQ(close(fd), 0);
+	EXPECT_EQ(unlink(path), 0);
+}
+
+TEST_HARNESS_MAIN
-- 
2.51.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477188;
	b=apimNpPsr1sGg4ZDuXyz7P722rNBdn/WvxdY2REfR4bwHwS4GVU8g2p06dbiKqap3W09
	 QBPUBXgUJkCpmX6+ml4iQh89/l9morZQO1SEnkN81nW9zn0zoc0NtPce2ztsX7vwJWiYx
	 ecIG60I+EVMtdHwoF3kvVdNXYbZmSmYCe+F8rsIcJaQcrQIFBVZP8V0WulRvVwtqCrE5o
	 5wBVFAcV+dr4HF7Ddezg5dUqrEQGdkJC25e6TWPUwZcFB4zLYTPlaJivGWm7A9K4+a6qT
	 7cSCygWwUN9+3rl7P+a01YGbg/1aGkZvKZ/3OaDnvnKNTpEQZFf02edfL0I+W0n7G7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/0gvYOUOsBh9zCqNwor8+pPkFTru+bs+6gLwfR5yOEk=;
	b=3kzqRox806Xk5KS/+34854KgerbpgU74JGwYWB2ys/98s+UZ71lTy7Asgo3rUV3UYEQa
	 SSXEQCohj5vfq9olnZpYoUu6l9yZWUNh0s6qLmHf9CpfZwGGtzZEJNzKUvO2byYt2UeIB
	 uD5zvfJhj3JPCF7BowZTvdFnjysJT28E3Pr+0ip17AWXY7Hgbgr/nVe99LxAhKK6BLjcy
	 khNjwtEwm1L0DVfMv2PUaZJQigU9e69bp2++o0Bz8BqC9xvWZ7GxPkKPyfayd7GGxFQGS
	 EX+X+nTsudAM3BGA+szIGN9u0j0XRk+RSrIg3R5R01803t1/bnbwEVCPAwnfJ/kDIWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HzaivfEU;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280D0606A69D
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 23:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 280D0606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HzaivfEU
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab4f652f9bso2685921b6e.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795477187; x=1796081987; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/0gvYOUOsBh9zCqNwor8+pPkFTru+bs+6gLwfR5yOEk=;
        b=HzaivfEUfByy0uF0tJXga71Iaqrr/7oshwFMCZljWJzC+eME/ZvczCn5RZU01iEa+Y
         mWJmFnUzQfkzVfLoL33AF0GY959K5dulr5eR4e32X+Dj++fx0/lsDvRew87xDVQQfWXq
         fzfqI6AG5AdQiwsed3LSnj03/PKGj/d5Ovjrfmrcw9ubelJwId8ZbllSra9jymQ9+nrN
         oMPb0RKlAYIAN8SdkqHWFjPVLM9PGne7L/7I/u1TYisaoQxNne7PfQlERx7E8P/Gkf3c
         eyaBl5TGLRkRg+1rXai8MNNU1VdfodPyy80izb16qvDDUBEsZokEhY20ZMM0qELfuoQa
         ecDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477187; x=1796081987;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0gvYOUOsBh9zCqNwor8+pPkFTru+bs+6gLwfR5yOEk=;
        b=LYcaf+uL+vme6sppjYQVlKOrIqePBkEOd23Fwk9UM+hErX1WnPr70pt2t36+UEGlg6
         eZXXQ+D/5KzbB6s7X0VVJNQB0+hEz28tBtPcPtBOUckuCMMUE2ZaZLkD5yEoybAs9+Pj
         RYh16KREEC+YQdybjS30BlJeRGJbZWSLpQv1uVaMdb6SN2j5VetFxUqO890dJOFVbUHu
         sTqgh1aobfzL5IHSzfrM6ziKYDh9SV4tFNojn+Jf+LF9qL/nlA34a4urJFjDu9qL9TnO
         oDP9BIcqjYVTM0L7WSMbRmU+UvyuowxwvudHT87IOOTCNiFJ0JciTJJijxC07NqyE1kQ
         XvYg==
X-Forwarded-Encrypted: i=1; AL+hErE3RSIcOeBf31vGk0W3Pek0VfnTddt5pPx5U4HRg0QHOD4AmYDUGjUPI2+hQdNfQ/k+XGe1S7tu0zykYa71u8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vHRnGTgR0RM/o/Jx6wdIb3QAldHcwSPI7svBWgXH/i/IXVof6
	zLQwaU/WbgCZdntU+7hTXIxN4zPed6k+gWAUkUXWP4yk4Hzz3Mt4b85XlYG276mV7ucXWkJxmoB
	83HZCq1MWtwFVqw==
X-Received: from ilben18-n1.prod.google.com ([2002:a05:6e02:5112:10b0:54e:8e95:90ae])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4488:b0:4f9:6348:cd3b with SMTP id 5614622812f47-57a0b4413abmr14381949b6e.41.1795477186803;
 Mon, 23 Nov 2026 15:39:46 -0800 (PST)
Date: Mon, 23 Nov 2026 23:39:18 +0000
In-Reply-To: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123233924.3970932-14-dmatlack@google.com>
Subject: [PATCH v5 13/18] selftests/liveupdate: Test which tmpfs files can be preserved
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Add tests to liveupdate.c for the checks done when preserving a tmpfs
file: A file can be preserved through a read-only fd, but not a
write-only fd. Preserving it requires permission to write to it, except
for the owner of an immutable file or of a file on a read-only
superblock. Append-only files can't be preserved, and files can be
preserved through a read-only mount. Also check that operations that
would change the size of a preserved file fail with -EPERM until the
file is unpreserved, while reads and writes within the file work.

The errors of these preserve failures aren't documented, so the tests
only check that the preserve fails.

These checks don't need a kexec, so they run as part of the regular
liveupdate selftest.

Enable CONFIG_TMPFS_XATTR, which tmpfs needs for FS_IOC_SETFLAGS. The
test cases that use it are skipped without it.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/liveupdate/config     |   1 +
 .../testing/selftests/liveupdate/liveupdate.c | 316 ++++++++++++++++++
 2 files changed, 317 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/config b/tools/testing/selftests/liveupdate/config
index 016d009dba13..37230f4c488f 100644
--- a/tools/testing/selftests/liveupdate/config
+++ b/tools/testing/selftests/liveupdate/config
@@ -9,4 +9,5 @@ CONFIG_LIVEUPDATE=y
 CONFIG_LIVEUPDATE_TEST=y
 CONFIG_MEMFD_CREATE=y
 CONFIG_TMPFS=y
+CONFIG_TMPFS_XATTR=y
 CONFIG_SHMEM=y
diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index 8b6e61695a35..094e7e22c1fb 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -16,15 +16,24 @@
  * - Resource preservation: successfully preserving individual and multiple memfds,
  *   verifying contents remain accessible.
  * - Complex multi-session scenarios involving mixed empty and populated files.
+ * - Which tmpfs files can be preserved, and the frozen size of preserved files.
  */
 
 #include <errno.h>
 #include <fcntl.h>
+#include <grp.h>
 #include <stddef.h>
+#include <stdlib.h>
 #include <string.h>
 #include <sys/ioctl.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
+#include <sys/wait.h>
 #include <unistd.h>
 
+#include <linux/falloc.h>
+#include <linux/fs.h>
+
 #include <libliveupdate.h>
 #include <linux/liveupdate.h>
 
@@ -578,4 +587,311 @@ TEST_F(liveupdate_device, preserve_memfd_with_arg)
 	ASSERT_EQ(close(mem_fd2), 0);
 }
 
+#define NOBODY 65534
+
+FIXTURE(preserve_tmpfs) {
+	char dir[32];
+	int luo_fd;
+	int session_fd;
+	bool mounted;
+};
+
+FIXTURE_SETUP(preserve_tmpfs)
+{
+	self->luo_fd = -1;
+	self->session_fd = -1;
+	self->mounted = false;
+
+	self->luo_fd = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->luo_fd < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->luo_fd, 0);
+
+	self->session_fd = luo_create_session(self->luo_fd, "preserve-tmpfs");
+	ASSERT_GE(self->session_fd, 0);
+
+	strcpy(self->dir, "/tmp/luo-tmpfs-XXXXXX");
+	ASSERT_NE(mkdtemp(self->dir), NULL);
+	if (mount("tmpfs", self->dir, "tmpfs", 0, "size=1M")) {
+		int err = errno;
+
+		rmdir(self->dir);
+		SKIP(return, "Failed to mount tmpfs: %s", strerror(err));
+	}
+	self->mounted = true;
+	ASSERT_EQ(chdir(self->dir), 0);
+}
+
+FIXTURE_TEARDOWN(preserve_tmpfs)
+{
+	if (self->session_fd >= 0)
+		close(self->session_fd);
+	if (self->luo_fd >= 0)
+		close(self->luo_fd);
+	if (chdir("/"))
+		return;
+	if (self->mounted)
+		umount2(self->dir, MNT_DETACH);
+	rmdir(self->dir);
+}
+
+/* Create the file @path with some contents and the mode @mode. */
+static int create_file(const char *path, mode_t mode)
+{
+	int fd;
+
+	fd = open(path, O_CREAT | O_EXCL | O_RDWR, mode);
+	if (fd < 0)
+		return -1;
+
+	if (write(fd, "data", 4) != 4 || fchmod(fd, mode)) {
+		close(fd);
+		return -1;
+	}
+
+	return fd;
+}
+
+/*
+ * Open @path with @flags and preserve it. Return 0 if the preserve succeeds,
+ * -errno if it fails, or 1 if @path can't be opened.
+ */
+static int preserve_path(int session_fd, const char *path, int flags,
+			 __u64 token)
+{
+	int fd, ret;
+
+	fd = open(path, flags);
+	if (fd < 0)
+		return 1;
+
+	ret = luo_session_preserve_fd(session_fd, fd, token);
+	close(fd);
+	return ret;
+}
+
+/*
+ * Like preserve_path() with O_RDONLY, but as the user nobody. Also return 1 if
+ * the child can't become nobody.
+ */
+static int preserve_as_nobody(int session_fd, const char *path, __u64 token)
+{
+	int status, ret;
+	pid_t pid;
+
+	pid = fork();
+	if (pid < 0)
+		return 1;
+
+	if (!pid) {
+		if (setgroups(0, NULL) || setresgid(NOBODY, NOBODY, NOBODY) ||
+		    setresuid(NOBODY, NOBODY, NOBODY))
+			_exit(255);
+		ret = preserve_path(session_fd, path, O_RDONLY, token);
+		_exit(ret > 0 ? 255 : -ret);
+	}
+
+	if (waitpid(pid, &status, 0) != pid || !WIFEXITED(status) ||
+	    WEXITSTATUS(status) == 255)
+		return 1;
+
+	return -WEXITSTATUS(status);
+}
+
+/* Add the inode flag @flag, e.g. FS_IMMUTABLE_FL, to the file @fd. */
+static int add_inode_flag(int fd, int flag)
+{
+	int flags;
+
+	if (ioctl(fd, FS_IOC_GETFLAGS, &flags))
+		return -errno;
+
+	flags |= flag;
+	if (ioctl(fd, FS_IOC_SETFLAGS, &flags))
+		return -errno;
+
+	return 0;
+}
+
+/*
+ * Test Case: Preserve Through Read-Only and Write-Only Fds
+ *
+ * A file can be preserved through a read-only fd, but not through a
+ * write-only fd, since the retrieved file can be read.
+ */
+TEST_F(preserve_tmpfs, access_mode)
+{
+	int fd;
+
+	fd = create_file("file", 0644);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	EXPECT_LT(preserve_path(self->session_fd, "file", O_WRONLY, 1), 0);
+	EXPECT_EQ(preserve_path(self->session_fd, "file", O_RDONLY, 2), 0);
+}
+
+/*
+ * Test Case: Preserve Without Write Permission
+ *
+ * Preserving a file freezes its size for all of its users, so it requires
+ * permission to write to the file.
+ */
+TEST_F(preserve_tmpfs, unwritable)
+{
+	int fd;
+
+	fd = create_file("file", 0644);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	EXPECT_LT(preserve_as_nobody(self->session_fd, "file", 1), 0);
+	EXPECT_EQ(preserve_path(self->session_fd, "file", O_RDONLY, 2), 0);
+}
+
+/*
+ * Test Case: Preserve an Append-Only File
+ *
+ * Freezing the size of an append-only file would stop all writes to it, so
+ * append-only files can't be preserved.
+ */
+TEST_F(preserve_tmpfs, append_only)
+{
+	int fd, ret;
+
+	fd = create_file("file", 0644);
+	ASSERT_GE(fd, 0);
+	ret = add_inode_flag(fd, FS_APPEND_FL);
+	close(fd);
+	if (ret == -ENOTTY || ret == -EOPNOTSUPP)
+		SKIP(return, "FS_IOC_SETFLAGS is not supported");
+	ASSERT_EQ(ret, 0);
+
+	EXPECT_LT(preserve_path(self->session_fd, "file", O_RDONLY, 1), 0);
+}
+
+/*
+ * Test Case: Preserve an Immutable File
+ *
+ * The size of an immutable file can't change anyway, so its owner may preserve
+ * it. Others still need permission to write to it.
+ */
+TEST_F(preserve_tmpfs, immutable)
+{
+	int fd, ret;
+
+	fd = create_file("own", 0644);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(fchown(fd, NOBODY, NOBODY), 0);
+	ret = add_inode_flag(fd, FS_IMMUTABLE_FL);
+	close(fd);
+	if (ret == -ENOTTY || ret == -EOPNOTSUPP)
+		SKIP(return, "FS_IOC_SETFLAGS is not supported");
+	ASSERT_EQ(ret, 0);
+
+	fd = create_file("other", 0666);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(add_inode_flag(fd, FS_IMMUTABLE_FL), 0);
+	close(fd);
+
+	EXPECT_EQ(preserve_as_nobody(self->session_fd, "own", 1), 0);
+	EXPECT_LT(preserve_as_nobody(self->session_fd, "other", 2), 0);
+}
+
+/*
+ * Test Case: Preserve Through a Read-Only Mount
+ *
+ * Preserving a file only needs permission to write to the file, not a writable
+ * mount, so it works through a read-only mount.
+ */
+TEST_F(preserve_tmpfs, rdonly_mount)
+{
+	int fd;
+
+	ASSERT_EQ(mkdir("src", 0755), 0);
+	fd = create_file("src/file", 0644);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	ASSERT_EQ(mkdir("ro", 0755), 0);
+	ASSERT_EQ(mount("src", "ro", NULL, MS_BIND, NULL), 0);
+	ASSERT_EQ(mount(NULL, "ro", NULL, MS_REMOUNT | MS_BIND | MS_RDONLY,
+			NULL), 0);
+
+	EXPECT_EQ(preserve_path(self->session_fd, "ro/file", O_RDONLY, 1), 0);
+	umount2("ro", MNT_DETACH);
+}
+
+/*
+ * Test Case: Preserve on a Read-Only Superblock
+ *
+ * The size of a file on a read-only superblock can't change anyway, so its
+ * owner may preserve it. Others still need permission to write to it.
+ */
+TEST_F(preserve_tmpfs, rdonly_sb)
+{
+	int fd;
+
+	fd = create_file("own", 0644);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(fchown(fd, NOBODY, NOBODY), 0);
+	close(fd);
+
+	fd = create_file("other", 0666);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	ASSERT_EQ(mount(NULL, self->dir, NULL, MS_REMOUNT | MS_RDONLY, NULL),
+		  0);
+
+	EXPECT_EQ(preserve_as_nobody(self->session_fd, "own", 1), 0);
+	EXPECT_LT(preserve_as_nobody(self->session_fd, "other", 2), 0);
+}
+
+/*
+ * Test Case: Operations on a Preserved File
+ *
+ * While a file is preserved, operations that would change its size or punch
+ * holes into it fail with -EPERM. Reads and writes within the file still work.
+ * Closing the session unpreserves the file, after which its size can change
+ * again.
+ */
+TEST_F(preserve_tmpfs, preserved_ops)
+{
+	long page_size = getpagesize();
+	struct stat st;
+	char c;
+	int fd;
+
+	fd = create_file("file", 0644);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(ftruncate(fd, 2 * page_size), 0);
+	ASSERT_EQ(luo_session_preserve_fd(self->session_fd, fd, 1), 0);
+
+	EXPECT_EQ(ftruncate(fd, page_size), -1);
+	EXPECT_EQ(errno, EPERM);
+	EXPECT_EQ(ftruncate(fd, 4 * page_size), -1);
+	EXPECT_EQ(errno, EPERM);
+	EXPECT_EQ(fallocate(fd, 0, 0, 4 * page_size), -1);
+	EXPECT_EQ(errno, EPERM);
+	EXPECT_EQ(fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0,
+			    page_size), -1);
+	EXPECT_EQ(errno, EPERM);
+	EXPECT_EQ(pwrite(fd, "x", 1, 2 * page_size), -1);
+	EXPECT_EQ(errno, EPERM);
+
+	/* The size didn't change, but writes within the file work. */
+	ASSERT_EQ(fstat(fd, &st), 0);
+	EXPECT_EQ(st.st_size, 2 * page_size);
+	EXPECT_EQ(pwrite(fd, "x", 1, page_size), 1);
+	EXPECT_EQ(pread(fd, &c, 1, page_size), 1);
+	EXPECT_EQ(c, 'x');
+
+	ASSERT_EQ(close(self->session_fd), 0);
+	self->session_fd = -1;
+	EXPECT_EQ(ftruncate(fd, page_size), 0);
+
+	close(fd);
+}
+
 TEST_HARNESS_MAIN
-- 
2.56.1.809.ga0b61035b5-goog


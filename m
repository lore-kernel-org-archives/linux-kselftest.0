Received: from mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8CF30BB8D
	for <linux-kselftest@vger.kernel.org>; Sat, 29 Aug 2026 02:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787970521; cv=none; b=HlgTS8Go8phjQ+f/u+wdCH9YZT/OZkOet0bB2AtVAzDt80oHe2IU4X+qwK8qbXlpVzXQsj7PVMx9KRRCP6VpWwfiS3DXJzxc1DTnVHQfi39ulAOzN3utvvsgq9iidl0nWQXYCtjGRct0Nn+Hh+wKo4spdY0iwCMtBBX/C06xjXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787970521; c=relaxed/simple;
	bh=Wl1Q7zSGGwM6eDz4dkcZNpAYHBtLc5A/cH0j5Jz5sZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gE8mcBNgNtt/fCk9SGhvGjZ7+t+uNHUIiCNldDRKAoJlM/L6mfQB8naFHSQfmrc4EtKa90sVwQg//MGLLjj2Nmy8ZyJJ0/lkPlVxhfW6a1Xez9oVF45WYKyQ42uC1279dQXeiRwLb/BnFGum+pfcO2ObhalmQ0S+85V694OWOTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NS4QYFeG; arc=none smtp.client-ip=95.215.58.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NS4QYFeG"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Wl1Q7zSGGwM6eDz4dkcZNpAYHBtLc5A/cH0j5Jz5sZQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787970517; v=1; x=1788575317;
 b=NS4QYFeGP/jcbbed68bYTDerpr6PjuVDvbgd32FoEIBxxxjqQ+7z39X8OIy5PKg8PsB8x6jT
 NLrZX/skawSnwES7PGkaoYJla+fg0HJXQ6OWz1buhz3s6xy9HZo9Yk7Xx/7edv1L2GMe9kf0fPw
 gz4pEqSzGyCCslVYXqguDqBs=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fa1e52d5e91ab7a8;
	Sat, 29 Aug 2026 02:28:37 +0000
X-Mizu-Trace-ID: fa1e52d5e91ab7a8
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Christian Brauner <christian@brauner.io>
Cc: Meta kernel team <kernel-team@meta.com>,
	linux-kselftest@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: cover kernfs dentry revalidation
Date: Fri, 28 Aug 2026 19:28:25 -0700
Message-ID: <20260829022825.407836-1-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernfs_test only exercised two xattr calls, so nothing covered the part
of kernfs most exposed to userspace: the dentry cache.

kernfs nodes appear and disappear from kernel contexts with no VFS
operation driving them, and removal cannot reliably unhash the cached
dentries, so ->d_revalidate() is the correctness backstop. It had no
test at all.

Add tests that drive kernfs from kernel context rather than through VFS
create/unlink:

 - writing cgroup.subtree_control makes the kernel add and remove files
   in every child cgroup, exercising both the negative-dentry revision
   check and the deactivation check,
 - renaming a network interface renames the sysfs node underneath an
   already cached dentry,
 - sysfs in a fresh network namespace must show only that namespace's
   interfaces, covering the KERNFS_NS tagging paths,
 - lookup hammered against concurrent mkdir/rmdir must only ever see
   success or an errno meaning "it went away",
 - removal-while-open, readdir duplicate detection and a
   seekdir()/telldir() round trip over kernfs_dir_pos()'s hash cookie.

Also the other direction: walking already cached dentries must not
invalidate them. That is not merely a lost optimisation --
d_invalidate() calls detach_mounts(), so a revalidation that wrongly
fails silently tears down any mount underneath the directory.

Both filesystems are needed: cgroup2 has no ->rename and is not
namespace tagged, and sysfs cannot be mounted with a controllable set of
children. The config fragment keeps a kernel built via kselftest-merge
from reporting a pass while running almost nothing.

Verified the suite reacts to a broken backstop rather than passing:
stubbing kernfs_dir_changed() to return false turns 8 of the 11 tests
red.

Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 MAINTAINERS                                   |   1 +
 tools/testing/selftests/filesystems/config    |   6 +
 .../selftests/filesystems/kernfs_test.c       | 657 +++++++++++++++++-
 3 files changed, 663 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/filesystems/config

diff --git a/MAINTAINERS b/MAINTAINERS
index 549df316f487..605fd2d47788 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14392,6 +14392,7 @@ S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
 F:	fs/kernfs/
 F:	include/linux/kernfs.h
+F:	tools/testing/selftests/filesystems/kernfs_test.c
 
 KEXEC
 M:	Andrew Morton <akpm@linux-foundation.org>
diff --git a/tools/testing/selftests/filesystems/config b/tools/testing/selftests/filesystems/config
new file mode 100644
index 000000000000..6e33f4188af4
--- /dev/null
+++ b/tools/testing/selftests/filesystems/config
@@ -0,0 +1,6 @@
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_NET=y
+CONFIG_NET_NS=y
+CONFIG_INET=y
+CONFIG_SYSFS=y
diff --git a/tools/testing/selftests/filesystems/kernfs_test.c b/tools/testing/selftests/filesystems/kernfs_test.c
index 84c2b910a60d..5c9677682d13 100644
--- a/tools/testing/selftests/filesystems/kernfs_test.c
+++ b/tools/testing/selftests/filesystems/kernfs_test.c
@@ -2,8 +2,20 @@
 #define _GNU_SOURCE
 #define __SANE_USERSPACE_TYPES__
 
+#include <dirent.h>
+#include <errno.h>
 #include <fcntl.h>
+#include <limits.h>
+#include <net/if.h>
+#include <sched.h>
 #include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+#include <sys/ioctl.h>
+#include <sys/mount.h>
+#include <sys/socket.h>
 #include <sys/stat.h>
 #include <sys/xattr.h>
 
@@ -34,5 +46,648 @@ TEST(kernfs_getxattr)
 	EXPECT_EQ(close(fd), 0);
 }
 
-TEST_HARNESS_MAIN
+/*
+ * Exercise the kernfs dentry cache: lookup, revalidation of positive and
+ * negative dentries, readdir and namespace tagging.
+ *
+ * These drive kernfs from kernel context rather than VFS create/unlink,
+ * which is what ->d_revalidate() exists for: writing cgroup.subtree_control
+ * adds and removes files in every child cgroup with no VFS operation
+ * touching those names.
+ */
+
+#define CG_SCRATCH	"kernfs_selftest"
+#define TEST_IFNAME	"kfstest0"
+
+/* Controllers that add a predictable file to each child cgroup. */
+static const struct {
+	const char *name;
+	const char *probe_file;
+} controllers[] = {
+	{ "memory",	"memory.current" },
+	{ "pids",	"pids.current" },
+	{ "cpu",	"cpu.stat" },
+};
+
+static int find_cgroup2_root(char *buf, size_t len)
+{
+	char line[PATH_MAX * 2];
+	FILE *f;
+	int ret = -1;
+
+	f = fopen("/proc/self/mounts", "re");
+	if (!f)
+		return -1;
+
+	while (fgets(line, sizeof(line), f)) {
+		char mnt[PATH_MAX], type[64];
+
+		/* Octal escaping can expand a path fourfold; bound both %s. */
+		if (sscanf(line, "%*s %4095s %63s", mnt, type) != 2)
+			continue;
+		if (strcmp(type, "cgroup2"))
+			continue;
+		if (strlen(mnt) >= len)
+			break;
+		strcpy(buf, mnt);
+		ret = 0;
+		break;
+	}
+
+	fclose(f);
+	return ret;
+}
+
+static int write_file(const char *path, const char *val)
+{
+	ssize_t len = strlen(val);
+	int fd, ret;
+
+	fd = open(path, O_WRONLY | O_CLOEXEC);
+	if (fd < 0)
+		return -1;
+	ret = write(fd, val, len) == len ? 0 : -1;
+	close(fd);
+	return ret;
+}
+
+static bool file_has_word(const char *path, const char *word)
+{
+	char buf[4096], *tok, *save;
+	bool found = false;
+	ssize_t n;
+	int fd;
+
+	fd = open(path, O_RDONLY | O_CLOEXEC);
+	if (fd < 0)
+		return false;
+	n = read(fd, buf, sizeof(buf) - 1);
+	close(fd);
+	if (n < 0)
+		return false;
+	buf[n] = '\0';
+
+	for (tok = strtok_r(buf, "\n ", &save); tok;
+	     tok = strtok_r(NULL, "\n ", &save)) {
+		if (!strcmp(tok, word)) {
+			found = true;
+			break;
+		}
+	}
+	return found;
+}
+
+static bool path_is_mounted(const char *path)
+{
+	char line[PATH_MAX * 2];
+	bool found = false;
+	FILE *f;
+
+	f = fopen("/proc/self/mounts", "re");
+	if (!f)
+		return false;
+	while (fgets(line, sizeof(line), f)) {
+		char mnt[PATH_MAX];
+
+		if (sscanf(line, "%*s %4095s", mnt) != 1)
+			continue;
+		if (!strcmp(mnt, path)) {
+			found = true;
+			break;
+		}
+	}
+	fclose(f);
+	return found;
+}
+
+/* Shared by the stress tests below. */
+static bool stress_deadline(const struct timespec *end)
+{
+	struct timespec now;
+
+	clock_gettime(CLOCK_MONOTONIC, &now);
+	return now.tv_sec > end->tv_sec ||
+	       (now.tv_sec == end->tv_sec && now.tv_nsec >= end->tv_nsec);
+}
+
+FIXTURE(kernfs_cgroup)
+{
+	char scratch[PATH_MAX];		/* <cg2>/kernfs_selftest.<pid> */
+	char child[PATH_MAX];		/* <scratch>/child */
+	char probe[PATH_MAX];		/* child's controller file */
+	char scratch_sc[PATH_MAX];	/* scratch's cgroup.subtree_control */
+	char root_sc[PATH_MAX];		/* root's cgroup.subtree_control */
+	char enable[32];		/* "+<controller>" */
+	char disable[32];		/* "-<controller>" */
+	char mnt[PATH_MAX];		/* our own mount, if we made one */
+	bool mounted;
+	bool enabled_at_root;
+};
+
+/* A cgroup stays busy briefly after its last task exits. */
+static void rmdir_retry(const char *path)
+{
+	int i;
+
+	for (i = 0; i < 500; i++) {
+		if (!rmdir(path) || errno != EBUSY)
+			return;
+		usleep(10000);
+	}
+}
+
+/*
+ * Undo whatever SETUP managed to do.  The harness skips TEARDOWN after a
+ * failed or skipped SETUP, so SETUP must call this before returning early.
+ */
+static void kernfs_cgroup_undo(FIXTURE_DATA(kernfs_cgroup) *self)
+{
+	rmdir_retry(self->child);
+	rmdir(self->scratch);
+	if (self->enabled_at_root)
+		write_file(self->root_sc, self->disable);
+	if (self->mounted) {
+		umount2(self->mnt, MNT_DETACH);
+		rmdir(self->mnt);
+	}
+	self->enabled_at_root = false;
+	self->mounted = false;
+}
+
+FIXTURE_SETUP(kernfs_cgroup)
+{
+	char root[PATH_MAX], ctl[PATH_MAX];
+	const char *probe_file = NULL;
+	size_t i;
+
+	if (geteuid())
+		SKIP(return, "test needs to run as root");
+
+	/*
+	 * A private mount namespace stops our mounts leaking, but does not
+	 * isolate the cgroup hierarchy: cgroup2 has one default hierarchy
+	 * however many times it is mounted.  The scratch cgroups live in the
+	 * host's and must be removed, not discarded with the namespace.
+	 */
+	if (unshare(CLONE_NEWNS))
+		SKIP(return, "unshare(CLONE_NEWNS): %s", strerror(errno));
+	if (mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL))
+		SKIP(return, "make / private: %s", strerror(errno));
+
+	/* Use an existing cgroup2 mount if there is one, else make our own. */
+	if (find_cgroup2_root(root, sizeof(root))) {
+		strcpy(self->mnt, "/tmp/kernfs_selftest_cg2.XXXXXX");
+		if (!mkdtemp(self->mnt))
+			SKIP(return, "mkdtemp: %s", strerror(errno));
+		if (mount("none", self->mnt, "cgroup2", 0, NULL)) {
+			rmdir(self->mnt);
+			SKIP(return, "mount cgroup2: %s", strerror(errno));
+		}
+		self->mounted = true;
+		strcpy(root, self->mnt);
+	}
+
+	snprintf(self->root_sc, sizeof(self->root_sc),
+		 "%s/cgroup.subtree_control", root);
+	snprintf(ctl, sizeof(ctl), "%s/cgroup.controllers", root);
+
+	/* Named after our pid so we cannot collide with anything else. */
+	snprintf(self->scratch, sizeof(self->scratch), "%s/%s.%d", root,
+		 CG_SCRATCH, getpid());
+	snprintf(self->child, sizeof(self->child), "%s/child", self->scratch);
+	snprintf(self->scratch_sc, sizeof(self->scratch_sc),
+		 "%s/cgroup.subtree_control", self->scratch);
+
+	for (i = 0; i < ARRAY_SIZE(controllers); i++) {
+		if (!file_has_word(ctl, controllers[i].name))
+			continue;
+		snprintf(self->enable, sizeof(self->enable), "+%s",
+			 controllers[i].name);
+		snprintf(self->disable, sizeof(self->disable), "-%s",
+			 controllers[i].name);
+		probe_file = controllers[i].probe_file;
+
+		/*
+		 * A controller must be in the root's subtree_control before
+		 * it appears in our scratch cgroup.  Note if we enabled it,
+		 * so it can be put back.
+		 */
+		self->enabled_at_root = !file_has_word(self->root_sc,
+						       controllers[i].name);
+		if (self->enabled_at_root &&
+		    write_file(self->root_sc, self->enable)) {
+			self->enabled_at_root = false;
+			probe_file = NULL;
+			continue;
+		}
+		break;
+	}
+	if (!probe_file) {
+		kernfs_cgroup_undo(self);
+		SKIP(return, "no usable cgroup2 controller");
+	}
+
+	snprintf(self->probe, sizeof(self->probe), "%s/%s", self->child,
+		 probe_file);
+
+	/*
+	 * Only an unusable environment may skip.  A scratch cgroup named
+	 * after our own pid should always be creatable, so failing to make
+	 * one is a result -- skipping would let a broken kernel look green.
+	 */
+	if (mkdir(self->scratch, 0755)) {
+		int err = errno;
+
+		kernfs_cgroup_undo(self);
+		if (err == EROFS || err == EACCES || err == EPERM)
+			SKIP(return, "mkdir %s: %s", self->scratch,
+			     strerror(err));
+		ASSERT_EQ(err, 0) TH_LOG("mkdir %s: %s", self->scratch,
+					 strerror(err));
+	}
+	if (mkdir(self->child, 0755)) {
+		int err = errno;
+
+		kernfs_cgroup_undo(self);
+		ASSERT_EQ(err, 0) TH_LOG("mkdir %s: %s", self->child,
+					 strerror(err));
+	}
+}
+
+FIXTURE_TEARDOWN(kernfs_cgroup)
+{
+	write_file(self->scratch_sc, self->disable);
+	kernfs_cgroup_undo(self);
+}
+
+/*
+ * Walking already-cached dentries must not invalidate them.  Spurious
+ * invalidation is not merely slow: d_invalidate() calls detach_mounts(), so
+ * an unrelated lookup would silently tear down any mount below.
+ */
+TEST_F(kernfs_cgroup, path_walk_does_not_invalidate)
+{
+	char src[] = "/tmp/kernfs_selftest_bind.XXXXXX";
+	char sub[PATH_MAX], probe[PATH_MAX];
+	int i;
+
+	snprintf(sub, sizeof(sub), "%s/sub", self->child);
+	ASSERT_EQ(mkdir(sub, 0755), 0);
+
+	if (!mkdtemp(src)) {
+		rmdir(sub);
+		SKIP(return, "mkdtemp: %s", strerror(errno));
+	}
+	if (mount(src, sub, NULL, MS_BIND, NULL)) {
+		int err = errno;
+
+		rmdir(sub);
+		rmdir(src);
+		SKIP(return, "bind mount onto a cgroup dir: %s", strerror(err));
+	}
+	ASSERT_TRUE(path_is_mounted(sub));
+
+	/* Walk a sibling path through the same directory, repeatedly. */
+	snprintf(probe, sizeof(probe), "%s/cgroup.procs", self->child);
+	for (i = 0; i < 8; i++) {
+		int fd = open(probe, O_RDONLY | O_CLOEXEC);
+
+		if (fd >= 0)
+			close(fd);
+	}
+
+	EXPECT_TRUE(path_is_mounted(sub));
+
+	umount2(sub, MNT_DETACH);
+	rmdir(sub);
+	rmdir(src);
+}
+
+/*
+ * A cached negative dentry must be invalidated when the kernel creates the
+ * name behind the dcache's back.  That is what kernfs_dir_changed() and
+ * kernfs_elem_dir::rev are for.
+ */
+TEST_F(kernfs_cgroup, negative_dentry_invalidated_by_kernel_create)
+{
+	struct stat st;
+
+	/* Caches a negative dentry for the probe file. */
+	ASSERT_EQ(stat(self->probe, &st), -1);
+	ASSERT_EQ(errno, ENOENT);
+
+	/* The kernel now creates it, with no VFS operation on that name. */
+	ASSERT_EQ(write_file(self->scratch_sc, self->enable), 0);
+
+	EXPECT_EQ(stat(self->probe, &st), 0);
+}
+
+/* The mirror image: a cached positive dentry must go when the node does. */
+TEST_F(kernfs_cgroup, positive_dentry_invalidated_by_kernel_remove)
+{
+	struct stat st;
+
+	ASSERT_EQ(write_file(self->scratch_sc, self->enable), 0);
+	/* Caches a positive dentry. */
+	ASSERT_EQ(stat(self->probe, &st), 0);
 
+	ASSERT_EQ(write_file(self->scratch_sc, self->disable), 0);
+
+	ASSERT_EQ(stat(self->probe, &st), -1);
+	EXPECT_EQ(errno, ENOENT);
+}
+
+/* Opening a removed node fails; it never returns stale content. */
+TEST_F(kernfs_cgroup, open_after_rmdir_fails)
+{
+	char path[PATH_MAX];
+	char buf[64];
+	int fd;
+
+	snprintf(path, sizeof(path), "%s/cgroup.procs", self->child);
+
+	fd = open(path, O_RDONLY | O_CLOEXEC);
+	ASSERT_GE(fd, 0);
+
+	ASSERT_EQ(rmdir(self->child), 0);
+
+	/* Lookup by path must fail. */
+	EXPECT_EQ(open(path, O_RDONLY | O_CLOEXEC), -1);
+	EXPECT_EQ(errno, ENOENT);
+
+	/*
+	 * An fd held across removal must fail cleanly rather than hang or
+	 * return garbage.  Empty read or error, both fine.
+	 */
+	if (read(fd, buf, sizeof(buf)) < 0)
+		EXPECT_EQ(errno, ENODEV);
+	EXPECT_EQ(close(fd), 0);
+
+	ASSERT_EQ(mkdir(self->child, 0755), 0);
+}
+
+/* readdir returns every entry exactly once. */
+TEST_F(kernfs_cgroup, readdir_no_duplicates)
+{
+	char names[512][NAME_MAX + 1];
+	struct dirent *de;
+	int n = 0, i, j;
+	DIR *d;
+
+	ASSERT_EQ(write_file(self->scratch_sc, self->enable), 0);
+
+	d = opendir(self->child);
+	ASSERT_NE(d, NULL);
+	while ((de = readdir(d))) {
+		if (!strcmp(de->d_name, ".") || !strcmp(de->d_name, ".."))
+			continue;
+		ASSERT_LT(n, (int)ARRAY_SIZE(names));
+		strncpy(names[n], de->d_name, NAME_MAX);
+		names[n][NAME_MAX] = '\0';
+		n++;
+	}
+	closedir(d);
+
+	ASSERT_GT(n, 0);
+	for (i = 0; i < n; i++)
+		for (j = i + 1; j < n; j++)
+			EXPECT_STRNE(names[i], names[j]);
+}
+
+/*
+ * A telldir() cookie must resolve back to the same entry after seekdir().
+ * kernfs encodes the cookie as the node's name hash, so this covers
+ * kernfs_dir_pos() as well as plain iteration.
+ */
+TEST_F(kernfs_cgroup, readdir_seekdir_roundtrip)
+{
+	char names[512][NAME_MAX + 1];
+	struct dirent *de;
+	long pos[512];
+	int n = 0, i;
+	DIR *d;
+
+	ASSERT_EQ(write_file(self->scratch_sc, self->enable), 0);
+
+	d = opendir(self->child);
+	ASSERT_NE(d, NULL);
+
+	/* Record the cookie *before* reading each entry, with its name. */
+	while (1) {
+		long here = telldir(d);
+
+		de = readdir(d);
+		if (!de)
+			break;
+		if (!strcmp(de->d_name, ".") || !strcmp(de->d_name, ".."))
+			continue;
+		ASSERT_LT(n, (int)ARRAY_SIZE(pos));
+		pos[n] = here;
+		strncpy(names[n], de->d_name, NAME_MAX);
+		names[n][NAME_MAX] = '\0';
+		n++;
+	}
+	ASSERT_GT(n, 0);
+
+	/* Seeking back to a cookie must land on the entry it was taken at. */
+	for (i = 0; i < n; i++) {
+		seekdir(d, pos[i]);
+		de = readdir(d);
+		ASSERT_NE(de, NULL);
+		EXPECT_STREQ(de->d_name, names[i]);
+	}
+
+	closedir(d);
+}
+
+#define STRESS_SECS	2
+#define STRESS_DIRS	4
+#define STRESS_READERS	4
+
+/*
+ * Hammer lookup against creation and removal.  Revalidation holds no lock
+ * against the writers, so what makes it safe is that every answer it can
+ * give is one the caller already handles: a reader must only ever see
+ * success or an errno meaning "it went away", never garbage or a hang.
+ */
+TEST_F(kernfs_cgroup, lookup_vs_create_remove_stress)
+{
+	pid_t pids[STRESS_DIRS + STRESS_READERS];
+	struct timespec end;
+	int i, status, n = 0;
+
+	clock_gettime(CLOCK_MONOTONIC, &end);
+	end.tv_sec += STRESS_SECS;
+
+	for (i = 0; i < STRESS_DIRS; i++) {
+		pid_t pid = fork();
+
+		ASSERT_GE(pid, 0);
+		if (pid == 0) {
+			char dir[PATH_MAX];
+
+			snprintf(dir, sizeof(dir), "%s/s%d", self->scratch, i);
+			while (!stress_deadline(&end)) {
+				if (mkdir(dir, 0755) && errno != EEXIST)
+					_exit(10);
+				if (rmdir(dir) && errno != ENOENT &&
+				    errno != EBUSY)
+					_exit(11);
+			}
+			_exit(0);
+		}
+		pids[n++] = pid;
+	}
+
+	for (i = 0; i < STRESS_READERS; i++) {
+		pid_t pid = fork();
+
+		ASSERT_GE(pid, 0);
+		if (pid == 0) {
+			/* Start each reader on a different directory. */
+			unsigned int seq = i;
+
+			while (!stress_deadline(&end)) {
+				int which = seq++ % STRESS_DIRS;
+				char path[PATH_MAX];
+				struct stat st;
+				int fd;
+
+				snprintf(path, sizeof(path),
+					 "%s/s%d/cgroup.procs",
+					 self->scratch, which);
+
+				if (stat(path, &st) && errno != ENOENT &&
+				    errno != ENODEV)
+					_exit(20);
+
+				fd = open(path, O_RDONLY | O_CLOEXEC);
+				if (fd < 0) {
+					if (errno != ENOENT && errno != ENODEV)
+						_exit(21);
+				} else {
+					close(fd);
+				}
+
+				if (access(path, F_OK) && errno != ENOENT &&
+				    errno != ENODEV)
+					_exit(22);
+			}
+			_exit(0);
+		}
+		pids[n++] = pid;
+	}
+
+	for (i = 0; i < n; i++) {
+		ASSERT_EQ(waitpid(pids[i], &status, 0), pids[i]);
+		ASSERT_TRUE(WIFEXITED(status));
+		EXPECT_EQ(WEXITSTATUS(status), 0);
+	}
+
+	for (i = 0; i < STRESS_DIRS; i++) {
+		char dir[PATH_MAX];
+
+		snprintf(dir, sizeof(dir), "%s/s%d", self->scratch, i);
+		rmdir_retry(dir);
+	}
+}
+
+/*
+ * sysfs is namespace tagged (KERNFS_NS) and supports rename; cgroup2 does
+ * neither.  Run in a private netns with its own sysfs so the host is
+ * untouched.
+ */
+FIXTURE(kernfs_netns)
+{
+	char mnt[PATH_MAX];
+	char net[PATH_MAX];
+	bool mounted;
+};
+
+FIXTURE_SETUP(kernfs_netns)
+{
+	if (geteuid())
+		SKIP(return, "test needs to run as root");
+
+	if (unshare(CLONE_NEWNS | CLONE_NEWNET))
+		SKIP(return, "unshare(CLONE_NEWNS|CLONE_NEWNET): %s",
+		     strerror(errno));
+
+	/* Don't let our sysfs mount escape into the parent namespace. */
+	ASSERT_EQ(mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL), 0);
+
+	strcpy(self->mnt, "/tmp/kernfs_selftest_sysfs.XXXXXX");
+	ASSERT_NE(mkdtemp(self->mnt), NULL);
+
+	if (mount("none", self->mnt, "sysfs", 0, NULL))
+		SKIP(return, "mount sysfs: %s", strerror(errno));
+	self->mounted = true;
+
+	snprintf(self->net, sizeof(self->net), "%s/class/net", self->mnt);
+}
+
+FIXTURE_TEARDOWN(kernfs_netns)
+{
+	if (self->mounted)
+		umount2(self->mnt, MNT_DETACH);
+	rmdir(self->mnt);
+}
+
+/*
+ * sysfs in a new network namespace must show only that namespace's
+ * interfaces.  A fresh netns has exactly one, "lo".
+ */
+TEST_F(kernfs_netns, ns_tag_isolates_class_net)
+{
+	struct dirent *de;
+	int n = 0;
+	DIR *d;
+
+	d = opendir(self->net);
+	ASSERT_NE(d, NULL);
+	while ((de = readdir(d))) {
+		if (!strcmp(de->d_name, ".") || !strcmp(de->d_name, ".."))
+			continue;
+		EXPECT_STREQ(de->d_name, "lo");
+		n++;
+	}
+	closedir(d);
+
+	EXPECT_EQ(n, 1);
+}
+
+/*
+ * After a rename the old name must stop resolving and the new one must
+ * start, even though both dentries are already cached.
+ */
+TEST_F(kernfs_netns, rename_is_revalidated)
+{
+	char old_path[PATH_MAX], new_path[PATH_MAX];
+	struct ifreq ifr = {};
+	struct stat st;
+	int sk;
+
+	snprintf(old_path, sizeof(old_path), "%s/lo", self->net);
+	snprintf(new_path, sizeof(new_path), "%s/%s", self->net, TEST_IFNAME);
+
+	/* Warm both dentries: one positive, one negative. */
+	ASSERT_EQ(stat(old_path, &st), 0);
+	ASSERT_EQ(stat(new_path, &st), -1);
+	ASSERT_EQ(errno, ENOENT);
+
+	sk = socket(AF_INET, SOCK_DGRAM | SOCK_CLOEXEC, 0);
+	ASSERT_GE(sk, 0);
+	strcpy(ifr.ifr_name, "lo");
+	strcpy(ifr.ifr_newname, TEST_IFNAME);
+	if (ioctl(sk, SIOCSIFNAME, &ifr)) {
+		close(sk);
+		SKIP(return, "SIOCSIFNAME: %s", strerror(errno));
+	}
+	close(sk);
+
+	EXPECT_EQ(stat(old_path, &st), -1);
+	EXPECT_EQ(errno, ENOENT);
+	EXPECT_EQ(stat(new_path, &st), 0);
+}
+
+TEST_HARNESS_MAIN
-- 
2.53.0-Meta


Received: from mta1.migadu.com (out-68.mta1.migadu.com [95.215.58.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC94017C203
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 19:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788635796; cv=none; b=ZqPXQnRW08gXmGFy1uTTQX0Ct3SLMY89ZOm/iVmacOcpiBH9gkq+l6IPJDLA9+f/R3Fm7tRQSCTfgsVGJC2G0vtTiLCqMyI1AREp4vA27yuMsGqoVtsiICBTiIt2jZwsJG7CFO+WTdRrH6/QSmQb3tY9B+jo/H1OsMzO7512sgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788635796; c=relaxed/simple;
	bh=M7EdkrcJhqSM7+RxcD+4/cEw0xbBmnI1xssOM5aYOHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cxS+TthwdsXO7621v7zsC7UMO/o03W+0hPpLwvGFvJym7Dd+ydR8ddIbSB9S2vEpcCl2mOFjReDbrWD7uBAphgKV5roUyFWXsM04Ug9C30jyViz6/1PUiQvTLjfrlyezh/T+AiQoOasH536A9fQ/c770+IDwej1LYs79P4NChxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OYktoySk; arc=none smtp.client-ip=95.215.58.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OYktoySk"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M7EdkrcJhqSM7+RxcD+4/cEw0xbBmnI1xssOM5aYOHI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788635791; v=1; x=1789240591;
 b=OYktoySkRDQ5A9tJLGpJa8L1aMhVqRWMnbANe8C1TrCBUaCOxI5KwufICljQoUSXyMNhBL50
 DWw94ojoCvI6nvX81yLfCs8LeT9ZzcFypoGRvPCMIVfrD044je0tHhcbP4Q/DEFd2EPKfD5GgI2
 pevAVyUUsgGtlcLFhzEpkF0Y=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 826c53d273b91ede;
	Sat, 05 Sep 2026 19:16:31 +0000
X-Mizu-Trace-ID: 826c53d273b91ede
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Christian Brauner <christian@brauner.io>
Cc: Meta kernel team <kernel-team@meta.com>,
	linux-kselftest@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] selftests: cover kernfs file handles and same-parent rename
Date: Sat,  5 Sep 2026 12:16:10 -0700
Message-ID: <20260905191613.3143937-2-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260905191613.3143937-1-shakeel.butt@linux.dev>
References: <20260905191613.3143937-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernfs tests only reach kernfs through lookup and readdir.  Two
paths are not covered: file handles, which find a node without a lookup
through its parent, and rename of a node that keeps its parent.

Add three tests:

 - decode a file handle, live and after the node is gone;
 - decode while the node is being removed;
 - look up a name while an interface is renamed, which renames its
   /sys/class/net entry with the parent unchanged.

Two small fixes while here.  ns_tag_isolates_class_net now counts only
symlinks, because bonding adds a bonding_masters attribute that is not a
device.  A failing mkdtemp() now skips instead of aborting.

Assisted-by: LLM
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 tools/testing/selftests/filesystems/config    |   1 +
 .../selftests/filesystems/kernfs_test.c       | 296 +++++++++++++++++-
 2 files changed, 295 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/filesystems/config b/tools/testing/selftests/filesystems/config
index 7231710d5ce7..9f45bc493a30 100644
--- a/tools/testing/selftests/filesystems/config
+++ b/tools/testing/selftests/filesystems/config
@@ -1,5 +1,6 @@
 CONFIG_CGROUPS=y
 CONFIG_CGROUP_PIDS=y
+CONFIG_FHANDLE=y
 CONFIG_NAMESPACES=y
 CONFIG_NET=y
 CONFIG_NET_NS=y
diff --git a/tools/testing/selftests/filesystems/kernfs_test.c b/tools/testing/selftests/filesystems/kernfs_test.c
index 2178428b9665..6e74da91ebca 100644
--- a/tools/testing/selftests/filesystems/kernfs_test.c
+++ b/tools/testing/selftests/filesystems/kernfs_test.c
@@ -610,6 +610,189 @@ TEST_F(kernfs_cgroup, lookup_vs_create_remove_stress)
 	}
 }
 
+struct kernfs_handle {
+	struct file_handle h;
+	unsigned char buf[MAX_HANDLE_SZ];
+};
+
+static int kernfs_encode(const char *path, struct kernfs_handle *fh)
+{
+	int mount_id;
+
+	memset(fh, 0, sizeof(*fh));
+	fh->h.handle_bytes = sizeof(fh->buf);
+	return name_to_handle_at(AT_FDCWD, path, &fh->h, &mount_id, 0);
+}
+
+/*
+ * Skip only where file handles do not work at all.  ENOENT must still
+ * fail: mkdir leaves a negative dentry cached, so the name resolves only
+ * after ->d_revalidate() drops it.  The encode tests revalidation too.
+ */
+static bool fh_unsupported(int err)
+{
+	return err == EOPNOTSUPP || err == EPERM || err == ENOSYS;
+}
+
+/*
+ * Decoding a file needs CAP_DAC_READ_SEARCH in the initial user
+ * namespace.  Probe once so the tests skip instead of fail.
+ */
+static bool fh_can_decode(int mfd, struct kernfs_handle *fh)
+{
+	int fd = open_by_handle_at(mfd, &fh->h, O_PATH);
+
+	if (fd < 0)
+		return errno != EPERM;
+	close(fd);
+	return true;
+}
+
+/*
+ * A file handle reaches a node without a lookup through its parent.  A
+ * live node must decode.  A removed one must not, because
+ * kernfs_find_and_get_node_by_id() refuses inactive nodes.
+ *
+ * Use O_PATH: opening a removed node fails with ENODEV, which would hide
+ * what is being tested.
+ */
+TEST_F(kernfs_cgroup, exportfs_decode_and_stale)
+{
+	char victim[PATH_MAX], procs[PATH_MAX];
+	struct kernfs_handle fh;
+	struct stat st;
+	int mfd, fd;
+
+	snprintf(victim, sizeof(victim), "%s/fh", self->scratch);
+	snprintf(procs, sizeof(procs), "%s/cgroup.procs", victim);
+	ASSERT_EQ(mkdir(victim, 0755), 0);
+
+	/* Any fd on the filesystem identifies it to open_by_handle_at(). */
+	mfd = open(self->scratch, O_RDONLY | O_DIRECTORY | O_CLOEXEC);
+	ASSERT_GE(mfd, 0);
+
+	if (kernfs_encode(procs, &fh)) {
+		int err = errno;
+
+		close(mfd);
+		rmdir(victim);
+		ASSERT_TRUE(fh_unsupported(err))
+			TH_LOG("name_to_handle_at: %s", strerror(err));
+		SKIP(return, "name_to_handle_at: %s", strerror(err));
+	}
+
+	if (!fh_can_decode(mfd, &fh)) {
+		close(mfd);
+		rmdir(victim);
+		SKIP(return, "open_by_handle_at: no CAP_DAC_READ_SEARCH");
+	}
+
+	fd = open_by_handle_at(mfd, &fh.h, O_PATH);
+	ASSERT_GE(fd, 0);
+	EXPECT_EQ(fstat(fd, &st), 0);
+	EXPECT_EQ(st.st_nlink, 1);
+	EXPECT_EQ(close(fd), 0);
+
+	ASSERT_EQ(rmdir(victim), 0);
+
+	fd = open_by_handle_at(mfd, &fh.h, O_PATH);
+	EXPECT_LT(fd, 0);
+	if (fd >= 0)
+		close(fd);
+	else
+		EXPECT_EQ(errno, ESTALE);
+
+	EXPECT_EQ(close(mfd), 0);
+}
+
+#define FH_STRESS_SECS	2
+#define FH_DECODE_CAP	10000
+
+/*
+ * Decode file handles while the node is being removed.  A decode must
+ * answer with a usable handle or ESTALE, never garbage and never a hang.
+ *
+ * The link count is checked too.  An inode that reaches the inode hash
+ * after the removal cleared link counts keeps the 1 it was born with, so
+ * it never gets an IN_DELETE_SELF.  This has not been seen to fire: it
+ * needs the decode to stall between the lookup by id and the hash insert,
+ * and nothing there blocks.  It is kept because it is cheap and only
+ * looks once the directory is gone, so it cannot fail falsely.
+ */
+TEST_F(kernfs_cgroup, exportfs_decode_vs_rmdir_stress)
+{
+	int mfd, bad = 0, rounds = 0;
+	struct timespec end;
+
+	mfd = open(self->scratch, O_RDONLY | O_DIRECTORY | O_CLOEXEC);
+	ASSERT_GE(mfd, 0);
+
+	clock_gettime(CLOCK_MONOTONIC, &end);
+	end.tv_sec += FH_STRESS_SECS;
+
+	while (!stress_deadline(&end)) {
+		char victim[PATH_MAX], procs[PATH_MAX];
+		int last = -1, fd, i;
+		struct kernfs_handle fh;
+		struct stat st;
+		pid_t pid;
+
+		snprintf(victim, sizeof(victim), "%s/fh%d", self->scratch,
+			 rounds++);
+		snprintf(procs, sizeof(procs), "%s/cgroup.procs", victim);
+		if (mkdir(victim, 0755))
+			break;
+		if (kernfs_encode(procs, &fh)) {
+			int err = errno;
+
+			rmdir(victim);
+			ASSERT_TRUE(fh_unsupported(err))
+				TH_LOG("name_to_handle_at: %s", strerror(err));
+			SKIP(goto out, "name_to_handle_at: %s", strerror(err));
+		}
+		if (rounds == 1 && !fh_can_decode(mfd, &fh)) {
+			rmdir(victim);
+			SKIP(goto out,
+			     "open_by_handle_at: no CAP_DAC_READ_SEARCH");
+		}
+
+		pid = fork();
+		ASSERT_GE(pid, 0);
+		if (pid == 0) {
+			rmdir_retry(victim);
+			_exit(0);
+		}
+
+		/*
+		 * Decode until the removal deactivates the node.  Keep the
+		 * last one that worked: it ran closest to the removal.
+		 */
+		for (i = 0; i < FH_DECODE_CAP; i++) {
+			fd = open_by_handle_at(mfd, &fh.h, O_PATH);
+			if (fd < 0)
+				break;
+			if (last >= 0)
+				close(last);
+			last = fd;
+		}
+		ASSERT_EQ(waitpid(pid, NULL, 0), pid);
+
+		if (last >= 0) {
+			if (access(victim, F_OK) && errno == ENOENT &&
+			    !fstat(last, &st) && st.st_nlink != 0)
+				bad++;
+			close(last);
+		}
+		rmdir(victim);
+	}
+
+	EXPECT_EQ(bad, 0)
+		TH_LOG("%d of %d rounds decoded a removed node whose inode kept its link count",
+		       bad, rounds);
+out:
+	close(mfd);
+}
+
 /*
  * sysfs is namespace tagged (KERNFS_NS) and supports rename; cgroup2 does
  * neither.  Run in a private netns with its own sysfs so the host is
@@ -635,7 +818,8 @@ FIXTURE_SETUP(kernfs_netns)
 	ASSERT_EQ(mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL), 0);
 
 	strcpy(self->mnt, "/tmp/kernfs_selftest_sysfs.XXXXXX");
-	ASSERT_NE(mkdtemp(self->mnt), NULL);
+	if (!mkdtemp(self->mnt))
+		SKIP(return, "mkdtemp: %s", strerror(errno));
 
 	if (mount("none", self->mnt, "sysfs", 0, NULL)) {
 		rmdir(self->mnt);
@@ -662,6 +846,9 @@ FIXTURE_TEARDOWN(kernfs_netns)
  * depends on the modules the host has.  Check the set instead --
  * if_nametoindex() resolves in the current netns, so every name sysfs shows
  * must resolve there, and the counts must agree.
+ *
+ * Count only symlinks.  Not every entry is a device: bonding adds a
+ * bonding_masters attribute to /sys/class/net in every namespace.
  */
 TEST_F(kernfs_netns, ns_tag_isolates_class_net)
 {
@@ -674,7 +861,7 @@ TEST_F(kernfs_netns, ns_tag_isolates_class_net)
 	d = opendir(self->net);
 	ASSERT_NE(d, NULL);
 	while ((de = readdir(d))) {
-		if (!strcmp(de->d_name, ".") || !strcmp(de->d_name, ".."))
+		if (de->d_type != DT_LNK)
 			continue;
 		EXPECT_NE(if_nametoindex(de->d_name), 0u)
 			TH_LOG("%s is not in this netns", de->d_name);
@@ -728,4 +915,109 @@ TEST_F(kernfs_netns, rename_is_revalidated)
 	EXPECT_EQ(stat(new_path, &st), 0);
 }
 
+static int netdev_rename(const char *from, const char *to)
+{
+	struct ifreq ifr = {};
+	int sk, ret;
+
+	sk = socket(AF_INET, SOCK_DGRAM | SOCK_CLOEXEC, 0);
+	if (sk < 0)
+		return -1;
+	strncpy(ifr.ifr_name, from, IFNAMSIZ - 1);
+	strncpy(ifr.ifr_newname, to, IFNAMSIZ - 1);
+	ret = ioctl(sk, SIOCSIFNAME, &ifr);
+	close(sk);
+	return ret;
+}
+
+/*
+ * Bounded by a count, not by time: every rename is logged and not rate
+ * limited, so a timed loop would flood the kernel log.
+ */
+#define RENAME_FLIPS		200
+#define RENAME_READERS		4
+
+/*
+ * Rename an interface while other tasks look up the names it moves
+ * between.  This renames its /sys/class/net entry through
+ * kernfs_rename_ns() with the parent unchanged.
+ *
+ * The renamer checks what is certain: SIOCSIFNAME returns once the rename
+ * is done and nothing else renames here, so the new name must resolve and
+ * the old must not.  The readers cannot check that, because the name can
+ * move between their two lstat() calls.  They only check that a lookup
+ * returns success or ENOENT, and keep the lock busy while renames run.
+ *
+ * lstat() not stat(): /sys/class/net/<dev> is a symlink and is renamed
+ * before the directory it points at, so the two are not atomic.
+ */
+TEST_F(kernfs_netns, rename_vs_lookup_stress)
+{
+	char old_path[PATH_MAX], new_path[PATH_MAX];
+	pid_t pids[RENAME_READERS];
+	int i, status, n = 0, bad = 0;
+	struct stat st;
+	int done[2];
+
+	snprintf(old_path, sizeof(old_path), "%s/lo", self->net);
+	snprintf(new_path, sizeof(new_path), "%s/%s", self->net, TEST_IFNAME);
+
+	if (netdev_rename("lo", TEST_IFNAME))
+		SKIP(return, "SIOCSIFNAME: %s", strerror(errno));
+	if (netdev_rename(TEST_IFNAME, "lo"))
+		SKIP(return, "SIOCSIFNAME back: %s", strerror(errno));
+
+	/* Readers run until the renamer closes the write end. */
+	ASSERT_EQ(pipe2(done, O_NONBLOCK | O_CLOEXEC), 0);
+
+	for (i = 0; i < RENAME_READERS; i++) {
+		pid_t pid = fork();
+
+		ASSERT_GE(pid, 0);
+		if (pid == 0) {
+			struct stat rst;
+			char c;
+
+			close(done[1]);
+			while (read(done[0], &c, 1) < 0 && errno == EAGAIN) {
+				if (lstat(old_path, &rst) && errno != ENOENT)
+					_exit(20);
+				if (lstat(new_path, &rst) && errno != ENOENT)
+					_exit(21);
+			}
+			_exit(0);
+		}
+		pids[n++] = pid;
+	}
+	close(done[0]);
+
+	for (i = 0; i < RENAME_FLIPS; i++) {
+		if (netdev_rename("lo", TEST_IFNAME))
+			break;
+		if (lstat(new_path, &st) || !lstat(old_path, &st)) {
+			bad++;
+			break;
+		}
+		if (netdev_rename(TEST_IFNAME, "lo"))
+			break;
+		if (lstat(old_path, &st) || !lstat(new_path, &st)) {
+			bad++;
+			break;
+		}
+	}
+	close(done[1]);
+
+	for (i = 0; i < n; i++) {
+		ASSERT_EQ(waitpid(pids[i], &status, 0), pids[i]);
+		ASSERT_TRUE(WIFEXITED(status));
+		EXPECT_EQ(WEXITSTATUS(status), 0);
+	}
+
+	EXPECT_EQ(bad, 0)
+		TH_LOG("a completed rename left the wrong name resolving");
+
+	/* Leave the interface as the fixture found it. */
+	netdev_rename(TEST_IFNAME, "lo");
+}
+
 TEST_HARNESS_MAIN
-- 
2.53.0-Meta


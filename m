Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E784CE68D
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 11:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767770; cv=none; b=DkJJgqbsK+1pKdBnLjSUmIFAP4hrzQDpkTTkHWBgAWpoZ6xSqNe88LtJo0BhcWx4ly+4iIqMQL7dYoOHCPEp9ppNohQhVhfW3aqY3Cga7DFnmsXqI1fGsprRuaXlUn2BJqL9/h61DpYs6Ia/xrLg0Rhrig5A3862xh0p7wNsPJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767770; c=relaxed/simple;
	bh=9tfCC66xR/mBw9sO0R6mzNjqBXs+Q19kiEO1QkNKVK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tCsMmQVkNx0Qe45Bsnq7ZpA5mEFh2UEKe+tBRh0WQyKktwzCo5jXzu06Alrtj8xvnQRjSSDq2ax8ikpX99Ji/hRu0SfPMNDFiDJtThZTsXVsLeIrQTlooD14cnxP/0vE72crQY9g6KjVNSQmAk4rStsTRmM5yXyXwUNnayXvbIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=lfvxie2z; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="lfvxie2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1790767759; x=1791026959;
	bh=zbino4/7n790rzcUQtAw8KiZcHbAAb5Mkx4WtCtnIjk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lfvxie2zRRVffOlNt6R06mSxHAl9kCdWKUPdt8pInd+P3/Zki6Y4ftygja0yUZHZV
	 1Qzm33xZX/JQBYTWIWF1s27s+o3chvXwvW2XlTYMJbS4ozQfUZ7BtFXOkwEpryKej1
	 TXRsMBnt+XtWUMMQHaTc1qdHCtO8gP3xaWr2jojWNYa8x16dgYFvgKhMjdXzYDqhKS
	 zD8W1JdSlxXeIykOwl/VzWo7MBm/1kk+7E34t+yl8CMHfajCjogMEdE5NGJx25PcAN
	 zHZDwYluGkiwsPynerf/o8hbIq5IKeny0gULVkcVbmJCLcZjoBLyWKms/4ok/QCHSj
	 Ec3t+aYZ5Gw7Q==
X-Pm-Submission-Id: 4hvt9N49mpz2ScPN
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: Christian Brauner <brauner@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Eric W . Biederman" <ebiederm@xmission.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Natasha Klaus <natalie.klaus@runtimeverification.com>
Subject: [PATCH v2 2/2] selftests/namespaces: add uid_map/gid_map range tests
Date: Wed, 30 Sep 2026 14:28:54 +0300
Message-Id: <20260930112854.373184-3-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930112854.373184-1-natalie.klaus@runtimeverification.com>
References: <20260930112854.373184-1-natalie.klaus@runtimeverification.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check that a uid_map or gid_map line with a value that does not fit in
u32, or with a negative value, is rejected with EINVAL and installs
nothing, for each of the three fields.

Check that in-range lines are still accepted and read back unchanged:
a plain single-id mapping, first id 0, the largest valid first id
4294967294, and a line with extra spaces between the fields. When run
as root in the initial user namespace, also check that the largest
count, "0 0 4294967295", is accepted when written by the parent into
the uid_map of a child namespace; an unprivileged writer can only map
a single id.

Signed-off-by: Natasha Klaus <natalie.klaus@runtimeverification.com>
Assisted-by: LLM
---
 tools/testing/selftests/namespaces/.gitignore |   1 +
 tools/testing/selftests/namespaces/Makefile   |   3 +-
 .../selftests/namespaces/uid_map_range_test.c | 299 ++++++++++++++++++
 3 files changed, 302 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/namespaces/uid_map_range_test.c

diff --git a/tools/testing/selftests/namespaces/.gitignore b/tools/testing/selftests/namespaces/.gitignore
index 0989e80da457..995b082357fa 100644
--- a/tools/testing/selftests/namespaces/.gitignore
+++ b/tools/testing/selftests/namespaces/.gitignore
@@ -10,3 +10,4 @@ cred_change_test
 stress_test
 listns_pagination_bug
 regression_pidfd_setns_test
+uid_map_range_test
diff --git a/tools/testing/selftests/namespaces/Makefile b/tools/testing/selftests/namespaces/Makefile
index fbb821652c17..9b22d12708e1 100644
--- a/tools/testing/selftests/namespaces/Makefile
+++ b/tools/testing/selftests/namespaces/Makefile
@@ -13,7 +13,8 @@ TEST_GEN_PROGS := nsid_test \
 		  cred_change_test \
 		  stress_test \
 		  listns_pagination_bug \
-		  regression_pidfd_setns_test
+		  regression_pidfd_setns_test \
+		  uid_map_range_test
 
 include ../lib.mk
 
diff --git a/tools/testing/selftests/namespaces/uid_map_range_test.c b/tools/testing/selftests/namespaces/uid_map_range_test.c
new file mode 100644
index 000000000000..1eba1e609205
--- /dev/null
+++ b/tools/testing/selftests/namespaces/uid_map_range_test.c
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <sched.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/wait.h>
+#include <unistd.h>
+#include "../kselftest_harness.h"
+
+/*
+ * The fields of a uid_map/gid_map line are stored in u32. Values that
+ * do not fit, and negative values, must be rejected with EINVAL instead
+ * of being silently truncated, and in-range values must still be
+ * accepted.
+ */
+
+static int write_file(const char *path, const char *buf)
+{
+	ssize_t len = strlen(buf);
+	ssize_t ret;
+	int fd;
+
+	fd = open(path, O_WRONLY | O_CLOEXEC);
+	if (fd < 0)
+		return -errno;
+	ret = write(fd, buf, len);
+	if (ret < 0)
+		ret = -errno;
+	close(fd);
+	if (ret < 0)
+		return ret;
+	return ret == len ? 0 : -EIO;
+}
+
+static ssize_t read_file(const char *path, char *buf, size_t size)
+{
+	ssize_t ret;
+	int fd;
+
+	fd = open(path, O_RDONLY | O_CLOEXEC);
+	if (fd < 0)
+		return -errno;
+	ret = read(fd, buf, size - 1);
+	if (ret < 0)
+		ret = -errno;
+	else
+		buf[ret] = '\0';
+	close(fd);
+	return ret;
+}
+
+/* Enter a fresh user namespace, remembering the outer ids. */
+static int enter_userns(uid_t *uid, gid_t *gid)
+{
+	*uid = geteuid();
+	*gid = getegid();
+	if (unshare(CLONE_NEWUSER) < 0)
+		return -errno;
+	/* Required before an unprivileged gid_map write. */
+	return write_file("/proc/self/setgroups", "deny");
+}
+
+static void expect_rejected(struct __test_metadata *_metadata,
+			    const char *path, const char *line)
+{
+	char buf[256];
+
+	TH_LOG("writing \"%s\" to %s", line, path);
+	EXPECT_EQ(write_file(path, line), -EINVAL);
+	/* Nothing may have been installed. */
+	EXPECT_EQ(read_file(path, buf, sizeof(buf)), 0) {
+		TH_LOG("installed: %s", buf);
+	}
+}
+
+static void expect_accepted(struct __test_metadata *_metadata,
+			    const char *path, const char *line,
+			    unsigned int first, unsigned int lower_first,
+			    unsigned int count)
+{
+	unsigned int f, l, c;
+	char buf[256];
+
+	TH_LOG("writing \"%s\" to %s", line, path);
+	ASSERT_EQ(write_file(path, line), 0);
+
+	ASSERT_GT(read_file(path, buf, sizeof(buf)), 0);
+	ASSERT_EQ(sscanf(buf, "%u %u %u", &f, &l, &c), 3);
+	EXPECT_EQ(f, first);
+	EXPECT_EQ(l, lower_first);
+	EXPECT_EQ(c, count);
+	/* Exactly one extent. */
+	EXPECT_EQ(strchr(buf, '\n'), buf + strlen(buf) - 1);
+}
+
+TEST(uid_map_first_above_u32)
+{
+	char line[64];
+	uid_t uid;
+	gid_t gid;
+	int ret;
+
+	ret = enter_userns(&uid, &gid);
+	if (ret)
+		SKIP(return, "cannot set up user namespace: %s", strerror(-ret));
+	snprintf(line, sizeof(line), "4294967301 %u 1", uid);
+	expect_rejected(_metadata, "/proc/self/uid_map", line);
+}
+
+TEST(uid_map_lower_first_above_u32)
+{
+	char line[64];
+	uid_t uid;
+	gid_t gid;
+	int ret;
+
+	ret = enter_userns(&uid, &gid);
+	if (ret)
+		SKIP(return, "cannot set up user namespace: %s", strerror(-ret));
+	snprintf(line, sizeof(line), "0 %llu 1", (1ULL << 32) + uid);
+	expect_rejected(_metadata, "/proc/self/uid_map", line);
+}
+
+TEST(uid_map_count_above_u32)
+{
+	char line[64];
+	uid_t uid;
+	gid_t gid;
+	int ret;
+
+	ret = enter_userns(&uid, &gid);
+	if (ret)
+		SKIP(return, "cannot set up user namespace: %s", strerror(-ret));
+	snprintf(line, sizeof(line), "0 %u 4294967297", uid);
+	expect_rejected(_metadata, "/proc/self/uid_map", line);
+}
+
+TEST(gid_map_first_above_u32)
+{
+	char line[64];
+	uid_t uid;
+	gid_t gid;
+	int ret;
+
+	ret = enter_userns(&uid, &gid);
+	if (ret)
+		SKIP(return, "cannot set up user namespace: %s", strerror(-ret));
+	snprintf(line, sizeof(line), "4294967301 %u 1", gid);
+	expect_rejected(_metadata, "/proc/self/gid_map", line);
+}
+
+TEST(uid_map_first_negative)
+{
+	char line[64];
+	uid_t uid;
+	gid_t gid;
+	int ret;
+
+	ret = enter_userns(&uid, &gid);
+	if (ret)
+		SKIP(return, "cannot set up user namespace: %s", strerror(-ret));
+	snprintf(line, sizeof(line), "-1 %u 1", uid);
+	expect_rejected(_metadata, "/proc/self/uid_map", line);
+}
+
+TEST(uid_map_lower_first_negative)
+{
+	uid_t uid;
+	gid_t gid;
+	int ret;
+
+	ret = enter_userns(&uid, &gid);
+	if (ret)
+		SKIP(return, "cannot set up user namespace: %s", strerror(-ret));
+	expect_rejected(_metadata, "/proc/self/uid_map", "0 -1 1");
+}
+
+TEST(uid_map_count_negative)
+{
+	char line[64];
+	uid_t uid;
+	gid_t gid;
+	int ret;
+
+	ret = enter_userns(&uid, &gid);
+	if (ret)
+		SKIP(return, "cannot set up user namespace: %s", strerror(-ret));
+	snprintf(line, sizeof(line), "0 %u -1", uid);
+	expect_rejected(_metadata, "/proc/self/uid_map", line);
+}
+
+TEST(uid_map_in_range)
+{
+	char line[64];
+	uid_t uid;
+	gid_t gid;
+	int ret;
+
+	ret = enter_userns(&uid, &gid);
+	if (ret)
+		SKIP(return, "cannot set up user namespace: %s", strerror(-ret));
+	snprintf(line, sizeof(line), "5 %u 1", uid);
+	expect_accepted(_metadata, "/proc/self/uid_map", line, 5, uid, 1);
+}
+
+TEST(uid_map_zero)
+{
+	char line[64];
+	uid_t uid;
+	gid_t gid;
+	int ret;
+
+	ret = enter_userns(&uid, &gid);
+	if (ret)
+		SKIP(return, "cannot set up user namespace: %s", strerror(-ret));
+	snprintf(line, sizeof(line), "0 %u 1", uid);
+	expect_accepted(_metadata, "/proc/self/uid_map", line, 0, uid, 1);
+}
+
+/* 4294967295 is (u32)-1, which map_write() refuses as a starting id. */
+TEST(uid_map_largest_first)
+{
+	char line[64];
+	uid_t uid;
+	gid_t gid;
+	int ret;
+
+	ret = enter_userns(&uid, &gid);
+	if (ret)
+		SKIP(return, "cannot set up user namespace: %s", strerror(-ret));
+	snprintf(line, sizeof(line), "4294967294 %u 1", uid);
+	expect_accepted(_metadata, "/proc/self/uid_map", line,
+			4294967294U, uid, 1);
+}
+
+TEST(uid_map_extra_spaces)
+{
+	char line[64];
+	uid_t uid;
+	gid_t gid;
+	int ret;
+
+	ret = enter_userns(&uid, &gid);
+	if (ret)
+		SKIP(return, "cannot set up user namespace: %s", strerror(-ret));
+	snprintf(line, sizeof(line), "0   %u  1", uid);
+	expect_accepted(_metadata, "/proc/self/uid_map", line, 0, uid, 1);
+}
+
+/*
+ * An unprivileged writer may only map a single id, so the largest count
+ * needs a privileged parent writing the map of a child namespace. With
+ * first and lower_first 0, the no-wrap rule allows up to 4294967295.
+ */
+TEST(uid_map_largest_count)
+{
+	unsigned int first, lower_first, count;
+	int to_child[2], from_child[2];
+	char path[64], buf[256];
+	pid_t pid;
+	char c;
+
+	if (geteuid() != 0)
+		SKIP(return, "needs root in the initial user namespace");
+	ASSERT_GT(read_file("/proc/self/uid_map", buf, sizeof(buf)), 0);
+	ASSERT_EQ(sscanf(buf, "%u %u %u", &first, &lower_first, &count), 3);
+	if (first != 0 || lower_first != 0 || count != 4294967295U)
+		SKIP(return, "not in the initial user namespace");
+
+	ASSERT_EQ(pipe(to_child), 0);
+	ASSERT_EQ(pipe(from_child), 0);
+	pid = fork();
+	ASSERT_GE(pid, 0);
+	if (pid == 0) {
+		close(to_child[1]);
+		close(from_child[0]);
+		c = unshare(CLONE_NEWUSER) ? 'F' : 'K';
+		if (write(from_child[1], &c, 1) != 1)
+			_exit(1);
+		/* Stay alive until the parent is done with our uid_map. */
+		if (read(to_child[0], &c, 1) < 0)
+			_exit(1);
+		_exit(0);
+	}
+	close(to_child[0]);
+	close(from_child[1]);
+
+	ASSERT_EQ(read(from_child[0], &c, 1), 1);
+	ASSERT_EQ(c, 'K');
+	snprintf(path, sizeof(path), "/proc/%d/uid_map", pid);
+	expect_accepted(_metadata, path, "0 0 4294967295", 0, 0, 4294967295U);
+
+	close(to_child[1]);
+	EXPECT_EQ(waitpid(pid, NULL, 0), pid);
+}
+
+TEST_HARNESS_MAIN
-- 
2.34.1


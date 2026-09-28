Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE9A459AE0
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 07:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580381; cv=none; b=eBjN9Ya5ZoPEae2HhBrNWpDGHmy3WMSe8UYvcBphgzENWYW5xVBf4RK/V7bDrRBz3m+Tu0zY/1uKpjXWLiZpc7olgnB9vv2rTreyogVx2hG8fhQ6/2lELYdah4WYanLJXfjhxmJjeEsxbuHV0l75J4R1KSNHpHkxVPkpnBNJreM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580381; c=relaxed/simple;
	bh=g1mh52GslLFu/bYNUPE7pddv6EiDzRY152mH6+1sVJA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aNdPUWa3jc4iVPpQQXp1LdXgRgZkUNEqTNcljDtsR5HEAlO33SAgMlaEc88GJ1gMDcnVFKauXRqY9QycNy8Wvn4ejipCWgPEItfftN0xOWtgLfMmzatSEEg3awp2CBrxoCe4JmPzvoPsSrZMQtQkyFup53UEvQloLxSj5UdjFtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=PcGm1Tsv; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="PcGm1Tsv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1790580375; x=1790839575;
	bh=9f0bMQYix9ionzVk8R/TO0cHghsrpmHa1wjIrwMGGUY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PcGm1Tsv5apu3iOZYHChNlUkadmmZOVfM6wc/KY62BNyxZaAZZWanLcFh/PmVu0r2
	 Typ9ZIxfJIjotoBrYtjqi1QBMhz+NrRWsQBi1RPTOL7bBn2lFg1q0XuxtfYFF7IzqG
	 WxBtnmxfu6wRObtPWjuuhzpdc9XF1HZUCRoVh9VP6AB6HoD2gI/HkKMwlQacxx1NwE
	 LBjISflOuUYWLBx3YgeQZ4L5SziBZvi3HC4iK9W/FHndSFfYlOQeDu7C4WdTS2/Z0c
	 z8+UNDBCjdWSCoRIsfVB2pKooTYr38Bgq0O7iFIsmqUtFlcq7HVK2qr42uq9wBy4Ss
	 Hqv6rxvyCvxJA==
X-Pm-Submission-Id: 4htXss2tNyz2Scpc
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: Christian Brauner <brauner@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Eric W . Biederman" <ebiederm@xmission.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Natasha Klaus <natalie.klaus@runtimeverification.com>
Subject: [PATCH 2/2] selftests/namespaces: add uid_map/gid_map range tests
Date: Mon, 28 Sep 2026 10:25:37 +0300
Message-Id: <20260928072537.115668-3-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928072537.115668-1-natalie.klaus@runtimeverification.com>
References: <20260928072537.115668-1-natalie.klaus@runtimeverification.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check that a uid_map or gid_map line with a value that does not fit in
u32 is rejected with EINVAL and installs nothing, for each of the three
fields, and that an in-range line is still accepted and reads back
unchanged.

Signed-off-by: Natasha Klaus <natalie.klaus@runtimeverification.com>
Assisted-by: LLM
---
 tools/testing/selftests/namespaces/.gitignore |   1 +
 tools/testing/selftests/namespaces/Makefile   |   3 +-
 .../selftests/namespaces/uid_map_range_test.c | 155 ++++++++++++++++++
 3 files changed, 158 insertions(+), 1 deletion(-)
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
index 000000000000..9da02005a09c
--- /dev/null
+++ b/tools/testing/selftests/namespaces/uid_map_range_test.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <sched.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include "../kselftest_harness.h"
+
+/*
+ * The fields of a uid_map/gid_map line are stored in u32. Values that
+ * do not fit must be rejected with EINVAL instead of being silently
+ * truncated modulo 2^32, and in-range values must still be accepted.
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
+TEST(uid_map_in_range)
+{
+	unsigned int first, lower_first, count;
+	char line[64], buf[256];
+	uid_t uid;
+	gid_t gid;
+	int ret;
+
+	ret = enter_userns(&uid, &gid);
+	if (ret)
+		SKIP(return, "cannot set up user namespace: %s", strerror(-ret));
+	snprintf(line, sizeof(line), "5 %u 1", uid);
+	ASSERT_EQ(write_file("/proc/self/uid_map", line), 0);
+
+	ASSERT_GT(read_file("/proc/self/uid_map", buf, sizeof(buf)), 0);
+	ASSERT_EQ(sscanf(buf, "%u %u %u", &first, &lower_first, &count), 3);
+	EXPECT_EQ(first, 5U);
+	EXPECT_EQ(lower_first, uid);
+	EXPECT_EQ(count, 1U);
+	/* Exactly one extent. */
+	EXPECT_EQ(strchr(buf, '\n'), buf + strlen(buf) - 1);
+}
+
+TEST_HARNESS_MAIN
-- 
2.34.1


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D5D34D39B;
	Fri, 13 Feb 2026 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770974656; cv=none; b=Myl3+tW+PK1GmIM/zNL6wpaT1FmgBW3Ea8XUpZXUeGYmPoGsPGmPqIc6O7NX2iuDwFv6q0xsJ1YTBPrLMC1Ot/d/lKnM4YWPrIcW7G4AFqdw7/e02CuMZtC679iUQ46pJpfqN1nwKfESWI6PpMssnVOVLqWYg2mHILc/pj0jUL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770974656; c=relaxed/simple;
	bh=Ak8hfMOZavwchltTI3TV68o5Ux6Q01OmX029MilE3lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=buyC1EuKkX3G+xXqydQnKeqVqrXZqBsLXlZgZAB4QhiuipGf+d6NaUF++r0O+obBiyIzSsm/E53NqmffP2PzrMhyKmr+im/uSGFUP93g3x0D+bQjmfjX8JQcrnmWt2eTGz1hRenG6RaWVCyZ60gS6PYP6kJqHgaPWbWRUc5HM40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVndG1kh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVndG1kh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74B4C19421;
	Fri, 13 Feb 2026 09:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770974656;
	bh=Ak8hfMOZavwchltTI3TV68o5Ux6Q01OmX029MilE3lk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tVndG1khWnzR5XFM2oRr5cNmxFjRJiecn2vfHhlCzASAlG5tZmTdSAvkEmUJ7WtR2
	 eXPopeeNiZhHwW7kQwCetgk7b7LKrITb+VYfKJJkGuPzdZMjHRpzmGDIrki6pU55aG
	 p3Xt+eII1tF1G0nEpG3MNzOHQgq95tFXwlL3WJnG89eYCIY36OS8emikW1AHdRoD7B
	 xrDZBTNOa5DEU6NRnbFY7cgLQ84n6fbqWfrMqFFooo6x9EKEiyJyVyr6UZXLWDHl9g
	 /hSxk60QBnQLiCKx/61hYMO2Naj3qUkQ2PkTrOuEbPT5yWQjPgzKZE9QUJK0lt7zfW
	 xERKpL6wz8B1w==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v8 3/3] selftests: revocable: Add kselftest cases
Date: Fri, 13 Feb 2026 09:23:07 +0000
Message-ID: <20260213092307.858908-4-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
In-Reply-To: <20260213092307.858908-1-tzungbi@kernel.org>
References: <20260213092307.858908-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add kselftest cases for the revocable API.

The test consists of three parts:
- A kernel module (revocable_test.ko) that creates a debugfs file.
- A user-space C program (revocable_test) that uses the kselftest
  harness to interact with the debugfs file.
- An orchestrating shell script (test-revocable.sh) that loads the
  module, runs the C program, and unloads the module.

The test cases cover the following scenarios:
- Basic: Verifies that a consumer can successfully access the resource.
- Revocation: Verifies that after the provider revokes the resource,
  the consumer correctly receives a NULL pointer on a subsequent access.
- Try Access Macro: Same as "Revocation" but uses the macro level
  helpers.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v8:
- Squash:
  - 4d7dc4d1a62d revocable: Fix races in revocable_alloc() using RCU
  - 377563ce0653 revocable: fix SRCU index corruption by requiring caller-provided storage
- Change accordingly due to its dependency "revocable: Revocable resource
  management" changes.
- Move:
  - tools/testing/selftests/drivers/base/revocable/ ->
    tools/testing/selftests/revocable/.

v7: https://lore.kernel.org/all/20260116080235.350305-4-tzungbi@kernel.org
- "2025" -> "2026" in copyright.
- Rename the test name "macro" -> "try_access_macro".

v6: https://lore.kernel.org/chrome-platform/20251106152330.11733-4-tzungbi@kernel.org
- Rename REVOCABLE_TRY_ACCESS_WITH() -> REVOCABLE_TRY_ACCESS_SCOPED().
- Add tests for new REVOCABLE_TRY_ACCESS_WITH().

v5: https://lore.kernel.org/chrome-platform/20251016054204.1523139-4-tzungbi@kernel.org
- No changes.

v4: https://lore.kernel.org/chrome-platform/20250923075302.591026-4-tzungbi@kernel.org
- REVOCABLE() -> REVOCABLE_TRY_ACCESS_WITH().
- revocable_release() -> revocable_withdraw_access().

v3: https://lore.kernel.org/chrome-platform/20250912081718.3827390-4-tzungbi@kernel.org
- No changes.

v2: https://lore.kernel.org/chrome-platform/20250820081645.847919-4-tzungbi@kernel.org
- New in the series.

 MAINTAINERS                                   |   1 +
 tools/testing/selftests/revocable/Makefile    |   7 +
 .../selftests/revocable/revocable_test.c      | 177 +++++++++++++
 .../selftests/revocable/revocable_test.h      |  20 ++
 .../selftests/revocable/test-revocable.sh     |  34 +++
 .../selftests/revocable/test_modules/Makefile |  10 +
 .../revocable/test_modules/revocable_test.c   | 234 ++++++++++++++++++
 7 files changed, 483 insertions(+)
 create mode 100644 tools/testing/selftests/revocable/Makefile
 create mode 100644 tools/testing/selftests/revocable/revocable_test.c
 create mode 100644 tools/testing/selftests/revocable/revocable_test.h
 create mode 100755 tools/testing/selftests/revocable/test-revocable.sh
 create mode 100644 tools/testing/selftests/revocable/test_modules/Makefile
 create mode 100644 tools/testing/selftests/revocable/test_modules/revocable_test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6ce7a5477f25..76816c741017 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22416,6 +22416,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
 F:	drivers/base/revocable.c
 F:	drivers/base/revocable_test.c
 F:	include/linux/revocable.h
+F:	tools/testing/selftests/revocable/
 
 RFKILL
 M:	Johannes Berg <johannes@sipsolutions.net>
diff --git a/tools/testing/selftests/revocable/Makefile b/tools/testing/selftests/revocable/Makefile
new file mode 100644
index 000000000000..a986ad50200a
--- /dev/null
+++ b/tools/testing/selftests/revocable/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+TEST_GEN_MODS_DIR := test_modules
+TEST_GEN_PROGS_EXTENDED := revocable_test
+TEST_PROGS := test-revocable.sh
+
+include ../lib.mk
diff --git a/tools/testing/selftests/revocable/revocable_test.c b/tools/testing/selftests/revocable/revocable_test.c
new file mode 100644
index 000000000000..2e90de210d9c
--- /dev/null
+++ b/tools/testing/selftests/revocable/revocable_test.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 Google LLC
+ *
+ * A selftest for the revocable API.
+ *
+ * The test cases cover the following scenarios:
+ *
+ * - Basic: Verifies that a consumer can successfully access the resource.
+ *
+ * - Revocation: Verifies that after the provider revokes the resource,
+ *   the consumer correctly receives a NULL pointer on a subsequent access.
+ *
+ * - Try Access Macro: Same as "Revocation" but uses the macro level
+ *   helpers.
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <unistd.h>
+
+#include "revocable_test.h"
+
+#include "../kselftest_harness.h"
+
+#define DEBUGFS_PATH "/sys/kernel/debug/revocable_test"
+
+FIXTURE(revocable_fixture) {
+	int fd;
+	char data[16];
+};
+
+FIXTURE_SETUP(revocable_fixture) {
+	int ret;
+
+	self->fd = open(DEBUGFS_PATH, O_RDWR);
+	ASSERT_NE(-1, self->fd)
+		TH_LOG("failed to open fd");
+}
+
+FIXTURE_TEARDOWN(revocable_fixture) {
+	close(self->fd);
+}
+
+/*
+ * ASSERT_* is only available in TEST or TEST_F block.  Use
+ * macro for the helper.
+ */
+#define READ_TEST_DATA_MSG(_offset, _msg)				\
+	do {								\
+		int ret;						\
+									\
+		ret = lseek(self->fd, _offset, SEEK_SET);		\
+		ASSERT_NE(-1, ret)					\
+			TH_LOG("failed to lseek");			\
+									\
+		ret = read(self->fd, self->data, sizeof(self->data)-1); \
+		ASSERT_NE(-1, ret)					\
+			TH_LOG("failed to read test data" _msg);	\
+		self->data[ret] = '\0';					\
+	} while (0)
+
+#define READ_TEST_DATA(_offset)						\
+	READ_TEST_DATA_MSG(_offset, "")
+
+#define READ_TEST_DATA_ERR(_offset)					\
+	do {								\
+		int ret;						\
+									\
+		ret = lseek(self->fd, _offset, SEEK_SET);		\
+		ASSERT_NE(-1, ret)					\
+			TH_LOG("failed to lseek");			\
+									\
+		ret = read(self->fd, self->data, sizeof(self->data)-1); \
+		EXPECT_EQ(-1, ret);					\
+	} while (0)
+
+#define SIGNAL_RESOURCE_GONE()						\
+	do {								\
+		int ret;						\
+									\
+		ret = write(self->fd, "", 0);				\
+		ASSERT_NE(-1, ret)					\
+			TH_LOG("failed to signal resource is gone");	\
+	} while (0)
+
+TEST_F(revocable_fixture, basic) {
+	READ_TEST_DATA(TEST_MAGIC_OFFSET_RAW);
+	EXPECT_STREQ(TEST_DATA, self->data);
+}
+
+TEST_F(revocable_fixture, revocation) {
+	const int offset = TEST_MAGIC_OFFSET_RAW;
+
+	READ_TEST_DATA(offset);
+	EXPECT_STREQ(TEST_DATA, self->data);
+
+	SIGNAL_RESOURCE_GONE();
+
+	READ_TEST_DATA_MSG(offset, " after resource gone");
+	EXPECT_STREQ(TEST_DATA_NULL, self->data);
+}
+
+TEST_F(revocable_fixture, try_access_macro1) {
+	const int offset = TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_WITH;
+
+	READ_TEST_DATA(offset);
+	EXPECT_STREQ(TEST_DATA, self->data);
+
+	SIGNAL_RESOURCE_GONE();
+
+	READ_TEST_DATA_MSG(offset, " after resource gone");
+	EXPECT_STREQ(TEST_DATA_NULL, self->data);
+}
+
+TEST_F(revocable_fixture, try_access_macro2) {
+	const int offset = TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_OR_RETURN_ERR;
+
+	READ_TEST_DATA(offset);
+	EXPECT_STREQ(TEST_DATA, self->data);
+
+	SIGNAL_RESOURCE_GONE();
+
+	READ_TEST_DATA_ERR(offset);
+	EXPECT_EQ(ENXIO, errno);
+}
+
+TEST_F(revocable_fixture, try_access_macro3) {
+	const int offset = TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_OR_RETURN;
+
+	READ_TEST_DATA(offset);
+	EXPECT_STREQ(TEST_DATA, self->data);
+
+	SIGNAL_RESOURCE_GONE();
+
+	READ_TEST_DATA_ERR(offset);
+	EXPECT_EQ(ENODEV, errno);
+}
+
+TEST_F(revocable_fixture, try_access_macro4) {
+	const int offset = TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_WITH_SCOPED;
+
+	READ_TEST_DATA(offset);
+	EXPECT_STREQ(TEST_DATA, self->data);
+
+	SIGNAL_RESOURCE_GONE();
+
+	READ_TEST_DATA_MSG(offset, " after resource gone");
+	EXPECT_STREQ(TEST_DATA_NULL, self->data);
+}
+
+TEST_F(revocable_fixture, try_access_macro5) {
+	const int offset =
+		TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_OR_RETURN_ERR_SCOPED;
+
+	READ_TEST_DATA(offset);
+	EXPECT_STREQ(TEST_DATA, self->data);
+
+	SIGNAL_RESOURCE_GONE();
+
+	READ_TEST_DATA_ERR(offset);
+	EXPECT_EQ(ENXIO, errno);
+}
+
+TEST_F(revocable_fixture, try_access_macro6) {
+	const int offset = TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_OR_RETURN_SCOPED;
+
+	READ_TEST_DATA(offset);
+	EXPECT_STREQ(TEST_DATA, self->data);
+
+	SIGNAL_RESOURCE_GONE();
+
+	READ_TEST_DATA_ERR(offset);
+	EXPECT_EQ(ENODEV, errno);
+}
+
+TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/revocable/revocable_test.h b/tools/testing/selftests/revocable/revocable_test.h
new file mode 100644
index 000000000000..270b456ef7d9
--- /dev/null
+++ b/tools/testing/selftests/revocable/revocable_test.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2026 Google LLC
+ */
+
+#ifndef __REVOCABLE_TEST_H
+#define __REVOCABLE_TEST_H
+
+#define TEST_DATA	"12345678"
+#define TEST_DATA_NULL	"(null)"
+
+#define TEST_MAGIC_OFFSET_RAW					0x0
+#define TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_WITH			0x1
+#define TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_OR_RETURN_ERR	0x2
+#define TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_OR_RETURN		0x3
+#define TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_WITH_SCOPED		0x4
+#define TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_OR_RETURN_ERR_SCOPED	0x5
+#define TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_OR_RETURN_SCOPED	0x6
+
+#endif /* __REVOCABLE_TEST_H */
diff --git a/tools/testing/selftests/revocable/test-revocable.sh b/tools/testing/selftests/revocable/test-revocable.sh
new file mode 100755
index 000000000000..0cfc26a1c49a
--- /dev/null
+++ b/tools/testing/selftests/revocable/test-revocable.sh
@@ -0,0 +1,34 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+mod_name="revocable_test"
+ksft_fail=1
+ksft_skip=4
+
+if [ "$(id -u)" -ne 0 ]; then
+	echo "$0: Must be run as root"
+	exit "$ksft_skip"
+fi
+
+if ! which insmod > /dev/null 2>&1; then
+	echo "$0: Need insmod"
+	exit "$ksft_skip"
+fi
+
+if ! which rmmod > /dev/null 2>&1; then
+	echo "$0: Need rmmod"
+	exit "$ksft_skip"
+fi
+
+if ! mountpoint -q /sys/kernel/debug; then
+	mount -t debugfs none /sys/kernel/debug
+fi
+
+insmod test_modules/"${mod_name}".ko
+
+./revocable_test
+ret=$?
+
+rmmod "${mod_name}"
+
+exit "${ret}"
diff --git a/tools/testing/selftests/revocable/test_modules/Makefile b/tools/testing/selftests/revocable/test_modules/Makefile
new file mode 100644
index 000000000000..f29e4f909402
--- /dev/null
+++ b/tools/testing/selftests/revocable/test_modules/Makefile
@@ -0,0 +1,10 @@
+TESTMODS_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
+KDIR ?= /lib/modules/$(shell uname -r)/build
+
+obj-m += revocable_test.o
+
+all:
+	$(Q)$(MAKE) -C $(KDIR) M=$(TESTMODS_DIR)
+
+clean:
+	$(Q)$(MAKE) -C $(KDIR) M=$(TESTMODS_DIR) clean
diff --git a/tools/testing/selftests/revocable/test_modules/revocable_test.c b/tools/testing/selftests/revocable/test_modules/revocable_test.c
new file mode 100644
index 000000000000..b2914c7b4ef5
--- /dev/null
+++ b/tools/testing/selftests/revocable/test_modules/revocable_test.c
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 Google LLC
+ *
+ * A kernel module for testing the revocable API.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/module.h>
+#include <linux/revocable.h>
+#include <linux/slab.h>
+
+#include "../revocable_test.h"
+
+struct dentry *test_file;
+
+struct revocable_test_priv {
+	struct revocable *rp;
+	char res[16];
+};
+
+/*
+ * This creates a revocable provider.
+ */
+static int revocable_test_open(struct inode *inode, struct file *filp)
+{
+	struct revocable_test_priv *priv;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	strscpy(priv->res, TEST_DATA);
+	priv->rp = revocable_alloc(&priv->res);
+	if (!priv->rp)
+		return -ENOMEM;
+
+	filp->private_data = priv;
+	return 0;
+}
+
+static int revocable_test_release(struct inode *inode,
+					   struct file *filp)
+{
+	struct revocable_test_priv *priv = filp->private_data;
+	bool revoked = true;
+	void *res;
+
+	revocable_try_access_or_skip_scoped(priv->rp, res)
+		revoked = false;
+	if (!revoked)
+		revocable_revoke(priv->rp);
+
+	revocable_put(priv->rp);
+
+	kfree(priv);
+	return 0;
+}
+
+/*
+ * This revokes the resource.  Here is a side command channel.
+ *
+ * The test can't just close the file descriptor for signaling the
+ * resource is gone.  Subsequent file operations on the open file
+ * descriptor of debugfs return -EIO after calling debugfs_remove().
+ * See also debugfs_file_get().
+ */
+static ssize_t revocable_test_write(struct file *filp, const char __user *buf,
+				    size_t count, loff_t *offset)
+{
+	size_t copied;
+	char data[64];
+	struct revocable_test_priv *priv = filp->private_data;
+	bool revoked = true;
+	void *res;
+
+	revocable_try_access_or_skip_scoped(priv->rp, res)
+		revoked = false;
+	if (revoked)
+		return -EINVAL;
+
+	copied = strncpy_from_user(data, buf, sizeof(data));
+	if (copied < 0)
+		return copied;
+
+	revocable_revoke(priv->rp);
+	return copied;
+}
+
+static void copy_resource_data(char *data, size_t len, char *res)
+{
+	if (!res)
+		strscpy(data, TEST_DATA_NULL, len);
+	else
+		strscpy(data, res, len);
+}
+
+static int call_revocable_try_access_or_return_err(struct revocable *rp,
+						   char *data, size_t len)
+{
+	char *res;
+
+	revocable_try_access_or_return_err(rp, res, -ENXIO);
+	copy_resource_data(data, len, res);
+	return 0;
+}
+
+static int call_revocable_try_access_or_return(struct revocable *rp,
+					       char *data, size_t len)
+{
+	char *res;
+
+	revocable_try_access_or_return(rp, res);
+	copy_resource_data(data, len, res);
+	return 0;
+}
+
+static int call_revocable_try_access_or_return_err_scoped(struct revocable *rp,
+							  char *data,
+							  size_t len)
+{
+	char *res;
+
+	revocable_try_access_or_return_err_scoped(rp, res, -ENXIO)
+		copy_resource_data(data, len, res);
+	return 0;
+}
+
+static int call_revocable_try_access_or_return_scoped(struct revocable *rp,
+						      char *data, size_t len)
+{
+	char *res;
+
+	revocable_try_access_or_return_scoped(rp, res)
+		copy_resource_data(data, len, res);
+	return 0;
+}
+
+/*
+ * This creates a revocable consumer and returns the resource value.
+ */
+static ssize_t revocable_test_read(struct file *filp, char __user *buf,
+				   size_t count, loff_t *offset)
+{
+	char *res;
+	char data[16];
+	size_t len;
+	int ret;
+	struct revocable_test_priv *priv = filp->private_data;
+
+	switch (*offset) {
+	case TEST_MAGIC_OFFSET_RAW:
+		{
+			struct revocable_consumer rev;
+
+			revocable_init(priv->rp, &rev);
+			res = revocable_try_access(&rev);
+			copy_resource_data(data, sizeof(data), res);
+			revocable_withdraw_access(&rev);
+			revocable_deinit(&rev);
+		}
+		break;
+	case TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_WITH:
+		{
+			revocable_try_access_with(priv->rp, res);
+			copy_resource_data(data, sizeof(data), res);
+		}
+		break;
+	case TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_OR_RETURN_ERR:
+		ret = call_revocable_try_access_or_return_err(priv->rp, data,
+							      sizeof(data));
+		if (ret)
+			return ret;
+		break;
+	case TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_OR_RETURN:
+		ret = call_revocable_try_access_or_return(priv->rp, data,
+							  sizeof(data));
+		if (ret)
+			return ret;
+		break;
+	case TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_WITH_SCOPED:
+		revocable_try_access_with_scoped(priv->rp, res)
+			copy_resource_data(data, sizeof(data), res);
+		break;
+	case TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_OR_RETURN_ERR_SCOPED:
+		ret = call_revocable_try_access_or_return_err_scoped(
+					priv->rp, data, sizeof(data));
+		if (ret)
+			return ret;
+		break;
+	case TEST_MAGIC_OFFSET_MACRO_TRY_ACCESS_OR_RETURN_SCOPED:
+		ret = call_revocable_try_access_or_return_scoped(
+					priv->rp, data, sizeof(data));
+		if (ret)
+			return ret;
+		break;
+	default:
+		return 0;
+	}
+
+	len = min_t(size_t, strlen(data), count);
+	if (copy_to_user(buf, data, len))
+		return -EFAULT;
+
+	*offset = len;
+	return len;
+}
+
+static const struct file_operations revocable_test_fops = {
+	.open = revocable_test_open,
+	.release = revocable_test_release,
+	.write = revocable_test_write,
+	.read = revocable_test_read,
+	.llseek = default_llseek,
+};
+
+static int __init revocable_test_init(void)
+{
+	test_file = debugfs_create_file("revocable_test", 0600, NULL, NULL,
+					&revocable_test_fops);
+	return test_file ? 0 : -ENOMEM;
+}
+
+static void __exit revocable_test_exit(void)
+{
+	debugfs_remove(test_file);
+}
+
+module_init(revocable_test_init);
+module_exit(revocable_test_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Tzung-Bi Shih <tzungbi@kernel.org>");
+MODULE_DESCRIPTION("Revocable Kselftest");
-- 
2.53.0.310.g728cabbaf7-goog


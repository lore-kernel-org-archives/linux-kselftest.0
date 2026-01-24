Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811433B2BA;
	Sat, 24 Jan 2026 17:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769274947; cv=none; b=PxFYxpt87OlGac42YbFtcY8Y5LZv2yoigWYmTQd4w5o++fF3S35/Zu/fmd0QxzhRqHNiLQUzNoSkoYflAmKFs9dkcKGOlgQ+CIeyTN7rqqqZSVfNoXMBQxvphtL6OW0Q6LeyDW+1Y/ftvYVuQ+Ub3Y5OQJZjWjpNg23h9N9p9YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769274947; c=relaxed/simple;
	bh=LaYQBiUup58a6YNVMv6A0tUynGXO78V3X/8eEwYvEuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hUyOOYRobLSdKTTWujeOtLsbzAZa5hWE4YkzeTgz7LptVm22ZdiP8OncJu2lSCCP0EsmgfPz2iiqkYHcR5HAm8kZ4lx07QlSfwFtPQjKABxSD3uZnkMUM+YxA2aXlRUQMjYx/vhDIRS+ef0OxT7pkmiquR+NjDpNZwH6mo0JwtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HrNEU2D9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrNEU2D9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16851C116D0;
	Sat, 24 Jan 2026 17:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769274947;
	bh=LaYQBiUup58a6YNVMv6A0tUynGXO78V3X/8eEwYvEuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HrNEU2D90bYOOfISvgpV1VAo5kzMldGyYN2tfYdr+oQ9LQwddTwZ3yeA7YeoHXdDR
	 ZnSWLUySiMsTaMKXr5gX0NXQ1mJT5Uob2Xel372J18IURsHXFatEAK89Xvfjed5dI+
	 xMns0rqSrlidX0CXQmabVc6iqnMG2RQkviQNFwKl2RTvLkF2sMAqyi71Ea7fAE0wUM
	 BUNH+Y4w5pB2W1JZK8dXH7ye+cTQgxWONgr/m7rhH+2JzFRfZDAkhPj7b05fIVPofN
	 FYqooK5F5taBz5YZz9pSUOncSDBoeDQYcnTpdYMLzfvV639fB7MaREdynJzd1Nw7jW
	 xpWM6p5eFDJgQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vjhEg-000000003Hv-084p;
	Sat, 24 Jan 2026 18:15:46 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/3] Revert "selftests: revocable: Add kselftest cases"
Date: Sat, 24 Jan 2026 18:05:33 +0100
Message-ID: <20260124170535.11756-2-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124170535.11756-1-johan@kernel.org>
References: <20260124170535.11756-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 41242977c2d5705de33d3f58dc3bf5bc2f9de6cc.

The new revocable functionality is fundamentally broken and at a minimum
needs to be redesigned.

Drop the revocable selftests to allow the implementation to be reverted.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 MAINTAINERS                                   |   1 -
 tools/testing/selftests/Makefile              |   1 -
 .../selftests/drivers/base/revocable/Makefile |   7 -
 .../drivers/base/revocable/revocable_test.c   | 136 ------------
 .../drivers/base/revocable/test-revocable.sh  |  39 ----
 .../base/revocable/test_modules/Makefile      |  10 -
 .../revocable/test_modules/revocable_test.c   | 195 ------------------
 7 files changed, 389 deletions(-)
 delete mode 100644 tools/testing/selftests/drivers/base/revocable/Makefile
 delete mode 100644 tools/testing/selftests/drivers/base/revocable/revocable_test.c
 delete mode 100755 tools/testing/selftests/drivers/base/revocable/test-revocable.sh
 delete mode 100644 tools/testing/selftests/drivers/base/revocable/test_modules/Makefile
 delete mode 100644 tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cb91537cf246..bf38181c07e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22377,7 +22377,6 @@ S:	Maintained
 F:	drivers/base/revocable.c
 F:	drivers/base/revocable_test.c
 F:	include/linux/revocable.h
-F:	tools/testing/selftests/drivers/base/revocable/
 
 RFKILL
 M:	Johannes Berg <johannes@sipsolutions.net>
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 11b6515ce3d0..56e44a98d6a5 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -17,7 +17,6 @@ TARGETS += damon
 TARGETS += devices/error_logs
 TARGETS += devices/probe
 TARGETS += dmabuf-heaps
-TARGETS += drivers/base/revocable
 TARGETS += drivers/dma-buf
 TARGETS += drivers/ntsync
 TARGETS += drivers/s390x/uvdevice
diff --git a/tools/testing/selftests/drivers/base/revocable/Makefile b/tools/testing/selftests/drivers/base/revocable/Makefile
deleted file mode 100644
index afa5ca0fa452..000000000000
--- a/tools/testing/selftests/drivers/base/revocable/Makefile
+++ /dev/null
@@ -1,7 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-TEST_GEN_MODS_DIR := test_modules
-TEST_GEN_PROGS_EXTENDED := revocable_test
-TEST_PROGS := test-revocable.sh
-
-include ../../../lib.mk
diff --git a/tools/testing/selftests/drivers/base/revocable/revocable_test.c b/tools/testing/selftests/drivers/base/revocable/revocable_test.c
deleted file mode 100644
index f024164e9273..000000000000
--- a/tools/testing/selftests/drivers/base/revocable/revocable_test.c
+++ /dev/null
@@ -1,136 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright 2026 Google LLC
- *
- * A selftest for the revocable API.
- *
- * The test cases cover the following scenarios:
- *
- * - Basic: Verifies that a consumer can successfully access the resource
- *   provided via the provider.
- *
- * - Revocation: Verifies that after the provider revokes the resource,
- *   the consumer correctly receives a NULL pointer on a subsequent access.
- *
- * - Try Access Macro: Same as "Revocation" but uses the
- *   REVOCABLE_TRY_ACCESS_WITH() and REVOCABLE_TRY_ACCESS_SCOPED().
- */
-
-#include <fcntl.h>
-#include <unistd.h>
-
-#include "../../../kselftest_harness.h"
-
-#define DEBUGFS_PATH "/sys/kernel/debug/revocable_test"
-#define TEST_CMD_RESOURCE_GONE "resource_gone"
-#define TEST_DATA "12345678"
-#define TEST_MAGIC_OFFSET 0x1234
-#define TEST_MAGIC_OFFSET2 0x5678
-
-FIXTURE(revocable_fixture) {
-	int pfd;
-	int cfd;
-};
-
-FIXTURE_SETUP(revocable_fixture) {
-	int ret;
-
-	self->pfd = open(DEBUGFS_PATH "/provider", O_WRONLY);
-	ASSERT_NE(-1, self->pfd)
-		TH_LOG("failed to open provider fd");
-
-	ret = write(self->pfd, TEST_DATA, strlen(TEST_DATA));
-	ASSERT_NE(-1, ret) {
-		close(self->pfd);
-		TH_LOG("failed to write test data");
-	}
-
-	self->cfd = open(DEBUGFS_PATH "/consumer", O_RDONLY);
-	ASSERT_NE(-1, self->cfd)
-		TH_LOG("failed to open consumer fd");
-}
-
-FIXTURE_TEARDOWN(revocable_fixture) {
-	close(self->cfd);
-	close(self->pfd);
-}
-
-/*
- * ASSERT_* is only available in TEST or TEST_F block.  Use
- * macro for the helper.
- */
-#define READ_TEST_DATA(_fd, _offset, _data, _msg)			\
-	do {								\
-		int ret;						\
-									\
-		ret = lseek(_fd, _offset, SEEK_SET);			\
-		ASSERT_NE(-1, ret)					\
-			TH_LOG("failed to lseek");			\
-									\
-		ret = read(_fd, _data, sizeof(_data) - 1);		\
-		ASSERT_NE(-1, ret)					\
-			TH_LOG(_msg);					\
-		data[ret] = '\0';					\
-	} while (0)
-
-TEST_F(revocable_fixture, basic) {
-	char data[16];
-
-	READ_TEST_DATA(self->cfd, 0, data, "failed to read test data");
-	EXPECT_STREQ(TEST_DATA, data);
-}
-
-TEST_F(revocable_fixture, revocation) {
-	char data[16];
-	int ret;
-
-	READ_TEST_DATA(self->cfd, 0, data, "failed to read test data");
-	EXPECT_STREQ(TEST_DATA, data);
-
-	ret = write(self->pfd, TEST_CMD_RESOURCE_GONE,
-		    strlen(TEST_CMD_RESOURCE_GONE));
-	ASSERT_NE(-1, ret)
-		TH_LOG("failed to write resource gone cmd");
-
-	READ_TEST_DATA(self->cfd, 0, data,
-		       "failed to read test data after resource gone");
-	EXPECT_STREQ("(null)", data);
-}
-
-TEST_F(revocable_fixture, try_access_macro) {
-	char data[16];
-	int ret;
-
-	READ_TEST_DATA(self->cfd, TEST_MAGIC_OFFSET, data,
-		       "failed to read test data");
-	EXPECT_STREQ(TEST_DATA, data);
-
-	ret = write(self->pfd, TEST_CMD_RESOURCE_GONE,
-		    strlen(TEST_CMD_RESOURCE_GONE));
-	ASSERT_NE(-1, ret)
-		TH_LOG("failed to write resource gone cmd");
-
-	READ_TEST_DATA(self->cfd, TEST_MAGIC_OFFSET, data,
-		       "failed to read test data after resource gone");
-	EXPECT_STREQ("(null)", data);
-}
-
-TEST_F(revocable_fixture, try_access_macro2) {
-	char data[16];
-	int ret;
-
-	READ_TEST_DATA(self->cfd, TEST_MAGIC_OFFSET2, data,
-		       "failed to read test data");
-	EXPECT_STREQ(TEST_DATA, data);
-
-	ret = write(self->pfd, TEST_CMD_RESOURCE_GONE,
-		    strlen(TEST_CMD_RESOURCE_GONE));
-	ASSERT_NE(-1, ret)
-		TH_LOG("failed to write resource gone cmd");
-
-	READ_TEST_DATA(self->cfd, TEST_MAGIC_OFFSET2, data,
-		       "failed to read test data after resource gone");
-	EXPECT_STREQ("(null)", data);
-}
-
-TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/drivers/base/revocable/test-revocable.sh b/tools/testing/selftests/drivers/base/revocable/test-revocable.sh
deleted file mode 100755
index 3a34be28001a..000000000000
--- a/tools/testing/selftests/drivers/base/revocable/test-revocable.sh
+++ /dev/null
@@ -1,39 +0,0 @@
-#!/bin/bash
-# SPDX-License-Identifier: GPL-2.0
-
-mod_name="revocable_test"
-ksft_fail=1
-ksft_skip=4
-
-if [ "$(id -u)" -ne 0 ]; then
-	echo "$0: Must be run as root"
-	exit "$ksft_skip"
-fi
-
-if ! which insmod > /dev/null 2>&1; then
-	echo "$0: Need insmod"
-	exit "$ksft_skip"
-fi
-
-if ! which rmmod > /dev/null 2>&1; then
-	echo "$0: Need rmmod"
-	exit "$ksft_skip"
-fi
-
-insmod test_modules/"${mod_name}".ko
-
-if [ ! -d /sys/kernel/debug/revocable_test/ ]; then
-	mount -t debugfs none /sys/kernel/debug/
-
-	if [ ! -d /sys/kernel/debug/revocable_test/ ]; then
-		echo "$0: Error mounting debugfs"
-		exit "$ksft_fail"
-	fi
-fi
-
-./revocable_test
-ret=$?
-
-rmmod "${mod_name}"
-
-exit "${ret}"
diff --git a/tools/testing/selftests/drivers/base/revocable/test_modules/Makefile b/tools/testing/selftests/drivers/base/revocable/test_modules/Makefile
deleted file mode 100644
index f29e4f909402..000000000000
--- a/tools/testing/selftests/drivers/base/revocable/test_modules/Makefile
+++ /dev/null
@@ -1,10 +0,0 @@
-TESTMODS_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
-KDIR ?= /lib/modules/$(shell uname -r)/build
-
-obj-m += revocable_test.o
-
-all:
-	$(Q)$(MAKE) -C $(KDIR) M=$(TESTMODS_DIR)
-
-clean:
-	$(Q)$(MAKE) -C $(KDIR) M=$(TESTMODS_DIR) clean
diff --git a/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c b/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c
deleted file mode 100644
index 1b0692eb75f3..000000000000
--- a/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c
+++ /dev/null
@@ -1,195 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright 2026 Google LLC
- *
- * A kernel module for testing the revocable API.
- */
-
-#include <linux/debugfs.h>
-#include <linux/module.h>
-#include <linux/revocable.h>
-#include <linux/slab.h>
-
-#define TEST_CMD_RESOURCE_GONE "resource_gone"
-#define TEST_MAGIC_OFFSET 0x1234
-#define TEST_MAGIC_OFFSET2 0x5678
-
-static struct dentry *debugfs_dir;
-
-struct revocable_test_provider_priv {
-	struct revocable_provider *rp;
-	struct dentry *dentry;
-	char res[16];
-};
-
-static int revocable_test_consumer_open(struct inode *inode, struct file *filp)
-{
-	struct revocable *rev;
-	struct revocable_provider *rp = inode->i_private;
-
-	rev = revocable_alloc(rp);
-	if (!rev)
-		return -ENOMEM;
-	filp->private_data = rev;
-
-	return 0;
-}
-
-static int revocable_test_consumer_release(struct inode *inode,
-					   struct file *filp)
-{
-	struct revocable *rev = filp->private_data;
-
-	revocable_free(rev);
-	return 0;
-}
-
-static ssize_t revocable_test_consumer_read(struct file *filp,
-					    char __user *buf,
-					    size_t count, loff_t *offset)
-{
-	char *res;
-	char data[16];
-	size_t len;
-	struct revocable *rev = filp->private_data;
-
-	switch (*offset) {
-	case 0:
-		res = revocable_try_access(rev);
-		snprintf(data, sizeof(data), "%s", res ?: "(null)");
-		revocable_withdraw_access(rev);
-		break;
-	case TEST_MAGIC_OFFSET:
-		{
-			REVOCABLE_TRY_ACCESS_WITH(rev, res);
-			snprintf(data, sizeof(data), "%s", res ?: "(null)");
-		}
-		break;
-	case TEST_MAGIC_OFFSET2:
-		REVOCABLE_TRY_ACCESS_SCOPED(rev, res)
-			snprintf(data, sizeof(data), "%s", res ?: "(null)");
-		break;
-	default:
-		return 0;
-	}
-
-	len = min_t(size_t, strlen(data), count);
-	if (copy_to_user(buf, data, len))
-		return -EFAULT;
-
-	*offset = len;
-	return len;
-}
-
-static const struct file_operations revocable_test_consumer_fops = {
-	.open = revocable_test_consumer_open,
-	.release = revocable_test_consumer_release,
-	.read = revocable_test_consumer_read,
-	.llseek = default_llseek,
-};
-
-static int revocable_test_provider_open(struct inode *inode, struct file *filp)
-{
-	struct revocable_test_provider_priv *priv;
-
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-	filp->private_data = priv;
-
-	return 0;
-}
-
-static int revocable_test_provider_release(struct inode *inode,
-					   struct file *filp)
-{
-	struct revocable_test_provider_priv *priv = filp->private_data;
-
-	debugfs_remove(priv->dentry);
-	if (priv->rp)
-		revocable_provider_revoke(priv->rp);
-	kfree(priv);
-
-	return 0;
-}
-
-static ssize_t revocable_test_provider_write(struct file *filp,
-					     const char __user *buf,
-					     size_t count, loff_t *offset)
-{
-	size_t copied;
-	char data[64];
-	struct revocable_test_provider_priv *priv = filp->private_data;
-
-	copied = strncpy_from_user(data, buf, sizeof(data));
-	if (copied < 0)
-		return copied;
-	if (copied == sizeof(data))
-		data[sizeof(data) - 1] = '\0';
-
-	/*
-	 * Note: The test can't just close the FD for signaling the
-	 * resource gone.  Subsequent file operations on the opening
-	 * FD of debugfs return -EIO after calling debugfs_remove().
-	 * See also debugfs_file_get().
-	 *
-	 * Here is a side command channel for signaling the resource
-	 * gone.
-	 */
-	if (!strcmp(data, TEST_CMD_RESOURCE_GONE)) {
-		revocable_provider_revoke(priv->rp);
-		priv->rp = NULL;
-	} else {
-		if (priv->res[0] != '\0')
-			return 0;
-
-		strscpy(priv->res, data);
-
-		priv->rp = revocable_provider_alloc(&priv->res);
-		if (!priv->rp)
-			return -ENOMEM;
-
-		priv->dentry = debugfs_create_file("consumer", 0400,
-						   debugfs_dir, priv->rp,
-						   &revocable_test_consumer_fops);
-		if (!priv->dentry) {
-			revocable_provider_revoke(priv->rp);
-			return -ENOMEM;
-		}
-	}
-
-	return copied;
-}
-
-static const struct file_operations revocable_test_provider_fops = {
-	.open = revocable_test_provider_open,
-	.release = revocable_test_provider_release,
-	.write = revocable_test_provider_write,
-};
-
-static int __init revocable_test_init(void)
-{
-	debugfs_dir = debugfs_create_dir("revocable_test", NULL);
-	if (!debugfs_dir)
-		return -ENOMEM;
-
-	if (!debugfs_create_file("provider", 0200, debugfs_dir, NULL,
-				 &revocable_test_provider_fops)) {
-		debugfs_remove_recursive(debugfs_dir);
-		return -ENOMEM;
-	}
-
-	return 0;
-}
-
-static void __exit revocable_test_exit(void)
-{
-	debugfs_remove_recursive(debugfs_dir);
-}
-
-module_init(revocable_test_init);
-module_exit(revocable_test_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Tzung-Bi Shih <tzungbi@kernel.org>");
-MODULE_DESCRIPTION("Revocable Kselftest");
-- 
2.52.0


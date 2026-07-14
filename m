Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344B84C0404
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 19:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055852; cv=none; b=cpS+0sMgRwlNf/YUHF2j3Nz8VlXcgNkMLWCwsR9pMjJQ1gAIlMyOeOA8uYqP7RA1JfIPpFlpS6AGt9jUfS0NrhNQqaQ6/1YfMs9kihV26xT5aBby50S+D9jCi8yjVyGAvi2htiOOkA/tHlfYMpcMT/h8bNwUBdMlTrXwP3dxiMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055852; c=relaxed/simple;
	bh=zfDyJV2aigqwqK0oVK8rsdbQd5ZFREWM8O7Kzi3zncw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=i0QqEnl1OIs6KEeophu6l6df3pwqimiCiMsewJ+kVjD8eYFAxkOkPoD1yMTUYQjBF+BFmAsQUXH5ZU0XmKVA+L8prXIldfl7fAlkH8t3FwFaKOlQmxhxF1m6DNxLALgauKwCae/r6o+dBZ5YpoU4kVNeXF2FYwQw3dcCzi7jrnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J5yQYrpz; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J5yQYrpz"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c88da04b719so1238765a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 12:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784055844; x=1784660644; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1qGE5ydJOmS1JfOhVj+BHZS34VvobSfS8GWdyN4K2uQ=;
        b=J5yQYrpzhzhsNmXNpI39LaqAkul+OabMZrZbRWJqNIpZPbwOHb5FLbshlrs22VE5gy
         +IWdjpNgWHC5sxav5920MseH9fb3qyVL5DQK9ZSEyTKF3Wdr8GZ7FKaINKqv4cKx5aIu
         0i2dVbbpfaqah0vTI/J0bvEjmYNILlCuwGyDAo73x4hwIcOr89R2pxqUh1TTOFx5Ayz+
         tnPqrq52HEilro4zI1tX0X71LJSv5I56i7Luk+XFWzPR0mq65jSabtDZ3aeUG9RJANj8
         DILgAQ9MhJbLsDlxtOITb7QXXd3jXeDZ7M+xYqTIUQy9XQiOxqdo2ApbVYrKwEwLZsOa
         MwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055844; x=1784660644;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qGE5ydJOmS1JfOhVj+BHZS34VvobSfS8GWdyN4K2uQ=;
        b=JkghJY90UMRp4a/HybPW9yQ0kimWetI/2YTbPc2bLoF4DjSQoBm3lZHPNjOPgxA+um
         Gs44yQtAdXp3erpy/jHigwxnEnV0nvdr94M6sMdeW/h+hl1fP9RNBjOL+mQRvtQyS9aZ
         bmpq0Osggwl/0vAznt6ZBQMo0Vs7SgtDcU6fo5YsqMoce+GvzlHBX89P/2ueRFASOtMt
         4FGNqgSClkzR8y62urlBqAy5odEnnorz0myDDH47PZkiAAYyIDkibSnaUbclBIf98vwr
         ngKw89tnvAwXDcX3dPfPlcmnIcu2R1q57V22ryCglmoH/m6P/6ruhz8Z6gN81OS2LpFU
         TBig==
X-Forwarded-Encrypted: i=1; AHgh+RrS2pPOPE83FVe/jqWwyyOlsrXkW8pNzWmhPPhrzH8pp57BNA0yj/J6DJjRlBfka8mYmp03MwgA2BfNHN3gUOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtzpYv0v7iL+1jD7jgvS/LDPbd7/tPTckjbsAKoBFhYXJxIvqa
	D3mLkrwygjZpINbXIiErtUTxDQgA4I5G+3qfXRUgEjNYNd5pHny8TR09x5s4ELR0Kb2A37Kjabg
	OHCdIoLVsZPw3vA==
X-Received: from pgkz32.prod.google.com ([2002:a63:a60:0:b0:c9e:295c:e230])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:d49a:b0:3bf:6c08:2b2d with SMTP id adf61e73a8af0-3c110b6c28bmr16229745637.53.1784055843887;
 Tue, 14 Jul 2026 12:04:03 -0700 (PDT)
Date: Tue, 14 Jul 2026 19:03:56 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260714190356.190328-1-dmatlack@google.com>
Subject: [RFC PATCH] liveupdate: Allow multiple openers for /dev/liveupdate
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Jason Gunthorpe <jgg@nvidia.com>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Remove the single-opener restriction for /dev/liveupdate by removing the
atomic in_use tracking and the exclusive open check in luo_open() that
returned -EBUSY. Protect luo_session_deserialize() with a mutex guard so
that concurrent open attempts by multiple processes safely executes
deserialization only once. Update liveupdate selftest to verify that
multiple concurrent openers succeed.

LUO does not inherently require a single opener. There is some
documentation about it simplifying state management, but the only thing
it actually protects is the session deserialization during first open,
which can be easily handled with a mutex.

Relaxing the single-opener requirement avoids the kernel forcing a
design pattern on userspace that it itself does not require, e.g.
allowing multiple userspace processes to create and manage sessions.

Signed-off-by: David Matlack <dmatlack@google.com>
---
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Samiullah Khawaja <skhawaja@google.com>

 kernel/liveupdate/luo_core.c                  | 46 +++----------------
 kernel/liveupdate/luo_session.c               |  8 +++-
 .../testing/selftests/liveupdate/liveupdate.c | 14 +++---
 3 files changed, 18 insertions(+), 50 deletions(-)

diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index 1b2bda22902d..931bb79da276 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -254,19 +254,8 @@ bool liveupdate_enabled(void)
  * which allows a userspace agent to manage the LUO state machine and its
  * associated resources, such as preservable file descriptors.
  *
- * To ensure that the state machine is controlled by a single entity, access
- * to this device is exclusive: only one process is permitted to have
- * ``/dev/liveupdate`` open at any given time. Subsequent open attempts will
- * fail with -EBUSY until the first process closes its file descriptor.
- * This singleton model simplifies state management by preventing conflicting
- * commands from multiple userspace agents.
  */
 
-struct luo_device_state {
-	struct miscdevice miscdev;
-	atomic_t in_use;
-};
-
 static int luo_ioctl_create_session(struct luo_ucmd *ucmd)
 {
 	struct liveupdate_ioctl_create_session *argp = ucmd->cmd;
@@ -329,28 +318,9 @@ static int luo_ioctl_retrieve_session(struct luo_ucmd *ucmd)
 
 static int luo_open(struct inode *inodep, struct file *filep)
 {
-	struct luo_device_state *ldev = container_of(filep->private_data,
-						     struct luo_device_state,
-						     miscdev);
-
-	if (atomic_cmpxchg(&ldev->in_use, 0, 1))
-		return -EBUSY;
-
 	/* Always return -EIO to user if deserialization fail */
-	if (luo_session_deserialize()) {
-		atomic_set(&ldev->in_use, 0);
+	if (luo_session_deserialize())
 		return -EIO;
-	}
-
-	return 0;
-}
-
-static int luo_release(struct inode *inodep, struct file *filep)
-{
-	struct luo_device_state *ldev = container_of(filep->private_data,
-						     struct luo_device_state,
-						     miscdev);
-	atomic_set(&ldev->in_use, 0);
 
 	return 0;
 }
@@ -419,17 +389,13 @@ static long luo_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 static const struct file_operations luo_fops = {
 	.owner		= THIS_MODULE,
 	.open		= luo_open,
-	.release	= luo_release,
 	.unlocked_ioctl	= luo_ioctl,
 };
 
-static struct luo_device_state luo_dev = {
-	.miscdev = {
-		.minor = MISC_DYNAMIC_MINOR,
-		.name  = "liveupdate",
-		.fops  = &luo_fops,
-	},
-	.in_use = ATOMIC_INIT(0),
+static struct miscdevice luo_dev = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name  = "liveupdate",
+	.fops  = &luo_fops,
 };
 
 static int __init liveupdate_ioctl_init(void)
@@ -437,6 +403,6 @@ static int __init liveupdate_ioctl_init(void)
 	if (!liveupdate_enabled())
 		return 0;
 
-	return misc_register(&luo_dev.miscdev);
+	return misc_register(&luo_dev);
 }
 late_initcall(liveupdate_ioctl_init);
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index b79b2a488974..ca4d0639d39a 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -584,13 +584,17 @@ static int luo_session_deserialize_one(struct luo_session_header *sh,
 
 int luo_session_deserialize(void)
 {
-	struct luo_session_header *sh = &luo_session_global.incoming;
+	static DEFINE_MUTEX(luo_session_deserialize_lock);
 	static bool is_deserialized;
+	static int saved_err;
+
+	struct luo_session_header *sh = &luo_session_global.incoming;
 	struct luo_session_ser *ser;
 	struct kho_block_set_it it;
-	static int saved_err;
 	int err;
 
+	guard(mutex)(&luo_session_deserialize_lock);
+
 	/* If has been deserialized, always return the same error code */
 	if (is_deserialized)
 		return saved_err;
diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index 502fb3567e38..a8e1a8911849 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -11,7 +11,7 @@
  * /dev/liveupdate character device and its session management capabilities.
  *
  * Tests include:
- * - Device access: basic open/close, and enforcement of exclusive access.
+ * - Device access: basic open/close, and support for multiple openers.
  * - Session management: creation of unique sessions, and duplicate name detection.
  * - Resource preservation: successfully preserving individual and multiple memfds,
  *   verifying contents remain accessible.
@@ -70,13 +70,12 @@ TEST_F(liveupdate_device, basic_open_close)
 }
 
 /*
- * Test Case: Exclusive Open Enforcement
+ * Test Case: Multiple Open Support
  *
- * Verifies that the /dev/liveupdate device can only be opened by one process
- * at a time. It checks that a second attempt to open the device fails with
- * the EBUSY error code.
+ * Verifies that the /dev/liveupdate device can be opened by multiple openers
+ * concurrently without errors.
  */
-TEST_F(liveupdate_device, exclusive_open)
+TEST_F(liveupdate_device, multiple_open)
 {
 	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
 
@@ -85,8 +84,7 @@ TEST_F(liveupdate_device, exclusive_open)
 
 	ASSERT_GE(self->fd1, 0);
 	self->fd2 = open(LIVEUPDATE_DEV, O_RDWR);
-	EXPECT_LT(self->fd2, 0);
-	EXPECT_EQ(errno, EBUSY);
+	ASSERT_GE(self->fd2, 0);
 }
 
 /* Helper function to create a LUO session via ioctl. */

base-commit: 10fd52dc7bbd6013e949ff1833be0821b7553fb0
-- 
2.55.0.141.g00534a21ce-goog


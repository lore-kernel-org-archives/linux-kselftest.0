Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEF346D2BF;
	Fri,  4 Sep 2026 10:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518339; cv=none; b=bTcaMpjddMylkOa7x0+beaHNxm2V49p3D9y4TBIcnQAbrfQU8F2SoqQ2D8YhT8Yg/oaoO05XzhkxlcnaGvbVNE8y0JW84Y+iQEcIClJfBeYXuCGvkaNP2gkxzNSH8ibxW8zbT2cwmyyL7ciaRMuCpO2Fw9wcoPRaX5zzw+zu4kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518339; c=relaxed/simple;
	bh=sYIHcPCrYS4KyEQfcFyUdFQhlq70gQCjq5hSX/4UNno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udk7kMCzOlrKXv06MNUk0EdoKPeYUeC+CQTnH7+sxk1//EFwF3Vig/rVy2webh1Bn1yFf4Vzt4zxInbW2jdjT5yvAInJCMDZVFObEUp07G9PVYr1ZJApqFESU3gSUKF2NUcTSFNC16PxG8IeZ9M7F2pyVcj9RvMiHo/eOE6kZAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=WEXo5fy8; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="WEXo5fy8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=8WOnr4RN6rzP95WWHSW4bXDIpnOb0dKKHyJEBh7/hHU=; b=
	WEXo5fy8clMP8LdbwyVXmUVTI4VAIAfPitsKG9htiL700CknUFqmyYIUMUTfYLMFM3bGO6xn2/gKY
	1BCy0C8cJb+tTaAO6cBqf50ut5gLpDOnbVbzEFcKBBEdEEgIdoizVPwQK6cN/ZgTbvdtplJCYPXb9
	JSF3RPmq9iNxGEfHK69eYjM0Bon3OYvLue44xpUZqLsxiUiL/9tdC6whlB9RTVXqpNziGv8oCU/3t
	05LZaPz4iB3v+r2PU21aM4BxgeGqcKmqh15IsTy+wQnrJw+yzcf/ov7wc/NY5fz6cBtVROcBpqc+c
	Dw6sUA5pDHHZIvdOgMHbPignaORyhWMOeA==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x2RJn-00Eq0y-7y; Fri, 04 Sep 2026 12:38:47 +0200
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Amir Goldstein <amir73il@gmail.com>,
	Chen Linxuan <me@black-desk.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matt Harvey <mharvey@jumptrading.com>,
	kernel-dev@igalia.com,
	Luis Henriques <luis@igalia.com>
Subject: [RFC PATCH v3 6/8] selftests/fuse: add some extra ACL caching tests
Date: Fri,  4 Sep 2026 11:39:18 +0100
Message-ID: <20260904103920.4471-7-luis@igalia.com>
In-Reply-To: <20260904103920.4471-1-luis@igalia.com>
References: <20260904103920.4471-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds some extra tests to ACL caching:
- Verify that reading ACLs results in the expected number of requests
  being sent user-space, depending on whether cache is enabled or disabled
- Verify caching behaviour on some caching invalidation scenarios

While there, add test binary to .gitignore.

Signed-off-by: Luis Henriques <luis@igalia.com>
---
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../filesystems/fuse/fuse_acl_cache_test.c    | 179 ++++++++++++++++++
 2 files changed, 180 insertions(+)

diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/testing/selftests/filesystems/fuse/.gitignore
index fb51603fe419..f7f3dd345a50 100644
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@ -2,3 +2,4 @@
 fuse_mnt
 fusectl_test
 write_extend_eof_test
+fuse_acl_cache_test
diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
index c2d6658ff7de..9608a0adb967 100644
--- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
+++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
@@ -83,6 +83,7 @@ struct daemon_state {
 	uint8_t        *acl;
 	size_t          acl_size;
 	int             getxattr_count;
+	bool            cache;
 };
 
 /*
@@ -91,9 +92,17 @@ struct daemon_state {
  */
 static struct daemon_state g_ds = {
 	.lock = PTHREAD_MUTEX_INITIALIZER,
+	.cache = false,
 };
 
 /* ---- FUSE lowlevel callbacks -------------------------------------------- */
+static void fs_init(void *userdata, struct fuse_conn_info *conn)
+{
+	pthread_mutex_lock(&g_ds.lock);
+	if (g_ds.cache)
+		fuse_set_feature_flag(conn, FUSE_CAP_POSIX_ACL);
+	pthread_mutex_unlock(&g_ds.lock);
+}
 
 static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
 {
@@ -115,6 +124,8 @@ static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
 	e.attr.st_ino     = FILE_INO;
 	e.attr.st_mode    = S_IFREG | 0644;
 	e.attr.st_nlink   = 1;
+	e.attr.st_uid = getuid();
+	e.attr.st_gid = getgid();
 	fuse_reply_entry(req, &e);
 }
 
@@ -175,10 +186,38 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
 	free(acl);
 }
 
+static void fs_setxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
+			    const char *value, size_t size, int flags)
+{
+	int ret = 0;
+	uint8_t *acl;
+
+	if (ino != FILE_INO)
+		ret = ENOENT;
+	else if (!strcmp(name, "system.posix_acl_access")) {
+		acl = malloc(size);
+		if (acl) {
+			memcpy(acl, value, size);
+			pthread_mutex_lock(&g_ds.lock);
+			if (g_ds.acl)
+				free(g_ds.acl);
+			g_ds.acl = acl;
+			g_ds.acl_size = size;
+			pthread_mutex_unlock(&g_ds.lock);
+		} else
+			ret = ENOMEM;
+	} else
+		ret = ENOTSUP;
+
+	fuse_reply_err(req, ret);
+}
+
 static const struct fuse_lowlevel_ops fs_ops = {
+	.init     = fs_init,
 	.lookup   = fs_lookup,
 	.getattr  = fs_getattr,
 	.getxattr = fs_getxattr,
+	.setxattr = fs_setxattr,
 };
 
 /* ---- kselftest harness --------------------------------------------------- */
@@ -199,6 +238,7 @@ FIXTURE_SETUP(acl_cache)
 	ASSERT_NE(g_ds.acl, NULL);
 	memcpy(g_ds.acl, acl_a, g_ds.acl_size);
 	g_ds.getxattr_count = 0;
+	g_ds.cache          = false;
 
 	if (fs_setup(&self->se, self->mountpoint, &fs_ops, &self->thread, err))
 		SKIP(return, err);
@@ -322,4 +362,143 @@ TEST_F(acl_cache, stale_after_force_sync)
 	EXPECT_EQ(count, 4);
 }
 
+FIXTURE(acl_cache_onoff)
+{
+	struct fuse_session *se;
+	char mountpoint[MOUNTPOINT_SZ];
+	char pathname[PATH_MAX];
+	pthread_t thread;
+};
+
+FIXTURE_VARIANT(acl_cache_onoff) { bool cache; };
+FIXTURE_VARIANT_ADD(acl_cache_onoff, nocache) { .cache = false, };
+FIXTURE_VARIANT_ADD(acl_cache_onoff, docache) { .cache = true, };
+
+FIXTURE_SETUP(acl_cache_onoff)
+{
+	char err[MAX_ERR_MSG];
+
+	g_ds.acl = NULL;
+	g_ds.acl_size = 0;
+	g_ds.getxattr_count = 0;
+	g_ds.cache = variant->cache;
+
+	if (fs_setup(&self->se, self->mountpoint, &fs_ops, &self->thread, err))
+		SKIP(return, err);
+
+	snprintf(self->pathname, sizeof(self->pathname),
+		 "%s/" FILE_NAME, self->mountpoint);
+}
+
+FIXTURE_TEARDOWN(acl_cache_onoff)
+{
+	fs_teardown(self->se, self->thread, self->mountpoint);
+	free(g_ds.acl);
+}
+
+/*
+ * This is the most basic ACL caching test: verify that, when reading ACLs for
+ * an inode, user-space is called:
+ * - Only once if ACLs cache is enabled, or
+ * - Once per access if cache i disabled.
+ */
+TEST_F(acl_cache_onoff, test_acl_cache_enable_disable)
+{
+	char buf[512];
+	ssize_t sz;
+	bool cache;
+	int counter;
+	int i;
+
+	ASSERT_EQ(lsetxattr(self->pathname, "system.posix_acl_access",
+			    acl_a, sizeof(acl_a), 0), 0);
+
+	for (i = 0; i < 100; i++) {
+		sz = lgetxattr(self->pathname, "system.posix_acl_access",
+			       buf, sizeof(buf));
+		ASSERT_EQ(sz, sizeof(acl_a));
+		ASSERT_EQ(memcmp(buf, acl_a, sz), 0);
+	}
+
+	pthread_mutex_lock(&g_ds.lock);
+	counter = g_ds.getxattr_count;
+	cache = g_ds.cache;
+	pthread_mutex_unlock(&g_ds.lock);
+
+	if (cache) {
+		ASSERT_EQ(counter, 1);
+	} else {
+		ASSERT_EQ(counter, 100);
+	}
+
+	TH_LOG("User-space called %d time(s) with ACL caching %s",
+	       counter, cache ? "enabled" : "disabled");
+}
+
+/*
+ * Test caching invalidation for several scenarios:
+ * 1. When a new ACL is set
+ * 2. When invalidating an inode (NOTIFY_INODE_INVAL)
+ */
+TEST_F(acl_cache_onoff, test_acl_cache_invalidation)
+{
+	char buf[512];
+	ssize_t sz;
+	int counter;
+	bool cache;
+	int i;
+
+	/* Set an ACL */
+	ASSERT_EQ(lsetxattr(self->pathname, "system.posix_acl_access",
+			    acl_a, sizeof(acl_a), 0), 0);
+
+	for (i = 0; i < 100; i++) {
+		sz = lgetxattr(self->pathname, "system.posix_acl_access",
+			       buf, sizeof(buf));
+		ASSERT_EQ(sz, sizeof(acl_a));
+		ASSERT_EQ(memcmp(buf, acl_a, sz), 0);
+	}
+
+	/* 1. force cache invalidation by setting a new ACL */
+	ASSERT_EQ(lsetxattr(self->pathname, "system.posix_acl_access",
+			    acl_b, sizeof(acl_b), 0), 0);
+
+	sz = lgetxattr(self->pathname, "system.posix_acl_access",
+		       buf, sizeof(buf));
+	ASSERT_EQ(sz, sizeof(acl_b));
+	ASSERT_EQ(memcmp(buf, acl_b, sz), 0);
+
+	pthread_mutex_lock(&g_ds.lock);
+	counter = g_ds.getxattr_count;
+	cache = g_ds.cache;
+	pthread_mutex_unlock(&g_ds.lock);
+
+	if (cache) {
+		ASSERT_EQ(counter, 2);
+	} else {
+		ASSERT_EQ(counter, 101);
+	}
+	TH_LOG("Invalidation by setting new ACL: OK");
+
+	/* 2. send FUSE_NOTIFY_INVAL_INODE */
+	fuse_lowlevel_notify_inval_inode(self->se, FILE_INO, 0, 0);
+
+	sz = lgetxattr(self->pathname, "system.posix_acl_access",
+		       buf, sizeof(buf));
+	ASSERT_EQ(sz, sizeof(acl_b));
+	ASSERT_EQ(memcmp(buf, acl_b, sz), 0);
+
+	pthread_mutex_lock(&g_ds.lock);
+	counter = g_ds.getxattr_count;
+	cache = g_ds.cache;
+	pthread_mutex_unlock(&g_ds.lock);
+
+	if (cache) {
+		ASSERT_EQ(counter, 3);
+	} else {
+		ASSERT_EQ(counter, 102);
+	}
+	TH_LOG("Invalidation through FUSE_NOTIFY_INVAL_INODE: OK");
+}
+
 TEST_HARNESS_MAIN

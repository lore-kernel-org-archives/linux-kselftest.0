Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BEE43E06B;
	Mon, 17 Aug 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975904; cv=none; b=L9rGWMlAxB0SxSVdxVD3mJdWblIdJdF6QZu1qQeOprUXu5VZUwwrYXlUnFB+h5bQQp0RXtf9Dz9bsbsWivJSfRbj36IVRVolqZ3MUFFCw+iiScWn4JGlrm/aaWZdY0cOuAQlmmsLNx6YElR9E2aQ8TJhkFWbloNULms5F8cf0MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975904; c=relaxed/simple;
	bh=53FyT5hQuv3wWQE3YDOn9uEae72kYkG1IDbDjue/908=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jq9oI1TzghSCNVWFyuXltq/6L/KjAlZ/COm3cxkhzx1fpPggCbY3MF6H8+1cQC1Hd0XNRuU9mmTgNqKt0MYfBvxk9wKq0KUdugqPOP4t0uZmfxRWBx0tpIF9Sv+bBs0zH4LCAUVxY9HG56/Wpvz8LTJj3gMKZnavJVe4goMvuXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=TSWlMBKV; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="TSWlMBKV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=Dsj5g0gTqA2a4Mul6NpOYtRPLWWQfXgRLquExfj9H4k=; b=
	TSWlMBKVbdunBg9oV43dm9+t/t8HxJFPCicyuebuI+CneeH9X77WzZEvnO0sQ8ng0QOgw6jFxIuAk
	mQNj6jhfmAH/n8CK1z78sWdirjnNYXo6SNJ2449MDxwwKW5z1cCK6ZtDD+ypL2rjzEpVDnARTaVrR
	KI/jXq/UWY1BvtgH0W7L1wVwnwgg9wYoFOnpJjocn3tNARiPjGoFTAAsJ+fLCcBcpsQpptvG3dahK
	dURjxp65oSF2cakIEJv2XQnkb933MgfwhfwoacBXAHVvTcefwdp8EPkJHibbzNuy0FsnfgJ2Vk1iI
	DH5R/sGbm0Q/BGsN/vEbB0/njyEUN+kzWA==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wvy3r-004Xyc-1p; Mon, 17 Aug 2026 16:11:35 +0200
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
Subject: [RFC PATCH v2 7/8] selftests/fuse: add some extra ACL caching tests
Date: Mon, 17 Aug 2026 15:11:55 +0100
Message-ID: <20260817141156.6079-8-luis@igalia.com>
In-Reply-To: <20260817141156.6079-1-luis@igalia.com>
References: <20260817141156.6079-1-luis@igalia.com>
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
 .../filesystems/fuse/fuse_acl_cache_test.c    | 177 ++++++++++++++++++
 2 files changed, 178 insertions(+)

diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/testing/selftests/filesystems/fuse/.gitignore
index 873304f8d1a1..d5061752e2b0 100644
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@ -2,3 +2,4 @@
 fuse_mnt
 fusectl_test
 fuse_symlink_cache_test
+fuse_acl_cache_test
diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
index bf8b3807e603..c1291fb1c8b9 100644
--- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
+++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
@@ -93,6 +93,7 @@ struct daemon_state {
 	uint8_t        *acl;
 	size_t          acl_size;
 	int             getxattr_count;
+	bool            cache;
 };
 
 /*
@@ -101,9 +102,17 @@ struct daemon_state {
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
@@ -125,6 +134,8 @@ static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
 	e.attr.st_ino     = FILE_INO;
 	e.attr.st_mode    = S_IFREG | 0644;
 	e.attr.st_nlink   = 1;
+	e.attr.st_uid = getuid();
+	e.attr.st_gid = getgid();
 	fuse_reply_entry(req, &e);
 }
 
@@ -185,10 +196,38 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
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
 
 /* ---- Daemon thread ------------------------------------------------------- */
@@ -269,6 +308,7 @@ FIXTURE_SETUP(acl_cache)
 	ASSERT_NE(g_ds.acl, NULL);
 	memcpy(g_ds.acl, acl_a, g_ds.acl_size);
 	g_ds.getxattr_count = 0;
+	g_ds.cache          = false;
 
 	if (fs_setup(&self->se, self->mountpoint, self->file_path,
 		     &self->thread, err))
@@ -390,4 +430,141 @@ TEST_F(acl_cache, stale_after_force_sync)
 	EXPECT_EQ(count, 4);
 }
 
+FIXTURE(acl_cache_onoff)
+{
+	struct fuse_session *se;
+	char mountpoint[PATH_MAX];
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
+	if (fs_setup(&self->se, self->mountpoint, self->pathname,
+		     &self->thread, err))
+		SKIP(return, err);
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

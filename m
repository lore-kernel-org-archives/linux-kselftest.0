Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26F24AB3B9;
	Wed, 16 Sep 2026 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574178; cv=none; b=Q77uxxz/bgUG+qAd+HAVTXGYAMDAalacvFsBzF+mcXdwThbTFPvHLspEjaY240KMqGaa0CHxxY3IRL+pTfR67OcwVhP91c6T2GERcSfw8Z8e75upne/w/BqmTW4Rnnqb/ubm5+OaIXiPxV/YktOXRwCvtGYyKZyB0V9d0rHd974=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574178; c=relaxed/simple;
	bh=z3zjr0XsNuHaANYr0dL6PUWN/3yZajpQbLCKUWbd+ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGJ5SO0H5QjHhDf6YpU0cPxQvKREfzoOcQFGI/jc7vXtCqJ2Km5MCjY0OMLKl1ynh+pXeVuniN5L0P5zuqJvxtDFlaYJjZQAXOESjDz0mqypmNA1NjhwkSFQ0sGVXiEScPyPn9+oaedVgIpHC0IQmOG6sPSGb2KTNYdYZ+xRoLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=OrBMENQc; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="OrBMENQc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=rIMeXjQ7oism9g1OPJrivzQXheiMOSH8xcFeWnoY0Hc=; b=
	OrBMENQc4cJDM938i7GRiUMHsuAhlCaH9K5zWWxpbu+2W4PL2SsUL5nEMGlRV73pGePUdis8NBN3U
	yMkkh5us6/LYmYiK9lJF/odwM/oZIH+astpm9MHbffyvxfZg0JET73h6moIuLD9HI2VVQzbc7vy9t
	rd/dOoJ+g3sDFzqL5K9zkIUVJ6oPhAzQMTOfnvGRQshubFpQFCuA4kBBB9HEZvaRYuWmhvNKTmXib
	v18JNIxLp1ItnO1gCuQllgXqBD4ci+fddMwpsh/2RTKJYWmGxTTOTZK2yHeuBu5n+H9gkluRk631V
	KTos77qpmqLU5bQZqVOs6mzzxxj1W829Ng==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6ryy-0031Jr-Dv; Wed, 16 Sep 2026 17:55:36 +0200
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
Subject: [RFC PATCH v4 6/8] selftests/fuse: add some extra ACL caching tests
Date: Wed, 16 Sep 2026 16:56:27 +0100
Message-ID: <20260916155629.32421-7-luis@igalia.com>
In-Reply-To: <20260916155629.32421-1-luis@igalia.com>
References: <20260916155629.32421-1-luis@igalia.com>
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
 .../filesystems/fuse/fuse_acl_cache_test.c    | 203 +++++++++++++++++-
 2 files changed, 202 insertions(+), 2 deletions(-)

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
index fb4e3554e3c9..173063efeee8 100644
--- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
+++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
@@ -84,6 +84,9 @@ struct daemon_state {
 	uint8_t		*acl;
 	size_t          acl_size;
 	int             getxattr_count;
+	uid_t           uid;
+	uid_t           gid;
+	bool            cache;
 };
 
 /*
@@ -92,9 +95,17 @@ struct daemon_state {
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
@@ -116,6 +127,10 @@ static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
 	e.attr.st_ino     = FILE_INO;
 	e.attr.st_mode    = S_IFREG | 0644;
 	e.attr.st_nlink   = 1;
+	pthread_mutex_lock(&g_ds.lock);
+	e.attr.st_uid = g_ds.uid;
+	e.attr.st_gid = g_ds.gid;
+	pthread_mutex_unlock(&g_ds.lock);
 	fuse_reply_entry(req, &e);
 }
 
@@ -133,6 +148,10 @@ static void fs_getattr(fuse_req_t req, fuse_ino_t ino,
 		st.st_ino   = FILE_INO;
 		st.st_mode  = S_IFREG | 0644;
 		st.st_nlink = 1;
+		pthread_mutex_lock(&g_ds.lock);
+		st.st_uid = g_ds.uid;
+		st.st_gid = g_ds.gid;
+		pthread_mutex_unlock(&g_ds.lock);
 	} else {
 		fuse_reply_err(req, ENOENT);
 		return;
@@ -161,12 +180,14 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
 	}
 	pthread_mutex_lock(&g_ds.lock);
 	acl_size = g_ds.acl_size;
-	if (acl && (size >= acl_size))
+	if (acl && acl_size && (size >= acl_size))
 		memcpy(acl, g_ds.acl, acl_size);
 	g_ds.getxattr_count++;
 	pthread_mutex_unlock(&g_ds.lock);
 
-	if (size == 0)
+	if (acl_size == 0)
+		fuse_reply_err(req, ENODATA);
+	else if (size == 0)
 		fuse_reply_xattr(req, acl_size);
 	else if (size < acl_size)
 		fuse_reply_err(req, ERANGE);
@@ -176,10 +197,42 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
 	free(acl);
 }
 
+static void fs_setxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
+			    const char *value, size_t size, int flags)
+{
+	int ret = 0;
+	uint8_t *acl;
+
+	if (ino != FILE_INO) {
+		ret = ENOENT;
+		goto out;
+	} else if (strcmp(name, "system.posix_acl_access") != 0) {
+		ret = ENOTSUP;
+		goto out;
+	}
+	acl = malloc(size);
+	if (!acl) {
+		ret = ENOMEM;
+		goto out;
+	}
+	memcpy(acl, value, size);
+	pthread_mutex_lock(&g_ds.lock);
+	if (g_ds.acl)
+		free(g_ds.acl);
+	g_ds.acl = acl;
+	g_ds.acl_size = size;
+	pthread_mutex_unlock(&g_ds.lock);
+
+out:
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
@@ -198,6 +251,9 @@ FIXTURE_SETUP(acl_cache)
 	ASSERT_NE(g_ds.acl, NULL);
 	memcpy(g_ds.acl, acl_a, g_ds.acl_size);
 	g_ds.getxattr_count = 0;
+	g_ds.uid = getuid();
+	g_ds.gid = getgid();
+	g_ds.cache = false;
 
 	if (fs_setup(&fs_ops, &g_ds.ctx, err))
 		SKIP(goto out, err);
@@ -325,4 +381,147 @@ TEST_F(acl_cache, stale_after_force_sync)
 	EXPECT_EQ(count, 4);
 }
 
+FIXTURE(acl_cache_onoff)
+{
+	char pathname[PATH_MAX];
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
+	pthread_mutex_lock(&g_ds.lock);
+	g_ds.acl = NULL;
+	g_ds.acl_size = 0;
+	g_ds.getxattr_count = 0;
+	g_ds.cache = variant->cache;
+	g_ds.uid = getuid();
+	g_ds.gid = getgid();
+
+	if (fs_setup(&fs_ops, &g_ds.ctx, err))
+		SKIP(goto out, err);
+
+	snprintf(self->pathname, sizeof(self->pathname),
+		 "%s/" FILE_NAME, g_ds.ctx.mountpoint);
+out:
+	pthread_mutex_unlock(&g_ds.lock);
+}
+
+FIXTURE_TEARDOWN(acl_cache_onoff)
+{
+	pthread_mutex_lock(&g_ds.lock);
+	fs_teardown(&g_ds.ctx);
+	pthread_mutex_unlock(&g_ds.lock);
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
+	fuse_lowlevel_notify_inval_inode(g_ds.ctx.se, FILE_INO, 0, 0);
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

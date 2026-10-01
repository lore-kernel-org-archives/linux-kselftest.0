Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2C747CA62;
	Thu,  1 Oct 2026 16:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873309; cv=none; b=HhNA78/ubd1XbeeiGbGo239fL2B5Fx1G+NObuoOWxWm2ePkE5RDjxOkbGYSkkQNxZAKi4r4KmpPKX2fbMhli6gs5eFUj05zdd8fwmCEEbQ0NUru8XTc/Jgzt68ifOth9hL0GcthWfVwmtyGX6FRTC8EiyFtuCOmcaOHsXffkUtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873309; c=relaxed/simple;
	bh=Gj0yqz7WnI5/lqqtHINNvczkgXNg+roS2l+8tvz0oVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=usve/PdgTQIOJqE+64MpOEmcye7NC2g9JR9STbuZIvF8acv4+3NnHQJdqUgNYQikgRK/jrGrO/yneV/Lo6a/SyJBML7lOJg6yQmYyfeTATBAZNiUwJp0gW1WkxPHiv13agv8xjwfYH5bbok/gJIxXtYSqPQeFM8nkbu8jw2TiGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=mjdrcc1D; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="mjdrcc1D"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=gsyFcRQUgpPBHJ7rYl6whyYhEGMv8XULdfIsvUmn8p4=; b=
	mjdrcc1DoGmtBHwHMOhMjMOXLxLmTbp1X+yXQj8WNQktfPKYwIwyQsYyMxqJ1ZkFyRhH90T6Wn8CG
	CqNkwoAHfR0SNiAlVepVd4Pxby1aE6f7xg8Orsc+AX7x7QQ8VY5tdLAXhmbBGRMfsbyb6sVF4C1ao
	DoWzg4Cq5H+ZdjwfW8ZDyBOTSl95eEJetRRilsEfD+7PzvBCrxVwL/rrjGyZUJwr+PU8oa9rEjm7L
	aNpPf+qSzMaUEdcTPGU5GUamK0XuZWlgPrzocHA/jhBP3PAzsLdfidAjySkgD807bye4sk9wWdnNg
	eyi/bkWjFUm2BVj8HIhJJXBFfeClAUr3Pg==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xCJxC-00AD11-4y; Thu, 01 Oct 2026 18:48:18 +0200
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
Subject: [RFC PATCH v5 6/8] selftests/fuse: add some extra ACL caching tests
Date: Thu,  1 Oct 2026 17:49:14 +0100
Message-ID: <20261001164916.15311-7-luis@igalia.com>
In-Reply-To: <20261001164916.15311-1-luis@igalia.com>
References: <20261001164916.15311-1-luis@igalia.com>
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
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
---
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../filesystems/fuse/fuse_acl_cache_test.c    | 201 +++++++++++++++++-
 2 files changed, 200 insertions(+), 2 deletions(-)

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
index 8485df64e7cc..9c8840fe816b 100644
--- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
+++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
@@ -83,6 +83,9 @@ struct daemon_state {
 	uint8_t		*acl;
 	size_t          acl_size;
 	int             getxattr_count;
+	uid_t           uid;
+	uid_t           gid;
+	bool            cache;
 };
 
 /*
@@ -91,9 +94,17 @@ struct daemon_state {
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
@@ -115,6 +126,10 @@ static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
 	e.attr.st_ino     = FILE_INO;
 	e.attr.st_mode    = S_IFREG | 0644;
 	e.attr.st_nlink   = 1;
+	pthread_mutex_lock(&g_ds.lock);
+	e.attr.st_uid = g_ds.uid;
+	e.attr.st_gid = g_ds.gid;
+	pthread_mutex_unlock(&g_ds.lock);
 	fuse_reply_entry(req, &e);
 }
 
@@ -132,6 +147,10 @@ static void fs_getattr(fuse_req_t req, fuse_ino_t ino,
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
@@ -160,12 +179,14 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
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
@@ -175,10 +196,42 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
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
 	pthread_mutex_unlock(&g_ds.lock);
 
 	if (fs_setup(&fs_ops, &self->ctx, err))
@@ -322,4 +378,145 @@ TEST_F(acl_cache, stale_after_force_sync)
 	EXPECT_EQ(count, 4);
 }
 
+FIXTURE(acl_cache_onoff)
+{
+	struct fuse_common_ctx ctx;
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
+	pthread_mutex_unlock(&g_ds.lock);
+
+	if (fs_setup(&fs_ops, &self->ctx, err))
+		SKIP(return, err);
+
+	snprintf(self->pathname, sizeof(self->pathname),
+		 "%s/" FILE_NAME, self->ctx.mountpoint);
+}
+
+FIXTURE_TEARDOWN(acl_cache_onoff)
+{
+	fs_teardown(&self->ctx);
+	free(g_ds.acl);
+}
+
+/*
+ * This is the most basic ACL caching test: verify that, when reading ACLs for
+ * an inode, user-space is called:
+ * - Only once if ACLs cache is enabled, or
+ * - Once per access if cache is disabled.
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
+ * 2. When invalidating an inode (NOTIFY_INVAL_INODE)
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
+	fuse_lowlevel_notify_inval_inode(self->ctx.se, FILE_INO, 0, 0);
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

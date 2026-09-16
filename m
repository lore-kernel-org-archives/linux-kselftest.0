Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B2849B46B;
	Wed, 16 Sep 2026 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574171; cv=none; b=XWzOcBLeakydEZjqOeMWSGNPJf/YmUUnXW7onKKVf/LScoyfFCHxNWMG6lWUBGyfHH1mupfl9vv/9XJQLfR9KS9GOutThzmszmc8EM/bLRcwRpoRnEGCSEJ9BpTJpFlHizmueO03TywrZdNXPUVaTS0VdBS1BT8P8uX5q2WqWLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574171; c=relaxed/simple;
	bh=VWrxC+F7RNQED608TByTU9wAn+Ih9zmDUqi5DpoG1Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uo96JwuiMKi69vDcWNQTD7is90yhZOsGvM+FMLk7hh7OWl4NyDeQrU699dasKEJfTgTbgcZNVMDBX7BdFL+CqRl0gCFkPZ+vaC3kgz4wF1Ay2U2UdJy4v+UbtOiFL0y0YcBqzOc66R4xg7EG6JsYof3XjbnakXHFC0UtsPgN8+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=p4AilE3n; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="p4AilE3n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=rxheP1ERmFlAX9lnQeyNk/8Tcf/EPLnd+vP9RKEHo74=; b=
	p4AilE3n3abzhCHp1JlNLpJfhGOoLDj67XYwRPpqfUDNmli8+Or5jVyIBAs5R0CZDlshZhSQsdiTc
	2z4JwRH+FOyQ48OFS1Fj4OjSZgnYpvVYZH64FTmkXn0hAG0RoirwbPPTCrod4EF7VL37Gz0Pj/WVx
	Bsxf+j6T312ZW3LTaWs4f2d6ch80XFg59rFnoUx8qXEmqZVVv14y/TMcYMAbr3qWc5SjeMCrwgyW4
	KSoIjM0m2Bpem/GfY98pERFr5jMtx0vrbzpI+9fN5XkD40iAkRfim85SAqbayhI4eHq0nj90aD8KX
	xvdbXEZbX0rjIwXKbAm8kiCf2Os3PH+8Hg==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6ryx-0031Jd-UL; Wed, 16 Sep 2026 17:55:35 +0200
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
Subject: [RFC PATCH v4 5/8] selftests/fuse: use dynamically allocated memory to store ACLs
Date: Wed, 16 Sep 2026 16:56:26 +0100
Message-ID: <20260916155629.32421-6-luis@igalia.com>
In-Reply-To: <20260916155629.32421-1-luis@igalia.com>
References: <20260916155629.32421-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of directly using static arrays for the ACL value, allocate memory
for storing it.  This will make it easier to implement ACL tests that also
set the xattr dynamically.

Signed-off-by: Luis Henriques <luis@igalia.com>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
---
 .../filesystems/fuse/fuse_acl_cache_test.c    | 32 ++++++++++++++++---
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
index d5a966e7fc15..fb4e3554e3c9 100644
--- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
+++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
@@ -81,7 +81,7 @@ static const uint8_t acl_b[] = {
 struct daemon_state {
 	pthread_mutex_t lock;
 	struct fuse_common_ctx ctx;
-	const uint8_t  *acl;
+	uint8_t		*acl;
 	size_t          acl_size;
 	int             getxattr_count;
 };
@@ -143,15 +143,26 @@ static void fs_getattr(fuse_req_t req, fuse_ino_t ino,
 static void fs_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
 			size_t size)
 {
+	uint8_t *acl = NULL;
+	size_t acl_size;
+
 	if (ino != FILE_INO ||
 	    strcmp(name, "system.posix_acl_access") != 0) {
 		fuse_reply_err(req, ENODATA);
 		return;
 	}
 
+	if (size) {
+		acl = malloc(size);
+		if (!acl) {
+			fuse_reply_err(req, ENOMEM);
+			return;
+		}
+	}
 	pthread_mutex_lock(&g_ds.lock);
-	const uint8_t *acl      = g_ds.acl;
-	size_t         acl_size = g_ds.acl_size;
+	acl_size = g_ds.acl_size;
+	if (acl && (size >= acl_size))
+		memcpy(acl, g_ds.acl, acl_size);
 	g_ds.getxattr_count++;
 	pthread_mutex_unlock(&g_ds.lock);
 
@@ -161,6 +172,8 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
 		fuse_reply_err(req, ERANGE);
 	else
 		fuse_reply_buf(req, (const char *)acl, acl_size);
+
+	free(acl);
 }
 
 static const struct fuse_lowlevel_ops fs_ops = {
@@ -180,8 +193,10 @@ FIXTURE_SETUP(acl_cache)
 	char err[MAX_ERR_MSG];
 
 	pthread_mutex_lock(&g_ds.lock);
-	g_ds.acl = acl_a;
 	g_ds.acl_size = sizeof(acl_a);
+	g_ds.acl = malloc(g_ds.acl_size);
+	ASSERT_NE(g_ds.acl, NULL);
+	memcpy(g_ds.acl, acl_a, g_ds.acl_size);
 	g_ds.getxattr_count = 0;
 
 	if (fs_setup(&fs_ops, &g_ds.ctx, err))
@@ -198,6 +213,7 @@ FIXTURE_TEARDOWN(acl_cache)
 	pthread_mutex_lock(&g_ds.lock);
 	fs_teardown(&g_ds.ctx);
 	pthread_mutex_unlock(&g_ds.lock);
+	free(g_ds.acl);
 }
 
 static int do_force_statx(const char *path)
@@ -213,6 +229,7 @@ TEST_F(acl_cache, stale_after_force_sync)
 	char    buf[512];
 	ssize_t sz;
 	int     count;
+	uint8_t *acl;
 
 	/*
 	 * Step 1: two getxattr calls before any statx(FORCE_SYNC).
@@ -273,8 +290,13 @@ TEST_F(acl_cache, stale_after_force_sync)
 	 * !fc->posix_acl mounts (it skips forget_all_cached_acls in that case).
 	 * On a fixed kernel the ACL was never cached, so this is moot.
 	 */
+	acl = malloc(sizeof(acl_b));
+	ASSERT_NE(acl, NULL);
+	memcpy(acl, acl_b, sizeof(acl_b));
+
 	pthread_mutex_lock(&g_ds.lock);
-	g_ds.acl      = acl_b;
+	free(g_ds.acl);
+	g_ds.acl      = acl;
 	g_ds.acl_size = sizeof(acl_b);
 	pthread_mutex_unlock(&g_ds.lock);
 	TH_LOG("step 4: daemon switched to ACL_B (%zu bytes)", sizeof(acl_b));

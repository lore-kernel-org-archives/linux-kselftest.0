Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A885D38655D;
	Thu,  1 Oct 2026 16:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873309; cv=none; b=WjLiHxFKdgGFG1p+L+KN9ob+7Q3hkOjzMAC73Bhuh1qqiuMtdx/UpFLvpvKpV5pMDTJBH6cgOYgZKpgUDUqjLohM6eNm7kGpu4oKwOX3pU7RNBw5t/rivnSaIQb7og8m2RDvjCUXRhgG+T8TTAbBsHL4Uwc/49c0b4tAZ40riSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873309; c=relaxed/simple;
	bh=Lv3btq2EGsU7Wn1XXUO7wSR+eVwYrG7aogtL0T/1OQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iu3WodDk2SOJL2uyXRx07SsPIYyZvvQy/rwrhtZocwjPJojUAgj2uFG0QenMk56Tila0QvN/8v7q7LSMNoAb2OlCML6BT45pHGbWG+varpFIOdIk0CsVZ9YWkK/C61Z0yuStOEU9V9XeaY5EimWwjq6xnZG61gX5AX1yFHzpd4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=l8oZ7vXI; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="l8oZ7vXI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=8s1ti3JiFZj5zS1GR99Sb86oAE3gBM21MOxBMbGrTnQ=; b=
	l8oZ7vXI8BESRXASBnAJ3qrr2Hx95Yus0Wmse0qnBJRloyiLvYbvEyuSuQJus3GmHMhXTfLToLxve
	PHWvGtccAr+WTxEm3aFj94umu/fMMzxLCVc52yZD7KwZ4/nRGTgiqUydnGgzldOL3diujI/Hhjz2z
	qrkFpLylqJElIqLeRvwVQkhRypHvzfOpENNKFX9YgWlg4s89/NOiBi9uhJtQ0JhUbAoeOqA2h43jU
	PKMAEEJ8pzbdsiG+8v99EvDcgx2ze3hJV9E+WLRKTs8JVMylHcwArsuxlw7ja3GoUPKXQSMsEZgEK
	2pOsnAJKhB6r+jTPjS2Ukv8tmCcKuHHwIQ==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xCJxB-00AD0n-M9; Thu, 01 Oct 2026 18:48:17 +0200
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
Subject: [RFC PATCH v5 5/8] selftests/fuse: use dynamically allocated memory to store ACLs
Date: Thu,  1 Oct 2026 17:49:13 +0100
Message-ID: <20261001164916.15311-6-luis@igalia.com>
In-Reply-To: <20261001164916.15311-1-luis@igalia.com>
References: <20261001164916.15311-1-luis@igalia.com>
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
index 91ad41cc92b6..8485df64e7cc 100644
--- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
+++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
@@ -80,7 +80,7 @@ static const uint8_t acl_b[] = {
 
 struct daemon_state {
 	pthread_mutex_t lock;
-	const uint8_t  *acl;
+	uint8_t		*acl;
 	size_t          acl_size;
 	int             getxattr_count;
 };
@@ -142,15 +142,26 @@ static void fs_getattr(fuse_req_t req, fuse_ino_t ino,
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
 
@@ -160,6 +171,8 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
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
 	pthread_mutex_unlock(&g_ds.lock);
 
@@ -195,6 +210,7 @@ FIXTURE_SETUP(acl_cache)
 FIXTURE_TEARDOWN(acl_cache)
 {
 	fs_teardown(&self->ctx);
+	free(g_ds.acl);
 }
 
 static int do_force_statx(const char *path)
@@ -210,6 +226,7 @@ TEST_F(acl_cache, stale_after_force_sync)
 	char    buf[512];
 	ssize_t sz;
 	int     count;
+	uint8_t *acl;
 
 	/*
 	 * Step 1: two getxattr calls before any statx(FORCE_SYNC).
@@ -270,8 +287,13 @@ TEST_F(acl_cache, stale_after_force_sync)
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

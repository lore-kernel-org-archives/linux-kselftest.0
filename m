Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BD946C4D0;
	Fri,  4 Sep 2026 10:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518338; cv=none; b=WXUwpyn+ShdQU8gOjNFIZq3YEZ8PLlh9fO58xQMDHlqp8LoCeXo5dHVdxxZpx9oGw+Lk6LFxUrWUugYZDAZ7wAO4BfRtvxfybnCKpHznIo6rLQK+tqEOUUJrXUsBfjnY6poy6woevLosqpQzPjo9Sz9IlGmZ4tS+5QcFhxNApH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518338; c=relaxed/simple;
	bh=p9g1PUouT6Erw84QHlBFOLCTCegUKxVucfE3SQgpLT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gbf0zNN6Z/ORGYMOj/eyXjT35zJp6cALjOrYq6in49cgoed/pWkOhCV7hXlbfE3rGzojknNsKBVscCxg7G/wLW700+WS49UKvshHCEImYJpu7DLcBhrklWCnbzqGwGvtPGhNeGM8bv22jDXvWKvkPKI7Be91QvhXiwWqNmdPnpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=CBHlhqqu; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="CBHlhqqu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=EOI1gXGQqauK+VMxJAvurkqReNkZikt+yZ4YgoEKb80=; b=
	CBHlhqquF+Nk7ixCS4IFHzcrn0Rx9IZGRSk1w08+SWg/lCbFB1V/+JCJM4xR4EBoS9QJUpZAcB33I
	HZQFWrd+fhw49COf5UZIXNrylRt0q6ihjcNnskoJbBfza4/18CCjFbaDfilU7toe5cQ7faPB2i2XB
	lxw2Du1eW3o6Un6ycXNnGjSWRR75RRMG1GryO6CoWUGBpOX9GDIStYCEDooKMLqLyd22qdwZi9o1a
	ivDK4IihJ2cGsnsSvUI360SSxWT4BuVLBnHm8aFpRCPtCAgpvLfs20zzhYEOJOf3gMGjVD7N+Oh+W
	vqhUUPU0oaT5fU+etS1K5sLipC21P1etcw==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x2RJm-00Eq0v-OW; Fri, 04 Sep 2026 12:38:46 +0200
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
Subject: [RFC PATCH v3 5/8] selftests/fuse: use dynamically allocated memory to store ACLs
Date: Fri,  4 Sep 2026 11:39:17 +0100
Message-ID: <20260904103920.4471-6-luis@igalia.com>
In-Reply-To: <20260904103920.4471-1-luis@igalia.com>
References: <20260904103920.4471-1-luis@igalia.com>
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
---
 .../filesystems/fuse/fuse_acl_cache_test.c    | 32 ++++++++++++++++---
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
index 12cbf9753d03..c2d6658ff7de 100644
--- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
+++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
@@ -80,7 +80,7 @@ static const uint8_t acl_b[] = {
 
 struct daemon_state {
 	pthread_mutex_t lock;
-	const uint8_t  *acl;
+	uint8_t        *acl;
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
@@ -181,8 +194,10 @@ FIXTURE_SETUP(acl_cache)
 {
 	char err[MAX_ERR_MSG];
 
-	g_ds.acl = acl_a;
 	g_ds.acl_size = sizeof(acl_a);
+	g_ds.acl = malloc(g_ds.acl_size);
+	ASSERT_NE(g_ds.acl, NULL);
+	memcpy(g_ds.acl, acl_a, g_ds.acl_size);
 	g_ds.getxattr_count = 0;
 
 	if (fs_setup(&self->se, self->mountpoint, &fs_ops, &self->thread, err))
@@ -195,6 +210,7 @@ FIXTURE_SETUP(acl_cache)
 FIXTURE_TEARDOWN(acl_cache)
 {
 	fs_teardown(self->se, self->thread, self->mountpoint);
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

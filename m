Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69EE43CE77;
	Mon, 17 Aug 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975905; cv=none; b=MwoIQdSb6rEoIETdbL/hg0PAiISNBqlnF2rAmg4SWrvgZkeh1n7Sw0Q3LJZzS8IiEM+oJ2lcJle7hwnHaLxNQlTW1jpZHed/o8vUFqt6Q3AjmQI4PfMZDjSt19N+DQP4Kr3eGvwSz2kduJQfxJg2UI6NtSFOlyjFB/jIc4oR2lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975905; c=relaxed/simple;
	bh=M0H3WrcnOolr7jc34Nz78b2q5pmo61h42FZwDQEPCSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjTG58YbLGnahqltHPcgQF7+e0qYwROC7LbAUMg8lXQzp5RjsH5jEUReyxIhJg6WgOgVm3ZaP4HaCyj+/kUrZgx7WiZs81vdNeYoXLbGtwqQt6gadd+k+i0n7ts/f5R+L7mG2WU3puKxOwr0SACGzVi8c9Um6py1bGM6L+L7b1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=A48niJ/e; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="A48niJ/e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=8prppAdDmMPSt7YwLI9nxGXZpZx3pn5Vs27dXZc7IGo=; b=
	A48niJ/e50giiTNSGKVvb5lu8I4jUxOzT/ThVAy9S1sBtBiogNUYNIfXHLNz32wMia8Zy8dQmo/V+
	aqW5PL7MxtRDLBMDicnoiHi7MerZE78m3bIvqnJxbwd/Zd3WWzyzQfxhqNaZDcAzoA0Y5P0DeNpx2
	uGAr5C4uW28kO7hlxN5cb3ajWiz3wN1LMnIAEhLjOP6qQK3HzvUL+wWUFM5Kjm7RcgvY5+QUfH++M
	IUMsMrbuZZaExNc/CotsG/eQfejMM3YD7ADb5pw0MKZVPTRku5XebxOzlTxd7NpsYHlpJmEN41h8Z
	hrL7osERiMS5xsxQiqf5rX9kroMvp4NLEg==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wvy3q-004XyK-II; Mon, 17 Aug 2026 16:11:34 +0200
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
Subject: [RFC PATCH v2 6/8] selftests/fuse: use dynamically allocated memory to store ACLs
Date: Mon, 17 Aug 2026 15:11:54 +0100
Message-ID: <20260817141156.6079-7-luis@igalia.com>
In-Reply-To: <20260817141156.6079-1-luis@igalia.com>
References: <20260817141156.6079-1-luis@igalia.com>
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
 .../filesystems/fuse/fuse_acl_cache_test.c    | 34 +++++++++++++++----
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
index 8bdc90572be2..bf8b3807e603 100644
--- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
+++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
@@ -90,7 +90,7 @@ static const uint8_t acl_b[] = {
 
 struct daemon_state {
 	pthread_mutex_t lock;
-	const uint8_t  *acl;
+	uint8_t        *acl;
 	size_t          acl_size;
 	int             getxattr_count;
 };
@@ -152,15 +152,26 @@ static void fs_getattr(fuse_req_t req, fuse_ino_t ino,
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
 
@@ -170,6 +181,8 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
 		fuse_reply_err(req, ERANGE);
 	else
 		fuse_reply_buf(req, (const char *)acl, acl_size);
+
+	free(acl);
 }
 
 static const struct fuse_lowlevel_ops fs_ops = {
@@ -251,8 +264,10 @@ FIXTURE_SETUP(acl_cache)
 {
 	char err[MAX_ERR_MSG];
 
-	g_ds.acl            = acl_a;
-	g_ds.acl_size       = sizeof(acl_a);
+	g_ds.acl_size = sizeof(acl_a);
+	g_ds.acl = malloc(g_ds.acl_size);
+	ASSERT_NE(g_ds.acl, NULL);
+	memcpy(g_ds.acl, acl_a, g_ds.acl_size);
 	g_ds.getxattr_count = 0;
 
 	if (fs_setup(&self->se, self->mountpoint, self->file_path,
@@ -263,6 +278,7 @@ FIXTURE_SETUP(acl_cache)
 FIXTURE_TEARDOWN(acl_cache)
 {
 	fs_teardown(self->se, self->thread, self->mountpoint);
+	free(g_ds.acl);
 }
 
 static int do_force_statx(const char *path)
@@ -278,6 +294,7 @@ TEST_F(acl_cache, stale_after_force_sync)
 	char    buf[512];
 	ssize_t sz;
 	int     count;
+	uint8_t *acl;
 
 	/*
 	 * Step 1: two getxattr calls before any statx(FORCE_SYNC).
@@ -338,8 +355,13 @@ TEST_F(acl_cache, stale_after_force_sync)
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

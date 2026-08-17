Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2659427FB2;
	Mon, 17 Aug 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975905; cv=none; b=BtUj1M/kiL4B7EAZEh2jBR+Q5REfvZIG6lD4+vkdYZmkfdrex5VhrhwDzBWKo2vkxt0hkEy2SjVbymA20kb5OrdtmoLokM41w3TTzYULy0IHY+SI2172YByyz2G6UX5ZNA9DJ+RqRqTUrcYu9TloDMCJi9t/UhMhP/jRexXPyao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975905; c=relaxed/simple;
	bh=ihSKibfTWpBQSjjXSDVwzIluMaj7qMkuoUclca7rI1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eG9NgNe5Q4e2prze6Dz0C65zCRUjIQuH+CO/QuCii/Oo3HRwMoiP/JS2wr32r/LnDwp9sFt06z9oW2JiFDEoouYBaCVYI6K7cMJvObtuYeIUNea3BNxb+Us12v5WKBJY7W7gYz4sNQMCSVFBPwgsQQGiosUrnnDSdy0+lab1JPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=LfhbzVrq; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="LfhbzVrq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=IgEqs6/CtSLWAT0HRstB1punCeJ+FxZhdHbf0ovicU4=; b=
	LfhbzVrq9N7aCJ5B85/FJiFaWuc/aAmayMsGyJpOErkSbbwvVIMzsGma8F4K2bj9Z2sDMztercTYZ
	ZAv3MPJ0BmuCTRTc+UZUvmxz853IgsFiRLezo2kLmU0L5jYcPQggWfl8C8X6O9pcWrOxpVyULl7b1
	vK2wjU+7mMjBRyGMHctvGN8c/4AD0sal6Z2E0BpL7cBII5VmU1g3eTasJwoIrq/E2n9Yfp1M9uPfl
	NmAgjBXn6TqYuLdbv7vWME4jEMFm4YZzFzU+RGxzbwSl7jNyXjLLsSnV97HXqfnxopVMLebdy2uDi
	kaSEgRnw7QB6GnnSa0MoycNJThzmP+/FMw==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wvy3q-004XyF-1W; Mon, 17 Aug 2026 16:11:34 +0200
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
Subject: [RFC PATCH v2 5/8] selftests/fuse: factor-out test fixture setup/teardown
Date: Mon, 17 Aug 2026 15:11:53 +0100
Message-ID: <20260817141156.6079-6-luis@igalia.com>
In-Reply-To: <20260817141156.6079-1-luis@igalia.com>
References: <20260817141156.6079-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to reduce new tests setup/teardown code duplication, factor-out
these functions from the existing acl_cache test.

Signed-off-by: Luis Henriques <luis@igalia.com>
---
 .../filesystems/fuse/fuse_acl_cache_test.c    | 82 ++++++++++++-------
 1 file changed, 53 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
index 2411a6e285f1..8bdc90572be2 100644
--- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
+++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
@@ -50,6 +50,8 @@
 
 #include "kselftest_harness.h"
 
+#define MAX_ERR_MSG 256
+
 /* ---- ACL binary encoding ------------------------------------------------ */
 /*
  * POSIX ACL v2 xattr format (little-endian):
@@ -193,52 +195,74 @@ FIXTURE(acl_cache) {
 	pthread_t            thread;
 };
 
-FIXTURE_SETUP(acl_cache)
+int fs_setup(struct fuse_session **se, char *mountpoint, char *file_path,
+	     pthread_t *thread, char *err)
 {
 	char *fuse_argv[] = { "fuse_acl_cache_test", NULL };
 	struct fuse_args args = FUSE_ARGS_INIT(1, fuse_argv);
 
-	g_ds.acl            = acl_a;
-	g_ds.acl_size       = sizeof(acl_a);
-	g_ds.getxattr_count = 0;
-
-	strcpy(self->mountpoint, "/tmp/acl_cache_test_XXXXXX");
-	if (!mkdtemp(self->mountpoint))
-		SKIP(return, "mkdtemp: %s", strerror(errno));
+	strcpy(mountpoint, "/tmp/acl_cache_test_XXXXXX");
+	if (!mkdtemp(mountpoint)) {
+		snprintf(err, MAX_ERR_MSG, "mkdtemp: %s", strerror(errno));
+		return -1;
+	}
 
-	snprintf(self->file_path, sizeof(self->file_path),
-		 "%s/" FILE_NAME, self->mountpoint);
+	snprintf(file_path, PATH_MAX, "%s/" FILE_NAME, mountpoint);
 
-	self->se = fuse_session_new(&args, &fs_ops, sizeof(fs_ops), NULL);
-	if (!self->se) {
-		rmdir(self->mountpoint);
-		SKIP(return, "fuse_session_new failed");
+	*se = fuse_session_new(&args, &fs_ops, sizeof(fs_ops), NULL);
+	if (!*se) {
+		rmdir(mountpoint);
+		snprintf(err, MAX_ERR_MSG, "fuse_session_new failed");
+		return -1;
 	}
 
-	if (fuse_session_mount(self->se, self->mountpoint)) {
-		fuse_session_destroy(self->se);
-		rmdir(self->mountpoint);
-		SKIP(return, "fuse_session_mount failed "
-			     "(missing fusermount3 or insufficient privileges)");
+	if (fuse_session_mount(*se, mountpoint)) {
+		fuse_session_destroy(*se);
+		rmdir(mountpoint);
+		snprintf(err, MAX_ERR_MSG, "fuse_session_mount failed "
+			"(missing fusermount3 or insufficient privileges)");
+		return -1;
 	}
 
-	if (pthread_create(&self->thread, NULL, run_daemon, self->se)) {
-		fuse_session_unmount(self->se);
-		fuse_session_destroy(self->se);
-		rmdir(self->mountpoint);
-		SKIP(return, "pthread_create: %s", strerror(errno));
+	if (pthread_create(thread, NULL, run_daemon, *se)) {
+		fuse_session_unmount(*se);
+		fuse_session_destroy(*se);
+		rmdir(mountpoint);
+		snprintf(err, MAX_ERR_MSG, "pthread_create: %s", strerror(errno));
+		return -1;
 	}
 
 	fuse_opt_free_args(&args);
+
+	return 0;
+}
+
+static void fs_teardown(struct fuse_session *se, pthread_t thread,
+			char *mountpoint)
+{
+	fuse_session_exit(se);
+	fuse_session_unmount(se);
+	pthread_join(thread, NULL);
+	fuse_session_destroy(se);
+	rmdir(mountpoint);
+}
+
+FIXTURE_SETUP(acl_cache)
+{
+	char err[MAX_ERR_MSG];
+
+	g_ds.acl            = acl_a;
+	g_ds.acl_size       = sizeof(acl_a);
+	g_ds.getxattr_count = 0;
+
+	if (fs_setup(&self->se, self->mountpoint, self->file_path,
+		     &self->thread, err))
+		SKIP(return, err);
 }
 
 FIXTURE_TEARDOWN(acl_cache)
 {
-	fuse_session_exit(self->se);
-	fuse_session_unmount(self->se);
-	pthread_join(self->thread, NULL);
-	fuse_session_destroy(self->se);
-	rmdir(self->mountpoint);
+	fs_teardown(self->se, self->thread, self->mountpoint);
 }
 
 static int do_force_statx(const char *path)

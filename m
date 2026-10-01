Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F231F1534;
	Thu,  1 Oct 2026 16:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873308; cv=none; b=WaLlFQDOBkEsLa6tg+iKX1b8q/tcCEtJJ8GKPj02uvWpsEjzcwHK4IPBrKP+oWbBzbyfedx3cSrltnkhLS738tL5FVCicvnWYH+hiFXAhlKIG3HTabGqno6vRpNwQud/8QZyJD1v/lP7eQ4c/SLBtGnxUgLsRf0FcLYKDcbxc2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873308; c=relaxed/simple;
	bh=G7+3lU9wDqbL1f7kEQNF55c8hkpXobunfFEQgFVURbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWay1MryCK0NS+hqZmhcBYMl2l7RTzmRZeehOKxcgNeNEbzj1kdBJT04fqY4n4rA1xYejhfn4On0pAnjZL/jivCZDBbw08SIXEyaDmtiMtpd77UMvxZPIWDv7EtHwboKiKYXsk9vyxrZZrKtQ4HdoR7TZ4DFOH1ygLgDUlS0hRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=XX6xIhT6; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="XX6xIhT6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=KuGNjjze5ppp4adzfjDEGKPUvGCVYboh+QSIjRO3fUk=; b=
	XX6xIhT6zPGav4Ote/gB2A6Y9UIXhSrQMRnCFR+eDyqHpFqZxbcKxOd3zhkiQcwnT7Vi2zAfHT3h9
	jyZawxAjIgIlVmXRMcqmwC9YgrNrHMAWILvv7Q0WACFud8hIsJcVQ/a/sxZJx5aZQTlEZBq2dvUaP
	rHYYMVr/z3YrpIGV99mB6zAg79+O4QHqUrsGyG5u+28+ZcHinPX0G9Op9aPQ6V1odRSf8jT3F8/DY
	8PBe2bWBA+U/Vr1+2iunnqFEZDH2yPOrvkMgE0jDgXaPIOlUCSm87qinBITrwBzupRhXdy3XyUs81
	r8RzUEcfZKGRDgc5ichcdprkWWfbeYzZ9Q==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xCJxB-00AD0l-7O; Thu, 01 Oct 2026 18:48:17 +0200
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
Subject: [RFC PATCH v5 4/8] selftests/fuse: factor-out test fixture setup/teardown
Date: Thu,  1 Oct 2026 17:49:12 +0100
Message-ID: <20261001164916.15311-5-luis@igalia.com>
In-Reply-To: <20261001164916.15311-1-luis@igalia.com>
References: <20261001164916.15311-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to reduce new tests setup/teardown code duplication, factor-out
these functions from the existing acl_cache test into a new fuse_common.c
file that can be reused in other tests.

While there, also move some of the FIXTURE members into a fuse_common_ctx
structure that can be passed into setup/teardown instead of passing them by
reference.

Signed-off-by: Luis Henriques <luis@igalia.com>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
---
 .../selftests/filesystems/fuse/Makefile       |  8 ++-
 .../filesystems/fuse/fuse_acl_cache_test.c    | 70 ++++---------------
 .../selftests/filesystems/fuse/fuse_common.c  | 58 +++++++++++++++
 .../selftests/filesystems/fuse/fuse_common.h  | 33 +++++++++
 4 files changed, 110 insertions(+), 59 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_common.c
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_common.h

diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/testing/selftests/filesystems/fuse/Makefile
index a3ee9b3a2f5d..7744f796eb06 100644
--- a/tools/testing/selftests/filesystems/fuse/Makefile
+++ b/tools/testing/selftests/filesystems/fuse/Makefile
@@ -21,8 +21,12 @@ ifeq ($(VAR_LDLIBS),)
 VAR_LDLIBS := -lfuse3 -pthread
 endif
 
+CFLAGS += $(VAR_CFLAGS)
+LDLIBS += $(VAR_LDLIBS)
+
 $(OUTPUT)/fuse_mnt: CFLAGS += $(VAR_CFLAGS)
 $(OUTPUT)/fuse_mnt: LDLIBS += $(VAR_LDLIBS)
 
-$(OUTPUT)/fuse_acl_cache_test: CFLAGS += $(VAR_CFLAGS)
-$(OUTPUT)/fuse_acl_cache_test: LDLIBS += $(VAR_LDLIBS)
+$(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
+
+EXTRA_CLEAN := fuse_common.o
diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
index 2411a6e285f1..91ad41cc92b6 100644
--- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
+++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
@@ -33,23 +33,15 @@
  */
 
 #define _GNU_SOURCE
-#include <errno.h>
 #include <fcntl.h>
 #include <linux/limits.h>
-#include <pthread.h>
 #include <stdint.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <sys/stat.h>
 #include <sys/xattr.h>
-#include <unistd.h>
-
-#define FUSE_USE_VERSION 31
-#include <fuse_lowlevel.h>
 
 #include "kselftest_harness.h"
 
+#include "fuse_common.h"
+
 /* ---- ACL binary encoding ------------------------------------------------ */
 /*
  * POSIX ACL v2 xattr format (little-endian):
@@ -176,69 +168,33 @@ static const struct fuse_lowlevel_ops fs_ops = {
 	.getxattr = fs_getxattr,
 };
 
-/* ---- Daemon thread ------------------------------------------------------- */
-
-static void *run_daemon(void *arg)
-{
-	fuse_session_loop((struct fuse_session *)arg);
-	return NULL;
-}
-
 /* ---- kselftest harness --------------------------------------------------- */
 
 FIXTURE(acl_cache) {
-	struct fuse_session *se;
-	char                 mountpoint[PATH_MAX];
-	char                 file_path[PATH_MAX];
-	pthread_t            thread;
+	struct fuse_common_ctx ctx;
+	char file_path[PATH_MAX];
 };
 
 FIXTURE_SETUP(acl_cache)
 {
-	char *fuse_argv[] = { "fuse_acl_cache_test", NULL };
-	struct fuse_args args = FUSE_ARGS_INIT(1, fuse_argv);
+	char err[MAX_ERR_MSG];
 
-	g_ds.acl            = acl_a;
-	g_ds.acl_size       = sizeof(acl_a);
+	pthread_mutex_lock(&g_ds.lock);
+	g_ds.acl = acl_a;
+	g_ds.acl_size = sizeof(acl_a);
 	g_ds.getxattr_count = 0;
+	pthread_mutex_unlock(&g_ds.lock);
 
-	strcpy(self->mountpoint, "/tmp/acl_cache_test_XXXXXX");
-	if (!mkdtemp(self->mountpoint))
-		SKIP(return, "mkdtemp: %s", strerror(errno));
+	if (fs_setup(&fs_ops, &self->ctx, err))
+		SKIP(return, err);
 
 	snprintf(self->file_path, sizeof(self->file_path),
-		 "%s/" FILE_NAME, self->mountpoint);
-
-	self->se = fuse_session_new(&args, &fs_ops, sizeof(fs_ops), NULL);
-	if (!self->se) {
-		rmdir(self->mountpoint);
-		SKIP(return, "fuse_session_new failed");
-	}
-
-	if (fuse_session_mount(self->se, self->mountpoint)) {
-		fuse_session_destroy(self->se);
-		rmdir(self->mountpoint);
-		SKIP(return, "fuse_session_mount failed "
-			     "(missing fusermount3 or insufficient privileges)");
-	}
-
-	if (pthread_create(&self->thread, NULL, run_daemon, self->se)) {
-		fuse_session_unmount(self->se);
-		fuse_session_destroy(self->se);
-		rmdir(self->mountpoint);
-		SKIP(return, "pthread_create: %s", strerror(errno));
-	}
-
-	fuse_opt_free_args(&args);
+		 "%s/" FILE_NAME, self->ctx.mountpoint);
 }
 
 FIXTURE_TEARDOWN(acl_cache)
 {
-	fuse_session_exit(self->se);
-	fuse_session_unmount(self->se);
-	pthread_join(self->thread, NULL);
-	fuse_session_destroy(self->se);
-	rmdir(self->mountpoint);
+	fs_teardown(&self->ctx);
 }
 
 static int do_force_statx(const char *path)
diff --git a/tools/testing/selftests/filesystems/fuse/fuse_common.c b/tools/testing/selftests/filesystems/fuse/fuse_common.c
new file mode 100644
index 000000000000..d1d3dfd2ea67
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/fuse_common.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "fuse_common.h"
+
+static void *run_daemon(void *arg)
+{
+	fuse_session_loop((struct fuse_session *)arg);
+	return NULL;
+}
+
+int fs_setup(const struct fuse_lowlevel_ops *fs_ops,
+	     struct fuse_common_ctx *ctx, char *err)
+{
+	char *fuse_argv[] = { "fuse_test", NULL };
+	struct fuse_args args = FUSE_ARGS_INIT(1, fuse_argv);
+
+	strcpy(ctx->mountpoint, MOUNTPOINT_TEMPLATE);
+	if (!mkdtemp(ctx->mountpoint)) {
+		snprintf(err, MAX_ERR_MSG, "mkdtemp: %s", strerror(errno));
+		return -1;
+	}
+
+	ctx->se = fuse_session_new(&args, fs_ops, sizeof(*fs_ops), NULL);
+	if (!ctx->se) {
+		rmdir(ctx->mountpoint);
+		snprintf(err, MAX_ERR_MSG, "fuse_session_new failed");
+		return -1;
+	}
+
+	if (fuse_session_mount(ctx->se, ctx->mountpoint)) {
+		fuse_session_destroy(ctx->se);
+		rmdir(ctx->mountpoint);
+		snprintf(err, MAX_ERR_MSG, "fuse_session_mount failed "
+			"(missing fusermount3 or insufficient privileges)");
+		return -1;
+	}
+
+	if (pthread_create(&ctx->thread, NULL, run_daemon, ctx->se)) {
+		fuse_session_unmount(ctx->se);
+		fuse_session_destroy(ctx->se);
+		rmdir(ctx->mountpoint);
+		snprintf(err, MAX_ERR_MSG, "pthread_create: %s", strerror(errno));
+		return -1;
+	}
+
+	fuse_opt_free_args(&args);
+
+	return 0;
+}
+
+void fs_teardown(struct fuse_common_ctx *ctx)
+{
+	fuse_session_exit(ctx->se);
+	fuse_session_unmount(ctx->se);
+	pthread_join(ctx->thread, NULL);
+	fuse_session_destroy(ctx->se);
+	rmdir(ctx->mountpoint);
+}
diff --git a/tools/testing/selftests/filesystems/fuse/fuse_common.h b/tools/testing/selftests/filesystems/fuse/fuse_common.h
new file mode 100644
index 000000000000..5beb6bf89425
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fuse/fuse_common.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __SELFTEST_FUSE_COMMON_H__
+#define __SELFTEST_FUSE_COMMON_H__
+
+#define _GNU_SOURCE
+#include <errno.h>
+#include <pthread.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <limits.h>
+
+#define FUSE_USE_VERSION 31
+#include <fuse_lowlevel.h>
+
+#define MAX_ERR_MSG 256
+
+#define MOUNTPOINT_TEMPLATE "/tmp/fuse_test_XXXXXX"
+#define MOUNTPOINT_SZ 64
+
+struct fuse_common_ctx {
+	struct fuse_session *se;
+	char mountpoint[MOUNTPOINT_SZ];
+	pthread_t thread;
+};
+
+int fs_setup(const struct fuse_lowlevel_ops *fs_ops,
+	     struct fuse_common_ctx *ctx, char *err);
+void fs_teardown(struct fuse_common_ctx *ctx);
+
+#endif /* __SELFTEST_FUSE_COMMON_H__ */

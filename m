Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7461917CD
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 00:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775003313; cv=none; b=aoGQstBDN2lr1W8cnC8iLGi2ps4VEuGgNswNFYGVyK0KBn03IQOGIOQkNxNSynz7YUwYhFNf+X/TZb4XtMZO9CDKytcz1jePwiUZxlcKdaW3lhTumsSf/lV1SWKpjlBjbrWQGWMKl8QO4DZPsQVZ9dsmTCkUt6UXra/EmGdqq34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775003313; c=relaxed/simple;
	bh=/SkZnf9rgHNSdrHLq0MfYdlt06Qrh2Su8iA0QXWXAkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D2gFPMGQiOUoMWdbj/lLEHADgS87QiYTWj7XKZBTAv/MOCaPKCRN2BB+Y5dj9CPuohhGN+KW/RQ9JhLSkevft7SiV7Kdh84wDRDiShbykJJUQE7Hn8Zho/ZKodH7K6GEDrhhjPZoj1YzP7s60r6gUMjR+nvxHmhCl5ZQIYX6n9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20230601.gappssmtp.com header.i=@amutable-com.20230601.gappssmtp.com header.b=ECS2W3Px; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20230601.gappssmtp.com header.i=@amutable-com.20230601.gappssmtp.com header.b="ECS2W3Px"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so13688485ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 17:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20230601.gappssmtp.com; s=20230601; t=1775003311; x=1775608111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+MmmkffR4AjWlUAh1Y8qnRVcsjhTa+f38j2owrthlg=;
        b=ECS2W3Pxds9+0eScQYDqj16+IgX/MrqXFR7n0i23oOt4srGFf43gigjTFmw1mVHw4e
         weh4QjxD97QdUxNq9Ydtd3x4frtJ1AnzoH8uve6GphWB2KKhNlXb1kKTPayqD3PoQT/u
         PsLVut5L+bilByZrPsdPnGMHzE5cKvOwp9+UpPrL4Fiu4cG0NOpXE6uGVADJZcMgXVXl
         H560KxV9wjl7ivVIGo1oYGQLrdbjChTJtLWo6JTH8w6yZaN9CAi0U4WGSYfYtdeObDP0
         pyqnJvGK46emdlaIfnBVlfV9qLEt5mbuZTRDzeQjMHF33C8mP21A7nRQysIRxLIVx32m
         T9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775003311; x=1775608111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R+MmmkffR4AjWlUAh1Y8qnRVcsjhTa+f38j2owrthlg=;
        b=PEbhAWTQN2ykRTQVKFuKKs3Ewo95riuDVM6I35Rkz3l+lLgzSPXKAjrs+UMUssS2+A
         ehWtr+CTtV8UBAOQHradjaS0kPAj2KSWf32KgTfiZ5xroa7Uhy52zgUYlGrVXjqD8MtT
         zK8CrhNBG+uiOJbSvXT0aa4WYuLIVrnvGqWuI012zV5igp1vZJM7B0zqQf1tOkXMyAYH
         ub81KLsX1/ueTMttMglLJR8z/LJ0Jze/BnpQywDbUK6RrWLhcGBFr1VTZfuUl3Bo8Jml
         K1bgbWxoNJVxXjK399EXUXznLfohe2PXm4HkQDL+RlmbBlHz0GjlqcdrWF11fRgCNDdg
         y32w==
X-Forwarded-Encrypted: i=1; AJvYcCXCagnM72LR9dRTjYufu9Rdh08+ruxuHYy08Yik/2EziBAWfWH2ja/dd0t98ecLygs+nBHvYOwsbCpfDMQEO6M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7RcvNQqOCoZuepoQeF0xFNvjJsr/TyBgW9J0nzQRg+DkXDv6A
	KWxf/ljQwGvqxvfE4qc4GQOxx9Jzs9aILQU8/KS1/n6a86OdHUcsO1HzRBsbi8xlvE9V
X-Gm-Gg: ATEYQzzS3b0fNF/W1rZD3ORw0DenPmlbQI7dF28XnRjF4rSSP8XvrbjvVC7eqAZhFR8
	HpQ95QQpE31gQPu4nENmzuHUw+2s5oHq1Nes54xDG+BFM+bRL41mlyoD8eTxg1/J8h1Ir5YUaLa
	prEETGmgsftzwZJgh+BzMRHFpBxo893I2bIsHI2FXjU/6NMQel3KaiGloL3zUGVCl6dnhYKkk6Z
	nau7jedqw8NpasegtWhnSRJaF++o86DkbkRHExxc1+iw/D0JJ3aQxu17O0Fs73BNur8pawwocVH
	ymIq5f/yj9GHtQe7CTyEoS3eueIb9ghGc6oc959mJrlW60u9GW/ptuZVETt0IBAiWnADmLEwa7u
	w84D99dPiGFxhcTdcu1a/nxeYsH1cUFbE4MjtFdXrNzQYHTZcwykjfCAGraVRmpy0JoLELCSUz2
	LEhWSivzu71CJcr579r5zfBMIl5XDktGIZxxvmRK7JwSiyjB9DIYj6L6ctmMxlnMqs1tV6M4jMX
	JvfnEC6ul1BId9UWMOSe5KmGA==
X-Received: by 2002:a17:903:904:b0:2ae:57e6:616c with SMTP id d9443c01a7336-2b269a80ba6mr12616225ad.3.1775003311440;
        Tue, 31 Mar 2026 17:28:31 -0700 (PDT)
Received: from thesius.dot.cyphar.com (2403-5809-a2fc-2-a90-9fd7-aedd-d405.ip6.aussiebb.net. [2403:5809:a2fc:2:a90:9fd7:aedd:d405])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264264fsm157057825ad.2.2026.03.31.17.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:28:31 -0700 (PDT)
From: Aleksa Sarai <aleksa@amutable.com>
Date: Wed, 01 Apr 2026 11:28:03 +1100
Subject: [PATCH v2 2/4] selftests: openat2: move helpers to header
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-openat2-selftests-kunit-v2-2-ad153a07da0c@amutable.com>
References: <20260401-openat2-selftests-kunit-v2-0-ad153a07da0c@amutable.com>
In-Reply-To: <20260401-openat2-selftests-kunit-v2-0-ad153a07da0c@amutable.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Aleksa Sarai <cyphar@cyphar.com>, Aleksa Sarai <aleksa@amutable.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8185; i=aleksa@amutable.com;
 h=from:subject:message-id; bh=/SkZnf9rgHNSdrHLq0MfYdlt06Qrh2Su8iA0QXWXAkA=;
 b=owGbwMvMwCWmMf3Xpe0vXfIZT6slMWSeSVv86oFI7KKv1z147GpuBJfLq961X5zVucEyd96j1
 N+W69lWdUxkYRDjYrAUU2TZ5ucZumn+4ivJn1aywcxhZQIZIi3SwMDAwMDCwJebmFdqpGOkZ6pt
 qGdopGOkY8TAxSkAU13FzPDPdv29e3onpm2+FPX7WmNe7dbMxc1WG8vedPevcH3Tb+WxgeGfluf
 nPTXZW46nJRzJ/PxH6KCumuNRU7sXlR7VApek1XMYAQ==
X-Developer-Key: i=aleksa@amutable.com; a=openpgp;
 fpr=C9C370B246B09F6DBCFC744C34401015D1D2D386

This is a bit ugly, but in the next patch we will move to using
kselftest_harness.h -- which doesn't play well with being included in
multiple compilation units due to duplicate function definitions.

Not including kselftest_harness.h would let us avoid this patch, but the
helpers will need include kselftest_harness.h in order to switch to
TH_LOG.

Signed-off-by: Aleksa Sarai <aleksa@amutable.com>
---
 .../testing/selftests/filesystems/openat2/Makefile |   2 -
 .../selftests/filesystems/openat2/helpers.c        | 109 ------------------
 .../selftests/filesystems/openat2/helpers.h        | 125 ++++++++++++++++++---
 3 files changed, 107 insertions(+), 129 deletions(-)

diff --git a/tools/testing/selftests/filesystems/openat2/Makefile b/tools/testing/selftests/filesystems/openat2/Makefile
index f36dedccedb6..7736e37b7986 100644
--- a/tools/testing/selftests/filesystems/openat2/Makefile
+++ b/tools/testing/selftests/filesystems/openat2/Makefile
@@ -15,5 +15,3 @@ endif
 LOCAL_HDRS += helpers.h
 
 include ../../lib.mk
-
-$(TEST_GEN_PROGS): helpers.c
diff --git a/tools/testing/selftests/filesystems/openat2/helpers.c b/tools/testing/selftests/filesystems/openat2/helpers.c
deleted file mode 100644
index 5074681ffdc9..000000000000
--- a/tools/testing/selftests/filesystems/openat2/helpers.c
+++ /dev/null
@@ -1,109 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Author: Aleksa Sarai <cyphar@cyphar.com>
- * Copyright (C) 2018-2019 SUSE LLC.
- */
-
-#define _GNU_SOURCE
-#include <errno.h>
-#include <fcntl.h>
-#include <stdbool.h>
-#include <string.h>
-#include <syscall.h>
-#include <limits.h>
-
-#include "helpers.h"
-
-bool needs_openat2(const struct open_how *how)
-{
-	return how->resolve != 0;
-}
-
-int raw_openat2(int dfd, const char *path, void *how, size_t size)
-{
-	int ret = syscall(__NR_openat2, dfd, path, how, size);
-	return ret >= 0 ? ret : -errno;
-}
-
-int sys_openat2(int dfd, const char *path, struct open_how *how)
-{
-	return raw_openat2(dfd, path, how, sizeof(*how));
-}
-
-int sys_openat(int dfd, const char *path, struct open_how *how)
-{
-	int ret = openat(dfd, path, how->flags, how->mode);
-	return ret >= 0 ? ret : -errno;
-}
-
-int sys_renameat2(int olddirfd, const char *oldpath,
-		  int newdirfd, const char *newpath, unsigned int flags)
-{
-	int ret = syscall(__NR_renameat2, olddirfd, oldpath,
-					  newdirfd, newpath, flags);
-	return ret >= 0 ? ret : -errno;
-}
-
-int touchat(int dfd, const char *path)
-{
-	int fd = openat(dfd, path, O_CREAT, 0700);
-	if (fd >= 0)
-		close(fd);
-	return fd;
-}
-
-char *fdreadlink(int fd)
-{
-	char *target, *tmp;
-
-	E_asprintf(&tmp, "/proc/self/fd/%d", fd);
-
-	target = malloc(PATH_MAX);
-	if (!target)
-		ksft_exit_fail_msg("fdreadlink: malloc failed\n");
-	memset(target, 0, PATH_MAX);
-
-	E_readlink(tmp, target, PATH_MAX);
-	free(tmp);
-	return target;
-}
-
-bool fdequal(int fd, int dfd, const char *path)
-{
-	char *fdpath, *dfdpath, *other;
-	bool cmp;
-
-	fdpath = fdreadlink(fd);
-	dfdpath = fdreadlink(dfd);
-
-	if (!path)
-		E_asprintf(&other, "%s", dfdpath);
-	else if (*path == '/')
-		E_asprintf(&other, "%s", path);
-	else
-		E_asprintf(&other, "%s/%s", dfdpath, path);
-
-	cmp = !strcmp(fdpath, other);
-
-	free(fdpath);
-	free(dfdpath);
-	free(other);
-	return cmp;
-}
-
-bool openat2_supported = false;
-
-void __attribute__((constructor)) init(void)
-{
-	struct open_how how = {};
-	int fd;
-
-	BUILD_BUG_ON(sizeof(struct open_how) != OPEN_HOW_SIZE_VER0);
-
-	/* Check openat2(2) support. */
-	fd = sys_openat2(AT_FDCWD, ".", &how);
-	openat2_supported = (fd >= 0);
-
-	if (fd >= 0)
-		close(fd);
-}
diff --git a/tools/testing/selftests/filesystems/openat2/helpers.h b/tools/testing/selftests/filesystems/openat2/helpers.h
index 510e60602511..975de513af86 100644
--- a/tools/testing/selftests/filesystems/openat2/helpers.h
+++ b/tools/testing/selftests/filesystems/openat2/helpers.h
@@ -2,6 +2,7 @@
 /*
  * Author: Aleksa Sarai <cyphar@cyphar.com>
  * Copyright (C) 2018-2019 SUSE LLC.
+ * Copyright (C) 2026 Amutable GmbH
  */
 
 #ifndef __RESOLVEAT_H__
@@ -11,19 +12,14 @@
 #include <stdint.h>
 #include <stdbool.h>
 #include <errno.h>
+#include <limits.h>
 #include <linux/types.h>
+#include <linux/unistd.h>
 #include "kselftest.h"
 
 #define ARRAY_LEN(X) (sizeof (X) / sizeof (*(X)))
 #define BUILD_BUG_ON(e) ((void)(sizeof(struct { int:(-!!(e)); })))
 
-#ifndef SYS_openat2
-#ifndef __NR_openat2
-#define __NR_openat2 437
-#endif /* __NR_openat2 */
-#define SYS_openat2 __NR_openat2
-#endif /* SYS_openat2 */
-
 /*
  * Arguments for how openat2(2) should open the target path. If @resolve is
  * zero, then openat2(2) operates very similarly to openat(2).
@@ -45,8 +41,6 @@ struct open_how {
 #define OPEN_HOW_SIZE_VER0	24 /* sizeof first published struct */
 #define OPEN_HOW_SIZE_LATEST	OPEN_HOW_SIZE_VER0
 
-bool needs_openat2(const struct open_how *how);
-
 #ifndef RESOLVE_IN_ROOT
 /* how->resolve flags for openat2(2). */
 #define RESOLVE_NO_XDEV		0x01 /* Block mount-point crossings
@@ -93,16 +87,111 @@ bool needs_openat2(const struct open_how *how);
 					   __FILE__, __LINE__, #expr, ##__VA_ARGS__); \
 	} while (0)
 
-int raw_openat2(int dfd, const char *path, void *how, size_t size);
-int sys_openat2(int dfd, const char *path, struct open_how *how);
-int sys_openat(int dfd, const char *path, struct open_how *how);
-int sys_renameat2(int olddirfd, const char *oldpath,
-		  int newdirfd, const char *newpath, unsigned int flags);
+__maybe_unused
+static bool needs_openat2(const struct open_how *how)
+{
+	return how->resolve != 0;
+}
+
+__maybe_unused
+static int raw_openat2(int dfd, const char *path, void *how, size_t size)
+{
+	int ret = syscall(__NR_openat2, dfd, path, how, size);
+
+	return ret >= 0 ? ret : -errno;
+}
+
+__maybe_unused
+static int sys_openat2(int dfd, const char *path, struct open_how *how)
+{
+	return raw_openat2(dfd, path, how, sizeof(*how));
+}
+
+__maybe_unused
+static int sys_openat(int dfd, const char *path, struct open_how *how)
+{
+	int ret = openat(dfd, path, how->flags, how->mode);
+
+	return ret >= 0 ? ret : -errno;
+}
+
+__maybe_unused
+static int sys_renameat2(int olddirfd, const char *oldpath,
+			 int newdirfd, const char *newpath, unsigned int flags)
+{
+	int ret = syscall(__NR_renameat2, olddirfd, oldpath,
+					  newdirfd, newpath, flags);
+
+	return ret >= 0 ? ret : -errno;
+}
+
+__maybe_unused
+static int touchat(int dfd, const char *path)
+{
+	int fd = openat(dfd, path, O_CREAT, 0700);
+
+	if (fd >= 0)
+		close(fd);
+	return fd;
+}
+
+__maybe_unused
+static char *fdreadlink(int fd)
+{
+	char *target, *tmp;
+
+	E_asprintf(&tmp, "/proc/self/fd/%d", fd);
+
+	target = malloc(PATH_MAX);
+	if (!target)
+		ksft_exit_fail_msg("fdreadlink: malloc failed\n");
+	memset(target, 0, PATH_MAX);
+
+	E_readlink(tmp, target, PATH_MAX);
+	free(tmp);
+	return target;
+}
+
+__maybe_unused
+static bool fdequal(int fd, int dfd, const char *path)
+{
+	char *fdpath, *dfdpath, *other;
+	bool cmp;
+
+	fdpath = fdreadlink(fd);
+	dfdpath = fdreadlink(dfd);
+
+	if (!path)
+		E_asprintf(&other, "%s", dfdpath);
+	else if (*path == '/')
+		E_asprintf(&other, "%s", path);
+	else
+		E_asprintf(&other, "%s/%s", dfdpath, path);
+
+	cmp = !strcmp(fdpath, other);
+
+	free(fdpath);
+	free(dfdpath);
+	free(other);
+	return cmp;
+}
+
+static bool openat2_supported = false;
+
+__attribute__((constructor))
+static void __detect_openat2_supported(void)
+{
+	struct open_how how = {};
+	int fd;
+
+	BUILD_BUG_ON(sizeof(struct open_how) != OPEN_HOW_SIZE_VER0);
 
-int touchat(int dfd, const char *path);
-char *fdreadlink(int fd);
-bool fdequal(int fd, int dfd, const char *path);
+	/* Check openat2(2) support. */
+	fd = sys_openat2(AT_FDCWD, ".", &how);
+	openat2_supported = (fd >= 0);
 
-extern bool openat2_supported;
+	if (fd >= 0)
+		close(fd);
+}
 
 #endif /* __RESOLVEAT_H__ */

-- 
2.53.0


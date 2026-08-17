Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A940C43CED7;
	Mon, 17 Aug 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975904; cv=none; b=DMODOoS5ZaOcJiKttfgxH7DCGnoj/ge8wr2bBbrvzZit5Elm9AJaz9o6OKErkd3S4qJKHPExp0ooYYgvu3/dmfNmhjpDHlT3ZmqOAO/kkVYv3WhDt9TpGRq8yF6po4G81ruVu9e0cTciftkyi8RWybFsU1iRzkfb160z2Sx/ID8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975904; c=relaxed/simple;
	bh=ViSoEq4vpyD60Ldrif6uaDkuIiekUXfqjSAHTbn9nkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mEc3gdSZgsWGE4JtxtdTEHkMcvifNZRigq+rLJoLFuaYgqIj+M1JpMbkfG7q5QaNFssGG0SBAxjLxEbfzHLbhUbM6z5PmYp2BFmzil3ZJj00o7ySY4SgXqh/kf4qPjTdIKJjtaqwN0FczONJNo/gH+xoifpMAHsadqWF6fn9jko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=LWfsLOxl; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="LWfsLOxl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=OoMzp7zA7wu3QMs1/+FxdtF6S2j8fxJSGn3vUluin+U=; b=
	LWfsLOxlWRQtq9KB1wLNzcbknKPZqSd5oNrKeuxLb81kJ62tIbdSv582j71/sJR8RU3BdT+sMz0u9
	GW6YD4+SLWOi9UQQCUne9cg0+ldIqszV17TQSRPW6LrXmJ7C7uRuRVL/MYPjZoizEh93rIGq5xbw8
	33BVoFRbFx9g7hJxQn/Z/p0woPvShOjdx0Z/5uxCTdojQ+rQHbCQkqDcqdIQsD0vtRcV6ZgP+77lz
	YeUTpgIir8NNQnboUGV9PLWju2ZUww3OHoqAQZNtHphhu/RGJbJiBrzpq7gAmjYvPqGFrBGM3r9UG
	vCwoA23AzU6cR6aNVuQX/29oHzf5uX5NEg==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wvy3o-004Xy2-HL; Mon, 17 Aug 2026 16:11:32 +0200
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
Subject: [RFC PATCH v2 2/8] selftests/fuse: convert fusectl test to fuse3
Date: Mon, 17 Aug 2026 15:11:50 +0100
Message-ID: <20260817141156.6079-3-luis@igalia.com>
In-Reply-To: <20260817141156.6079-1-luis@igalia.com>
References: <20260817141156.6079-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since it is probably not worth adding new fuse kselftests based on fuse2,
it is a good idea to convert the single existing test to fuse3.  The
conversion is trivial, as it only requires some changes to function
signatures (the gettattr and truncate fuse operations), and to the filler()
helper.

Signed-off-by: Luis Henriques <luis@igalia.com>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
---
 .../selftests/filesystems/fuse/Makefile       | 21 +++++++------------
 .../selftests/filesystems/fuse/fuse_mnt.c     | 17 ++++++++-------
 2 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/testing/selftests/filesystems/fuse/Makefile
index f47141484275..54411bc349d2 100644
--- a/tools/testing/selftests/filesystems/fuse/Makefile
+++ b/tools/testing/selftests/filesystems/fuse/Makefile
@@ -2,30 +2,23 @@
 
 CFLAGS += -Wall -O2 -g $(KHDR_INCLUDES)
 
-TEST_GEN_PROGS := fusectl_test
+TEST_GEN_PROGS := fusectl_test fuse_acl_cache_test
 TEST_GEN_FILES := fuse_mnt
 
-# fuse_acl_cache_test requires libfuse3; add it only when the library is present.
-ACL_CFLAGS := $(shell pkg-config fuse3 --cflags 2>/dev/null)
-ACL_LDLIBS := $(shell pkg-config fuse3 --libs 2>/dev/null)
-ifneq ($(ACL_CFLAGS),)
-TEST_GEN_PROGS += fuse_acl_cache_test
-endif
-
 include ../../lib.mk
 
-VAR_CFLAGS := $(shell pkg-config fuse --cflags 2>/dev/null)
+VAR_CFLAGS := $(shell pkg-config fuse3 --cflags 2>/dev/null)
 ifeq ($(VAR_CFLAGS),)
-VAR_CFLAGS := -D_FILE_OFFSET_BITS=64 -I/usr/include/fuse
+VAR_CFLAGS := -D_FILE_OFFSET_BITS=64 -I/usr/include/fuse3
 endif
 
-VAR_LDLIBS := $(shell pkg-config fuse --libs 2>/dev/null)
+VAR_LDLIBS := $(shell pkg-config fuse3 --libs 2>/dev/null)
 ifeq ($(VAR_LDLIBS),)
-VAR_LDLIBS := -lfuse -pthread
+VAR_LDLIBS := -lfuse3 -pthread
 endif
 
 $(OUTPUT)/fuse_mnt: CFLAGS += $(VAR_CFLAGS)
 $(OUTPUT)/fuse_mnt: LDLIBS += $(VAR_LDLIBS)
 
-$(OUTPUT)/fuse_acl_cache_test: CFLAGS += $(ACL_CFLAGS)
-$(OUTPUT)/fuse_acl_cache_test: LDLIBS += $(ACL_LDLIBS)
+$(OUTPUT)/fuse_acl_cache_test: CFLAGS += $(VAR_CFLAGS)
+$(OUTPUT)/fuse_acl_cache_test: LDLIBS += $(VAR_LDLIBS)
diff --git a/tools/testing/selftests/filesystems/fuse/fuse_mnt.c b/tools/testing/selftests/filesystems/fuse/fuse_mnt.c
index d12b17f30fad..5d335fa5cf05 100644
--- a/tools/testing/selftests/filesystems/fuse/fuse_mnt.c
+++ b/tools/testing/selftests/filesystems/fuse/fuse_mnt.c
@@ -4,7 +4,7 @@
  * Creates a simple FUSE filesystem with a single read-write file (/test)
  */
 
-#define FUSE_USE_VERSION 26
+#define FUSE_USE_VERSION 31
 
 #include <fuse.h>
 #include <stdio.h>
@@ -20,7 +20,8 @@ static char *content;
 static size_t content_size = 0;
 static const char test_path[] = "/test";
 
-static int test_getattr(const char *path, struct stat *st)
+static int test_getattr(const char *path, struct stat *st,
+			struct fuse_file_info *fi)
 {
 	memset(st, 0, sizeof(*st));
 
@@ -41,14 +42,15 @@ static int test_getattr(const char *path, struct stat *st)
 }
 
 static int test_readdir(const char *path, void *buf, fuse_fill_dir_t filler,
-			off_t offset, struct fuse_file_info *fi)
+			off_t offset, struct fuse_file_info *fi,
+			enum fuse_readdir_flags flags)
 {
 	if (strcmp(path, "/"))
 		return -ENOENT;
 
-	filler(buf, ".", NULL, 0);
-	filler(buf, "..", NULL, 0);
-	filler(buf, test_path + 1, NULL, 0);
+	filler(buf, ".", NULL, 0, FUSE_FILL_DIR_DEFAULTS);
+	filler(buf, "..", NULL, 0, FUSE_FILL_DIR_DEFAULTS);
+	filler(buf, test_path + 1, NULL, 0, FUSE_FILL_DIR_DEFAULTS);
 
 	return 0;
 }
@@ -107,7 +109,8 @@ static int test_write(const char *path, const char *buf, size_t size,
 	return size;
 }
 
-static int test_truncate(const char *path, off_t size)
+static int test_truncate(const char *path, off_t size,
+			 struct fuse_file_info *fi)
 {
 	if (strcmp(path, test_path) != 0)
 		return -ENOENT;

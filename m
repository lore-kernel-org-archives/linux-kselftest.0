Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723D246A611;
	Wed, 16 Sep 2026 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574166; cv=none; b=imnOxCzDONUH2K7O8NrTnf9RejKD4WEuiQ+dLeWPuwxdnpzeUblBiYi4QZn6alurbS4OnLJ0hb7doXKDmMgNltk0MUlSqxdskVu2+1+xjWckP6QHajhv+9CUbkF4Lye/N5BPkjB6QIEcXBRf2MG9AWBg/10UXkRIW2JZqvAl9xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574166; c=relaxed/simple;
	bh=+HuJRv9MxBWoIl1CqVAhOCJ8Nb9U+afeGbiwDFQ1MhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPF/QlE3R5kMybNc2O/bzXs6DPx3hNypGO49mC1ho15PRHdXsUKQEZ4nvd1+vPf7hRIC0U3EzCmjXvNHYqie49KPcILyQyoDDxVBHDAap5mUpHQgl++zXxP/BSbI2M+Mh/xfBo+6M9NvT8T7NG/jq5Lw/QArt/5Kg/8hFDRSfmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=p36Y2I9L; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="p36Y2I9L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=f/JuPB5ODbW76qoUQlyBQI5XfcE9nTaSz3hiDI+DXao=; b=
	p36Y2I9LJj/bsFni3acAq1GmwH0OjskgeZUXZo+6gCiR8B4fAyqJRONSYqsGRZ7irYkFQQn+TEhCr
	1aNyxL/gZRjRipCETTITooZqOVubkhM/7n2TfXmM3vyoiuXlrbhnJQ2BVmTzLMpU4BnBn/ie8XlqP
	Dki9GDVdrzJm8jo13mvulO5wc2S2NjhdiXBp8aKaT4LjG+oDOTKx2FaXEoyV31CPuGKcV2q6XegIA
	5dWXn+R98tYOz0XA99khC/wGBJQT6DV3YQmb+a7EKi10KxbHfGvc0LAJAa27Vgtvrpu3RM1zNKgbn
	jMTQN230QUnm/KQ9uh0EhQpHQyLJ0QOdZg==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6ryw-0031JX-Ix; Wed, 16 Sep 2026 17:55:34 +0200
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
Subject: [RFC PATCH v4 2/8] selftests/fuse: convert fusectl test to fuse3
Date: Wed, 16 Sep 2026 16:56:23 +0100
Message-ID: <20260916155629.32421-3-luis@igalia.com>
In-Reply-To: <20260916155629.32421-1-luis@igalia.com>
References: <20260916155629.32421-1-luis@igalia.com>
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
 .../selftests/filesystems/fuse/Makefile       | 20 +++++++------------
 .../selftests/filesystems/fuse/fuse_mnt.c     | 17 +++++++++-------
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/testing/selftests/filesystems/fuse/Makefile
index 95a1ee947ca7..a3ee9b3a2f5d 100644
--- a/tools/testing/selftests/filesystems/fuse/Makefile
+++ b/tools/testing/selftests/filesystems/fuse/Makefile
@@ -4,31 +4,25 @@ CFLAGS += -Wall -O2 -g $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS := fusectl_test
 TEST_GEN_PROGS += write_extend_eof_test
-TEST_GEN_FILES := fuse_mnt
-
-# fuse_acl_cache_test requires libfuse3; add it only when the library is present.
-ACL_CFLAGS := $(shell pkg-config fuse3 --cflags 2>/dev/null)
-ACL_LDLIBS := $(shell pkg-config fuse3 --libs 2>/dev/null)
-ifneq ($(ACL_CFLAGS),)
 TEST_GEN_PROGS += fuse_acl_cache_test
-endif
+TEST_GEN_FILES := fuse_mnt
 
 include ../../lib.mk
 
 $(OUTPUT)/write_extend_eof_test: LDLIBS += -lpthread
 
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

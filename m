Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538BF28150F;
	Wed,  8 Jul 2026 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516270; cv=none; b=koMhzQt5/vrOy3F8X5mlPcUihoklClIGKnSAYLnkvOvYEXfUIuLW6JdKRe2eY/jPTYgELvv70KbeSRVoOn1xzeirU71CKEBKl5AcTttQ76IYEZFHFFYIFpFaJGoRhi72LKh8IPJWYc61HhZFQHZEfRw+fHXUxdep3XnGzlL0W7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516270; c=relaxed/simple;
	bh=YzOJZIx2qP/onI+KkwmCtMgs08stFnP8+CaTD1EzeJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FtAPhtPe9grZQ5SEyOvzFsOc3na3oIIk04pps0+CUBY0vQZAgD+AVKzVL4/Bi88wpn4ixlQYtIep/1SgiwVI+DFNWYzMyz3AmUBEZUT/MAIprGC8/oYAfbYiFRsMoeKjzZSC9QwlZjIabT18UZoOqwRDKI3JbRsozbqu5liW4RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ar4nTOr/; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ar4nTOr/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2cFadzNHGdsSPHB4ICESYzi5yXjjc7F/3g3UbCu+X/A=; b=ar4nTOr/rppa8F3G4vTkzZn2Z3
	O+N3qxjZKKxWUwngH0yUWAdwk3GfgTYNSh8QWoTvU4BoPRboi5JMI/FjqztMI6y1aERN3GBSKHj2q
	vybxKHTbqFsFoW7NT3KRBCS4JIv+EoydP7IcVNa9x+lPVirvIbx3nqcRsoz9JDQnehJRfK8q4vd4i
	5gRK/HH4t91qUtxh4qVNXEWUUrVtJVdi4hDWujVTzJ2luYou5HHVk4ib+PumbSVRFb8xZGPrFMmRj
	aT0952bKktlviAxLCYy8QXcTJsTFWltegTUuF925bf6fDxl7R4wazqAwFnephlO31Pq0SQPMi+Smf
	gQrYGzvw==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1whS3K-00BiU6-CF; Wed, 08 Jul 2026 15:11:02 +0200
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matt Harvey <mharvey@jumptrading.com>,
	kernel-dev@igalia.com,
	Luis Henriques <luis@igalia.com>
Subject: [RFC PATCH v1 2/5] selftests/filesystems: convert fusectl test to fuse3
Date: Wed,  8 Jul 2026 14:11:19 +0100
Message-ID: <20260708131122.2917-3-luis@igalia.com>
In-Reply-To: <20260708131122.2917-1-luis@igalia.com>
References: <20260708131122.2917-1-luis@igalia.com>
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
---
 .../testing/selftests/filesystems/fuse/Makefile |  8 ++++----
 .../selftests/filesystems/fuse/fuse_mnt.c       | 17 ++++++++++-------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/testing/selftests/filesystems/fuse/Makefile
index 612aad69a93a..422cd1b1688d 100644
--- a/tools/testing/selftests/filesystems/fuse/Makefile
+++ b/tools/testing/selftests/filesystems/fuse/Makefile
@@ -7,14 +7,14 @@ TEST_GEN_FILES := fuse_mnt
 
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

Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B0737DEB5;
	Mon,  3 Aug 2026 10:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753070; cv=none; b=PI26cgMAokT9r6xFP/YpK2D24HuQsBI5HGHJUDqud4btxabuT/hmE2utrkMcP5IaPYrcxt7EDT7ip/Xx8awuWCwV3qlNm3K/QD0ZtFVY0TpsVmKSiAJ3FDMa9JiHbbXClXp+JXiqeF7o1xZH30JEJCxghf6wsy4HKvdNTgpy0ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753070; c=relaxed/simple;
	bh=+EWOLDeCW4n9l7HMY05WIpY+OE52FCsUo/41G6kNu5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=la8Na+t0/46Rscg8TaDONyoT4rRsYvwWMWrBkzJv2S5V1bmpgnsL6IHlwQTm10g+lhGVtd49cN4QeR+OxAs6bfgl4skpjGGQElg/Q8F77LDYhhNQ3pCL4N9HKUM/gl3UZkZhA218ifBAk51Dim3fHUwWzp6aRMpQFbYqEUWjOZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YC67v2eA; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YC67v2eA"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785753064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8+IjhCE/ZNrC0bMBIhtdbaluok7XpIs3WtnbhLNhxMk=;
	b=YC67v2eA3az2cCw5x1Bx6Hh9QPPFGQ4R8thQ83/0M96lj9LJ5S5Pv0z2CaEQEMP1wioNgC
	lPk33yKRiYZG/DauzuJ6hBtKbUleoiaWzTX9ZipyR8nOCRqrLEicSuUHVL/dt3imhdTQuU
	SxEO5y3mpO9kZbfUoRk8xaSI7KBQ7vU=
From: Hongfu Li <hongfu.li@linux.dev>
To: shuah@kernel.org,
	richard.weiyang@gmail.com,
	reddybalavignesh9979@gmail.com,
	akpm@linux-foundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hongfu.li@linux.dev,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH] selftests/prctl: Fix non-anonymous VMA mapping in set-anon-vma-name test
Date: Mon,  3 Aug 2026 18:30:46 +0800
Message-ID: <20260803103046.14324-1-hongfu.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Hongfu Li <lihongfu@kylinos.cn>

The test creates a non-anonymous VMA (ptr_not_anon) via mmap() with
MAP_PRIVATE but without MAP_ANONYMOUS, using fd=0 (stdin) as the file
descriptor.  This always fails because fd=0 is not a regular file,
and the failure was hidden because ASSERT_NE() incorrectly checked
for NULL instead of MAP_FAILED.

Fix by using mkstemp() + ftruncate() to create a real temporary file,
then mapping it with MAP_PRIVATE to obtain a genuine file-backed VMA.
Also fix the mmap() error checks to use MAP_FAILED instead of NULL,
and pass fd=-1 for the anonymous mapping for clarity.  The temp file
is unlinked immediately so it does not persist on disk.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 .../selftests/prctl/set-anon-vma-name-test.c  | 21 ++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/prctl/set-anon-vma-name-test.c b/tools/testing/selftests/prctl/set-anon-vma-name-test.c
index ac6721b184a6..5f9589534da8 100644
--- a/tools/testing/selftests/prctl/set-anon-vma-name-test.c
+++ b/tools/testing/selftests/prctl/set-anon-vma-name-test.c
@@ -4,11 +4,13 @@
  */
 
 #include <errno.h>
+#include <fcntl.h>
 #include <sys/prctl.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <sys/mman.h>
 #include <string.h>
+#include <unistd.h>
 
 #include "kselftest_harness.h"
 
@@ -73,15 +75,24 @@ int was_renaming_successful(char *target_name, unsigned long ptr)
 
 FIXTURE(vma) {
 	void *ptr_anon, *ptr_not_anon;
+	int fd_not_anon;
 };
 
 FIXTURE_SETUP(vma) {
+	char template[] = "./set-anon-vma-test-XXXXXX";
+
 	self->ptr_anon = mmap(NULL, AREA_SIZE, PROT_READ | PROT_WRITE,
-					MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
-	ASSERT_NE(self->ptr_anon, NULL);
+					MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(self->ptr_anon, MAP_FAILED);
+
+	self->fd_not_anon = mkstemp(template);
+	ASSERT_NE(self->fd_not_anon, -1);
+	unlink(template);
+	ASSERT_EQ(ftruncate(self->fd_not_anon, AREA_SIZE), 0);
 	self->ptr_not_anon = mmap(NULL, AREA_SIZE, PROT_READ | PROT_WRITE,
-					MAP_PRIVATE, 0, 0);
-	ASSERT_NE(self->ptr_not_anon, NULL);
+					MAP_PRIVATE, self->fd_not_anon, 0);
+	ASSERT_NE(self->ptr_not_anon, MAP_FAILED);
+	close(self->fd_not_anon);
 }
 
 FIXTURE_TEARDOWN(vma) {
@@ -98,7 +109,7 @@ TEST_F(vma, renaming) {
 	EXPECT_EQ(rename_vma((unsigned long)self->ptr_anon, AREA_SIZE, BAD_NAME), -EINVAL);
 
 	TH_LOG("Try to rename non-anonymous VMA");
-	EXPECT_EQ(rename_vma((unsigned long) self->ptr_not_anon, AREA_SIZE, GOOD_NAME), -EINVAL);
+	EXPECT_EQ(rename_vma((unsigned long) self->ptr_not_anon, AREA_SIZE, GOOD_NAME), -EBADF);
 }
 
 TEST_HARNESS_MAIN
-- 
2.54.0


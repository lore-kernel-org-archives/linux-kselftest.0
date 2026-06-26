Received: from va-2-113.ptr.blmpb.com (va-2-113.ptr.blmpb.com [209.127.231.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FD03EBF01
	for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 12:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478759; cv=none; b=aFSemqvjF1FaNRqQpJ+Um3FE1zmBhWokduqxwdMSydNhTZSjMRBTdGJSgW6zVfIWmgSHcmsrUtLhaYyJLzJ2/koqD6B73aHabfXXwEYcj+2xc65JRc4i+6IGvYQwACjyCXAvlvDJGHIeIrMT9pX1bOOrc3z7zAzsGTva5rNhooM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478759; c=relaxed/simple;
	bh=0cnsTb5+xBoPRXoxwwiSBtug3i2DuzJKpZ9g80ZbfBw=;
	h=To:Cc:From:Date:Message-Id:Mime-Version:Content-Type:Subject; b=UXukjGi8J0OyRlzEPUMcWdU1yZuJP2ccEKmyb+8gz8cJEwWw/6Usf5eWLiruUfUsb1RZ0EKZKBOtFLOHAUO5ymgL9EAcdi3+/IoD+Be1lOCpgkGZqZst69Ep1foKqNkpgDJQGBYTl0OVnHT8Azxf7vje52J2ASZ3I9hLUCfhQIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=cXV2aLWt; arc=none smtp.client-ip=209.127.231.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="cXV2aLWt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1782478753; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=AL6ByXhQdtUtH0hlRBpSnP6WApmmsj9bwOb+UcTFFBE=;
 b=cXV2aLWtGSdMFkqfvPa9DJuV9Ru0iFpapq/VaMDvMGuPRRmTHDOihyCyWRjK8zOlr5I61+
 R+7NktbvmC6+YD3tsNorBkh5EWk2TZR7IPoxyvn9hHf4m/psk7g+zTmmZBoH2ZJTsNTPfk
 FRDwIfT16xWq8vBwpK6csTMZPe27H6nrhjX/H7nziES/JuCDFhyJjPw3yTQsXE3SugfDX+
 vBAna8ZgHLQZehENGe1kGiKNNzRMtxrM0h9LkLq9aM+yOnNOdivUGyUlzDCW7XqcLoAMan
 zTDd1FjdFNJbDvc6oIr0iNacnzqagWv/LrRY70TpZKcL5bM3mZ1KcbjmSTpJMg==
Content-Transfer-Encoding: 7bit
To: <linux-kselftest@vger.kernel.org>
X-Mailer: b4 0.13.0
X-B4-Tracking: v=1; b=H4sIAJV3PmoC/x2MQQqAIBAAvyJ7bsGsPPSV6KC21R7SUKhA/HvWc QZmMiSKTAlGkSHSxYmDr9A2Atxu/EbIS2VQUmmplUbb48HehUh4fgHdqAxJ1y16INtCDatf+fm n01zKC08V+qVkAAAA
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <shuah@kernel.org>, 
	"Yijia Wang" <wangyijia.yeah@bytedance.com>
X-Original-From: Yijia Wang <wangyijia.yeah@bytedance.com>
X-Lms-Return-Path: <lba+26a3e779f+930abc+vger.kernel.org+wangyijia.yeah@bytedance.com>
From: "Yijia Wang" <wangyijia.yeah@bytedance.com>
Date: Fri, 26 Jun 2026 20:59:02 +0800
Message-Id: <20260626-b4-mincore-preview-v1-1-5f07aa02ab32@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH] selftests: mincore: use default huge page size for hugetlb test

The hugetlb mincore test passes the base page size as the MAP_HUGETLB
mapping length.  This works on systems where the default huge page size
is the same as the base page size, but mmap() can fail with EINVAL before
mincore() is exercised when the default huge page size is larger, such as
on arm64 systems with 64K base pages and 2M huge pages.

Use the default huge page size from /proc/meminfo for the hugetlb mapping
and unmap length.  Keep the mincore() check scoped to one base page since
the test only needs to verify the residency state before and after the
mapping is touched.  This also avoids changing the mincore() length to the
whole huge page, which would require a larger residency vector because
mincore() reports one byte per base page.

Signed-off-by: Yijia Wang <wangyijia.yeah@bytedance.com>
---
 tools/testing/selftests/mincore/mincore_selftest.c | 29 ++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mincore/mincore_selftest.c b/tools/testing/selftests/mincore/mincore_selftest.c
index cdd022c1c..cd51420d5 100644
--- a/tools/testing/selftests/mincore/mincore_selftest.c
+++ b/tools/testing/selftests/mincore/mincore_selftest.c
@@ -22,6 +22,27 @@
 #define MB (1UL << 20)
 #define FILE_SIZE (4 * MB)
 
+static unsigned long default_huge_page_size(void)
+{
+	FILE *f = fopen("/proc/meminfo", "r");
+	unsigned long hps = 0;
+	size_t linelen = 0;
+	char *line = NULL;
+
+	if (!f)
+		return 0;
+	while (getline(&line, &linelen, f) > 0) {
+		if (sscanf(line, "Hugepagesize:       %lu kB", &hps) == 1) {
+			hps <<= 10;
+			break;
+		}
+	}
+
+	free(line);
+	fclose(f);
+	return hps;
+}
+
 
 /*
  * Tests the user interface. This test triggers most of the documented
@@ -139,14 +160,18 @@ TEST(check_anonymous_locked_pages)
 TEST(check_huge_pages)
 {
 	unsigned char vec[1];
+	unsigned long hpage_size;
 	char *addr;
 	int retval;
 	int page_size;
 
 	page_size = sysconf(_SC_PAGESIZE);
+	hpage_size = default_huge_page_size();
+	if (!hpage_size)
+		hpage_size = page_size;
 
 	errno = 0;
-	addr = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+	addr = mmap(NULL, hpage_size, PROT_READ | PROT_WRITE,
 		MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB,
 		-1, 0);
 	if (addr == MAP_FAILED) {
@@ -170,7 +195,7 @@ TEST(check_huge_pages)
 	}
 
 	munlock(addr, page_size);
-	munmap(addr, page_size);
+	munmap(addr, hpage_size);
 }
 
 

---
base-commit: 1d5dcaa3bd65f2e8c9baa14a393d3a2dc5db7524
change-id: 20260626-b4-mincore-preview-2ae0c3d65eb1

Best regards,
-- 
Yijia Wang <wangyijia.yeah@bytedance.com>

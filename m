Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD01A26ED3A
	for <linux-kselftest@vger.kernel.org>; Sat, 27 Jun 2026 04:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782533628; cv=none; b=ZX55Jql8oZGN91hVWzVvoq0jZM4ag5kF6yEpTSb21OB/DBTJe3Kf+39fOs5HmpJyTCcpk9dFjkAHpOVSrZh0UAGLXMv4tId8GJ0SwfDdQkmeLTR2V/p5ELXkTQqVHV1wqdnrLx+FQTxVn414gtCNt1MkloRxz1R0Esi4WlitbMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782533628; c=relaxed/simple;
	bh=b0MUbL72EOr1aSMcmsxRJwgoSCsGEQB3Z0ByIDaO3r8=;
	h=Cc:Subject:From:Content-Type:Date:Message-Id:To:Mime-Version; b=TxBbNHp+1hpfWP/Gm6EBcBTOe/tipnY9b7wh0TRt2/PE4wVviJAiox1kz/DwkPPUbZFdyU/fP6b2npLqRK6BrXw0kVV1/qpLKitDelLSAZd8P18sLuQr375t4TlgPuLfxCIGu6NSDJ+xMYQ1UPcE2m9YKKR9eCk4X4w+GyUo/1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Hg55w2ZR; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Hg55w2ZR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1782533620; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=paJlwkIEhumJPS7T8PoR3Pm2QfgKcprdIhvvKVKclkc=;
 b=Hg55w2ZRlKpAqFO5tmKZYRBO+lRyL+h6hl05acnEtyk8kruayWSRid0XRG23z9o1AhxY8x
 AN7P2zWCdZ2Q531uYiAgiamfCD0WuqE7nMAiLWNd+q/zsJf8xx5ZFc8n2wPgX52g/sWX2z
 uX0OP/F2PTZBl4ptWfMge/sy9Dn6C0osNTSFsZvZGSt5/nSmKM/D12U5qGsnbDLC4LWx2R
 8MbcUFyTKOPKrhA5sWDxp9/xgK6lo3F65TY8Kgvh8VwDb7oJXRjBsSWSTmOyVE4USPK3Tv
 cdy8RQ8E/C5P5AXrJiEZqtB4zB6pE5DiP9vImXsw2Ai8UL4aEgjPyIos/6pUxg==
Cc: <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] selftests: mincore: use default huge page size for hugetlb test
X-Mailer: git-send-email 2.43.0
From: =?utf-8?q?=E7=8E=8B=E7=BF=8A=E5=98=89?= <wangyijia.yeah@bytedance.com>
X-Original-From: wangyijia.yeah@bytedance.com
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Jun 2026 12:13:34 +0800
Message-Id: <20260627041334.2134330-1-wangyijia.yeah@bytedance.com>
Content-Transfer-Encoding: 7bit
To: "Shuah Khan" <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26a3f4df2+ed9387+vger.kernel.org+wangyijia.yeah@bytedance.com>

From: Yijia Wang <wangyijia.yeah@bytedance.com>

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
Changes in v2:
- Keep mincore() scoped to one base page and avoid resizing the residency
  vector.
- Use the default huge page size only for the MAP_HUGETLB mapping and
  munmap().

Note: v1 was sent by mistake while I was still learning the b4/git
send-email workflow as a newcomer, and it wrongly had linux-mm on Cc.
Apologies for the noise.  This v2 is routed through the kselftest path
only.
v1: https://lore.kernel.org/all/20260626-b4-mincore-preview-v1-1-5f07aa02ab32@bytedance.com/

 .../selftests/mincore/mincore_selftest.c      | 29 +++++++++++++++++--
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
 
 
-- 
2.43.0

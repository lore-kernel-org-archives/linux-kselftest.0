Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E9C418A58;
	Tue, 21 Jul 2026 06:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615794; cv=none; b=dC9ZO1p0cypodQoFhiOMMkY9K8sIyxBuHDvnXmJjQJOOWXXvADDRswrdxqyMBc1yGZMsQrKjU5QeHGu5f4r1RVVMRSKkkYPLK40N4KKzu9IPnDva9WGo6YajKcXT9TycqPidQUOKWUtf0Szu9GK6ctpIF/C01SsWfSOY7nTMvMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615794; c=relaxed/simple;
	bh=u2uKme9iedl7wTBiM61xAeqcJs3jdYnNCupyIvToE3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gf/gmi7xTGpArwCy5sOYl7aHyq/UrWUh6mlSckRWLUjMh+Dtrg+7bVfJ2V0F+2vCsKRAEEV1pA5/QrA+E2pSDbHtFV5sLWPByJwwde26GHi5g9Vpf45bm6j+2jReETx1zV7+RsZDKIc5wd5OF4CSyKn682yS1u4MrKxeIQq39gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7ee9a92084ce11f1aa26b74ffac11d73-20260721
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:4c1196d5-20c3-4374-a698-42b25190473e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:76d2d3ce1ca729c4a973014ee7f7f4d2,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7ee9a92084ce11f1aa26b74ffac11d73-20260721
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 101423065; Tue, 21 Jul 2026 14:36:25 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: akpm@linux-foundation.org,
	david@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	shuah@kernel.org,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] selftests/mm/pagemap_ioctl: Fix missing NULL checks after calloc()
Date: Tue, 21 Jul 2026 14:36:11 +0800
Message-ID: <20260721063611.342-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pagemap_ioctl selftest allocates memory via calloc() in several
places but does not check the return values. If calloc() fails, the
subsequent code will dereference a NULL pointer and crash.

Additionally, in sanity_tests(), the calloc() failure check incorrectly
uses MAP_FAILED (the mmap() error constant) instead of NULL. Since
calloc() returns NULL on failure, the check never triggers and a
failed allocation goes undetected.

Add NULL checks after each calloc() call, and fix the wrong error
constant in sanity_tests(). Use ksft_exit_fail_msg() consistent with
the existing error handling pattern in the file.

Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/testing/selftests/mm/pagemap_ioctl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
index f9bcff8e78fa..f6629f44a13d 100644
--- a/tools/testing/selftests/mm/pagemap_ioctl.c
+++ b/tools/testing/selftests/mm/pagemap_ioctl.c
@@ -212,6 +212,8 @@ int userfaultfd_tests(void)
 
 	vec_size = mem_size/page_size;
 	vec = calloc(vec_size, sizeof(struct page_region));
+	if (!vec)
+		ksft_exit_fail_msg("error nomem\n");
 
 	written = pagemap_ioctl(mem, mem_size, vec, 1, PM_SCAN_WP_MATCHING | PM_SCAN_CHECK_WPASYNC,
 				vec_size - 2, PAGE_IS_WRITTEN, 0, 0, PAGE_IS_WRITTEN);
@@ -699,6 +701,8 @@ int base_tests(char *prefix, char *mem, unsigned long long mem_size, int skip)
 	vec_size = mem_size/page_size;
 	vec = calloc(vec_size, sizeof(struct page_region));
 	vec2 = calloc(vec_size, sizeof(struct page_region));
+	if (!vec || !vec2)
+		ksft_exit_fail_msg("error nomem\n");
 
 	/* 1. all new pages must be not be written (dirty) */
 	written = pagemap_ioctl(mem, mem_size, vec, 1, PM_SCAN_WP_MATCHING | PM_SCAN_CHECK_WPASYNC,
@@ -1000,6 +1004,8 @@ int unmapped_region_tests(void)
 	int written, len = 0x00040000;
 	long vec_size = len / page_size;
 	struct page_region *vec = calloc(vec_size, sizeof(struct page_region));
+	if (!vec)
+		ksft_exit_fail_msg("error nomem\n");
 
 	/* 1. Get written pages */
 	written = pagemap_ioctl(start, len, vec, vec_size, 0, 0,
@@ -1116,7 +1122,7 @@ int sanity_tests(void)
 
 	vec = calloc(vec_size, sizeof(struct page_region));
 	mem = mmap(NULL, mem_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
-	if (mem == MAP_FAILED || vec == MAP_FAILED)
+	if (mem == MAP_FAILED || !vec)
 		ksft_exit_fail_msg("error nomem\n");
 
 	wp_init(mem, mem_size);
-- 
2.43.0


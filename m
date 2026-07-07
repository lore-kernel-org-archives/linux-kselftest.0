Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A019223DE9;
	Tue,  7 Jul 2026 03:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394312; cv=none; b=qYJxIhercVGwW5eUsJz788SZmjq78EveF87Xsq0Hv3A55RGjKbTyDyNZViD/C9JqfzHSaxQOzJZMrrFDvb2NF9icsikcMBVqUMte+OywZ3xDAgT8eYoMtlCKw9AOgdpF4Fk0qUrQlXPTlZHAeapsvuqtyCovqQvlMdU3qR96iCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394312; c=relaxed/simple;
	bh=A1X8M+pjAl4BeHCqRli1wRJs1qVgzDYrUoJlomYBsT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgOYO3l9tWy5Y1LYY3+ezbRpFTgxlO1+QYfSIsRjBuwBsFHS4LaatwsutKK0/GIG4L0BchcR9auRTFkNUWULqzOsxbI4zAWMbMGgdRC04t66+dfcLLWaZXMzJsC9tudTJVHTzqC2j2Zf+M/jD7y/00wnNFY53H4v29qZ8KFLuNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 808ee67279b211f1aa26b74ffac11d73-20260707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:51ea2373-ddc2-4a0d-8919-dfb60ae5136e,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:8e792fd55241433fa81c38229c2845db,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 808ee67279b211f1aa26b74ffac11d73-20260707
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1096364418; Tue, 07 Jul 2026 11:18:19 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: rppt@kernel.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	yanlonglong@kylinos.cn
Subject: [PATCH v2] selftests/mm/mseal_test: Fix mmap return value check in test_seal_zero_address
Date: Tue,  7 Jul 2026 11:17:45 +0800
Message-ID: <20260707031745.1039-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
In-Reply-To: <akuQbvgVR8vrEFvo@kernel.org>
References: <akuQbvgVR8vrEFvo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value for a failed mmap function is MAP_FAILED.
According to the definition of FAIL_TEST_IF FALSE,ptr must be
determined to be distinct from MAP_FAILED

Fixes: 4926c7a52de7 ("selftest mm/mseal memory sealing")
Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/testing/selftests/mm/mseal_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mseal_test.c b/tools/testing/selftests/mm/mseal_test.c
index faad4833366a..277c8fda3f5e 100644
--- a/tools/testing/selftests/mm/mseal_test.c
+++ b/tools/testing/selftests/mm/mseal_test.c
@@ -482,7 +482,7 @@ static void test_seal_zero_address(void)
 	/* use mmap to change protection. */
 	ptr = mmap(0, size, PROT_NONE,
 		   MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
-	FAIL_TEST_IF_FALSE(ptr == 0);
+	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
 
 	size = get_vma_size(ptr, &prot);
 	FAIL_TEST_IF_FALSE(size == 4 * page_size);
-- 
2.43.0


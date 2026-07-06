Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016583F20EF;
	Mon,  6 Jul 2026 08:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326690; cv=none; b=SSkVEmStTT9+nPKW7S5DzDDwvxaCBpqa+V91AhLSwZMNcuTb7wHySsitU2yGVoS3aCYfMzBb40sbCzDvN6GbYLf5REYdlaytDKgQ2xQ35GG5/ygdBvkGrHKHp9q2NHe/b4urXGOSUeFTHAy5wXKTID/ZLD76D/r/rk+lqAzhECg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326690; c=relaxed/simple;
	bh=D+3XQlYa6yNuTRNfe7oDQpS6vf59usJ3SR3hRzajeZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iQ+wd7+eQxr0AlFUA24XsZz9VqrsmhxTl6lFb2OICYXyB1Y92FCbw1xMl9TTImHNsr6gJzdZHOWOPtVzU4J3oYn0ahFvC7ciAG22DoDog/sgzbCzGNKm7zRXtjqcXFmyYlugvROZ5BXSUjsrQPkkWCjuqqhBKQurwvtvZBGJ0oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0caa8b3c791511f1aa26b74ffac11d73-20260706
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5ca52b17-8bc6-47c5-b669-36283b6b6736,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:0f7640c3917bacfe8958206c6d9378c2,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0caa8b3c791511f1aa26b74ffac11d73-20260706
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 739898778; Mon, 06 Jul 2026 16:31:13 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: akpm@linux-foundation.org,
	rppt@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] selftests/mm/mseal_test: Fix mmap return value check in test_seal_zero_address
Date: Mon,  6 Jul 2026 16:30:48 +0800
Message-ID: <20260706083049.187-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_seal_zero_address() uses mmap() with MAP_FIXED to map at address 0,
but only checks if the return value equals 0. If mmap() fails, it returns
MAP_FAILED ((void *)-1), not 0. The existing check FAIL_TEST_IF_FALSE(ptr == 0)
would pass when ptr == -1 (since -1 != 0 is true), causing the test to
continue with an invalid pointer.

Add a check for MAP_FAILED before verifying ptr == 0, consistent with all
other mmap() checks in this file which use FAIL_TEST_IF_FALSE(ptr != (void *)-1).

Fixes: 4926c7a52de7 ("selftest mm/mseal memory sealing")
Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/testing/selftests/mm/mseal_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mseal_test.c b/tools/testing/selftests/mm/mseal_test.c
index faad4833366a..a6ecc81c6aa0 100644
--- a/tools/testing/selftests/mm/mseal_test.c
+++ b/tools/testing/selftests/mm/mseal_test.c
@@ -482,7 +482,7 @@ static void test_seal_zero_address(void)
 	/* use mmap to change protection. */
 	ptr = mmap(0, size, PROT_NONE,
 		   MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
-	FAIL_TEST_IF_FALSE(ptr == 0);
+	FAIL_TEST_IF_FALSE(ptr == (void *)-1);
 
 	size = get_vma_size(ptr, &prot);
 	FAIL_TEST_IF_FALSE(size == 4 * page_size);
-- 
2.43.0


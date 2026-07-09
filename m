Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0520C217704
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601386; cv=none; b=Z0r5VXbO4aXrbvMu9bmIPjMFXIN12H1dleF49FzYe9MzPwsWL7mXvsXM5KByy4vXMd5aKxSob1yBDHSw5X+6zwLon5XAX/vmnF/KxGZRumPqSTc/84oCtQ4hmknD923eWFz9U5Sr5ZVQfSrMId3Laxw+Vhgnf7L29tG+dxNv19k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601386; c=relaxed/simple;
	bh=oXQdALHg4uYvvHbhSSwvl5vtMFqFgC2PBXf00i2OquM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MiIK1Y9DcbHgl6K5Mf0k5Ev0vIAPJxUI9IhcjLuDA85Nqs96IINBf4cInUgtaTf4Xn/F3iEDJCjSfdSisfhNAm2+SprX0FudjgN5GmD4iFHGj5qUBB/qLebkrLrUXaUzKDowz9zmDX/grk1xXJe9cNQSqv8J7f0b9xX2Wa4mwaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a55d5b6c7b9411f1aa26b74ffac11d73-20260709
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5de5cda1-7cfb-4b74-8811-b5056a8f3c30,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:3df98d8a7e353cf3344612617964cdc6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a55d5b6c7b9411f1aa26b74ffac11d73-20260709
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2011261336; Thu, 09 Jul 2026 20:49:38 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au
Cc: npiggin@gmail.com,
	chleroy@kernel.org,
	ganeshgr@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] selftests/powerpc: Check mmap return value in inject-ra-err
Date: Thu,  9 Jul 2026 20:49:18 +0800
Message-ID: <20260709124919.616-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mmap() in test_ra_error() is not checked for MAP_FAILED. On failure,
the subsequent write *paste_addr = 1 dereferences an invalid pointer
and segfaults. Add a FAIL_IF() check, consistent with the rest of the
function.

Fixes: 0f4ef8a3bf78 ("selftests/powerpc: Add test for real address error handling")
Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/testing/selftests/powerpc/mce/inject-ra-err.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/powerpc/mce/inject-ra-err.c b/tools/testing/selftests/powerpc/mce/inject-ra-err.c
index 94323c34d9a6..0622fd814114 100644
--- a/tools/testing/selftests/powerpc/mce/inject-ra-err.c
+++ b/tools/testing/selftests/powerpc/mce/inject-ra-err.c
@@ -47,6 +47,7 @@ static int test_ra_error(void)
 	FAIL_IF(sigaction(SIGBUS, &act, NULL) != 0);
 
 	paste_addr = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0ULL);
+	FAIL_IF(paste_addr == MAP_FAILED);
 
 	/* The following assignment triggers exception */
 	mb();
-- 
2.43.0


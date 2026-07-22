Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE80633F5B8;
	Wed, 22 Jul 2026 06:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784701058; cv=none; b=OJ3Oqj+LFMVOsXee74X6Ueeaj40z1+AhNCLx5cu1Kr2KHMv4q5jRgRPSTn+DF+QiuwWkTuvQanDISyYFgp6LnZJqSxNNsUF/+2nwdkum2GExj4w6myqMFw9XQp0JEamKIR/iWRp0+TAVGgEI3DY4ju12Vy769HP3YEzaKjFR5qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784701058; c=relaxed/simple;
	bh=fiyN0rlej2klNABisMT88rzFmobcQRhtJk4oO2kN6yc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YGshxZIgBB1rPZzomERmW/8eSBzH/IVJ1GchYG/DKfcz8AUC4tSlpVTYzO1s8BtWQAycmynBvyRBARQgSVv89CCV2AyBDTcLi/8zpSg7NOaC22bUGmwtXmYV8jSpner4YSflv3Ew64TDvQ6kSFV/VIP124XyJ/Krr3xtl8KyHm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 044b22b2859511f1aa26b74ffac11d73-20260722
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:ecdad7f1-9146-4cd4-b471-ccd7cf387132,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:3dd24d8d6561eeb933e135cf2820da91,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 044b22b2859511f1aa26b74ffac11d73-20260722
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2048049471; Wed, 22 Jul 2026 14:17:29 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au
Cc: npiggin@gmail.com,
	chleroy@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] selftests/powerpc: fix typos in tm-signal-stack comment
Date: Wed, 22 Jul 2026 14:17:11 +0800
Message-ID: <20260722061712.948-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix three spelling errors in the file header comment:
  - "delievery" -> "delivery"
  - "trelaim" -> "treclaim"
  - "hance" -> "hence"

Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/testing/selftests/powerpc/tm/tm-signal-stack.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-stack.c b/tools/testing/selftests/powerpc/tm/tm-signal-stack.c
index 68807aac8dd3..3bc3a2e1526d 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-stack.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-stack.c
@@ -2,15 +2,15 @@
 /*
  * Copyright 2015, Michael Neuling, IBM Corp.
  *
- * Test the kernel's signal delievery code to ensure that we don't
- * trelaim twice in the kernel signal delivery code.  This can happen
+ * Test the kernel's signal delivery code to ensure that we don't
+ * treclaim twice in the kernel signal delivery code.  This can happen
  * if we trigger a signal when in a transaction and the stack pointer
  * is bogus.
  *
  * This test case registers a SEGV handler, sets the stack pointer
  * (r1) to NULL, starts a transaction and then generates a SEGV.  The
  * SEGV should be handled but we exit here as the stack pointer is
- * invalid and hance we can't sigreturn.  We only need to check that
+ * invalid and hence we can't sigreturn.  We only need to check that
  * this flow doesn't crash the kernel.
  */
 
-- 
2.43.0


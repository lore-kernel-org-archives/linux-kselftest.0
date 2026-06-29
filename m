Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57423B4E9D;
	Mon, 29 Jun 2026 08:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782720114; cv=none; b=LcvL6SJZvO3NvBaU9rs8uswSJvAwie2bqFkEnRrpehMh2Dba22XdPsHqfLANNz2pQC+2BBt/YwC4AYC5Xd48uuet90pcugPhMbQXQ0TBn7b4b8Evx3zFYC0h2dxgHtkLj/mihDgMpfWglWZDT1xPSow3px0Iu0mxLCccT548aJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782720114; c=relaxed/simple;
	bh=lTzbzw075NJlUJ/0nJm9IWqtCEdPaxaLp+B1HZO7Hwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uNG6M+lvff/WAhR3VzPH5wF47IpzSEn4CIrI7he1O4s69MEdyxg1gMha+aXNAZdVubLLLheFiX88wgVLknIjNi/IFX3gFQOsuaiJHC1hRWR7X0yGWWbVvXrq7UEjM2fkviRo1sqfKXVZ/uXHjuwe6AhDMaPEX2JSDYR/4tuHPBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c53f1a12739011f1aa26b74ffac11d73-20260629
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:27dcd7c2-7644-44d1-8672-8f2155a45078,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:290c0a5442ba140891bdb0e75af552b3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c53f1a12739011f1aa26b74ffac11d73-20260629
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1218311314; Mon, 29 Jun 2026 16:01:44 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org
Cc: hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] selftests/x86: test_shadow_stack: Check mmap return value
Date: Mon, 29 Jun 2026 16:01:25 +0800
Message-ID: <20260629080126.587-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of mmap() in test_32bit() is not checked. On failure
mmap() returns MAP_FAILED, not NULL. If mmap() fails, the subsequent
dereference of sa32->sa_flags causes a segfault.

Add a check for MAP_FAILED after mmap() and return 1 on failure,
consistent with the existing error handling in the function.

Fixes: 81f30337ef4f ("selftests/x86: Add shadow stack test")
Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/testing/selftests/x86/test_shadow_stack.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 21af54d5f4ea..d56b0165b540 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -706,6 +706,9 @@ int test_32bit(void)
 	/* Create sigaction in 32 bit address range */
 	sa32 = mmap(0, 4096, PROT_READ | PROT_WRITE,
 		    MAP_32BIT | MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
+	if (sa32 == MAP_FAILED)
+		return 1;
+
 	sa32->sa_flags = SA_SIGINFO;
 
 	sa.sa_sigaction = segv_gp_handler;
-- 
2.43.0


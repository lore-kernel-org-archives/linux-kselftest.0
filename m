Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523DE3EDE76;
	Thu,  9 Jul 2026 12:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599234; cv=none; b=s+cjkPPkjUgn800rnQwMVRv0e2Dz0Vtp1++ERsCJ5phqhPSsFw4dkvupjTUYPDFvwi/MYGGUVKv5TEGE877sFcQ39KsMd0rqDD8CfXKAlgkQbg29suWl5fZ1bTudfYL+xpSt3QTa7V1jt2gDUqaPCGAUOiZ4kC8IJNFocPWhw6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599234; c=relaxed/simple;
	bh=BSt95ioqsL/ZA9evJxwy8Ml35meDwLBIzmjX+oU23OE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZCxwttIfSveShrnnKd+T4bn4lEW4oFJNFrw75MymqUu2MxU2pc+XF+8EvQLzVMbXBOwkhwCicsaobwDfTD12RFH9PyZHhvAgEtbF6xQjg+vExEkKbpoaGgeX873Nojb2y6+Lrmwzks8wcPOSuLHttDI1Hy3adDsNLvwVq2xCXIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a02f2ecc7b8f11f1aa26b74ffac11d73-20260709
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:ca2a10d2-9e6c-4719-a2d2-b294517b707f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:4c7f5ea66089d6d731670797b0fbd645,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a02f2ecc7b8f11f1aa26b74ffac11d73-20260709
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1675967005; Thu, 09 Jul 2026 20:13:42 +0800
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
Subject: [PATCH] selftests/x86/fsgsbase: Check mmap return value
Date: Thu,  9 Jul 2026 20:13:22 +0800
Message-ID: <20260709121323.591-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mmap() in main() returns MAP_FAILED on error, but the return value is
not checked. Subsequent dereferences of shared_scratch (e.g. in
test_ptrace_write_gsbase) would segfault. Add a MAP_FAILED check using
err(), consistent with the rest of the file.

Fixes: 697096b14444 ("selftests/x86/fsgsbase: Fix some test case bugs")
Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/testing/selftests/x86/fsgsbase.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/x86/fsgsbase.c b/tools/testing/selftests/x86/fsgsbase.c
index 0a75252d31b6..6e4df4c2d0e9 100644
--- a/tools/testing/selftests/x86/fsgsbase.c
+++ b/tools/testing/selftests/x86/fsgsbase.c
@@ -572,6 +572,8 @@ int main()
 
 	shared_scratch = mmap(NULL, 4096, PROT_READ | PROT_WRITE,
 			      MAP_ANONYMOUS | MAP_SHARED, -1, 0);
+	if (shared_scratch == MAP_FAILED)
+		err(1, "mmap");
 
 	/* Do these tests before we have an LDT. */
 	test_ptrace_write_gs_read_base();
-- 
2.43.0


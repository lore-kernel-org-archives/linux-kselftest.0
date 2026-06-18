Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A6427453;
	Thu, 18 Jun 2026 07:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781766498; cv=none; b=WL1ffSnq3pMSiyGWryhbJFhXyI7ySOegzmTZHE65bYdIkk41zeidTv4Ogmnaggv/hHGl9uX9WtlMBNzW0m9GW7OUR4X2wev8lZWuxwYVYpzhKNeuCgdwgE9fQWxJtElDfWnHvqFV2PwenJojP5InwulD3nMb2lFBRsraF8a0reA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781766498; c=relaxed/simple;
	bh=QJRwTIgKPDd8FVEVozyqUR18xTbv8Ro60/0bRUcb2nk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Eo/MD6frXSQSxdQxdJR8kOH4j77ksr7IXUj1rKrGvS8Jov2eHCf3ENj+D5OLZVRA8VO7+fPgYScsqGz84jzJu+99CI/8B0+mU9Cpmg3eS3DwYtBPx1ERiDQiDpMc583RcmGD6hApyxKaUpqjUitjAkCZfcMw42i22sQpF9+7fUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 771873246ae411f1aa26b74ffac11d73-20260618
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:9be46a45-5e49-4113-abcf-fa90ebd27ed4,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:0c30995eda76f8abc44c41195728a42b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|123|136|850|865|898,TC:nil,Content:0
	|15|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 771873246ae411f1aa26b74ffac11d73-20260618
X-User: luoliang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <luoliang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1534678407; Thu, 18 Jun 2026 15:08:10 +0800
From: luoliang@kylinos.cn
To: Shuah Khan <shuah@kernel.org>
Cc: "Eric W . Biederman" <ebiederm@xmission.com>,
	Andrey Vagin <avagin@openvz.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liang Luo <luoliang@kylinos.cn>
Subject: [PATCH] selftests/nsfs: fix wrong error check of NS_GET_USERNS result
Date: Thu, 18 Jun 2026 15:08:05 +0800
Message-Id: <20260618070805.144324-1-luoliang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Liang Luo <luoliang@kylinos.cn>

In the owner test, the owning user namespace of the "uns" fd is fetched
into "init_uns", but the subsequent error check tests "uns" again, which
was already validated earlier. The intended error path is therefore dead
code: if the ioctl() actually fails, "init_uns" is left at -1 and the
test proceeds to use it, surfacing the failure later as a misleading
"Don't get EPERM" (from EBADF on the invalid fd) instead of the intended
"Unable to get an owning user namespace".

Check "init_uns" instead, which is the value actually returned by the
ioctl() under test.

Fixes: 6ad92bf63e45 ("tools/testing: add a test to check nsfs ioctl-s")
Signed-off-by: Liang Luo <luoliang@kylinos.cn>
---
 tools/testing/selftests/filesystems/nsfs/owner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/nsfs/owner.c b/tools/testing/selftests/filesystems/nsfs/owner.c
index 96a976c74550..8ad7b4fb7655 100644
--- a/tools/testing/selftests/filesystems/nsfs/owner.c
+++ b/tools/testing/selftests/filesystems/nsfs/owner.c
@@ -72,7 +72,7 @@ int main(int argc, char *argvp[])
 		return pr_err("NS_GET_USERNS returned a wrong namespace");
 
 	init_uns = ioctl(uns, NS_GET_USERNS);
-	if (uns < 0)
+	if (init_uns < 0)
 		return pr_err("Unable to get an owning user namespace");
 
 	if (ioctl(init_uns, NS_GET_USERNS) >= 0 || errno != EPERM)
-- 
2.25.1


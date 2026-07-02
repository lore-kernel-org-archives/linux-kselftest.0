Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB0E2C234A;
	Thu,  2 Jul 2026 01:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782957194; cv=none; b=R12LXyJUWC+Ds5DiGn63W6MPB7OIG1SEr9thAph8y+aGLKYZDAlvO1NrCEzN+3d0QjL5Txm1jzXrXUye/gWQLLuOnwF3fqKhAJV4wiruofHqGmOw1YezxS1YLVCzV+a41nahBXti+bfTk3apumxjMwlqmcoRbPItjgdSIb02mtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782957194; c=relaxed/simple;
	bh=GfuZrzp5aOuZMP79Hjijd/mAHvpyLLXh80nNbqIuXZA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Gd0yCfPh82eMIq8Obw/eDp/RD4Wgxu1X+Zv6Jr+W8MuRvuMb9kK4xkKjD/VgTKTr0a8TM7lmNmBAnbZOF+VqKNcYk3B1j+QIC6xnHDlFP4K09YDim9kUhFJJnX+6Fd6JtghHE3V47Kro7e6RqRDoy/T4d45QZaTac8HqV16Mqg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c4fa273475b811f1aa26b74ffac11d73-20260702
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d1c6bd05-56c5-41a0-9b9b-ff68e8f31a92,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-INFO: VERSION:1.3.12,REQID:d1c6bd05-56c5-41a0-9b9b-ff68e8f31a92,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:15
X-CID-META: VersionHash:e7bac3a,CLOUDID:43083ef111991696f4cb16c2f702a1e8,BulkI
	D:260701203542AZS4KJN4,BulkQuantity:2,Recheck:0,SF:17|19|38|66|78|102|127|
	136|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,
	Bulk:41,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR
	:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c4fa273475b811f1aa26b74ffac11d73-20260702
X-User: wangyan01@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <wangyan01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 817380511; Thu, 02 Jul 2026 09:53:06 +0800
From: Wang Yan <wangyan01@kylinos.cn>
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Yan <wangyan01@kylinos.cn>
Subject: [PATCH v2] selftests/arm64: fix spelling errors in comments
Date: Thu,  2 Jul 2026 09:52:42 +0800
Message-Id: <20260702015242.361489-1-wangyan01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two spelling mistakes in arm64 selftest comments:
  - "whcih" -> "which" (arm64/gcs/libc-gcs.c)
  - "resutls" -> "results" (arm64/pauth/pac.c)

Signed-off-by: Wang Yan <wangyan01@kylinos.cn>
---
 tools/testing/selftests/arm64/gcs/libc-gcs.c | 2 +-
 tools/testing/selftests/arm64/pauth/pac.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/gcs/libc-gcs.c b/tools/testing/selftests/arm64/gcs/libc-gcs.c
index 72e82bfbecc9..ddb0b2b20155 100644
--- a/tools/testing/selftests/arm64/gcs/libc-gcs.c
+++ b/tools/testing/selftests/arm64/gcs/libc-gcs.c
@@ -130,7 +130,7 @@ TEST(gcs_find_terminator)
  * We can access a GCS via ptrace
  *
  * This could usefully have a fixture but note that each test is
- * fork()ed into a new child whcih causes issues.  Might be better to
+ * fork()ed into a new child which causes issues.  Might be better to
  * lift at least some of this out into a separate, non-harness, test
  * program.
  */
diff --git a/tools/testing/selftests/arm64/pauth/pac.c b/tools/testing/selftests/arm64/pauth/pac.c
index 67d138057707..f4b859c75a5a 100644
--- a/tools/testing/selftests/arm64/pauth/pac.c
+++ b/tools/testing/selftests/arm64/pauth/pac.c
@@ -292,7 +292,7 @@ TEST(single_thread_different_keys)
 
 /*
  * fork() does not change keys. Only exec() does so call a worker program.
- * Its only job is to sign a value and report back the resutls
+ * Its only job is to sign a value and report back the results
  */
 TEST(exec_changed_keys)
 {
-- 
2.25.1


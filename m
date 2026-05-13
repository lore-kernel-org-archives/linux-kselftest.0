Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B651EA7DB;
	Wed, 13 May 2026 02:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778641089; cv=none; b=Ul8YX74fAzJGM5bRxakqEPCzLRX6fvjdRk3DCjB841uiQ5v6Dh5Ak6wCm6oyNQgKVVwyht9T11RWKENdl97E9ejs2HsuA86kAtzoNY1xNJpRUe5pko2L4VNOcdSTCuv2VpgxJZx+FHb5eyPfq7oqo2dKO2WsHmJQn9ODmk05d4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778641089; c=relaxed/simple;
	bh=qdAcFIQzQTvttALS46yHVztLI/WcK2WSt4+wYkjO1TA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i2x8spMpGkbLEL3h/b6StlZTpCkGLNvBnvzF20XfHZNzudfEJYXc4mnvHehYPh93cYVquTqXAN1Z3kSqwMfCYurQ72H9brLI1ZKnyekCBeA8vONEDH9mnhWOcz+fgehA71w6rr0g4Q0uOixRnqMi5tclC99NGmlk/TUDBljS/Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8daff6224e7711f1aa26b74ffac11d73-20260513
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d943919f-db3d-47e1-9895-69d23bfc994a,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.3.12,REQID:d943919f-db3d-47e1-9895-69d23bfc994a,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:e7bac3a,CLOUDID:f2261abd433741342e87a4e9743dbeec,BulkI
	D:260513105801RV2ZSDY2,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102|127|
	850|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil
	,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:
	0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8daff6224e7711f1aa26b74ffac11d73-20260513
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1415261681; Wed, 13 May 2026 10:58:01 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: shuah@kernel.org,
	akpm@linux-foundation.org,
	reddybalavignesh9979@gmail.com,
	richard.weiyang@gmail.com,
	mic@digikod.net,
	sj@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH] selftests/perf_events: Fix mmap() error check in sigtrap_threads
Date: Wed, 13 May 2026 10:58:38 +0800
Message-Id: <20260513025838.594945-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In sigtrap_threads(), the return value of mmap() is checked against
NULL.  mmap() returns MAP_FAILED, which is (void *)-1, not NULL, when
it fails.  Since MAP_FAILED is non-zero and non-NULL, the condition
"p == NULL" will never be true on failure, causing the program to
proceed with an invalid pointer and segfault if mmap() actually fails
under memory pressure.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 tools/testing/selftests/perf_events/watermark_signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/perf_events/watermark_signal.c b/tools/testing/selftests/perf_events/watermark_signal.c
index 0f64b9b17081..a84709cabd8b 100644
--- a/tools/testing/selftests/perf_events/watermark_signal.c
+++ b/tools/testing/selftests/perf_events/watermark_signal.c
@@ -102,7 +102,7 @@ TEST(watermark_signal)
 	}
 
 	p = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
-	if (p == NULL) {
+	if (p == MAP_FAILED) {
 		perror("mmap");
 		goto cleanup;
 	}
-- 
2.25.1


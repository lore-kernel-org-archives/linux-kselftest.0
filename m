Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2927F481FC4;
	Wed,  1 Jul 2026 12:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909354; cv=none; b=OmtcF5kbEFZ8JYrIqL56m/Cika9vo/pZ/nthwde7T0GEgOr1Ua65hKrfrktKYztpeUaPafxyVvNNA2aq6O7AiKtpBBCcZ0R7Nbb5rIk2TVCGGJSQ2CdtC59c0Fb8RzLS5Qtm60rYW3HvzBMoWyD1SGFRkT7mXRZLvv490Hfsuw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909354; c=relaxed/simple;
	bh=KKE0f0jEauue+Go3cwXy9K4B2j97KiDFj9V2X3tXrmY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ujj6LkcD5t2bJwk4M4u9qZ48EbgC2JJ2iSZ/hlMokgG278z7kLzUrr/Xs+WrLDf5xLObwvLoy11rGhvIgpBYdFuDytMoQCtbhfsaELVUmdom1KwmCgIKpiU5Taq0vcxrAFYkSnLDj2wNEdfWIyGlGjvKhSoXDi4VUoVlWGL0Fe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 602243ba754911f1aa26b74ffac11d73-20260701
X-CTIC-Tags:
	HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NAME, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED
	DN_TRUSTED, SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b5499ee4-a1b7-4095-a340-674e03711bd1,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-INFO: VERSION:1.3.12,REQID:b5499ee4-a1b7-4095-a340-674e03711bd1,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:15
X-CID-META: VersionHash:e7bac3a,CLOUDID:75d3299fb134d3bec5ba2ee3faa39bef,BulkI
	D:260701203545BV59SBTS,BulkQuantity:0,Recheck:0,SF:17|19|66|78|81|82|102|1
	27|136|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:n
	il,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
	,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 602243ba754911f1aa26b74ffac11d73-20260701
X-User: wangyan01@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <wangyan01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 611565946; Wed, 01 Jul 2026 20:35:43 +0800
From: Wang Yan <wangyan01@kylinos.cn>
To: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Wang Yan <wangyan01@kylinos.cn>
Subject: [PATCH 2/6] selftests/filesystems: fix spelling error in statmount test comment
Date: Wed,  1 Jul 2026 20:35:16 +0800
Message-Id: <20260701123520.271580-3-wangyan01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260701123520.271580-1-wangyan01@kylinos.cn>
References: <20260701123520.271580-1-wangyan01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo "didnt't" -> "didn't" in statmount_test.c comment.

Signed-off-by: Wang Yan <wangyan01@kylinos.cn>
---
 tools/testing/selftests/filesystems/statmount/statmount_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/statmount/statmount_test.c b/tools/testing/selftests/filesystems/statmount/statmount_test.c
index 8dc018d47a93..9d963e09e510 100644
--- a/tools/testing/selftests/filesystems/statmount/statmount_test.c
+++ b/tools/testing/selftests/filesystems/statmount/statmount_test.c
@@ -515,7 +515,7 @@ static void test_statmount_mnt_opts(void)
 		return;
 	}
 
-	ksft_test_result_fail("didnt't find mount entry\n");
+	ksft_test_result_fail("didn't find mount entry\n");
 	free(sm);
 	free(line);
 }
-- 
2.25.1


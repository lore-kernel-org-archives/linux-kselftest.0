Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E038838399E;
	Thu, 20 Aug 2026 06:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787206620; cv=none; b=F5LKYC/LvtP01juoXafBOPRj3WX7f+A2ohscswNXmuQI7h8a2KDacJYqNxIfOsf3f+MR4GV/Lyvkh+kf90sEmuI9ZG1HWP+/FGX+VNQdIysOgZVw+LaJNwZ+20mMp6nlM/7IYEccw4J1zRz8jlLbuMg0Rz6hfZqTaBsOrtiumiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787206620; c=relaxed/simple;
	bh=k6pCBBFFABJ70TEgwYH2rVhFPANiPd56PqlXBpQlIFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmIW5VYGeAb1tiiziWHOJuRJAyzOpc+T6gJiFm0GEHuqpOALt3syhuVPL/P+z+SKMqw7fQnESb9yU6Obrl9HvQwNCd3qzm4bDdr6haNiwUcE/4Tg1uYpqYpbZ4oksvp2/EIpQsY3gd+WWGOV87YOdrRYEdzcSBswwf7qbHMvpfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b9c8d4929c5e11f19a56ed5b684f684d-20260820
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:2556217f-9af6-4e6a-9004-1ed0931e5f95,IP:10,
	URL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:30
X-CID-INFO: VERSION:1.3.19,REQID:2556217f-9af6-4e6a-9004-1ed0931e5f95,IP:10,UR
	L:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:30
X-CID-META: VersionHash:7db8b62,CLOUDID:04789f96b10346299d3591742fa2bff9,BulkI
	D:26082014165278OO1KMZ,BulkQuantity:0,SF:17|19|38|66|78|81|82|102|127|865|
	898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:n
	il,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b9c8d4929c5e11f19a56ed5b684f684d-20260820
X-User: husong@kylinos.cn
Received: from ctao-book.. [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1157144219; Thu, 20 Aug 2026 14:16:48 +0800
From: Song Hu <husong@kylinos.cn>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: shuah@kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	peterx@redhat.com,
	sarthak.sharma@arm.com,
	usama.anjum@arm.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Song Hu <husong@kylinos.cn>
Subject: [PATCH v3 1/3] selftests/mm: emit TAP header in uffd-wp-mremap
Date: Thu, 20 Aug 2026 14:14:24 +0800
Message-ID: <20260820061426.356869-2-husong@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820061426.356869-1-husong@kylinos.cn>
References: <20260820061426.356869-1-husong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uffd-wp-mremap calls ksft_set_plan() without ksft_print_header(), so its
output is not valid KTAP.  Add the header, like the sibling uffd tests
(uffd-stress, uffd-unit-tests).

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Song Hu <husong@kylinos.cn>
---
 tools/testing/selftests/mm/uffd-wp-mremap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-wp-mremap.c b/tools/testing/selftests/mm/uffd-wp-mremap.c
index c973d6722720..572c2516e874 100644
--- a/tools/testing/selftests/mm/uffd-wp-mremap.c
+++ b/tools/testing/selftests/mm/uffd-wp-mremap.c
@@ -347,6 +347,8 @@ int main(int argc, char **argv)
 	struct thp_settings settings;
 	int i, j, plan = 0;
 
+	ksft_print_header();
+
 	hugepage_save_settings(true, true);
 
 	check_uffd_wp_feature_supported();
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139468;
	b=FQ2wG523/QWz2tZUH5TD6gL9+1VT+cSFZyj3vkvhZOfsDiHDr/wbkH4onMuN3R6T0cwk
	 mn4IlBNis0NosR60W7CtFBYLvTxrwUmlvFWRxCGEQXgXDoUCicjUw0Dg62H4ycFEljBdZ
	 M0iHyGQvdiDHPsEwj94f5griKQDYZJyV1gairkX6qiwFu7BNCBuNKdl9CO/4nLynaoeWu
	 7me7AzoCBcp5a+XDKhRF+xHg/j7J/Wu2yTea0eZBEVmryABDJvngz9+ld8rRpbgovvU8Y
	 HKCuzTEp1zusQNslNDAO0yXNQcPLsyYBbsAnecFLoC0I+iZCL9DAp2sYVNLHbYU9Zgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139468;
	h=DMARC-Filter:X-UUID:X-CTIC-Tags:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9vGUD1suLBnRt0owSt9jD5mFNgLgcQyVHLA6QUgiD1E=;
	b=yADitn51Sm4KQXxvklspv1YSMJchdWGpnIthay0byqscSAvrJaKHpNf23Fn8IsyR+qVW
	 8wL7Bm6+VsIyBN7yWg1MPROIrOONVIj+gZEmhc6XPK2Z3tF/VieOeWFHtJRNauxGUYrzw
	 3gtEa7hBiSkT69GwQ2jUha2rNDmCn5erx3JVLamAKTR0ocemZ5ejpduCn2L3Dryr/1WZG
	 E7IAFdx5otB//3RvMjzgVR1PydwnmCgLVjXtygGxQkfbqVtV1Fp7RA8GqDbF+NVjIheCf
	 eIirOAWSJTv526QvQpBn/FicSC6mMoqzTDpK818D2oEWiRik7YOaLgBwwSOoWnSw3mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1157B606A325;
	Fri, 20 Nov 2026 01:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1157B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d33fda2ee48411f19a56ed5b684f684d-20261120
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:849dcd0a-3f02-4cae-a128-8a4cd9fb2aeb,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-INFO: VERSION:1.3.19,REQID:849dcd0a-3f02-4cae-a128-8a4cd9fb2aeb,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:15
X-CID-META: VersionHash:7db8b62,CLOUDID:9dadecb9686f8b308f418b8a5d787993,BulkI
	D:261120095058ABQSO0VM,BulkQuantity:0,SF:10|38|66|78|102|127|153|850|865|8
	98,TC:nil,Content:0|15|50|99,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,Q
	S:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,
	ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d33fda2ee48411f19a56ed5b684f684d-20261120
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 797630907; Fri, 20 Nov 2026 09:50:55 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: brendan.higgins@linux.dev,
	david@davidgow.net
Cc: raemoar63@gmail.com,
	brgl@kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	13667453960@163.com,
	Jiangshan Yi <yijiangshan@kylinos.cn>
Subject: [PATCH] kunit: minor cleanups in attribute filtering
Date: Fri, 20 Nov 2026 09:50:20 +0800
Message-Id: <20261120015020.40658-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kunit_filter_attr_tests() calls get_attr() twice for each test case;
reuse test_val for the filter() call.

In attr_enum_filter(), stop scanning str_list once the input value is
matched.

Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 lib/kunit/attributes.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/kunit/attributes.c b/lib/kunit/attributes.c
index 6d7a53af94a9..9ff04d2985f1 100644
--- a/lib/kunit/attributes.c
+++ b/lib/kunit/attributes.c
@@ -132,8 +132,10 @@ static int attr_enum_filter(void *attr, const char *input, int *err,
 	}
 
 	for (j = 0; j <= max; j++) {
-		if (!strcmp(input_val, str_list[j]))
+		if (!strcmp(input_val, str_list[j])) {
 			input_int = j;
+			break;
+		}
 	}
 
 	if (input_int < 0) {
@@ -432,8 +434,7 @@ struct kunit_suite *kunit_filter_attr_tests(const struct kunit_suite *const suit
 	/* For each test case, save test case if passes filtering. */
 	kunit_suite_for_each_test_case(suite, test_case) {
 		test_val = filter.attr->get_attr((void *) test_case, true);
-		test_result = filter.attr->filter(filter.attr->get_attr(test_case, true),
-				filter.input, err);
+		test_result = filter.attr->filter(test_val, filter.input, err);
 		if (*err)
 			goto err;
 
-- 
2.25.1


Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E080028E0F;
	Sat, 15 Aug 2026 10:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786788270; cv=none; b=AqRqctjaa1JTiZPyCu3uu/d/AsvT7AcRbbRd55M+LOaSFu2ovTOFI6Vi9cp8RkJLhliO9GAVzP1slCFzvKx9eYbpw+jlunyqLzfHDU5oTDWbvVdKptnk+6AYry9pgGZDIOOGDrBiiEh9TaPgWNtiyx2Vhvc5F5hWWfQ1+mrYeAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786788270; c=relaxed/simple;
	bh=F6otjO3ubj9NG5NUsSl01uuqAKq08BS82QL6wQlVY2U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=favy1EA/byF+zI+byL46q5ctm2iW5X+B1YOzVRDGSrV9/oJIlWo+fADNupin8B+PKZeYbcEAXwGU2CmDNMm4SA3ZwPOpM9Kc2NWI00hNejVMdng6mmXGHi/7Q7iP7ji8W0JH5pbPgUolDqRij4947xHofKiOTy7JNl7CJhq3zTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: abc39e30989011f19a56ed5b684f684d-20260815
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR, DN_TRUSTED
	SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD_SPF, CIE_UNKNOWN
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:53b533c3-cbac-4ac3-9382-1c1de90dda92,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-INFO: VERSION:1.3.19,REQID:53b533c3-cbac-4ac3-9382-1c1de90dda92,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:15
X-CID-META: VersionHash:7db8b62,CLOUDID:8b6579f7dfbb0eb419d94c65004d236d,BulkI
	D:260815180419RSDGFHBV,BulkQuantity:0,SF:10|66|78|102|127|865|898,TC:nil,C
	ontent:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: abc39e30989011f19a56ed5b684f684d-20260815
X-User: yijiangshan@kylinos.cn
Received: from lazy-pc.www.tendawifi.com [(118.251.48.97)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 108675986; Sat, 15 Aug 2026 18:04:14 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: kees@kernel.org,
	shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	13667453960@163.com,
	Jiangshan Yi <yijiangshan@kylinos.cn>
Subject: [PATCH] selftests/lkdtm: Add missing crashtypes to tests.txt
Date: Sat, 15 Aug 2026 18:04:06 +0800
Message-Id: <20260815100406.785640-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several crashtypes were added to the LKDTM source code but their
corresponding entries were not added to tests.txt, making them
unreachable via the kselftest framework.

Add the following missing crashtype entries:
  - OVERFLOW_SIGNED
  - OVERFLOW_UNSIGNED
  - EFI_RUNTIME_CRASH (conditionally compiled with CONFIG_EFI)
  - KFENCE_READ_AFTER_FREE
  - REFCOUNT_SUB_AND_TEST_ZERO
  - USERCOPY_VMALLOC
  - USERCOPY_FOLIO

REPORT_STACK is intentionally not added as it is handled separately
by stack-entropy.sh.

Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 tools/testing/selftests/lkdtm/tests.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index bec57a0..6053dfa 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -13,6 +13,8 @@ EXCEPTION
 ARRAY_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 FAM_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 PTR_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
+OVERFLOW_SIGNED
+OVERFLOW_UNSIGNED
 CORRUPT_LIST_ADD list_add corruption
 CORRUPT_LIST_DEL list_del corruption
 STACK_GUARD_PAGE_LEADING
@@ -21,11 +23,13 @@ REPORT_STACK_CANARY repeat:2 ok: stack canaries differ
 UNSET_SMEP pinned CR4 bits changed:
 DOUBLE_FAULT
 CORRUPT_PAC
+EFI_RUNTIME_CRASH
 UNALIGNED_LOAD_STORE_WRITE
 SLAB_LINEAR_OVERFLOW
 VMALLOC_LINEAR_OVERFLOW
 #WRITE_AFTER_FREE Corrupts memory on failure
 READ_AFTER_FREE call trace:|Memory correctly poisoned
+KFENCE_READ_AFTER_FREE call trace:|Memory correctly poisoned
 #WRITE_BUDDY_AFTER_FREE Corrupts memory on failure
 READ_BUDDY_AFTER_FREE call trace:|Memory correctly poisoned
 SLAB_INIT_ON_ALLOC Memory appears initialized
@@ -59,6 +63,7 @@ REFCOUNT_DEC_ZERO
 REFCOUNT_DEC_NEGATIVE Negative detected: saturated
 REFCOUNT_DEC_AND_TEST_NEGATIVE Negative detected: saturated
 REFCOUNT_SUB_AND_TEST_NEGATIVE Negative detected: saturated
+REFCOUNT_SUB_AND_TEST_ZERO
 REFCOUNT_INC_ZERO
 REFCOUNT_ADD_ZERO
 REFCOUNT_INC_SATURATED Saturation detected: still saturated
@@ -77,6 +82,8 @@ USERCOPY_SLAB_WHITELIST_FROM
 USERCOPY_STACK_FRAME_TO
 USERCOPY_STACK_FRAME_FROM
 USERCOPY_STACK_BEYOND
+USERCOPY_VMALLOC
+USERCOPY_FOLIO
 USERCOPY_KERNEL
 KSTACK_ERASE OK: the rest of the thread stack is properly erased
 CFI_FORWARD_PROTO
-- 
2.25.1


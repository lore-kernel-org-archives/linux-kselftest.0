Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD542FD665;
	Mon, 25 May 2026 07:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694513; cv=none; b=EzRPRC2P6MwquBPo+UBlHkciWBckO5JmNsyWpZZHUny6Yvbw0De6pSXmBmzsy1RnA/vATma6ChZvl8zPAqf0K+oR6IO2B6MboSh6UJzOPlUnQjBJVKPonEz3Ye7xssCjN+wlzWGE/idWF6eJw7xKv/Y26BXA1u4OjcpRhXAHDN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694513; c=relaxed/simple;
	bh=y/lak3iivchZcieWtGcTo5J42cW186hW4JCqgE8VhE0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mM7ydZ4DxYF0kMfH5O9KQ/RUc/RHeAov0tYWBYlLe/W0RGeZ8GtH4iBGwGhviFWDaZp+qTh0/GSu9IQuwqgHOWJZYTFU7TCgIdJz+/SG2ZOkjCppyKpfQogc+C202ywIoqN16ybBDQZgO8mIIMkF7bsgy8PB+TEv3M+Lo5+w2P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 89393c82580b11f1aa26b74ffac11d73-20260525
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:6a2ec9fc-1d7d-42eb-8e77-6ebdc2449a43,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.3.12,REQID:6a2ec9fc-1d7d-42eb-8e77-6ebdc2449a43,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:e7bac3a,CLOUDID:05f470e43124d024726f241070f80412,BulkI
	D:2605251530023B5XW8HZ,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102|127|
	850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:99|1,File:nil,RT:nil,B
	ulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR
	:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 89393c82580b11f1aa26b74ffac11d73-20260525
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1149553975; Mon, 25 May 2026 15:29:59 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH v2 0/2] selftests/mm: refactor pkey helpers and fix mmap error handling
Date: Mon, 25 May 2026 15:30:24 +0800
Message-Id: <20260525073026.27594-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is version 2 of the previous patch [0].  In v2, the changes are
split into two patches for easier review.
[0] https://lore.kernel.org/all/20260518082120.3890552-1-lihongfu@kylinos.cn/

The main changes in this series are to refactor shared tracing and assertion
helpers into a common file, unify both pkey selftests on pkey_assert() and 
per-test tracing for consistent diagnostics, and add missing mmap() return 
checks with MAP_FAILED used throughout for readability and consistency.

Hongfu Li (2):
  selftests/mm: Refactor pkey test helpers and unify assertions
  selftests/mm: add missing mmap() return checks in pkey tests

 tools/testing/selftests/mm/pkey-helpers.h     |  5 +-
 tools/testing/selftests/mm/pkey-powerpc.h     |  2 +-
 .../selftests/mm/pkey_sighandler_tests.c      | 20 ++--
 tools/testing/selftests/mm/pkey_util.c        | 81 +++++++++++++++
 tools/testing/selftests/mm/protection_keys.c  | 98 ++-----------------
 5 files changed, 109 insertions(+), 97 deletions(-)

---
v2:
- Update commit message
- Move shared tracing and assertion helpers to a common file,
  replace assert() with pkey_assert() in sighandler tests
- Drop assert() from main() in protection_keys.c and add a proper error
  message instead.
-- 
2.50.1


Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AB97081E;
	Tue, 25 Aug 2026 08:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648337; cv=none; b=fKLgSoBc56exovVcrB7WSrKqdV7gJctM1tVH2+p7k4idAk/LD2Mjt8HJUBjGw5OCT3MpiPneiUSvrU9rvmDHW0Hfc9NQsVO+51ng8GOMCEX+W1L47GT5FZ8tozR3MGWpPhtIbswFD0L66gqtjON4Eg6cRyJeHMSKXunXPrPBCVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648337; c=relaxed/simple;
	bh=1/SYMJ78Zb1F9Y6x+8sWktBXBJBjvYan8XKixPj73Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IdKSKagE2kpDseHKHaMPkL4cH+6v+ddzmMdY8M0nEW654BDz+Zh1C2qsTHvMT6ZM6yBtkWMWZXUGKOyC3y6y+9vdwuIud9DNG8u9E+2dvRF7J8IoEm7MYS92XRTUAPKQa/JdaZBjbvR3XS4nu3hBXdmFspXFAPDTZAf9p9gDdnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2d86fddea06311f19a56ed5b684f684d-20260825
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_C_CI, GTI_FG_IT, GTI_RG_INFO, GTI_C_BU, AMN_T1
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:df9ad7aa-906e-4814-9f3f-45fc084a67c9,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:35
X-CID-INFO: VERSION:1.3.19,REQID:df9ad7aa-906e-4814-9f3f-45fc084a67c9,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:35
X-CID-META: VersionHash:7db8b62,CLOUDID:6a7a5721c16a400f63271eb0392519bf,BulkI
	D:260825165848ITGJ0LFM,BulkQuantity:0,SF:17|19|38|66|78|102|127|865|898,TC
	:nil,Content:0|15|50,EDM:5,IP:-2,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2d86fddea06311f19a56ed5b684f684d-20260825
X-User: husong@kylinos.cn
Received: from ctao-book.. [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2114683762; Tue, 25 Aug 2026 16:58:45 +0800
From: Song Hu <husong@kylinos.cn>
To: akpm@linux-foundation.org,
	usama.anjum@arm.com
Cc: linux-mm@kvack.org,
	shuah@kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	peterx@redhat.com,
	sarthak.sharma@arm.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Song Hu <husong@kylinos.cn>
Subject: [PATCH v4 0/3] selftests/mm: TAP output and global-state fixes
Date: Tue, 25 Aug 2026 16:57:53 +0800
Message-ID: <20260825085756.63030-1-husong@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uffd-wp-mremap and mremap_test never print the TAP header (and mremap_test
skips with a bare exit(KSFT_SKIP) rather than a KTAP skip), so their output
is not valid KTAP; hugetlb-soft-offline toggles enable_soft_offline during
the run and leaves it disabled afterwards.

Tested on x86_64.

Song Hu (3):
  selftests/mm: emit TAP header in uffd-wp-mremap
  selftests/mm: emit TAP header and use TAP skip in mremap_test
  selftests/mm: restore enable_soft_offline in hugetlb-soft-offline

 tools/testing/selftests/mm/hugetlb-soft-offline.c | 49 +++++++++++++----------
 tools/testing/selftests/mm/mremap_test.c          | 43 +++++++++++++---------
 tools/testing/selftests/mm/uffd-wp-mremap.c       |   2 +
 3 files changed, 55 insertions(+), 39 deletions(-)

---

Changes in v4, per review of v3 patch 3/3:

- hugetlb-soft-offline: the atexit restore handler no longer uses
  write_num(); on failure it re-enters exit() through
  ksft_exit_fail_msg(), undefined behavior from inside an atexit
  handler.  Restore with plain open()/write(), best effort.

Changes in v3, per Usama Anjum's review of v2 patch 2/3:

- mremap_test: cache mmap_min_addr in main() before ksft_set_plan(),
  so the skip paths in get_mmap_min_addr() are taken before the plan
  is set; a skip after the plan leaves the run with fewer tests than
  planned.

Changes in v2, per review feedback from Mike Rapoport, Sarthak Sharma and
the Sashiko AI review Andrew Morton pointed at:

- mremap_test: save errno before fclose() in get_mmap_min_addr() so
  strerror() reports the actual failure, and split the ksft_*() messages
  embedding "\n\t" so continuation lines get the "# " prefix.

- hugetlb-soft-offline: restore enable_soft_offline from an atexit()
  handler so it also runs on early exits, and use read_num()/write_num()
  from vm_util instead of the hand-rolled helpers.

v3: https://lore.kernel.org/all/20260820061426.356869-1-husong@kylinos.cn/
v2: https://lore.kernel.org/all/20260815080716.3596514-1-husong@kylinos.cn/
v1: https://lore.kernel.org/all/20260812120821.523860-1-husong@kylinos.cn/

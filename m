Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91171282F2A;
	Thu,  2 Jul 2026 06:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782973469; cv=none; b=YLYm5odKoO25IV0FkAn9Q5p0fjsKT88GX9sCNny7K8eaOmcR510oqQZStj2QpHjmZYEhxpizyjOkGo6iK18SXx/V7cmXoySLEf+ePwItdaP4lGt9kYKl6l9VKNN/QxCea9ZK4Z/vwSooaLxv/6CwDgYImHu9ZE5PPOXON6SnuiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782973469; c=relaxed/simple;
	bh=V9NJSOqyYK9rb/F8SJA+KJpYYiaZvWkGTMmc4WM83xQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iHi6qpDNcG1dH+Im22H1GifOQXCzvrt+b6hVUwabMQ/gTNjnSO4crsIzUunOxExbRN5J1JpOR/BYlM41XjXdDIOFUjHmZTPbS+GyNZh0QEWu3BwLJPIBKSeWTqOWc8MUOR0tK4CwaPAY9Hvq4eYDdUaLSmYTHH4wkeLRF0z6Sy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a79a29d475de11f1aa26b74ffac11d73-20260702
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
X-CID-O-INFO: VERSION:1.3.12,REQID:ef7ac675-1977-46af-ba66-c0f6901f6aa9,IP:10,
	URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-15
X-CID-INFO: VERSION:1.3.12,REQID:ef7ac675-1977-46af-ba66-c0f6901f6aa9,IP:10,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-15
X-CID-META: VersionHash:e7bac3a,CLOUDID:4aba2abaec67fe1d2457b2597feb7423,BulkI
	D:260702142419ZJV04T2C,BulkQuantity:0,Recheck:0,SF:10|38|66|78|102|127|136
	|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:99|1,File:nil,RT:nil,
	Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BR
	R:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a79a29d475de11f1aa26b74ffac11d73-20260702
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1484884270; Thu, 02 Jul 2026 14:24:18 +0800
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
	jhubbard@nvidia.com,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	kevin.brodsky@arm.com,
	usama.anjum@collabora.com,
	yury.khrustalev@arm.com,
	zwisler@google.com,
	hongfu.li@linux.dev,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH v9 0/5] selftests/mm: refactor pkey helpers and fix mmap error handling
Date: Thu,  2 Jul 2026 14:23:27 +0800
Message-Id: <20260702062332.911786-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The main changes in this series are to refactor shared tracing and assertion
helpers into a common file, unify both pkey selftests on pkey_assert() and
per-test tracing for consistent diagnostics, and add missing mmap() return
checks with MAP_FAILED used throughout for readability and consistency.

Hongfu Li (5):
  selftests/mm: move pkey selftest helpers to pkey_util.c
  selftests/mm: unify pkey sighandler selftest assertions and tracing
  selftests/mm: use pkey_assert on clone_raw failure in pkey test
  selftests/mm: add missing mmap() return checks in pkey tests
  selftests/mm: add missing pthread_create() return checks in pkey tests

 tools/testing/selftests/mm/pkey-helpers.h     |   4 +-
 tools/testing/selftests/mm/pkey-powerpc.h     |   2 +-
 .../selftests/mm/pkey_sighandler_tests.c      | 107 ++++++++++--------
 tools/testing/selftests/mm/pkey_util.c        |  90 +++++++++++++++
 tools/testing/selftests/mm/protection_keys.c  |  99 ++--------------
 5 files changed, 159 insertions(+), 143 deletions(-)

---
v9:
- In patch 1/5, define test_nr, iteration_nr and dprint_in_signal in
  pkey_util.c and remove them from protection_keys.c and
  pkey_sighandler_tests.c.
- In patch 1/5, cat_into_file() used the wrong argument in the open()
  failure message; print file instead of str. Update the commit message
  accordingly.
- In patch 2/5, align clone_raw() continuation lines to the opening parenthesis.
- In patch 5/5, set errno from pthread_create() return value before
  pkey_assert(0) on thread creation failure.
- Add Acked-by, Reviewed-by and Tested-by tags to each patch.
v8:
- No code changes (relative to v7).
- Updated Cc list: added developers identified via `git blame` and
  `git log` on tools/testing/selftests/mm/pkey*
v7:
- As previously suggested, wait for v7.2-rc1 and rebased the whole series
  on top of it. No functional code changes.
v6:
- Add missing pthread_create() return checks (new patch 5/5).
- In patch 2/5, call tracing_off() at the start of test_pkru_sigreturn
  before the SIGSEGV handler is reset to SIG_DFL, to avoid leaving ftrace
  enabled on crash.
v5:
- Use ret instead of child_pid to hold the return value of clone_raw().
- Make tracing_on(), tracing_off() non-static.
  Remove cat_into_file() declaration from pkey-helpers.h.
v4:
- Base changes on top of the latest mm-unstable branch.
- Split the first patch into three:
  patch 1: move pkey selftest helpers to shared code;
  patch 2: unify sighandler selftest assertions and per-test tracing;
  patch 3: use pkey_assert() on clone_raw() failure.
- Use ksft_exit_fail_perror() in main() for mmap() failure.
v3:
- Use pkey_assert() for remaining sigaction() and clone_raw() error
  checks for consistency.
v2:
- Update commit message
- Move shared tracing and assertion helpers to a common file,
  replace assert() with pkey_assert() in sighandler tests
- Drop assert() from main() in protection_keys.c and add a proper error
  message instead.
- Link to v1: https://lore.kernel.org/all/20260518082120.3890552-1-lihongfu@kylinos.cn/
-- 
2.25.1


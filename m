Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4AB3CA4A9;
	Mon,  6 Jul 2026 08:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325827; cv=none; b=Hys7XwkVNwuZzgSkbbNSqCdTE/JPL/m7wxXdTlkakvvYP3kQ27KKnYDW5uAvkc6iOZXV1wM5I4kmiG9gL+6sol9l/xwVdD7IGkN8XQiVMRePjXTWfc+duolMvgk6vbW+r2JOfKWFm1oZZVJvuuzGZPePLR6prHRT21hB0Ovq4BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325827; c=relaxed/simple;
	bh=4UdgWlHioRwnPF9w8VdYXgUzVUJmIjKs+HZtSH0BBa4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YMb3I7+IZlYj9vq0Lksvcd2oxKnx0zXCM4eLsGEXGp60AhD5zXdr7DGvh+8p88a963MphWSvXYwFA/KkkIrMosfaAWsAaDNQXO8BN4P22jh5hFtetdhSLhLQM8b4Ht3bDObomsnzZ0E8H5kkuTxNKAAw5m03lC8Pz1joQI1W04A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0cc495b0791311f1aa26b74ffac11d73-20260706
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_FG_IT, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:dbe34077-1383-4c34-9d53-cd4508c2c74e,IP:10,
	URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-15
X-CID-INFO: VERSION:1.3.12,REQID:dbe34077-1383-4c34-9d53-cd4508c2c74e,IP:10,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-15
X-CID-META: VersionHash:e7bac3a,CLOUDID:c96d5a668d2e3432a5e6483a35694a94,BulkI
	D:2607061616569IP18YBF,BulkQuantity:0,Recheck:0,SF:10|38|66|78|102|127|136
	|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:99|1,File:nil,RT:nil,
	Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BR
	R:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0cc495b0791311f1aa26b74ffac11d73-20260706
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 975551959; Mon, 06 Jul 2026 16:16:55 +0800
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
Cc: jhubbard@nvidia.com,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	kevin.brodsky@arm.com,
	usama.anjum@collabora.com,
	yury.khrustalev@arm.com,
	zwisler@google.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hongfu.li@linux.dev,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH v10 0/6] selftests/mm: refactor pkey helpers and fix mmap error handling
Date: Mon,  6 Jul 2026 16:15:54 +0800
Message-Id: <20260706081600.3570203-1-lihongfu@kylinos.cn>
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

Hongfu Li (6):
  selftests/mm: move pkey selftest helpers to pkey_util.c
  selftests/mm: unify pkey sighandler selftest assertions and tracing
  selftests/mm: use pkey_assert on clone_raw failure in pkey test
  selftests/mm: add missing mmap() return checks in pkey tests
  selftests/mm: add missing pthread_create() return checks in pkey tests
  selftests/mm: fix clone cleartid race in pkey sighandler tests

 tools/testing/selftests/mm/pkey-helpers.h     |   4 +-
 tools/testing/selftests/mm/pkey-powerpc.h     |   2 +-
 .../selftests/mm/pkey_sighandler_tests.c      | 115 ++++++++++--------
 tools/testing/selftests/mm/pkey_util.c        |  90 ++++++++++++++
 tools/testing/selftests/mm/protection_keys.c  |  99 ++-------------
 5 files changed, 165 insertions(+), 145 deletions(-)

---
v10:
- Add patch 6/6 to fix a pre-existing cleartid race: remove unused
  settid/cleartid clone flags and wait for the clone child to exit in
  the sigsegv test.
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


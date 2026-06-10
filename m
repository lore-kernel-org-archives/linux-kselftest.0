Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0EC3F0AB3;
	Wed, 10 Jun 2026 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087382; cv=none; b=i11i0sY0at4FqHIJvMyS2PEshR+uccoedk7pfvBjjpVxP1RbvtGbL38IPjPFMW/pv4ucxShtHxWJmGINVeH6Am7WNK/zduUrjUpYSsmHdvsIcPHPSDuDfdHgJdFGcrlTZxVxLDaCQUsDYIL6uwHwL77l4gEJHOzz8PHHJuHm1JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087382; c=relaxed/simple;
	bh=d/F55YqO4yutQSORxJ9wL20xUDNKawjyTW4rWDQQ4TY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h0GGbtjULb2of1ijHY5aOkPGEKBDqdtzsTPtyun6GB76sQvdwSASLBZVL6EUsjXXkNdGs8FerxZjzZlmvni6oYt/DtPs/iI7nLCWqe+4G4ZUxil6RVUYFXzWEwqEj5b6dRwW6ntdM5vuM3FAN2F3J1dVNk8Xx44tfvKSksU1hEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=HdHLOaBR; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="HdHLOaBR"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781087371; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=BbCWmlCmn/Tj2Not5xAOtZkBxC6r0MbruxPRpmXFBTY=;
	b=HdHLOaBRprZt9/6kfkkVvY9YYLGME4p5Q8nqm/kZi6AgHHeV/gs6uMbsGBN9d2eIEq8aoLa+sc9fKP8fb8ZDrNECdVDkvwZ08CFyT7spixkX+ipV/glg6CoQ+uv5Touocrbb90T2S2ACpOQQYkSgjsKBaSoS35M21IaorhUMz3c=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X4aHmfe_1781087369;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4aHmfe_1781087369 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Jun 2026 18:29:30 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com
Cc: willy@infradead.org,
	ziy@nvidia.com,
	liam@infradead.org,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 00/11] add shmem mTHP collapse support
Date: Wed, 10 Jun 2026 18:29:08 +0800
Message-ID: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Note: this patchset is not targeting v7.2, but posted for early feedback.)

This is a follow-up patchset for mTHP collapse to support shmem mTHP collapse,
which is based on Nico's patchset[1].

The shmem mTHP collapse strategy follows the anonymous mTHP collapse approach:
track present pages via a bitmap while scanning PMD ranges for collapse candidates,
then use the bitmap after the scan completes to determine the most efficient
mTHP order to collapse to. Built on the basic framework added for anonymous
mTHP collapse, the shmem mTHP collapse implementation is straightforward
(Thanks for Nico's work).

In addition, I have added some anon/shmem mTHP collapse selftests, and now all
khugepaged test cases can pass.

Note: I have not yet enabled large order collapse for file folios (file folios
currently only support PMD-sized large folio collapse). Although file large order
collapse would be more straightforward to implement after shmem mTHP collapse
support is added (requiring some changes to file_thp_enabled()), I think this
still need some discussion on whether it is necessary to support other large
orders collapse for file folios.

Comments are welcome. Thanks.

Changes from RFC v1:
https://lore.kernel.org/all/cover.1755677674.git.baolin.wang@linux.alibaba.com/
 - Rebase on the new code, and update to use the new functions.
 - Add more test cases.

[1] https://lore.kernel.org/all/20260605161422.213817-1-npache@redhat.com/

Baolin Wang (11):
  mm: khugepaged: add max_ptes_none check in collapse_file()
  mm: khugepaged: generalize collapse_file() for shmem mTHP support
  mm: khugepaged: add an order check for PMD-sized THP statistics
  mm: khugepaged: add shmem mTHP collapse support
  mm: shmem: run khugepaged for all shmem mTHP orders
  mm: khugepaged: allow khugepaged to check all shmem mTHP-sized orders
  mm: khugepaged: skip large folios that don't need to be collapsed
  selftests: mm: extend the check_huge() to support mTHP check
  selftests: mm: move gather_after_split_folio_orders() into vm_util.c
    file
  selftests: mm: implement the mTHP-sized hugepage check helpers
  selftests: mm: add mTHP collapse test cases

 include/linux/shmem_fs.h                      |   4 +-
 mm/khugepaged.c                               | 174 ++++++++++++----
 mm/shmem.c                                    |  10 +-
 .../selftests/mm/folio_split_race_test.c      |   2 +-
 tools/testing/selftests/mm/khugepaged.c       | 195 +++++++++++++-----
 .../testing/selftests/mm/prctl_thp_disable.c  |   2 +-
 tools/testing/selftests/mm/run_vmtests.sh     |   4 +
 tools/testing/selftests/mm/soft-dirty.c       |   2 +-
 .../selftests/mm/split_huge_page_test.c       | 139 +------------
 tools/testing/selftests/mm/uffd-common.c      |   4 +-
 tools/testing/selftests/mm/vm_util.c          | 184 ++++++++++++++++-
 tools/testing/selftests/mm/vm_util.h          |   8 +-
 12 files changed, 492 insertions(+), 236 deletions(-)

-- 
2.47.3


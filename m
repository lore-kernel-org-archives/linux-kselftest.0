Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C34237713;
	Sat,  1 Aug 2026 06:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785565623; cv=none; b=n4rM3EySRqOvGxVlDsr+W5DtaOjl9cCppxlDlc63b3JeP5WTGGrkstjmgspbtoAsv2QICbo6axiUByab0Deu99J0dSc4Bhe8sDripEinD0zjKUW+pryxdQHur1+NqqW4LBz/eVP20DxrNcin0KdeVvHM22c1j42NgKeZOm2f0ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785565623; c=relaxed/simple;
	bh=PNeR05zln2uq2PSxbqu+MhEYS11O3trokjcKV5ueDdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iOYw+WnzrG49uMfHxlrZLqH4Y7EznZxql2iprGUIfd+y94929mWFwRTQgF2rTVrDbCyb2syn4r6Cl3w+bEaUQ/Eu708w9VBqviDRL2/dFJ+oFKVVCnfhCijmIvR2V9Z3jEQ5WHUcxCyG4NCrp8T/gKx2NJMicv7gP4G8tRChIdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Vz+AIy3T; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Vz+AIy3T"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785565609; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=43CpQuIZFpLERACn4hBgOkuuWdTC9VrCr63pEmkphlc=;
	b=Vz+AIy3ThsiqY0XzjXIZZrtPrBpP2PtvPZ6BoFzIQNIQNkMAmwq+68PTDF1RZcS8T547lg0FaJOhitWpGqdPgDd5V+iw6vXdRLByF/ecxU4268fZgjQ0/W9/O4JnPCz7zpP0r3XIGfwxdaT9nCd53+J18bR/z/kM9PSgiX5G2kc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X89cw7d_1785565608;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X89cw7d_1785565608 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 01 Aug 2026 14:26:49 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org
Cc: ziy@nvidia.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] add anon mTHP collapse test cases
Date: Sat,  1 Aug 2026 14:26:34 +0800
Message-ID: <cover.1785564857.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset is split from the previous shmem mTHP collapse patchset[1],
which only adds anon mTHP collapse selftests. All khugepaged test cases
can pass.

[1] https://lore.kernel.org/all/cover.1781083630.git.baolin.wang@linux.alibaba.com/

Changes from v1:
- Add order and hpage_size check (per Sashiko).
- Change to use THP_MADVISE for mTHP collapse (per Sashiko).

Baolin Wang (4):
  selftests: mm: extend the check_huge() to support mTHP check
  selftests: mm: move gather_after_split_folio_orders() into vm_util.c
    file
  selftests: mm: implement the mTHP-sized hugepage check helpers
  selftests: mm: add mTHP collapse test cases

 .../selftests/mm/folio_split_race_test.c      |   2 +-
 tools/testing/selftests/mm/khugepaged.c       | 190 +++++++++++++-----
 tools/testing/selftests/mm/pagemap_ioctl.c    |   2 +-
 .../testing/selftests/mm/prctl_thp_disable.c  |   2 +-
 tools/testing/selftests/mm/run_vmtests.sh     |   2 +
 tools/testing/selftests/mm/soft-dirty.c       |   2 +-
 .../selftests/mm/split_huge_page_test.c       | 139 +------------
 tools/testing/selftests/mm/uffd-common.c      |   4 +-
 tools/testing/selftests/mm/vm_util.c          | 185 ++++++++++++++++-
 tools/testing/selftests/mm/vm_util.h          |   8 +-
 10 files changed, 344 insertions(+), 192 deletions(-)

-- 
2.47.3


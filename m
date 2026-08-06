Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B876A282F20;
	Thu,  6 Aug 2026 03:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785987282; cv=none; b=lAsSQLSJYfaWwCYDJMBmq6+U5qYKTit0IMBIw6RAOhDYYpWpEoTG6KSyuSAQZhQUCbSniZM22q/J78BL87IeBMy0dbF2T/Yn2WG8HmhAfVvSFAiNA9ZeTKCzeyhCKXIUuKtghmfygwVkr0PZfLBCI1ceTKkpy1r+lYZWT+LN5KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785987282; c=relaxed/simple;
	bh=lPsvHFKzsJz6b9mjY4SjDc9N3XFiJXefzy/sF9e0jSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=faUz91uJaqSUjpAJpbrdJ/x/ID/nXwoijT5BE+biC7rA/7YXvJcHJKlamI4xh9seju2a8Ro+98BB2EkwpfqiyaAydQ4yNNOF2FYLcqrpd0HnRVEsFxR7jRGOKb9dmMdLFxmgcbl/Yo4YXqezjwXG7J5p6LzQ3Xj2qA/F9vuz1o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Ses3yiKO; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Ses3yiKO"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785987271; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=w0e7fE5gawtbSIp2pytOUjBhFgpDkQIh9Ss4Lpx8mFs=;
	b=Ses3yiKO7OzFdisch0DQWdIucMBxrotmcxLSsB2ERywN+c3ackkrwtp67uY6l9G6/4dQ50YCYjGjP4HxMi0GR5QQspTvpYZTIJKNtR1gEATaNeenhVZlvZiqCFuK8TdKz4y5g9sUTGbwZEzyGI43BXNhNcLWVywX0j0HY6OsC38=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R621e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X8SlEJY_1785987270;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X8SlEJY_1785987270 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 06 Aug 2026 11:34:31 +0800
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
	kas@kernel.org,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] add anon mTHP collapse test cases
Date: Thu,  6 Aug 2026 11:34:11 +0800
Message-ID: <cover.1785985999.git.baolin.wang@linux.alibaba.com>
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

Changes from v2:
 - Collect reviewed/tested tags from Nico, Zi and Kiryl. Thanks.
 - Change check_huge_anon/shmem/file()'s parameter type to 'size_t'
   and rename to 'len' (per Zi).
 - Use safe type to calculate the order (per Zi).
 - Check return value for read_pmd_pagesize() (per Zi).
 - Add more usage() info to indicate that mthp_khugepaged currently
   only supports anonymous folios (per Zi).
 - Other minor coding style changes (per Zi).

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
 tools/testing/selftests/mm/khugepaged.c       | 197 +++++++++++++----
 tools/testing/selftests/mm/pagemap_ioctl.c    |   2 +-
 .../testing/selftests/mm/prctl_thp_disable.c  |   2 +-
 tools/testing/selftests/mm/run_vmtests.sh     |   2 +
 tools/testing/selftests/mm/soft-dirty.c       |   2 +-
 .../selftests/mm/split_huge_page_test.c       | 139 +-----------
 tools/testing/selftests/mm/uffd-common.c      |   4 +-
 tools/testing/selftests/mm/vm_util.c          | 201 +++++++++++++++++-
 tools/testing/selftests/mm/vm_util.h          |   8 +-
 10 files changed, 367 insertions(+), 192 deletions(-)

-- 
2.47.3


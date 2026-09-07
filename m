Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E83439F9C;
	Mon,  7 Sep 2026 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769179; cv=none; b=riAAB6/R4C2R/dMMbjqSj+qcfT043n3AmQPfqr/TkdRv8StH69LYPI2EUAHoLiNQ6VJ/ieBgeRZFZs2vl0TNz6ANRseJnyoxhN1fb0hqBea0uVzA40bR0bPuw2Cha7JsrxFAeqwV9tD2qlusNvG0U0KExbzRTCs9OHwnkz/bpBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769179; c=relaxed/simple;
	bh=JS+WBqmWmrP2fdC1UeFFZUubf/2Ll0DO5dqgbi/DZMw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mRpSot9TE2KHyKJvMREgYhc10axlIOAENsfM0OJ5UfzbLDyDKztZ2Ov7dryZU8XUtqtDmo0SB8VFS2xrUg/P9BmXTSKe8mms5KmEAepL/tykRfKC9MxkAneEWN8DVgZzdhXaJnpU8rknMMJrrelVDQQeirU4xJTsMgZdjrdU0qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fks87+pQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fks87+pQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79E621477;
	Mon,  7 Sep 2026 01:19:30 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CD693F7D8;
	Mon,  7 Sep 2026 01:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788769174; bh=JS+WBqmWmrP2fdC1UeFFZUubf/2Ll0DO5dqgbi/DZMw=;
	h=From:Subject:Date:To:Cc:From;
	b=fks87+pQ8CUppKO9fEJDQS13VXKNev81oluHPjCSMNr4mO8NGp8ItPK34GYtO0XQ6
	 JeJzBZ9cnbFNsRI0pZs2+mbKZ6nUEAFsfgY2JZNsy77xya6NR819cgJwTtrbTR6NtM
	 Df3xr3hmgmQEaO4mFJrfd04jRc8Y8e4EwWQ00YZw=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v5 0/3] kselftest: mm: fix some failure of
 split_huge_page_test
Date: Mon, 07 Sep 2026 09:19:25 +0100
Message-Id: <20260907-fix_split-v5-0-822b810458bc@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI1znmoC/23MTQ7CIBCG4asY1mKmMLTUlfcwxgCCJbE/gYZom
 t5d2k1r4vKDed6JRBu8jeR8mEiwyUffd3mI44GYRnVPS/0jb8KAlSAZUOff9zi8/EgdYs1raxC
 1JPl+CDZ/rq3rLe/Gx7EPnzWdiuX1XyUVFKjSyMEIaSrjLiq0J9O3ZGkkvndy73h2vEJgTMhSo
 f51uLka2N5hdlI44DUIV+lic/M8fwHuAcm0EAEAAA==
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3502; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=JS+WBqmWmrP2fdC1UeFFZUubf/2Ll0DO5dqgbi/DZMw=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqnnOR4knPYbXph4THLv5aahxcy3nFmOr67YDBu
 Ikk6BgXFYuJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCap5zkQAKCRBt1cPRWsUx
 MxwFC/94h60W5/bgOuiN6T1eWWPcRTmyR8sgt8i3utKJkv9p33t4rzj812FPIhmNEK3/U6AQ84b
 Yuu3t3jsbi+gkNg5Cq+teedoStA9FFwluk5xsCULbr9p/wbyU2WLLTumdYRPtOYSOzBRIcV4wBW
 O8UqZ0qTBagHJ8zIkLkJOLhsejbNw5/GCIJ32g7Rwzm73GQYcMnfpFPmmV35VUok/VBQm9PhuKa
 YBrOU+ulrwhzBHTUPlCWH6p0x/lDXKyA0f9sAH5DL/NQBxpBxquD5NV45F0fdG/10c9W3DVP4ql
 8b/LMfBjJJvmjm4SzuADBuwq/yGC6SE0k2WSJEoEWMGjzSEFUnbRF2ZmYeMsF20kwoDFJ1Q9cgm
 sEyJIJUdpIPVCGkE08iSYZtcbkv48/RrJiJGU7YhRQ9sBfBZ2kTRsSRctDz0/7AXd8+Nrbw1sID
 GsDkOFDnjj7GXtIt2jKAL6xiQwCU3zd15e2p4cMHTSVX8F6JYr8kyrqWJHiCa27pta5YU=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

split_huge_page_test can fail for the following reasons:

  1. During the test, khugepaged may collapse previously split pages again,
     causing intermittent failures.

  2. Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
     glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
     made by memalign(). The underlying VMA may start at a different address
     from the aligned address returned by memalign(). Moreover, a subsequent
     madvise(MADV_HUGEPAGE) call does not split the VMA because it already
     has the same advice.

     This causes the test to fail because the check_huge_xxx() helpers
     incorrectly require the address returned by memalign() to match the
     VMA start address reported in /proc/self/smaps.

Address these issues by applying MADV_NOHUGEPAGE after faulting in the
huge page, preventing khugepaged from collapsing it again, and instead of
relying on /proc/self/smaps, use /proc/self/pagemap and
/proc/kpageflags to detect huge-page mappings and large folios:

  1. If hpage_size == pmd_pagesize, check PAGE_IS_HUGE instead of
     using check_large_folios(), since only the mapping type matters.
     This identifies PMD-mapped huge pages.
  2. Otherwise, use check_large_folios() to detect large folios. This
     covers mTHP cases.
  3. Check the folio flags according to the type of huge page.

Also, current usage of memalign() would result memory area may
unexpectedly merge with an adjacent VMA, causing tests
that inspect it through /proc/self/smaps to fail.

Eliminate this potential source of test flakiness by introducing
alloc_isolated_mem(), which places guard regions before and after the
allocated area to prevent unexpected VMA merging.

This patch based on mm-unstable

---
Changes in v5:
  - rename madv_nohuge() to disable_khugepaged().
  - Link to v4: https://lore.kernel.org/r/20260902-fix_split-v4-0-85f03905f7b1@arm.com

Changes in v4:
  - reparse commit message.
  - introduce alloc_isolated_mem().
  - make madv_nohuge() helper according to suggestion.
  - Link to v3: https://lore.kernel.org/r/20260828-fix_split-v3-0-374022586a4b@arm.com

Changes in v3:
  - change  message in case of failure of madvise() with MADV_NOHUGEPAGE.
  - fix collapse_single_mthp (mthp_khugepaged:anon) test case failure.
  - Link to v2: https://lore.kernel.org/all/20260826-fix_split-v2-0-71153c7f579a@arm.com/

Changes in v2:
  - rebase to mm-unstable.
  - add message in case of failure of madvise() with MADV_NOHUGEPAGE.
  - fix wrong setup expected_huge in check_huge_shmem().
  - Link to v1: https://lore.kernel.org/r/20260820-fix_split-v1-0-ab430c58c7cf@arm.com

---
Yeoreum Yun (3):
      kselftest: mm: prevent random failure of huge page split for khugepaged
      kselftest: mm: replace usage of /proc/self/smaps for check_huge_xxx() helper
      kselftest: mm: introduce alloc_isolated_mem()

 tools/testing/selftests/mm/pagemap_ioctl.c        |  18 +-
 tools/testing/selftests/mm/soft-dirty.c           |   6 +-
 tools/testing/selftests/mm/split_huge_page_test.c |  27 ++-
 tools/testing/selftests/mm/vm_util.c              | 212 ++++++++++++++++------
 tools/testing/selftests/mm/vm_util.h              |   3 +
 5 files changed, 192 insertions(+), 74 deletions(-)
---
base-commit: d118502628f8b673be9023db8bdf878f64a7ed45
change-id: 20260820-fix_split-f44939ec44b8

Best regards,
-- 
Sincerely,
Yeoreum Yun


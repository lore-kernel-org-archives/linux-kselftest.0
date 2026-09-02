Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB142BE03B;
	Wed,  2 Sep 2026 12:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350995; cv=none; b=l7NeuyWcl7nm4PQGFz0SmWr5oQxy+iut9Q8hfZ7DF5t/gZVTJRCMlVbVL2xPtICptFyMnWYVSbESDse8CUwSxu/XtL1SHeAQ5quiJBlmiAj79bNdxP62jPkCumBo+05wi8bwta7NnEg9a+3ZRk5R0tE8cFGo66oNdMUJZ2SM1ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350995; c=relaxed/simple;
	bh=H3oSST3gZCk1h4h7AopyovjoN8fmMhkmuMRHfSSBHWo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W64nH0K3FRg7/q0/xQBiQhcgj2L9FgQDSNg3hKXjGcOHdmuMMO7s2Ektm0gyrX3HcBd+WstyBiuBa5Q2XH4BbL5QO+0HMq/f48aaYOFwwTOgl4sh5lO3rkUfG44vIhmWJv2cm43XwfEQrmhjjU3IeZjKnKwTBb++D1djXeQU2FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SLbBBDWA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SLbBBDWA"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 027E01596;
	Wed,  2 Sep 2026 05:09:43 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B551C3F882;
	Wed,  2 Sep 2026 05:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350986; bh=H3oSST3gZCk1h4h7AopyovjoN8fmMhkmuMRHfSSBHWo=;
	h=From:Subject:Date:To:Cc:From;
	b=SLbBBDWA3EUzbE1WwPeK8x3Gbuqqw9iCHep+fXzd1Nc47a35ZWjhGcYpUbw2pXq8m
	 Y4Jo0bYXcAn/DSPom6iKfacxqpAwIzuYftrw3B8myA1ZXxU8bUPXCyhF4L7ec8gkvM
	 mnSNjeEbT5VdnTBu+aGrT0B5D86hSZLhxmQ/GZkA=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v4 0/3] kselftest: mm: fix some failure of
 split_huge_page_test
Date: Wed, 02 Sep 2026 13:09:34 +0100
Message-Id: <20260902-fix_split-v4-0-85f03905f7b1@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAP4RmGoC/22MQQ6CMBBFr0JmbU1pByisvIcxptQikwglLWk0h
 Ltb2MjC5Zv57y0QrCcboMkW8DZSIDcmwFMGptfj0zJ6JAbBRcmV4Kyj9z1ML5pZh1jL2hrEVkH
 aT96m59663hL3FGbnP3s65tv1XyXmjDPdouSmUKYy3UX74WzcAFsjyqOnjp5MnqyQC1GoUmP78
 9Z1/QLOmZxp2AAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3345; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=H3oSST3gZCk1h4h7AopyovjoN8fmMhkmuMRHfSSBHWo=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmBIFQ9pKXUEX9Pc6r/CDC+Rs2HNX0jTNJYDmF
 /OOdd7TtwyJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgSBQAKCRBt1cPRWsUx
 MywtC/9Bg5o9hWFGdydX9wGNo5n7LsnG4sMQ15fNjJMi0WkDh4TSAGBs/Lxn03+m84dUsLGXR4t
 K7rcO6Ziks4LEm9I5x90GerUHeSr0zT6vGSdAJje2xi6GaZcIqfOs4fehIx9I9kx4UYzqxbYy9P
 QL8KFWv8zaxfPCdkD8ghIOEvgOE8NxgXOJj/U3s2NaEwzsYwMA/MDLzuFrD6NwRonQLxw+25okR
 3yViOKvAI31FQMGBvL9XaG5crS4yVrx/QsiI1EXXkHO8JGK4l2LBrXp1XMGDP6HQkaayklWYVSH
 xKKa8mTETJTz39zQ9TDCHMI9JGc9Co8Cls38xFas2XpUBLbpx4Fu8nCbpct9NEnVH6SYOd6FR/e
 8mMnCGAFGRoBOhGxncsqMUsVRdc5jkRX52Zi34jbi3yO6l5OKKrrZxhKbeZv7uhmW2yFawtfwtg
 0EphkAqcWVA4ptAbxl5CxeKFKYBTALDm/51JKYCOR74i1YmfvPsQIPomH8MB0rGj8F+ac=
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
base-commit: e3b5239afe1b8f0194db7436b17c33e94c1988c4
change-id: 20260820-fix_split-f44939ec44b8

Best regards,
-- 
Sincerely,
Yeoreum Yun


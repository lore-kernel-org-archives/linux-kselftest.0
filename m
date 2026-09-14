Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4502D9EE7;
	Mon, 14 Sep 2026 07:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371021; cv=none; b=Lo7tUGg33JG3PZG0x5uJcysnMVaLFFFMTSTPrDmN7u0PVwBIyl3Hnpp0n6MbuEGSwem8kivLXpeBk0VyjeTzSl4J//fAWMqHmi/j8U4OoUj31+aHtMHAX9lauRm7Fzp++HUTdJGL6cJ64LQOZ6AA6/3FAY27sq9q4n80ebgAs5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371021; c=relaxed/simple;
	bh=LxmCXA3B9Y6uXrZwwE08LbuQHc/4/4X46xSVGb8t8X0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bxmb7lTaPYYv4p9Nv69dpmIDKOTXVuWyLjhhxowQGuaTTWmcrOupZGs0/KyU5eYHjunTT9PCmYVxnGNTWpFduB0hpuMP2Dnz8kV+viKn3jCJwjDQJNXgJ0yBd0sMEW0gjNcLMEP9YRJuy+CM/6/cQt2VSFsiyC6vF3tkQA+MWYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=N3xSMdb+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="N3xSMdb+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA36B143D;
	Mon, 14 Sep 2026 00:30:13 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 812AE3F59E;
	Mon, 14 Sep 2026 00:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789371017; bh=LxmCXA3B9Y6uXrZwwE08LbuQHc/4/4X46xSVGb8t8X0=;
	h=From:Subject:Date:To:Cc:From;
	b=N3xSMdb+3BwjgM2FHnfqYzCWor8DPttq4JP+sdIOSYxMOSnrpWpx8gURJYCQs9MYd
	 026u2o6ZTV10eOJZLUlbdiwdlCu1y+q8CBUSQdzBdUstfr1++zEVsrj6GvBQT8w8cJ
	 8Zm5tb/4k4MWoIAVx1KYapXtQuziVEQ63lXaHu3A=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v6 0/3] kselftest: mm: fix some failure of
 split_huge_page_test
Date: Mon, 14 Sep 2026 08:30:09 +0100
Message-Id: <20260914-fix_split-v6-0-16ed7123800b@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIGip2oC/23MTQ6DIBCG4asY1qUZYVDsqvdomkYoVJL6EzCmj
 fHuRTdi0uUH87wzCcY7E8glm4k3kwuu7+IoThnRTd29DHXPuAkDVoBkQK37PMLwdiO1iBWvjEZ
 UksT7wZv4ubVu97gbF8bef7f0lK+v/ypTToHWCjloIXWp7bX27Vn3LVkbE0+dTB2PjpcIjAlZ1
 KiODndXAUsdRieFBV6BsKXKj06krkydWB1jSuaAQiq9u2VZfj9leNtIAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3902; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=LxmCXA3B9Y6uXrZwwE08LbuQHc/4/4X46xSVGb8t8X0=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqp6KE6oDgS3nL0RCwPvgtF3ebGpW3grQBMtuz8
 /kV3r9amu2JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaqeihAAKCRBt1cPRWsUx
 MwTcDACuCkl+GS9Z6IJhWqt/uoF9a1l8VbBSsChbNS6udnHWgneWZ5DoQLXamd+6WoPxxZijjY4
 faYkEFObwG9Hs9TTusECQ7fYCjpjckMBQq0HJLP1K9LpvV7zGj+AhHH+Ga1xVAaL+qT4rC/eGOc
 Hu9yCPmdeO9VJlcxJZp1reKM0DLvjs9GQTVXduRgnN8KBpdfLqvBEZaFk6sucmCZEZ7AKcszLYf
 wMlmhqsQQV9SMRLb8St+zC7w5aQx+scbmXCZk1+l2Q6FBej91mKEyNxCpbNw99+UTYXJoNQ7Woy
 Nlw/PdQXF2bXB3koHGxnd3ndhPWbMX35X6b8lWjjhtA/F+832UHc3ZnEELUXz1LoBtKdJ5yRUBk
 8XXMmWx9OYEqqUck0mqHHLF86fQ5X5caD/3ZVEx2KjL8t+qXcDWqJjo2LCILUAbABcLFLbcakst
 mdqSaMUzYKcFk5Qe5BU+2bX2c6W1NJbCwkRA0rUHd6Dm2Bf0Go0RJI536LrGfDj73usGg=
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

Since check_huge_shmem() was required to distinguish shmem huge pages
because /proc/self/smaps reports them using a dedicated “ShmemPmdMapped”
entry, as opposed to “FilePmdMapped” for file-backed huge pages.

Now that /proc/self/smaps is no longer used to detect huge pages and
/proc/kpageflags is used instead, it is sufficient to distinguish
 between file-backed and anonymous pages since the ShmemPmdMapped is also
kind of file-backed.

Therefore, remove check_huge_shmem() and use check_huge_file() instead.

This patch based on mm-unstable

---
Changes in v6:
- drop alloc_isolated_mem() patch.
- remove check_huge_shmem().
- Link to v5: https://lore.kernel.org/r/20260907-fix_split-v5-0-822b810458bc@arm.com

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
      kselftest: mm: remove check_huge_shmem()

 tools/testing/selftests/mm/folio_split_race_test.c |   2 +-
 tools/testing/selftests/mm/khugepaged.c            |   5 +-
 tools/testing/selftests/mm/split_huge_page_test.c  |  19 +++
 tools/testing/selftests/mm/uffd-common.c           |   4 +-
 tools/testing/selftests/mm/vm_util.c               | 134 ++++++++++++---------
 tools/testing/selftests/mm/vm_util.h               |   1 -
 6 files changed, 104 insertions(+), 61 deletions(-)
---
base-commit: 6b41451631cabf9ea3b384c2a099088e1598f963
change-id: 20260820-fix_split-f44939ec44b8

Best regards,
-- 
Sincerely,
Yeoreum Yun


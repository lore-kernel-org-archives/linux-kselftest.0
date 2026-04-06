Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9530937DEAF;
	Mon,  6 Apr 2026 14:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485066; cv=none; b=kjTa53+4tKNCdZWhfOMrqftCWsy12EsGoZFzttC3uY528H6lGCm4nqmgarf0Vx6pHHzBZXwd3TvxH4ioTAR4+WLD382Nr66HLkQ11gq7Y1gh2HExGIs7y9VLwGQW+y6fyfuWY78poZihBQbYATiHMcL5/oy3WwBFG+G7DJ1huS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485066; c=relaxed/simple;
	bh=f3EE214/e1gQQHsK7RfKo6QdMs0NKWuR4RlxQkEYydY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yhd1tBo6R0UJ5CsSGPsxSpUvT71cf0oRBHCg4SuBPo7++0H0w93iwzglnsHGxfT0vNRXyNjDYNYrTxXE8py8VT6TOsnjxomcYrVfK6cZwR0d0kDXSVgTReF8b7e2Wy98UeYUG4kLgsROiaj/SZBGGzZBS210imxKBEgGD/IpTqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPZQ5pPO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPZQ5pPO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA80EC4CEF7;
	Mon,  6 Apr 2026 14:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485066;
	bh=f3EE214/e1gQQHsK7RfKo6QdMs0NKWuR4RlxQkEYydY=;
	h=From:To:Cc:Subject:Date:From;
	b=DPZQ5pPO00Ml7jbvZN2UhyduYKtWtOSauEyFeOXYfiz5kkGyXBF8IqCkDw2Gr0nOZ
	 unSn7lwIVyzEaFqTMkqhWWILF/axViN8/z5Ev3of5EhGSVUMltCPgqq/8MmcgEkkOw
	 Ky2lIjgINrPagXHJdsRNAqRonU8MEt715Fyllfa7+9tybxPpiXv/ogWMJGsh6+J7sa
	 NY6ibDZaXrcuQgEHa1MwfWMo9JRfSxvEFwtF2x4/9d+mlTCv0oRV6KzLT/dB1tHmcg
	 8zp2Rpp4ZOddbX4HirZBk3ZK+nTcjFslIp2eAZUbSDs8CCORPzin3Yg9IAqyuNj5w4
	 D2uAE12uGmVXg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 00/53]  selftests/mm: make MM selftests more CI friendly
Date: Mon,  6 Apr 2026 17:16:42 +0300
Message-ID: <20260406141735.2179309-1-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi,

There's a lot of dancing around HugeTLB settings in run_vmtests.sh.
Some test need just a few default huge pages, some require at least 256 MB, and
some just skip lots of tests if huge pages of all supported sizes are not
available.

The goal of this set is to make tests deal with HugeTLB setup and teardown.

There are already convenient helpers that allow easy reading and writing of
/proc and /sysfs, so adding a few APIs that will detect and update HugeTLB
settings shouldn't be a big deal. But these nice helpers use kselftest
framework, and many of HugeTLB (and even THP) test don't, so as a result this
patchset also includes a lot of churn for conversion of those tests to
kselftest framework (patches 7-19).

And there were a few small things I fixed on the way.

I don't mean for this set to land in 7.1-rc1, except perhaps the small fixes in
the beginning of the series (patches 1-4).

But after staring at this code for some time I realized that I won't spot any
new issues in these patches and an extra pair(s) of eyes would be helpful.

The extension of thp_settings to hugepage_settings that also include HugeTLB
helpers is implemented by patches 20-26.

Patches 27-28 are there to allow setting up SHM limits in hugetlb-shm and
thuge-gen tests.

Patches 29-51 integrate the new APIs in all the tests that use HugeTLB.

And at last patches 52-53 drop HugeTLB setup from run_vmtests.sh

Happy Easter to those who celebrate!

Mike Rapoport (Microsoft) (53):
  selftests/mm: hugetlb-read-hwpoison: add SIGBUS handler
  selftests/mm: khugepaged: enable collapse_single_pte_entry_compound for shmem
  selftests/mm: migration: don't assume hupe page is TWOMEG
  selftests/mm: run_vmtests.sh: don't gate THP and KSM tests on HAVE_HUGEPAGES
  selftests/mm: merge map_hugetlb into hugepage-mmap
  selftests/mm: rename hugepage-* tests to hugetlb-*
  selftests/mm: hugetlb-shm: use kselftest framework
  selftests/mm: hugetlb-vmemmap: use kselftest framework
  selftests/mm: hugetlb-madvise: use kselftest framework
  selftests/mm: hugetlb_madv_vs_map: use kselftest framework
  selftests/mm: hugetlb-read-hwpoison: use kselftest framework
  selftests/mm: khugepaged: group tests in an array
  selftests/mm: khugepaged: use ksefltest framework
  selftests/mm: ksm_tests: use kselftest framework
  selftests/mm: protection_keys: use descriptive test names in TAP output
  selftests/mm: protection_keys: use kselftest framework
  selftests/mm: uffd-stress: use kselftest framework
  selftests/mm: uffd-unit-tests: use kselftest framework
  selftests/mm: va_high_addr_switch: use kselftest framework
  selftests/mm: add atexit() and signal handlers to thp_settings
  selftests/mm: rename thp_settings.[ch] to  hugepage_settings.[ch]
  selftests/mm: move HugeTLB helpers to hugepage_settings
  selftests/mm: hugepage_settings: use unsigned long in detect_hugetlb_page_size
  selftests/mm: hugepage_settings: add APIs to get and set nr_hugepages
  selftests/mm: hugepage_settings: rename get_free_hugepages()
  selftests/mm: hugepage_settings: add APIs for HugeTLB setup and teardown
  selftests/mm: move read_file(), read_num() and write_num() to vm_util
  selftests/mm: vm_util: add helpers to set and restore shm limits
  selftests/mm: compaction_test: use HugeTLB helpers ...
  selftests/mm: cow: add setup of HugeTLB pages
  selftests/mm: gup_longterm: add setup of HugeTLB pages
  selftests/mm: gup_test: add setup of HugeTLB pages
  selftests/mm: hmm-tests: add setup of HugeTLB pages
  selftests/mm: hugepage_dio: add setup of HugeTLB pages
  selftests/mm: hugetlb_fault_after_madv: add setup of HugeTLB pages
  selftests/mm: hugetlb-madvise: add setup of HugeTLB pages
  selftests/mm: hugetlb_madv_vs_map: add setup of HugeTLB pages
  selftests/mm: hugetlb-mmap: add setup of HugeTLB pages
  selftests/mm: hugetlb-mremap: add setup of HugeTLB pages
  selftests/mm: hugetlb-shm: add setup of HugeTLB pages
  selftests/mm: hugetlb-soft-online: add setup of HugeTLB pages
  selftests/mm: hugetlb-vmemmap: add setup of HugeTLB pages
  selftests/mm: migration: add setup of HugeTLB pages
  selftests/mm: pagemap_ioctl: add setup of HugeTLB pages
  selftests/mm: protection_keys: use library code for HugeTLB setup
  selftests/mm: thuge-gen: add setup of HugeTLB pages
  selftests/mm: uffd-stress: use hugetlb_save and alloc huge pages
  selftests/mm: uffd-unit-tests: add setup of HugeTLB pages
  selftests/mm: uffd-wp-mremap: add setup of HugeTLB pages
  selftests/mm: va_high_addr_switch: add setup of HugeTLB pages
  selftests/mm: va_high_addr_switch.sh: drop huge pages setup
  selftests/mm: run_vmtests.sh: free memory if available memory is low
  selftests/mm: run_vmtests.sh: drop detection and setup of HugeTLB

 tools/testing/selftests/mm/.gitignore         |   4 +
 tools/testing/selftests/mm/Makefile           |  13 +-
 tools/testing/selftests/mm/compaction_test.c  | 113 +----
 tools/testing/selftests/mm/cow.c              |  29 +-
 .../selftests/mm/folio_split_race_test.c      |   2 +-
 tools/testing/selftests/mm/guard-regions.c    |   2 +-
 tools/testing/selftests/mm/gup_longterm.c     |   3 +-
 tools/testing/selftests/mm/gup_test.c         |  12 +
 tools/testing/selftests/mm/hmm-tests.c        |  24 +-
 tools/testing/selftests/mm/hugepage-mmap.c    |  78 ----
 .../{thp_settings.c => hugepage_settings.c}   | 284 +++++++++++--
 .../{thp_settings.h => hugepage_settings.h}   |  75 +++-
 tools/testing/selftests/mm/hugetlb-madvise.c  | 209 ++++------
 tools/testing/selftests/mm/hugetlb-mmap.c     | 141 +++++++
 .../{hugepage-mremap.c => hugetlb-mremap.c}   |  13 +-
 .../selftests/mm/hugetlb-read-hwpoison.c      | 123 +++---
 .../mm/{hugepage-shm.c => hugetlb-shm.c}      |  65 ++-
 .../selftests/mm/hugetlb-soft-offline.c       |  45 +-
 .../{hugepage-vmemmap.c => hugetlb-vmemmap.c} |  46 +-
 tools/testing/selftests/mm/hugetlb_dio.c      |  15 +-
 .../selftests/mm/hugetlb_fault_after_madv.c   |   7 +-
 .../selftests/mm/hugetlb_madv_vs_map.c        |  22 +-
 tools/testing/selftests/mm/khugepaged.c       | 394 ++++++++----------
 tools/testing/selftests/mm/ksm_tests.c        | 182 ++++----
 tools/testing/selftests/mm/map_hugetlb.c      |  88 ----
 tools/testing/selftests/mm/migration.c        |  54 ++-
 tools/testing/selftests/mm/pagemap_ioctl.c    |  13 +-
 tools/testing/selftests/mm/pkey-helpers.h     |   6 +-
 .../testing/selftests/mm/prctl_thp_disable.c  |   2 +-
 tools/testing/selftests/mm/protection_keys.c  | 131 +++---
 tools/testing/selftests/mm/run_vmtests.sh     | 177 ++------
 tools/testing/selftests/mm/soft-dirty.c       |   2 +-
 .../selftests/mm/split_huge_page_test.c       |   2 +-
 tools/testing/selftests/mm/thuge-gen.c        |  80 +---
 tools/testing/selftests/mm/transhuge-stress.c |   2 +-
 tools/testing/selftests/mm/uffd-common.h      |   1 +
 tools/testing/selftests/mm/uffd-stress.c      |  44 +-
 tools/testing/selftests/mm/uffd-unit-tests.c  | 110 +++--
 tools/testing/selftests/mm/uffd-wp-mremap.c   |  12 +-
 .../selftests/mm/va_high_addr_switch.c        |  40 +-
 .../selftests/mm/va_high_addr_switch.sh       |  39 +-
 tools/testing/selftests/mm/vm_util.c          | 133 +++---
 tools/testing/selftests/mm/vm_util.h          |  15 +-
 43 files changed, 1377 insertions(+), 1475 deletions(-)
 delete mode 100644 tools/testing/selftests/mm/hugepage-mmap.c
 rename tools/testing/selftests/mm/{thp_settings.c => hugepage_settings.c} (60%)
 rename tools/testing/selftests/mm/{thp_settings.h => hugepage_settings.h} (55%)
 create mode 100644 tools/testing/selftests/mm/hugetlb-mmap.c
 rename tools/testing/selftests/mm/{hugepage-mremap.c => hugetlb-mremap.c} (94%)
 rename tools/testing/selftests/mm/{hugepage-shm.c => hugetlb-shm.c} (56%)
 rename tools/testing/selftests/mm/{hugepage-vmemmap.c => hugetlb-vmemmap.c} (76%)
 delete mode 100644 tools/testing/selftests/mm/map_hugetlb.c


base-commit: 9a5c21a0791faf7967feea87f8f345419330bd2f
--
2.53.0

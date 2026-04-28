Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2611397;
	Tue, 28 Apr 2026 20:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408971; cv=none; b=FJIdFMOHiv8cX7xXbI5bJ5RO8yGEwxKdMPaw+jBO2lwQKutjDaGo/IpR6mZD3EKlehYQ73IZJsdl05ZdmZEa7JCShUJo7VCZNfm2Ahs0w8IzzBD9Ug9SbjzZeDg1swpblRsEIzY0QYWx0fVdVX8svN24Co9lUkWXchpK67srnCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408971; c=relaxed/simple;
	bh=InHJJsNDXhcLEmF2wKCCqojIV89V59WutBjl+yrAS8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JvcjnBc91YcOOondXqzAgLwYYTOdNCaxS6uSI1m0KTOV19WDVpdQvnvwx0ye0LSWjs5aa2GhK7aMvvNLxwpAHXoAzN29pbiS8dRG/jVuQk8EUavdvTrCvJWcweaVv7N93kY1KvTVXsxeiWcfHRACXWlyhJShUyD94URyNcYEBwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AxxsxWOC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AxxsxWOC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223A0C2BCAF;
	Tue, 28 Apr 2026 20:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777408971;
	bh=InHJJsNDXhcLEmF2wKCCqojIV89V59WutBjl+yrAS8s=;
	h=From:To:Cc:Subject:Date:From;
	b=AxxsxWOCidFnfVWYn2nEl7uZIMMOmhH6edN0If5hl2lPPRXn6DsBHYlzOm5IM7IuN
	 j6fSxQ+V/Aw0hTLjR7kFjFQYn8kdvoMIkOVBUjX8eBh59BSOaywNwq+9z1vWxXia7c
	 A2KnSKmsUze5yPa/ZRKu1Cb3YKszNw5jJp+RTaKsvRWLohP100MVlqetu8Ca6Q0hIW
	 8MHWX797lpaUUW/ffnyWFyT9OBHcWzRxDvNmYOF6lgp9XRq64OP3imQlZVhT/sovHZ
	 GSNzw5Er3ktrgcmg4rVtX86RxHya6lDNYbhgw2iqQ0vS1CXK71Xk5w/FBDokgcqxgg
	 HQ0QU2Smuf0sA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Luiz Capitulino <luizcap@redhat.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v3 00/54] make MM selftests more CI friendly
Date: Tue, 28 Apr 2026 23:41:46 +0300
Message-ID: <20260428204240.1924129-1-rppt@kernel.org>
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

The series break out:
patches 1-5:   small fixes
patch 6:       merge of hugetlb mmap tests
patch 7:       renaming of hugepage-* to hugetlb-*
patches 8-20:  mechanical conversion to kselftest framework
patches 21-27: extension of thp_settings to hugepage_settings to also include
               HugeTLB helpers
patches 28-29: add helpers for setting up SHM limits in hugetlb-shm and
               thuge-gen tests
patches 30-52: integrate the new APIs in all the tests that use HugeTLB
patches 53-54: drop HugeTLB setup from run_vmtests.sh

v3 changes:
* add patches that fix cleanup of fork()ed processes in migration test
* drop MADV_REMOVE changes to khugepage test
* properly setup memfd for non-default hugepages in hugetlb-mmap test
* add forgotten hugetlb_save_settings() to hugetlb_setup()
* fixes for ksft reporting
* rebase on v7.1-rc1
* add more tags, thanks everyone!

v2: https://lore.kernel.org/all/20260418105539.1261536-1-rppt@kernel.org
* fix hugetlb mmap tests to actually test file mappings
* increase maximal tests number in khugepaged
* add tags, thanks everyone!

v1: https://lore.kernel.org/all/20260406141735.2179309-1-rppt@kernel.org

Mike Rapoport (Microsoft) (54):
  selftests/mm: hugetlb-read-hwpoison: add SIGBUS handler
  selftests/mm: migration: don't assume hupe page is TWOMEG
  selftests/mm: migration: make nthreads represent number of working threads
  selftests/mm: migration: properly cleanup fork()ed processes
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
  selftests/mm: rename thp_settings.[ch] to hugepage_settings.[ch]
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
 tools/testing/selftests/mm/compaction_test.c  | 113 +-----
 tools/testing/selftests/mm/cow.c              |  29 +-
 .../selftests/mm/folio_split_race_test.c      |   2 +-
 tools/testing/selftests/mm/guard-regions.c    |   2 +-
 tools/testing/selftests/mm/gup_longterm.c     |   3 +-
 tools/testing/selftests/mm/gup_test.c         |  12 +
 tools/testing/selftests/mm/hmm-tests.c        |  24 +-
 tools/testing/selftests/mm/hugepage-mmap.c    |  78 ----
 .../{thp_settings.c => hugepage_settings.c}   | 286 +++++++++++--
 .../{thp_settings.h => hugepage_settings.h}   |  75 +++-
 tools/testing/selftests/mm/hugetlb-madvise.c  | 209 ++++------
 tools/testing/selftests/mm/hugetlb-mmap.c     | 145 +++++++
 .../{hugepage-mremap.c => hugetlb-mremap.c}   |  13 +-
 .../selftests/mm/hugetlb-read-hwpoison.c      | 123 +++---
 .../mm/{hugepage-shm.c => hugetlb-shm.c}      |  64 +--
 .../selftests/mm/hugetlb-soft-offline.c       |  45 +--
 .../{hugepage-vmemmap.c => hugetlb-vmemmap.c} |  46 +--
 tools/testing/selftests/mm/hugetlb_dio.c      |  15 +-
 .../selftests/mm/hugetlb_fault_after_madv.c   |   7 +-
 .../selftests/mm/hugetlb_madv_vs_map.c        |  22 +-
 tools/testing/selftests/mm/khugepaged.c       | 380 ++++++++----------
 tools/testing/selftests/mm/ksm_tests.c        | 182 ++++-----
 tools/testing/selftests/mm/map_hugetlb.c      |  88 ----
 tools/testing/selftests/mm/migration.c        | 152 ++++---
 tools/testing/selftests/mm/pagemap_ioctl.c    |  13 +-
 tools/testing/selftests/mm/pkey-helpers.h     |   6 +-
 .../testing/selftests/mm/prctl_thp_disable.c  |   2 +-
 tools/testing/selftests/mm/protection_keys.c  | 130 +++---
 tools/testing/selftests/mm/run_vmtests.sh     | 177 ++------
 tools/testing/selftests/mm/soft-dirty.c       |   2 +-
 .../selftests/mm/split_huge_page_test.c       |   2 +-
 tools/testing/selftests/mm/thuge-gen.c        |  80 +---
 tools/testing/selftests/mm/transhuge-stress.c |   2 +-
 tools/testing/selftests/mm/uffd-common.h      |   1 +
 tools/testing/selftests/mm/uffd-stress.c      |  44 +-
 tools/testing/selftests/mm/uffd-unit-tests.c  | 110 +++--
 tools/testing/selftests/mm/uffd-wp-mremap.c   |  12 +-
 .../selftests/mm/va_high_addr_switch.c        |  42 +-
 .../selftests/mm/va_high_addr_switch.sh       |  41 +-
 tools/testing/selftests/mm/vm_util.c          | 133 +++---
 tools/testing/selftests/mm/vm_util.h          |  15 +-
 43 files changed, 1424 insertions(+), 1520 deletions(-)
 delete mode 100644 tools/testing/selftests/mm/hugepage-mmap.c
 rename tools/testing/selftests/mm/{thp_settings.c => hugepage_settings.c} (60%)
 rename tools/testing/selftests/mm/{thp_settings.h => hugepage_settings.h} (55%)
 create mode 100644 tools/testing/selftests/mm/hugetlb-mmap.c
 rename tools/testing/selftests/mm/{hugepage-mremap.c => hugetlb-mremap.c} (94%)
 rename tools/testing/selftests/mm/{hugepage-shm.c => hugetlb-shm.c} (57%)
 rename tools/testing/selftests/mm/{hugepage-vmemmap.c => hugetlb-vmemmap.c} (76%)
 delete mode 100644 tools/testing/selftests/mm/map_hugetlb.c


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
--
2.53.0

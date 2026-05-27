Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D4341C2E1;
	Wed, 27 May 2026 14:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779891896; cv=none; b=OA4Lgf3Yaz7P17j3ooXzFaXwkOgOT8jLBbiMp5oiKzfDv+zhsU7fyg0BEw7/xEeu3ZhEcGK9NehOOlZTy5iPG4gr6Sw8wMbAuRAo/BkCMm2D+J2VA8KJAqhUlG6m6wUQYGe0Kf8hJ4zMW40dEpJhyPgC71KHnViJdyAsnhLtK8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779891896; c=relaxed/simple;
	bh=FoWVMWTOeZH0xBTQybA80G/O70bbICDvl9tgYaqI0Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RnQHMlNkajvv7DeJNwR0Ymb+P6vdAqC7gzZ6SKXrAQcFxtWK7D6+b0tNtutC90l38dwrVoC+RRAR6pjOo07sJ4x/UFF/Pwpo7BjwBV95ISYCrcVUqOfI8A7IX1LQtKUfy4zNU5Nkb6+kZ1YaaGMFzyKHgWSsFcJ5KJcZMuHMm+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KDzV7d+Z; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KDzV7d+Z"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F100027B5;
	Wed, 27 May 2026 07:24:45 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B84F3F905;
	Wed, 27 May 2026 07:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779891891; bh=FoWVMWTOeZH0xBTQybA80G/O70bbICDvl9tgYaqI0Mo=;
	h=From:To:Cc:Subject:Date:From;
	b=KDzV7d+ZQhjtC6yhLxjb8DAHu6cS/1N2fcYy1yfqqJo19/o1xmRf+NIs2PZXrrx7i
	 2vbFDWE28j6EOU8iszj7v8NwWoqRH50EiHmX5wjD5svsDlS9y6RlYGcod56/muKLlh
	 TVIueD6LlTBcKoGGhyr+UXVG/GzZ+ptnzxkXXD04=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Leon Romanovsky <leon@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v4 0/5] selftests/mm: separate GUP microbenchmarking from functional testing
Date: Wed, 27 May 2026 19:54:27 +0530
Message-ID: <20260527142432.230127-1-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gup_test.c currently serves two distinct purposes: microbenchmarking
(GUP_FAST_BENCHMARK, PIN_FAST_BENCHMARK, PIN_LONGTERM_BENCHMARK) and
functional correctness testing (GUP_BASIC_TEST, PIN_BASIC_TEST,
DUMP_USER_PAGES_TEST). Mixing these in a single binary means functional
tests cannot be run or reported individually and run_vmtests.sh must
invoke the binary multiple times with different flag combinations to
cover all configurations.

This patch series separates the two concerns: tools/mm/gup_bench for
benchmarking and tools/testing/selftests/mm/gup_test for functional
testing. To avoid duplicating HugeTLB and related file helpers, the
series first prepares the existing file helpers for sharing, then moves
the common helper code to tools/lib/mm/ so it can be shared by both
selftests and tools/mm.

Patch 1 makes read_file(), write_file(), read_num() and write_num() in
vm_util.c return errors to callers instead of exiting internally. Existing
mm selftest callers are updated to report failures through kselftest
helpers. This avoids carrying selftest-specific process-exit behaviour
into the shared helper implementation moved in the next patch.

Patch 2 adds tools/lib/mm/file_utils.[ch], moving read_file(),
write_file(), read_num() and write_num() out of vm_util.c into a shared
helper without a kselftest dependency. It keeps the helpers exposed to mm
selftests through vm_util.h and adds tools/lib/mm/ to the MEMORY
MANAGEMENT - MISC entry in MAINTAINERS.

Patch 3 moves hugepage_settings.[ch] from selftests/mm to tools/lib/mm/.
It keeps the helper visible to selftests through vm_util.h where
possible, uses direct <mm/hugepage_settings.h> includes for users that do
not include vm_util.h, and removes the remaining kselftest dependency
from the implementation. The existing HugeTLB diagnostic messages are
preserved as TAP-comment-style fprintf(stderr, ...) diagnostics. The
explicit x86 protection_keys 32-bit and 64-bit build rules are also
updated to preserve prerequisite paths after the source move.

Patch 4 adds tools/mm/gup_bench.c, a standalone microbenchmark for
GUP_FAST, PIN_FAST and PIN_LONGTERM via the CONFIG_GUP_TEST debugfs
interface. It runs the same matrix of configurations as the old
run_gup_matrix() shell function (all three commands, read/write,
private/shared, four page counts, THP on/off, hugetlb), but as a
standalone C program under tools/mm using the shared tools/lib/mm
helpers. It also restores HugeTLB settings after each hugetlb benchmark
run and validates numeric command-line arguments instead of relying on
atoi().

Patch 5 rewrites gup_test.c as a kselftest harness-based selftest. It
covers all five GUP kernel functions (get_user_pages, get_user_pages_fast,
pin_user_pages, pin_user_pages_fast, pin_user_pages with FOLL_LONGTERM)
plus DUMP_USER_PAGES_TEST, across 12 mapping configurations (THP on,
THP off and hugetlb, each across private/shared and read/write variants)
and four batch sizes (1, 512, 123, all pages). It also preserves the old
sparse dump coverage for pages 0, 19 and 0x1000. Results are reported as
standard TAP output with no command-line arguments required.

---
These patches apply on top of mm/mm-new.

Changes in v4:
- Address review feedback from Mike and Sashiko
- Add a preparatory patch so shared file helpers return errors instead of exiting
- Reduce include churn by keeping shared helpers exposed through vm_util.h
- Preserve HugeTLB diagnostics and restore HugeTLB state more carefully
- Fix selftests/mm build details after moving helpers to tools/lib/mm
- Tighten gup_bench argument handling and gup_test setup/sparse-dump coverage

Changes in v3:
- Address v2 feedback from Sashiko
- Add shared file_utils helpers under tools/lib/mm
- Move hugepage_settings out of selftests and into tools/lib/mm
- Convert gup_bench to use the shared tools/lib/mm helpers
- Guard against invalid thread counts in gup_bench
- Handle thread-array allocation failure cleanly in gup_bench
- Restore hugetlb settings on setup failure in gup_test
- Add sparse DUMP_USER_PAGES_TEST coverage for pages 0, 19 and 0x1000 in gup_test

Changes in v2:
- Address v1 feedback from Sashiko
- Add fast and longterm GUP/PUP coverage
- Sweep nr_pages_per_call over 1, 512, 123 and all pages
- Call madvise(MADV_NOHUGEPAGE) in non-THP variants
- Use 256 MB for hugetlb fixtures
- Use hugetlb_restore_settings() in FIXTURE_TEARDOWN instead of atexit()
- Add TH_LOG to report nr_pages_per_call for each iteration
- Update Documentation/core-api/pin_user_pages.rst unit testing section

Previous versions:
v3: https://lore.kernel.org/all/20260521111801.173019-1-sarthak.sharma@arm.com/
v2: https://lore.kernel.org/all/20260519120506.184512-1-sarthak.sharma@arm.com/
v1: https://lore.kernel.org/all/20260515084840.174652-1-sarthak.sharma@arm.com/

---
Sarthak Sharma (5):
  selftests/mm: make file helpers return errors
  tools/lib/mm: add shared file helpers
  tools/lib/mm: move hugepage_settings out of selftests
  tools/mm: add a standalone GUP microbenchmark
  selftests/mm: rewrite gup_test as a standalone harness-based selftest

 Documentation/core-api/pin_user_pages.rst     |  12 +-
 MAINTAINERS                                   |   2 +
 tools/lib/mm/file_utils.c                     |  82 +++
 tools/lib/mm/file_utils.h                     |  12 +
 .../selftests => lib}/mm/hugepage_settings.c  | 103 ++-
 .../selftests => lib}/mm/hugepage_settings.h  |   0
 tools/mm/.gitignore                           |   2 +
 tools/mm/Makefile                             |  10 +-
 tools/mm/gup_bench.c                          | 433 +++++++++++++
 tools/testing/selftests/mm/Makefile           |  12 +-
 tools/testing/selftests/mm/compaction_test.c  |   2 +-
 tools/testing/selftests/mm/cow.c              |   1 -
 .../selftests/mm/folio_split_race_test.c      |   1 -
 tools/testing/selftests/mm/guard-regions.c    |   1 -
 tools/testing/selftests/mm/gup_longterm.c     |   1 -
 tools/testing/selftests/mm/gup_test.c         | 606 +++++++++++-------
 tools/testing/selftests/mm/hmm-tests.c        |   6 +-
 tools/testing/selftests/mm/hugetlb-madvise.c  |   1 -
 tools/testing/selftests/mm/hugetlb-mmap.c     |   1 -
 tools/testing/selftests/mm/hugetlb-mremap.c   |   1 -
 tools/testing/selftests/mm/hugetlb-shm.c      |   1 -
 .../selftests/mm/hugetlb-soft-offline.c       |   2 +-
 tools/testing/selftests/mm/hugetlb-vmemmap.c  |   1 -
 tools/testing/selftests/mm/hugetlb_dio.c      |   1 -
 .../selftests/mm/hugetlb_fault_after_madv.c   |   1 -
 .../selftests/mm/hugetlb_madv_vs_map.c        |   1 -
 tools/testing/selftests/mm/khugepaged.c       |  14 +-
 tools/testing/selftests/mm/ksm_tests.c        |   1 -
 tools/testing/selftests/mm/migration.c        |   5 +-
 tools/testing/selftests/mm/pagemap_ioctl.c    |   1 -
 .../testing/selftests/mm/prctl_thp_disable.c  |   1 -
 tools/testing/selftests/mm/protection_keys.c  |   2 +-
 tools/testing/selftests/mm/run_vmtests.sh     |  37 +-
 tools/testing/selftests/mm/soft-dirty.c       |   1 -
 .../selftests/mm/split_huge_page_test.c       |   6 +-
 tools/testing/selftests/mm/thuge-gen.c        |   1 -
 tools/testing/selftests/mm/transhuge-stress.c |   1 -
 tools/testing/selftests/mm/uffd-common.h      |   1 -
 tools/testing/selftests/mm/uffd-wp-mremap.c   |   2 +-
 .../selftests/mm/va_high_addr_switch.c        |   1 -
 tools/testing/selftests/mm/vm_util.c          |  82 +--
 tools/testing/selftests/mm/vm_util.h          |   7 +-
 42 files changed, 1067 insertions(+), 392 deletions(-)
 create mode 100644 tools/lib/mm/file_utils.c
 create mode 100644 tools/lib/mm/file_utils.h
 rename tools/{testing/selftests => lib}/mm/hugepage_settings.c (89%)
 rename tools/{testing/selftests => lib}/mm/hugepage_settings.h (100%)
 create mode 100644 tools/mm/gup_bench.c


base-commit: da0a06486ac3ce47c6ffb603d2fd332229d41592
--
2.39.5


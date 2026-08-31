Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE2826ED33;
	Mon, 31 Aug 2026 04:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788150084; cv=none; b=JQ5PgprWEjyc+NUZIaHhr5NzKtjEy5kW7xbl8plbJ8Z2AvIMctDapOE9RGiaHYWZ87rchtmc/09H9yu7RqHTdX++/F/NdkCsGHTQU2hC9yxd4olJ+en3AEw4MOw4TF8kJA+xzBK1DdNDKDzJYw8qt+W4CoryOioeIp/aXAGB2y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788150084; c=relaxed/simple;
	bh=n7qnW/vv3h18XKnYg+MsL4aCV+MeJB4dCNZjbHcjixY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r4xyHk+wVZbId1EWbp2ilQnQUZvwhXpfYRX2O8S6txGiTev76lIxSO/WbuUniz6kT7mbjYy3Zpi/hmShX2QfXmsOFuGv4NF5lRGw3pb5b5sjvoPDLKupEuEgtnuiYECKkH3ZltCcaFktzMKkhyP8xjJOCS6DxkiAjVvO5DX7wq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YKnzM9BU; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YKnzM9BU"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99B7214BF;
	Sun, 30 Aug 2026 21:21:15 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B62983F8C6;
	Sun, 30 Aug 2026 21:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788150079; bh=n7qnW/vv3h18XKnYg+MsL4aCV+MeJB4dCNZjbHcjixY=;
	h=From:To:Cc:Subject:Date:From;
	b=YKnzM9BUa7CDGvY3ugQPf3qhYeFTChpE0aTXVuEtJHkhrucugqTPogqI3RjbXbcUD
	 QLQa0GDqRaxiSUpPrSsPToxJPevSIqhFRt3kI/QmjzeFpDCx2xVQQSZ8DPYvCTjWfT
	 ddUzoixD0hDxo5JmVBxJbfd8KIdSnJc+/kNtFl6c=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Leon Romanovsky <leon@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v8 0/6] selftests/mm: separate GUP microbenchmarking from functional testing
Date: Mon, 31 Aug 2026 09:50:55 +0530
Message-ID: <20260831042101.18085-1-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gup_test.c currently serves two separate purposes: benchmarking
(GUP_FAST_BENCHMARK, PIN_FAST_BENCHMARK and PIN_LONGTERM_BENCHMARK) and
functional testing (GUP_BASIC_TEST, PIN_BASIC_TEST and
DUMP_USER_PAGES_TEST). Keeping both in one program makes the functional
tests harder to run and report individually, while run_vmtests.sh has to
invoke the program repeatedly with different options.

Separate these roles into tools/mm/gup_bench for benchmarking and
tools/testing/selftests/mm/gup for functional testing. Move the shared
file and hugepage helpers to tools/lib/mm/ so both programs can use them
without duplicating the implementation.

Patch 1 makes read_file(), write_file(), read_num(), write_num() and
write_num_ignore_einval() return errors to their callers instead of
exiting. It also makes read_num() reject negative and malformed values
and updates the existing callers to handle failures.

Patch 2 moves these file helpers from vm_util.c to tools/lib/mm/. It keeps
them available to the mm selftests through vm_util.h and adjusts the
selftests build accordingly.

Patch 3 moves hugepage_settings.[ch] from selftests/mm to tools/lib/mm/.
It also removes its kselftest dependency while preserving TAP-compatible
diagnostics for selftest users.

Patch 4 moves the existing gup_test implementation from selftests/mm to
tools/mm as gup_bench. This keeps the code movement separate from the
subsequent changes and makes it easier to review.

Patch 5 removes the functional test modes and kselftest dependency from
gup_bench. When run without arguments, it performs one GUP_FAST benchmark
using the existing defaults instead of running the whole matrix. Other
benchmark configurations can be selected through command-line options.

Patch 6 adds a new harness-based GUP selftest. It covers THP, non-THP and
HugeTLB mappings across private/shared and read/write variants. For each
variant, it tests get_user_pages(), get_user_pages_fast(),
pin_user_pages(), pin_user_pages_fast() and long-term pinning modes
using four batch sizes. The HugeTLB variants share a one-time
setup of 128 default-sized huge pages.

Changes in v8:
- Add a comment to clarify read_num() input validation
- Remove duplicate exit code in gup_bench
- Drop DUMP_USER_PAGES_TEST coverage from gup
- Update Documentation and Kconfig

Changes in v7:
- Rebase onto mm-unstable
- Address feedback from Mike and Sashiko
- Make read_file() return 0 on success and tighten read_num() parsing
- Move write_num_ignore_einval() with the shared file helpers
- Keep the existing gup_bench argument parsing and avoid unrelated checks
- Set up 128 HugeTLB pages once for all HugeTLB selftest variants

Changes in v6:
- Rebase onto v7.2-rc5
- Address feedback from David, Mark, John, Dev and Sashiko
- Keep the shared file helpers silent and let callers report errors
- Move the existing gup_test into tools/mm before changing its behaviour
- Report ioctl failures from gup_bench worker threads
- Remove the default benchmark matrix and run one default benchmark instead
- Add the new harness-based functional selftest in a separate final patch
- Drop the unrelated thp_swap_allocator_test .gitignore change

Changes in v5:
- Rebase onto v7.2-rc3
- Address feedback from Mike, John, Dev and Sashiko
- Make file helper diagnostics TAP-compatible
- Validate read_num() input and propagate errors while restoring shared
  memory limits
- Preserve build bisectability for the x86 protection_keys test
- Preserve HugeTLB diagnostics using TAP-compatible printf() output
- Validate the remaining numeric arguments accepted by gup_bench

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
- Restore HugeTLB settings on setup failure in gup_test
- Add sparse DUMP_USER_PAGES_TEST coverage for pages 0, 19 and 0x1000

Changes in v2:
- Address v1 feedback from Sashiko
- Add fast and long-term GUP/PUP coverage
- Sweep nr_pages_per_call over 1, 512, 123 and all pages
- Call madvise(MADV_NOHUGEPAGE) in non-THP variants
- Use 256 MB for HugeTLB fixtures
- Restore HugeTLB settings from fixture teardown
- Report nr_pages_per_call for each iteration
- Update the pin_user_pages unit-testing documentation

Previous versions:
v7: lore.kernel.org/all/20260813181230.483746-1-sarthak.sharma@arm.com/
v6: lore.kernel.org/all/20260730140825.238130-1-sarthak.sharma@arm.com/
v5: lore.kernel.org/all/20260716123226.197736-1-sarthak.sharma@arm.com/
v4: lore.kernel.org/all/20260527142432.230127-1-sarthak.sharma@arm.com/
v3: lore.kernel.org/all/20260521111801.173019-1-sarthak.sharma@arm.com/
v2: lore.kernel.org/all/20260519120506.184512-1-sarthak.sharma@arm.com/
v1: lore.kernel.org/all/20260515084840.174652-1-sarthak.sharma@arm.com/

---
Sarthak Sharma (6):
  selftests/mm: make file helpers return errors
  tools/lib/mm: add shared file helpers
  tools/lib/mm: move hugepage_settings out of selftests
  tools/mm: move gup_test from selftests/mm to tools/mm
  tools/mm: make gup_bench a benchmark only tool
  selftests/mm: add a GUP selftest

 Documentation/core-api/pin_user_pages.rst     |   9 -
 MAINTAINERS                                   |   4 +-
 mm/Kconfig                                    |  21 +-
 tools/lib/mm/file_utils.c                     | 106 +++++++
 tools/lib/mm/file_utils.h                     |  13 +
 .../selftests => lib}/mm/hugepage_settings.c  | 109 +++++--
 .../selftests => lib}/mm/hugepage_settings.h  |   0
 tools/mm/.gitignore                           |   1 +
 tools/mm/Makefile                             |  11 +-
 .../mm/gup_test.c => mm/gup_bench.c}          | 191 ++++++------
 tools/testing/selftests/mm/Makefile           |  15 +-
 tools/testing/selftests/mm/compaction_test.c  |   2 +-
 tools/testing/selftests/mm/cow.c              |   1 -
 .../selftests/mm/folio_split_race_test.c      |   1 -
 tools/testing/selftests/mm/guard-regions.c    |   1 -
 tools/testing/selftests/mm/gup.c              | 277 ++++++++++++++++++
 tools/testing/selftests/mm/gup_longterm.c     |   1 -
 tools/testing/selftests/mm/hmm-tests.c        |   6 +-
 tools/testing/selftests/mm/hugetlb-madvise.c  |   1 -
 tools/testing/selftests/mm/hugetlb-mmap.c     |   1 -
 tools/testing/selftests/mm/hugetlb-mremap.c   |   1 -
 tools/testing/selftests/mm/hugetlb-shm.c      |   1 -
 .../selftests/mm/hugetlb-soft-offline.c       |   2 +-
 tools/testing/selftests/mm/hugetlb_dio.c      |   1 -
 .../selftests/mm/hugetlb_fault_after_madv.c   |   1 -
 .../selftests/mm/hugetlb_madv_vs_map.c        |   1 -
 tools/testing/selftests/mm/khugepaged.c       |  15 +-
 tools/testing/selftests/mm/ksm_tests.c        |   1 -
 tools/testing/selftests/mm/migration.c        |   2 +-
 tools/testing/selftests/mm/pagemap_ioctl.c    |   1 -
 .../testing/selftests/mm/prctl_thp_disable.c  |   1 -
 tools/testing/selftests/mm/protection_keys.c  |   2 +-
 tools/testing/selftests/mm/run_vmtests.sh     |  37 +--
 tools/testing/selftests/mm/soft-dirty.c       |   1 -
 .../selftests/mm/split_huge_page_test.c       |   6 +-
 tools/testing/selftests/mm/thuge-gen.c        |   1 -
 tools/testing/selftests/mm/transhuge-stress.c |   1 -
 tools/testing/selftests/mm/uffd-common.h      |   1 -
 tools/testing/selftests/mm/uffd-wp-mremap.c   |   2 +-
 .../selftests/mm/va_high_addr_switch.c        |   1 -
 tools/testing/selftests/mm/vm_util.c          | 121 ++------
 tools/testing/selftests/mm/vm_util.h          |   8 +-
 42 files changed, 656 insertions(+), 323 deletions(-)
 create mode 100644 tools/lib/mm/file_utils.c
 create mode 100644 tools/lib/mm/file_utils.h
 rename tools/{testing/selftests => lib}/mm/hugepage_settings.c (87%)
 rename tools/{testing/selftests => lib}/mm/hugepage_settings.h (100%)
 rename tools/{testing/selftests/mm/gup_test.c => mm/gup_bench.c} (50%)
 create mode 100644 tools/testing/selftests/mm/gup.c

-- 
2.53.0


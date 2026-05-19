Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC28A3F4DF5;
	Tue, 19 May 2026 12:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192326; cv=none; b=JVSo4g8YuBSn+XClCu/Qxp3OgH6zfBb8GWkzbnOJb6nq9UvHwp0e2LoycZx6mMtRozlwtgWVODlqtEG+TiN53mGxNWW1oJLd2UrWAmbM7icVn6IA1On7CbO/oIOjcopojOQkuFuUZGRGMFfTtKdYzmByTuc2d2sH3v4v8S840N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192326; c=relaxed/simple;
	bh=WfBGYRVm/z3p9e1wUlYW7mzI99DfsJJPI49IxgMxP10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RBgqBDPQ2WGp7S8kEh3wmDkrGDfeRAAzl4/NkF+rxL4oTP0Chii1rEILN2f1UjPZ6oyiFLFlpd3ClAgJkmtzF4hPamV0p1ik8EQU2HOWhZJyGUmgTo4yHJlqyrV558tO+qXacQPzMkA+d+YFtZSV+PQzEJcf/v/jbSwLRGs1r6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mp1ND4Y1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mp1ND4Y1"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F89D22FA;
	Tue, 19 May 2026 05:05:18 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06F413F85F;
	Tue, 19 May 2026 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779192323; bh=WfBGYRVm/z3p9e1wUlYW7mzI99DfsJJPI49IxgMxP10=;
	h=From:To:Cc:Subject:Date:From;
	b=mp1ND4Y1yhUyvt5HG6APJj/I/FYv2OVGOjyTHl5y4LSITFe1kDmHylSRKIfqpHykT
	 kxzxmyOqv+GdKQTkN4879TV2cGAZ27Blx2f/Uajy7Pc02Id1YeOQptviuSdWiZMybo
	 BGTBlcOVSTd/BJoNBG10MnfBBIgYmq6YdgLaOB4k=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v2 0/2] selftests/mm: separate GUP microbenchmarking from functional testing
Date: Tue, 19 May 2026 17:35:04 +0530
Message-ID: <20260519120506.184512-1-sarthak.sharma@arm.com>
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
tests cannot be run or reported individually, and run_vmtests.sh must
invoke the binary multiple times with different flag combinations to
cover all configurations. This patch series separates the two concerns:
tools/mm/gup_bench for benchmarking and tools/testing/selftests/mm/gup_test
for functional testing.

Patch 1 adds tools/mm/gup_bench.c, a standalone microbenchmark for
GUP_FAST, PIN_FAST and PIN_LONGTERM via the CONFIG_GUP_TEST debugfs
interface. It runs the same matrix of configurations as the old
run_gup_matrix() shell function (all three commands, read/write,
private/shared, four page counts, THP on/off, hugetlb), but as a
standalone C program under tools/mm with no dependency on kselftest.

Patch 2 rewrites gup_test.c as a kselftest harness-based selftest. It
covers all five GUP kernel functions (get_user_pages, get_user_pages_fast,
pin_user_pages, pin_user_pages_fast, pin_user_pages with FOLL_LONGTERM)
plus DUMP_USER_PAGES_TEST, across 12 mapping configurations (THP on,
THP off and hugetlb, each across private/shared and read/write variants)
and four batch sizes (1, 512, 123, all pages). Results are reported as
standard TAP output with no command-line arguments required.

---
These patches apply on top of mm/mm-new.

Changes in v2:
- Address v1 feedback from Sashiko
- Add fast and longterm GUP/PUP coverage
- Sweep nr_pages_per_call over 1, 512, 123, and all pages
- Call madvise(MADV_NOHUGEPAGE) in non-THP variants
- Use 256 MB for hugetlb fixtures
- Use hugetlb_restore_settings() in FIXTURE_TEARDOWN instead of atexit()
- Add TH_LOG to report nr_pages_per_call for each iteration
- Update Documentation/core-api/pin_user_pages.rst unit testing section

Sarthak Sharma (2):
  tools/mm: add a standalone GUP microbenchmark
  selftests/mm: rewrite gup_test as a standalone harness-based selftest

 Documentation/core-api/pin_user_pages.rst |  12 +-
 MAINTAINERS                               |   1 +
 tools/mm/.gitignore                       |   2 +
 tools/mm/Makefile                         |   6 +-
 tools/mm/gup_bench.c                      | 491 ++++++++++++++++++++
 tools/testing/selftests/mm/gup_test.c     | 536 +++++++++++++---------
 tools/testing/selftests/mm/run_vmtests.sh |  37 +-
 7 files changed, 822 insertions(+), 263 deletions(-)
 create mode 100644 tools/mm/gup_bench.c


base-commit: 2c3f468717231305523ddcd94d91c0d5e4a72419
-- 
2.39.5

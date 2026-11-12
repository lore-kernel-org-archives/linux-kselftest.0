Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474195;
	b=KJyjBkaAMCqN1WkQlGY5mXtB/Xnjw/Jf+JJ8IvLkrZyNpIFPrwrKK6Fir88wLCcH642u
	 GaN33nGlkIpqVs4APkTenK57WN7M2AOCwQLlSp0PGgSqwiFWEMtE+TkOJcfkmDdsi2uWN
	 QnZL+Pw9QszbEyV5ow5nb9b6lQpq36ymOxz1jFt+b5YHgtOHWKl0AmJOIjuLeO5NQB/Zg
	 qlOcYjJamyeM2ArJjzFRpotv/WNOMPQrUHkwBJ94YBPD4ussyNhMKqg4fcaOe0pfgg/XZ
	 Omey+RqP6JOfYWNKeHx4OUUPDGLqENVZd0dywbOlHPX3vv5n2eowPnJjS3F/f4ac8gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474195;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6xKG2mafUAXk8nSXldq0Ma7KfZtCeG93s827yZnp8+Y=;
	b=I7C0WuaNsmL3QXskYIn963HLtvOZHrO44y8jjfC59F81rD107YtVKLWpF4lMWQcG6tjM
	 ZPHWIrqAIRhNrqpVZ5qui6fx0zyEpJO6sak4Q3CqVOymmZQ6QZ6Gjl0fE49Q/x8kLVDHt
	 x7UWQgdkD8Pa+aacUEAUYmS1NIQKbWTBxoFRFodJxyN7rDJktN1sUJDCFRvHAFnRocDy1
	 dS2Eqg8lLwKKLPpm9f++6cGVp4rkB8H0IYjAB/zpHoHksktpY0SdQML0whMk4OoK70l2h
	 084MHkB+5pOrvsF5o/X7oRUHTV4b3ucDxg4TNGU+n5c5RXLlFcS7ARGyQc8NNq/6Jkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=r6dYwlmK;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2495A606A321;
	Thu, 12 Nov 2026 09:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2495A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=r6dYwlmK
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E4BC339;
	Thu, 12 Nov 2026 01:03:11 -0800 (PST)
Received: from a081061.arm.com (unknown [10.163.169.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA2B03F632;
	Thu, 12 Nov 2026 01:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794474194; bh=DC5Y/8KunHuhss/wymw9i7JWU1wG2xnD9ghfIKbOJko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r6dYwlmKgLlbUxPCduhg5Oi7b1ylk0pDfdAOTnsZNQFkAlzRB2ObxVqP7OIZtoFQR
	 qS2KH9Hy44FTYT8JTKgHZvy8n3uB3OOtHKYDUXuR38wj5DNAtsYzCasFsnPVbm6wwj
	 Fo6u7lnH9yXE64T7rtAGK2fdeAN/lqwEb150Hsks=
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
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH 1/4] selftests/mm: remove transhuge-stress
Date: Thu, 12 Nov 2026 14:32:47 +0530
Message-ID: <20261112090250.334344-2-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112090250.334344-1-sarthak.sharma@arm.com>
References: <20261112090250.334344-1-sarthak.sharma@arm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

transhuge-stress currently behaves like a stressor which takes arguments
like duration and size. By default, it tries to allocate and split a
THP at every hugepage sized offset in a range equal to RAM. It counts
successful and failed allocations and prints them. The test passes if
the specified duration has elapsed and fails only if a setup or system
call fails.

This is not how a selftest is supposed to behave. Remove
transhuge-stress from selftests/mm and remove its references from
Makefile, run_vmtests.sh and MAINTAINERS. A subsequent patch adds a
selftest for THP compaction.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 MAINTAINERS                                   |   1 -
 tools/testing/selftests/mm/Makefile           |   1 -
 tools/testing/selftests/mm/run_vmtests.sh     |   2 -
 tools/testing/selftests/mm/transhuge-stress.c | 146 ------------------
 4 files changed, 150 deletions(-)
 delete mode 100644 tools/testing/selftests/mm/transhuge-stress.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ce05a3253baa..4d74ad879ecf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17946,7 +17946,6 @@ F:	mm/mm_slot.h
 F:	tools/mm/thpmaps
 F:	tools/testing/selftests/mm/khugepaged.c
 F:	tools/testing/selftests/mm/split_huge_page_test.c
-F:	tools/testing/selftests/mm/transhuge-stress.c
 
 MEMORY MANAGEMENT - USERFAULTFD
 M:	Andrew Morton <akpm@linux-foundation.org>
diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 675ec57d47de..06d3d0350a9a 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -90,7 +90,6 @@ TEST_GEN_FILES += pfnmap
 TEST_GEN_FILES += process_madv
 TEST_GEN_FILES += prctl_thp_disable
 TEST_GEN_FILES += thuge-gen
-TEST_GEN_FILES += transhuge-stress
 TEST_GEN_FILES += uffd-stress
 TEST_GEN_FILES += uffd-unit-tests
 TEST_GEN_FILES += uffd-wp-mremap
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 973cb715b326..cb5c7cccb585 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -448,8 +448,6 @@ if [ -n "${MOUNTED_XFS}" ]; then
     rm -f ${XFS_IMG}
 fi
 
-CATEGORY="thp" run_test ./transhuge-stress -d 20
-
 CATEGORY="thp" run_test ./folio_split_race_test
 
 CATEGORY="migration" run_test ./migration
diff --git a/tools/testing/selftests/mm/transhuge-stress.c b/tools/testing/selftests/mm/transhuge-stress.c
deleted file mode 100644
index ad2831c864dc..000000000000
--- a/tools/testing/selftests/mm/transhuge-stress.c
+++ /dev/null
@@ -1,146 +0,0 @@
-/*
- * Stress test for transparent huge pages, memory compaction and migration.
- *
- * Authors: Konstantin Khlebnikov <koct9i@gmail.com>
- *
- * This is free and unencumbered software released into the public domain.
- */
-
-#include <stdlib.h>
-#include <stdio.h>
-#include <stdint.h>
-#include <err.h>
-#include <time.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <string.h>
-#include <sys/mman.h>
-#include "vm_util.h"
-#include "kselftest.h"
-
-int backing_fd = -1;
-int mmap_flags = MAP_ANONYMOUS | MAP_NORESERVE | MAP_PRIVATE;
-#define PROT_RW (PROT_READ | PROT_WRITE)
-
-int main(int argc, char **argv)
-{
-	size_t ram, len;
-	void *ptr, *p;
-	struct timespec start, a, b;
-	int i = 0;
-	char *name = NULL;
-	double s;
-	uint8_t *map;
-	size_t map_len;
-	int pagemap_fd;
-	int duration = 0;
-	const uint64_t hpage_size = pmd_psize();
-	const uint64_t hpage_shift = pmd_pshift();
-
-	ksft_print_header();
-
-	if (!thp_is_enabled())
-		ksft_exit_skip("Transparent Hugepages not available\n");
-
-	if (!hpage_size || !hpage_shift)
-		ksft_exit_fail_msg("reading hpage_size failed\n");
-
-	ram = sysconf(_SC_PHYS_PAGES);
-	if (ram > SIZE_MAX / psize() / 4)
-		ram = SIZE_MAX / 4;
-	else
-		ram *= psize();
-	len = ram;
-
-	while (++i < argc) {
-		if (!strcmp(argv[i], "-h"))
-			ksft_exit_fail_msg("usage: %s [-f <filename>] [-d <duration>] [size in MiB]\n",
-					   argv[0]);
-		else if (!strcmp(argv[i], "-f"))
-			name = argv[++i];
-		else if (!strcmp(argv[i], "-d"))
-			duration = atoi(argv[++i]);
-		else
-			len = atoll(argv[i]) << 20;
-	}
-
-	ksft_set_plan(1);
-
-	if (name) {
-		backing_fd = open(name, O_RDWR);
-		if (backing_fd == -1)
-			ksft_exit_fail_msg("open %s\n", name);
-		mmap_flags = MAP_SHARED;
-	}
-
-	warnx("allocate %zd transhuge pages, using %zd MiB virtual memory"
-	      " and %zd MiB of ram", len >> hpage_shift, len >> 20,
-	      ram >> (20 + hpage_shift - pshift() - 1));
-
-	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
-	if (pagemap_fd < 0)
-		ksft_exit_fail_msg("open pagemap\n");
-
-	len -= len % hpage_size;
-	ptr = mmap(NULL, len + hpage_size, PROT_RW, mmap_flags, backing_fd, 0);
-	if (ptr == MAP_FAILED)
-		ksft_exit_fail_msg("initial mmap");
-	ptr += hpage_size - (uintptr_t)ptr % hpage_size;
-
-	if (madvise(ptr, len, MADV_HUGEPAGE))
-		ksft_exit_fail_msg("MADV_HUGEPAGE");
-
-	map_len = ram >> (hpage_shift - 1);
-	map = malloc(map_len);
-	if (!map)
-		ksft_exit_fail_msg("map malloc\n");
-
-	clock_gettime(CLOCK_MONOTONIC, &start);
-
-	while (1) {
-		int nr_succeed = 0, nr_failed = 0, nr_pages = 0;
-
-		memset(map, 0, map_len);
-
-		clock_gettime(CLOCK_MONOTONIC, &a);
-		for (p = ptr; p < ptr + len; p += hpage_size) {
-			int64_t pfn;
-
-			pfn = allocate_transhuge(p, pagemap_fd);
-
-			if (pfn < 0) {
-				nr_failed++;
-			} else {
-				size_t idx = pfn >> (hpage_shift - pshift());
-
-				nr_succeed++;
-				if (idx >= map_len) {
-					map = realloc(map, idx + 1);
-					if (!map)
-						ksft_exit_fail_msg("map realloc\n");
-					memset(map + map_len, 0, idx + 1 - map_len);
-					map_len = idx + 1;
-				}
-				if (!map[idx])
-					nr_pages++;
-				map[idx] = 1;
-			}
-
-			/* split transhuge page, keep last page */
-			if (madvise(p, hpage_size - psize(), MADV_DONTNEED))
-				ksft_exit_fail_msg("MADV_DONTNEED");
-		}
-		clock_gettime(CLOCK_MONOTONIC, &b);
-		s = b.tv_sec - a.tv_sec + (b.tv_nsec - a.tv_nsec) / 1000000000.;
-
-		ksft_print_msg("%.3f s/loop, %.3f ms/page, %10.3f MiB/s\t"
-			       "%4d succeed, %4d failed, %4d different pages\n",
-			       s, s * 1000 / (len >> hpage_shift), len / s / (1 << 20),
-			       nr_succeed, nr_failed, nr_pages);
-
-		if (duration > 0 && b.tv_sec - start.tv_sec >= duration) {
-			ksft_test_result_pass("Completed\n");
-			ksft_finished();
-		}
-	}
-}
-- 
2.53.0


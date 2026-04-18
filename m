Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC536343D9E;
	Sat, 18 Apr 2026 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509877; cv=none; b=ZDhMaB9moKHC0D/67549EPZYs7jJUkLznYmpQl9o6B/dMKH07i0BbLvBUSr1HHG/1ehJCMua0mviPBiKLQiHx722BHpzPtX4c9ztmz44TYedMJhfcNwzYl0THRWkb5Aqb4RVI5MT/zEOehDRG53md9dfzTXIF9otXGam18gTozc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509877; c=relaxed/simple;
	bh=KB+zpOUuKazQqd5NW+NHSkN+R36fMCwDZDUDG0Rou6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FkPEmup24IHbs1lT3Kqo4GR0LvgZDLSXXWxTlNX8d5HMxsFFTTkAN3FdMDsRStrDeLNN+Bfb4u01lXNzLFgSE+cbgtRWouI7xR5OYUvvTReujQhyPnYtqL64dr+iTX6t9KD803rAzhPeh4oUtF61gVmSaktp+orBhxIgCCqaV7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCX/eODA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCX/eODA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B53CC19424;
	Sat, 18 Apr 2026 10:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509877;
	bh=KB+zpOUuKazQqd5NW+NHSkN+R36fMCwDZDUDG0Rou6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dCX/eODAMRwgo48xf3+mr7jL5lO6717CVVSVLvzsZ4l9ho1mhIphgY6/4asV6yo4Y
	 cFPEcPdJwb6/oR6pSOZitfX0cxnbyfaF1B388k9i55+UHrNXxIoM43ex+pv9OheiCA
	 MrMJVG5DjsaZTFCCx/yxERWDoOHDCrmGwKVtfjPmgpvwLJBq3t2hRMzCeBVpzUL/lh
	 73A6mgxbtrnMRADjnjcdgY6SO/e3rtZpTOA41c8+/KIfT5j6l7uMxbZgtx+g8KfAmq
	 4fUBU1ouWglyVZtb/jaXMJhifBEjM67ANsorno1kW0XY2L+H8xyTD3ZuPIjFAkdO0E
	 PG+NyCHBhlxmA==
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
Subject: [PATCH v2 21/53] selftests/mm: rename thp_settings.[ch] to hugepage_settings.[ch]
Date: Sat, 18 Apr 2026 13:55:06 +0300
Message-ID: <20260418105539.1261536-22-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418105539.1261536-1-rppt@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

... for upcoming addition of HugeTLB helpers.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/Makefile                           | 4 ++--
 tools/testing/selftests/mm/cow.c                              | 2 +-
 tools/testing/selftests/mm/folio_split_race_test.c            | 2 +-
 tools/testing/selftests/mm/guard-regions.c                    | 2 +-
 .../selftests/mm/{thp_settings.c => hugepage_settings.c}      | 2 +-
 .../selftests/mm/{thp_settings.h => hugepage_settings.h}      | 0
 tools/testing/selftests/mm/khugepaged.c                       | 2 +-
 tools/testing/selftests/mm/ksm_tests.c                        | 2 +-
 tools/testing/selftests/mm/migration.c                        | 2 +-
 tools/testing/selftests/mm/prctl_thp_disable.c                | 2 +-
 tools/testing/selftests/mm/soft-dirty.c                       | 2 +-
 tools/testing/selftests/mm/split_huge_page_test.c             | 2 +-
 tools/testing/selftests/mm/transhuge-stress.c                 | 2 +-
 tools/testing/selftests/mm/uffd-wp-mremap.c                   | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)
 rename tools/testing/selftests/mm/{thp_settings.c => hugepage_settings.c} (99%)
 rename tools/testing/selftests/mm/{thp_settings.h => hugepage_settings.h} (100%)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index a6955660a806..a1d103b38485 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -186,8 +186,8 @@ TEST_FILES += write_hugetlb_memory.sh
 
 include ../lib.mk
 
-$(TEST_GEN_PROGS): vm_util.c thp_settings.c
-$(TEST_GEN_FILES): vm_util.c thp_settings.c
+$(TEST_GEN_PROGS): vm_util.c hugepage_settings.c
+$(TEST_GEN_FILES): vm_util.c hugepage_settings.c
 
 $(OUTPUT)/uffd-stress: uffd-common.c
 $(OUTPUT)/uffd-unit-tests: uffd-common.c
diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
index 6abdcb30aba8..4321f4208fe3 100644
--- a/tools/testing/selftests/mm/cow.c
+++ b/tools/testing/selftests/mm/cow.c
@@ -29,7 +29,7 @@
 #include "../../../../mm/gup_test.h"
 #include "kselftest.h"
 #include "vm_util.h"
-#include "thp_settings.h"
+#include "hugepage_settings.h"
 
 static size_t pagesize;
 static int pagemap_fd;
diff --git a/tools/testing/selftests/mm/folio_split_race_test.c b/tools/testing/selftests/mm/folio_split_race_test.c
index ff026f183ac7..7ede4793c778 100644
--- a/tools/testing/selftests/mm/folio_split_race_test.c
+++ b/tools/testing/selftests/mm/folio_split_race_test.c
@@ -25,7 +25,7 @@
 #include <unistd.h>
 #include "vm_util.h"
 #include "kselftest.h"
-#include "thp_settings.h"
+#include "hugepage_settings.h"
 
 uint64_t page_size;
 uint64_t pmd_pagesize;
diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
index 48e8b1539be3..feb50b415f52 100644
--- a/tools/testing/selftests/mm/guard-regions.c
+++ b/tools/testing/selftests/mm/guard-regions.c
@@ -21,7 +21,7 @@
 #include <sys/uio.h>
 #include <unistd.h>
 #include "vm_util.h"
-#include "thp_settings.h"
+#include "hugepage_settings.h"
 
 #include "../pidfd/pidfd.h"
 
diff --git a/tools/testing/selftests/mm/thp_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
similarity index 99%
rename from tools/testing/selftests/mm/thp_settings.c
rename to tools/testing/selftests/mm/hugepage_settings.c
index f38ba8a27b30..87ecb309b430 100644
--- a/tools/testing/selftests/mm/thp_settings.c
+++ b/tools/testing/selftests/mm/hugepage_settings.c
@@ -8,7 +8,7 @@
 #include <unistd.h>
 
 #include "vm_util.h"
-#include "thp_settings.h"
+#include "hugepage_settings.h"
 
 #define THP_SYSFS "/sys/kernel/mm/transparent_hugepage/"
 #define MAX_SETTINGS_DEPTH 4
diff --git a/tools/testing/selftests/mm/thp_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
similarity index 100%
rename from tools/testing/selftests/mm/thp_settings.h
rename to tools/testing/selftests/mm/hugepage_settings.h
diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 87442e902b26..88ff6ad568e4 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -22,7 +22,7 @@
 #include "linux/magic.h"
 
 #include "vm_util.h"
-#include "thp_settings.h"
+#include "hugepage_settings.h"
 
 #define BASE_ADDR ((void *)(1UL << 30))
 static unsigned long hpage_pmd_size;
diff --git a/tools/testing/selftests/mm/ksm_tests.c b/tools/testing/selftests/mm/ksm_tests.c
index 752a2c0d06ab..fb355f869401 100644
--- a/tools/testing/selftests/mm/ksm_tests.c
+++ b/tools/testing/selftests/mm/ksm_tests.c
@@ -15,7 +15,7 @@
 #include "kselftest.h"
 #include <include/vdso/time64.h>
 #include "vm_util.h"
-#include "thp_settings.h"
+#include "hugepage_settings.h"
 
 #define KSM_SYSFS_PATH "/sys/kernel/mm/ksm/"
 #define KSM_FP(s) (KSM_SYSFS_PATH s)
diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
index e3c2f831e15a..ccf42002ce86 100644
--- a/tools/testing/selftests/mm/migration.c
+++ b/tools/testing/selftests/mm/migration.c
@@ -5,7 +5,7 @@
  */
 
 #include "kselftest_harness.h"
-#include "thp_settings.h"
+#include "hugepage_settings.h"
 
 #include <strings.h>
 #include <pthread.h>
diff --git a/tools/testing/selftests/mm/prctl_thp_disable.c b/tools/testing/selftests/mm/prctl_thp_disable.c
index ca27200596a4..d8d9d1de57b8 100644
--- a/tools/testing/selftests/mm/prctl_thp_disable.c
+++ b/tools/testing/selftests/mm/prctl_thp_disable.c
@@ -14,7 +14,7 @@
 #include <sys/wait.h>
 
 #include "kselftest_harness.h"
-#include "thp_settings.h"
+#include "hugepage_settings.h"
 #include "vm_util.h"
 
 #ifndef PR_THP_DISABLE_EXCEPT_ADVISED
diff --git a/tools/testing/selftests/mm/soft-dirty.c b/tools/testing/selftests/mm/soft-dirty.c
index bcfcac99b436..c426c4636ef5 100644
--- a/tools/testing/selftests/mm/soft-dirty.c
+++ b/tools/testing/selftests/mm/soft-dirty.c
@@ -9,7 +9,7 @@
 
 #include "kselftest.h"
 #include "vm_util.h"
-#include "thp_settings.h"
+#include "hugepage_settings.h"
 
 #define PAGEMAP_FILE_PATH "/proc/self/pagemap"
 #define TEST_ITERATIONS 10000
diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index 500d07c4938b..cc99294bdd5a 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -21,7 +21,7 @@
 #include <time.h>
 #include "vm_util.h"
 #include "kselftest.h"
-#include "thp_settings.h"
+#include "hugepage_settings.h"
 
 uint64_t pagesize;
 unsigned int pageshift;
diff --git a/tools/testing/selftests/mm/transhuge-stress.c b/tools/testing/selftests/mm/transhuge-stress.c
index 7a9f1035099b..8eb0c5630e7e 100644
--- a/tools/testing/selftests/mm/transhuge-stress.c
+++ b/tools/testing/selftests/mm/transhuge-stress.c
@@ -17,7 +17,7 @@
 #include <sys/mman.h>
 #include "vm_util.h"
 #include "kselftest.h"
-#include "thp_settings.h"
+#include "hugepage_settings.h"
 
 int backing_fd = -1;
 int mmap_flags = MAP_ANONYMOUS | MAP_NORESERVE | MAP_PRIVATE;
diff --git a/tools/testing/selftests/mm/uffd-wp-mremap.c b/tools/testing/selftests/mm/uffd-wp-mremap.c
index 516c35d236e1..9d67b11c2f28 100644
--- a/tools/testing/selftests/mm/uffd-wp-mremap.c
+++ b/tools/testing/selftests/mm/uffd-wp-mremap.c
@@ -8,7 +8,7 @@
 #include <linux/mman.h>
 #include <sys/mman.h>
 #include "kselftest.h"
-#include "thp_settings.h"
+#include "hugepage_settings.h"
 #include "uffd-common.h"
 
 static int pagemap_fd;
-- 
2.53.0


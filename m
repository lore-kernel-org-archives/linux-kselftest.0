Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA6B43E9FD;
	Mon, 11 May 2026 16:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517087; cv=none; b=YmGcKS96Q+0v/Eu8NXZTEWQrP4TGxDvmISFrzvvF1Y7Ijbn87VNKmNiZ/LuZay57bEuEhveNzpiYk+s9+7ZhX6Bn1nG2N9zHq35dnWvZRGodQhT8Fqq2/+hNHloiNorgiKqhaafM2gV8yPAVZ1wm4rc0zIsoIDVjWOMmQQFNa08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517087; c=relaxed/simple;
	bh=8JtPp48tlI6tlzOMD2iXnicH5leYJtxxWAWk3AtydiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hHa8uzK0GMAQKJw5h1o1E+348kbNV9gDRxFbUPkEsU+n2wNYgVO2wGXNY3DVk6RhrjxQWSXxbxuGCU11S5jtOGC+bseOWEOS1vNvEJvYclSOHfQyrfRdWrwSkVyF0y5hafCqNmBKTgHCJi0j/MltkcANgkN8MyajI+3jODnXiag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qrarMoGl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qrarMoGl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A11C2BCB0;
	Mon, 11 May 2026 16:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517087;
	bh=8JtPp48tlI6tlzOMD2iXnicH5leYJtxxWAWk3AtydiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qrarMoGlrf4moH0j4mU1V3J3uNVF09RbQ226Ba5+MMmNKj31BUxkCz7Bxigs17noy
	 /nEqgrjz+7+0aL/ltab/eiyBxjHsF2/BeZEaw4YFPS0poT1PP5Ioba2JLoDUgxoaB+
	 /egUw1J/rcJsqZkO+QG6AJuPyKcnygPOi17j5OfZg4GAF0TEiJpaDzjRAj4wMmaUnu
	 sRLtbfrPuHZtyuGLfjoP20acMk7ry0CErGZXl+L9nZuXs1rSVcSlnwG4Ik03FvUPpu
	 rSRiuN8pbdVWomgva88LcrNI+LvY0Ci2xahhGVUx7AUXg2EKJWm1R5KwwN+R/s5lJG
	 ABVypcP24E5kg==
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
	Li Wang <li.wang@linux.dev>,
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
Subject: [PATCH v4 24/55] selftests/mm: move HugeTLB helpers to hugepage_settings
Date: Mon, 11 May 2026 19:28:08 +0300
Message-ID: <20260511162840.375890-25-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511162840.375890-1-rppt@kernel.org>
References: <20260511162840.375890-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Move library functions that abstract HugeTLB /proc and /sysfs access
from vm_util to hugepage_settings.

This will help creating common helpers that save and restore HugeTLB and
THP settings.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/gup_longterm.c     |  1 +
 tools/testing/selftests/mm/hmm-tests.c        |  2 +-
 .../testing/selftests/mm/hugepage_settings.c  | 68 +++++++++++++++++++
 .../testing/selftests/mm/hugepage_settings.h  |  8 +++
 tools/testing/selftests/mm/hugetlb-madvise.c  |  1 +
 tools/testing/selftests/mm/hugetlb-mmap.c     |  1 +
 tools/testing/selftests/mm/hugetlb-vmemmap.c  |  1 +
 tools/testing/selftests/mm/hugetlb_dio.c      |  1 +
 .../selftests/mm/hugetlb_fault_after_madv.c   |  1 +
 .../selftests/mm/hugetlb_madv_vs_map.c        |  1 +
 tools/testing/selftests/mm/protection_keys.c  |  1 +
 tools/testing/selftests/mm/thuge-gen.c        |  1 +
 tools/testing/selftests/mm/uffd-common.h      |  1 +
 .../selftests/mm/va_high_addr_switch.c        |  1 +
 tools/testing/selftests/mm/vm_util.c          | 67 ------------------
 tools/testing/selftests/mm/vm_util.h          |  3 -
 16 files changed, 88 insertions(+), 71 deletions(-)

diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
index f61150d28eb2..ab4eaf4feb7c 100644
--- a/tools/testing/selftests/mm/gup_longterm.c
+++ b/tools/testing/selftests/mm/gup_longterm.c
@@ -29,6 +29,7 @@
 #include "../../../../mm/gup_test.h"
 #include "kselftest.h"
 #include "vm_util.h"
+#include "hugepage_settings.h"
 
 static size_t pagesize;
 static int nr_hugetlbsizes;
diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index 788689497e92..409b11cad4bc 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -11,6 +11,7 @@
  */
 
 #include "kselftest_harness.h"
+#include "hugepage_settings.h"
 
 #include <errno.h>
 #include <fcntl.h>
@@ -27,7 +28,6 @@
 #include <sys/ioctl.h>
 #include <sys/time.h>
 
-
 /*
  * This is a private UAPI to the kernel test module so it isn't exported
  * in the usual include/uapi/... directory.
diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
index 9000864f8aa4..3d6e4376de06 100644
--- a/tools/testing/selftests/mm/hugepage_settings.c
+++ b/tools/testing/selftests/mm/hugepage_settings.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <dirent.h>
 #include <fcntl.h>
 #include <limits.h>
 #include <signal.h>
+#include <stddef.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -395,3 +397,69 @@ bool thp_is_enabled(void)
 	/* THP is considered enabled if it's either "always" or "madvise" */
 	return mode == 1 || mode == 3;
 }
+
+int detect_hugetlb_page_sizes(size_t sizes[], int max)
+{
+	DIR *dir = opendir("/sys/kernel/mm/hugepages/");
+	int count = 0;
+
+	if (!dir)
+		return 0;
+
+	while (count < max) {
+		struct dirent *entry = readdir(dir);
+		size_t kb;
+
+		if (!entry)
+			break;
+		if (entry->d_type != DT_DIR)
+			continue;
+		if (sscanf(entry->d_name, "hugepages-%zukB", &kb) != 1)
+			continue;
+		sizes[count++] = kb * 1024;
+		ksft_print_msg("[INFO] detected hugetlb page size: %zu KiB\n",
+			       kb);
+	}
+	closedir(dir);
+	return count;
+}
+
+unsigned long default_huge_page_size(void)
+{
+	unsigned long hps = 0;
+	char *line = NULL;
+	size_t linelen = 0;
+	FILE *f = fopen("/proc/meminfo", "r");
+
+	if (!f)
+		return 0;
+	while (getline(&line, &linelen, f) > 0) {
+		if (sscanf(line, "Hugepagesize:       %lu kB", &hps) == 1) {
+			hps <<= 10;
+			break;
+		}
+	}
+
+	free(line);
+	fclose(f);
+	return hps;
+}
+
+unsigned long get_free_hugepages(void)
+{
+	unsigned long fhp = 0;
+	char *line = NULL;
+	size_t linelen = 0;
+	FILE *f = fopen("/proc/meminfo", "r");
+
+	if (!f)
+		return fhp;
+	while (getline(&line, &linelen, f) > 0) {
+		if (sscanf(line, "HugePages_Free:      %lu", &fhp) == 1)
+			break;
+	}
+
+	free(line);
+	fclose(f);
+	return fhp;
+}
diff --git a/tools/testing/selftests/mm/hugepage_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
index d81e33e425c2..4c51e9219f6a 100644
--- a/tools/testing/selftests/mm/hugepage_settings.h
+++ b/tools/testing/selftests/mm/hugepage_settings.h
@@ -6,6 +6,8 @@
 #include <stddef.h>
 #include <stdint.h>
 
+/* Transparent Huge Pages (THP) */
+
 enum thp_enabled {
 	THP_NEVER,
 	THP_ALWAYS,
@@ -86,4 +88,10 @@ unsigned long thp_shmem_supported_orders(void);
 bool thp_available(void);
 bool thp_is_enabled(void);
 
+/* HugeTLB */
+
+int detect_hugetlb_page_sizes(size_t sizes[], int max);
+unsigned long default_huge_page_size(void);
+unsigned long get_free_hugepages(void);
+
 #endif /* __HUGEPAGE_SETTINGS_H__ */
diff --git a/tools/testing/selftests/mm/hugetlb-madvise.c b/tools/testing/selftests/mm/hugetlb-madvise.c
index e7dd8d06d986..5dfa2e0097ef 100644
--- a/tools/testing/selftests/mm/hugetlb-madvise.c
+++ b/tools/testing/selftests/mm/hugetlb-madvise.c
@@ -20,6 +20,7 @@
 #include <fcntl.h>
 #include "vm_util.h"
 #include "kselftest.h"
+#include "hugepage_settings.h"
 
 #define MIN_FREE_PAGES	20
 #define NR_HUGE_PAGES	10	/* common number of pages to map/allocate */
diff --git a/tools/testing/selftests/mm/hugetlb-mmap.c b/tools/testing/selftests/mm/hugetlb-mmap.c
index a327d90d7a79..395be5d0dc1a 100644
--- a/tools/testing/selftests/mm/hugetlb-mmap.c
+++ b/tools/testing/selftests/mm/hugetlb-mmap.c
@@ -18,6 +18,7 @@
 #include <linux/memfd.h>
 #include "vm_util.h"
 #include "kselftest.h"
+#include "hugepage_settings.h"
 
 #define LENGTH (256UL*1024*1024)
 #define PROTECTION (PROT_READ | PROT_WRITE)
diff --git a/tools/testing/selftests/mm/hugetlb-vmemmap.c b/tools/testing/selftests/mm/hugetlb-vmemmap.c
index 485a6978b40f..af5786bebfd1 100644
--- a/tools/testing/selftests/mm/hugetlb-vmemmap.c
+++ b/tools/testing/selftests/mm/hugetlb-vmemmap.c
@@ -11,6 +11,7 @@
 #include <sys/mman.h>
 #include <fcntl.h>
 #include "vm_util.h"
+#include "hugepage_settings.h"
 
 #define PAGE_COMPOUND_HEAD	(1UL << 15)
 #define PAGE_COMPOUND_TAIL	(1UL << 16)
diff --git a/tools/testing/selftests/mm/hugetlb_dio.c b/tools/testing/selftests/mm/hugetlb_dio.c
index 31a054fa8134..81e3f7bc8e76 100644
--- a/tools/testing/selftests/mm/hugetlb_dio.c
+++ b/tools/testing/selftests/mm/hugetlb_dio.c
@@ -20,6 +20,7 @@
 #include <sys/syscall.h>
 #include "vm_util.h"
 #include "kselftest.h"
+#include "hugepage_settings.h"
 
 #ifndef STATX_DIOALIGN
 #define STATX_DIOALIGN		0x00002000U
diff --git a/tools/testing/selftests/mm/hugetlb_fault_after_madv.c b/tools/testing/selftests/mm/hugetlb_fault_after_madv.c
index b4b257775b74..abc3904c5268 100644
--- a/tools/testing/selftests/mm/hugetlb_fault_after_madv.c
+++ b/tools/testing/selftests/mm/hugetlb_fault_after_madv.c
@@ -10,6 +10,7 @@
 
 #include "vm_util.h"
 #include "kselftest.h"
+#include "hugepage_settings.h"
 
 #define INLOOP_ITER 100
 
diff --git a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
index c7105c6d319b..ac60b4f18784 100644
--- a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
+++ b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
@@ -25,6 +25,7 @@
 #include <unistd.h>
 
 #include "vm_util.h"
+#include "hugepage_settings.h"
 
 #define INLOOP_ITER 100
 
diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index d617b41dda6b..4e4aa3b326c1 100644
--- a/tools/testing/selftests/mm/protection_keys.c
+++ b/tools/testing/selftests/mm/protection_keys.c
@@ -46,6 +46,7 @@
 #include <sys/ptrace.h>
 #include <setjmp.h>
 
+#include "hugepage_settings.h"
 #include "pkey-helpers.h"
 
 int iteration_nr = 1;
diff --git a/tools/testing/selftests/mm/thuge-gen.c b/tools/testing/selftests/mm/thuge-gen.c
index 77813d34dcc2..1007bc8aa57c 100644
--- a/tools/testing/selftests/mm/thuge-gen.c
+++ b/tools/testing/selftests/mm/thuge-gen.c
@@ -28,6 +28,7 @@
 #include <string.h>
 #include "vm_util.h"
 #include "kselftest.h"
+#include "hugepage_settings.h"
 
 #if !defined(MAP_HUGETLB)
 #define MAP_HUGETLB	0x40000
diff --git a/tools/testing/selftests/mm/uffd-common.h b/tools/testing/selftests/mm/uffd-common.h
index 0723843a7626..92a21b97f745 100644
--- a/tools/testing/selftests/mm/uffd-common.h
+++ b/tools/testing/selftests/mm/uffd-common.h
@@ -37,6 +37,7 @@
 
 #include "kselftest.h"
 #include "vm_util.h"
+#include "hugepage_settings.h"
 
 #define UFFD_FLAGS	(O_CLOEXEC | O_NONBLOCK | UFFD_USER_MODE_ONLY)
 
diff --git a/tools/testing/selftests/mm/va_high_addr_switch.c b/tools/testing/selftests/mm/va_high_addr_switch.c
index 5d38735ea60e..0b69bd4b901d 100644
--- a/tools/testing/selftests/mm/va_high_addr_switch.c
+++ b/tools/testing/selftests/mm/va_high_addr_switch.c
@@ -11,6 +11,7 @@
 
 #include "vm_util.h"
 #include "kselftest.h"
+#include "hugepage_settings.h"
 
 /*
  * The hint addr value is used to allocate addresses
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index db94564f4431..412e980cce9a 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -2,7 +2,6 @@
 #include <string.h>
 #include <errno.h>
 #include <fcntl.h>
-#include <dirent.h>
 #include <inttypes.h>
 #include <sys/ioctl.h>
 #include <linux/userfaultfd.h>
@@ -291,53 +290,6 @@ int64_t allocate_transhuge(void *ptr, int pagemap_fd)
 	return -1;
 }
 
-unsigned long default_huge_page_size(void)
-{
-	unsigned long hps = 0;
-	char *line = NULL;
-	size_t linelen = 0;
-	FILE *f = fopen("/proc/meminfo", "r");
-
-	if (!f)
-		return 0;
-	while (getline(&line, &linelen, f) > 0) {
-		if (sscanf(line, "Hugepagesize:       %lu kB", &hps) == 1) {
-			hps <<= 10;
-			break;
-		}
-	}
-
-	free(line);
-	fclose(f);
-	return hps;
-}
-
-int detect_hugetlb_page_sizes(size_t sizes[], int max)
-{
-	DIR *dir = opendir("/sys/kernel/mm/hugepages/");
-	int count = 0;
-
-	if (!dir)
-		return 0;
-
-	while (count < max) {
-		struct dirent *entry = readdir(dir);
-		size_t kb;
-
-		if (!entry)
-			break;
-		if (entry->d_type != DT_DIR)
-			continue;
-		if (sscanf(entry->d_name, "hugepages-%zukB", &kb) != 1)
-			continue;
-		sizes[count++] = kb * 1024;
-		ksft_print_msg("[INFO] detected hugetlb page size: %zu KiB\n",
-			       kb);
-	}
-	closedir(dir);
-	return count;
-}
-
 int pageflags_get(unsigned long pfn, int kpageflags_fd, uint64_t *flags)
 {
 	size_t count;
@@ -396,25 +348,6 @@ int uffd_unregister(int uffd, void *addr, uint64_t len)
 	return ret;
 }
 
-unsigned long get_free_hugepages(void)
-{
-	unsigned long fhp = 0;
-	char *line = NULL;
-	size_t linelen = 0;
-	FILE *f = fopen("/proc/meminfo", "r");
-
-	if (!f)
-		return fhp;
-	while (getline(&line, &linelen, f) > 0) {
-		if (sscanf(line, "HugePages_Free:      %lu", &fhp) == 1)
-			break;
-	}
-
-	free(line);
-	fclose(f);
-	return fhp;
-}
-
 static bool check_vmflag(void *addr, const char *flag)
 {
 	char buffer[MAX_LINE_LENGTH];
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 1a07305ceff4..195bf2e26792 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -94,8 +94,6 @@ bool check_huge_anon(void *addr, int nr_hpages, uint64_t hpage_size);
 bool check_huge_file(void *addr, int nr_hpages, uint64_t hpage_size);
 bool check_huge_shmem(void *addr, int nr_hpages, uint64_t hpage_size);
 int64_t allocate_transhuge(void *ptr, int pagemap_fd);
-unsigned long default_huge_page_size(void);
-int detect_hugetlb_page_sizes(size_t sizes[], int max);
 int pageflags_get(unsigned long pfn, int kpageflags_fd, uint64_t *flags);
 
 int uffd_register(int uffd, void *addr, uint64_t len,
@@ -103,7 +101,6 @@ int uffd_register(int uffd, void *addr, uint64_t len,
 int uffd_unregister(int uffd, void *addr, uint64_t len);
 int uffd_register_with_ioctls(int uffd, void *addr, uint64_t len,
 			      bool miss, bool wp, bool minor, uint64_t *ioctls);
-unsigned long get_free_hugepages(void);
 bool check_vmflag_io(void *addr);
 bool check_vmflag_pfnmap(void *addr);
 bool check_vmflag_guard(void *addr);
-- 
2.53.0


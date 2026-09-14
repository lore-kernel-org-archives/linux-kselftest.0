Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7773E5ED5;
	Mon, 14 Sep 2026 07:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371076; cv=none; b=Pju7bvgGNFe2ZyPQOb+gIdhhMEzRmBh/q8b46Yo5gnd4fwEVcQBb/N1Jbsjq2rL1R1E7qghS0fE36wn1Q+cDUkiO/CpTVDHX4hUjyoOhJuz4DgHgB3zh2bKMixcwg6I4vxLTmL2hKIVOkfIA+/K5SYABtu7oJzcAH0U3ljg308k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371076; c=relaxed/simple;
	bh=bLvv5MbEFDAD1wAGeigHtgwqqm/7rxMekNWQLENldUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=erkWgeAWa1G4zqZ84WYkP8ORhgAfUqvcY/rZ9rikLAD8bi37H9AHUlojtAP483/Qg8qTFbcfxeXnV19TxZWO/puMmijcTUq3AA7oYdaikNkkD7OZldieJvyn1BxT53fVTP6Gy81Qf1iS5FNn8akTioDnJHGyC9/CCuWZ/ENY25s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HN4WVcvE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HN4WVcvE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C7851C01;
	Mon, 14 Sep 2026 00:31:08 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D6413F59E;
	Mon, 14 Sep 2026 00:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789371071; bh=bLvv5MbEFDAD1wAGeigHtgwqqm/7rxMekNWQLENldUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HN4WVcvER0Xh/HukcuJ6SqjRHuvq+ULxxy/BOlsBnrZoQkYz/4SyBl6wytt35Rn/l
	 0TIlL1XLet8GNldgqbSR2jotBRTXX6USLJkjZXzIYsZJjXVmmpg5dAawzsM96AfcVo
	 m0uS8pn9u81XEJKjbexNV3GB2cbDs8QaHHJ6IZw4=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 14 Sep 2026 08:30:47 +0100
Subject: [PATCH v3 2/3] kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT
 macro
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-fix_hpage_macro-v3-2-c9a305a01d39@arm.com>
References: <20260914-fix_hpage_macro-v3-0-c9a305a01d39@arm.com>
In-Reply-To: <20260914-fix_hpage_macro-v3-0-c9a305a01d39@arm.com>
To: Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Peter Xu <peterx@redhat.com>, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Sarthak Sharma <sarthak.sharma@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13602; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=bLvv5MbEFDAD1wAGeigHtgwqqm/7rxMekNWQLENldUk=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqp6KzLn4IWONxl/yfMdJwc5Bb78CJLmXxgjDBL
 mL/0MNjNMWJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaqeiswAKCRBt1cPRWsUx
 M9QKDADVl9hWCXzJnm0Hp/v7OZsPAPnST9OZ1nZioizZEL+NkVBD3Gm8CWzn5L/PSUeAT1Il+w7
 SaTF1TDuKSSXFCLGWueIazEQ7OK9fqnulGwTT94Vh2x6hAlEnBDI5Pv7GPSuqlY/rQd8SgLIM+S
 Jk9i8Dz1QU0bM/uEs8xmsYNN7M665XkRU0JdhtzVPmJ15reRoTpbBA0otB7lA/UqeitaNFBbNiq
 b3MfwTGJEGt3VxXVu4HvepUYnnsPGNM3Xokn6rTlq7jNEjlI4OSJkYIjmiXolEwyggVjCkBpD8r
 hON6u1aIwo2ExyqbHQ54XgaiXiSDNQj9MQg01/wmaXI/ZXgadsPEAb+kCKUF9SAKLxWv+u5PwZH
 qHWdQ1Hp2K6TmR+/ZKCHQkU6Jca0OFvexF3p2YxYNu1VH6GWLOrL4erZN00Xz23GnywcXKzDDSE
 LoSDixYB4xN8Z2pjHFtBx7BWzpH9qHDqAF34Po4rWoHTtbFSrqvVc+JsZHaSCOeUur9xk=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

HPAGE_SIZE and HPAGE_SHIFT macro is written based on the 4KB PAGE_SIZE.
When this macro is used in some test, test result would be strange in
the system where PAGE_SIZE is more then 4KB.

Here is the example with transhuge-stress test with 16KB PAGE_SIZE:

  transhuge-stress: allocate 61073 transhuge pages, using 122146 MiB virtual memory and 1908 MiB of ram
    3.292 s/loop, 0.054 ms/page,  37106.002 MiB/s	2566 succeed, 58507 failed, 2566 different pages
    0.591 s/loop, 0.010 ms/page, 206850.792 MiB/s	   0 succeed, 61073 failed,    0 different pages
    0.527 s/loop, 0.009 ms/page, 231895.107 MiB/s	   0 succeed, 61073 failed,    0 different pages
    0.527 s/loop, 0.009 ms/page, 231839.704 MiB/s	   0 succeed, 61073 failed,    0 different pages
    0.528 s/loop, 0.009 ms/page, 231544.782 MiB/s	   0 succeed, 61073 failed,    0 different pages
    0.528 s/loop, 0.009 ms/page, 231462.074 MiB/s	   0 succeed, 61073 failed,    0 different pages
    0.527 s/loop, 0.009 ms/page, 231770.300 MiB/s	   0 succeed, 61073 failed,    0 different pages
    ...
  ok 1 Completed

Remove the HPAGE_SIZE and HPAGE_SHIFT macro and introduce pmd_pshift()
helper to get the HPAGE_SHIFT properly. For HPAGE_SIZE, use pre-existing
helper, pmd_psize().

Also, run the KSM_MERGE_TIME_HUGE_PAGES test with a size of 512 MiB,
which is the least common multiple of the PMD sizes for 4 KiB, 16 KiB,
and 64 KiB base pages. Since allocate_transhuge() allocates mappings in
PMD-sized units, the test may fail with the previous size of 100 MiB,
which is not a multiple of the PMD size when the base page size is
16 KiB or 64 KiB.

After this patch, output of transhuge-stress:

  transhuge-stress: allocate 3817 transhuge pages, using 122146 MiB virtual memory and 119 MiB of ram
    2.558 s/loop, 0.670 ms/page,  47755.759 MiB/s	2585 succeed, 1232 failed, 2585 different pages
    2.640 s/loop, 0.692 ms/page,  46268.432 MiB/s	2585 succeed, 1232 failed, 2585 different pages
    2.635 s/loop, 0.690 ms/page,  46360.298 MiB/s	2585 succeed, 1232 failed, 2585 different pages
    2.782 s/loop, 0.729 ms/page,  43899.795 MiB/s	2616 succeed, 1201 failed, 2616 different pages
    2.692 s/loop, 0.705 ms/page,  45380.876 MiB/s	2627 succeed, 1190 failed, 2627 different pages
    2.612 s/loop, 0.684 ms/page,  46765.812 MiB/s	2628 succeed, 1189 failed, 2628 different pages
    2.683 s/loop, 0.703 ms/page,  45520.990 MiB/s	2630 succeed, 1187 failed, 2630 different pages
    2.727 s/loop, 0.714 ms/page,  44789.321 MiB/s	2631 succeed, 1186 failed, 2631 different pages
    ...
  ok 1 Completed

Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/guard-regions.c    | 11 ++++++--
 tools/testing/selftests/mm/ksm_tests.c        | 16 +++++++-----
 tools/testing/selftests/mm/run_vmtests.sh     |  4 +--
 tools/testing/selftests/mm/transhuge-stress.c | 25 +++++++++++--------
 tools/testing/selftests/mm/vm_util.c          | 36 ++++++++++++++++++++++++---
 tools/testing/selftests/mm/vm_util.h          |  9 +++----
 6 files changed, 71 insertions(+), 30 deletions(-)

diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
index b724d62d2b75..eee29ef88cb2 100644
--- a/tools/testing/selftests/mm/guard-regions.c
+++ b/tools/testing/selftests/mm/guard-regions.c
@@ -2195,14 +2195,21 @@ TEST_F(guard_regions, pagemap_scan)
 TEST_F(guard_regions, collapse)
 {
 	const unsigned long page_size = self->page_size;
-	const unsigned long size = 2 * HPAGE_SIZE;
-	const unsigned long num_pages = size / page_size;
+	const uint64_t hpage_size = pmd_psize();
+	unsigned long size;
+	unsigned long num_pages;
 	char *ptr;
 	int i;
 
 	if (!thp_available())
 		SKIP(return, "Transparent Hugepages not available\n");
 
+	if (!hpage_size)
+		ksft_exit_fail_msg("reading hpage_size failed\n");
+
+	size = 2 * hpage_size;
+	num_pages = size / page_size;
+
 	/* Need file to be correct size for tests for non-anon. */
 	if (variant->backing != ANON_BACKED)
 		ASSERT_EQ(ftruncate(self->fd, size), 0);
diff --git a/tools/testing/selftests/mm/ksm_tests.c b/tools/testing/selftests/mm/ksm_tests.c
index 5fd7792a0d47..617e31138af0 100644
--- a/tools/testing/selftests/mm/ksm_tests.c
+++ b/tools/testing/selftests/mm/ksm_tests.c
@@ -521,19 +521,23 @@ static int ksm_merge_hugepages_time(int merge_type, int mapping, int prot,
 	struct timespec start_time, end_time;
 	unsigned long scan_time_ns;
 	int pagemap_fd, n_normal_pages, n_huge_pages;
+	const uint64_t hpage_size = pmd_psize();
 
 	if (!thp_is_enabled()) {
 		ksft_print_msg("Transparent Hugepages not available\n");
 		return KSFT_SKIP;
 	}
 
+	if (!hpage_size)
+		ksft_exit_fail_msg("reading hpage_size failed\n");
+
 	map_size *= MB;
 	size_t len = map_size;
 
-	len -= len % HPAGE_SIZE;
-	map_ptr_orig = mmap(NULL, len + HPAGE_SIZE, PROT_READ | PROT_WRITE,
+	len -= len % hpage_size;
+	map_ptr_orig = mmap(NULL, len + hpage_size, PROT_READ | PROT_WRITE,
 			MAP_ANONYMOUS | MAP_NORESERVE | MAP_PRIVATE, -1, 0);
-	map_ptr = map_ptr_orig + HPAGE_SIZE - (uintptr_t)map_ptr_orig % HPAGE_SIZE;
+	map_ptr = map_ptr_orig + hpage_size - (uintptr_t)map_ptr_orig % hpage_size;
 
 	if (map_ptr_orig == MAP_FAILED)
 		err(2, "initial mmap");
@@ -547,7 +551,7 @@ static int ksm_merge_hugepages_time(int merge_type, int mapping, int prot,
 
 	n_normal_pages = 0;
 	n_huge_pages = 0;
-	for (void *p = map_ptr; p < map_ptr + len; p += HPAGE_SIZE) {
+	for (void *p = map_ptr; p < map_ptr + len; p += hpage_size) {
 		if (allocate_transhuge(p, pagemap_fd) < 0)
 			n_normal_pages++;
 		else
@@ -578,11 +582,11 @@ static int ksm_merge_hugepages_time(int merge_type, int mapping, int prot,
 	ksft_print_msg("Average speed:  %.3f MiB/s\n", (map_size / MB) /
 					       ((double)scan_time_ns / NSEC_PER_SEC));
 
-	munmap(map_ptr_orig, len + HPAGE_SIZE);
+	munmap(map_ptr_orig, len + hpage_size);
 	return KSFT_PASS;
 
 err_out:
-	munmap(map_ptr_orig, len + HPAGE_SIZE);
+	munmap(map_ptr_orig, len + hpage_size);
 	return KSFT_FAIL;
 }
 
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 0935dbef4884..d7beedd5e178 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -378,8 +378,8 @@ fi
 CATEGORY="memfd_secret" run_test ./memfd_secret
 fi
 
-# KSM KSM_MERGE_TIME_HUGE_PAGES test with size of 100
-CATEGORY="ksm" run_test ./ksm_tests -H -s 100
+# KSM KSM_MERGE_TIME_HUGE_PAGES test with size of 512
+CATEGORY="ksm" run_test ./ksm_tests -H -s 512
 # KSM KSM_MERGE_TIME test with size of 100
 CATEGORY="ksm" run_test ./ksm_tests -P -s 100
 # KSM MADV_MERGEABLE test with 10 identical pages
diff --git a/tools/testing/selftests/mm/transhuge-stress.c b/tools/testing/selftests/mm/transhuge-stress.c
index 8eb0c5630e7e..40ca224a61f4 100644
--- a/tools/testing/selftests/mm/transhuge-stress.c
+++ b/tools/testing/selftests/mm/transhuge-stress.c
@@ -35,12 +35,17 @@ int main(int argc, char **argv)
 	size_t map_len;
 	int pagemap_fd;
 	int duration = 0;
+	const uint64_t hpage_size = pmd_psize();
+	const uint64_t hpage_shift = pmd_pshift();
 
 	ksft_print_header();
 
 	if (!thp_is_enabled())
 		ksft_exit_skip("Transparent Hugepages not available\n");
 
+	if (!hpage_size || !hpage_shift)
+		ksft_exit_fail_msg("reading hpage_size failed\n");
+
 	ram = sysconf(_SC_PHYS_PAGES);
 	if (ram > SIZE_MAX / psize() / 4)
 		ram = SIZE_MAX / 4;
@@ -70,23 +75,23 @@ int main(int argc, char **argv)
 	}
 
 	warnx("allocate %zd transhuge pages, using %zd MiB virtual memory"
-	      " and %zd MiB of ram", len >> HPAGE_SHIFT, len >> 20,
-	      ram >> (20 + HPAGE_SHIFT - pshift() - 1));
+	      " and %zd MiB of ram", len >> hpage_shift, len >> 20,
+	      ram >> (20 + hpage_shift - pshift() - 1));
 
 	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
 	if (pagemap_fd < 0)
 		ksft_exit_fail_msg("open pagemap\n");
 
-	len -= len % HPAGE_SIZE;
-	ptr = mmap(NULL, len + HPAGE_SIZE, PROT_RW, mmap_flags, backing_fd, 0);
+	len -= len % hpage_size;
+	ptr = mmap(NULL, len + hpage_size, PROT_RW, mmap_flags, backing_fd, 0);
 	if (ptr == MAP_FAILED)
 		ksft_exit_fail_msg("initial mmap");
-	ptr += HPAGE_SIZE - (uintptr_t)ptr % HPAGE_SIZE;
+	ptr += hpage_size - (uintptr_t)ptr % hpage_size;
 
 	if (madvise(ptr, len, MADV_HUGEPAGE))
 		ksft_exit_fail_msg("MADV_HUGEPAGE");
 
-	map_len = ram >> (HPAGE_SHIFT - 1);
+	map_len = ram >> (hpage_shift - 1);
 	map = malloc(map_len);
 	if (!map)
 		ksft_exit_fail_msg("map malloc\n");
@@ -99,7 +104,7 @@ int main(int argc, char **argv)
 		memset(map, 0, map_len);
 
 		clock_gettime(CLOCK_MONOTONIC, &a);
-		for (p = ptr; p < ptr + len; p += HPAGE_SIZE) {
+		for (p = ptr; p < ptr + len; p += hpage_size) {
 			int64_t pfn;
 
 			pfn = allocate_transhuge(p, pagemap_fd);
@@ -107,7 +112,7 @@ int main(int argc, char **argv)
 			if (pfn < 0) {
 				nr_failed++;
 			} else {
-				size_t idx = pfn >> (HPAGE_SHIFT - pshift());
+				size_t idx = pfn >> (hpage_shift - pshift());
 
 				nr_succeed++;
 				if (idx >= map_len) {
@@ -123,7 +128,7 @@ int main(int argc, char **argv)
 			}
 
 			/* split transhuge page, keep last page */
-			if (madvise(p, HPAGE_SIZE - psize(), MADV_DONTNEED))
+			if (madvise(p, hpage_size - psize(), MADV_DONTNEED))
 				ksft_exit_fail_msg("MADV_DONTNEED");
 		}
 		clock_gettime(CLOCK_MONOTONIC, &b);
@@ -131,7 +136,7 @@ int main(int argc, char **argv)
 
 		ksft_print_msg("%.3f s/loop, %.3f ms/page, %10.3f MiB/s\t"
 			       "%4d succeed, %4d failed, %4d different pages\n",
-			       s, s * 1000 / (len >> HPAGE_SHIFT), len / s / (1 << 20),
+			       s, s * 1000 / (len >> hpage_shift), len / s / (1 << 20),
 			       nr_succeed, nr_failed, nr_pages);
 
 		if (duration > 0 && b.tv_sec - start.tv_sec >= duration) {
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index e712a980851c..fd1432dc6152 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -21,6 +21,8 @@
 
 unsigned int __page_size;
 unsigned int __page_shift;
+uint64_t __pmd_psize;
+uint64_t __pmd_pshift;
 
 uint64_t pagemap_get_entry(int fd, char *start)
 {
@@ -161,6 +163,9 @@ uint64_t pmd_psize(void)
 	char buf[20];
 	ssize_t num_read;
 
+	if (__pmd_psize)
+		return __pmd_psize;
+
 	fd = open(PMD_SIZE_FILE_PATH, O_RDONLY);
 	if (fd == -1)
 		return 0;
@@ -173,7 +178,25 @@ uint64_t pmd_psize(void)
 	buf[num_read] = '\0';
 	close(fd);
 
-	return strtoul(buf, NULL, 10);
+	__pmd_psize = strtoul(buf, NULL, 10);
+
+	return __pmd_psize;
+}
+
+uint64_t pmd_pshift(void)
+{
+	if (__pmd_pshift)
+		return __pmd_pshift;
+
+	if (!__pmd_psize)
+		__pmd_psize = pmd_psize();
+
+	if (!__pmd_psize)
+		return 0;
+
+	__pmd_pshift = ffsl(__pmd_psize) - 1;
+
+	return __pmd_pshift;
 }
 
 unsigned long rss_anon(void)
@@ -452,14 +475,19 @@ bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size
 int64_t allocate_transhuge(void *ptr, int pagemap_fd)
 {
 	uint64_t ent[2];
+	const uint64_t hpage_size = pmd_psize();
+	const uint64_t hpage_shift = pmd_pshift();
+
+	if (!hpage_size || !hpage_shift)
+		return -1;
 
 	/* drop pmd */
-	if (mmap(ptr, HPAGE_SIZE, PROT_READ | PROT_WRITE,
+	if (mmap(ptr, hpage_size, PROT_READ | PROT_WRITE,
 		 MAP_FIXED | MAP_ANONYMOUS |
 		 MAP_NORESERVE | MAP_PRIVATE, -1, 0) != ptr)
 		ksft_exit_fail_msg("mmap transhuge\n");
 
-	if (madvise(ptr, HPAGE_SIZE, MADV_HUGEPAGE))
+	if (madvise(ptr, hpage_size, MADV_HUGEPAGE))
 		ksft_exit_fail_msg("MADV_HUGEPAGE\n");
 
 	/* allocate transparent huge page */
@@ -471,7 +499,7 @@ int64_t allocate_transhuge(void *ptr, int pagemap_fd)
 
 	if (PAGEMAP_PRESENT(ent[0]) && PAGEMAP_PRESENT(ent[1]) &&
 	    PAGEMAP_PFN(ent[0]) + 1 == PAGEMAP_PFN(ent[1]) &&
-	    !(PAGEMAP_PFN(ent[0]) & ((1 << (HPAGE_SHIFT - pshift())) - 1)))
+	    !(PAGEMAP_PFN(ent[0]) & ((1 << (hpage_shift - pshift())) - 1)))
 		return PAGEMAP_PFN(ent[0]);
 
 	return -1;
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index a40e40c820ef..71af4804f8f2 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -31,6 +31,8 @@
 
 extern unsigned int __page_size;
 extern unsigned int __page_shift;
+extern uint64_t __pmd_psize;
+extern uint64_t __pmd_pshift;
 
 /*
  * Represents an open fd and PROCMAP_QUERY state for binary (via ioctl)
@@ -89,6 +91,7 @@ unsigned long pagemap_get_pfn(int fd, char *start);
 void clear_softdirty(void);
 bool check_for_pattern(FILE *fp, const char *pattern, char *buf, size_t len);
 uint64_t pmd_psize(void);
+uint64_t pmd_pshift(void);
 unsigned long rss_anon(void);
 bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size);
 bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size);
@@ -157,12 +160,6 @@ int ksm_stop(void);
 int get_hardware_corrupted_size(unsigned long *val);
 int unpoison_memory(unsigned long pfn);
 
-/*
- * On ppc64 this will only work with radix 2M hugepage size
- */
-#define HPAGE_SHIFT 21
-#define HPAGE_SIZE (1 << HPAGE_SHIFT)
-
 #define PAGEMAP_PRESENT(ent)	(((ent) & (1ull << 63)) != 0)
 #define PAGEMAP_PFN(ent)	((ent) & ((1ull << 55) - 1))
 

-- 
2.43.0


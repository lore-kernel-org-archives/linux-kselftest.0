Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA54043E9C3;
	Mon,  7 Sep 2026 08:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769187; cv=none; b=NalOb/HUM8DmC8KC4BJuq5FR4CBDBHsoli0aYtKlk2n7lCYZFSq761uQjT2rK0SSKXYMa7RUfo7Uu11TruGh/IE8mYgtN+pQtn4f0HuhDzbIUULN4+QbKDqJVMMZ6lNV1A1m/PnA0KdFsIT7+d/Uov4T0HyKxGLCo97AZ0BD000=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769187; c=relaxed/simple;
	bh=YMxvpBXXES/5Be1PM7mR4Ou5S+++GkRnpdpj19mAzVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FPiF+eYvkhjUx/T11N/PDmExwqbl+X68ru40BjZH05KXbOklaIQ2dWRpM+eVvLc5cx0FCq8sIJye8ZZ9sQAY54PpoVXn2Lto9jpL61HllTw4e9Id2lw65DPTCBXRAEOSsw3st0WC7fWMv5CSsTctX9fMBEULtHXaKRqy6ViITsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UJuvfU9d; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UJuvfU9d"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0557A1BCB;
	Mon,  7 Sep 2026 01:19:39 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28EFB3F7D8;
	Mon,  7 Sep 2026 01:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788769182; bh=YMxvpBXXES/5Be1PM7mR4Ou5S+++GkRnpdpj19mAzVE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UJuvfU9dmBPHjlicnGnG9INWQtct5wrTCoiuI0cPdx43hW8RJAqaNI2VbEWbTxqnw
	 K+dKvgqNMLOMPc6i6cCyi7ICuVHIAdvEkoF7Z7KOlTzmoI5gUvsX11j518KUy1NXww
	 /WUU1gIPqtvRbvMIoc6tI1Lz5AyxLz/n33OBsGy8=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 07 Sep 2026 09:19:28 +0100
Subject: [PATCH v5 3/3] kselftest: mm: introduce alloc_isolated_mem()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-fix_split-v5-3-822b810458bc@arm.com>
References: <20260907-fix_split-v5-0-822b810458bc@arm.com>
In-Reply-To: <20260907-fix_split-v5-0-822b810458bc@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10091; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=YMxvpBXXES/5Be1PM7mR4Ou5S+++GkRnpdpj19mAzVE=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqnnOSBC1lHBxEGcvQkLeMnpFIofQkznfIuA16p
 cVk7ygMPoeJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCap5zkgAKCRBt1cPRWsUx
 M4KZC/9F3MiEPCRk2SO8QtTFyhFyRIiLkt4wNWwFynThNzpJuekgBxopKVyX57Fk88iI/i8UBWo
 MiXsVnrd+gJYt3cl9Gy02pLDS5NAYsTYaoCAn8ZFrB5Koe933x6+QMxY10aWQJfzC+XFtPL9TPZ
 Z7lzNFAFv+XadZ8fT8XW9zOnpW5W0bEw20Z4tDnQe4y18rhv9Rrap6yEz79e95oD8jGpjGbVXgx
 o9XSVgQttbAqX3LM7bEeTKcTxutOXGRdEpH8aFl57sHieF9YKM+mTNRS6x8V6TPujwGrCE8O7Zu
 4Q+8agAoFWzRFhutmobC263m4poZILM6CnssK8bYQC1A/Oycdjv0zuQUZQpoIDHvmDc2TLfNsK+
 VCcHc/dkLRVFiIIktblQVlNUoMW+waxRkU0RVAYNvFIs2wiOrvIiXmzTmeRctGpUWacfRPyNy6L
 q6eIPzWUNiei3Ceig+JyfwhdLqds+ZTZRc7FtAR/TCuerdpVNhgP8JE1gr3kTyVz2dZyc=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

Some MM tests use memalign() to allocate memory. However, the resulting
memory area may unexpectedly merge with an adjacent VMA, causing tests
that inspect it through /proc/self/smaps to fail.

Eliminate this potential source of test flakiness by introducing
alloc_isolated_mem(), which places guard regions before and after the
allocated area to prevent unexpected VMA merging.

Replace memalign() with this helper and use the helper in
softdirty_supported() instead of mmap().

Link: https://lore.kernel.org/all/apHDdRSr59mva3ey@lucifer/ [0]
Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/pagemap_ioctl.c        | 18 +++---
 tools/testing/selftests/mm/soft-dirty.c           |  6 +-
 tools/testing/selftests/mm/split_huge_page_test.c |  8 +--
 tools/testing/selftests/mm/vm_util.c              | 67 +++++++++++++++++++++--
 tools/testing/selftests/mm/vm_util.h              |  2 +
 5 files changed, 81 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
index eadc7159ca5b..7ed5b8fb3b25 100644
--- a/tools/testing/selftests/mm/pagemap_ioctl.c
+++ b/tools/testing/selftests/mm/pagemap_ioctl.c
@@ -792,9 +792,9 @@ void *gethugepage(int map_size)
 	int ret;
 	char *map;
 
-	map = memalign(hpage_size, map_size);
+	map = alloc_isolated_mem(hpage_size, map_size);
 	if (!map)
-		ksft_exit_fail_msg("memalign failed %d %s\n", errno, strerror(errno));
+		ksft_exit_fail_msg("alloc_isolated_mem failed %d %s\n", errno, strerror(errno));
 
 	ret = madvise(map, map_size, MADV_HUGEPAGE);
 	if (ret)
@@ -856,7 +856,7 @@ int hpage_unit_tests(void)
 
 		/* 4. only middle page written */
 		wp_free(map, map_size);
-		free(map);
+		free_isolated_mem(map, map_size);
 		map = gethugepage(map_size);
 		wp_init(map, map_size);
 		wp_addr_range(map, map_size);
@@ -871,7 +871,7 @@ int hpage_unit_tests(void)
 				 "%s only middle page written\n", __func__);
 
 		wp_free(map, map_size);
-		free(map);
+		free_isolated_mem(map, map_size);
 	} else {
 		ksft_test_result_skip("%s all new huge page must be written\n", __func__);
 		ksft_test_result_skip("%s all the huge page must not be written\n", __func__);
@@ -898,7 +898,7 @@ int hpage_unit_tests(void)
 				 vec[0].start == (uintptr_t)(map + map_size/2),
 				 "%s clear first half of huge page\n", __func__);
 		wp_free(map, map_size);
-		free(map);
+		free_isolated_mem(map, map_size);
 	} else {
 		ksft_test_result_skip("%s clear first half of huge page\n", __func__);
 	}
@@ -927,7 +927,7 @@ int hpage_unit_tests(void)
 				 "%s clear first half of huge page with limited buffer\n",
 				 __func__);
 		wp_free(map, map_size);
-		free(map);
+		free_isolated_mem(map, map_size);
 	} else {
 		ksft_test_result_skip("%s clear first half of huge page with limited buffer\n",
 				      __func__);
@@ -955,7 +955,7 @@ int hpage_unit_tests(void)
 		ksft_test_result(ret == 1 && LEN(vec[0]) == vec_size/2,
 				 "%s clear second half huge page\n", __func__);
 		wp_free(map, map_size);
-		free(map);
+		free_isolated_mem(map, map_size);
 	} else {
 		ksft_test_result_skip("%s clear second half huge page\n", __func__);
 	}
@@ -988,7 +988,7 @@ int hpage_unit_tests(void)
 				 "%s get half huge page\n", __func__);
 
 		wp_free(map, map_size);
-		free(map);
+		free_isolated_mem(map, map_size);
 	} else {
 		ksft_test_result_skip("%s get half huge page\n", __func__);
 		ksft_test_result_skip("%s get half huge page\n", __func__);
@@ -1702,7 +1702,7 @@ int main(int __attribute__((unused)) argc, char *argv[])
 		wp_addr_range(map, hpage_size);
 		base_tests("Huge page testing:", map, hpage_size, 0);
 		wp_free(map, hpage_size);
-		free(map);
+		free_isolated_mem(map, hpage_size);
 	} else {
 		base_tests("Huge page testing:", NULL, 0, 1);
 	}
diff --git a/tools/testing/selftests/mm/soft-dirty.c b/tools/testing/selftests/mm/soft-dirty.c
index 5f278913c4d7..b6fad38c8bee 100644
--- a/tools/testing/selftests/mm/soft-dirty.c
+++ b/tools/testing/selftests/mm/soft-dirty.c
@@ -92,9 +92,9 @@ static void test_hugepage(int pagemap_fd, int pagesize)
 	if (!hpage_len)
 		ksft_exit_fail_msg("Reading PMD pagesize failed");
 
-	map = memalign(hpage_len, hpage_len);
+	map = alloc_isolated_mem(hpage_len, hpage_len);
 	if (!map)
-		ksft_exit_fail_msg("memalign failed\n");
+		ksft_exit_fail_msg("alloc_isolated_mem failed\n");
 
 	ret = madvise(map, hpage_len, MADV_HUGEPAGE);
 	if (ret)
@@ -130,7 +130,7 @@ static void test_hugepage(int pagemap_fd, int pagesize)
 		ksft_test_result_skip("Test %s huge page allocation\n", __func__);
 		ksft_test_result_skip("Test %s huge page dirty bit\n", __func__);
 	}
-	free(map);
+	free_isolated_mem(map, hpage_len);
 }
 
 static void test_mprotect(int pagemap_fd, int pagesize, bool anon)
diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index cba327f77873..7865b0bab011 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -153,7 +153,7 @@ static char *allocate_zero_filled_hugepage(size_t len)
 	char *result;
 	size_t i;
 
-	result = memalign(pmd_pagesize, len);
+	result = alloc_isolated_mem(pmd_pagesize, len);
 	if (!result) {
 		printf("Fail to allocate memory\n");
 		exit(EXIT_FAILURE);
@@ -219,7 +219,7 @@ static void split_pmd_zero_pages(void)
 	one_page = allocate_zero_filled_hugepage(len);
 	verify_rss_anon_split_huge_page_all_zeroes(one_page, nr_hpages, len);
 	ksft_test_result_pass("Split zero filled huge pages successful\n");
-	free(one_page);
+	free_isolated_mem(one_page, len);
 }
 
 static void split_pmd_thp_to_order(int order)
@@ -228,7 +228,7 @@ static void split_pmd_thp_to_order(int order)
 	size_t len = 4 * pmd_pagesize;
 	size_t i;
 
-	one_page = memalign(pmd_pagesize, len);
+	one_page = alloc_isolated_mem(pmd_pagesize, len);
 	if (!one_page)
 		ksft_exit_fail_msg("Fail to allocate memory: %s\n", strerror(errno));
 
@@ -262,7 +262,7 @@ static void split_pmd_thp_to_order(int order)
 		ksft_exit_fail_msg("Still AnonHugePages not split\n");
 
 	ksft_test_result_pass("Split huge pages to order %d successful\n", order);
-	free(one_page);
+	free_isolated_mem(one_page, len);
 }
 
 static void split_pte_mapped_thp(void)
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index dc62ce84e143..159d627ae3b0 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -19,6 +19,11 @@
 #define KPAGEFLAGS_PATH "/proc/kpageflags"
 #define MAX_NR_ORDERS 20
 
+#define ALIGN(x, a)		(((x) + (a - 1)) & (~((a) - 1)))
+#define ALIGN_PTR(p, a)		((typeof(p))ALIGN((unsigned long)(p), a))
+#define IS_ALIGNED(x, a)	(((x) & ((typeof(x))(a) - 1)) == 0)
+#define PTR_ALIGNED(p, a)	(IS_ALIGNED((unsigned long)(p), a))
+
 unsigned int __page_size;
 unsigned int __page_shift;
 
@@ -514,6 +519,61 @@ int64_t allocate_transhuge(void *ptr, int pagemap_fd)
 	return -1;
 }
 
+void *alloc_isolated_mem(size_t align, size_t size)
+{
+	char *ptr, *guard, *addr_align;
+	size_t map_size, guard_size, page_size = psize();
+	size_t padding;
+
+	if (__builtin_popcountll((unsigned long)align) > 1)
+		return NULL;
+
+	align = (align > page_size) ? align : page_size;
+	guard_size = page_size;
+	size = ALIGN(size, page_size);
+	map_size = size + align + guard_size;
+
+	ptr = mmap(NULL, map_size, PROT_READ | PROT_WRITE,
+		   MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	if (ptr == MAP_FAILED)
+		return NULL;
+
+	addr_align = PTR_ALIGNED(ptr, align) ? ptr + align : ALIGN_PTR(ptr, align);
+	padding = addr_align - guard_size - ptr;
+	if (padding) {
+		munmap(ptr, padding);
+		map_size -= padding;
+		ptr += padding;
+	}
+
+	guard = ptr;
+	if (mprotect(guard, guard_size, PROT_NONE))
+		goto err_out;
+
+	guard = addr_align + size;
+	if (mprotect(guard, guard_size, PROT_NONE))
+		goto err_out;
+
+	padding = (ptr + map_size) - (guard + guard_size);
+	if (padding)
+		munmap(guard + guard_size, padding);
+
+	return addr_align;
+
+err_out:
+	munmap(ptr, map_size);
+	return NULL;
+}
+
+void free_isolated_mem(void *addr, size_t size)
+{
+	int guard_size, page_size = psize();
+
+	guard_size = page_size;
+	munmap((char *)addr - guard_size,
+	       guard_size * 2 + ALIGN(size, page_size));
+}
+
 int pageflags_get(unsigned long pfn, int kpageflags_fd, uint64_t *flags)
 {
 	size_t count;
@@ -618,13 +678,12 @@ bool softdirty_supported(void)
 	const size_t pagesize = getpagesize();
 
 	/* New mappings are expected to be marked with VM_SOFTDIRTY (sd). */
-	addr = mmap(0, pagesize, PROT_READ | PROT_WRITE,
-		    MAP_ANONYMOUS | MAP_PRIVATE, 0, 0);
-	if (addr == MAP_FAILED)
+	addr = alloc_isolated_mem(pagesize, pagesize);
+	if (!addr)
 		ksft_exit_fail_msg("mmap failed\n");
 
 	supported = check_vmflag(addr, "sd");
-	munmap(addr, pagesize);
+	free_isolated_mem(addr, pagesize);
 	return supported;
 }
 
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index f19bd17817e5..ce1da9a55310 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -95,6 +95,8 @@ bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
 bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size);
 bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size);
 int64_t allocate_transhuge(void *ptr, int pagemap_fd);
+void *alloc_isolated_mem(size_t align, size_t size);
+void free_isolated_mem(void *addr, size_t size);
 int pageflags_get(unsigned long pfn, int kpageflags_fd, uint64_t *flags);
 int gather_folio_orders(char *vaddr_start, size_t len,
 		int pagemap_fd, int kpageflags_fd, int orders[], int nr_orders);

-- 
2.43.0


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301482C237E;
	Fri,  9 Oct 2026 01:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791509268; cv=none; b=UJCyo3bB72qUDyS7iBtxZzK2D0l8cVDQ65G+LXx1OiTpS4fcna/JNbtbj7JUhZIUaoboUV3bFCBCn9q/h6RdC+HGRSeLIIFVxhcf6bt6os1j0Ds4UtTQtkVgXDE9PUE6xCCJFDge6VZk/MKQ+UovqAe5HFJyzjMKnznMO11GKa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791509268; c=relaxed/simple;
	bh=F1xoqEdRVmInZCpA+KY9hrvrlw2qeTx0nVtLgqVmX2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K6PmNjgOdgPTJju7Eh2oPt5M5AEroxaipuuk90OqHAKrJ7Is32Eht2/CgDscj61XVs+shrQwb885lL/bRLY+fyehYPtmjHna7SZvXGtkCKmK7iJKuat2HFdOiShseRx7XGauhspAnQI9D/79uvs1r0PpsepPivBKBR8OMes5BC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=heOC3vGW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="heOC3vGW"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 067B9175D;
	Thu,  8 Oct 2026 18:27:42 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A25D83F8C6;
	Thu,  8 Oct 2026 18:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791509265; bh=F1xoqEdRVmInZCpA+KY9hrvrlw2qeTx0nVtLgqVmX2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=heOC3vGW29UIuIgO0tntyEmWlku47aeXsiQuRneRkY5JNasUd20+XRNbN+/0cYehs
	 aNNbtHifx35/Qd83Bhq0KoR+X6iUHUgik7OWeflyHvxbW2QV90v6plSMfldUt0SvHM
	 jkdyLYqpHRgPihIMs8k5WxAplZ+LS/xyQ6TGJMH0=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 09 Oct 2026 02:27:32 +0100
Subject: [PATCH v5 1/3] kselftest: mm: rename read_pmd_pagesize() to
 pmd_psize()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-fix_hpage_macro-v5-1-54378ae45add@arm.com>
References: <20261009-fix_hpage_macro-v5-0-54378ae45add@arm.com>
In-Reply-To: <20261009-fix_hpage_macro-v5-0-54378ae45add@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=16636; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=F1xoqEdRVmInZCpA+KY9hrvrlw2qeTx0nVtLgqVmX2U=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqyEMIYrkrWGx693G6DoP1EqtoT0Q/eD3MLW6tY
 UCOF1TjEASJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCashDCAAKCRBt1cPRWsUx
 M2MBC/95EeJFckgdPZjZfAJOKEHOOXnoRxXv3rQXK1Kkp04hYQ87Idjed8eKBx3s4VjB7Pu/IlZ
 vZo225FvAF1qfg4iPdcWSsl7AqTtzgQHTBb6Sg7zDBrCR7cM+6mQr+7q+yrEhUjtFPFyKObqhyf
 XwDiBCYwix0UOSHRB43gMDl47PaXkzm9P0Lb5TN+HcWP/nxXF4yF/w5zZl4ioPC/o+wJBOZLpFM
 xR6sQZ8FagzgH62o7AIomI7ILA3U3swKub2Zjin0VjFZn72WEsfI4Ja3mG2mtah6dOdgX6hBWX2
 cELR2uk8mJsGev4B4JMdYdMjiIK7TyJWOr0QLANfUEZ8uda1MjDC7QA47tnYrm1fi7GbXAdr03D
 P/JhM/Js3nvIkQzWSxB+70OTWGz1qVOfQLYdOaGdfZN8WJndNfdVLCSY66ofsH2hguOy51XHEeo
 qXyswoFcT73IKnzTxR3b3zRhpMwd9Dc2spXifod7PBAl9O3AqOpUCHJ22+miWmbZxkbF8=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

For consistency with psize(), rename read_pmd_pagesize() to
pmd_psize(). There is no functional change.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/cow.c                   |  2 +-
 tools/testing/selftests/mm/folio_split_race_test.c |  2 +-
 tools/testing/selftests/mm/hmm-tests.c             | 22 +++++++++++-----------
 tools/testing/selftests/mm/khugepaged.c            |  2 +-
 tools/testing/selftests/mm/khugepaged_race.c       |  2 +-
 tools/testing/selftests/mm/khugepaged_sync_check.c |  2 +-
 tools/testing/selftests/mm/migration.c             |  4 ++--
 tools/testing/selftests/mm/mkdirty.c               |  2 +-
 tools/testing/selftests/mm/pagemap_ioctl.c         |  2 +-
 tools/testing/selftests/mm/prctl_thp_disable.c     |  4 ++--
 tools/testing/selftests/mm/process_madv.c          |  2 +-
 tools/testing/selftests/mm/soft-dirty.c            |  2 +-
 tools/testing/selftests/mm/split_huge_page_test.c  |  2 +-
 tools/testing/selftests/mm/uffd-common.c           |  6 +++---
 tools/testing/selftests/mm/uffd-unit-tests.c       |  8 ++++----
 tools/testing/selftests/mm/uffd-wp-mremap.c        |  2 +-
 tools/testing/selftests/mm/vm_util.c               |  4 ++--
 tools/testing/selftests/mm/vm_util.h               |  2 +-
 18 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
index 3264a828575bd..c8c26b26ff629 100644
--- a/tools/testing/selftests/mm/cow.c
+++ b/tools/testing/selftests/mm/cow.c
@@ -1888,7 +1888,7 @@ int main(int argc, char **argv)
 	thp_save_settings();
 
 	pagesize = getpagesize();
-	pmdsize = read_pmd_pagesize();
+	pmdsize = pmd_psize();
 	if (pmdsize) {
 		/* Only if THP is supported. */
 		thp_read_settings(&default_settings);
diff --git a/tools/testing/selftests/mm/folio_split_race_test.c b/tools/testing/selftests/mm/folio_split_race_test.c
index 1a9840b73e618..4aa173bffa89a 100644
--- a/tools/testing/selftests/mm/folio_split_race_test.c
+++ b/tools/testing/selftests/mm/folio_split_race_test.c
@@ -234,7 +234,7 @@ int main(void)
 	ksft_print_header();
 
 	page_size = getpagesize();
-	pmd_pagesize = read_pmd_pagesize();
+	pmd_pagesize = pmd_psize();
 
 	if (!thp_available() || !pmd_pagesize)
 		ksft_exit_skip("Transparent Hugepages not available\n");
diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index e5f273ca84c10..02bec1ee54e14 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -568,7 +568,7 @@ TEST_F(hmm, anon_write_child)
 
 	for (migrate = 0; migrate < 2; ++migrate) {
 		for (use_thp = 0; use_thp < 2; ++use_thp) {
-			npages = ALIGN(use_thp ? read_pmd_pagesize() : HMM_BUFFER_SIZE,
+			npages = ALIGN(use_thp ? pmd_psize() : HMM_BUFFER_SIZE,
 				       self->page_size) >> self->page_shift;
 			ASSERT_NE(npages, 0);
 			size = npages << self->page_shift;
@@ -729,7 +729,7 @@ TEST_F(hmm, anon_write_huge)
 	int *ptr;
 	int ret;
 
-	size = 2 * read_pmd_pagesize();
+	size = 2 * pmd_psize();
 
 	buffer = hmm_buffer_alloc(size, size,
 				  PROT_READ | PROT_WRITE,
@@ -1940,7 +1940,7 @@ TEST_F(hmm, migrate_anon_huge_empty)
 	int *ptr;
 	int ret;
 
-	size = read_pmd_pagesize();
+	size = pmd_psize();
 
 	buffer = hmm_buffer_alloc(2 * size, size,
 				  PROT_READ,
@@ -1983,7 +1983,7 @@ TEST_F(hmm, migrate_anon_huge_zero)
 	int ret;
 	int val;
 
-	size = read_pmd_pagesize();
+	size = pmd_psize();
 
 	buffer = hmm_buffer_alloc(2 * size, size,
 				  PROT_READ,
@@ -2037,7 +2037,7 @@ TEST_F(hmm, migrate_anon_huge_free)
 	int *ptr;
 	int ret;
 
-	size = read_pmd_pagesize();
+	size = pmd_psize();
 
 	buffer = hmm_buffer_alloc(2 * size, size,
 				  PROT_READ | PROT_WRITE,
@@ -2090,7 +2090,7 @@ TEST_F(hmm, migrate_anon_huge_fault)
 	int *ptr;
 	int ret;
 
-	size = read_pmd_pagesize();
+	size = pmd_psize();
 
 	buffer = hmm_buffer_alloc(2 * size, size,
 				  PROT_READ | PROT_WRITE,
@@ -2160,7 +2160,7 @@ TEST_F(hmm, migrate_partial_unmap_fault)
 {
 	struct hmm_buffer *buffer;
 	unsigned long npages;
-	unsigned long size = read_pmd_pagesize();
+	unsigned long size = pmd_psize();
 	unsigned long unmap_size;
 	unsigned long offsets[3];
 	unsigned long i;
@@ -2225,7 +2225,7 @@ TEST_F(hmm, migrate_remap_fault)
 {
 	struct hmm_buffer *buffer;
 	unsigned long npages;
-	unsigned long size = read_pmd_pagesize();
+	unsigned long size = pmd_psize();
 	unsigned long offsets[3];
 	unsigned long i;
 	void *old_ptr, *new_ptr = NULL;
@@ -2322,7 +2322,7 @@ TEST_F(hmm, migrate_anon_huge_err)
 	int *ptr;
 	int ret;
 
-	size = read_pmd_pagesize();
+	size = pmd_psize();
 
 	buffer = hmm_buffer_alloc(2 * size, 2 * size,
 				  PROT_READ | PROT_WRITE,
@@ -2412,7 +2412,7 @@ TEST_F(hmm, migrate_anon_huge_zero_err)
 	int *ptr;
 	int ret;
 
-	size = read_pmd_pagesize();
+	size = pmd_psize();
 
 	buffer = hmm_buffer_alloc(2 * size, 2 * size,
 				  PROT_READ,
@@ -2608,7 +2608,7 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
 TEST_F_TIMEOUT(hmm, benchmark_thp_migration, 120)
 {
 	struct benchmark_results thp_results, regular_results;
-	size_t thp_size = read_pmd_pagesize();
+	size_t thp_size = pmd_psize();
 	int iterations = 5;
 
 	if (!thp_size)
diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 1bc7acc66a469..195adb1875e5e 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1684,7 +1684,7 @@ int main(int argc, char **argv)
 		ksft_exit_skip("Transparent Hugepages not available\n");
 
 	page_size = getpagesize();
-	hpage_pmd_size = read_pmd_pagesize();
+	hpage_pmd_size = pmd_psize();
 	if (!hpage_pmd_size)
 		ksft_exit_fail_msg("Reading PMD pagesize failed\n");
 	hpage_pmd_nr = hpage_pmd_size / page_size;
diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
index abb0678522cd9..6cd68cda07624 100644
--- a/tools/testing/selftests/mm/khugepaged_race.c
+++ b/tools/testing/selftests/mm/khugepaged_race.c
@@ -371,7 +371,7 @@ int main(int argc, char **argv)
 		ksft_exit_skip("Transparent Hugepages not available\n");
 
 	page_size = getpagesize();
-	hpage_pmd_size = read_pmd_pagesize();
+	hpage_pmd_size = pmd_psize();
 	if (!hpage_pmd_size)
 		ksft_exit_fail_msg("Reading PMD pagesize failed\n");
 
diff --git a/tools/testing/selftests/mm/khugepaged_sync_check.c b/tools/testing/selftests/mm/khugepaged_sync_check.c
index 28a9b1ff5d447..f31b0987d90c3 100644
--- a/tools/testing/selftests/mm/khugepaged_sync_check.c
+++ b/tools/testing/selftests/mm/khugepaged_sync_check.c
@@ -140,7 +140,7 @@ int main(void)
 		ksft_exit_skip("Order %d is not a supported anon THP order\n",
 			       TARGET_ORDER);
 
-	hpage_pmd_size = read_pmd_pagesize();
+	hpage_pmd_size = pmd_psize();
 	if (!hpage_pmd_size)
 		ksft_exit_fail_msg("Reading PMD pagesize failed\n");
 	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
index d1d0989ed2cad..f268751736740 100644
--- a/tools/testing/selftests/mm/migration.c
+++ b/tools/testing/selftests/mm/migration.c
@@ -228,7 +228,7 @@ TEST_F_TIMEOUT(migration, private_anon_thp, 2*RUNTIME)
 	if (!thp_is_enabled())
 		SKIP(return, "Transparent Hugepages not available");
 
-	pmdsize = read_pmd_pagesize();
+	pmdsize = pmd_psize();
 	if (!pmdsize)
 		SKIP(return, "Reading PMD pagesize failed");
 
@@ -262,7 +262,7 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
 	if (!thp_is_enabled())
 		SKIP(return, "Transparent Hugepages not available");
 
-	pmdsize = read_pmd_pagesize();
+	pmdsize = pmd_psize();
 	if (!pmdsize)
 		SKIP(return, "Reading PMD pagesize failed");
 
diff --git a/tools/testing/selftests/mm/mkdirty.c b/tools/testing/selftests/mm/mkdirty.c
index 68dd447a54542..49ef643a6e639 100644
--- a/tools/testing/selftests/mm/mkdirty.c
+++ b/tools/testing/selftests/mm/mkdirty.c
@@ -330,7 +330,7 @@ int main(void)
 	int err, tests = 2;
 
 	pagesize = getpagesize();
-	thpsize = read_pmd_pagesize();
+	thpsize = pmd_psize();
 	if (thpsize) {
 		ksft_print_msg("[INFO] detected THP size: %zu KiB\n",
 			       thpsize / 1024);
diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
index 03898b4f6cdab..e9718716feabc 100644
--- a/tools/testing/selftests/mm/pagemap_ioctl.c
+++ b/tools/testing/selftests/mm/pagemap_ioctl.c
@@ -1653,7 +1653,7 @@ int main(int __attribute__((unused)) argc, char *argv[])
 	ksft_print_header();
 
 	page_size = getpagesize();
-	hpage_size = read_pmd_pagesize();
+	hpage_size = pmd_psize();
 
 	if (init_uffd())
 		ksft_exit_skip("Failed to initialize userfaultfd\n");
diff --git a/tools/testing/selftests/mm/prctl_thp_disable.c b/tools/testing/selftests/mm/prctl_thp_disable.c
index f9ec1408a6e30..5b7fc68a4072c 100644
--- a/tools/testing/selftests/mm/prctl_thp_disable.c
+++ b/tools/testing/selftests/mm/prctl_thp_disable.c
@@ -132,7 +132,7 @@ FIXTURE_SETUP(prctl_thp_disable_completely)
 	if (!thp_available())
 		SKIP(return, "Transparent Hugepages not available\n");
 
-	self->pmdsize = read_pmd_pagesize();
+	self->pmdsize = pmd_psize();
 	if (!self->pmdsize)
 		SKIP(return, "Unable to read PMD size\n");
 
@@ -240,7 +240,7 @@ FIXTURE_SETUP(prctl_thp_disable_except_madvise)
 	if (!thp_available())
 		SKIP(return, "Transparent Hugepages not available\n");
 
-	self->pmdsize = read_pmd_pagesize();
+	self->pmdsize = pmd_psize();
 	if (!self->pmdsize)
 		SKIP(return, "Unable to read PMD size\n");
 
diff --git a/tools/testing/selftests/mm/process_madv.c b/tools/testing/selftests/mm/process_madv.c
index 3fffd5f7e6fb4..7e32bad8ab2a9 100644
--- a/tools/testing/selftests/mm/process_madv.c
+++ b/tools/testing/selftests/mm/process_madv.c
@@ -141,7 +141,7 @@ TEST_F(process_madvise, remote_collapse)
 		void *map_addr;
 	} info;
 
-	huge_page_size = read_pmd_pagesize();
+	huge_page_size = pmd_psize();
 	if (huge_page_size <= 0)
 		SKIP(return, "Could not determine a valid huge page size.\n");
 
diff --git a/tools/testing/selftests/mm/soft-dirty.c b/tools/testing/selftests/mm/soft-dirty.c
index 7f649b6733553..e6fe4259b6f4d 100644
--- a/tools/testing/selftests/mm/soft-dirty.c
+++ b/tools/testing/selftests/mm/soft-dirty.c
@@ -87,7 +87,7 @@ static void test_hugepage(int pagemap_fd, int pagesize)
 		return;
 	}
 
-	size_t hpage_len = read_pmd_pagesize();
+	size_t hpage_len = pmd_psize();
 	if (!hpage_len)
 		ksft_exit_fail_msg("Reading PMD pagesize failed");
 
diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index 36a6719ff09a8..33a2473327bb7 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -615,7 +615,7 @@ int main(int argc, char **argv)
 
 	pagesize = getpagesize();
 	pageshift = ffs(pagesize) - 1;
-	pmd_pagesize = read_pmd_pagesize();
+	pmd_pagesize = pmd_psize();
 	if (!pmd_pagesize)
 		ksft_exit_fail_msg("Reading PMD pagesize failed\n");
 
diff --git a/tools/testing/selftests/mm/uffd-common.c b/tools/testing/selftests/mm/uffd-common.c
index a76851aced4d0..d5882fc392f0b 100644
--- a/tools/testing/selftests/mm/uffd-common.c
+++ b/tools/testing/selftests/mm/uffd-common.c
@@ -137,7 +137,7 @@ static void shmem_release_pages(uffd_global_test_opts_t *gopts, char *rel_area)
 static int shmem_allocate_area(uffd_global_test_opts_t *gopts, void **alloc_area, bool is_src)
 {
 	void *area_alias = NULL;
-	size_t bytes = gopts->nr_pages * gopts->page_size, hpage_size = read_pmd_pagesize();
+	size_t bytes = gopts->nr_pages * gopts->page_size, hpage_size = pmd_psize();
 	unsigned long offset = is_src ? 0 : bytes;
 	char *p = NULL, *p_alias = NULL;
 	int mem_fd = uffd_mem_fd_create(bytes * 2, false);
@@ -194,10 +194,10 @@ static void shmem_alias_mapping(uffd_global_test_opts_t *gopts, __u64 *start,
 
 static void shmem_check_pmd_mapping(uffd_global_test_opts_t *gopts, void *p, int expect_nr_hpages)
 {
-	size_t len = expect_nr_hpages * read_pmd_pagesize();
+	size_t len = expect_nr_hpages * pmd_psize();
 
 	if (!check_huge_file(gopts->area_dst_alias, len, expect_nr_hpages,
-			     read_pmd_pagesize()))
+			     pmd_psize()))
 		err("Did not find expected %d number of hugepages",
 		    expect_nr_hpages);
 }
diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index ef9b3956bdcfd..05477466af1b2 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -588,7 +588,7 @@ static void uffd_minor_test_common(uffd_global_test_opts_t *gopts, bool test_col
 		uffd_test_ops->check_pmd_mapping(gopts,
 						 gopts->area_dst,
 						 gopts->nr_pages * gopts->page_size /
-						 read_pmd_pagesize());
+						 pmd_psize());
 		/*
 		 * This won't cause uffd-fault - it purely just makes sure there
 		 * was no corruption.
@@ -1914,7 +1914,7 @@ static void uffd_move_handle_fault(uffd_global_test_opts_t *gopts, struct uffd_m
 static void uffd_move_pmd_handle_fault(uffd_global_test_opts_t *gopts, struct uffd_msg *msg,
 				       struct uffd_args *args)
 {
-	uffd_move_handle_fault_common(gopts, msg, args, read_pmd_pagesize());
+	uffd_move_handle_fault_common(gopts, msg, args, pmd_psize());
 }
 
 static void
@@ -2025,7 +2025,7 @@ static void uffd_move_pmd_test(uffd_global_test_opts_t *gopts, uffd_test_args_t
 {
 	if (madvise(gopts->area_dst, gopts->nr_pages * gopts->page_size, MADV_HUGEPAGE))
 		err("madvise(MADV_HUGEPAGE) failure");
-	uffd_move_test_common(gopts, targs, read_pmd_pagesize(),
+	uffd_move_test_common(gopts, targs, pmd_psize(),
 			      uffd_move_pmd_handle_fault);
 }
 
@@ -2033,7 +2033,7 @@ static void uffd_move_pmd_split_test(uffd_global_test_opts_t *gopts, uffd_test_a
 {
 	if (madvise(gopts->area_dst, gopts->nr_pages * gopts->page_size, MADV_NOHUGEPAGE))
 		err("madvise(MADV_NOHUGEPAGE) failure");
-	uffd_move_test_common(gopts, targs, read_pmd_pagesize(),
+	uffd_move_test_common(gopts, targs, pmd_psize(),
 			      uffd_move_pmd_handle_fault);
 }
 
diff --git a/tools/testing/selftests/mm/uffd-wp-mremap.c b/tools/testing/selftests/mm/uffd-wp-mremap.c
index c48eaab8e75cf..15cff68c59a22 100644
--- a/tools/testing/selftests/mm/uffd-wp-mremap.c
+++ b/tools/testing/selftests/mm/uffd-wp-mremap.c
@@ -38,7 +38,7 @@ static int detect_thp_sizes(size_t sizes[], int max)
 	int i;
 
 	/* thp not supported at all. */
-	if (!read_pmd_pagesize())
+	if (!pmd_psize())
 		return 0;
 
 	orders = thp_supported_orders();
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 515031b8283da..5f2fb5b819c4a 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -155,7 +155,7 @@ bool check_for_pattern(FILE *fp, const char *pattern, char *buf, size_t len)
 	return false;
 }
 
-uint64_t read_pmd_pagesize(void)
+uint64_t pmd_psize(void)
 {
 	int fd;
 	char buf[20];
@@ -437,7 +437,7 @@ static bool __check_huge(void *addr, size_t len, int nr_hpages,
 	char *start = addr;
 	char *end = start + len;
 
-	pmd_pagesize = read_pmd_pagesize();
+	pmd_pagesize = pmd_psize();
 	if (!pmd_pagesize)
 		ksft_exit_fail_msg("reading PMD pagesize failed\n");
 
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index b5d59729d4327..29d34980df36a 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -92,7 +92,7 @@ bool pagemap_is_populated(int fd, char *start);
 unsigned long pagemap_get_pfn(int fd, char *start);
 void clear_softdirty(void);
 bool check_for_pattern(FILE *fp, const char *pattern, char *buf, size_t len);
-uint64_t read_pmd_pagesize(void);
+uint64_t pmd_psize(void);
 unsigned long rss_anon(void);
 bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size);
 bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size);

-- 
2.43.0


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C803BCD0A;
	Tue,  6 Oct 2026 09:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278781; cv=none; b=sVrHu66CvPJGh3nNh0pt5BlsVjknP72hSv8C0RAKp+J+sO7lhIPS1F4Lh+jQJbtkBVpQrsjaqVOXFtuRSWZvYjwxoFDzvhNT8iZF2LlxCpBViXF+CmqZDXniNaVfrYkCMDj2AXoDxX3jvETFiaZbD7DUkJE3qyIuSc75ETZ6Qec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278781; c=relaxed/simple;
	bh=pJ+209TiQQiiNctq0TEMZ94BSTkJsl6Vbrf/EOnTlSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNH63pyrEQGmiCOjCR3sTVQ7r3ehfLzXkfXhsooHXzjJGtGEcRrWOiXRjRYHEVrv7fFVjxz3UfuG2QDeoegS8GgnHOT/PIkKLoEsVF7/qvGRVnS5t8KpAcG+iw6I1mQWiY1hOm2rUH0P1Ea1BA94Zoq4LLolKn1o7Q/fad3Aptk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=R5mntki4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="R5mntki4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1410E1477;
	Tue,  6 Oct 2026 02:26:15 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 310F93F763;
	Tue,  6 Oct 2026 02:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791278778; bh=pJ+209TiQQiiNctq0TEMZ94BSTkJsl6Vbrf/EOnTlSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R5mntki4h3x+80JT2BSPURxECf2YX1XFQfBVqYrmGgTFwr11MsaSfm4bPvbxlFmis
	 cVTbQo8iYiomF4hqr3wr7JyENT7Gdpn9heyPkahTfOq3AWwQy9reFlEW5tlz75jYtw
	 pvrU7000Wbg5UZxUP2meXPzasowvLKxMZxW5LvXI=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@suse.com,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	jhubbard@nvidia.com,
	kaleshsingh@google.com,
	anshuman.khandual@arm.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v2 11/12] selftests/mm: mremap_test: replace random data with deterministic pattern
Date: Tue,  6 Oct 2026 14:55:10 +0530
Message-ID: <20261006092511.145776-12-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006092511.145776-1-sarthak.sharma@arm.com>
References: <20261006092511.145776-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mremap_test uses a random data stream to detect corruption after remap
operations. This requires seed handling and byte by byte validation,
which is inefficient.

Replace it with a deterministic pattern where every word in a page
contains its one-based page index. Use memcpy() and memcmp() to
initialize and validate the mappings. Remove the pattern seed and
update the comment diagrams to reflect the new deterministic pattern.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 220 +++++++++--------------
 1 file changed, 85 insertions(+), 135 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 955727607d4f..92ffcbe547b5 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -13,8 +13,8 @@
 #include <sys/ioctl.h>
 #include <sys/mman.h>
 #include <syscall.h>
-#include <time.h>
 #include <stdbool.h>
+#include <stdint.h>
 
 #include "kselftest.h"
 
@@ -304,11 +304,11 @@ static void mremap_expand_merge_offset(FILE *maps_fp, unsigned long page_size)
  *
  * |DDDDddddSSSSssss|
  */
-static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
+static void mremap_move_within_range(char *pattern_addr)
 {
 	char *test_name = "mremap move within range";
 	void *src, *dest;
-	unsigned int i, success = 1;
+	unsigned int success = 1;
 
 	size_t size = SIZE_MB(20);
 	void *ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
@@ -324,7 +324,7 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 	src = (void *)((unsigned long)src & ~(SIZE_MB(2) - 1));
 
 	/* Set byte pattern for source block. */
-	memcpy(src, rand_addr, SIZE_MB(2));
+	memcpy(src, pattern_addr + SIZE_MB(2), SIZE_MB(2));
 
 	dest = src - SIZE_MB(2);
 
@@ -337,17 +337,9 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 	}
 
 	/* Verify byte pattern after remapping */
-	srand(pattern_seed);
-	for (i = 0; i < SIZE_MB(1); i++) {
-		char c = (char) rand();
-
-		if (((char *)src)[i] != c) {
-			ksft_print_msg("Data at src at %d got corrupted due to unrelated mremap\n",
-				       i);
-			ksft_print_msg("Expected: %#x\t Got: %#x\n", c & 0xff,
-					((char *) src)[i] & 0xff);
-			success = 0;
-		}
+	if (memcmp(src, pattern_addr + SIZE_MB(2), SIZE_MB(1))) {
+		ksft_print_msg("Source data was corrupted\n");
+		success = 0;
 	}
 
 out_unmap:
@@ -356,32 +348,24 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 	ksft_test_result(success, "%s\n", test_name);
 }
 
-static bool is_multiple_vma_range_ok(unsigned int pattern_seed,
-				     char *ptr, unsigned long page_size)
+static bool is_multiple_vma_range_ok(char *pattern_addr, char *ptr,
+				     unsigned long page_size)
 {
-	int i;
-
-	srand(pattern_seed);
-	for (i = 0; i <= 10; i += 2) {
-		int j;
-		char *buf = &ptr[i * page_size];
+	for (int i = 0; i <= 10; i += 2) {
 		size_t size = i == 4 ? 2 * page_size : page_size;
 
-		for (j = 0; j < size; j++) {
-			char chr = rand();
-
-			if (chr != buf[j]) {
-				ksft_print_msg("page %d offset %d corrupted, expected %d got %d\n",
-					       i, j, chr, buf[j]);
-				return false;
-			}
+		if (memcmp(ptr + i * page_size, pattern_addr + i * page_size,
+			   size)) {
+			ksft_print_msg("Data in VMA starting at page %d got corrupted\n",
+				       i);
+			return false;
 		}
 	}
 
 	return true;
 }
 
-static void mremap_move_multiple_vmas(unsigned int pattern_seed,
+static void mremap_move_multiple_vmas(char *pattern_addr,
 				      unsigned long page_size,
 				      bool dont_unmap)
 {
@@ -416,13 +400,15 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 		goto out_unmap;
 	}
 
+	memcpy(ptr, pattern_addr, size);
+
 	/*
 	 * Unmap so we end up with:
 	 *
 	 *  0   2   4 5 6   8   10 offset in buffer
 	 * |*| |*| |*****| |*| |*|
 	 * |*| |*| |*****| |*| |*|
-	 *  0   1   2 3 4   5   6  pattern offset
+	 *  0   2   4 5 6   8   10  pattern offset
 	 */
 	for (i = 1; i < 10; i += 2) {
 		if (i == 5)
@@ -435,18 +421,6 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 		}
 	}
 
-	srand(pattern_seed);
-
-	/* Set up random patterns. */
-	for (i = 0; i <= 10; i += 2) {
-		int j;
-		size_t size = i == 4 ? 2 * page_size : page_size;
-		char *buf = &ptr[i * page_size];
-
-		for (j = 0; j < size; j++)
-			buf[j] = rand();
-	}
-
 	/* First, just move the whole thing. */
 	if (mremap(ptr, size, size, mremap_flags, tgt_ptr) == MAP_FAILED) {
 		ksft_perror("mremap");
@@ -454,7 +428,7 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 		goto out_unmap;
 	}
 	/* Check move was ok. */
-	if (!is_multiple_vma_range_ok(pattern_seed, tgt_ptr, page_size)) {
+	if (!is_multiple_vma_range_ok(pattern_addr, tgt_ptr, page_size)) {
 		success = false;
 		goto out_unmap;
 	}
@@ -467,7 +441,7 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 		goto out_unmap;
 	}
 	/* Check that the move is ok. */
-	if (!is_multiple_vma_range_ok(pattern_seed, &tgt_ptr[size], page_size)) {
+	if (!is_multiple_vma_range_ok(pattern_addr, &tgt_ptr[size], page_size)) {
 		success = false;
 		goto out_unmap;
 	}
@@ -487,7 +461,7 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 		goto out_unmap;
 	}
 	/* Check that the move is ok. */
-	if (!is_multiple_vma_range_ok(pattern_seed, tgt_ptr, page_size)) {
+	if (!is_multiple_vma_range_ok(pattern_addr, tgt_ptr, page_size)) {
 		success = false;
 		goto out_unmap;
 	}
@@ -573,7 +547,7 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
 	ksft_test_result(success, "%s%s\n", test_name, inplace ? " [inplace]" : "");
 }
 
-static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
+static void mremap_move_multiple_vmas_split(char *pattern_addr,
 					    unsigned long page_size,
 					    bool dont_unmap)
 {
@@ -608,13 +582,15 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 		goto out_unmap;
 	}
 
+	memcpy(ptr, pattern_addr, size);
+
 	/*
 	 * Unmap so we end up with:
 	 *
 	 *  0 1 2 3 4 5 6 7 8 9 10 offset in buffer
 	 * |**********| |*******|
 	 * |**********| |*******|
-	 *  0 1 2 3 4   5 6 7 8 9  pattern offset
+	 *  0 1 2 3 4 5 6 7 8 9 10 pattern offset
 	 */
 	if (munmap(&ptr[5 * page_size], page_size)) {
 		ksft_perror("munmap");
@@ -622,19 +598,6 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 		goto out_unmap;
 	}
 
-	/* Set up random patterns. */
-	srand(pattern_seed);
-	for (i = 0; i < 10; i++) {
-		int j;
-		char *buf = &ptr[i * page_size];
-
-		if (i == 5)
-			continue;
-
-		for (j = 0; j < page_size; j++)
-			buf[j] = rand();
-	}
-
 	/*
 	 * Move the below:
 	 *
@@ -642,14 +605,14 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 	 *  0 1 2 3 4 5 6 7 8 9 10 offset in buffer
 	 * |**********| |*******|
 	 * |**********| |*******|
-	 *  0 1 2 3 4   5 6 7 8 9  pattern offset
+	 *  0 1 2 3 4 5 6 7 8 9 10  pattern offset
 	 *
 	 * Into:
 	 *
 	 * 0 1 2 3 4 5 6 7 offset in buffer
 	 * |*****| |*****|
 	 * |*****| |*****|
-	 * 2 3 4   5 6 7   pattern offset
+	 * 2 3 4 5 6 7 8 9 pattern offset
 	 */
 	if (mremap(&ptr[2 * page_size], size - 3 * page_size, size - 3 * page_size,
 		   mremap_flags, tgt_ptr) == MAP_FAILED) {
@@ -658,28 +621,16 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 		goto out_unmap;
 	}
 
-	/* Offset into random pattern. */
-	srand(pattern_seed);
-	for (i = 0; i < 2 * page_size; i++)
-		rand();
-
 	/* Check pattern. */
 	for (i = 0; i < 7; i++) {
-		int j;
-		char *buf = &tgt_ptr[i * page_size];
-
 		if (i == 3)
 			continue;
 
-		for (j = 0; j < page_size; j++) {
-			char chr = rand();
-
-			if (chr != buf[j]) {
-				ksft_print_msg("page %d offset %d corrupted, expected %d got %d\n",
-					       i, j, chr, buf[j]);
-				success = false;
-				goto out_unmap;
-			}
+		if (memcmp(tgt_ptr + i * page_size,
+			   pattern_addr + (i + 2) * page_size, page_size)) {
+			ksft_print_msg("Data in page %d got corrupted\n", i + 2);
+			success = false;
+			goto out_unmap;
 		}
 	}
 
@@ -958,11 +909,12 @@ static bool validate_test_data(char *addr, size_t size, char *pattern_addr,
 	       !memcmp(addr + end, pattern_addr + 2 * len, len);
 }
 
-static int remap_region(struct config c, char *rand_addr, size_t rand_size,
+static int remap_region(struct config c, char *pattern_addr, size_t pattern_size,
 		size_t page_size)
 {
 	void *addr, *tmp_addr, *src_addr, *dest_addr, *dest_preamble_addr = NULL;
 	long long align_mask, offset;
+	char *preamble_pattern = NULL;
 	int ret = 0;
 
 	src_addr = get_source_mapping(c);
@@ -972,7 +924,8 @@ static int remap_region(struct config c, char *rand_addr, size_t rand_size,
 	}
 
 	/* Set byte pattern for source block. */
-	populate_test_data(src_addr, c.region_size, rand_addr, rand_size, page_size);
+	populate_test_data(src_addr, c.region_size, pattern_addr,
+			   pattern_size, page_size);
 
 	/* Mask to zero out lower bits of address for alignment */
 	align_mask = ~(c.dest_alignment - 1);
@@ -1012,8 +965,9 @@ static int remap_region(struct config c, char *rand_addr, size_t rand_size,
 			goto clean_up_src;
 		}
 
+		preamble_pattern = pattern_addr + pattern_size - c.dest_preamble_size;
 		/* Set byte pattern for the dest preamble block. */
-		memcpy(dest_preamble_addr, rand_addr, c.dest_preamble_size);
+		memcpy(dest_preamble_addr, preamble_pattern, c.dest_preamble_size);
 	}
 
 	dest_addr = mremap(src_addr, c.region_size, c.region_size,
@@ -1026,8 +980,8 @@ static int remap_region(struct config c, char *rand_addr, size_t rand_size,
 	}
 
 	/* Verify byte pattern after remapping */
-	if (!validate_test_data(dest_addr, c.region_size, rand_addr,
-				rand_size, page_size)) {
+	if (!validate_test_data(dest_addr, c.region_size, pattern_addr,
+				pattern_size, page_size)) {
 		ksft_print_msg("Data after remap doesn't match\n");
 		ret = -1;
 		goto clean_up_dest;
@@ -1035,7 +989,7 @@ static int remap_region(struct config c, char *rand_addr, size_t rand_size,
 
 	/* Verify the dest preamble byte pattern after remapping */
 	if (c.dest_preamble_size &&
-	    memcmp(dest_preamble_addr, rand_addr, c.dest_preamble_size)) {
+	    memcmp(dest_preamble_addr, preamble_pattern, c.dest_preamble_size)) {
 		ksft_print_msg("Preamble data after remap doesn't match\n");
 		ret = -1;
 		goto clean_up_dest;
@@ -1057,12 +1011,11 @@ static int remap_region(struct config c, char *rand_addr, size_t rand_size,
  * the beginning of the mapping just because the aligned
  * down address landed on a mapping that maybe does not exist.
  */
-static void mremap_move_1mb_from_start(unsigned int pattern_seed,
-				       char *rand_addr)
+static void mremap_move_1mb_from_start(char *pattern_addr)
 {
 	char *test_name = "mremap move 1mb from start at 1MB+256KB aligned src";
 	void *src = NULL, *dest = NULL;
-	unsigned int i, success = 1;
+	unsigned int success = 1;
 
 	/* Config to reuse get_source_mapping() to do an aligned mmap. */
 	struct config c = {
@@ -1084,7 +1037,7 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 	}
 
 	/* Set byte pattern for source block. */
-	memcpy(src, rand_addr, SIZE_MB(2));
+	memcpy(src, pattern_addr, SIZE_MB(2));
 
 	/*
 	 * Unmap the beginning of dest so that the aligned address
@@ -1101,17 +1054,9 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 	}
 
 	/* Verify byte pattern after remapping */
-	srand(pattern_seed);
-	for (i = 0; i < SIZE_MB(1); i++) {
-		char c = (char) rand();
-
-		if (((char *)src)[i] != c) {
-			ksft_print_msg("Data at src at %d got corrupted due to unrelated mremap\n",
-				       i);
-			ksft_print_msg("Expected: %#x\t Got: %#x\n", c & 0xff,
-					((char *) src)[i] & 0xff);
-			success = 0;
-		}
+	if (memcmp(src, pattern_addr, SIZE_MB(1))) {
+		ksft_print_msg("Data before the remapped range was corrupted\n");
+		success = 0;
 	}
 
 out:
@@ -1125,11 +1070,11 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 }
 
 static void run_mremap_test_case(struct test test_case,
-				 char *rand_addr,
-				 size_t rand_size,
+				 char *pattern_addr,
+				 size_t pattern_size,
 				 size_t page_size)
 {
-	int ret = remap_region(test_case.config, rand_addr, rand_size, page_size);
+	int ret = remap_region(test_case.config, pattern_addr, pattern_size, page_size);
 
 	if (ret < 0) {
 		if (test_case.expect_failure)
@@ -1146,47 +1091,52 @@ static void run_mremap_test_case(struct test test_case,
 	}
 }
 
+static void fill_pattern(char *pattern_addr, size_t pattern_size, size_t page_size)
+{
+	size_t nr_pages = pattern_size / page_size;
+	size_t words_per_page = page_size / sizeof(uint32_t);
+	size_t page, word;
+
+	for (page = 0; page < nr_pages; page++) {
+		uint32_t *page_addr = (uint32_t *)pattern_addr + page * words_per_page;
+		uint32_t val = page + 1;
+
+		for (word = 0; word < words_per_page; word++)
+			page_addr[word] = val;
+	}
+}
+
 #define MAX_TEST 15
 int main(void)
 {
 	unsigned int i;
 
-	unsigned int pattern_seed;
-	char *rand_addr;
-	size_t rand_size;
+	char *pattern_addr;
+	size_t pattern_size;
 	int num_expand_tests = 2;
 	int num_misc_tests = 9;
 	struct test test_cases[MAX_TEST] = {};
 	int page_size;
-	time_t t;
 	FILE *maps_fp;
 
 	ksft_print_header();
 
 	get_mmap_min_addr();
 
-	pattern_seed = (unsigned int) time(&t);
-
-	ksft_print_msg("Test configs:\n");
-	ksft_print_msg("pattern_seed=%u\n", pattern_seed);
-
 	/*
-	 * The 40MB destination preamble determines the random buffer size
+	 * The 40MB destination preamble determines the pattern buffer size
 	 */
-	rand_size = 10 * _4MB;
+	pattern_size = 10 * _4MB;
 
-	rand_addr = (char *)mmap(NULL, rand_size, PROT_READ | PROT_WRITE,
-				 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-	if (rand_addr == MAP_FAILED)
-		ksft_exit_fail_perror("cannot mmap rand_addr");
-
-	/* fill stream of random bytes */
-	srand(pattern_seed);
-	for (unsigned long i = 0; i < rand_size; ++i)
-		rand_addr[i] = (char) rand();
+	pattern_addr = (char *)mmap(NULL, pattern_size, PROT_READ | PROT_WRITE,
+				    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (pattern_addr == MAP_FAILED)
+		ksft_exit_fail_perror("cannot mmap pattern_addr");
 
 	page_size = sysconf(_SC_PAGESIZE);
 
+	fill_pattern(pattern_addr, pattern_size, page_size);
+
 	/* Expected mremap failures */
 	test_cases[0] =	MAKE_TEST(page_size, page_size, page_size,
 				  OVERLAPPING, EXPECT_FAILURE,
@@ -1240,31 +1190,31 @@ int main(void)
 	ksft_set_plan(ARRAY_SIZE(test_cases) + num_expand_tests + num_misc_tests);
 
 	for (i = 0; i < ARRAY_SIZE(test_cases); i++)
-		run_mremap_test_case(test_cases[i], rand_addr, rand_size, page_size);
+		run_mremap_test_case(test_cases[i], pattern_addr, pattern_size, page_size);
 
 	maps_fp = fopen("/proc/self/maps", "r");
 
 	if (maps_fp == NULL) {
-		munmap(rand_addr, rand_size);
+		munmap(pattern_addr, pattern_size);
 		ksft_exit_fail_msg("Failed to read /proc/self/maps: %s\n", strerror(errno));
 	}
 
 	mremap_expand_merge(maps_fp, page_size);
 	mremap_expand_merge_offset(maps_fp, page_size);
 
-	mremap_move_within_range(pattern_seed, rand_addr);
-	mremap_move_1mb_from_start(pattern_seed, rand_addr);
+	mremap_move_within_range(pattern_addr);
+	mremap_move_1mb_from_start(pattern_addr);
 	mremap_shrink_multiple_vmas(page_size, /* inplace= */true);
 	mremap_shrink_multiple_vmas(page_size, /* inplace= */false);
-	mremap_move_multiple_vmas(pattern_seed, page_size, /* dontunmap= */ false);
-	mremap_move_multiple_vmas(pattern_seed, page_size, /* dontunmap= */ true);
-	mremap_move_multiple_vmas_split(pattern_seed, page_size, /* dontunmap= */ false);
-	mremap_move_multiple_vmas_split(pattern_seed, page_size, /* dontunmap= */ true);
+	mremap_move_multiple_vmas(pattern_addr, page_size, /* dontunmap= */ false);
+	mremap_move_multiple_vmas(pattern_addr, page_size, /* dontunmap= */ true);
+	mremap_move_multiple_vmas_split(pattern_addr, page_size, /* dontunmap= */ false);
+	mremap_move_multiple_vmas_split(pattern_addr, page_size, /* dontunmap= */ true);
 	mremap_move_multi_invalid_vmas(maps_fp, page_size);
 
 	fclose(maps_fp);
 
-	munmap(rand_addr, rand_size);
+	munmap(pattern_addr, pattern_size);
 
 	ksft_finished();
 }
-- 
2.53.0


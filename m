Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615053839BD;
	Tue,  6 Oct 2026 09:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278772; cv=none; b=C4VRrLF3c5PBpF+eUoAeqFi39XTUK3OrkuukZmfqH13WzKkl4jAuK2M+DUmK9YAOQVBJfaL74wV5oGeLOdSKXKyoO2aYoXxt3EoOHGK3eGz+3rHYhLa8qu9z+hRcBTiILiSrvPAf9MVZt+JsljHKitsDmET7aThF6Ebl2UFFjoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278772; c=relaxed/simple;
	bh=rXnkgoWZpqTDKBHoUCO6679dXjhgavjkj33aFGmM2oA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Txeo+8/K2BdkFYqmdj54zNBmT929ygR0OviTH8JZ/NfDqISerCl8Y05jwmuf6FXw7cdwQA0FdI13q2iuOLrPGWNiFvXN/AFx+zK/epQBv9+qZRuqyY68sLIPSxtx/mUn6ZOkL9GAN97J6JaJdNjnlWBzGxYHoLhfsoEzy41O2p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F4zY6T2J; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F4zY6T2J"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75A561477;
	Tue,  6 Oct 2026 02:26:05 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9186F3F763;
	Tue,  6 Oct 2026 02:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791278768; bh=rXnkgoWZpqTDKBHoUCO6679dXjhgavjkj33aFGmM2oA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F4zY6T2JV0ZzIuz3xaTJnjRp5wF9fq+jctyfDmntuxpPlv4rc2IlbXyO3gDJiS1A9
	 JeOufxNs78XS2FQ0/fv9JdslgcTAHI8i1G3Tj/uNw6bHPP9pQlAG6fncNyH544pFIn
	 boDadFJIPyOjA9XVhg5fEh3jJJcfDE33NnRb3TQc=
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
Subject: [PATCH v2 09/12] selftests/mm: mremap_test: remove perf tests and timing
Date: Tue,  6 Oct 2026 14:55:08 +0530
Message-ID: <20261006092511.145776-10-sarthak.sharma@arm.com>
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

mremap_test contains three perf tests that report the time
taken to move 1GB mappings with different page table level
alignments. Although they validate the remapped data,
their main purpose is to report timing information. The
recorded time also does not affect the test result. Also,
they are not run with the default validation threshold.

Remove these tests and the timing infrastructure from
mremap_test.c. The regular tests continue to cover PUD
and PMD aligned remaps.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 64 +++---------------------
 1 file changed, 7 insertions(+), 57 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 37bba5049ecc..403c5495e160 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -22,7 +22,6 @@
 #define EXPECT_FAILURE 1
 #define NON_OVERLAPPING 0
 #define OVERLAPPING 1
-#define NS_PER_SEC 1000000000ULL
 #define VALIDATION_DEFAULT_THRESHOLD 4	/* 4MB */
 #define VALIDATION_NO_THRESHOLD 0	/* Verify the entire region */
 
@@ -929,14 +928,13 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp, unsigned long page_siz
 }
 #endif /* __NR_userfaultfd */
 
-/* Returns the time taken for the remap on success else returns -1. */
-static long long remap_region(struct config c, unsigned int threshold_mb,
-			      char *rand_addr)
+static int remap_region(struct config c, unsigned int threshold_mb,
+			char *rand_addr)
 {
 	void *addr, *tmp_addr, *src_addr, *dest_addr, *dest_preamble_addr = NULL;
-	struct timespec t_start = {0, 0}, t_end = {0, 0};
-	long long  start_ns, end_ns, align_mask, ret, offset;
+	long long align_mask, offset;
 	unsigned long long threshold;
+	int ret = 0;
 
 	if (threshold_mb == VALIDATION_NO_THRESHOLD)
 		threshold = c.region_size;
@@ -994,10 +992,8 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 		memcpy(dest_preamble_addr, rand_addr, c.dest_preamble_size);
 	}
 
-	clock_gettime(CLOCK_MONOTONIC, &t_start);
 	dest_addr = mremap(src_addr, c.region_size, c.region_size,
 			   MREMAP_MAYMOVE | MREMAP_FIXED, (char *)addr);
-	clock_gettime(CLOCK_MONOTONIC, &t_end);
 
 	if (dest_addr == MAP_FAILED) {
 		ksft_print_msg("mremap failed: %s\n", strerror(errno));
@@ -1020,16 +1016,6 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 		goto clean_up_dest;
 	}
 
-	start_ns = t_start.tv_sec * NS_PER_SEC + t_start.tv_nsec;
-	end_ns = t_end.tv_sec * NS_PER_SEC + t_end.tv_nsec;
-	ret = end_ns - start_ns;
-
-/*
- * Since the destination address is specified using MREMAP_FIXED, subsequent
- * mremap will unmap any previous mapping at the address range specified by
- * dest_addr and region_size. This significantly affects the remap time of
- * subsequent tests. So we clean up mappings after each test.
- */
 clean_up_dest:
 	munmap(dest_addr, c.region_size);
 clean_up_dest_preamble:
@@ -1117,10 +1103,9 @@ static void run_mremap_test_case(struct test test_case,
 				 unsigned int threshold_mb,
 				 char *rand_addr)
 {
-	long long remap_time = remap_region(test_case.config, threshold_mb,
-					    rand_addr);
+	int ret = remap_region(test_case.config, threshold_mb, rand_addr);
 
-	if (remap_time < 0) {
+	if (ret < 0) {
 		if (test_case.expect_failure)
 			ksft_test_result_xfail("%s: expected mremap failure\n",
 					       test_case.name);
@@ -1130,25 +1115,15 @@ static void run_mremap_test_case(struct test test_case,
 		if (test_case.expect_failure)
 			ksft_test_result_fail("%s: unexpected mremap success\n",
 					      test_case.name);
-		/*
-		 * Comparing mremap time is only applicable if entire region
-		 * was faulted in.
-		 */
-		else if (threshold_mb == VALIDATION_NO_THRESHOLD ||
-			 test_case.config.region_size <= threshold_mb * _1MB)
-			ksft_test_result_pass("%s: mremap time: %12lldns\n",
-					      test_case.name, remap_time);
 		else
 			ksft_test_result_pass("%s\n", test_case.name);
 	}
 }
 
 #define MAX_TEST 15
-#define MAX_PERF_TEST 3
 int main(void)
 {
 	unsigned int i;
-	int run_perf_tests;
 	unsigned int threshold_mb = VALIDATION_DEFAULT_THRESHOLD;
 
 	/* hard-coded test configs */
@@ -1162,7 +1137,6 @@ int main(void)
 	int num_expand_tests = 2;
 	int num_misc_tests = 9;
 	struct test test_cases[MAX_TEST] = {};
-	struct test perf_test_cases[MAX_PERF_TEST];
 	int page_size;
 	time_t t;
 	FILE *maps_fp;
@@ -1252,22 +1226,7 @@ int main(void)
 				  "5MB mremap - Source 1MB-aligned, Dest 1MB-aligned with 40MB Preamble");
 	test_cases[14].config.dest_preamble_size = 10 * _4MB;
 
-	perf_test_cases[0] =  MAKE_TEST(page_size, page_size, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-					"1GB mremap - Source PTE-aligned, Destination PTE-aligned");
-	/*
-	 * mremap 1GB region - Page table level aligned time
-	 * comparison.
-	 */
-	perf_test_cases[1] = MAKE_TEST(PMD, PMD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				       "1GB mremap - Source PMD-aligned, Destination PMD-aligned");
-	perf_test_cases[2] = MAKE_TEST(PUD, PUD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
-				       "1GB mremap - Source PUD-aligned, Destination PUD-aligned");
-
-	run_perf_tests =  (threshold_mb == VALIDATION_NO_THRESHOLD) ||
-				(threshold_mb * _1MB >= _1GB);
-
-	ksft_set_plan(ARRAY_SIZE(test_cases) + (run_perf_tests ?
-		      ARRAY_SIZE(perf_test_cases) : 0) + num_expand_tests + num_misc_tests);
+	ksft_set_plan(ARRAY_SIZE(test_cases) + num_expand_tests + num_misc_tests);
 
 	for (i = 0; i < ARRAY_SIZE(test_cases); i++)
 		run_mremap_test_case(test_cases[i], threshold_mb, rand_addr);
@@ -1294,15 +1253,6 @@ int main(void)
 
 	fclose(maps_fp);
 
-	if (run_perf_tests) {
-		ksft_print_msg("%s\n",
-		 "mremap HAVE_MOVE_PMD/PUD optimization time comparison for 1GB region:");
-		for (i = 0; i < ARRAY_SIZE(perf_test_cases); i++)
-			run_mremap_test_case(perf_test_cases[i],
-					     threshold_mb,
-					     rand_addr);
-	}
-
 	munmap(rand_addr, rand_size);
 
 	ksft_finished();
-- 
2.53.0


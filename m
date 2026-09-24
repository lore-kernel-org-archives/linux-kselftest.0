Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F59335B65D;
	Thu, 24 Sep 2026 05:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790226060; cv=none; b=jh8/umdpW08foQcHISmSZc+8xS9nR8mL8Ui9ymjsdvGG79d5/R+To+nfUghpAlS5eQ92p+rvfZTUoqGDUvR+ZzEf4Is78oeM/8WkmQKpN37b4zmoA6TZu58nTGfXkUjMC52qY4/aGgI00W0yKjYo8Y+fWyhwsQyK5NOAdwtCOEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790226060; c=relaxed/simple;
	bh=PEYyoFGukDb2bBQUvTSPCNCEuNRH1wR3RMvfZBD9GHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uDJBuSepAD2LusRPMq1YXIEM6ZxDSJ6y/QEPG0XeQNrLxLxR0SAPJn/mmakvje/k9cFkYDEloLzc8dmK7BowRWW3jlS1SHGCy36WWOK3IMqqzJfiP1aTTt1dONIT4YeP3ms9TDPtjnCZxqD6A2CrawMVNPP1TqTEe3VBToUhJMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OPMSzIYM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OPMSzIYM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D2D81476;
	Wed, 23 Sep 2026 22:00:54 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 443633F86C;
	Wed, 23 Sep 2026 22:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790226057; bh=PEYyoFGukDb2bBQUvTSPCNCEuNRH1wR3RMvfZBD9GHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OPMSzIYMbgDKDfvMN4D4bdbM26PshsJcMRj5wa2xFHP3DMLKVW2KS/O3NZVZlsNu6
	 TDUrB7L4nm3GN4sL0Kb7X4BCQpCNrM0jGXqJ3PmCVTS8uoY17NsOSm4oyHZIilBlXq
	 P5D6QrJu1jOJYJ1fRYFZMiNMzESzcOlt4LavkChg=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Park Tae-sun <ts930@dgu.ac.kr>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH RESEND 7/9] selftests/mm: mremap_test: remove perf tests and timing
Date: Thu, 24 Sep 2026 10:30:07 +0530
Message-ID: <20260924050009.19974-8-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924050009.19974-1-sarthak.sharma@arm.com>
References: <20260924050009.19974-1-sarthak.sharma@arm.com>
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
their main purpose it to report timing information. The
recorded time also does not affect the test result. Also,
they are skipped with the default validation threshold.

Remove these tests and the timing infrastructure from
mremap_test.c. The regular tests continue to cover PUD
and PMD aligned remaps.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 61 +++---------------------
 1 file changed, 7 insertions(+), 54 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 7b4c9ab3bf14..04ea072f8cd1 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -13,7 +13,6 @@
 #include <sys/ioctl.h>
 #include <sys/mman.h>
 #include <syscall.h>
-#include <time.h>
 #include <stdbool.h>
 #include <stdint.h>
 
@@ -23,7 +22,6 @@
 #define EXPECT_FAILURE 1
 #define NON_OVERLAPPING 0
 #define OVERLAPPING 1
-#define NS_PER_SEC 1000000000ULL
 #define VALIDATION_DEFAULT_THRESHOLD 4	/* 4MB */
 #define VALIDATION_NO_THRESHOLD 0	/* Verify the entire region */
 
@@ -897,12 +895,11 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp, unsigned long page_siz
 }
 #endif /* __NR_userfaultfd */
 
-/* Returns the time taken for the remap on success else returns -1. */
-static long long remap_region(struct config c, unsigned int threshold_mb)
+static int remap_region(struct config c, unsigned int threshold_mb)
 {
 	void *addr, *tmp_addr, *src_addr, *dest_addr, *dest_preamble_addr = NULL;
-	struct timespec t_start = {0, 0}, t_end = {0, 0};
-	long long  start_ns, end_ns, align_mask, ret, offset;
+	long long align_mask, offset;
+	int ret = 0;
 	unsigned long long threshold;
 	char *preamble_pattern;
 
@@ -963,10 +960,8 @@ static long long remap_region(struct config c, unsigned int threshold_mb)
 		memcpy(dest_preamble_addr, preamble_pattern, c.dest_preamble_size);
 	}
 
-	clock_gettime(CLOCK_MONOTONIC, &t_start);
 	dest_addr = mremap(src_addr, c.region_size, c.region_size,
 					  MREMAP_MAYMOVE|MREMAP_FIXED, (char *) addr);
-	clock_gettime(CLOCK_MONOTONIC, &t_end);
 
 	if (dest_addr == MAP_FAILED) {
 		ksft_print_msg("mremap failed: %s\n", strerror(errno));
@@ -989,16 +984,7 @@ static long long remap_region(struct config c, unsigned int threshold_mb)
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
+/* Clean up mappings after each test. */
 clean_up_dest:
 	munmap(dest_addr, c.region_size);
 clean_up_dest_preamble:
@@ -1076,9 +1062,9 @@ static void mremap_move_1mb_from_start(void)
 static void run_mremap_test_case(struct test test_case,
 				 unsigned int threshold_mb)
 {
-	long long remap_time = remap_region(test_case.config, threshold_mb);
+	int ret = remap_region(test_case.config, threshold_mb);
 
-	if (remap_time < 0) {
+	if (ret < 0) {
 		if (test_case.expect_failure)
 			ksft_test_result_xfail("%s: expected mremap failure\n",
 					       test_case.name);
@@ -1088,14 +1074,6 @@ static void run_mremap_test_case(struct test test_case,
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
@@ -1149,11 +1127,9 @@ static void fill_pattern(uint32_t *pattern, size_t pattern_size, size_t page_siz
 }
 
 #define MAX_TEST 15
-#define MAX_PERF_TEST 3
 int main(int argc, char **argv)
 {
 	unsigned int i;
-	int run_perf_tests;
 	unsigned int threshold_mb = VALIDATION_DEFAULT_THRESHOLD;
 
 	/* hard-coded test configs */
@@ -1164,7 +1140,6 @@ int main(int argc, char **argv)
 	int num_expand_tests = 2;
 	int num_misc_tests = 9;
 	struct test test_cases[MAX_TEST] = {};
-	struct test perf_test_cases[MAX_PERF_TEST];
 	int page_size;
 	FILE *maps_fp;
 
@@ -1251,22 +1226,7 @@ int main(int argc, char **argv)
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
 		run_mremap_test_case(test_cases[i], threshold_mb);
@@ -1293,13 +1253,6 @@ int main(int argc, char **argv)
 
 	fclose(maps_fp);
 
-	if (run_perf_tests) {
-		ksft_print_msg("%s\n",
-			       "mremap HAVE_MOVE_PMD/PUD optimization time comparison for 1GB region:");
-		for (i = 0; i < ARRAY_SIZE(perf_test_cases); i++)
-			run_mremap_test_case(perf_test_cases[i], threshold_mb);
-	}
-
 	munmap(pattern, pattern_size);
 
 	ksft_finished();
-- 
2.53.0


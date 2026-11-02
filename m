Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613824;
	b=3ioMkm9wLchwbXSHAs1FaXpJxx0vE1a9/jE6v00Q6wECG4xDW9yLB/qy2dcrkygTUAAc
	 xSUcEihRZqXoFDScru+PG5yEeLHT8M8HSj2uDQVpxV3qg76kHILRDUe65qsZ/b5QRRGr4
	 mYr5EdQimnSrPCeEY4Ar/6tHiymv0L0CF3C4jSwvDxO5nfPW33tPeA3KVksw/xaS3GGRg
	 vdw0AkFGNEBh55szQNC4JVD+mfOa7FCt0dTdVBepmES4cDXJPlOD9m/2kZMfkrCgKLRtz
	 G6QzEO6MjJlxYuRL7bmsGQG8xg00btf9jguVW/RDviIMR5Ux+7ewkOurrkTPoBb2D7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613824;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q0mRcK2bKQo+q66MkLAlKH/V2mp0o6C8AmD4irh5/SQ=;
	b=0r8lzcZjhNbRgKnH5rpDjtwz/o9ulKMPLW13UlT71Qeskjdirm5pQk4WHmjcN2cvw6Nt
	 37I6MhBehrppm0W8QW6h1qhpR7egWXnjSdtI8oO/7sqlV2fKWQIuEFCqrvOq5ihpjQWr0
	 T/FcoL/tGZnx1bADZVJlvyEX4Ldo2B6rv0jh+nCGY8joA7ZKvfYYBXjpRF3hdKXna8dq8
	 BsPOPv7TtWzf7eWADH5KNii24NHbnBbzvcNwAAPAtlDYNSocyLLlsxCsp8JAqTENx+MQ3
	 f3BOPzUN99M/0lKPUjyIM/zfPcHpeIsmxCXBw0sssduAYDGNIv3AhlfK5briHtcGJ3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MbiEQKPA;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85611606A324;
	Mon,  2 Nov 2026 10:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85611606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MbiEQKPA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB9D51595;
	Mon,  2 Nov 2026 02:03:39 -0800 (PST)
Received: from a081061.arm.com (unknown [10.163.156.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6657D3F59E;
	Mon,  2 Nov 2026 02:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793613822; bh=XoWrK/XFPSHrKoCJr1hb8lpBF7nrUDVvP6yJJO84omg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MbiEQKPAwioHsY+oTq9XEBh9wl6T/SXLEbkOp0d1rHU3X0r6FnGj4M0e6q6SrIuV5
	 8CNaAhOdahyRRYqjLg/E712Rr1XZIJUQpu1Li1F8DkLIxLWlI4jXaO5xjj0H7jBA8e
	 2aZADk44Lbi6xCgAQJwt2Es++wvqtA7MKLbxfLNw=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@suse.com>,
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
Subject: [PATCH RESEND v2 09/12] selftests/mm: mremap_test: remove perf tests and timing
Date: Mon,  2 Nov 2026 15:32:08 +0530
Message-ID: <20261102100211.141831-10-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102100211.141831-1-sarthak.sharma@arm.com>
References: <20261102100211.141831-1-sarthak.sharma@arm.com>
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
index 63bf8a475fe6..bf825ffa29f6 100644
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
@@ -996,10 +994,8 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 		memcpy(dest_preamble_addr, rand_addr, c.dest_preamble_size);
 	}
 
-	clock_gettime(CLOCK_MONOTONIC, &t_start);
 	dest_addr = mremap(src_addr, c.region_size, c.region_size,
 			   MREMAP_MAYMOVE | MREMAP_FIXED, (char *)addr);
-	clock_gettime(CLOCK_MONOTONIC, &t_end);
 
 	if (dest_addr == MAP_FAILED) {
 		ksft_print_msg("mremap failed: %s\n", strerror(errno));
@@ -1022,16 +1018,6 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
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
@@ -1119,10 +1105,9 @@ static void run_mremap_test_case(struct test test_case,
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
@@ -1132,25 +1117,15 @@ static void run_mremap_test_case(struct test test_case,
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
@@ -1164,7 +1139,6 @@ int main(void)
 	int num_expand_tests = 2;
 	int num_misc_tests = 9;
 	struct test test_cases[MAX_TEST] = {};
-	struct test perf_test_cases[MAX_PERF_TEST];
 	int page_size;
 	time_t t;
 	FILE *maps_fp;
@@ -1254,22 +1228,7 @@ int main(void)
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
@@ -1296,15 +1255,6 @@ int main(void)
 
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


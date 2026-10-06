Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A77B3B71DE;
	Tue,  6 Oct 2026 09:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278776; cv=none; b=P6PyZMp6n2TOETP3xRvgFo1QFELqd7QjEIus3xaubw7SLudiWPRPGvUFtPrWifm2pldA/dGxXsD83RekplCj1kojpJM83aKrPrCyvnH3eW4plzle8kwGbYUXUUz0Cn2gznD+XSL88dPRINRh1ksBveW5u4hoyy5IY+SNR1xuuww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278776; c=relaxed/simple;
	bh=rtU2KV+C2LJM94PpPVfMUATGPARc0j4tBVn8FCLi9sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=StyVSL8XcQH1kqqnFzuQJBEQrsOYrNcy6ECjoWQczcin5esv2q3ofupgUX198531Hap6L22GksTqg3DjjJZE6QxpXSCrOoG79M7OreGTSUDyxD27MCzhJs05AzYASgRQ2k6whIUfpueo0Snoxouda5uLsagNiAvNzSWJBFR846M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OsSUmiTW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OsSUmiTW"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44F1F1516;
	Tue,  6 Oct 2026 02:26:10 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 61CDC3F763;
	Tue,  6 Oct 2026 02:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791278773; bh=rtU2KV+C2LJM94PpPVfMUATGPARc0j4tBVn8FCLi9sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OsSUmiTWYDfihVuU14mK0sLXi4q3ABzwXK3CWDKWHH4vntIQIljzoIWfOUi5LZPlI
	 xFBC3Jg/3Vo9XBSgBDXhXHjauNJTNCs5SGukw/U8QAvfItC4XIRO45gb+AGHZxLCcf
	 4AP2H9Tr8FaXosh5QxocOPDDDPGBzh9riUCgr6YM=
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
Subject: [PATCH v2 10/12] selftests/mm: mremap_test: replace validation threshold with sampled checks
Date: Tue,  6 Oct 2026 14:55:09 +0530
Message-ID: <20261006092511.145776-11-sarthak.sharma@arm.com>
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

mremap_test validates only the first 4MB of large mappings by
default. Now since the command line option has been removed,
this threshold is fixed and covers only the beginning of
each mapping.

Remove validation threshold and fully validate mappings that
fit within the 40MB random pattern buffer. For larger mappings,
initialize and validate 10 pages each at the start, middle
and end. This increases coverage without significantly
increasing the test's RSS.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 85 +++++++++++++-----------
 1 file changed, 48 insertions(+), 37 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 403c5495e160..955727607d4f 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -22,13 +22,7 @@
 #define EXPECT_FAILURE 1
 #define NON_OVERLAPPING 0
 #define OVERLAPPING 1
-#define VALIDATION_DEFAULT_THRESHOLD 4	/* 4MB */
-#define VALIDATION_NO_THRESHOLD 0	/* Verify the entire region */
 
-#ifndef MIN
-#define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
-#define MAX(X, Y) ((X) > (Y) ? (X) : (Y))
-#endif
 #define SIZE_MB(m) ((size_t)m * (1024 * 1024))
 #define SIZE_KB(k) ((size_t)k * 1024)
 
@@ -928,19 +922,49 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp, unsigned long page_siz
 }
 #endif /* __NR_userfaultfd */
 
-static int remap_region(struct config c, unsigned int threshold_mb,
-			char *rand_addr)
+static void populate_test_data(char *addr, size_t size, char *pattern_addr,
+		size_t pattern_size, size_t page_size)
+{
+	size_t mid, end;
+	size_t len = 10 * page_size;
+
+	if (size <= pattern_size) {
+		memcpy(addr, pattern_addr, size);
+		return;
+	}
+
+	end = size - len;
+	mid = end / 2;
+
+	memcpy(addr, pattern_addr, len);
+	memcpy(addr + mid, pattern_addr + len, len);
+	memcpy(addr + end, pattern_addr + 2 * len, len);
+}
+
+static bool validate_test_data(char *addr, size_t size, char *pattern_addr,
+		size_t pattern_size, size_t page_size)
+{
+	size_t mid, end;
+	size_t len = 10 * page_size;
+
+	if (size <= pattern_size)
+		return !memcmp(addr, pattern_addr, size);
+
+	end = size - len;
+	mid = end / 2;
+
+	return !memcmp(addr, pattern_addr, len) &&
+	       !memcmp(addr + mid, pattern_addr + len, len) &&
+	       !memcmp(addr + end, pattern_addr + 2 * len, len);
+}
+
+static int remap_region(struct config c, char *rand_addr, size_t rand_size,
+		size_t page_size)
 {
 	void *addr, *tmp_addr, *src_addr, *dest_addr, *dest_preamble_addr = NULL;
 	long long align_mask, offset;
-	unsigned long long threshold;
 	int ret = 0;
 
-	if (threshold_mb == VALIDATION_NO_THRESHOLD)
-		threshold = c.region_size;
-	else
-		threshold = MIN(threshold_mb * _1MB, c.region_size);
-
 	src_addr = get_source_mapping(c);
 	if (!src_addr) {
 		ret = -1;
@@ -948,7 +972,7 @@ static int remap_region(struct config c, unsigned int threshold_mb,
 	}
 
 	/* Set byte pattern for source block. */
-	memcpy(src_addr, rand_addr, threshold);
+	populate_test_data(src_addr, c.region_size, rand_addr, rand_size, page_size);
 
 	/* Mask to zero out lower bits of address for alignment */
 	align_mask = ~(c.dest_alignment - 1);
@@ -1002,7 +1026,8 @@ static int remap_region(struct config c, unsigned int threshold_mb,
 	}
 
 	/* Verify byte pattern after remapping */
-	if (memcmp(dest_addr, rand_addr, threshold)) {
+	if (!validate_test_data(dest_addr, c.region_size, rand_addr,
+				rand_size, page_size)) {
 		ksft_print_msg("Data after remap doesn't match\n");
 		ret = -1;
 		goto clean_up_dest;
@@ -1100,10 +1125,11 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 }
 
 static void run_mremap_test_case(struct test test_case,
-				 unsigned int threshold_mb,
-				 char *rand_addr)
+				 char *rand_addr,
+				 size_t rand_size,
+				 size_t page_size)
 {
-	int ret = remap_region(test_case.config, threshold_mb, rand_addr);
+	int ret = remap_region(test_case.config, rand_addr, rand_size, page_size);
 
 	if (ret < 0) {
 		if (test_case.expect_failure)
@@ -1124,12 +1150,6 @@ static void run_mremap_test_case(struct test test_case,
 int main(void)
 {
 	unsigned int i;
-	unsigned int threshold_mb = VALIDATION_DEFAULT_THRESHOLD;
-
-	/* hard-coded test configs */
-	size_t max_test_variable_region_size = _2GB;
-	size_t max_test_constant_region_size = _2MB;
-	size_t dest_preamble_size = 10 * _4MB;
 
 	unsigned int pattern_seed;
 	char *rand_addr;
@@ -1148,21 +1168,12 @@ int main(void)
 	pattern_seed = (unsigned int) time(&t);
 
 	ksft_print_msg("Test configs:\n");
-	ksft_print_msg("threshold_mb=%u\n", threshold_mb);
 	ksft_print_msg("pattern_seed=%u\n", pattern_seed);
 
 	/*
-	 * set preallocated random array according to test configs; see the
-	 * functions for the logic of setting the size
+	 * The 40MB destination preamble determines the random buffer size
 	 */
-	if (!threshold_mb)
-		rand_size = MAX(max_test_variable_region_size,
-				max_test_constant_region_size);
-	else
-		rand_size = MAX(MIN(threshold_mb * _1MB,
-				    max_test_variable_region_size),
-				max_test_constant_region_size);
-	rand_size = MAX(dest_preamble_size, rand_size);
+	rand_size = 10 * _4MB;
 
 	rand_addr = (char *)mmap(NULL, rand_size, PROT_READ | PROT_WRITE,
 				 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
@@ -1229,7 +1240,7 @@ int main(void)
 	ksft_set_plan(ARRAY_SIZE(test_cases) + num_expand_tests + num_misc_tests);
 
 	for (i = 0; i < ARRAY_SIZE(test_cases); i++)
-		run_mremap_test_case(test_cases[i], threshold_mb, rand_addr);
+		run_mremap_test_case(test_cases[i], rand_addr, rand_size, page_size);
 
 	maps_fp = fopen("/proc/self/maps", "r");
 
-- 
2.53.0


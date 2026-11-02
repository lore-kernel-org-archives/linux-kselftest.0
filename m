Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613831;
	b=kMNggv+TsjZQTH8p5CepEcBVz+6ELH0r2E86Bg/LZDlO+X66W9tJQQOmzzmwz1+m2lA4
	 n1Ol8h+yzVP9GplKT4AFXEmstfE6QUP7EEBaR5BVSOqqEnLTqm6+A4yXCMfhhVM8IdZx/
	 UM/Kui1WsyzEdTppgRT56N5xcy6N+nRleFgb6EfoQK5CT54A3OXveAKWy3uyWFpiN2JJj
	 lNZci8w8MZt1qh/0eziFBV8yn/LqZYDdIeKAmzykdb2u5eJZNwFidsG91SCgfTIVJW2HP
	 SshsO1WTYa8NtG3BkTFenDYc3Db6zRHkIYq5BWGGSmRB+aMScHqzh1xH7VT7d9Wdsfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613831;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EZFI/lghrWCtHux+dgu45SkP6jtwsu8V0UM4c/Ac4uw=;
	b=YelEH+kP1Badov7Wd1AjrDG+0BQvtNklNollhRzGfjJUeeEntcYV2qJsA1ISPa9HB+EB
	 KAhYKvnoClHQHY5L/5R35+nAAHtYO50cuGHWiUulRqJxFCTJtmfm/apX7qz57LELlnAXw
	 ikFJcjJUV3DhWCCRigPiqLhvkPiN58z7EUiMu069T+2TbVfPJsWLcNkGk0InczGZDLOu4
	 Z++gGj1GSYKIy0CLEj6NDbcD7OenVJQkXcaEt3Lyqo3D2ta2JLXiXLn3+p7JlE3rvrjL7
	 ocG7lOUgooPTCrlt2hCCk2RzngAo7/qtc1cieG7vRqIYGh+4U1ul66klgzd6UaXSDDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HxtUQgez;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68635606A336;
	Mon,  2 Nov 2026 10:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68635606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HxtUQgez
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAD901595;
	Mon,  2 Nov 2026 02:03:47 -0800 (PST)
Received: from a081061.arm.com (unknown [10.163.156.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B7BDA3F59E;
	Mon,  2 Nov 2026 02:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793613831; bh=JeVzv9NQz+Y+oK0TojJCh1R9phHXpiaYLkfzxvD34FQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HxtUQgezyM6AXpWKLe/S0ihuJXrVR0dJIceYhT5wnWp0yPZ7+jdpbAH18eN9cxpsu
	 RHWrF9LhtPohzlyi5M+2aPkIl6RnTGTrRAwp+zKtYX7QE0sGk1phBcjmhbJoUJXIpF
	 TogNqFGV/PpSUdlQ9UpxwkO5UP7Y7p0HeIm2B8f8=
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
Subject: [PATCH RESEND v2 10/12] selftests/mm: mremap_test: replace validation threshold with sampled checks
Date: Mon,  2 Nov 2026 15:32:09 +0530
Message-ID: <20261102100211.141831-11-sarthak.sharma@arm.com>
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
index bf825ffa29f6..572e4d9e9f00 100644
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
@@ -1004,7 +1028,8 @@ static int remap_region(struct config c, unsigned int threshold_mb,
 	}
 
 	/* Verify byte pattern after remapping */
-	if (memcmp(dest_addr, rand_addr, threshold)) {
+	if (!validate_test_data(dest_addr, c.region_size, rand_addr,
+				rand_size, page_size)) {
 		ksft_print_msg("Data after remap doesn't match\n");
 		ret = -1;
 		goto clean_up_dest;
@@ -1102,10 +1127,11 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
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
@@ -1126,12 +1152,6 @@ static void run_mremap_test_case(struct test test_case,
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
@@ -1150,21 +1170,12 @@ int main(void)
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
@@ -1231,7 +1242,7 @@ int main(void)
 	ksft_set_plan(ARRAY_SIZE(test_cases) + num_expand_tests + num_misc_tests);
 
 	for (i = 0; i < ARRAY_SIZE(test_cases); i++)
-		run_mremap_test_case(test_cases[i], threshold_mb, rand_addr);
+		run_mremap_test_case(test_cases[i], rand_addr, rand_size, page_size);
 
 	maps_fp = fopen("/proc/self/maps", "r");
 
-- 
2.53.0


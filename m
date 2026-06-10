Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737563F6612;
	Wed, 10 Jun 2026 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087385; cv=none; b=l6KmdUnLxikFjoMn8Sv+vyc5vMQaUv84KEprFYhhM59FrrzffSmsxXbvL8Wj6pul/tMjHmJ14EH/fKkvz0mK3j/XM4VmaFqmt9o5t4kjCpppsnBlQkWLqth17v9l9X7digIqSuawh34kFHaXoC37n36lRlBpzpobUzMZ/6terZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087385; c=relaxed/simple;
	bh=fB15VNdZCyWcSQmTlCl6G3NqZ0dVluGjmSnUsffWFrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sln1b/+CW3KvHC0URKTCFKmhCtI8CiuaoJWfzeh0EwrXuN289uUjsGPJ5e0UsyUKfCNMi8w1fCoQVsX5V7cx7EaoxyGKwWbN2H8dd5qmxK6BHKFhQLmJEq6zIlwI4d82QYI8zn7gbYIfA1Br3h3hEKAANx4jJf5vegfPvqsjsXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Kqpng4mo; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Kqpng4mo"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781087380; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=oeDhCWxyn2Hq9Tl6jnQX/f83a0uxpv/FV7uC2BVaW8M=;
	b=Kqpng4mor28w2Kw5Q21+kB3hzTM8Rsi/RF2XMq5GVDScLQdjQf0EBS9oyYZtdYon9axb/YpB/G9oR3eGmRmuIkmrfc0bX66dVBxAC+QckjeLd3gxR2sV8db0g31tFDpDfwtDYPZB9wvaFF8A2YOqDByLxZ8T0DK8u97IUmfZ5Qk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X4aU0AL_1781087378;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4aU0AL_1781087378 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Jun 2026 18:29:38 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com
Cc: willy@infradead.org,
	ziy@nvidia.com,
	liam@infradead.org,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 11/11] selftests: mm: add mTHP collapse test cases
Date: Wed, 10 Jun 2026 18:29:19 +0800
Message-ID: <fcf0fcc52aa6c4e18682fcb302fe9371a8d800c3.1781083630.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
References: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added a new command 'mthp_khugepaged' for mTHP collapse, along with the '-c'
parameter to specify the collapse order. Additionally, added mTHP collapse
test cases for 'collapse_full', 'collapse_empty', and 'collapse_single_mthp'
for both anonymous pages and shmem. All khugepaged test cases passed.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 tools/testing/selftests/mm/khugepaged.c   | 135 +++++++++++++++++++---
 tools/testing/selftests/mm/run_vmtests.sh |   4 +
 2 files changed, 120 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index f69be6be0ecd..8975be5b7b2f 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -26,9 +26,11 @@
 
 #define BASE_ADDR ((void *)(1UL << 30))
 static unsigned long hpage_pmd_size;
+static int hpage_pmd_order;
 static unsigned long page_size;
 static int hpage_pmd_nr;
 static int anon_order;
+static int collapse_order;
 
 #define PID_SMAPS "/proc/self/smaps"
 #define TEST_FILE "collapse_test_file"
@@ -69,6 +71,7 @@ struct collapse_context {
 };
 
 static struct collapse_context *khugepaged_context;
+static struct collapse_context *mthp_khugepaged_context;
 static struct collapse_context *madvise_context;
 
 struct file_info {
@@ -554,25 +557,25 @@ static void madvise_collapse(const char *msg, char *p, int nr_hpages,
 }
 
 #define TICK 500000
-static bool wait_for_scan(const char *msg, char *p, int nr_hpages,
-			  struct mem_ops *ops)
+static bool wait_for_scan(const char *msg, char *p, unsigned long size,
+		int nr_hpages, int collap_order, struct mem_ops *ops)
 {
-	unsigned long size = nr_hpages * hpage_pmd_size;
+	unsigned long hpage_size = page_size << collap_order;
 	int full_scans;
 	int timeout = 6; /* 3 seconds */
 
 	/* Sanity check */
-	if (!ops->check_huge(p, size, 0, hpage_pmd_size))
+	if (!ops->check_huge(p, size, 0, hpage_size))
 		ksft_exit_fail_msg("Unexpected huge page\n");
 
-	madvise(p, nr_hpages * hpage_pmd_size, MADV_HUGEPAGE);
+	madvise(p, size, MADV_HUGEPAGE);
 
 	/* Wait until the second full_scan completed */
 	full_scans = thp_read_num("khugepaged/full_scans") + 2;
 
 	ksft_print_msg("%s...", msg);
 	while (timeout--) {
-		if (ops->check_huge(p, size, nr_hpages, hpage_pmd_size))
+		if (ops->check_huge(p, size, nr_hpages, hpage_size))
 			break;
 		if (thp_read_num("khugepaged/full_scans") >= full_scans)
 			break;
@@ -595,7 +598,7 @@ static void khugepaged_collapse(const char *msg, char *p, int nr_hpages,
 	if (!is_tmpfs(ops) && ops == &__read_write_file_write_ops)
 		expect = false;
 
-	if (wait_for_scan(msg, p, nr_hpages, ops)) {
+	if (wait_for_scan(msg, p, size, nr_hpages, hpage_pmd_order, ops)) {
 		if (expect)
 			fail("Timeout");
 		else
@@ -617,12 +620,65 @@ static void khugepaged_collapse(const char *msg, char *p, int nr_hpages,
 		fail("Fail");
 }
 
+static void mthp_khugepaged_collapse(const char *msg, char *p, int nr_hpages,
+				struct mem_ops *ops, bool expect)
+{
+	unsigned long hpage_size = page_size << collapse_order;
+	struct thp_settings settings = *thp_current_settings();
+	/* mTHP collpase only allocates PMD sized memory */
+	unsigned long size = hpage_pmd_size;
+
+	/* Set mTHP setting for mTHP collapse */
+	if (ops == &__anon_ops) {
+		settings.thp_enabled = THP_NEVER;
+		settings.hugepages[collapse_order].enabled = THP_ALWAYS;
+	} else if (ops == &__shmem_ops) {
+		settings.shmem_enabled = SHMEM_NEVER;
+		settings.shmem_hugepages[collapse_order].enabled = SHMEM_ALWAYS;
+	}
+
+	thp_push_settings(&settings);
+
+	if (wait_for_scan(msg, p, size, nr_hpages, collapse_order, ops)) {
+		if (expect)
+			fail("Timeout");
+		else
+			success("OK");
+
+		/* Restore THP settings for mTHP collapse. */
+		thp_pop_settings();
+		return;
+	}
+
+	/*
+	 * For file and shmem memory, khugepaged only retracts pte entries after
+	 * putting the new hugepage in the page cache. The hugepage must be
+	 * subsequently refaulted to install the pmd mapping for the mm.
+	 */
+	if (ops != &__anon_ops)
+		ops->fault(p, 0, nr_hpages * hpage_size);
+
+	if (ops->check_huge(p, size, expect ? nr_hpages : 0, hpage_size))
+		success("OK");
+	else
+		fail("Fail");
+
+	/* Restore THP settings for mTHP collapse. */
+	thp_pop_settings();
+}
+
 static struct collapse_context __khugepaged_context = {
 	.collapse = &khugepaged_collapse,
 	.enforce_pte_scan_limits = true,
 	.name = "khugepaged",
 };
 
+static struct collapse_context __mthp_khugepaged_context = {
+	.collapse = &mthp_khugepaged_collapse,
+	.enforce_pte_scan_limits = true,
+	.name = "mthp_khugepaged",
+};
+
 static struct collapse_context __madvise_context = {
 	.collapse = &madvise_collapse,
 	.enforce_pte_scan_limits = false,
@@ -661,10 +717,17 @@ static void alloc_at_fault(void)
 static void collapse_full(struct collapse_context *c, struct mem_ops *ops)
 {
 	void *p;
-	int nr_hpages = 4;
+	int nr_pmds = 4, nr_hpages = 4;
 	unsigned long size = nr_hpages * hpage_pmd_size;
 
-	p = ops->setup_area(nr_hpages);
+	/* Only try 1 PMD sized range for mTHP collapse. */
+	if (c == &__mthp_khugepaged_context) {
+		nr_pmds = 1;
+		nr_hpages = 1 << (hpage_pmd_order - collapse_order);
+		size = hpage_pmd_size;
+	}
+
+	p = ops->setup_area(nr_pmds);
 	ops->fault(p, 0, size);
 	c->collapse("Collapse multiple fully populated PTE table", p, nr_hpages,
 		    ops, true);
@@ -676,10 +739,31 @@ static void collapse_full(struct collapse_context *c, struct mem_ops *ops)
 
 static void collapse_empty(struct collapse_context *c, struct mem_ops *ops)
 {
+	int nr_hpages = 1;
+	void *p;
+
+	if (c == &__mthp_khugepaged_context)
+		nr_hpages = 1 << (hpage_pmd_order - collapse_order);
+
+	p = ops->setup_area(1);
+	c->collapse("Do not collapse empty PTE table", p, nr_hpages, ops, false);
+	ops->cleanup_area(p, hpage_pmd_size);
+	ksft_test_result_report(exit_status, "%s\n", __func__);
+}
+
+static void collapse_single_mthp(struct collapse_context *c, struct mem_ops *ops)
+{
+	unsigned long hpage_size = page_size << collapse_order;
 	void *p;
 
 	p = ops->setup_area(1);
-	c->collapse("Do not collapse empty PTE table", p, 1, ops, false);
+	/*
+	 * Only fault collapse_order sized ranges, and only check 1
+	 * collapse_order sized huge page.
+	 */
+	ops->fault(p, 0, hpage_size);
+	c->collapse("Collapse PTE table with half PTE entries present",
+		p, 1, ops, true);
 	ops->cleanup_area(p, hpage_pmd_size);
 	ksft_test_result_report(exit_status, "%s\n", __func__);
 }
@@ -1081,8 +1165,8 @@ static void madvise_retracted_page_tables(struct collapse_context *c,
 	ops->fault(p, 0, size);
 
 	/* Let khugepaged collapse and leave pmd cleared */
-	if (wait_for_scan("Collapse and leave PMD cleared", p, nr_hpages,
-			  ops)) {
+	if (wait_for_scan("Collapse and leave PMD cleared", p, size, nr_hpages,
+			  hpage_pmd_order, ops)) {
 		fail("Timeout");
 		return;
 	}
@@ -1098,7 +1182,7 @@ static void usage(void)
 {
 	fprintf(stderr, "\nUsage: ./khugepaged [OPTIONS] <test type> [dir]\n\n");
 	fprintf(stderr, "\t<test type>\t: <context>:<mem_type>\n");
-	fprintf(stderr, "\t<context>\t: [all|khugepaged|madvise]\n");
+	fprintf(stderr, "\t<context>\t: [all|khugepaged|mthp_khugepaged|madvise]\n");
 	fprintf(stderr, "\t<mem_type>\t: [all|anon|file|shmem]\n");
 	fprintf(stderr, "\n\t\"file,all\" mem_type requires [dir] argument\n");
 	fprintf(stderr, "\n\t\"file,all\" mem_type requires a file system\n");
@@ -1109,6 +1193,7 @@ static void usage(void)
 	fprintf(stderr,	"\t\t-h: This help message.\n");
 	fprintf(stderr,	"\t\t-s: mTHP size, expressed as page order.\n");
 	fprintf(stderr,	"\t\t    Defaults to 0. Use this size for anon or shmem allocations.\n");
+	fprintf(stderr,	"\t\t-c: collapse order for mTHP collapse, expressed as page order.\n");
 	exit(1);
 }
 
@@ -1118,11 +1203,14 @@ static void parse_test_type(int argc, char **argv)
 	char *buf;
 	const char *token;
 
-	while ((opt = getopt(argc, argv, "s:h")) != -1) {
+	while ((opt = getopt(argc, argv, "s:c:h")) != -1) {
 		switch (opt) {
 		case 's':
 			anon_order = atoi(optarg);
 			break;
+		case 'c':
+			collapse_order = atoi(optarg);
+			break;
 		case 'h':
 		default:
 			usage();
@@ -1148,6 +1236,10 @@ static void parse_test_type(int argc, char **argv)
 		madvise_context =  &__madvise_context;
 	} else if (!strcmp(token, "khugepaged")) {
 		khugepaged_context =  &__khugepaged_context;
+	} else if (!strcmp(token, "mthp_khugepaged")) {
+		mthp_khugepaged_context =  &__mthp_khugepaged_context;
+		if (collapse_order == 0 || collapse_order >= hpage_pmd_order)
+			usage();
 	} else if (!strcmp(token, "madvise")) {
 		madvise_context =  &__madvise_context;
 	} else {
@@ -1213,7 +1305,6 @@ static int nr_test_cases;
 
 int main(int argc, char **argv)
 {
-	int hpage_pmd_order;
 	struct thp_settings default_settings = {
 		.thp_enabled = THP_MADVISE,
 		.thp_defrag = THP_DEFRAG_ALWAYS,
@@ -1239,10 +1330,6 @@ int main(int argc, char **argv)
 	if (!thp_is_enabled())
 		ksft_exit_skip("Transparent Hugepages not available\n");
 
-	parse_test_type(argc, argv);
-
-	setbuf(stdout, NULL);
-
 	page_size = getpagesize();
 	hpage_pmd_size = read_pmd_pagesize();
 	if (!hpage_pmd_size)
@@ -1250,6 +1337,10 @@ int main(int argc, char **argv)
 	hpage_pmd_nr = hpage_pmd_size / page_size;
 	hpage_pmd_order = __builtin_ctz(hpage_pmd_nr);
 
+	parse_test_type(argc, argv);
+
+	setbuf(stdout, NULL);
+
 	default_settings.khugepaged.max_ptes_none = hpage_pmd_nr - 1;
 	default_settings.khugepaged.max_ptes_swap = hpage_pmd_nr / 8;
 	default_settings.khugepaged.max_ptes_shared = hpage_pmd_nr / 2;
@@ -1267,6 +1358,8 @@ int main(int argc, char **argv)
 	TEST(collapse_full, khugepaged_context, read_write_file_read_ops);
 	TEST(collapse_full, khugepaged_context, read_write_file_write_ops);
 	TEST(collapse_full, khugepaged_context, shmem_ops);
+	TEST(collapse_full, mthp_khugepaged_context, anon_ops);
+	TEST(collapse_full, mthp_khugepaged_context, shmem_ops);
 	TEST(collapse_full, madvise_context, anon_ops);
 	TEST(collapse_full, madvise_context, read_only_file_ops);
 	TEST(collapse_full, madvise_context, read_write_file_read_ops);
@@ -1274,8 +1367,12 @@ int main(int argc, char **argv)
 	TEST(collapse_full, madvise_context, shmem_ops);
 
 	TEST(collapse_empty, khugepaged_context, anon_ops);
+	TEST(collapse_empty, mthp_khugepaged_context, anon_ops);
 	TEST(collapse_empty, madvise_context, anon_ops);
 
+	TEST(collapse_single_mthp, mthp_khugepaged_context, anon_ops);
+	TEST(collapse_single_mthp, mthp_khugepaged_context, shmem_ops);
+
 	TEST(collapse_single_pte_entry, khugepaged_context, anon_ops);
 	TEST(collapse_single_pte_entry, khugepaged_context, read_only_file_ops);
 	TEST(collapse_single_pte_entry, khugepaged_context, read_write_file_read_ops);
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 8c296dedf047..c0f4f3e5f1f1 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -411,6 +411,10 @@ CATEGORY="thp" run_test ./khugepaged all:shmem
 
 CATEGORY="thp" run_test ./khugepaged -s 4 all:shmem
 
+CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:anon
+
+CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:shmem
+
 # Try to create XFS if not provided
 if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
     if test_selected "thp"; then
-- 
2.47.3


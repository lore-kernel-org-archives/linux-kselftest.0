Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F45C45C704;
	Wed, 12 Aug 2026 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541025; cv=none; b=LL/wFdg1YcDfqTNMAQdu8NIq4uziX5a7xD2wyWKzuKYzJ1Md1264xGs5BexByyAvtsxNDuoEl5xYXoHw/PVCKuATA7GN9g0xeE3ndpDzqMQEHaKiKRUSxrOvxzWvjkQ+OjOemlC5iWFJ48GtsxGcwE5MfrFOyAWe1zsAeZPDRWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541025; c=relaxed/simple;
	bh=MVPtYn0BbjGeUCqhsSUxODxC73aKZw2N13CpUSkBo2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y67ykArqXn9Tmoqxc5Gf1cxZlK3K4IN2MQNFD/j32Q4urQ0sMP4cfM69dcUq22E4mSgrmDBHN/B5KVFO5yFZiGftPL4DEhQCAc7OicoLfcXT20OcWhczmN/y3zK/rmJWXWvKWkRNHNtAliVagJ0lewGfjapq1s8z3pVN254wTHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=DrRJ4skz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZD3siZzM; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="DrRJ4skz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZD3siZzM"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id B90F21D00170;
	Wed, 12 Aug 2026 09:23:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 12 Aug 2026 09:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786541022; x=
	1786627422; bh=8jKw/Rh2BzJjfFUeMIccyUKsF4XLAd9SgrDy5I5e8ZA=; b=D
	rRJ4skzYiRYr5OL37Xe+9qufDx7Lzxdk3MB63J/PCpZJQq26e9oKhgY0J7LUGluW
	zrR78xjvubiDIB0mPkcCAhQQlRzM0kSHWfzEB3cTm4OEYOl65q9fZlCxAWYeWU36
	klqvcIq3uNSnMv+jLhe7icgx/C9QBU6o+VlgbqIM15KgWQvielbEuT11em58hy4r
	HNytnpEHYiaIwhuKPfzQ6yn57Xu2YzzWwZl+dm8pp3hUuho5lxvY6sBCMJiLjgxK
	/r07KtP5bfR4VRoEfTDIUoAY1kDpN6cErtfpV5dkZVgZljVuyIILVxEEL2yTMMKL
	LM02s4nKn/iPd6RziFrjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786541022; x=1786627422; bh=8
	jKw/Rh2BzJjfFUeMIccyUKsF4XLAd9SgrDy5I5e8ZA=; b=ZD3siZzMuhvbgQ6mn
	j4siAbf+JaheR5KMndotrjoJibIwh8Rx17OL27Jwp++VgM54k1kNDyEQ0DXJBhm3
	nXX0AyG75ychXRA2F3eImG6mdL8YRqj3Z7DzAnDXXE9Fz7Jsg40GmdU/FrNXTJ1o
	d1j5Ep/H+1+s3OFclXEN7g5GDzLWtr+8ilVWg8stCr9fXheaZUHljI9gUE8PoGHV
	rwytThgfd3kn6aBJSennUVoIV85lHcZKzX3Xep6xPrTFVG5c7L0FiD7Rp9upNIwW
	v1MbIxVJVIAC5ECOGCycIMURl+Bsf7HcJoWBtXKbDkDo/+ZF8vkwLmE94HvcFyLP
	473YA==
X-ME-Sender: <xms:3nN8avosCtL3HJidglwhe2R8PeNQ5s7FVrX-UiThQOD7HAp2D_rnXQ>
    <xme:3nN8atkJYKMUI6wylbLzmhnmSjqondCKxYVWAWBaOJ6ZKSY8Pzg_VlPWMg51LIbDD
    Wt_LhIxxbOwsp2myJoOgYdIoBZNe4WZQR8WPPrVR-l-GYw6310YjV8>
X-ME-Received: <xmr:3nN8aktnhmPzCVPTs-6PHhjnKrCKDnMB8_IQ15cuqF5uVyml7iWareBVl5M>
X-ME-Proxy-Cause: dmFkZTEJjeAG5mPidrlxx5WYeorxbJVgJIKvTA5wXegfbw/cux8oxcUciNIpDIuTJE+lqf
    6MvKMtIYnfrpE9CE9brIFiUghXXeSu7acy7yTiQzGdGRUaVwSNB0Wtfy8GXhxbblHF9PD0
    zPXwLCOAHUDQMRV+OGFoRd51Bfw/8mHZFt6NMjCskGz8KRys5NyppP3tQz3pg+1FIu5GBp
    PJQAWgZTF13VhomE3d+3g7Xo8LQtMXvrRUSh5YzlZkIRUVCw4Olhx0/o/iEmltBto/jcsB
    4mCen6EwKCCQNN9U1Ldmtp3E1EMhPbaX1d9tgEecmRx82uYLegpVLGl6lWthe5rRIcaITh
    sTJxhOaQa0UDlgJNE1X0o3KXKkJIR7vSM7Z6eevJ8msNKRqMwVvCiUidN0tRNeaYtAC8DY
    EarZSmGvSZnVQ0bq7TbqkGVcxX3ZqE6DlyK2cROhVkzNx0GJmFzhBdan28pI7NjPtnDz8t
    l9O1/0Hsa+Y+ihi+BscZkdEqyXCey8BGiviv1JhVAfFKQ1w9WaIj2nU4MXnll8XNIIU4Aw
    UGeFg/1EvbbF/XcY8WJlj+c9w+luTI0H5paeUrYh+Ig+Yp9Jbx6Ka+rfpwqH8mX+HjYMVR
    bf5kYEdmxvoC5T89HKOazFgyrr/R5WJY0h/fhQO1xiYc4tnRoqQQBhTPK6Iw
X-ME-Proxy: <xmx:3nN8asdtB9aMK0rE4AH9JVNDhG6NRQsN66RTOicBQEYwKacBkAw17g>
    <xmx:3nN8ambaBmL-TkHYSvxJKdn5lFa5-yAo77falqEYExPHG2xnG_yQOg>
    <xmx:3nN8ak2zc657ddC2FcARrzma5_wHX2FA5-WYpEXKTVgs5koz7f7vTQ>
    <xmx:3nN8avqrR5sre60RrZ1EuwwINrkSrilNF96YN8XPuLfROPcfE6Co7w>
    <xmx:3nN8aqvyt3aUZfv34iqZMqVl4AuMC4V68wCr-3hFv_AXPh6hRj-XTXO0>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 09:23:41 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	nico.pache@linux.dev
Cc: baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	dev.jain@arm.com,
	hughd@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	mhocko@suse.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	surenb@google.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	ziy@nvidia.com,
	usama.anjum@arm.com,
	agordeev@linux.ibm.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kas@kernel.org
Subject: [PATCH v3 13/18] selftests/mm: run every supported collapse order by default
Date: Wed, 12 Aug 2026 14:22:59 +0100
Message-ID: <20260812132304.199287-14-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812132304.199287-1-kirill@shutemov.name>
References: <20260812132304.199287-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The mTHP collapse cases only run when the caller names both the context
and an order, so a plain ./khugepaged covers the PMD contexts on anon and
nothing else.  run_vmtests.sh pinned order 4 and covered no other.

Without -c, run the mTHP cases once per supported anon THP order below the
PMD, and include that context in both the no-argument invocation and
"all".  -c still pins one order, and now says what is wrong when the order
is above the PMD or unsupported instead of printing the usage text.  An
order at or below the -s source order is skipped: the sources would
already be the size being asked for.

Both orders end up as array indices and shift counts, so -s rejects a
negative order and -c anything at or below 0, rather than letting either
reach them.

The mTHP context has only anon cases, so a run that names a different
mem_type -- "all:shmem", say -- drops it again rather than refusing to
start.  Naming both explicitly still does.

A case carries the order it was registered at, so a result names it:

  # Run test: collapse_order_max_ptes_none (mthp_khugepaged:anon, order 6)

On x86-64 with 4K pages that is orders 2 through 8, and ./khugepaged goes
from 28 results to 77 in 21 seconds, so run_vmtests.sh can drop its pinned
order-4 line.

Assisted-by: Claude-Code:claude-opus-5
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c   | 111 ++++++++++++++++++----
 tools/testing/selftests/mm/run_vmtests.sh |   2 -
 2 files changed, 92 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 9c8830fed0a2..f5773d447542 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -31,6 +31,9 @@ static unsigned long page_size;
 static int hpage_pmd_nr;
 static int anon_order;
 static int collapse_order;
+static bool collapse_order_given;
+static int collapse_orders[NR_ORDERS];
+static int nr_collapse_orders;
 static int pagemap_fd = -1;
 static int kpageflags_fd = -1;
 
@@ -1548,6 +1551,7 @@ static void usage(void)
 	fprintf(stderr,	"\t\t-s: mTHP size, expressed as page order.\n");
 	fprintf(stderr,	"\t\t    Defaults to 0. Use this size for anon or shmem allocations.\n");
 	fprintf(stderr,	"\t\t-c: collapse order for mTHP collapse, expressed as page order.\n");
+	fprintf(stderr,	"\t\t    Defaults to every supported order below the PMD.\n");
 	fprintf(stderr,	"\t\t    With -s, -s names the mTHP source order for the\n");
 	fprintf(stderr,	"\t\t    mixed-source case (source order below the target).\n");
 	exit(1);
@@ -1555,6 +1559,7 @@ static void usage(void)
 
 static void parse_test_type(int argc, char **argv)
 {
+	bool mthp_context_implied = false;
 	int opt;
 	char *buf;
 	const char *token;
@@ -1566,6 +1571,7 @@ static void parse_test_type(int argc, char **argv)
 			break;
 		case 'c':
 			collapse_order = atoi(optarg);
+			collapse_order_given = true;
 			break;
 		case 'h':
 		default:
@@ -1573,12 +1579,25 @@ static void parse_test_type(int argc, char **argv)
 		}
 	}
 
+	/*
+	 * Both orders end up as array indices and shift counts, so neither
+	 * can be negative, and a zero collapse order asks for base pages.
+	 */
+	if (anon_order < 0 || anon_order > hpage_pmd_order)
+		ksft_exit_fail_msg("-s takes an order in 0..%d, not %d\n",
+				   hpage_pmd_order, anon_order);
+	if (collapse_order_given &&
+	    (collapse_order <= 0 || collapse_order > hpage_pmd_order))
+		ksft_exit_fail_msg("-c takes an order in 1..%d, not %d\n",
+				   hpage_pmd_order, collapse_order);
+
 	argv += optind;
 	argc -= optind;
 
 	if (argc == 0) {
-		/* Backwards compatibility */
+		/* Everything that needs no argument of its own: anon, every context */
 		khugepaged_context =  &__khugepaged_context;
+		mthp_khugepaged_context =  &__mthp_khugepaged_context;
 		madvise_context =  &__madvise_context;
 		anon_ops = &__anon_ops;
 		return;
@@ -1589,13 +1608,19 @@ static void parse_test_type(int argc, char **argv)
 
 	if (!strcmp(token, "all")) {
 		khugepaged_context =  &__khugepaged_context;
+		mthp_khugepaged_context =  &__mthp_khugepaged_context;
 		madvise_context =  &__madvise_context;
+
+		/*
+		 * "all" sweeps the mTHP context in, but it only has anon
+		 * cases: step it aside for the other mem_types rather than
+		 * refusing the whole run.
+		 */
+		mthp_context_implied = true;
 	} else if (!strcmp(token, "khugepaged")) {
 		khugepaged_context =  &__khugepaged_context;
 	} else if (!strcmp(token, "mthp_khugepaged")) {
 		mthp_khugepaged_context =  &__mthp_khugepaged_context;
-		if (collapse_order <= 0 || collapse_order >= hpage_pmd_order)
-			usage();
 	} else if (!strcmp(token, "madvise")) {
 		madvise_context =  &__madvise_context;
 	} else {
@@ -1611,20 +1636,20 @@ static void parse_test_type(int argc, char **argv)
 		read_write_file_write_ops =  &__read_write_file_write_ops;
 		anon_ops = &__anon_ops;
 		shmem_ops = &__shmem_ops;
-		if (mthp_khugepaged_context)
-			usage();
 	} else if (!strcmp(buf, "anon")) {
 		anon_ops = &__anon_ops;
 	} else if (!strcmp(buf, "file")) {
 		read_only_file_ops =  &__read_only_file_ops;
 		read_write_file_read_ops =  &__read_write_file_read_ops;
 		read_write_file_write_ops =  &__read_write_file_write_ops;
-		if (mthp_khugepaged_context)
+		if (mthp_khugepaged_context && !mthp_context_implied)
 			usage();
+		mthp_khugepaged_context = NULL;
 	} else if (!strcmp(buf, "shmem")) {
 		shmem_ops = &__shmem_ops;
-		if (mthp_khugepaged_context)
+		if (mthp_khugepaged_context && !mthp_context_implied)
 			usage();
+		mthp_khugepaged_context = NULL;
 	} else {
 		usage();
 	}
@@ -1646,8 +1671,13 @@ struct test_case {
 	struct mem_ops *ops;
 	const char *desc;
 	test_fn fn;
+	int order;		/* mTHP contexts: the collapse order */
 };
 
+/*
+ * Enough for every case at every order the kernel offers: the mTHP context
+ * runs its cases once per supported order below the PMD.
+ */
 #define MAX_TEST_CASES 256
 static struct test_case test_cases[MAX_TEST_CASES];
 static int nr_test_cases;
@@ -1661,6 +1691,7 @@ static int nr_test_cases;
 			.ops	= o,					\
 			.desc	= #t,					\
 			.fn	= t,					\
+			.order	= collapse_order,			\
 		};							\
 	}								\
 	} while (0)
@@ -1701,10 +1732,40 @@ int main(int argc, char **argv)
 
 	parse_test_type(argc, argv);
 
-	if (mthp_khugepaged_context &&
-	    !(thp_supported_orders() & (1UL << collapse_order)))
-		ksft_exit_skip("Order %d is not a supported anon THP order\n",
-			       collapse_order);
+	if (mthp_khugepaged_context) {
+		unsigned long orders = thp_supported_orders();
+
+		if (collapse_order_given) {
+			/* -c pins one order; it has to be one we can build */
+			if (collapse_order >= hpage_pmd_order)
+				ksft_exit_fail_msg("-c takes an order below the PMD order (%d)\n",
+						   hpage_pmd_order);
+			if (!(orders & (1UL << collapse_order)))
+				ksft_exit_skip("Order %d is not a supported anon THP order\n",
+					       collapse_order);
+			if (collapse_order <= anon_order)
+				ksft_exit_skip("-c %d needs a source order below it, -s says %d\n",
+					       collapse_order, anon_order);
+			collapse_orders[nr_collapse_orders++] = collapse_order;
+		} else {
+			/*
+			 * Otherwise every order a collapse could produce.  -s
+			 * makes the fault path hand out folios of that order,
+			 * so a target at or below it has nothing to collapse:
+			 * the sources are already the size being asked for.
+			 */
+			int first = anon_order ? anon_order + 1 : MIN_MTHP_ORDER;
+
+			if (first < MIN_MTHP_ORDER)
+				first = MIN_MTHP_ORDER;
+			for (int i = first; i < hpage_pmd_order; i++) {
+				if (orders & (1UL << i))
+					collapse_orders[nr_collapse_orders++] = i;
+			}
+			if (!nr_collapse_orders)
+				ksft_print_msg("mTHP cases skipped: no order above the source\n");
+		}
+	}
 
 	if (mthp_khugepaged_context) {
 		pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
@@ -1765,7 +1826,17 @@ int main(int argc, char **argv)
 	TEST(collapse_full, khugepaged_context, read_write_file_read_ops);
 	TEST(collapse_full, khugepaged_context, read_write_file_write_ops);
 	TEST(collapse_full, khugepaged_context, shmem_ops);
-	TEST(collapse_full, mthp_khugepaged_context, anon_ops);
+	for (int i = 0; i < nr_collapse_orders; i++) {
+		collapse_order = collapse_orders[i];
+		TEST(collapse_full, mthp_khugepaged_context, anon_ops);
+		TEST(collapse_empty, mthp_khugepaged_context, anon_ops);
+		TEST(collapse_single_mthp, mthp_khugepaged_context, anon_ops);
+		TEST(collapse_order_single_window, mthp_khugepaged_context, anon_ops);
+		TEST(collapse_order_partial_window, mthp_khugepaged_context, anon_ops);
+		TEST(collapse_order_max_ptes_none, mthp_khugepaged_context, anon_ops);
+		TEST(collapse_order_mixed_sources, mthp_khugepaged_context, anon_ops);
+	}
+
 	TEST(collapse_full, madvise_context, anon_ops);
 	TEST(collapse_full, madvise_context, read_only_file_ops);
 	TEST(collapse_full, madvise_context, read_write_file_read_ops);
@@ -1773,14 +1844,8 @@ int main(int argc, char **argv)
 	TEST(collapse_full, madvise_context, shmem_ops);
 
 	TEST(collapse_empty, khugepaged_context, anon_ops);
-	TEST(collapse_empty, mthp_khugepaged_context, anon_ops);
 	TEST(collapse_empty, madvise_context, anon_ops);
 
-	TEST(collapse_single_mthp, mthp_khugepaged_context, anon_ops);
-	TEST(collapse_order_single_window, mthp_khugepaged_context, anon_ops);
-	TEST(collapse_order_partial_window, mthp_khugepaged_context, anon_ops);
-	TEST(collapse_order_max_ptes_none, mthp_khugepaged_context, anon_ops);
-	TEST(collapse_order_mixed_sources, mthp_khugepaged_context, anon_ops);
 
 	TEST(collapse_single_pte_entry, khugepaged_context, anon_ops);
 	TEST(collapse_single_pte_entry, khugepaged_context, read_only_file_ops);
@@ -1854,7 +1919,15 @@ int main(int argc, char **argv)
 	for (int i = 0; i < nr_test_cases; i++) {
 		struct test_case *t = &test_cases[i];
 
-		ksft_print_msg("\n# Run test: %s (%s:%s)\n", t->desc, t->ctx->name, t->ops->name);
+		if (t->ctx == &__mthp_khugepaged_context) {
+			collapse_order = t->order;
+			ksft_print_msg("\n# Run test: %s (%s:%s, order %d)\n",
+				       t->desc, t->ctx->name, t->ops->name,
+				       t->order);
+		} else {
+			ksft_print_msg("\n# Run test: %s (%s:%s)\n", t->desc,
+				       t->ctx->name, t->ops->name);
+		}
 		t->fn(t->ctx, t->ops);
 	}
 
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 2652a7920b80..8bf898b71350 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -412,8 +412,6 @@ CATEGORY="thp" run_test ./khugepaged all:shmem
 
 CATEGORY="thp" run_test ./khugepaged -s 4 all:shmem
 
-CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:anon
-
 # Try to create XFS if not provided
 if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
     if test_selected "thp"; then
-- 
2.54.0


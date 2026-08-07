Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2A4472F8C;
	Fri,  7 Aug 2026 11:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102649; cv=none; b=j7LCePl1xBh6XmZEX9T0HS6x+Cau4+ZC+p3K0/6SnORIoon88Cq2WaX0jWIqmiGmZn6SkhtJ90j7ubwe0DuyAOV3G4KiuDO0rF25YOugRcfKken3v4tR3bmAlUiHQM35HmAz76Yj83CwdrdZyW+ClLGlQdfmG28yN0IK+GMx0eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102649; c=relaxed/simple;
	bh=jZYp90GmHJmWv/lPXeRlskGLB+yopqApbDcFj2jQR5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d43JyyoZkb9u+SKOdcsS3kaD1RnrhkMxNYZlLH6sqarWglv5JN5gA8VvtIW1aaj5yhUl0ESqdbTpyYPyP9V8uk4/tHA/al0sntzWqjCbYCC5OojwQPC98pIMaXvBpNANyGhJNeBWxkNbThxt8Vy+iBGqmOfFMDc1cReddBWjr0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=uxQ/dJq3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lDWQSBXl; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="uxQ/dJq3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lDWQSBXl"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 617787A00AC;
	Fri,  7 Aug 2026 07:37:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 07 Aug 2026 07:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786102641; x=
	1786189041; bh=8tAM9g0684oRzmvSRuRjYFDutiQh5p3+9TYSRlUK8Mw=; b=u
	xQ/dJq3m96Z/ZX7AptbBwSbJbBFxJ609byOlEM2pwXJd1CxA+YRqkzFU+5NMyjpf
	gyRQItI7A2JW9deYSn8Ij3P+7FqFQBeBR4j9D1IfnE/Etv4tvqOmMhBWo7NBivJB
	BKVnzMyy/Euv2UHcqssGhRXX8y05vqyO01VVXl3lOTw1WtptB7dyIXdabtWTLqbj
	33YWyYUlmTxL8uSHLNPqhoZxPr+EDUmabcLDwR4HxR0JwSWzaDazCp4b1F9or2ub
	e2+2tsChoQUvEOiETCbW7LYDZGcJjGVWSWTXcwIiapQu5IxqzdWbjMnHQfRA/fAg
	RXroHxsm6YKiUuj5dvq6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786102641; x=1786189041; bh=8
	tAM9g0684oRzmvSRuRjYFDutiQh5p3+9TYSRlUK8Mw=; b=lDWQSBXldyOvTowSo
	o6jgucV1dVhi0gMv74hLWH5exR77eRY65K9uwEA78XGs1C0YTXWpPjJsVJDKIK0d
	A+VyamLVS/IrMVfAjVb7nGiEggCrX/7TRZCWDfqsHEDqndr7/88KwmDp+ijsWRp1
	JC7ijWRQgR56yrmbnXCuFF0mYW2A2KqLrrkFzhByoWx2qUaAmKPty8bbNKvTKlX0
	P9OAPuBZH3Jrg/8TFOkJ3toquxM/8+OEy/CUm57w6S/UiH707xctWKX68rDjA1pq
	lZqepM420O39dDyKrdbA3Ius3U9LnJRWS3rXjyUXihv36zznVYYMCSRu7mxmT/5E
	xbYAA==
X-ME-Sender: <xms:ccN1alpZ-htQ22EjGYoxHQBK83qOWvDMI0XsRL_3J9BoCxBwQas_tg>
    <xme:ccN1ajgnlInnW3O97FOx_smDlIGsXqD_IayBbDEthjI5s8UqwYv34mPPFJ2v5AzUN
    ZN9b1c3uaL--noDbkfyEU0p7RjPlOfBhhruweDz5My04J0PLvfvI2-T>
X-ME-Received: <xmr:ccN1arATzdjV6UJt2gxFutlKlPH_P4vLzKd1Ky5qVQxxQXTU-2kD2OfKr4c>
X-ME-Proxy-Cause: dmFkZTFHgVqOo5hmjJljb3IAZGkXyyxzQaD6i5RNmNk424gVmZkPzr1NfNWN42YMHBLBJ7
    ouwgSkV7uP+O116AnyQ77X3VN5vAdqq1zvzV33EYJRHUa/cQ0OT9UF9tJbf4RJE1rh86et
    dgK/XsSmEjRvIZ4/DwnHkulf5IWkeizHGDAErUJF9mnMadsJqDG0SAHuOjgfipI02yAqvF
    a9Gp7D1P4aM7ojieUjy73reTq6pHjAlslJzhWF2Bayc7rzuN1loFnb3tH1A/9l8/u/BKz2
    kEn4hJCLyjrltgNf/ADveISAZdc/G8K4aY+0IiJqAeENTN6qSce54NhN3knOmRl67eS+iD
    DB/QX6xfKcr5RTHe3Fwx41XsDl2llue/0k0iHG3Lz7tcse7fjrM4kmFD8x/ltDWFR0S/6j
    g3jExQ3/y710ZEVdf1dY9K2eOWeoheh/bH9sPncAG9GLM5pJu54o3R4VujgiqolMtPX0X6
    VAUv9x8ygaHlyqBsODovA5QpLCdyzh6DJdbfrASOOyXwujHMs54A+S+kcowCkvEM/m8zUb
    XrRjdcnMoWOMC6MRih1xZPflaVhp0PV4JZIZSU3B0R9lN6jFv0whY8PKf9CAAP5ZtbaCtC
    3nzgoZtL52vh1X/MauVErS5FJMqE0ozjCuUuESABlSc0ZsELK58+Z1nmeGPg
X-ME-Proxy: <xmx:ccN1apvUCSTo-uJ-CZpG7lwooS66gGcobpDVDrPk39F1N5ZYrKjR1Q>
    <xmx:ccN1at7ZX5VIwcROk2twQPER_rN3_vJVx92NszRJoi5G0nD6qDQSNA>
    <xmx:ccN1arddJmRYdlyvfSxu3ul73nNdXbcWEq9hV05oCsCN1YdKHRKaEQ>
    <xmx:ccN1atV_3ovA28iNUk4qUHGbu84Wttw_g3T0N0dIc2aVP7JmMkB-dA>
    <xmx:ccN1ajyEFeRlmXYwLC4lE5ljDNMSB_ub388NQ6FgKu9jhgXEeN43UEWw>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 07:37:20 -0400 (EDT)
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
Subject: [PATCH v2 12/17] selftests/mm: run every supported collapse order by default
Date: Fri,  7 Aug 2026 12:36:42 +0100
Message-ID: <20260807113647.3744609-13-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807113647.3744609-1-kirill@shutemov.name>
References: <20260807113647.3744609-1-kirill@shutemov.name>
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
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c   | 111 ++++++++++++++++++----
 tools/testing/selftests/mm/run_vmtests.sh |   2 -
 2 files changed, 91 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index a5683f08694f..a202fe359cf6 100644
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
 
@@ -1556,6 +1559,7 @@ static void usage(void)
 	fprintf(stderr,	"\t\t-s: mTHP size, expressed as page order.\n");
 	fprintf(stderr,	"\t\t    Defaults to 0. Use this size for anon or shmem allocations.\n");
 	fprintf(stderr,	"\t\t-c: collapse order for mTHP collapse, expressed as page order.\n");
+	fprintf(stderr,	"\t\t    Defaults to every supported order below the PMD.\n");
 	fprintf(stderr,	"\t\t    With -s, -s names the mTHP source order for the\n");
 	fprintf(stderr,	"\t\t    mixed-source case (source order below the target).\n");
 	exit(1);
@@ -1563,6 +1567,7 @@ static void usage(void)
 
 static void parse_test_type(int argc, char **argv)
 {
+	bool mthp_context_implied = false;
 	int opt;
 	char *buf;
 	const char *token;
@@ -1574,6 +1579,7 @@ static void parse_test_type(int argc, char **argv)
 			break;
 		case 'c':
 			collapse_order = atoi(optarg);
+			collapse_order_given = true;
 			break;
 		case 'h':
 		default:
@@ -1581,12 +1587,23 @@ static void parse_test_type(int argc, char **argv)
 		}
 	}
 
+	/*
+	 * Both orders end up as array indices and shift counts, so neither
+	 * can be negative, and a zero collapse order asks for base pages.
+	 */
+	if (anon_order < 0)
+		ksft_exit_fail_msg("-s takes an order, which cannot be negative\n");
+	if (collapse_order_given && collapse_order <= 0)
+		ksft_exit_fail_msg("-c takes an order above 0, not %d\n",
+				   collapse_order);
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
@@ -1597,13 +1614,19 @@ static void parse_test_type(int argc, char **argv)
 
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
@@ -1619,20 +1642,20 @@ static void parse_test_type(int argc, char **argv)
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
@@ -1654,9 +1677,14 @@ struct test_case {
 	struct mem_ops *ops;
 	const char *desc;
 	test_fn fn;
+	int order;		/* mTHP contexts: the collapse order */
 };
 
-#define MAX_TEST_CASES 64
+/*
+ * Enough for every case at every order the kernel offers: the mTHP context
+ * runs its cases once per supported order below the PMD.
+ */
+#define MAX_TEST_CASES 256
 static struct test_case test_cases[MAX_TEST_CASES];
 static int nr_test_cases;
 
@@ -1669,6 +1697,7 @@ static int nr_test_cases;
 			.ops	= o,					\
 			.desc	= #t,					\
 			.fn	= t,					\
+			.order	= collapse_order,			\
 		};							\
 	}								\
 	} while (0)
@@ -1709,10 +1738,40 @@ int main(int argc, char **argv)
 
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
@@ -1773,7 +1832,17 @@ int main(int argc, char **argv)
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
@@ -1781,14 +1850,8 @@ int main(int argc, char **argv)
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
@@ -1862,7 +1925,15 @@ int main(int argc, char **argv)
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


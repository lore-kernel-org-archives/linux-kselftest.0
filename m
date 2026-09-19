Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39A330569F;
	Sat, 19 Sep 2026 00:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777534; cv=none; b=kFb9ksix95UmdCARpYkGqyzCVIxKeHkYlIMihtCaDjb6OQh/v6/6Eu3K0LS4ScvVwkiyJXKBoHOUo8PJuBwmTEhjsyCtINQYYFSjB1w43/0UdHHzN/NG3BZ7WqZFhriOH3hU394EM1gfNP+4vKu+9jXL2XnP7KMXzbrEuY1ssvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777534; c=relaxed/simple;
	bh=Vdq+yGLjUMPC4uMrWKuY60b7MGvPoeeapbnMB7xQ+D8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KkPyXevaAf5q53efVH2Ro5lWub+2rbgXrwVLLNdl/BKroTbNZgT1dG94EJ9P+I3L5xB96mIpP8SnzuisvvSY8AUKqWElbFnq3cSdOBaaRl8jY0PVRDLAKvPpc1Ydjlzq8QzMyTJUHx3GRpKRozJXeYRWUf1m0X+yTULKgzk23N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=BORlJLas; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wFfmqNXM; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="BORlJLas";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wFfmqNXM"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B4241140016B;
	Fri, 18 Sep 2026 20:25:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 18 Sep 2026 20:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789777524; x=
	1789863924; bh=PuV84aXEC3RcsI9Zwrd99iTd8Q3qr/SBlm+s2ZYrws4=; b=B
	ORlJLas1wLwywvfWd3BoMrBUabwJB7qHgPBBNCbZMzPf+Kw+fpfseus7QXxw8vjP
	TfR2OGroiYQ1B9BUnq1mQOeNX6ll5EfmwR2wZRXIhXRDlejlcQLw+QyxTVBzO7pY
	0c6kxBab7bBH+qiNOiaQzLH1M3AJj/w/5R3iPPWOCv4PSNqIHEFPgQlUdeb/ZLnr
	ZOS0efla+x6Y4IOxqvxlQw7z2310VLmqctkc016DRNxOeZEox1zg/1Qui+rrek3g
	7+N7RWqAahe7JJrpgNhtxwFoHeJk3/Lc9PwJSgEaHeRqVmmnNij4LiGnzZzBrKPs
	2GsJ3sr7YbKbvdruh9nJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789777524; x=1789863924; bh=P
	uV84aXEC3RcsI9Zwrd99iTd8Q3qr/SBlm+s2ZYrws4=; b=wFfmqNXMRYn82w6oB
	U9Ei1/MPrTL9eCmq/nOZoTLvX9/wj3kT7w4u7jRbFt5FM2qcBrbccK0ZoAXUorUv
	uGLNNmMz39fUf6z18D5j8IT8QO7zPXZJ0q5Vg+/1ibNutdB9mRh1octjxUFrq5YS
	L+Q3pHCixiyh7P7DNDmfcXEBvHuAcAC8AktwwPs53u5HKb5aP0gekrcajtOpORQR
	BxBUvmrJlD8qL2dH/qDj7Wq+4RsV4PDvT+a4M6yoGUB3YK2hj+J3CNKHtJHGpwqT
	KHov7tGklZiyYomRkIqOWVZ59dBngLtRO2CSMHYd3YYqKcn6sUYDDIbp+NBccw5A
	9toeg==
X-ME-Sender: <xms:dNataoQb303lJcFktXWlsqEKSmOE7nRMv51VCnlyHmKmU4OM7ie94Q>
    <xme:dNatauLnq9q4QD-q2N-4IVgw6LmmTzJC3meUTOH1PiPbJUM45Li-u0QMb7OFv5ROF
    PQ84yUUfAJAPdyU5XPF1gU18UGVY6Z9QN9mnRBiHGqXy427BI04Hewo>
X-ME-Received: <xmr:dNataoAfo3g918ear7DOTyMuU2ljRfX8p7y9OgNZrsvn8QoGDtt16EBTBDQ>
X-ME-Proxy-Cause: dmFkZTFyC+XeKYnZ766rqTYe4SsoatN0doBd7ADemiperjFlmE10ggdkgYpZeWmNOU4aBc
    lm02WEvCO2QGG+A0SGXMzCjVWjDSVCQ5WJ/xmSMbLZJLqVjt5aEnrGd0hUbHPJ/ejcqjFa
    xrmYY/YNxh9EpvRrTjNMqslNp6oZ1XKAjj0b9YUD/U+Umt4HJhNRFStrIx7jR3Gf+CAD8k
    /TwEvtSve0+WgA7utVqBt9LeXDUSIUkf7dn/1M9JWIyORT8Kp2cNKrwYutOzK/Z35sBm5S
    qWNICJAq9yYROUOkEgx1cQSYtjkPP2DMZwKGXS3JxTiE+xMdBmJUepOSBHs3/DvnVTIMRm
    DH+J0asLfQyORvWu8lzQQKGGhmWXkwqxVQFZVyAd8+jtR5bfWrfV5CaiXJ71rN5wb49i+v
    QOua96izRlqXUB79CEcmwUw9SoKJ9rUSqlkGLPwUKQutU971DkCt1u5TgLhBnMLObRK9ke
    FLiWHbTCo1um3GSLsMxwds37r5MIs+LmF+d1L3zFD9i3FmZ+aTqWsg3xVgxqGWpe3LkfdV
    d8nCSM0oq0LpVvBlo/dh4v2Qjxl149tlLbwo7GX4WSB1T2lkaJBScjbgZRnL6kgCtZqrxv
    SXCJex10vChjG5N76WWrHcpV+x0T9V/QLn6mn+ml1937wMFP+O/utkgceR5w
X-ME-Proxy: <xmx:dNataj2bH-dB2muLSiB0oHxjREzbbQ2TjWcA7RE-XhxA61VigUwCUQ>
    <xmx:dNatajlQ-xkMBRUh2aTUHAnzbjyd_r03pQMhJwUEDcnDpO3N-DvS6Q>
    <xmx:dNataoe9r4DCyc5nGhL4fBN-EvlnRrcYXKL6BR6Fr_M3sF4n_Vr3hA>
    <xmx:dNataoWmgB0-WsJI_2265roA5sXI9v5m2lMwzmSyvNMGJWGo4r_vBA>
    <xmx:dNatau58M1cibtfj01ytoMmRHHGzjHGIVIV-qffK6YHCEibTdJmO-WMG>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 20:25:24 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	Usama Arif <usama.arif@linux.dev>,
	"Nico Pache (Red Hat)" <nico.pache@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	kernel-team@meta.com
Subject: [PATCH v6 14/19] selftests/mm: run every supported collapse order by default
Date: Sat, 19 Sep 2026 01:24:44 +0100
Message-ID: <20260919002451.496763-15-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919002451.496763-1-kirill@shutemov.name>
References: <20260919002451.496763-1-kirill@shutemov.name>
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

Run the mTHP cases once per supported anon THP order below the PMD when
-c is absent, and pull that context into both the no-argument invocation
and "all".  Also:

  - -c still pins one order, and now says what is wrong instead of
    printing the usage text.

  - Both orders end up as array indices and shift counts, so -s and -c
    are range-checked before they get there.

  - The mTHP context has only anon cases, so a run that names a different
    mem_type -- "all:shmem", say -- drops it again rather than refusing
    to start.  Naming both explicitly still refuses.

  - A case carries the order it was registered at, so a result names it:

      # Run test: collapse_single_mthp (mthp_khugepaged:anon, order 6)

On x86-64 with 4K pages that is orders 2 through 8, and ./khugepaged goes
from 29 results in 17 seconds to 77 in 29, so run_vmtests.sh can drop its
pinned order-4 line.

Assisted-by: LLM
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c   | 101 +++++++++++++++++-----
 tools/testing/selftests/mm/run_vmtests.sh |   2 -
 2 files changed, 78 insertions(+), 25 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 21ae258bd56e..a2ac3b3ca5de 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -30,6 +30,9 @@ static unsigned long page_size;
 static int hpage_pmd_nr;
 static int anon_order;
 static int collapse_order;
+static bool collapse_order_set;
+static int collapse_orders[NR_ORDERS];
+static int nr_collapse_orders;
 static int pagemap_fd = -1;
 static int kpageflags_fd = -1;
 
@@ -1525,12 +1528,14 @@ static void usage(void)
 	fprintf(stderr,	"\t\t-s: mTHP size, expressed as page order.\n");
 	fprintf(stderr,	"\t\t    Defaults to 0. Use this size for anon or shmem allocations.\n");
 	fprintf(stderr,	"\t\t-c: collapse order for mTHP collapse, expressed as page order.\n");
+	fprintf(stderr,	"\t\t    Defaults to every supported order below the PMD.\n");
 	fprintf(stderr,	"\t\t    -s, if set, is the source order for the mixed-source case.\n");
 	exit(1);
 }
 
 static void parse_test_type(int argc, char **argv)
 {
+	bool mthp_context_implied = false;
 	int opt;
 	char *buf;
 	const char *token;
@@ -1542,6 +1547,7 @@ static void parse_test_type(int argc, char **argv)
 			break;
 		case 'c':
 			collapse_order = atoi(optarg);
+			collapse_order_set = true;
 			break;
 		case 'h':
 		default:
@@ -1549,12 +1555,25 @@ static void parse_test_type(int argc, char **argv)
 		}
 	}
 
+	/*
+	 * Both orders end up as array indices and shift counts, so neither
+	 * can be negative, and a zero collapse order asks for base pages.
+	 */
+	if (anon_order < 0 || anon_order > hpage_pmd_order)
+		ksft_exit_fail_msg("-s takes an order in 0..%d, not %d\n",
+				   hpage_pmd_order, anon_order);
+	if (collapse_order_set &&
+	    (collapse_order <= 0 || collapse_order >= hpage_pmd_order))
+		ksft_exit_fail_msg("-c takes an order in 1..%d, not %d\n",
+				   hpage_pmd_order - 1, collapse_order);
+
 	argv += optind;
 	argc -= optind;
 
 	if (argc == 0) {
-		/* Backwards compatibility */
+		/* No arguments: anon under every context */
 		khugepaged_context =  &__khugepaged_context;
+		mthp_khugepaged_context =  &__mthp_khugepaged_context;
 		madvise_context =  &__madvise_context;
 		anon_ops = &__anon_ops;
 		return;
@@ -1565,13 +1584,14 @@ static void parse_test_type(int argc, char **argv)
 
 	if (!strcmp(token, "all")) {
 		khugepaged_context =  &__khugepaged_context;
+		mthp_khugepaged_context =  &__mthp_khugepaged_context;
 		madvise_context =  &__madvise_context;
+		/* The mTHP context has only anon cases; let other mem_types drop it */
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
@@ -1587,20 +1607,20 @@ static void parse_test_type(int argc, char **argv)
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
@@ -1622,6 +1642,7 @@ struct test_case {
 	struct mem_ops *ops;
 	const char *desc;
 	test_fn fn;
+	int order;		/* mTHP contexts: the collapse order */
 };
 
 #define MAX_TEST_CASES 256
@@ -1637,6 +1658,7 @@ static int nr_test_cases;
 			.ops	= o,					\
 			.desc	= #t,					\
 			.fn	= t,					\
+			.order	= collapse_order,			\
 		};							\
 	}								\
 	} while (0)
@@ -1677,13 +1699,35 @@ int main(int argc, char **argv)
 
 	parse_test_type(argc, argv);
 
-	if (mthp_khugepaged_context &&
-	    !(thp_supported_orders() & (1UL << collapse_order)))
-		ksft_exit_skip("Order %d is not a supported anon THP order\n",
-			       collapse_order);
-	if (mthp_khugepaged_context && collapse_order <= anon_order)
-		ksft_exit_skip("-c %d needs a source order below it, -s says %d\n",
-			       collapse_order, anon_order);
+	if (mthp_khugepaged_context) {
+		unsigned long orders = thp_supported_orders();
+
+		if (collapse_order_set) {
+			if (!(orders & (1UL << collapse_order)))
+				ksft_exit_skip("Order %d is not a supported anon THP order\n",
+					       collapse_order);
+			if (collapse_order <= anon_order)
+				ksft_exit_skip("-c %d needs a source order below it, -s says %d\n",
+					       collapse_order, anon_order);
+			collapse_orders[nr_collapse_orders++] = collapse_order;
+		} else {
+			/*
+			 * Every supported order above the source: -s makes the
+			 * fault path hand out folios of that order, so a target
+			 * at or below it has nothing to collapse.
+			 */
+			int first = anon_order + 1;
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
@@ -1732,7 +1776,17 @@ int main(int argc, char **argv)
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
@@ -1740,15 +1794,8 @@ int main(int argc, char **argv)
 	TEST(collapse_full, madvise_context, shmem_ops);
 
 	TEST(collapse_empty, khugepaged_context, anon_ops);
-	TEST(collapse_empty, mthp_khugepaged_context, anon_ops);
 	TEST(collapse_empty, madvise_context, anon_ops);
 
-	TEST(collapse_single_mthp, mthp_khugepaged_context, anon_ops);
-	TEST(collapse_order_single_window, mthp_khugepaged_context, anon_ops);
-	TEST(collapse_order_partial_window, mthp_khugepaged_context, anon_ops);
-	TEST(collapse_order_max_ptes_none, mthp_khugepaged_context, anon_ops);
-	TEST(collapse_order_mixed_sources, mthp_khugepaged_context, anon_ops);
-
 	TEST(collapse_single_pte_entry, khugepaged_context, anon_ops);
 	TEST(collapse_single_pte_entry, khugepaged_context, read_only_file_ops);
 	TEST(collapse_single_pte_entry, khugepaged_context, read_write_file_read_ops);
@@ -1821,7 +1868,15 @@ int main(int argc, char **argv)
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
index 3a111bc9c29e..98a33f6d15d4 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -392,8 +392,6 @@ CATEGORY="thp" run_test ./khugepaged all:shmem
 
 CATEGORY="thp" run_test ./khugepaged -s 4 all:shmem
 
-CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:anon
-
 # Try to create XFS if not provided
 if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
     if test_selected "thp"; then
-- 
2.54.0


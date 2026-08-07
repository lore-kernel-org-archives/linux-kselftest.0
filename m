Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC83471400;
	Fri,  7 Aug 2026 11:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102641; cv=none; b=ijcAS5I8QGRO38euTLx3BLUqLVEpR8YGzAKWRwAZZhUC3sFeyyU99ArZv9mgR7vDDaSLhy5eKl1UVeIxHKt6L9xS7gb1gkAZvtX22Xe6DDUzEdBEm8s3vxcl04HLOtWjiTqe/9vmTZNLUrkUpWohyQ3qiYtTgksnnqezpuhx5A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102641; c=relaxed/simple;
	bh=2A41GZsQSZMc2sSLxZwfS0VGxSw1NIh8eKqFevmdOUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oTupuALGvl11at69KiVovmbAyzDUPITrK5WYt3qfJ2+4KVCJarVpiq1PNvqz7f1QsuD7Q2P+z1KM9gjiGylw4ozxpaBPlrf9flTLGMfXKYXz84mPu9F1XtlqGBwlGyCpZ2kjwlLVC9h03soVDqP+VqlNb7E7k9GtqlL0pMR3LfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=CTXs/xTv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X+ZAYHm6; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="CTXs/xTv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X+ZAYHm6"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 142BB7A0120;
	Fri,  7 Aug 2026 07:37:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 07 Aug 2026 07:37:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786102633; x=
	1786189033; bh=7RLj+GhKJGvuXr+2Q6khalcVsCGbMqebY7tWpZ0bpic=; b=C
	TXs/xTvQ8lEPg0Lnd0k4++oouWZs14VRweVFW2r/Qr2HqhNvxOrcYNvRVvpc7uiy
	6GYkWA62zEW2Epx3xrcXJgRrGVW+NGC+MrqBlggGDAcQx3cBiXcQ9d5po7XAOpGT
	AcTh5YyBXV3JOKVQ1G5WqCq/0Deli7fd5GOel5ceKvTW5e7PP7DIN7h5zoVp5evG
	cAV4Z2V+9md3KCFur7DFfQFfV79s92QEbv62LfyKA8Hk5YFf3pb2qp1434kB35mQ
	6Wea0YNl3MF3WxdzOQeBstmlF/pFoHeEV3qCpyq0eLVD0bbtyeP5fxA2XYTnniWD
	y7c1beBmGd0KVN7hJmWiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786102633; x=1786189033; bh=7
	RLj+GhKJGvuXr+2Q6khalcVsCGbMqebY7tWpZ0bpic=; b=X+ZAYHm6MK4dUKukK
	0Q2W8JJu0l3879eIhUbw9TxYKSlfA/nu/H10ZLzJqL7qTy/PW9fTEPhUmo46ssYJ
	KczlrG3Zysc7rDplptPb4wIsSjWaoRboYQWeP95XboREtvmT7tSDjCxIVNoNSjwG
	Qc2SAWGW/fBMtivhSY3ICwTemus1g6k8FMAlUMyCLUuqmi7mMxai5f/IfCdReBIW
	CglBf08UdNZ+3kLhCx3OaczQg6fl9jaRYn0WuOw1QILEWkI93vBGn9L6yZYuRFlx
	yjuwyNwI3StCVSqGyNbCybAZtmcPaQXZxWxC8zTC0Bu62vL+fl26+FQ8uTGnDqv7
	BRhTQ==
X-ME-Sender: <xms:acN1apkwRsGi3E2tbhSU8JoS8eBm5lngcn6OHcy0UClSVlFrZ-mkaw>
    <xme:acN1aoxuwqPlA7LRMVa4_gkm_QDVJ0u1LFSZGF2bft-inPPXNug5A-snRs9UpothK
    u--sL8S0i4KRFOEUgsjCHLZO4ljyimluVx5_UrkOziY_P_x1DDWu6jS>
X-ME-Received: <xmr:acN1aoIZ6AIyW18deDAPXe93P_XlwK9qG3x1GiDzGGZ8c5RcdzREXtcxDkM>
X-ME-Proxy-Cause: dmFkZTFHgVqOo5hmjJljb3IAZGkXyyxzQaD6i5RNmNk424gVmZkPzr1NfNWN42YMHBLBJ7
    ouwgSkV7uP+O116AnyQ77X3VN5vAdqq1zvzV33EYJRHUa/cQ0OT9UF9tJbf4RJE1rh86et
    dgK/XsSmEjRvIZ4/DwnHkulf5IWkeizHGDAErUJF9mnMadsJqDG0SAHuOjgfipI02yAqvF
    a9Gp7D1P4aM7ojieUjy73reTq6pHjAlslJzhWF2Bayc7rzuN1loFnb3tH1A/9l8/u/BKz2
    kEn4hJCLyjrltgNf/ADveISAZdc/G8K4aY+0IiJqAeENTN6qSce54NhN3knOmRl67eS+r0
    WbB8FDRD8Au+Ul36Ui63//knhvcdpy/2ObtGyXjV1wk+1Ra0l5w3HpclF91ujjSDW50IZn
    0JJVkQexVMzgM8el3u286H6VD5m376WwXUFv3p3seAqRjpJN6EZRk7TBof/oTj4rXd7i+0
    maLtZ1m8876dtBEWKZQ+82r/HY58GCkcxnfQA9b1j0r884ELtpH6tjrVKq7CCi7YwD1fKb
    +a6OVn8CxN/lj4pSaWq2EjyF7gRAZaFNyl4pdfyXs88CEvTReS24GkQlClr56kIN5IeM6o
    jkS54vxV0WnazKVtF6TTM5g+vefrF05VUgLOYNW2R3HdAVdVImRUR2x36BCw
X-ME-Proxy: <xmx:acN1ajK5cXVZ6CAYY8kN7lvEW1hRV-mwWhNJ6nte6BdimGQgDR_ybw>
    <xmx:acN1avUYrxJBZ2DHisDiWkdJim-Bny_yWj2iVFv3e7iBUXA3It6_Yg>
    <xmx:acN1ajDQHrwk8kag-gJf0U2ftqHBfAbYos2F73eAefb1YkW-GDASDg>
    <xmx:acN1aqHqWqTwTEUZ9Sk1Gtwf_OjGE2ilzxnWbUZlwShD87THtE7gTQ>
    <xmx:acN1aoEsyPAmf2cPi_hw6wxg_uCSE0b09Au7HTjEzvmuiseR_aVi0pZx>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 07:37:13 -0400 (EDT)
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
Subject: [PATCH v2 09/17] selftests/mm: add order-parameterized khugepaged collapse cases
Date: Fri,  7 Aug 2026 12:36:39 +0100
Message-ID: <20260807113647.3744609-10-kirill@shutemov.name>
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

The mthp_khugepaged context runs the generic cases at a sub-PMD order,
which answers how many folios of that order a range ends up with.  It
cannot say which window they are in, so "the populated window collapsed
and its neighbour did not" and "one window collapsed twice" look alike.

Add four cases that check each aligned window on its own, with the
folio-order helpers in vm_util:

- collapse_order_single_window: only the populated window collapses;
- collapse_order_partial_window: the default max_ptes_none lets a window
  with one present PTE collapse;
- collapse_order_max_ptes_none: with max_ptes_none=0 a full window
  collapses and one missing a page does not;
- collapse_order_mixed_sources: sources that are already large folios of
  a smaller order collapse to the target.

Each case faults its region before MADV_HUGEPAGE with only the target
order enabled, so the sources are order 0 and the result can only come
from khugepaged.  They wait for a full pass rather than for the result to
appear: without a completed pass, "not collapsed" and "not scanned yet"
are the same thing.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 219 ++++++++++++++++++++++++
 1 file changed, 219 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 69e0fc4b12fb..bcaef17e430d 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -31,6 +31,8 @@ static unsigned long page_size;
 static int hpage_pmd_nr;
 static int anon_order;
 static int collapse_order;
+static int pagemap_fd = -1;
+static int kpageflags_fd = -1;
 
 #define PID_SMAPS "/proc/self/smaps"
 #define TEST_FILE "collapse_test_file"
@@ -1268,6 +1270,205 @@ static void madvise_retracted_page_tables(struct collapse_context *c,
 	ksft_test_result_report(exit_status, "%s\n", __func__);
 }
 
+/* Smallest order khugepaged will consider for mTHP collapse. */
+#define MIN_MTHP_ORDER 2
+
+/*
+ * Order-parameterized collapse cases for the mthp_khugepaged context.  What
+ * they add over the generic cases run under that context is per-window
+ * detection: which aligned window collapsed, and which of its neighbours did
+ * not.  check_huge() answers how many folios of the order the range holds,
+ * which cannot tell one window from another.
+ *
+ * The region is faulted before MADV_HUGEPAGE, and the target order is only
+ * enabled for madvise, so the sources are always order 0 and the collapse
+ * product can only have come from khugepaged.
+ */
+static size_t mthp_window_size(void)
+{
+	return page_size << collapse_order;
+}
+
+static void mthp_push_target_order(void)
+{
+	struct thp_settings settings = *thp_current_settings();
+	int i;
+
+	/*
+	 * The target order, for madvise only, and nothing else enabled: the
+	 * cases fault their region before MADV_HUGEPAGE, so the sources are
+	 * order 0 whatever -s asked the fault path for.  That matters for the
+	 * cases built around a hole -- a large source folio would fill it in
+	 * and the window would collapse after all.
+	 * collapse_order_mixed_sources enables the source order it wants on
+	 * top of this.
+	 */
+	settings.thp_enabled = THP_NEVER;
+	for (i = 0; i < NR_ORDERS; i++)
+		settings.hugepages[i].enabled = THP_NEVER;
+	settings.hugepages[collapse_order].enabled = THP_MADVISE;
+	thp_push_settings(&settings);
+}
+
+static bool window_collapsed(void *p, size_t len)
+{
+	return is_range_backed_by_folio_orders(p, len, collapse_order,
+					       pagemap_fd, kpageflags_fd);
+}
+
+/* No aligned window in [p, p + len) is backed at the target order. */
+static bool window_not_collapsed(void *p, size_t len)
+{
+	size_t window = mthp_window_size();
+	char *addr = p;
+
+	for (; len >= window; addr += window, len -= window) {
+		if (window_collapsed(addr, window))
+			return false;
+	}
+	return true;
+}
+
+static bool khugepaged_wait_full_pass(void)
+{
+	/* Wait up to 30 seconds for the pass to complete. */
+	return khugepaged_full_pass(30);
+}
+
+static void collapse_order_single_window(struct collapse_context *c,
+					 struct mem_ops *ops)
+{
+	size_t window = mthp_window_size();
+	void *p;
+
+	mthp_push_target_order();
+
+	p = ops->setup_area(1);
+	ops->fault(p, window, 2 * window);
+	if (!window_not_collapsed(p, hpage_pmd_size))
+		ksft_exit_fail_msg("Unexpected large folio after fault\n");
+
+	madvise(p, hpage_pmd_size, MADV_HUGEPAGE);
+	ksft_print_msg("Collapse one fully populated window...");
+	if (!khugepaged_wait_full_pass())
+		fail("Timeout");
+	else if (window_collapsed(p + window, window) &&
+		 window_not_collapsed(p, window) &&
+		 window_not_collapsed(p + 2 * window,
+				      hpage_pmd_size - 2 * window))
+		success("OK");
+	else
+		fail("Fail");
+
+	validate_memory(p, window, 2 * window);
+	ops->cleanup_area(p, hpage_pmd_size);
+	thp_pop_settings();
+	ksft_test_result_report(exit_status, "%s\n", __func__);
+}
+
+static void collapse_order_partial_window(struct collapse_context *c,
+					  struct mem_ops *ops)
+{
+	void *p;
+
+	mthp_push_target_order();
+
+	p = ops->setup_area(1);
+	ops->fault(p, 0, page_size);
+	if (!window_not_collapsed(p, hpage_pmd_size))
+		ksft_exit_fail_msg("Unexpected large folio after fault\n");
+
+	madvise(p, hpage_pmd_size, MADV_HUGEPAGE);
+	ksft_print_msg("Collapse window with single PTE entry present...");
+	if (!khugepaged_wait_full_pass())
+		fail("Timeout");
+	else if (window_collapsed(p, mthp_window_size()))
+		success("OK");
+	else
+		fail("Fail");
+
+	validate_memory(p, 0, page_size);
+	ops->cleanup_area(p, hpage_pmd_size);
+	thp_pop_settings();
+	ksft_test_result_report(exit_status, "%s\n", __func__);
+}
+
+static void collapse_order_max_ptes_none(struct collapse_context *c,
+					 struct mem_ops *ops)
+{
+	struct thp_settings settings;
+	size_t window = mthp_window_size();
+	void *p;
+
+	mthp_push_target_order();
+	settings = *thp_current_settings();
+	settings.khugepaged.max_ptes_none = 0;
+	thp_push_settings(&settings);
+
+	p = ops->setup_area(1);
+	ops->fault(p, 0, 2 * window - page_size);
+	if (!window_not_collapsed(p, hpage_pmd_size))
+		ksft_exit_fail_msg("Unexpected large folio after fault\n");
+
+	madvise(p, hpage_pmd_size, MADV_HUGEPAGE);
+	ksft_print_msg("Collapse full window, not the one missing a page...");
+	if (!khugepaged_wait_full_pass())
+		fail("Timeout");
+	else if (window_collapsed(p, window) &&
+		 window_not_collapsed(p + window, window))
+		success("OK");
+	else
+		fail("Fail");
+
+	validate_memory(p, 0, 2 * window - page_size);
+	ops->cleanup_area(p, hpage_pmd_size);
+	thp_pop_settings();
+	thp_pop_settings();
+	ksft_test_result_report(exit_status, "%s\n", __func__);
+}
+
+static void collapse_order_mixed_sources(struct collapse_context *c,
+					 struct mem_ops *ops)
+{
+	struct thp_settings settings;
+	void *p;
+
+	if (collapse_order <= MIN_MTHP_ORDER) {
+		ksft_test_result_skip("%s: no source order below target\n",
+				      __func__);
+		return;
+	}
+
+	mthp_push_target_order();
+
+	/* Fault the whole region as order-MIN_MTHP_ORDER folios. */
+	settings = *thp_current_settings();
+	settings.hugepages[MIN_MTHP_ORDER].enabled = THP_ALWAYS;
+	thp_push_settings(&settings);
+	p = ops->setup_area(1);
+	ops->fault(p, 0, hpage_pmd_size);
+	thp_pop_settings();
+
+	if (!is_range_backed_by_folio_orders(p, hpage_pmd_size, MIN_MTHP_ORDER,
+					     pagemap_fd, kpageflags_fd))
+		ksft_exit_fail_msg("Region not backed by order-%d folios after fault\n",
+				   MIN_MTHP_ORDER);
+
+	madvise(p, hpage_pmd_size, MADV_HUGEPAGE);
+	ksft_print_msg("Collapse region backed by smaller large folios...");
+	if (!khugepaged_wait_full_pass())
+		fail("Timeout");
+	else if (window_collapsed(p, hpage_pmd_size))
+		success("OK");
+	else
+		fail("Fail");
+
+	validate_memory(p, 0, hpage_pmd_size);
+	ops->cleanup_area(p, hpage_pmd_size);
+	thp_pop_settings();
+	ksft_test_result_report(exit_status, "%s\n", __func__);
+}
+
 static void usage(void)
 {
 	fprintf(stderr, "\nUsage: ./khugepaged [OPTIONS] <test type> [dir]\n\n");
@@ -1436,6 +1637,20 @@ int main(int argc, char **argv)
 
 	parse_test_type(argc, argv);
 
+	if (mthp_khugepaged_context &&
+	    !(thp_supported_orders() & (1UL << collapse_order)))
+		ksft_exit_skip("Order %d is not a supported anon THP order\n",
+			       collapse_order);
+
+	if (mthp_khugepaged_context) {
+		pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
+		if (pagemap_fd < 0)
+			ksft_exit_fail_perror("open(/proc/self/pagemap)");
+		kpageflags_fd = open("/proc/kpageflags", O_RDONLY);
+		if (kpageflags_fd < 0)
+			ksft_exit_fail_perror("open(/proc/kpageflags)");
+	}
+
 	setbuf(stdout, NULL);
 
 	/*
@@ -1498,6 +1713,10 @@ int main(int argc, char **argv)
 	TEST(collapse_empty, madvise_context, anon_ops);
 
 	TEST(collapse_single_mthp, mthp_khugepaged_context, anon_ops);
+	TEST(collapse_order_single_window, mthp_khugepaged_context, anon_ops);
+	TEST(collapse_order_partial_window, mthp_khugepaged_context, anon_ops);
+	TEST(collapse_order_max_ptes_none, mthp_khugepaged_context, anon_ops);
+	TEST(collapse_order_mixed_sources, mthp_khugepaged_context, anon_ops);
 
 	TEST(collapse_single_pte_entry, khugepaged_context, anon_ops);
 	TEST(collapse_single_pte_entry, khugepaged_context, read_only_file_ops);
-- 
2.54.0


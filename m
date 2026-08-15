Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB93C3515CB;
	Sat, 15 Aug 2026 01:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786759171; cv=none; b=R+kRkFxXdCv3SdXjcQ8t2bBXBAA4JbeHWKumb8mL8iixeSP55AHUqt/hJbmSDpmn9gOYYRIqQ/9RBVWQN1Ln9djC33nrpQYWJ7FDJKOTpg+PMk6UGawjzYc17WWrjq0SDmPv5LMQ87VVtVyjihYrOikmEgw+LueK9+/DkzZp4IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786759171; c=relaxed/simple;
	bh=FfIoOfVH7GdM5rQ+AWToxqhkuMUUKkDSExEaSJkzVvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DfEtZ4SC3W6Dn/vI3ZNK47etp+10VT1eajPBB8Kp9oP8Gzwd/uFiswxmerjOd1yHa/K1HGHjSbb5/e0sf57uJ3OucFIvzujTEd92cn/+eoodX2NCMgGaDrzidldYv1lwq5rJM7OH8rdTg3fYjz2Qf6YXhz6IDbTxrAgivIVFGlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=b/g+kqZm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RhKRP1ko; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="b/g+kqZm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RhKRP1ko"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 053DAEC0222;
	Fri, 14 Aug 2026 21:59:28 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 14 Aug 2026 21:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786759168; x=
	1786845568; bh=TndxdCltkGuvzZg0b5nL1NfZtt1dBi/ccjiEs/49rKo=; b=b
	/g+kqZmdyT/Fnm90OChIX7THylkcZdL5RzQwijJKaZewSVJuIUdkxYulJNaw5kFj
	Zwc/lC0J59tY/+pMlMD4DobTXP64Nb5MJB+veuzukFtSp1UGpKB/tpwOT1EI9GJu
	Jh2YyWFJ/jdRGlLaxSeSoFOBUm9yyalSOsPEr94i8Pmu27Wb2g36N5Za2/sn1Jc7
	sgvqrpqL1IY++6wfYetxVhdV/8pYMKWwChmhzaucgj88jzH1d4fYm27H1EiEkeuL
	5Tj50eh8rMrG+7RF1yK4yXjgZpvVxlPj429Sq9Glj8tzIZ+mDXmzBhHsVy7nQm7t
	aHR3oGJhgik+tp6ObZ4Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786759168; x=1786845568; bh=T
	ndxdCltkGuvzZg0b5nL1NfZtt1dBi/ccjiEs/49rKo=; b=RhKRP1koDI+ptIxl3
	HGLgxJxt9j3omxH9cRDrfouD5bJwupqLsPOl83WrtPBwtCFXZy58Tz7ibrLlgcKY
	/9CRyrwf3nOKQxxXsY0zWzzoE0cF/ZG+pxGr/+nk4/NNRCT+oc1RlEr63EWoNVZ7
	ndD4VnzTj9Q1/8EGF6chW0Qr0/s/oXRXaDKRscwVAUBUJHIu36COh/z3Nf/ovIuu
	pqfXrhF/b1UVOdJwGjuINmyBp9GNF7g/OyiGjK6ziB6F+GQZPXP1+sZ2Cyks8HO2
	DDl26DeNPyHMMqpAI2k1iE/AsrkGlDD8w9aZexMT6GqgZ+t49libXTx0mTitVJh3
	JbZkg==
X-ME-Sender: <xms:_8d_asSkhv24EC3NKuBHRT5jYpMemo7n6qHhVJNXVdWjJLjkO7sdmQ>
    <xme:_8d_atuGNpUwuqR5pZtxn_xS7aqjkBrqjfxTys5q7qTYbY0EfJN5srTD95yhdwtEb
    eiUB9srD3EMu0VWaaOvr-nyKAUF8BgkohJlKRV3eJgpAIUNv3--yXc>
X-ME-Received: <xmr:_8d_aiVtAQoD3_zH6vuTl3U_4T1zj8g9C9wPtLxRQr8pSL2eoBCmdXQ3elw>
X-ME-Proxy-Cause: dmFkZTEYpEQiBdLKlCaLp317TOYqYwO99jnuX4YrBujo3RuW+IIGXdYj4qE1ezcGRvbtOZ
    hc7RfnfkdlTehb5Dkvk4VZTcyRAqm2CcEjaldkIQshIttrB2HSeWyAKQfsR+ykmymFv8qO
    aC/+wh3joJiQccaWn5NjVrqLVVMYdoVO37A5ZL6SnR75seJlCquk1NTOiA0EvXHIVSJ25Q
    iFONSccd/wEzNfQZlOvvQQf5bCKiGIALXd0Rd37Vcnrh56q8DfWwmvEu2ZgBGSMa525iaP
    HkMF5MKO3LDiNiHXJVHjo5f/L4XJttiAOfdXhljkaHgZI649okv5M81/eeF8HfhCZr1UQh
    NZgwgKpraJQ4GfA8YlvrMbphan98J2x248uA7+GQJDmU5vuQuFfP9TqLssry0XavFL6pSe
    CSbzkCGUFIj/OQN8jsfYXJAUYAFsWIpI2kcVV/xHNSdtuebZ+h4xBojLYlydWLCcjiyZci
    nHPuSmfGs/mzRGIfDM/mxAj55kilgC8yhXvrJHezys3fagfeVEqBfLZdTM15LcTq09UZz5
    qu+H3Ov+ZvdmgtJ7488deEr22TLks+7nZ6eYeFdgP868jPPfsXQmzQ5WLYsRKN51XmETcJ
    1gMxzmWboYjDOFCJtnCipj1RCiFNNbyKWTOyNN1WFB+zaT8yhIzXuN7inBrQ
X-ME-Proxy: <xmx:_8d_apnHorALe35Ci_ae7e_boqJ4-NnufGzsN-PMxO0_2fir2M8e8A>
    <xmx:_8d_atDEdvLBou0-jSWxY_DWuSG1kSLnbwKNgB6EfHDurC9wFqqlzg>
    <xmx:_8d_am--bcCT16_GNv6nZHnPJfz0MsygCV1Ndxks56oPbvy-pnLxXQ>
    <xmx:_8d_anT1FqgzBqt0g1MybiFvl9-8zeXJCOeiAnq7RAC2uq-bij02Ng>
    <xmx:AMh_as3TXoA00QmwcOkVOQfMzmg1RlAX_5ec-TxfOgDDuL-tTyWvoxQN>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 21:59:27 -0400 (EDT)
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
Subject: [PATCH v4 11/19] selftests/mm: add order-parameterized khugepaged collapse cases
Date: Sat, 15 Aug 2026 02:58:53 +0100
Message-ID: <20260815015901.1236937-12-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815015901.1236937-1-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
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

- collapse_order_single_window(): only the populated window collapses;
- collapse_order_partial_window(): the default max_ptes_none lets a window
  with one present PTE collapse;
- collapse_order_max_ptes_none(): with max_ptes_none=0 a full window
  collapses and one missing a page does not;
- collapse_order_mixed_sources(): sources that are already large folios of
  a smaller order collapse to the target.

Each case faults its region before MADV_HUGEPAGE with only the target
order enabled, so the sources are order 0 and the result can only come
from khugepaged.  They wait for a full pass rather than for the result to
appear: without a completed pass, "not collapsed" and "not scanned yet"
are the same thing.

Assisted-by: Claude-Code:claude-opus-5
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 230 ++++++++++++++++++++++++
 1 file changed, 230 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 0008862e7cbc..0489967d6ee0 100644
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
@@ -1227,6 +1229,216 @@ static void madvise_retracted_page_tables(struct collapse_context *c,
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
+	/*
+	 * The order is enabled, but the allocator can still fall back under
+	 * fragmentation.  That leaves nothing to collapse from, which is the
+	 * machine's answer rather than a reason to end the run.
+	 */
+	if (!is_range_backed_by_folio_orders(p, hpage_pmd_size, MIN_MTHP_ORDER,
+					     pagemap_fd, kpageflags_fd)) {
+		ksft_print_msg("No order-%d sources to collapse...",
+			       MIN_MTHP_ORDER);
+		skip("Skip");
+		ops->cleanup_area(p, hpage_pmd_size);
+		thp_pop_settings();
+		ksft_test_result_report(exit_status, "%s\n", __func__);
+		return;
+	}
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
@@ -1395,6 +1607,20 @@ int main(int argc, char **argv)
 
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
@@ -1450,6 +1676,10 @@ int main(int argc, char **argv)
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


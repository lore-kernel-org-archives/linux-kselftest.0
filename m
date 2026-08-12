Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAD845A299;
	Wed, 12 Aug 2026 13:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541020; cv=none; b=pA15HrM8EQ5gEx1vTClFw34UXuqFeAPpXBlLE/vmFuuO+3mTeKTqLVqU5RQXW4v56eCrYwbjFWnjFGBfRrrWkAcNNtRcybEo/jNUTVLwqWq2Nc3OQmRwrNWydTNaTScq+U8r1sqa/IJEkMhkTw1uc2fF0djeRrOtG2gLjoTaw18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541020; c=relaxed/simple;
	bh=Be7S6KcCLp+9jOhsTbJF/KzYvfOV6S6UuaSwquGZ03I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HH8XPwctOkyRQ3R8n0TSgrPsklDD8lVzBP5lMkR9+F6Ulkwysu2uNLsvSBqKfRsW1gKyhj61yV6b8lIkMOwadMIuf2g6qSyjzof0HMkQuYlMVRxVLMI1usyLALuvwEmeRREniZe/3ukPd7SjA8Ty/x5KRlEo4ni52Gt8+tGu1a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=VNboEGhm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RIEyJqyS; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="VNboEGhm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RIEyJqyS"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A6A447A0173;
	Wed, 12 Aug 2026 09:23:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 12 Aug 2026 09:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786541017; x=
	1786627417; bh=pS5GXvFi1fnnWCzMO/zMVeDQZR9m016msjFusJIgzZw=; b=V
	NboEGhmK6Pla17ahIWFTw4i3XELykb3oHfqwW6OgeTb3LJu8CUt8hT0s9XQQTZAE
	CdC6PAU88mu3k0sU4/5PmnaWZq+w9QWvCOK0UZ+MNRr9tUffrcbpSz07N52Bc0FE
	SZ8kHK+7kWLXH2YbOdU6O+PBv1QTpsGhT7TQq5mOpMjS+0H3K9H+Nu4xD28OICUy
	COVk1wcbfKNwmJZql9r9XkDs6ax+xM13Bir+8pzy1lx1mVnaERyeKDJNuVlAvULZ
	DMvmjjZ7KmNTBu2M9pxyYxjW7FhtKDsqkPqOdyDA+42k4kKTdXiXg07m2DecEqlL
	Cdq83SEHzYvkvrbNLYAFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786541017; x=1786627417; bh=p
	S5GXvFi1fnnWCzMO/zMVeDQZR9m016msjFusJIgzZw=; b=RIEyJqySDJB3Cbkll
	BW1kF8PFqZD2EzQEM5neL7nAOFvxYV/E9ilA8AEuZCrRv4TLnkRMWMQtJorifho6
	b2hlURWa/H6xpDTXuvgEKtQr2WH5yzdYIXhDAFj/Py+IFOmtggnfYpmAmYPdk0lR
	qDYhWXQYpTrZfJQvhr/o/wM22vUEhimghAGLB7Y01o7DoPYVNEtigDwYNwYoH3io
	HYEJNA9b1prHfZ8d/4HmcmHFcXSJQ2teCRPdTa1aZ2P6QMAnrbqhtVKo32v+faxE
	KV1ygVvb1L5Qhm4TIH53K63XiPhoI1QP6zw/CcQ/BlO5a41E3ttxIwpF+/6LKEC1
	rHLVw==
X-ME-Sender: <xms:2XN8agDFv2kkMl6bsL8joFhnrFlt4qCQmDXLzMonFQrQdMTby4kgaQ>
    <xme:2XN8amcoz7uajMOdOynQWduYWUTRaI2eTcjhvbxXaGLcUOvTwW_gaUBpvdibVzsW9
    xLWRzrIbWJMPAEgwChk3s3EhFFpsZEsEPzmbiUUUW1XTDWGp59uQJPw>
X-ME-Received: <xmr:2XN8asH9Me_Qx8ktAVwJynKrhpkQk_vPXG9nzbVDLpzaA7XaF5kBRqjWwX0>
X-ME-Proxy-Cause: dmFkZTFkdXlhB1yyyGZX3J7dnv16PFzu5W734vHfSlZD/y8c/c/hfyf9JcTqEblNR0Fovw
    r+VLRtLwlZT2tYuTqMJsjjjBxJMgoAM7D6pmLt36lViB2yT50Uubj7I3KQF8rzeVMBK9wq
    rm57aKmY5NwWN7q607eE1gnukbthccXm6lhrmbDGqX6XovHG8JRMLfqJj+jBW3X680r35h
    P9o/w0aRWYBwLgRKYH9oTyb2lbiE5fXNRZyQYMHMmm7yuduJ70EU4YPdENzrqcZn4mtIUi
    PPdmMfUKqzUyYVrtf6UgPYBrZU3VzLkrgoUPTsKVKEpiHQHdj45X731bFwNLlQpPGy3QFN
    V7dgSNKYqlBiXdTHQIw/lw5HlTJhpNpUrF9ugBKaUaWKSH5j7b1IYg/YApSXWwvfWBfuhr
    QAXox8IkePgY6WG5m4Oynz5vJSaOTxCdYVSLz9VnAkaKtkRO/FBY+OQ3RH210u/pRfffHq
    w5bIr5qXPR2cA9VuUDzpQKZTnAgtC/nBo+NNBNXkcdlA94Bxo1TKm8bb7GlOnfSIqIBOaK
    J4PtG3ednYkGlLmWVW0qLO319MeCqp/3M3mmL2oqfVzkWFmpPYaL8PhukIYOudoQ9MI0En
    8bK9jL1xCgVmT/Wthen8UJ7B7wOIpYEHlydIpTC1Td5KcLGLtrRIiwlFfnFQ
X-ME-Proxy: <xmx:2XN8agWCDIAgNyK-484kYDai7wVa3vrMyVY5yxEuyJ0E34ow_YpSCQ>
    <xmx:2XN8aswsiMNPeQbzEf2oqtlVfghaaVHcnap93-EI0BebUITn2mKLOg>
    <xmx:2XN8artsk8wYWIprdWGR2a030PqmARjSuwdE6HXtMY5bDNhcn93FIQ>
    <xmx:2XN8atBzykQHw2b6S1aTku59c6Va2ElDMQ84Ti1l-xJ6kybvLX6Msw>
    <xmx:2XN8aljNVfoWXa6BQ1tceti8DVu9CNmAVEvlIb1KVqQstwoCqfTCrnwo>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 09:23:36 -0400 (EDT)
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
Subject: [PATCH v3 11/18] selftests/mm: parameterize the mixed-source collapse case by source order
Date: Wed, 12 Aug 2026 14:22:57 +0100
Message-ID: <20260812132304.199287-12-kirill@shutemov.name>
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

collapse_order_mixed_sources faults its region as order-2 folios and
collapses them to the -c target.  Order 2 sits below the contpte threshold
on both arm64 page-size configurations, so nothing in this suite unfolds a
contpte source on purpose.

Let -s name the source order alongside -c, which was rejected before.  The
case then faults at that order, keeping order 2 when -s is absent, and the
source order has to be a supported mTHP order below the target.  Other
cases are unaffected: they enable their source order locally.

"-s 5 -c 7" on arm64/64K then collapses contpte-mapped sources into a
larger mTHP.

Assisted-by: Claude-Code:claude-opus-5
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 7889ea1cd322..3099e7b720d9 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1412,10 +1412,13 @@ static void collapse_order_max_ptes_none(struct collapse_context *c,
 static void collapse_order_mixed_sources(struct collapse_context *c,
 					 struct mem_ops *ops)
 {
+	int source_order = anon_order ? anon_order : MIN_MTHP_ORDER;
 	struct thp_settings settings;
 	void *p;
 
-	if (collapse_order <= MIN_MTHP_ORDER) {
+	/* Sources must be a supported mTHP order strictly below the target. */
+	if (source_order >= collapse_order ||
+	    !(thp_supported_orders() & (1UL << source_order))) {
 		ksft_test_result_skip("%s: no source order below target\n",
 				      __func__);
 		return;
@@ -1423,23 +1426,22 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
 
 	mthp_push_target_order();
 
-	/* Fault the whole region as order-MIN_MTHP_ORDER folios. */
+	/* Fault the whole region as order-@source_order folios. */
 	settings = *thp_current_settings();
-	settings.hugepages[MIN_MTHP_ORDER].enabled = THP_ALWAYS;
+	settings.hugepages[source_order].enabled = THP_ALWAYS;
 	thp_push_settings(&settings);
 	p = ops->setup_area(1);
 	ops->fault(p, 0, hpage_pmd_size);
 	thp_pop_settings();
 
 	/*
-	 * The order is enabled, but the allocator can still fall back under
-	 * fragmentation.  That leaves nothing to collapse from, which is the
-	 * machine's answer rather than a reason to end the run.
+	 * The order is enabled and supported, but the allocator can still fall
+	 * back under fragmentation.  That leaves nothing to collapse from,
+	 * which is the machine's answer rather than a reason to end the run.
 	 */
-	if (!is_range_backed_by_folio_orders(p, hpage_pmd_size, MIN_MTHP_ORDER,
+	if (!is_range_backed_by_folio_orders(p, hpage_pmd_size, source_order,
 					     pagemap_fd, kpageflags_fd)) {
-		ksft_print_msg("No order-%d sources to collapse...",
-			       MIN_MTHP_ORDER);
+		ksft_print_msg("No order-%d sources to collapse...", source_order);
 		skip("Skip");
 		ops->cleanup_area(p, hpage_pmd_size);
 		thp_pop_settings();
@@ -1448,7 +1450,8 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
 	}
 
 	madvise(p, hpage_pmd_size, MADV_HUGEPAGE);
-	ksft_print_msg("Collapse region backed by smaller large folios...");
+	ksft_print_msg("Collapse region backed by order-%d sources...",
+		       source_order);
 	if (!khugepaged_wait_full_pass())
 		fail("Timeout");
 	else if (window_collapsed(p, hpage_pmd_size))
@@ -1479,6 +1482,8 @@ static void usage(void)
 	fprintf(stderr,	"\t\t-s: mTHP size, expressed as page order.\n");
 	fprintf(stderr,	"\t\t    Defaults to 0. Use this size for anon or shmem allocations.\n");
 	fprintf(stderr,	"\t\t-c: collapse order for mTHP collapse, expressed as page order.\n");
+	fprintf(stderr,	"\t\t    With -s, -s names the mTHP source order for the\n");
+	fprintf(stderr,	"\t\t    mixed-source case (source order below the target).\n");
 	exit(1);
 }
 
-- 
2.54.0


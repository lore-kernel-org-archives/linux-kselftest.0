Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EF7545D8A;
	Tue,  8 Sep 2026 12:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871898; cv=none; b=QOauZ1ZufAi2Q4wcbWoz1w9JVFYYPuihJa1l0zgXMfh1LJyX9Gu1CMBnu5E3aNsMDOVupYeV6J2jRao5pVpEzZng3locB2D/8PhmySb5PllE6Kz3wgC8JvF/15T8Yv47tDt4HQ8uVfhlVfWUeso4SifDBOOx8p9JHkz2e+6RDWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871898; c=relaxed/simple;
	bh=M6Jf/V12XFKo186JFVDLx8ROkS5e8Zn0HYJm1WRgzrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZbSWyv9QGoZRkCFEhqsEMLGzygcI1ZlF1agCPojooyQ76XZ1j1/nJeiCAX7f4OFB2IThIC5G/LQCsF9Q4u5SHyoE7v9QzTm0IpLc8fQMnzFxy9VE3odqIkov8/5v83v1Ad2reQUnJ5RP2eoE8Tpas3AXkVfVX8gjycqONiTQkhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=TMV4cmol; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iFYTl03s; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="TMV4cmol";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iFYTl03s"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 3A20EEC0032;
	Tue,  8 Sep 2026 08:51:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 08 Sep 2026 08:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788871895; x=
	1788958295; bh=aAoOR2JpHpeae+txrvqhct8oCjiMK1u+dO7P0yt7mGY=; b=T
	MV4cmoloJrwMWev3RQ9drw5GaSxGrwTGLJqzy8wDPst53OjD4n7sATPRu7Y59jhW
	KGUSMXMIFAKQSyQ0JhbBTT1/zQKipJ5szN3yGai4xryF3F5uYD6zat/fo509pQun
	+LVXHKDat2sXYDQ/0WDZe4wg8ifiytXcT9VPfhumlTK73+kAmYpom4wypkAQ3c9u
	ph+M4ui84MCPW3jJIjzWx4yuWUa3HQ0tvkM/O4j0AK/nArhbGpBCEQOCjw4ECzrT
	5ogMDkyp0qNR1BSLckBpxBNiFZ3dwaoKCU/XgyqzRUyihqpNF+5Z9DBu5XkPMaF9
	JGegXEKQUBoO8g8tkcU4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788871895; x=1788958295; bh=a
	AoOR2JpHpeae+txrvqhct8oCjiMK1u+dO7P0yt7mGY=; b=iFYTl03scM205lMti
	zu6nsqBavzBq2vot9GYPyOX1lNWHP1CX2u0WwoD3jYi7bYIP9eoqC3mYFFU+x59h
	gr49yKlvjlOtgFVTZfgwoB3QUo53oxfrBryZHdyRZMD1coag+yFEE6eJdLR3eM5D
	1Uu8Xg7SHaglbkx6SRENp8anIJ2e0LQ2eYDcoZgb5r8hbP4KwINCrdQ4bIhR0ley
	kVp7fB19LPjWufW4sKkTzlTeK+YlaNkrEpi5RK0NYER9GyvSW/uXHHwrQ2y4kLHj
	V2AtfcHAeP4I0MrgrskmL4Cb2/0mO68doabZgP8RU9+8I4XH3FnYu3YXPxtY4IKi
	oFO6A==
X-ME-Sender: <xms:1wSgaj393UJYpkOctWYyXk5FJvVwN-oTwaBpr66ew5d3tr3IEmCsFQ>
    <xme:1wSgaqc5iq6f8cel7KrgW4oUlp0Hbpw7dAqyaeSNKVAYNnXJ3WdX6P1MXdjjT2lZJ
    QCvRlt08mlRC9GlAzKBp9rR5IxqiN_JppEw3QeDnbFcfbTY_YqnFKk>
X-ME-Received: <xmr:1wSgamHuXqMAlTo8vcmVvXqQaYmzi4TnLJfr7zY3tsdnwqn1ViPMs2wt38Y>
X-ME-Proxy-Cause: dmFkZTFWe/QI6m+ZXOiH25I14VSUcDEmQWvIJTkoHMAZtN2azwvxUv07K8nNahSlNeJ4Z9
    6eHjxl/BiXM1vPYXBSjNJhxqwqvDDNYnCkPHmLCbq4adC57onKQLlqdPi/SM35ZhUSQuAt
    oRpyp7Ri3t8bYQcmJtPujCQbmd86G+mUWXXI2nu6Mtv09ASCHHJTlzhzeQpnnFQ07IodBo
    3ooVqbRyu34Jvm9Dh+nNFu4XRDq6hWeQ2IW+S+nyO71TFsfO33MG2zd0J+TcVl9g/s7mL/
    x93b/UdXcwtuY1HOdcGRsIdopKTGnoTNDXdbX9wz19n5nkOd3IsxnbGCKHISgqzDlIJpBD
    7kpFqjWaHYh20TF1Po27X3IUf2hMX5WsY2ffOrBn8O33Q4PGlV+0eG26xYkEoVPjpLUQ7o
    K4Gw+1BIHrS6+Df0gszthr8DRxnMQoOSZO0zOGZCNfutMv443eaJo6WYdl2v4wMZGU6svH
    nRDQBsmPu/104D5jb6kvKPpcsMCDluEQBGgVtgI16Tk5ZZuiHVgXQpJO06zvlykLvd/xIU
    O59/TSCW7b4ZnRZQ8uEo0fjBLO2VaS3b6G5vQUvF41wiuhHQkX479nttXU3hp094FjYQbm
    fA2IsmO+3dizMZryokRV+4EP/gN9G0i1r9RtmCtB4HOw9ZiQ4bEiDJepkq9Q
X-ME-Proxy: <xmx:1wSgagrXYKrFe-rvPZLFQP7pn9Pgs_mrPCWl8ab3TPh5A5fe1KLEig>
    <xmx:1wSgaoL0d7_p31uFJBDErwPwMIGiZjkK3DDwl4A-6wrkhUh4vO7uNQ>
    <xmx:1wSgapxGp7OKjMBJY76JK3Ce26jJtc0CgX9ex3S0tIRIfyIyvm2YFg>
    <xmx:1wSganbiassJwc9qE26I6X5tY7_9T21fthP7B5r22UHCbwgn4U1iHg>
    <xmx:1wSgapFr2bLOqY782OVoC6BmJsd1ugUJbMasnQ_tew7ZCRipCeBMeW-q>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 08:51:34 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	rppt@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	usama.anjum@arm.com,
	usama.arif@linux.dev,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ziy@nvidia.com,
	baohua@kernel.org,
	dev.jain@arm.com,
	hughd@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	mhocko@suse.com,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	agordeev@linux.ibm.com,
	jgg@ziepe.ca,
	leon@kernel.org,
	kernel-team@meta.com,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH v5 12/19] selftests/mm: parameterize the mixed-source collapse case by source order
Date: Tue,  8 Sep 2026 13:50:58 +0100
Message-ID: <20260908125105.1510704-13-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908125105.1510704-1-kirill@shutemov.name>
References: <20260908125105.1510704-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

collapse_order_mixed_sources() faults its region as order-2 folios and
collapses them to the -c target.  Order 2 is below the contpte size on
every arm64 page size, so nothing in this suite collapses a contpte-mapped
source on purpose.

Let -s name the source order alongside -c.  The case then faults at that
order, keeping order 2 when -s is absent, and the source order has to be a
supported mTHP order below the target.  The other mTHP cases are
unaffected: mthp_push_target_order() enables only the target order.

"-s 5 -c 7" on arm64/64K then collapses contpte-mapped sources into a
larger mTHP.

Assisted-by: LLM
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index fb4efaf67c40..b15cd07fc0b3 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1352,11 +1352,13 @@ static void collapse_order_max_ptes_none(struct collapse_context *c,
 static void collapse_order_mixed_sources(struct collapse_context *c,
 					 struct mem_ops *ops)
 {
+	int source_order = anon_order ? anon_order : MIN_MTHP_ORDER;
 	struct thp_settings settings;
 	void *p;
 
-	if (collapse_order <= MIN_MTHP_ORDER) {
-		ksft_test_result_skip("%s: no source order below target\n",
+	if (source_order >= collapse_order ||
+	    !(thp_supported_orders() & (1UL << source_order))) {
+		ksft_test_result_skip("%s: no supported source order below target\n",
 				      __func__);
 		return;
 	}
@@ -1364,7 +1366,7 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
 	mthp_push_target_order();
 
 	settings = *thp_current_settings();
-	settings.hugepages[MIN_MTHP_ORDER].enabled = THP_ALWAYS;
+	settings.hugepages[source_order].enabled = THP_ALWAYS;
 	thp_push_settings(&settings);
 	p = ops->setup_area(1);
 	ops->fault(p, 0, hpage_pmd_size);
@@ -1374,10 +1376,9 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
 	 * The allocator can fall back to smaller folios under fragmentation;
 	 * having nothing to collapse from is not a failure.
 	 */
-	if (!is_range_backed_by_order(p, hpage_pmd_size, MIN_MTHP_ORDER,
+	if (!is_range_backed_by_order(p, hpage_pmd_size, source_order,
 				      pagemap_fd, kpageflags_fd)) {
-		ksft_print_msg("No order-%d sources to collapse...",
-			       MIN_MTHP_ORDER);
+		ksft_print_msg("No order-%d sources to collapse...", source_order);
 		skip("Skip");
 		ops->cleanup_area(p, hpage_pmd_size);
 		thp_pop_settings();
@@ -1387,7 +1388,8 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
 
 	if (madvise(p, hpage_pmd_size, MADV_HUGEPAGE))
 		ksft_exit_fail_perror("madvise(MADV_HUGEPAGE)");
-	ksft_print_msg("Collapse region backed by smaller large folios...");
+	ksft_print_msg("Collapse region backed by order-%d sources...",
+		       source_order);
 	if (!khugepaged_full_pass(MTHP_PASS_TIMEOUT_S))
 		fail("Timeout");
 	else if (all_windows_at_order(p, hpage_pmd_size))
@@ -1418,6 +1420,7 @@ static void usage(void)
 	fprintf(stderr,	"\t\t-s: mTHP size, expressed as page order.\n");
 	fprintf(stderr,	"\t\t    Defaults to 0. Use this size for anon or shmem allocations.\n");
 	fprintf(stderr,	"\t\t-c: collapse order for mTHP collapse, expressed as page order.\n");
+	fprintf(stderr,	"\t\t    -s, if set, is the source order for the mixed-source case.\n");
 	exit(1);
 }
 
-- 
2.54.0


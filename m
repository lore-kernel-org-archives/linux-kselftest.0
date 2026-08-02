Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3399D341068;
	Sun,  2 Aug 2026 19:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785700409; cv=none; b=FtE9GCd71ySOJyakdy8mtjtvqvB31XyxsKNoJ5hR6Iar9PlTdz5KhwDky1VvsXHhwXf3Q7MHyW89zFZl6XQSdFatQQRKQ7QrTJ/Ezguiw0GRKVIR15UcGZhPmOOHCKhb8dgwa+nTAjUWIIphNuXSWfSXd0+9X2/vZfTUVkHNynM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785700409; c=relaxed/simple;
	bh=OatVueuV+ZJUrbO11bCLUn/PhhtbZzHu8sg0gT4N1OA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Di7i8cp7cCZ8fFv4qpFVgN2r5j6iIR33DXXLRApyAEczd+0PoPKLCp1MtcjdkGCdjVJitpTjTVsqXbpZQDB2Zzinbnq9R72tSPhK08r3cDMhHiT6brvmUjmJq3LLt4kfER0thY/h656jY9O9pkDS3V8uCE0xGkevvDi0PuPliVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=sxFVV3Ci; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NSpTRmU+; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="sxFVV3Ci";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NSpTRmU+"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 4833EEC001F;
	Sun,  2 Aug 2026 15:53:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sun, 02 Aug 2026 15:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785700406; x=
	1785786806; bh=RZMR9To8koVR0ozlGuqUF74GOHYuMZBcuhN135RFhM8=; b=s
	xFVV3Civr8W4Sm6v+k3T1ur/Fehmz1wu5+YEs+OpJ/CjQP6xVH3rakZYf9WeAo4T
	mpaXBGKHwickFAr1eQELYW1hije+5eRjlQhRhGDJfhuiyPqLLyQXCjZe/G7tOO0p
	gBiU96CIqHs1ReDrG53/8Vo+zj3t0qXFqhJviGYQaFmuMatMBRjntEufRxQCzBWG
	My0pDO9bCBrDxFYkP97sSu8F/4yVmcwE096XsDsMgBleOVHKR8pfGhJsdHeg0wQa
	b8JwzOSkP/c3n+Efd5txCrXHzN3xWWbH0kJ9Ks+iS2xSZPt1KV/4a//ZN+j+hk1p
	PJVJVLEAGm+586YH6E7Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785700406; x=1785786806; bh=R
	ZMR9To8koVR0ozlGuqUF74GOHYuMZBcuhN135RFhM8=; b=NSpTRmU+uLh3MB/6E
	507fh5YAKwvX1CTAqfZF7pk1rlEcSCvw+uJeAooRjkT4ZO2qZlNZhg6/cYblmQVY
	4HMMAEVj6apavFviqf1y85SjYu6sS3E2hijwzob2Sf9emcclpR0UacENRGiwh10M
	UudXIVgEwBGmR8T64b74LUc17PJETnbDjvaM8vZxzuJvptZDOmtlLQ1liH41y0rO
	PXRQfJEY9W4wWmPFhaSamIi6oMbfEREYB7jq35p9SHYGC4fh4R7Q7sNVav7SQ4ig
	eYDyfh+2VW3w79FFFipn/Mo8guczxv9i5B6IE94OP/1x4AQIr7A+tnR76DGh95n7
	8fUFA==
X-ME-Sender: <xms:NaBvattvY-GWTUXdf8CYQUG-am2-yQWorrIzyxgFHDQp0LcYyU9eLw>
    <xme:NaBvag8KdQDB6yOLNoW70LJCl91HoN8s-co_IDGwD-CXAtetn8YiWd5_-5MBWvXtv
    KA-IwlLvA20UjvS4rXrrWTdGllNSvMTgdNPNOjxngCZDnLmZamLG8eq>
X-ME-Received: <xmr:NaBvattf2Oa5XvUiEOGPV9OkY03VKJHtSs0ShhlK-6kdfLd44qgU_tLkmjE>
X-ME-Proxy-Cause: dmFkZTFcbv35QwNbwWPHQBcJdrWasH4YRFOBaNWig98oa0GgLD3LmQrthvyDgK5JnDhp96
    dBkNywOXlTP9Hby+cm0vRQHofuB4BhsdtVcBrMer/A2AOpegfr9Hr7RYzI6OqquxWhxeXC
    aB5bOw4cR5G6EDzO4v2r94SJnXRDYvi2NMwyCB/quID+suEuw0TjLUMYjjQ5pFm1F3OqpQ
    Ctej7rOharBpUeBz9hjZojzUlseCYYYMV+BulSa6+jD3O5m4ZOeULsSyQlLb9bciCyrhiP
    bT+z0cGYr8PFizBGTpPnPZCe+jZkx/DQlEsoaoSV2SjHlZpE6q2+n/t1AcZaLqu1qPGmpu
    ip4XUMH5XVLjzf0IyhU7nep9P+nlGRQBRreBEgwvXRs67QkZeK9Gmz2zBZg2RKa00u3uu6
    7gC+UVdjdeDtkGj/sLdBd8qs7uz4dTfnFPvj0zAUyAP+4VcH0urtzCzw0jnvCmOiKBLy/g
    edZwSCB6w7MNUYSIQ5swxIIWQlFKG4xU0V9NepiEx72r9KQHpctpYaXVpJB6jHPOSTM82e
    oKhkRKZBvWXX9WwcxxS/+dKTUnFPDX9Ea6K5zIbNOLFFpVlXMrdNegc7GaNlEk2RFEBhnq
    ogxJ1urSAV0BPpw5IKope93csKKmM4b05PqDvET00/uOjtX+g50OCOI+SZLw
X-ME-Proxy: <xmx:NaBvam5ZkBNp-1Gk_0DppdhZYsUmsN1DSRr_QKiDtL0YD5Xv1oxZTw>
    <xmx:NaBvamMr9a7ioiWcJyq2zndixAx42wiUz-quP5IGlQrtbFHPc9M18w>
    <xmx:NaBvaiLC2rL5RhMGnbipaOtlvu245C4H4AMdUbS8viqpy-wtzyb2nw>
    <xmx:NaBvahytnhxLabM4A7wjnohwR0cWiCKXn2IknASGWjR9SchE_GsFXw>
    <xmx:NqBvaild5nx4mfXbAr8VlomjVW51pjy_-RKDJd3XuXHKndSe-JO7q3e7>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 15:53:25 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Nico Pache <nico.pache@linux.dev>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH 13/16] selftests/mm: parameterize the mixed-source collapse case by source order
Date: Sun,  2 Aug 2026 20:52:45 +0100
Message-ID: <20260802195254.1937477-14-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802195254.1937477-1-kirill@shutemov.name>
References: <20260802195254.1937477-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

collapse_order_mixed_sources faults its region as order-2 folios and
collapses them to the -o target, covering collapse of sources that are
already large folios of an order below the target. But it only ever tests
one source order, and order 2 sits below the contpte threshold on both
arm64 page-size configs -- so a source-side contpte unfold is never
exercised deterministically by this suite.

Let -s name the source order when combined with -o (it was rejected
before): the mixed-source case then faults at order @anon_order instead of
the fixed order 2, keeping order 2 as the default when -s is absent. -s
stays constrained to a supported mTHP order strictly below the target; the
other order-parameterized cases keep their order-0 sources (the source
order is enabled locally, not globally), so -s under -o is a knob on the
mixed-source case alone.

This makes e.g. -s 5 -o 7 on arm64/64K collapse contpte-mapped sources
into a larger mTHP, covering the source-unfold path directly.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 42 +++++++++++++++++++------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index b074b005b62f..21a8fb24dc43 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1363,28 +1363,32 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
 					 struct mem_ops *ops)
 {
 	struct thp_settings settings = *thp_current_settings();
+	int source_order = anon_order ? anon_order : MIN_MTHP_ORDER;
 	void *p;
 
-	if (anon_target_order <= MIN_MTHP_ORDER) {
+	/* Sources must be a supported mTHP order strictly below the target. */
+	if (source_order >= anon_target_order ||
+	    !(thp_supported_orders() & (1UL << source_order))) {
 		ksft_test_result_skip("%s: no source order below target\n",
 				      __func__);
 		return;
 	}
 
-	/* Fault the whole region as order-MIN_MTHP_ORDER folios. */
-	settings.hugepages[MIN_MTHP_ORDER].enabled = THP_ALWAYS;
+	/* Fault the whole region as order-@source_order folios. */
+	settings.hugepages[source_order].enabled = THP_ALWAYS;
 	thp_push_settings(&settings);
 	p = ops->setup_area(1);
 	ops->fault(p, 0, hpage_pmd_size);
 	thp_pop_settings();
 
-	if (!is_range_backed_by_folio_orders(p, hpage_pmd_size, MIN_MTHP_ORDER,
+	if (!is_range_backed_by_folio_orders(p, hpage_pmd_size, source_order,
 					     pagemap_fd, kpageflags_fd))
 		ksft_exit_fail_msg("Region not backed by order-%d folios after fault\n",
-				   MIN_MTHP_ORDER);
+				   source_order);
 
 	madvise(p, hpage_pmd_size, MADV_HUGEPAGE);
-	ksft_print_msg("Collapse region backed by smaller large folios...");
+	ksft_print_msg("Collapse region backed by order-%d sources...",
+		       source_order);
 	if (!khugepaged_wait_full_pass())
 		fail("Timeout");
 	else if (range_collapsed(p, hpage_pmd_size))
@@ -1414,7 +1418,9 @@ static void usage(void)
 	fprintf(stderr,	"\t\t    Defaults to 0. Use this size for anon or shmem allocations.\n");
 	fprintf(stderr,	"\t\t-o: collapse target order for khugepaged:anon.\n");
 	fprintf(stderr,	"\t\t    Runs the order-parameterized collapse cases instead\n");
-	fprintf(stderr,	"\t\t    of the PMD cases. Cannot be combined with -s.\n");
+	fprintf(stderr,	"\t\t    of the PMD cases.\n");
+	fprintf(stderr,	"\t\t    With -s, -s names the mTHP source order for the\n");
+	fprintf(stderr,	"\t\t    mixed-source case (source order below the target).\n");
 	exit(1);
 }
 
@@ -1438,7 +1444,15 @@ static void parse_test_type(int argc, char **argv)
 		}
 	}
 
-	if (anon_target_order && anon_order)
+	/*
+	 * -s and -o compose: -s then names the mTHP source order for the
+	 * mixed-source case, which needs a source strictly below the
+	 * target (and at or above the smallest mTHP order). Alone, -s is
+	 * the source order for the default PMD suite; alone, -o is the
+	 * collapse target for the order-parameterized suite.
+	 */
+	if (anon_target_order && anon_order &&
+	    (anon_order < MIN_MTHP_ORDER || anon_order >= anon_target_order))
 		usage();
 
 	argv += optind;
@@ -1573,9 +1587,17 @@ int main(int argc, char **argv)
 	default_settings.khugepaged.max_ptes_shared = hpage_pmd_nr / 2;
 	default_settings.khugepaged.pages_to_scan = hpage_pmd_nr * 8;
 	default_settings.hugepages[hpage_pmd_order].enabled = THP_INHERIT;
-	default_settings.hugepages[anon_order].enabled = THP_ALWAYS;
 	default_settings.shmem_hugepages[hpage_pmd_order].enabled = SHMEM_INHERIT;
-	default_settings.shmem_hugepages[anon_order].enabled = SHMEM_ALWAYS;
+	/*
+	 * Under -o the order-parameterized cases want order-0 sources by
+	 * default; the mixed-source case enables its own (possibly -s
+	 * selected) source order locally. Enabling it globally here would
+	 * make every case fault that order.
+	 */
+	if (!anon_target_order) {
+		default_settings.hugepages[anon_order].enabled = THP_ALWAYS;
+		default_settings.shmem_hugepages[anon_order].enabled = SHMEM_ALWAYS;
+	}
 
 	if (anon_target_order) {
 		/*
-- 
2.54.0


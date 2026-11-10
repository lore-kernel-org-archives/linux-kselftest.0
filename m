Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.237
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296724;
	b=TA6RYJnL+OF5awSeraKUnPAWNu5bzo/tkrZFIxtsOx0xyUTmWM9qCMJTODRe/Clved1n
	 xrDRYmET03c+W0uzH+/FTTgcwnwUlmKnCApYIs7xieL+tjc/KBxrX3aWPa+KQBI0fluzu
	 ZHeRDsfSlc3BDooGyF2jDCf9X5b09BV0fgXpFHjv5loDNg5gB93e6k0tXHdLvY5IaWMdv
	 hAMM3+7HBVY76YnUuyL1rSZDw+KUsGtmc7BJRx3bk/aW5Cozz8HKlF8Mvk5cGzr4CsM9l
	 pA8gOZx5YmIevjliiDcbjjbmEb1xJtmMAFQXEpNgbu+Z5YpyWx1/z+NOHayi4kKcFng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296724;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bYjIYJm+n4nfDEAiZsWWktm7zzoyMcwgpbOm01w6spo=;
	b=CTCSMA16SUbrzwghNa+HqRibAE+qKzraf70DW4JHQcjjEyNpFBGuC19FAaj8CEzJspfV
	 5rUoQPsBJ4bQyt9zJUm+DO/8Tk+pm6li2JDpd4WEIn3cdxnBuNfA6pJVx3uVYVHg6LOVk
	 5K1VgAc8EmsU3PIIo0oPsxJNo76WaegoQAtFSEzzcHVub2IqCpI1QNouZ9sGgp0WfNyia
	 TqQihLW2B/an8ruPXUC4pe3n/XbGBG+M0ct2vBjp8h4G8mwdG68XFk0/A0qaZ82MoohMr
	 /b58VMMXp7qqzgWFCcz6iqrES6V9DVs4XZE6wsZ8jBj65QnFt3UzgAAlaZBflqLhwdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vlqCJjlJ;
	arc=none smtp.remote-ip=91.218.175.237
Received: from mta0.migadu.com (out-237.mta0.migadu.com [91.218.175.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA176075577
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 07:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECA176075577
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vlqCJjlJ
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eY4VzD6wuof/JGdxP9nVKDJYmUFOxcoqpj+Y4Rp/P/w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794296721; v=1; x=1794901521;
 b=vlqCJjlJyhHO7JNbh8wajhkg5NO2nXDKM909lNOFUfkvgpW5VMjfwx25/Ij7r4IAoc3qN9jO
 pvKoFU0KTLNqAH5FS6p7MEbW8dboYwgKqMDNyHnEDT077oFgIzFKurSY4FboJMkAIQaAG2+6jjm
 Wzn+O01jdKSBSvqiJwnfISLo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id d048f83d76d25cf6;
	Tue, 10 Nov 2026 07:45:20 +0000
X-Mizu-Trace-ID: d048f83d76d25cf6
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: xu.xin@linux.dev
Cc: akpm@linux-foundation.org,
	chengming.zhou@linux.dev,
	corbet@lwn.net,
	david@kernel.org,
	link@vivo.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	odys.yuan@gmail.com,
	rppt@kernel.org,
	surenb@google.com,
	tujinjiang@huawei.com,
	vbabka@kernel.org,
	xiao.wang@vivo.com
Subject: [PATCH 2/4] ksm: skip rmap_item allocation for non-zero pages under only_merge_zero_pages
Date: Tue, 10 Nov 2026 15:44:49 +0800
Message-Id: <20261110074451.220524-2-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110074451.220524-1-xu.xin@linux.dev>
References: <20261110074312.219847-1-xu.xin@linux.dev>
 <20261110074451.220524-1-xu.xin@linux.dev>
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

When only_merge_zero_pages is enabled, ksmd only ever merges empty
(zeroed) anonymous pages with the kernel zero page. A page that carries
data can never be merged, yet the current code still allocates an
rmap_item for it in scan_get_next_rmap_item() before cmp_and_merge_page()
decides to skip it.

On workloads with a large amount of non-mergeable anonymous memory this
is a real cost: every scanned non-zero page pays for an rmap_item
allocation, and the rmap_items accumulate in the per-mm pending list.
For example, a MySQL instance with hundreds of gigabytes of anonymous
memory (mostly buffer pool pages that cannot be merged) ends up with
ksmd creating rmap_item metadata for each candidate page; the metadata
overhead can wipe out any gain from the zero-page merging and even turn
the net benefit negative.

Add should_skip_non_zero_page(), called in scan_get_next_rmap_item() before
get_next_rmap_item(), which, when only_merge_zero_pages is enabled,
checks whether the candidate page is all zeros. A non-zero page is
skipped entirely: no rmap_item is allocated for it, and any stale
pending rmap_items below it are freed (as get_next_rmap_item() would).
The page is reported back to ksm_do_scan() as ERR_PTR(-EAGAIN), which
counts it as scanned and continues, so the pages_to_scan budget is
preserved.

The all-zero check (pages_identical() against the kernel zero page) reads
the whole page. For a non-zero page this is a net win: the extra page read
is cheaper than the rmap_item allocation and the stable/unstable tree
operations it would otherwise trigger.

A page that is zero now but is written before cmp_and_merge_page() runs
is still handled correctly, because the checksum-based decision in
cmp_and_merge_page() (added by the previous patch) is the authoritative
one.

Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
Co-developed-by: Jinjiang Tu <tujinjiang@huawei.com>
Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
---
 mm/ksm.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/mm/ksm.c b/mm/ksm.c
index 49f3728a3d03..e641c37ee096 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2535,6 +2535,69 @@ static bool should_skip_rmap_item(struct folio *folio,
 	return true;
 }
 
+/*
+ * Determines whether a candidate page should be skipped entirely when
+ * only_merge_zero_pages is enabled, before an rmap_item is allocated for
+ * it.
+ *
+ * A page that is not all zeros carries data and can never be merged with
+ * the kernel zero page, so there is no point in allocating an rmap_item
+ * for it. Skipping it here avoids the rmap_item metadata cost that full
+ * KSM would otherwise pay for every non-mergeable page.
+ *
+ * @rmap_list: head of the per-mm pending rmap_item list
+ * @addr:      address of the candidate page
+ * @folio:     folio containing the candidate page
+ * @page:      the candidate page
+ *
+ * Returns true if the page should be skipped (and any stale pending
+ * rmap_items below @addr are freed), false if it should be processed.
+ */
+static bool should_skip_non_zero_page(struct ksm_rmap_item **rmap_list,
+			     unsigned long addr, struct folio *folio,
+			     struct page *page)
+{
+	struct ksm_rmap_item *rmap_item;
+
+	if (!ksm_only_merge_zero_pages)
+		return false;
+
+	/*
+	 * Pages already merged by KSM are handled by cmp_and_merge_page();
+	 * do not skip them here.
+	 */
+	if (folio_test_ksm(folio))
+		return false;
+
+	/*
+	 * An all-zero page is exactly what we want to merge with the kernel
+	 * zero page; process it.
+	 */
+	if (pages_identical(page, ZERO_PAGE(0)))
+		return false;
+
+	/*
+	 * The page carries data: free any pending rmap_items that are below
+	 * it (they are stale, as get_next_rmap_item() would), and skip it so
+	 * no rmap_item is allocated for it.
+	 *
+	 * Compare the masked address, unlike get_next_rmap_item() which
+	 * compares the raw rmap_item->address (which may carry the
+	 * UNSTABLE/STABLE_FLAG bits). That is intentional: a pending
+	 * rmap_item at the same address as a non-zero page is stale and must
+	 * be freed here, not returned for processing.
+	 */
+	while (*rmap_list) {
+		rmap_item = *rmap_list;
+		if ((rmap_item->address & PAGE_MASK) > addr)
+			break;
+		*rmap_list = rmap_item->rmap_list;
+		remove_rmap_item_from_tree(rmap_item);
+		free_rmap_item(rmap_item);
+	}
+	return true;
+}
+
 struct ksm_next_page_arg {
 	struct folio *folio;
 	struct page *page;
@@ -2737,6 +2800,16 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 			if (tmp_page) {
 				flush_anon_page(vma, tmp_page, ksm_scan.address);
 				flush_dcache_page(tmp_page);
+
+				if (should_skip_non_zero_page(ksm_scan.rmap_list,
+						     ksm_scan.address, folio,
+						     tmp_page)) {
+					folio_put(folio);
+					ksm_scan.address += PAGE_SIZE;
+					mmap_read_unlock(mm);
+					return ERR_PTR(-EAGAIN);
+				}
+
 				rmap_item = get_next_rmap_item(mm_slot,
 					ksm_scan.rmap_list, ksm_scan.address);
 				if (rmap_item) {
@@ -2839,6 +2912,15 @@ static void ksm_do_scan(unsigned int scan_npages)
 		rmap_item = scan_get_next_rmap_item(&page);
 		if (!rmap_item)
 			return;
+		if (rmap_item == ERR_PTR(-EAGAIN)) {
+			/*
+			 * A non-zero page was skipped under
+			 * only_merge_zero_pages: it was examined but not
+			 * merged, so count it as scanned and keep going.
+			 */
+			ksm_pages_scanned++;
+			continue;
+		}
 		cmp_and_merge_page(page, rmap_item);
 		put_page(page);
 		ksm_pages_scanned++;
-- 
2.34.1


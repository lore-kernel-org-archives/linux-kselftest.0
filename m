Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F79E2AD00;
	Sat, 19 Sep 2026 00:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777525; cv=none; b=q62i9bbC5m0ijCEN1M8UB6aQtmKVVKmz0R0/7R/UqFjQtRfdLMW/IHkJQdKZ/5+Hb+sW15weYfLup2pU1a0gAnsPfRiCVdobSyi0rvBxO/VCagmRmmf/60HNFDmpCY75rO7HV+5lQ3dnvCnUrjIrJDTCod3WowY/mZIBBQoc+2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777525; c=relaxed/simple;
	bh=xHxWWQVPiX1xV2ngFVQTcENr5JBXW5gWgYQElXhF1D8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lxUGd1pvuh5YbhW3ARd5UYswvaOq9QCEfmDlTd/Q9f5xAfL4Q676p4LoUCc+hF9/QXc+KNV8+gxXfcu7CimaXQpktTbaMYR94ZHFvH+2SmLE15ExISseDrAWOMuw0X/3r1A7Ps0mjBOsGvWtAIYRIbSeJicW0WKBVaSy5gxbMCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=fP3GmIiB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bhpMb4fE; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="fP3GmIiB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bhpMb4fE"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 50048EC0198;
	Fri, 18 Sep 2026 20:25:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 18 Sep 2026 20:25:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789777521; x=
	1789863921; bh=woAtTKSUrAOJywezkPjP/PLaIChkiihi6VKhVfSPERI=; b=f
	P3GmIiBK6HZ5fGIcXGDIUODVSOcL3LT8XoaXdTMNuubaa/Qjxlum0+xGM0OBxsSi
	6jBfVNsTabaUnVA3uDuZAwm7nZh168ozs3/hM/lQe64SogUKSeWsEqE9Ds4XdcQu
	X+iIRvRdiidDvM/029MXNvpgBihgvuJT7Cy6KlCymZ+TPQggaPBkYsso5h72KEZP
	Dpb/NMgYdfkPHFwYTwBBGK4T8kZiZR38LSEKKapXFxeQuTQwegCzeSIVk+AjyA8v
	OJ7Jv1i+BHDcgegmQeom/1EUWZCTs+fZxUhRgfzko/Tz9zhusEap/mwGsSq8TJLR
	egJaZyUZqRm8i3otAidPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789777521; x=1789863921; bh=w
	oAtTKSUrAOJywezkPjP/PLaIChkiihi6VKhVfSPERI=; b=bhpMb4fEi+7Sz9LZv
	A39GMVPwJcBjPP4KIjaqnyhb+Mw81Xzt3EcZ/kGZKzJH4cgJLfrt4uMyjd4F/tF4
	oh/u+IUIxWvXZ6i6gbtAgrUAMlcGECDs0wPlEqNE39OS52lrI7qCJPDU8PcYGBLw
	cUmJ9VwdKTVNUYfWy7T/SI26ZBNnnLmGfxLYn0TDWVbDdVthuds5yA9bdgEFqUa/
	f7Xz89aX7bFwMYjqd1EDofwI+eRi1kpFAOpIUHJyXItwbVF81Sk98IvsyjMnCWEs
	HYpL/QIZSvdSZjGzaeU3WmY4mU4ONFqL3eybrIhuKg05BvSszWiseuNtR9QFymts
	uN03w==
X-ME-Sender: <xms:cdataiVCUOpL6mZ7CM44hKh4N7UqJqzc08jeQ-lYDn6cJLkYkI5h7Q>
    <xme:cdatam8A-lnAxVdqQpkDZNz9o-G9-D_DBLr-_vhkw0d07yZ1lMXE6M1hJZk090QD9
    7O0NNZDQiwAT4waLAgq4u8kH9qKfD0AIrvPtVzYz4gCTXdaCPbM2p2q>
X-ME-Received: <xmr:cdataolB7r5mB7htWrnsaRBPHUNVwr3Pqta5a_fsX3JspznRAg52ZMFJ8q8>
X-ME-Proxy-Cause: dmFkZTFyC+XeKYnZ766rqTYe4SsoatN0doBd7ADemiperjFlmE10ggdkgYpZeWmNOU4aBc
    lm02WEvCO2QGG+A0SGXMzCjVWjDSVCQ5WJ/xmSMbLZJLqVjt5aEnrGd0hUbHPJ/ejcqjFa
    xrmYY/YNxh9EpvRrTjNMqslNp6oZ1XKAjj0b9YUD/U+Umt4HJhNRFStrIx7jR3Gf+CAD8k
    /TwEvtSve0+WgA7utVqBt9LeXDUSIUkf7dn/1M9JWIyORT8Kp2cNKrwYutOzK/Z35sBm5S
    qWNICJAq9yYROUOkEgx1cQSYtjkPP2DMZwKGXS3JxTiE+xMdBmJUepOSBHs3/DvnVTIMBw
    QQND7SieWtt/aXz5uKT9DiEHRhvYRwDLjNMrZi9QZALZ/12AZ3Zf4NPQaM79q8yJXhO5D4
    mgydrB4dpKv6oFpVFxvKxTxzuzkzF6JzHSfyfPOE/W2C8Ho6P08KlQEN5muATVcjHH/zY1
    fe7odX8BguwojpsMGHN4w0lhDpxTXbH+2bMpQs1mlkdAPd+xnvCJg/Sdle46ItJw+HmJ/A
    BoNbGTbzr371oySzuTVZvONAaXSjwrSB47KlvqxJxbd/6f6gASMpVlCZ11o/leCgCgUkpP
    A+2GeiX63HVUrzXdmDcz4kER+634TQWkynYMIc9RDoAJuY0Bif+jfDP05mUQ
X-ME-Proxy: <xmx:cdatahIv_YN-9HOcpG8EocjHHsiuItf0vVHzsh0cYkveTaA6jkqz4w>
    <xmx:cdatauqfgPU_t3vr_zrz4SMBP9VvLdHLxlv2n1ze0yVz94yRqJjHEg>
    <xmx:cdatauSxN7POkfoIlBSu3l8ufS86_XlV3OJ5nl7OZ2KIZMz-x6_f3g>
    <xmx:cdatah5Aq7KU4TofOTyTg4Y6m2ZKAZHPVL4xLzVp8LdHND2FbhCtZA>
    <xmx:cdatakM2SDSrCJcpy3wWGUF1WbJu2jf2nZ3e7wfXLO3Ppi1mMUvNjJLh>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 20:25:20 -0400 (EDT)
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
Subject: [PATCH v6 12/19] selftests/mm: parameterize the mixed-source collapse case by source order
Date: Sat, 19 Sep 2026 01:24:42 +0100
Message-ID: <20260919002451.496763-13-kirill@shutemov.name>
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

collapse_order_mixed_sources() faults its region as order-2 folios and
collapses them to the -c target.  Order 2 is below the contpte size on
every arm64 page size, so nothing in this suite collapses a contpte-mapped
source on purpose.

Let -s name the source order alongside -c.  The case then faults at that
order, keeping order 2 when -s is absent, and the source order has to be a
supported mTHP order below the target.  The other mTHP cases are
unaffected: mthp_push_target_order() enables only the target order.

A -c at or below -s is refused before any case runs: the sources would
already be the size being asked for.  Without the check the generic cases
fail on that one by one instead of saying why.

"-s 5 -c 7" on arm64/64K then collapses contpte-mapped sources into a
larger mTHP.

Assisted-by: LLM
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 51bda01446cd..9d1c47bd5013 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1354,11 +1354,13 @@ static void collapse_order_max_ptes_none(struct collapse_context *c,
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
@@ -1366,7 +1368,7 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
 	mthp_push_target_order();
 
 	settings = *thp_current_settings();
-	settings.hugepages[MIN_MTHP_ORDER].enabled = THP_ALWAYS;
+	settings.hugepages[source_order].enabled = THP_ALWAYS;
 	thp_push_settings(&settings);
 	p = ops->setup_area(1);
 	ops->fault(p, 0, hpage_pmd_size);
@@ -1376,10 +1378,9 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
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
@@ -1389,7 +1390,8 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
 
 	if (madvise(p, hpage_pmd_size, MADV_HUGEPAGE))
 		ksft_exit_fail_perror("madvise(MADV_HUGEPAGE)");
-	ksft_print_msg("Collapse region backed by smaller large folios...");
+	ksft_print_msg("Collapse region backed by order-%d sources...",
+		       source_order);
 	if (!khugepaged_full_pass(MTHP_PASS_TIMEOUT_S))
 		fail("Timeout");
 	else if (all_windows_at_order(p, hpage_pmd_size))
@@ -1420,6 +1422,7 @@ static void usage(void)
 	fprintf(stderr,	"\t\t-s: mTHP size, expressed as page order.\n");
 	fprintf(stderr,	"\t\t    Defaults to 0. Use this size for anon or shmem allocations.\n");
 	fprintf(stderr,	"\t\t-c: collapse order for mTHP collapse, expressed as page order.\n");
+	fprintf(stderr,	"\t\t    -s, if set, is the source order for the mixed-source case.\n");
 	exit(1);
 }
 
@@ -1575,6 +1578,9 @@ int main(int argc, char **argv)
 	    !(thp_supported_orders() & (1UL << collapse_order)))
 		ksft_exit_skip("Order %d is not a supported anon THP order\n",
 			       collapse_order);
+	if (mthp_khugepaged_context && collapse_order <= anon_order)
+		ksft_exit_skip("-c %d needs a source order below it, -s says %d\n",
+			       collapse_order, anon_order);
 
 	if (mthp_khugepaged_context) {
 		pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
-- 
2.54.0


Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A591F5437D0;
	Tue,  8 Sep 2026 12:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871880; cv=none; b=jD3673sErCQvO+c+jlDDNZvY1orUgo9oLv4NHnrkWiA5KYVlzq0N7x8nXGCqKFw2gL4RfLm+EKOhdYhwGIX1Y3vBbTKPOLEDRlskZLCNdlPGYZDan3POhyeJjq2Dz6LAxlsHdRWHNDtSFC+I1p9cZyiVAuY9bqq4OAJpI4wNfHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871880; c=relaxed/simple;
	bh=m87rit2xZVxyYYGGBfTwQIb+3uHuiUcFoaOr9xj5OFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F3pp7zkbubX//bDv2NvlClJBkXksDUcxhw0Q9tXvNoKZKxsg0QZB+3K3ULlltIEbyx/A56gP92sen+TySsyrlLf6FoRLELj0d9y3T8qfnBhp9DjISv86jlubiSrZwedmDxKYj/0+jKCP45bizfHlFPRJhpfPdU0sjyOZh2TLBmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=BC6RTcgv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MGv3A5vu; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="BC6RTcgv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MGv3A5vu"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id BB4C2EC010E;
	Tue,  8 Sep 2026 08:51:17 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Tue, 08 Sep 2026 08:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788871877; x=
	1788958277; bh=2hGlkwJH8rpVYNSw9dyCZihy+2pP4J7uKRwXxgbT84Y=; b=B
	C6RTcgvMZ+j0dLw/pV7afe7NzIFUram5k9kDBc2+D+gPWYmiYNXopP+2DxEgnUwz
	gmhL7JexHkSVLlTIvvAcfadHibeRFg9WvS+ryO6dGwybP5WKipfSr4Fqn2vXa98X
	wX7dxut8kVUfnu4y1iZ1Tw5zhQ2EdTph5SbKC1g0a3nFH5YUkKxCfxxaFTvD0i2I
	4HFnJZXtIdvyybWadFDE6CkwsjK51eWdHosLUjfOkq0YKNdAzL3AJvHx4+S9rW/2
	vG9NtMZm5D2NqwyLXrYuLObaLK2QWJ+6u8BPereNdrHQWy2p6KM8QcV2vg5WZMOp
	9XtHH38QyEyns8o/aSb7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788871877; x=1788958277; bh=2
	hGlkwJH8rpVYNSw9dyCZihy+2pP4J7uKRwXxgbT84Y=; b=MGv3A5vuwwT/kKvXV
	ryQ/URKE2Xq1OvDZwW5m6ZtNn6p1Hkx0Qh21kxJKPlYKDStgjdcsv/U/xZ0+PJcV
	UD3ToQAdesS4T1mrlF9n4IYvrfmcC/2qnOl2wPGosVfr7J9izvNHQGcesoDRNhAn
	69CeOjmSj7PhO+733sEIpCVyYp1O/EQitK7XDY8KX0z/Avsd/QMvGDW8w2EUKFU6
	fRpyLl6rBlwQUZb9htZaGVDMfrBmlzdjY+0MwrK+5UWqDORV3z9QG/XdseZNQNA6
	DMBHj+ZvyOoh16dPdfak4vHMFr8o4KsPhSd2e96aZDT6kbVwkK3JMo8ho63rg7p1
	IUgAQ==
X-ME-Sender: <xms:xQSgarVe8zCoZRLAVjd6i67gnnc_jPaoVhzw1tis775NIP6dxA311A>
    <xme:xQSgar-J1i2a11Qt9LeixGXaGdLUBHJZqus23_RYuoy1e6_RqiA-eLuhB9E-MJiHT
    5OyyLacB24uMEwiqvgATfmvaaFIuvmh6RGetrntp48vtrFS-ZNqWyl2>
X-ME-Received: <xmr:xQSgapmY8gx1aMdK9CL97173s60X9ivphiZ0poWXGjI424TGkW-crTIrEec>
X-ME-Proxy-Cause: dmFkZTFCT83ts3xpHDuUgDdlzQtELcoAknrXBpsFepmdcEBLccwduWOOVyAuau0VlYvm49
    objBvbnGefvuHsKXiB+MOl7qErn3M4/Q7Z72R+asBFni+WG6jRYqPjjJBv1F7ovmfnEZp3
    uEJcbLADGcdxsWcYxdWct2wwV9KQaoOTpGWM7Il7/oKOILrVOp7MvqHbWAXdA0mgRBniUZ
    2M+Su4Zoe9zFbzekNirjNltohahTSfzaLbYZTkGXD/hRQ+ajqkABo2HdEn2GJrc7g0w4Iu
    PhTUexE0AKZ4j2dsA7W9i19VnbZvZZgTTujH64lpg2nDW6KlKK63jDlRsrLETwVfJ8WCYT
    c+1thOoDewX31NDRvXFN4FzlTNJbNXxIxXZjZXhV04JGtGEMASGQE13zj3ov8UNJ4DV03c
    hgGHVSPpLeKSwMrclFT227P9uZgw/zASFm8T7kNC8oysJSwF7oz7DhskUil4s7vgqC0Ujg
    sbzjWvYrlaiDWtwWvVOPU4KY1M4TkgM2w/RNXl+09lrdc5Lm8OZVr28UpHrx4IPp2zJwYw
    2Z6Z7FSPOdzUAx59/gI6YMrK/Lw5o55EpppddSmm8GWtF8Sk9hdqmGAGS+v9WjvJH2+eLN
    SOezize9leW/aI5FS2JtPvjb54u8YUaB5Lf/aK4j4I3ZC08E9OcMVz/o8gRw
X-ME-Proxy: <xmx:xQSgauKgzsRJVCgZoYjxvoe_ofuwQfSW9p7ApsuZ03rKt4TMqL_z8g>
    <xmx:xQSganr1rgb9A6AuSyjtofSnrKWxPNSE1DcO6dbbGzWn2E6tCFTF0A>
    <xmx:xQSgajSAkWUonf1kYAFJBZBHi7BO39zLyMPtoJCiYH8J9F2UeNA4_g>
    <xmx:xQSgai74A-TeTaEHqm6Mz8iAgwBAM5o21wHE7JipeJKNP4oK9Rh-VA>
    <xmx:xQSgaoJ3rWE2efYo1GEW-RVOULv-AnV8HtcarO-f49ElWVHMthMMSR9_>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 08:51:16 -0400 (EDT)
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
Subject: [PATCH v5 03/19] selftests/mm: scale khugepaged's collapse wait with the PMD size
Date: Tue,  8 Sep 2026 13:50:49 +0100
Message-ID: <20260908125105.1510704-4-kirill@shutemov.name>
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

wait_for_scan() gives every case the same three seconds, whatever the huge
page costs to build.  collapse_full() asks for four of them: 8M at a 2M
PMD, but 2G at a 512M PMD -- arm64 with 64K base pages.  Three seconds is
thin at that size, and the case has reported a failure for a collapse that
was still going.

The timeout is a ceiling on a poll loop, not a sleep: the loop stops as
soon as ops->check_huge() sees the collapse, or as soon as full_scans has
advanced by two.  Raising it costs a passing case nothing.  Across 80 runs
of collapse_full() on arm64 with 64K pages the wait was half a second in
73 of them, with a tail to two seconds.

Keep three seconds as the floor and add a second per 128M collapsed.  A 2M
PMD is unchanged, so x86-64 is too; a 512M PMD gets 19 seconds.

On arm64 with 64K pages a passing ./khugepaged all:anon takes 49 seconds
under TCG before and after this change.

Assisted-by: LLM
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 1ca7c6978571..48e0040d53b4 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -556,8 +556,11 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
 		int nr_hpages, int collap_order, struct mem_ops *ops)
 {
 	unsigned long hpage_size = page_size << collap_order;
-	int full_scans;
-	int timeout = 6; /* 3 seconds */
+	unsigned long bytes = (unsigned long)nr_hpages * hpage_size;
+	int timeout, full_scans;
+
+	/* Half-second ticks: three seconds floor, plus a second per 128M */
+	timeout = 6 + 2 * (bytes / (128UL << 20));
 
 	/* Sanity check */
 	if (!ops->check_huge(p, len, 0, hpage_size))
-- 
2.54.0


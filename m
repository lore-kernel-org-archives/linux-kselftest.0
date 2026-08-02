Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BB72DA756;
	Sun,  2 Aug 2026 19:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785700386; cv=none; b=F/19rgXI0A5RM2X35l4O2rMhEWvizS/wyx1Z02x4naAHdGvdH0pM2R7tk5aZ1KbagRQcwbOkb8Wv9QCNAJVmaE/QFsJfZLQQ8OGuXqyqv5Teac9yJpgZHTHlJfrnt0qUCTgcayZdZNQ+PXwg2B036ArRfdMVOEshTB0HKhSilU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785700386; c=relaxed/simple;
	bh=s8rCSiw4i0iBbRZGsHg90LacKElEqMwPhLS0IdNjAk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKAik1A3jBIEl+0w7kRR3XZz1MA1NwlZD9graZ+HiiMU0ZrF6i+20j+D1MwQqUx4eofA1a6lE/85Gqxp6Vmhfh/BdSdvOsaLyR9+1Kb5yr0mOdZKDy4VIhopf5yVGTORZiiUJHFd/1Ha/qyX1TDcBbsP2/aUDvWw9P+MRDsEe/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=IzoNT2L3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Czd9oGqE; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="IzoNT2L3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Czd9oGqE"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 074461400051;
	Sun,  2 Aug 2026 15:53:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 02 Aug 2026 15:53:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785700384; x=
	1785786784; bh=1Yc9ml7CfBPQ/cIKQqowgz5k8tYCqly+NyaD0PaW07E=; b=I
	zoNT2L3/dKDrxX7QCfoolISbpCCpOFRTvHNf5Dnq+a8XqbxrCnYUxUddYdamsEZB
	e43GShQg/CJVZHtvALxDAOR+TvHgO/ZbjhNA+L9ljsf9UQ8hz2e+rbZ2v9Q40BCh
	sCfgSgrt5MQsN8IJF1iMV8Xc5hir5/o4Jixt23tf0J7ZC49LB4TiC/zU7JlZuqtk
	hEhn29ErswubY0ONplZ5nriMaH0aNyh3kW+wRhp5H0com66mpm3G4qV9DhLuLpfv
	cyq4cL9pfPwwL/iFVrDcymVigu6tNrTSEeBtlQj9vjB1DgJMTG/zxu/UU8CBF6Ci
	E9RWA8av7ULnOipUehZ+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785700384; x=1785786784; bh=1
	Yc9ml7CfBPQ/cIKQqowgz5k8tYCqly+NyaD0PaW07E=; b=Czd9oGqEKgRLHKRhY
	Vna28jK1EghLAPWLC3G12/xNNsCNKeyR87+5UnvovqJF8JNUuN7Awd3p3CnvwlKQ
	bhTLTVzBbZm8Yc1BrSUfGhj0uRkkbXd6n/EUQWTmorqm51A/6qLumfMzDytHMHlI
	QvpiaBEGKsyxCtYMowGDaCNX24PT7LRq1wmVOeq4uc+bVZQaLbLdVJJ6zq6Nt6Fv
	jXTiV7rKtZjxaRWg2eZ48na9IMTXA3/Pn9/LF8/xAhFdjiQvm1WT/Jhg5sMP+nPj
	zIaNthRXA5VmxngAXSAIImfmMkAGj3zWJl81sVyIWs/ytgGfFT3Hb4RiQSXoQ0GH
	E1+gA==
X-ME-Sender: <xms:H6BvamCPiZKsDaHwMfQIjqmMyi6bOov_DlOwmAbYlIFengiOt0pUhA>
    <xme:H6BvarDznRJmAFDXLfDZYKVPCAa4WEEzHtw99J8Zv8QaoPH9FfWGC7pKI_z-rpKX2
    gmzEiwy0mbYoUvDzrZ4mrWTUEzwEDzOQUgDRjp9HewKnF6ZWd-o9_uI>
X-ME-Received: <xmr:H6Bvamh_lmJrK-fXu80ILQJUeWwtvu1SIpcE923N0HrAK_a6rZsWe4AfnLk>
X-ME-Proxy-Cause: dmFkZTFcbv35QwNbwWPHQBcJdrWasH4YRFOBaNWig98oa0GgLD3LmQrthvyDgK5JnDhp96
    dBkNywOXlTP9Hby+cm0vRQHofuB4BhsdtVcBrMer/A2AOpegfr9Hr7RYzI6OqquxWhxeXC
    aB5bOw4cR5G6EDzO4v2r94SJnXRDYvi2NMwyCB/quID+suEuw0TjLUMYjjQ5pFm1F3OqpQ
    Ctej7rOharBpUeBz9hjZojzUlseCYYYMV+BulSa6+jD3O5m4ZOeULsSyQlLb9bciCyrhiP
    bT+z0cGYr8PFizBGTpPnPZCe+jZkx/DQlEsoaoSV2SjHlZpE6q2+n/t1AcZaLqu1qPGmAT
    BkOOyujnxS1vXWxSunZU9KLceiCDM3h+HuZoPbLVK1NwQpUH6QHf7AUk1ebU1xyA5YckA7
    gGQaE+poT7LDMsG+DAUtWkyoo4wwOimaqksPNvRtr/stXgEBnc7k4T0H7+F7Z64oIo0miP
    9ztnIsPDlPqaDKCmUlYCmPvjgBg7XqIQpAWwO4dBOh3ys3GhMlcGlUno4TCvPOgEY7nDV3
    YPirq6COLeiKL8FRcQrXzd3H095Q0sqWpKpY1afRicX7v6byx8vIArye4rkTK9GrfmQkxI
    RUCJx3S4l5xFQSIACt7scyxVovTD85vAtUxRClk36P4wyNgzln3DOcrAgjNQ
X-ME-Proxy: <xmx:H6Bvand22O8NVYbzVDntV8NozIQfBN6fsuU5x1ruxQp-G32IJ-wuTA>
    <xmx:H6BvajieC9abqYic6kwz0s_GzH42VchdMTpE-Jl5qN7iq-pA_nKeaQ>
    <xmx:H6BvatME8RTDx9ESqX_Iw9oGcecsZE3w72Lh77UdGZHRcI7v2Irkjg>
    <xmx:H6BvankYMNmUC7RtolJ5cTfu3BU3cfQG2SHsZ2PV50T9Hd4Im2wBgQ>
    <xmx:IKBval9N5EGVqugCGbuPuULAUSabiTUgYeZPyJBH9dLNlUhM43Ec9wW7>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 15:53:02 -0400 (EDT)
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
Subject: [PATCH 02/16] selftests/mm: add folio-order check for VA ranges
Date: Sun,  2 Aug 2026 20:52:34 +0100
Message-ID: <20260802195254.1937477-3-kirill@shutemov.name>
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

is_backed_by_folio() answers "what order folio backs this page", but
mTHP collapse tests need the range-level question: is every
order-aligned window of this VA range backed by one folio of exactly
that order, mapped head-to-tail?

Add is_range_backed_by_folio_orders(): per window, require a present
and naturally aligned head PFN, a contiguous PFN run across the
window, and is_backed_by_folio() agreeing on the order. A window
assembled from pieces of different folios, or mapping a folio outside
its natural position, fails the check.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/vm_util.c | 46 ++++++++++++++++++++++++++++
 tools/testing/selftests/mm/vm_util.h |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 343a15e25a9f..793342095420 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -365,6 +365,52 @@ bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
 	return false;
 }
 
+/*
+ * Check whether the range [start, start + len) is backed by folios of
+ * exactly @order, mapped at their natural alignment.
+ *
+ * is_backed_by_folio() classifies the folio backing one page; here we
+ * additionally require that each order-aligned window of the range maps
+ * one such folio head-to-tail: the VA range must be naturally aligned,
+ * each window's PFN run must be contiguous, and the first PFN must be
+ * the (naturally aligned) folio head.
+ *
+ * This is the check "did this range collapse into order-@order folios":
+ * a window assembled from parts of several folios, or mapping a folio
+ * shifted from its natural position, fails.
+ */
+bool is_range_backed_by_folio_orders(char *start, size_t len, int order,
+				     int pagemap_fd, int kpageflags_fd)
+{
+	const unsigned long nr_pages = 1UL << order;
+	const size_t window = nr_pages * psize();
+	char *vaddr;
+
+	if ((uintptr_t)start % window || len % window)
+		return false;
+
+	for (vaddr = start; vaddr < start + len; vaddr += window) {
+		unsigned long pfn = pagemap_get_pfn(pagemap_fd, vaddr);
+		unsigned long i;
+
+		/* Not present, or not mapping the folio head. */
+		if (pfn == -1UL || pfn % nr_pages)
+			return false;
+
+		for (i = 1; i < nr_pages; i++) {
+			if (pagemap_get_pfn(pagemap_fd, vaddr + i * psize()) !=
+			    pfn + i)
+				return false;
+		}
+
+		if (!is_backed_by_folio(vaddr, order, pagemap_fd,
+					kpageflags_fd))
+			return false;
+	}
+
+	return true;
+}
+
 /* If `ioctls' non-NULL, the allowed ioctls will be returned into the var */
 int uffd_register_with_ioctls(int uffd, void *addr, uint64_t len,
 			      bool miss, bool wp, bool minor, uint64_t *ioctls)
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 5eb90e0d1d13..76e9938a908e 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -97,6 +97,8 @@ int64_t allocate_transhuge(void *ptr, int pagemap_fd);
 int pageflags_get(unsigned long pfn, int kpageflags_fd, uint64_t *flags);
 bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
 			int kpageflags_fd);
+bool is_range_backed_by_folio_orders(char *start, size_t len, int order,
+				     int pagemap_fd, int kpageflags_fd);
 
 int uffd_register(int uffd, void *addr, uint64_t len,
 		  bool miss, bool wp, bool minor);
-- 
2.54.0


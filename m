Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7126D34C815;
	Sat, 15 Aug 2026 01:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786759167; cv=none; b=TZHTvHg2pdiop6RLzKh9tTrJFSdxh5nBr39lBLKfN867vZA4RiI+Yqnx3cOn7w5824VHF1/nCNue/k7RStHshvIAHSJX5trcXD7SpTjt9K2GkqajvWV+kjWWdzdmAsv8Ou2+fMU+KNyg5gyJOAgeTIE9ZFZJWWtuYAozUDIJO8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786759167; c=relaxed/simple;
	bh=m5zGJkZM/CUqaRGMqJcW7Lths1PS2gsh5NzoaGJme4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KuUtDcWsIxtRU9BmIIR0XXUbhLF3dEJV8HqSyXoXHZXl1/gealaCoNHu4Ne/pEqhTqgtpivczBVe10M6TD8WLgmsohd6O6GVXzb3N9NmNhPhjNzlt+BfYrVq7tJN3zlwHOwzvGyCDmAN+Bw2W7VhXttj6gczhttXIwYP0E0dc94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=s5oC2QIz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a2z10bm5; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="s5oC2QIz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a2z10bm5"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 01CF1EC022E;
	Fri, 14 Aug 2026 21:59:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 14 Aug 2026 21:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786759162; x=
	1786845562; bh=3BluNDLCZhWfJh2T22U9KUR4xuqo32ndiTxV1AaNaIU=; b=s
	5oC2QIzgW1HHEplcurKvHDjlWHAlUd6YZD2TjDoHobEFka0+vVyYjFAf2VBePPcE
	LXsOxgFGJ421hTgcFCISjyzgJYU4VMKG6C0PGWeizZj3bpJ+nAcTVXqQljRZbr7i
	aJDsgLUMkIFVnnjgneyfUbGAbDBBpGwjmU1xiwLLbf1JOQUMIklLQT5vbHwXOyzn
	IK3cWHI0tJC9EYagt0INL1epWpclZCY2z6LccMWY7OPxicvB1DyurqqphVGxHRex
	wUKaFAghicwjbymzSL1TFUylF4bvLQKgJ8d6tf8O8cE2sSwIJho8rD/B/nO3/Ohi
	BcpArZpYAuzpcZz9l7K1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786759162; x=1786845562; bh=3
	BluNDLCZhWfJh2T22U9KUR4xuqo32ndiTxV1AaNaIU=; b=a2z10bm5YOWcOXb4s
	dd61rq5lq1mP35OFj/TUe9CmxkmYsLqbcisjbnmVImeks10TRr1zsnsZTBWZW38b
	5TjSOKsczJCkvFp2aCzl3kUoSe0acFihBbTYXDT1GM1yTT4gDjX5KzvqnoaUX+yN
	xOI7ZGYEz37iwaUvGWWTVcgUDsK+zbAOXijNsdxV/Q7WJduUexodyyHSnaYVof02
	cLPdEFoX4MRw3ZUVDWUd5IJawdQu4yQ02CI7dyrBorbXqDo/B7mDoeP3KPrlnUyO
	SZi13+PWti/tNL05Jfncqth0pJ8ikpXUZc/dsrwOL8MYmvrt6lt1gvzz7VrWXDL+
	XY1PA==
X-ME-Sender: <xms:-sd_al9pzt9u2WDn3sUpwYOZscvTDS_GRyEMVOR5IukDa9_je_X6tA>
    <xme:-sd_atp-TBH0rgdQ-nxcbJdFlLY7jKejmvRujiKaGBKFVqJH85i0ToyEDy5n7US2r
    GNz1HFHjx1OunRucDirf7ONncZuZAbW-ezuDHrDwHrvXVWJMsp77Q>
X-ME-Received: <xmr:-sd_argeP12mBsLerqgVpVtyP42ZmX9Rg0IS7ap9sTN1xVWP95TwG4ZuGBg>
X-ME-Proxy-Cause: dmFkZTEYpEQiBdLKlCaLp317TOYqYwO99jnuX4YrBujo3RuW+IIGXdYj4qE1ezcGRvbtOZ
    hc7RfnfkdlTehb5Dkvk4VZTcyRAqm2CcEjaldkIQshIttrB2HSeWyAKQfsR+ykmymFv8qO
    aC/+wh3joJiQccaWn5NjVrqLVVMYdoVO37A5ZL6SnR75seJlCquk1NTOiA0EvXHIVSJ25Q
    iFONSccd/wEzNfQZlOvvQQf5bCKiGIALXd0Rd37Vcnrh56q8DfWwmvEu2ZgBGSMa525iaP
    HkMF5MKO3LDiNiHXJVHjo5f/L4XJttiAOfdXhljkaHgZI649okv5M81/eeF8HfhCZr1UAm
    rgJ76CjNAg/U/EKabJ+37G6BvMM6OBu2S56U3YWsJffoiZIE7o7yRmzI1OaELgILaiNqOo
    1Uq53GRRyG0wmSwHCaXQhUmxPHpjgx3LBvDZvJI2g8hLT3dlzx/tzjmukS8sdOlYlQxFrf
    pF33J8KwidLs+W9kyG792FlRJ9R+6AJij5y8/PXNhargdOkNqPDsBM/c5bDG3fYqAw/ov9
    v6QBN4oqUXjbKiyjShwtcAMIWpXKpukDz46zSH5kDTrXYEI9fAj5YLBZW2zQ19ZOhLXATj
    WaTc5JbID9LNOP/VpoCk3VliNaVr5JQe7/9AwoupdqfOs0kCJnidsvyZ21hA
X-ME-Proxy: <xmx:-sd_ajB19bySXyk7mrqj2Tj4QatB9BwGWFT09NX5TW8RXG0M6J6zNg>
    <xmx:-sd_ahtY1HLopn72acFat2cyo5oU-vIhQUM6b5YoqestzOOsCJ7vyQ>
    <xmx:-sd_al7Xvk1bOj7o23j_6KWwEZ5rHUu37w3XvcgfzOR3-9ChaNyoZA>
    <xmx:-sd_ajdNWe7FHu46nn7j15ZwxQ7tFXknMoWBzhTYb60YLkjGXDzzJw>
    <xmx:-sd_aqctT2RgUxzVDtaH4o0grigTnbpyPCJIeZT0Ugp_9HI_xqhN3lax>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 21:59:22 -0400 (EDT)
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
Subject: [PATCH v4 08/19] selftests/mm: add folio-order check for address ranges
Date: Sat, 15 Aug 2026 02:58:50 +0100
Message-ID: <20260815015901.1236937-9-kirill@shutemov.name>
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

An mTHP collapse test needs to know that a range is backed by folios of the
target order, and that they sit where a collapse would put them.  Nothing
answers that today: is_backed_by_folio() classifies the folio behind a
single page, and check_huge_anon() reads smaps AnonHugePages, which only
accounts PMD mappings.

Add is_range_backed_by_folio_orders().  For every order-aligned window of
the range it requires a present head PFN at its natural alignment and a
contiguous PFN run across the window.

A window backed by two smaller folios fails the contiguity check, and a
folio mapped off the window's alignment fails the head check.  The mTHP
cases need both to tell a collapsed window from the one beside it.

Assisted-by: Claude-Code:claude-opus-5
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/vm_util.c | 42 ++++++++++++++++++++++++++++
 tools/testing/selftests/mm/vm_util.h |  2 ++
 2 files changed, 44 insertions(+)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 5db1a7774f49..c9bd6c92fa41 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -556,6 +556,48 @@ bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
 	return false;
 }
 
+/*
+ * Check whether every order-@order window of [start, len) maps exactly one
+ * folio of that order, head to tail.  The address range must be naturally
+ * aligned, each window's PFN run must be contiguous, and a window's first
+ * PFN must be the folio head.
+ *
+ * This is the check "did this range collapse into order-@order folios": a
+ * window assembled from parts of several folios, or mapping a folio shifted
+ * from its natural position, fails.
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
index 56a28ce7d029..39dfb18dc10c 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -99,6 +99,8 @@ int gather_folio_orders(char *vaddr_start, size_t len,
 		int pagemap_fd, int kpageflags_fd, int orders[], int nr_orders);
 bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
 			int kpageflags_fd);
+bool is_range_backed_by_folio_orders(char *start, size_t len, int order,
+				     int pagemap_fd, int kpageflags_fd);
 
 int uffd_register(int uffd, void *addr, uint64_t len,
 		  bool miss, bool wp, bool minor);
-- 
2.54.0


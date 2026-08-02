Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D897A33937D;
	Sun,  2 Aug 2026 19:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785700384; cv=none; b=Y+t5xtcLRafELSA4Wx3CadqDOFUemu8TPbzccXU61mcdZ6JX0vt4NYmXZ1tZitcdhaNDpZ/daRPf+I7hrhbSg91jNRvpPXSUJmoj8RGsdDEBV/SVlTeUnHx2Q8GDUHHTFOKFl/C5/FCAag/pf3I5Qrf5BhioRzSApQmaCh2Vqu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785700384; c=relaxed/simple;
	bh=jlKjh7p6aPDqsyYVa1Q4E86BvV3zX9tl4A+ivSVKS20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lO6/Povw/y4yQ1+JUoXEh7CLyXxiU/IqciSONrSsx1/3r3LUtFL1V+rzh47lW+naHTikepIfdduPIlVx5G6cdYS2+snz8lxBMOPeKETqRmHk4aNkmI792A0iYF2GCsOEzPwbtwJL2vdSIHce1jVkPQ7Lx/0Qxo2asEcHovNGhAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=rGgZefwT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lGsyB/5G; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="rGgZefwT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lGsyB/5G"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F34C91400056;
	Sun,  2 Aug 2026 15:53:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sun, 02 Aug 2026 15:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785700381; x=
	1785786781; bh=exSxa18tvSalYuxDaP6ddzC4ErD/EJHfkXborP8h5XM=; b=r
	GgZefwTFg1VWLseoCMtP+k8C6/cIK1kf+cfzTrNvw3bskA4eoxwjknIHcJXPE5pG
	K2mf4ZVHcNoYukzxFBMjirQ/AT2GS3FZ29ScAzb7alsyJuVaoA1nTVV5eyJbtD+y
	3JjbPRYZkhPltuAdA3XlRad/HzNxWoZuHrF1khpD0/2bn03WOwiFj/BJBlB6SbeP
	XxoywY52t7Q6OdQHteMLlYKViJ8P54rcSh6UdtEJoQWBb0onBCDPH6bLUXxK+kMG
	JL2oYpYiV/D3yelGm8G62Sx6pN8LCcUwMD2uoHFnrxvaoyh19zSFem55Hjg9uECE
	5Hilbux+0Wz2FCZlRqjKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785700381; x=1785786781; bh=e
	xSxa18tvSalYuxDaP6ddzC4ErD/EJHfkXborP8h5XM=; b=lGsyB/5GX4Uy7xpSd
	WbHVbtTRX1nEuCxfzEOovNVjft8Cf3qN1n5cXWQ2qgSb8OdoOBI5IKR1YF8vt8ec
	YLHFx6smUguS+xLrtx1OcByGVDBuhGV1iPhmWnmUX9e7tpgrIsuSXTNUJlYc/dGK
	JzCmjH1QY/ovdbLUoZM334AcF06RDpByUm8T+Wtwcr9rx2VSfFqZQL6IuW4z0j81
	BPt9c6ZRUq7+jw4iOLrpZByZVWyRj/s54mEe0tIjUiHDkso0hteht302MIiEOvHh
	oEECoo2Pp587vYY0nMZi+KRS5CHAAoZqQiQLT+mI+I/KIihH7MnDc5/NAgy12JbC
	Y9tEg==
X-ME-Sender: <xms:HaBvatJXvAaq5pXv7sGZDuRkvpmSUjBf9-AlSepvIU-oCrVNBtl7uw>
    <xme:HaBvajq4a9FeY4ch927Kzpj4i-MPZQ4XPvPX69PMXGavT2vMxF9Hqwc8C8w9SRAez
    9YyqUgLf-qy2_r5c1HNwCw_cIK7WrH_uugayqh0NdSGzkkfAQpEFTGR>
X-ME-Received: <xmr:HaBvaioq_1nb06NZyoyOgKgzEF-dlwoICBHtUNFRRe7ixgfWWoWu0ux0hTE>
X-ME-Proxy-Cause: dmFkZTFcbv35QwNbwWPHQBcJdrWasH4YRFOBaNWig98oa0GgLD3LmQrthvyDgK5JnDhp96
    dBkNywOXlTP9Hby+cm0vRQHofuB4BhsdtVcBrMer/A2AOpegfr9Hr7RYzI6OqquxWhxeXC
    aB5bOw4cR5G6EDzO4v2r94SJnXRDYvi2NMwyCB/quID+suEuw0TjLUMYjjQ5pFm1F3OqpQ
    Ctej7rOharBpUeBz9hjZojzUlseCYYYMV+BulSa6+jD3O5m4ZOeULsSyQlLb9bciCyrhiP
    bT+z0cGYr8PFizBGTpPnPZCe+jZkx/DQlEsoaoSV2SjHlZpE6q2+n/t1AcZaLqu1qPGmNP
    WeW4sbaB+hDCdok+K551BijkIgMPto0pUlo2Qa25tWIIjzZ5oFhMdk64zmrXWt9mXklEb5
    kBG0XwjD99DtjoNRzDR/al+grOyrijltYB81RXtFyTi0Np5b/jcsHiGX0hP7wdkGelJZxM
    Us6Hnt+HK0e2facSWJMwzWMP3xu5Wl2WycLB/zP5Cr/nnWTkwwe6t0QWWxgIrnun83mayr
    sZgZ5XJD2niKDfEyqdMgUTgZS3RYPdauXRnwE8nsv1da2Wpr0VhZqSABZu9Deg4hGtekJT
    lF5aoyrN0Od7cgpjWEu0aDxBg/Xs2ii+sxGqemprvzvvV4bk3BVdZrzW06zA
X-ME-Proxy: <xmx:HaBvahF3q_dRpnBMlrZuZGEFlz0G8Xz0i3fN9g5qwujoAdSwuPa-Cg>
    <xmx:HaBvaso7ZdcKzmlM_qOAjKyEpN94DPzYeGO8pqCyoV2Ablw6QelgvA>
    <xmx:HaBvav1HQgqNOZbv_LRZ25qmGGz8tuPUMll2Nh7MQ1uKrh02MxaQRg>
    <xmx:HaBvaltt2aXKEDkayayVUhuzsgEZhoofM43qBgMupD-JaOmxhK2-Qw>
    <xmx:HaBvajyIkGcInjdm5sdtubS77WCfol00GpNgeKl8sV7-GoQDjURbYKkN>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 15:53:00 -0400 (EDT)
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
Subject: [PATCH 01/16] selftests/mm: move is_backed_by_folio() into vm_util
Date: Sun,  2 Aug 2026 20:52:33 +0100
Message-ID: <20260802195254.1937477-2-kirill@shutemov.name>
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

The khugepaged selftest is about to gain mTHP collapse coverage, which
needs to verify that a VA range is backed by a folio of a given order.
split_huge_page_test.c already has the building block for that:
is_backed_by_folio() classifies the folio backing a page via
/proc/kpageflags compound head/tail flags.

Move it into vm_util so other tests can use it. No functional change.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 .../selftests/mm/split_huge_page_test.c       | 62 -------------------
 tools/testing/selftests/mm/vm_util.c          | 62 +++++++++++++++++++
 tools/testing/selftests/mm/vm_util.h          |  2 +
 3 files changed, 64 insertions(+), 62 deletions(-)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index 32b991472f74..9b3885bd001b 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -42,68 +42,6 @@ const char *kpageflags_proc = "/proc/kpageflags";
 int pagemap_fd;
 int kpageflags_fd;
 
-static bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
-		int kpageflags_fd)
-{
-	const uint64_t folio_head_flags = KPF_THP | KPF_COMPOUND_HEAD;
-	const uint64_t folio_tail_flags = KPF_THP | KPF_COMPOUND_TAIL;
-	const unsigned long nr_pages = 1UL << order;
-	unsigned long pfn_head;
-	uint64_t pfn_flags;
-	unsigned long pfn;
-	unsigned long i;
-
-	pfn = pagemap_get_pfn(pagemap_fd, vaddr);
-
-	/* non present page */
-	if (pfn == -1UL)
-		return false;
-
-	if (pageflags_get(pfn, kpageflags_fd, &pfn_flags))
-		goto fail;
-
-	/* check for order-0 pages */
-	if (!order) {
-		if (pfn_flags & (folio_head_flags | folio_tail_flags))
-			return false;
-		return true;
-	}
-
-	/* non THP folio */
-	if (!(pfn_flags & KPF_THP))
-		return false;
-
-	pfn_head = pfn & ~(nr_pages - 1);
-
-	if (pageflags_get(pfn_head, kpageflags_fd, &pfn_flags))
-		goto fail;
-
-	/* head PFN has no compound_head flag set */
-	if ((pfn_flags & folio_head_flags) != folio_head_flags)
-		return false;
-
-	/* check all tail PFN flags */
-	for (i = 1; i < nr_pages; i++) {
-		if (pageflags_get(pfn_head + i, kpageflags_fd, &pfn_flags))
-			goto fail;
-		if ((pfn_flags & folio_tail_flags) != folio_tail_flags)
-			return false;
-	}
-
-	/*
-	 * check the PFN after this folio, but if its flags cannot be obtained,
-	 * assume this folio has the expected order
-	 */
-	if (pageflags_get(pfn_head + nr_pages, kpageflags_fd, &pfn_flags))
-		return true;
-
-	/* If we find another tail page, then the folio is larger. */
-	return (pfn_flags & folio_tail_flags) != folio_tail_flags;
-fail:
-	ksft_exit_fail_msg("Failed to get folio info\n");
-	return false;
-}
-
 static int vaddr_pageflags_get(char *vaddr, int pagemap_fd, int kpageflags_fd,
 		uint64_t *flags)
 {
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index ef1ea11981a7..343a15e25a9f 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -303,6 +303,68 @@ int pageflags_get(unsigned long pfn, int kpageflags_fd, uint64_t *flags)
 	return 0;
 }
 
+bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
+			int kpageflags_fd)
+{
+	const uint64_t folio_head_flags = KPF_THP | KPF_COMPOUND_HEAD;
+	const uint64_t folio_tail_flags = KPF_THP | KPF_COMPOUND_TAIL;
+	const unsigned long nr_pages = 1UL << order;
+	unsigned long pfn_head;
+	uint64_t pfn_flags;
+	unsigned long pfn;
+	unsigned long i;
+
+	pfn = pagemap_get_pfn(pagemap_fd, vaddr);
+
+	/* non present page */
+	if (pfn == -1UL)
+		return false;
+
+	if (pageflags_get(pfn, kpageflags_fd, &pfn_flags))
+		goto fail;
+
+	/* check for order-0 pages */
+	if (!order) {
+		if (pfn_flags & (folio_head_flags | folio_tail_flags))
+			return false;
+		return true;
+	}
+
+	/* non THP folio */
+	if (!(pfn_flags & KPF_THP))
+		return false;
+
+	pfn_head = pfn & ~(nr_pages - 1);
+
+	if (pageflags_get(pfn_head, kpageflags_fd, &pfn_flags))
+		goto fail;
+
+	/* head PFN has no compound_head flag set */
+	if ((pfn_flags & folio_head_flags) != folio_head_flags)
+		return false;
+
+	/* check all tail PFN flags */
+	for (i = 1; i < nr_pages; i++) {
+		if (pageflags_get(pfn_head + i, kpageflags_fd, &pfn_flags))
+			goto fail;
+		if ((pfn_flags & folio_tail_flags) != folio_tail_flags)
+			return false;
+	}
+
+	/*
+	 * check the PFN after this folio, but if its flags cannot be obtained,
+	 * assume this folio has the expected order
+	 */
+	if (pageflags_get(pfn_head + nr_pages, kpageflags_fd, &pfn_flags))
+		return true;
+
+	/* If we find another tail page, then the folio is larger. */
+	return (pfn_flags & folio_tail_flags) != folio_tail_flags;
+fail:
+	ksft_exit_fail_msg("Failed to get folio info\n");
+	return false;
+}
+
 /* If `ioctls' non-NULL, the allowed ioctls will be returned into the var */
 int uffd_register_with_ioctls(int uffd, void *addr, uint64_t len,
 			      bool miss, bool wp, bool minor, uint64_t *ioctls)
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 7799154b67ee..5eb90e0d1d13 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -95,6 +95,8 @@ bool check_huge_file(void *addr, int nr_hpages, uint64_t hpage_size);
 bool check_huge_shmem(void *addr, int nr_hpages, uint64_t hpage_size);
 int64_t allocate_transhuge(void *ptr, int pagemap_fd);
 int pageflags_get(unsigned long pfn, int kpageflags_fd, uint64_t *flags);
+bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
+			int kpageflags_fd);
 
 int uffd_register(int uffd, void *addr, uint64_t len,
 		  bool miss, bool wp, bool minor);
-- 
2.54.0


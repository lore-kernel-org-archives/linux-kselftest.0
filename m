Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC903453A30;
	Wed, 12 Aug 2026 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541007; cv=none; b=kspQu0AcfpHtCZWlQAhi5DekKQJWQ3wy233Mpeh5zwW9ReJqKFECtksKPThpmnXSik/0TaE+OTaob4t+qkT0Y/92LMTxrf/FHrkogv6yqUIc8sG8JTWzzJK5uXABAm39ZPRxzx2cOsIJczmgYprFuhKU0rZV+KpbBPZ6w4PiDCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541007; c=relaxed/simple;
	bh=W7ao8u1w7MSR5XGEvkcXkyP+JSEW5IKuVPy4aouKQ30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qVC3RynO/xZVDKrATsxknv3DzYuC4rxh6lxTj17zQuNt7bEyGVIWlB/DP7nZt/pM6GYPZb6YaYl+A7o1J4sDY2fg+3ajBBi5/mVJ7QuCmvEYsDQVQ2FGh3XadySlNrTrErctQF+EFFqJZ9Ekrp/hAWT238t6P3IHN7DlCdwVQ9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=w2m+TTze; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=URahXN19; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="w2m+TTze";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="URahXN19"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 802567A010C;
	Wed, 12 Aug 2026 09:23:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 12 Aug 2026 09:23:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786541004; x=
	1786627404; bh=efnlWGTfHMI6UMevBb/oPcFQfcqOFRMF5YmaGx8srVo=; b=w
	2m+TTzekYG1h2SgpHz+DmFwZv8QAutAiRxEHITxyhsnhwvJcV0ffY2o81i38szb2
	f12Dvx4R9vZXnO68cJo8Bh6fxtb9HY7CycYIdJOLVsFu2sTyPidiEq71XxqyhoSa
	V0PwymnO1QnfLn35SkvmzLGdm8wVxVuhGJXsYrmgPicrkIPyMu8NUcs47s9L9H/H
	EA9IBHprvsdhO1B0pd+QnPhQTi4+lljOGc/rbvMBqWjwmz8z+iYMd/iIFzDj/Gcn
	xtrIxivXSj6l5dkzO2C9qYd784fpvjqC/GqBy0Np+1tCMPcmXZocSg5lrhG+BnxX
	fwt88UmdnJZLrA04OH3fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786541004; x=1786627404; bh=e
	fnlWGTfHMI6UMevBb/oPcFQfcqOFRMF5YmaGx8srVo=; b=URahXN19dcwX7z748
	0lGwTQVtoA+CYQz3cpK7WFrOHv/ag9pN6XtY9hA5Vf0yFXdYu3VR/CvBXWtXzCs1
	zR1ieziL7KNn0nczoD8HQVuhUalYGO+Qsvy9roJ/GQhAuulrJ9GKeu8yKR5pHTeI
	XS7t7xJCzJhSABVyZzftZeBQDcxbNi7Y6xmzWFfkeWCEMLdw3OdOCQDgfGwVHyrn
	MGX7R9Z8a957xt1MAFyNz0WwWzNi0rs64+gudhyohRcQaAiAgfZwAkyrr+zqi2vS
	1B0VMcA9dgtcmEX2/UNlDDubD7MQKgDF1wBAguyVknpaToHupi/MKicwAr9W1SMB
	as7nw==
X-ME-Sender: <xms:zHN8alvdfRpj0CZnGWY1AEcKYjqQ1v7haP5jSVvuaryRZgRlhTjtNQ>
    <xme:zHN8aiZJhSQf4cDUv5Ov6aGSLGZBmKyKKgd1Y9dkSFl7l01JkflZFiMf3HcHf5LHU
    Wj0ntsswMO4m0KSc4WDxNesJTqZEuUnmE4vWE_uyDwVUGmpUCbztaA>
X-ME-Received: <xmr:zHN8ahSJPfhm_GzijgbzexK_0K92o4QI5Yb4EuBXg4uSm7DYJWb1mufbITg>
X-ME-Proxy-Cause: dmFkZTEWZPjKBYDoSh3uCuJ0ogiZvSuDj1RAgMuSmimalRft9LCPvZxyrluChLfTbkjo2r
    KkCK8Ttm4mqxi+W2/UjRoyI4gRuaMCGjIyoE2sYafZhhTXl0iIGCKEOr9/WVtZfHPc/pjz
    XsLpzK8U2Xu6F30SrJOujIlp1bmlomKUtpU/iiXSkRy6wwaI7NV8wAm1PQ0lHgRG0nCRKX
    WKIh8TtevEly/nhHwG2deu/klJhGkXN7h/CDYOOyqjOIkeF7MAFsC6fZtQDVeVkgzM4xU1
    Py5NrFUehZdXXi5LHUYxqNjNVNbuxWN2P2YJW6J2IL8s+zlVHHPN2YdKOlFVuMcbnWK9MZ
    cZzAisCav8t92G6y8EDE2O2NeImb6F3Kjul8xOVSg8SqONLZk/6PbrD52wNSqsb8obsWLR
    iTzUtunyCn4j5KEbFWlb891nKD/xanmWrCVMSvpCzuzJw9KBGCzmwmCvLBz3rjuKGU4szr
    tKrNL81C+NNfaaoVysR8XxTjI0QZ4FKoleflzByOKnCekcdRFTIUq6K5K3qyzNABWCkKDx
    WZQ8tJPYsIIFjU54wpPrYmGPFCHo+Zb8CW+gh6EY8aZUe6Vy9ca3raQLeiMaJHnsr/9F1d
    WIox07JLLn9J2mvuCq20B4HchKOFU0Z36EhhvHHORk2dGFo1TxmzMxwFBbeQ
X-ME-Proxy: <xmx:zHN8alxmpyNmcZ43Wmkbz0GEKL6Rn0tevAMCPqoVU1wAM5-V3OWfQg>
    <xmx:zHN8ateP1YcjmIVEZo2ZA0lWtYwN9bVBgEgc-5MgDn6nYwyaxhQj7g>
    <xmx:zHN8amp6psDx9n_MrDBrGQx0u-qPlZOCcFpy-lnyT0bPgIxrH1HLUg>
    <xmx:zHN8alOBhq4jh5YhXJkwlO2_fXWTq2JH1M7mfQHktkAIkrgl4HJhvQ>
    <xmx:zHN8amO58Bb-CrnWNZ5_bed0NNEPUfn3xlZW7qnI4BvATwTDFvbOjn3H>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 09:23:23 -0400 (EDT)
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
Subject: [PATCH v3 06/18] selftests/mm: move is_backed_by_folio() into vm_util
Date: Wed, 12 Aug 2026 14:22:52 +0100
Message-ID: <20260812132304.199287-7-kirill@shutemov.name>
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

The khugepaged selftest is about to gain mTHP collapse coverage, which
needs to check that an address range is backed by a folio of a given
order.  split_huge_page_test.c already has the building block:
is_backed_by_folio() reads the compound head and tail flags from
/proc/kpageflags to classify the folio behind a page.

Move it into vm_util so other tests can use it.  No functional change.

Assisted-by: Claude-Code:claude-opus-5
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 .../selftests/mm/split_huge_page_test.c       | 62 -------------------
 tools/testing/selftests/mm/vm_util.c          | 62 +++++++++++++++++++
 tools/testing/selftests/mm/vm_util.h          |  2 +
 3 files changed, 64 insertions(+), 62 deletions(-)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index 86a603692826..0adfe7dde7e5 100644
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
 static int check_after_split_folio_orders(char *vaddr_start, size_t len,
 		int pagemap_fd, int kpageflags_fd, int orders[], int nr_orders)
 {
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 80bc9f597b52..5db1a7774f49 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -494,6 +494,68 @@ int pageflags_get(unsigned long pfn, int kpageflags_fd, uint64_t *flags)
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
index 9a49af88702e..56a28ce7d029 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -97,6 +97,8 @@ int64_t allocate_transhuge(void *ptr, int pagemap_fd);
 int pageflags_get(unsigned long pfn, int kpageflags_fd, uint64_t *flags);
 int gather_folio_orders(char *vaddr_start, size_t len,
 		int pagemap_fd, int kpageflags_fd, int orders[], int nr_orders);
+bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
+			int kpageflags_fd);
 
 int uffd_register(int uffd, void *addr, uint64_t len,
 		  bool miss, bool wp, bool minor);
-- 
2.54.0


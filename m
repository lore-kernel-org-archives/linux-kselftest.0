Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B90347126A;
	Fri,  7 Aug 2026 11:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102630; cv=none; b=hj9U8sy+lYgLORinoZhPlVJWgV+0xHWqhIFBOQbDbmGulCawqaQugEofMxKrskNf00vbO5V9gVtDIBV6kK+RAc5mfflFg945A0qM292A3jc3nVPkJDnJROGHSy8wCUoMWBcOVywAa9/lSSzAk3T0iLOEYRSe4uBeTV5m9M98vsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102630; c=relaxed/simple;
	bh=EtVHDvfcfzGDmNjthWwAJslh8TM8zxxJJqnURhgKwRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8N+tUKh3mkm0WZKrn8c0TvqD32Vj47acCsLqNBixDrdIDGWmx0B3jXGRp5Pr90fjIQS0QqZBT3LR0/yyhKB+gV5dq2nrVvX7myV86WjLZ6HaaRm9T2iv+BXumDOEO2qfRQQ8s8t/0lLvQTM8BEEtQnjFhGIkemXrqK7ifpr63k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=m2UMoDij; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DITeJelQ; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="m2UMoDij";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DITeJelQ"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 2DF841D00082;
	Fri,  7 Aug 2026 07:37:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 07 Aug 2026 07:37:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786102624; x=
	1786189024; bh=A0HHfxeX5RuaRDWyznuRMDrKtp+1CgdzuTwwJX2D5b0=; b=m
	2UMoDijXexCVrGBOds9UUyroJkfOqIZhMvFfFDoPFjj5ahoY35kTY/Pv30RU53fV
	TTr6sAemI4NKo0rrn9qfby+0AoBcOPvpr11lOyb/uABlw1JLHodEtqcXXUqg659k
	5rkapFsSj5NcWKdKrp1z0l/qZ/kWG1k2vEIUVryFh7uNG6nSP362NXheGHzjc2ds
	Ty4ydTPHnCojmOzOhy8G7YxfJ/fzEeDYAV1fHgFT4Z8c8rJdSV0greQOz0MKLXiD
	7LqJZOppb3ai8dSFlnWWx8cNMPIAWvDiRH6CMkqwakwPmuea+yNH4aki3mdZuzzZ
	hMv9AUqlvTygqC/oq+JgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786102624; x=1786189024; bh=A
	0HHfxeX5RuaRDWyznuRMDrKtp+1CgdzuTwwJX2D5b0=; b=DITeJelQOMZvsRliO
	L1AswV/l0UkmK8H9jaIiWQwLHU0xJjox9kwCdwMi1mTJvxPGAmgHtmQuQrvEA+Is
	nQ4ew0Y83uATbbvoobhX3xPqRSrLtidRltxiSezlrHrQGqFL+aORPRwRZJIwB4Z3
	3YWupHEHyECwl26ACtVV2XwbRW8LLN8vO1Iq9Pd1ho9TUSRUPDFfL0UwmhPzrRHh
	+iRD0kKcxbBz4BJ3gesfAP0VFAfLdCdaHJrmxoMaeOQvCvJNp0cdEcYl/e2zhu43
	o6O+KG6Tz/kTs7DJAYdYYaQ8rYVew+GRkdkR3NC6wRN9SxMTH479HZwm1bsFt0hV
	ec4fA==
X-ME-Sender: <xms:X8N1ai_GtLVsW6w7qbbz-YP3Z1g9rIoYmhxh-Ltfjq22Uws7_lTouA>
    <xme:X8N1aunbF4bWXYs67EY06Ubl-D6vu-9FT4Y328q6x8QYu00hB1rf6_QrQqrxrMLej
    gA2P3LmLXm3xy-hlmo-4u4nEEoxNybZQKQaRmdVlVGGalO7NtlCg0A>
X-ME-Received: <xmr:X8N1ag0JZMLArwVfPOG_FWXPqAtAQ6LQeTUbfCFJsFSBSn5bBCqTTeb-ULM>
X-ME-Proxy-Cause: dmFkZTEfW3x2Qrq7ELqxlr/x69vk0aYaa/E/2AWrFAl7yu0Vg+jIGlS0mjOCk5J5e5/NJH
    T3J+l8M+cQ15gxg/u6FQhwxKudsrf7tN5cWcEThveGDS0KcOU0uMrzGx0YBmylEV4PfT2X
    SbTqClZY3SINVohR/2NzYRxeOu5tU+SgKqY1sS5oM8U15+ky277S+G1Ww7YAUM5Z6EK46p
    TQK1COWwyEQl/dhwe51H5lWCLFzTj8K9hkk/JBO/DvOgEgoe5sMihzFP04eKTIrZCF8dte
    tQwhoNU+zszgTlPncqprVsvTwAgpjyPciGBDZXKQScTz4u1orAuTZg8Fi2VomZsbF2qQo6
    JT6Sdos6SVoZTTW3+wS1zU1oDV+fbohsxvhGj0aeg73Xml+3CBIK14V5C8qv4Asbm9bXKZ
    Eh7U1twb1bxCOrCTVx7DPnpB29er5uVSfoP+NWHNHQEya3MER92j1+HR/PyTKk+R5j3bjf
    KwuIkMP1Ne0I34rb8/q7DifDC/AnEY0jLOJhKfPfqUvCoYYMQ5L/gOgu1YhwvO/8KVuSCC
    5W0edYKA3/t1jWwxDfYFy6oXwGzxzfi38ItQrh4PocwCS75TZdwAPkjtE2s7t4nUL8BiPG
    1k6qk00KQU1fwiF0KCDdk7UOhnJRzHRmWaHLty6LpaM3ChWMft+QdOZpcW5w
X-ME-Proxy: <xmx:X8N1ajTbfRGFwZ61P_Hqd3FN9mMc9uiNss-caJ7r2SHf-joN2ZmIfA>
    <xmx:X8N1agMfwLDEfZEyyq7gBujQUytAqDB-N7xkjJhkUig8sNRdKrZIOQ>
    <xmx:X8N1angMX15MLripPeQutwyrSSNIRt9rguRiVBtVOOi1rJKlihEIVg>
    <xmx:X8N1agJO7npsjhnUkrZ77t8dZ1aUQGpFB0Lnd0oPLZACWxNOX4AJNw>
    <xmx:YMN1amFQi41bE9evRu6RM-nVdGnNt7vywJELXcMg54XWdHcNIp2ZS88Q>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 07:37:03 -0400 (EDT)
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
Subject: [PATCH v2 05/17] selftests/mm: move is_backed_by_folio() into vm_util
Date: Fri,  7 Aug 2026 12:36:35 +0100
Message-ID: <20260807113647.3744609-6-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807113647.3744609-1-kirill@shutemov.name>
References: <20260807113647.3744609-1-kirill@shutemov.name>
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
index 360c9ec6702b..3c276865a778 100644
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


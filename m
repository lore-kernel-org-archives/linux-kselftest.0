Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10264287246;
	Sat, 15 Aug 2026 01:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786759165; cv=none; b=Q6kETuC/NcKmGw7dvGG97W7FxUx6luRB7hrYdxh9W830UIQlsLJguGyKLceD+qa73m/uZcilDxRPqNb5I0cLEYB+/Sg9QNZmOReFsWUCf+E9oSuhgM/0eyZarixSTgQdRgCJbjeQLKXbB9tBGcq7KBBf92RoPpJADkOVReUpdpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786759165; c=relaxed/simple;
	bh=trbNubyEscebeI0IJT2waWmyfGYJrlanwkyVzEhahBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XNClGAWIAjaLWb2LhDKEG0rD28EtVwEpTUShJoR9HEY65DKXHPAusoEUQCerdP833WB025D5Gy145XkUBG+zaks1elLFAaZE3R3x6bh0v0+pQGOHld7oU7s/Cvnp4scguA20S4Qkxl1X4zGk7CGiwdVN4JJGUI4oYLjGycnGtAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=T7xz6jDy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PtseMFA1; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="T7xz6jDy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PtseMFA1"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2E01B140011E;
	Fri, 14 Aug 2026 21:59:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 14 Aug 2026 21:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786759161; x=
	1786845561; bh=aGZmf/6wBq65F2JoipHZ/CYoHcQpvbh6TEl9rP7Pel0=; b=T
	7xz6jDyNnlB0Ez2Ct771Gn2xfcopt+eC2/a8yF8l9BLM8jbCSo56u++JpCCcuuUR
	AMVPYE8m3uAS3KmUA48P0RyoNRcPHU2nSm/TuwRwKHoBCKvNDXU13OP/v1BTbZK+
	7bXh6+7gqXxJy1MTHuTuRf3MZ/ZkkrapVAdagEd/roTp5F+FDMk0zi9xh0P6DBhF
	rqsryH4uT3V+UGv5g1PtEBrYTyv++Cuf2WKYFH5FED6MrRtYdJKndkeFcmZ0ux5U
	EayLhRAKws6A7wdQ6i4eMXh9w56rMhm90mBB25M1tv6eWSm06iWfalRnqVu0YUFn
	E8TibUC4l1xJeta2irQcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786759161; x=1786845561; bh=a
	GZmf/6wBq65F2JoipHZ/CYoHcQpvbh6TEl9rP7Pel0=; b=PtseMFA1D5viN17wS
	Nev87fgjogNlQEXUuCElSDKtZmfmV9cdgpc0pPbfJPhx5Paz4vTB6rJiSDrcj4nd
	MpNLbTN1v5yxSof5BlrtlIhhiHrTjytHFOTTvos3iWt13p0NJFgGrVyig8FnEjBd
	QupT7J4gax0ZQfoDEld8+/RqLiZUObcsaLwH9043Ge+x1SRSaIqoWfzvlddyzEyJ
	uA/WBqw0srslWUNzhXFAWvBHjv/Yqlw+kcE1+EiZO2q5IUadXDvxotQovGYKm8yn
	E3XFn3jV0xavgrmyiXR3feQ9KxUSJvjMe8QMyTjceAoPYFBuSiMS3/jy+GlvrNnv
	MFgTA==
X-ME-Sender: <xms:-Md_asGYPOSGmr-FWwuIwgdRTEa26mnBjW_AuswLtKxmouSRMFv2AA>
    <xme:-Md_apS3IJ2pf2jX7tmxDUzo4IKMRs-K2acu7fKv3nWzYcOJPsI6Sb7SbS2_BhL6X
    5YU7kppPRJ8SQ7wcaO9XhLJPqf1ikTCm2h1_GIl53kDAfTRgJ4953w>
X-ME-Received: <xmr:-Md_auphCin7_ONAWlmLbWKpDKOiNHgaE7x52dtgRqac6JePbT_xo_Kh8H8>
X-ME-Proxy-Cause: dmFkZTEYpEQiBdLKlCaLp317TOYqYwO99jnuX4YrBujo3RuW+IIGXdYj4qE1ezcGRvbtOZ
    hc7RfnfkdlTehb5Dkvk4VZTcyRAqm2CcEjaldkIQshIttrB2HSeWyAKQfsR+ykmymFv8qO
    aC/+wh3joJiQccaWn5NjVrqLVVMYdoVO37A5ZL6SnR75seJlCquk1NTOiA0EvXHIVSJ25Q
    iFONSccd/wEzNfQZlOvvQQf5bCKiGIALXd0Rd37Vcnrh56q8DfWwmvEu2ZgBGSMa525iaP
    HkMF5MKO3LDiNiHXJVHjo5f/L4XJttiAOfdXhljkaHgZI649okv5M81/eeF8HfhCZr1Ug5
    fH812civBTQ4/FE9yW9xtOi8Y0F9yKDrp1R20YTK463G/7P8yKRYnTTXddn5qzFWbXndys
    aiCpPcx5TNMkbM0QbjoCI2x1ABR670ocmpPmFHiQMaquLHhMxNhgE5Llu5/gibaYC1zkm9
    Ar2yt7xVrGUFjmYY0GTfXvXuILsLD2Q4rlHwJiD5kf1kO9y44H7QZ3a6kgmb9kzlEMLv8E
    8gx72OWly2IFG0Ahpn8cYPbn31wFFwmhj+8iYcXwP+ksUUlj7vUgpT7c1PW32uSnUDuyyd
    JLi9C9d343aoTgtRo0HxjLFqQmY6rUFKunIWpzNVxqmpjuM5j+WPCS7xbVxA
X-ME-Proxy: <xmx:-Md_anr99278L8HONDAKTE6G6GFBM1Q-N3clN3UAIBDhft9ofqmv8g>
    <xmx:-Md_ap3bklSZoSXuiR-GHu8j2sFWeRFUCeFZL-Qyvm7BBQwqqVFL0w>
    <xmx:-Md_arih243Q6M299p6_p5U_eI_c1vh7JjbODoTvLi_Ji96aZ7PArA>
    <xmx:-Md_aolRYK-Nt3teqNJhXtTGIsCzPhnfsvcSI3m33dRdf1_W75p-tQ>
    <xmx:-cd_aimnuHbDsU0tH_WgWSkbEJziyUOcgjo2sAX6PhAaqQhK1i7ETTCh>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 21:59:20 -0400 (EDT)
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
Subject: [PATCH v4 07/19] selftests/mm: move is_backed_by_folio() into vm_util
Date: Sat, 15 Aug 2026 02:58:49 +0100
Message-ID: <20260815015901.1236937-8-kirill@shutemov.name>
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

Checking that an address range is backed by a folio of a given order is
useful to any test that builds or collapses large folios.  mTHP collapse
coverage in the khugepaged selftest needs exactly that.

split_huge_page_test.c already has the building block:
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


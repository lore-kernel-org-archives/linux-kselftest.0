Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B63471408;
	Fri,  7 Aug 2026 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102632; cv=none; b=cj4exypBumEHdr7x+DCvyp4AYyU61yaWi9Ps9lH467LeZeHP96h1D5XtzGy4WCCtEHaOY9i/nH2mjS7TisuMjqYQj0YCyuWfFoby540tjEN/OLvTWygVNuHm46yRKt5wG2Cf/HD7Mvd+QUHTFTDvyag5uJFVhgjqEs/0gtDm6ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102632; c=relaxed/simple;
	bh=rIKV1oM8EUwKl691Y4aowMbqUCWENCAnNomPHJ0L0kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lWT9r4+prppZYMtSw7zULN7JcPNsCHs2sE9btaH8jf9XnEknAKDXBOVX4/O2mECvpizORJothcSQdw6EzY+MrSIpTPNgSZh3hQPRWRcF9Kwnb9wS99BZbMaIqRiuSvRBrB1u2f6TBclRlANKgQKgr0+Jx7LfIh9xMFPUncE4BYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=DmaVQLPw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ik8DZv6U; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="DmaVQLPw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ik8DZv6U"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 87F197A00C4;
	Fri,  7 Aug 2026 07:37:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 07 Aug 2026 07:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786102626; x=
	1786189026; bh=l5gMlhY734ld4sS1EqunE+HNrHgaVjUphYaBo5q1iDU=; b=D
	maVQLPwpHskr8ZYltXRDXvTDO8EUBoI4blSsCsLSlmOcSIZ5ccYVXjE+i79PZEqg
	z/sKey8i+8JWvTFRLTNGewLfay5YbjPW/wgYN/Z315ZrVTAzODHNQafq25GNFIZ9
	XDwhx6gKAxkNEup6fSy33LYr3OVwCddMUd4TS9hRsdcadROm2yobmhPy8N8+RJB0
	IfeFfwU0kTIL28WWDS1hYuJsnDPKesoddmWNIoMTiyeVs1uveNgvs1P61ozuucpe
	8PFZJII0akGLU7mCMND5Yw28Lss0WxeEEepFDwc2mjZAa00Pappe0TrAabPM2LeJ
	9NiNoZDtHj3958r/lFCxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786102626; x=1786189026; bh=l
	5gMlhY734ld4sS1EqunE+HNrHgaVjUphYaBo5q1iDU=; b=ik8DZv6UZHXaMv2hq
	XY6dHfmZtlMNX1O288ZJ2ib/FFhKWLJGAxLrrsxsBbgzEI1aXVNketVyDOmFa7Xh
	5a2Ji+qnQyLfpGZ+/ChVJA+ZuDNWkS9PwYqS5nGrx85AHneCY46NTbCeFpteqvhQ
	BU4z8DVKX3R52DOn1IZ3t9Qr6uBldXiF6Af5KDFFWVID8Vt0mIglXtOVhGLPIzmw
	SxPJuUGgUE9XxbBtI02WifuQFxNliGlaewXV7tS03dDDMNPxtOL8/jvda4EtzwJ6
	4Z8tB0aBqTcVK/h/VKlJ/4cQlYKbcE5em4EXtCl4TJNpe+1NjMkw6T2sgh/4KAgz
	Ag4Qw==
X-ME-Sender: <xms:YsN1avPgV4ttFl4CSJ7Iy4gTK0vLqk9bS3WFIrsC1CbJorsWps9ZKg>
    <xme:YsN1at5gszCspb8G7Z0aGZpkH2h3EfMmzXViy_7oOziKo4VtV6EbkKZxGsff074PJ
    KN_lOoanB_71ZHJJDhZ8F2A3YWqeHjjSC1xeN_vD7dy45XOOo7x_y6z>
X-ME-Received: <xmr:YsN1amzyzP7TgQ59Y47WyT0KZB2ojMLtMXHBaEYV81gsf2fDYA1pVyiLyp4>
X-ME-Proxy-Cause: dmFkZTEcBCtHwgFqhRPkncf0k+1ylINMWkiJotqLKgP2XUmyCnaVLH6jJFUJYUtwVpCetV
    bzy51nCrHgVQnKUbL6xUc35a2wACIZl+NbR3y/w0ModeWlKP4SKCXfcn2Mi8esZBMBdaWx
    faB4jzBJOawj2LBnFTgyCBiywrPp7FpNgfXB5cgYmB0wgvQ/HhhWAfKjMf/weJgLhMF/VV
    yXrMoja9EZiHjuXu8bb94hiDoU2fqI8TuwJJmzzN4TUL6MxSST+GnkpA2ZnKWVewXCphJB
    Lec89iAB+bDvFyV3zsxjbJ8cA1IEQ3aF+gxi5HDHtN75oTRJtbf/Sd54tDaiXy5fa0cQqS
    TiLXeHKeb+yhvBs42rwl+ePNPwrcrCpwjXd2vzbNyTKLhIUtrOJAuN15gqmTF5MDKkfuGE
    uX9cm0I6yOBZ1hS9pgoUq5/SSInRuWjFQciDGDhe5m6S8U21ILwj8Ehydnx3O86lYuTp6L
    fSAMba/DSXMK6QG7KbZBNIOGbS4ZIfQGxHMWj9JOmhpF3QRHO18vsM+2xfgxQWleRPyUKu
    2P9eT8X6NWOWfhoEeN/z+SQeX35x7EzXlyyXFcTy/vMzJnPTvm3GDLShNMCBPaN3cTdM9z
    iBcgXeu6d//2ZKvvtP6tze5ZH0X0hTji9BezWMplN8bOwaSsxF2RjWKc6Q2Q
X-ME-Proxy: <xmx:YsN1atRQfDSRW9Z_KLkiHCWcK7W158Phy3nu0SNBgWeUiqk3-cUXyg>
    <xmx:YsN1au80xTPpTI6mK8il8QPndiQ1HSrKs9Qg3VNtSXlUN1iBBr06ag>
    <xmx:YsN1aqJVI0Y6sagPa6141JmxtJuBUljnBtVVhWnm932EtKQsdntFig>
    <xmx:YsN1aisoRFnADVkEtE9dnKLiwQd88PrJ6J_ryCDblTzuofgZ72NwDw>
    <xmx:YsN1anvmPPxzitgUd8uih3PaHBJFFPnsBRaZl0VIuS77GLTwzZLD-odb>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 07:37:05 -0400 (EDT)
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
Subject: [PATCH v2 06/17] selftests/mm: add folio-order check for address ranges
Date: Fri,  7 Aug 2026 12:36:36 +0100
Message-ID: <20260807113647.3744609-7-kirill@shutemov.name>
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

An mTHP collapse test has to ask whether a range came out as folios of one
particular order, placed where a collapse would place them.  Nothing
answers that today: is_backed_by_folio() classifies the folio behind a
single page, and check_huge_anon() reads smaps AnonHugePages, which only
accounts PMD mappings.

Add is_range_backed_by_folio_orders().  For every order-aligned window of
the range it requires a present head PFN at its natural alignment and a
contiguous PFN run across the window.  A window stitched together from
several folios, or one holding a folio shifted off its natural position,
fails -- which is what makes the helper usable for "this window collapsed
and that one did not".

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/vm_util.c | 42 ++++++++++++++++++++++++++++
 tools/testing/selftests/mm/vm_util.h |  2 ++
 2 files changed, 44 insertions(+)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 3c276865a778..3f586f2c3d33 100644
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


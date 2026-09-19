Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC492D7DE9;
	Sat, 19 Sep 2026 00:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777519; cv=none; b=KUZP+CUhMGW1KZuVBkniws0zcKiUFyjAo0/YGf5LKHBbsmjpcxs10o0hQsFn+P0k/SK1rjike4ghXB7hnfenDrL5zcVuJfMd/ukbWM5z27cU/OP4kOdCV5zQ4tmLQi9v8NwyHUQ6bh4ZwMcCUnJVmC1Z2GsTlIudLvWWpDMOw4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777519; c=relaxed/simple;
	bh=gJHEmF7xCwqYHMp7G/UtGzV2/FEIiJe92/thvIsw6wY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pr6DkFcGl2ZUUVf3dp5mGW5ltPX5C8FKCVgF4UMRM/PRMAupwktizwhC+B4XYp72LiMXtLoP4pZrQAwAE2MsoFJVh8bT/vp6NxKj25U/4KvO4DZq+Yj4DHQX0YvbrWFPMLP3q6RJYvVr3G+sGHs5kFqBjBpVRTqaefAeL5zZ0mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=QwotEtql; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pd4ebgcr; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="QwotEtql";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pd4ebgcr"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 62F40EC01A0;
	Fri, 18 Sep 2026 20:25:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Fri, 18 Sep 2026 20:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789777514; x=
	1789863914; bh=r5nTkTHjVvMlyFTA7E1YaHuqOSpZFDKLhDsNT7zZVk4=; b=Q
	wotEtqlZ0AxHw8nD1qvwn+xUskD7FqxxJ5G5WbdDPSvVhIODO1ylw2Of7xnF4gz4
	FdgWnoGi0829zhFZMehVtg0hlnybpRjfqhgbdg0lHxrLBFcN/Yo0U80gEYvqCGqA
	pMRILwvlMkB1sbutBq/O9c2fpPiF/mdLnkkdnbCv4HTf+hzx/oIF1qQnPoyHLSl6
	HkBAfWLk0WpqJFJaoCWOmnVrOXRlf1u56S5Paj2KOTcVQLpqi2Y1kMfFLnJDEl7K
	JHMKN0G6FXtSZPqFeLdhPHKYqCjOCg8EUv5zzV6WvhGsDK5EzbaM+RpT6OwVPK2R
	+YALW5APEDFLUlZljiKbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789777514; x=1789863914; bh=r
	5nTkTHjVvMlyFTA7E1YaHuqOSpZFDKLhDsNT7zZVk4=; b=pd4ebgcrEe4MB+KtT
	StrwrRvM+97GB0qHUIozEgo/p23VongCb5EfL/kL0fPvRti81YsdQPgfj5dDjtvu
	Qyj03KKp/jSHw9g6CFnCstVbqe0lN1aeifxBARqFna1y7DWqeUnrwmYmDUy7ACas
	uGKgpc/kuEjF5K52ySRJk9KYbUVVZ1X0JxJ6NlD7uQWahueF8o2+sYvfuJcdTsVc
	NGfbOD/WC5wcplO3JggmIyinvnuuV2aqVq5PGBOugv8Bs6oYSPwLsz1KLKfTNUlQ
	1SAcrIguzYS9Rp6mABesd8wPeIgS9xdy32PBD8BIsn2Sk9SkaLGk2kI0jAQZYdl+
	/3ILg==
X-ME-Sender: <xms:atatalcZ_JimBUPR7QS3Ey43nuE991V4JgSiq0kNDufC7y76FGrHOg>
    <xme:atatarmMk9r8zPp7b5TmNMPIbCtPKRGVKfA95KIb38XsGbWMEocWtKIByRkLNtdpQ
    AZa5old_5V3-wfzvzV10BLCcSJ-BVm5AbJhUUey2QcM5FtXAJC0o5VV8w>
X-ME-Received: <xmr:atatagt5kfSPPzYlD4AObv1LyweHGU41454ta5pCDWYjAHMKVccBFngbELw>
X-ME-Proxy-Cause: dmFkZTEzseHgHAxanvosBbYuJPOsY+n0X5UbYs0PPazNY//kQZ3NkUWvwvZaeFG4K6MaM1
    51QpOH4aelOmHBptEhruNIkMmEsuOQeZbGrvL7mQj2kdmmCNYrJ7V/Gxu8ar4BzJpo5rV7
    vKP2ia7U0+Vm59vAPsz2JcwivFHP+0OmSoqV+JfA3yKlcOkTPrhdGkX4AgOHLm4XJUt5mM
    HeqMESXl6ibr/xrgjBd4IZM9oAbU6DWk9Q3+fqdUek4rHv8tNSmXbmq+2iLXuPMZjgN42W
    gGRNasGU39A5UL6wnmEy31YC46agADHTZYQX6KPmc3+B0CXfmIhRtSns1d+buSvmpYlDBj
    Riz3LPJ5ewmbfFS034Junho+nA59C2QdPnd8vA078CVbfnIVBuVyeZunIF1BdFpJy+o2iN
    5vZCICEeIFyBnK4XAtYqzjAbdcsq9wu34gWczIkUsEAsprD6tQ8OD8MOQgcBf0ywWXKXFI
    27xd1zREAGJOHifR7SJSbs+DiSkzcOQ8yzDWYHidssHN8IjIbQEtXt1mZ5nMsnBoj8dzhf
    XF1JaGZj3WlcgrIXMSPvCcH52rugKrlwp2TQWMwgehKsP/lB9bPQ7en5g+Lg7wt1jbjF/H
    R5WQnK3fOt+WAqCb1/7XU80vMXxm1AXpyucuzzd4PMOSSe2FT3Iv3q0CecqA
X-ME-Proxy: <xmx:atatamydMuYEKzrLksx08-5ML7T2w2IMdUw2kTrccHLACT19KX0XUQ>
    <xmx:atatajx4XY5GXdiMEN30NNShWbS7oXfb6iUIxKaN1akjbRnfcwq5BQ>
    <xmx:atatas54Mbvq7njHaHNbgrPcTN6Kx8gHdQ9sr4cU4fcQwsYAV-nCSA>
    <xmx:atatasAtc8x1j2Bz_b57MDE0Zr0BhgJ4sKBP-tfdysHH2rwumcYbgw>
    <xmx:atatap2X9xSzIQ6okEXWF0ql2JsLjXgsSXwwqtFBbeXxtp85qJZ2addo>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 20:25:13 -0400 (EDT)
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
Subject: [PATCH v6 08/19] selftests/mm: add folio-order check for address ranges
Date: Sat, 19 Sep 2026 01:24:38 +0100
Message-ID: <20260919002451.496763-9-kirill@shutemov.name>
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

An mTHP collapse test needs to know that a range is backed by folios of the
target order, and that they sit where a collapse would put them.  Nothing
answers both: is_backed_by_folio() classifies the folio behind a single
page, and check_huge_anon() counts the folios of an order in a range
without saying where they start.

Add is_range_backed_by_order().  It requires every folio-sized, folio-
aligned part of the range to map one folio of that order, head to tail,
with the head at the start of the part.

A part backed by two smaller folios fails, and so does a folio mapped off
its natural alignment.  The mTHP cases need both to tell a collapsed range
from the one beside it.

Assisted-by: LLM
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/vm_util.c | 47 ++++++++++++++++++++++++++++
 tools/testing/selftests/mm/vm_util.h |  2 ++
 2 files changed, 49 insertions(+)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index cc5dfd1e6c94..c8c5cd8ab6c1 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -555,6 +555,53 @@ bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
 	ksft_exit_fail_msg("Failed to get folio info\n");
 }
 
+/**
+ * is_range_backed_by_order() - check that a range is backed by @order folios
+ * @start: start of the range, a multiple of the folio size
+ * @len: length of the range in bytes, a multiple of the folio size
+ * @order: the folio order to check for
+ * @pagemap_fd: open /proc/<pid>/pagemap of the range's owner
+ * @kpageflags_fd: open /proc/kpageflags
+ *
+ * Every folio-sized, folio-aligned part of the range must map one folio of
+ * @order, head to tail, with the head at the start of the part.  A part
+ * backed by several smaller folios fails, and so does a folio mapped off
+ * its natural alignment.
+ *
+ * Returns: true if the whole range is backed that way, false otherwise.
+ */
+bool is_range_backed_by_order(char *start, size_t len, int order,
+			      int pagemap_fd, int kpageflags_fd)
+{
+	const unsigned long nr_pages = 1UL << order;
+	const size_t folio_size = nr_pages * psize();
+	char *vaddr;
+
+	if ((uintptr_t)start % folio_size || len % folio_size)
+		return false;
+
+	for (vaddr = start; vaddr < start + len; vaddr += folio_size) {
+		const unsigned long pfn = pagemap_get_pfn(pagemap_fd, vaddr);
+		unsigned long i;
+
+		/* Not present, or a tail page */
+		if (pfn == -1UL || pfn % nr_pages)
+			return false;
+
+		for (i = 1; i < nr_pages; i++) {
+			char *page = vaddr + i * psize();
+
+			if (pagemap_get_pfn(pagemap_fd, page) != pfn + i)
+				return false;
+		}
+
+		if (!is_backed_by_folio(vaddr, order, pagemap_fd, kpageflags_fd))
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
index f12979a70135..0172003c16dc 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -101,6 +101,8 @@ int gather_folio_orders(char *vaddr_start, size_t len,
 		int pagemap_fd, int kpageflags_fd, int orders[], int nr_orders);
 bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
 			int kpageflags_fd);
+bool is_range_backed_by_order(char *start, size_t len, int order,
+			      int pagemap_fd, int kpageflags_fd);
 
 int uffd_register(int uffd, void *addr, uint64_t len,
 		  bool miss, bool wp, bool minor);
-- 
2.54.0


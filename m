Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAAB34BA5A;
	Sun,  2 Aug 2026 19:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785700413; cv=none; b=tumfEwOxjve4S2BUfNMgbWyW7Jua6UN/IdMJpuL4du4vq1hv6NHw42k3YaN1Ib6HNtk7MDz32e8pf7/7rM18DtvHksCc9i4y5oczha6NNVbd5h2RRDrbvVGc7Ax0neJ8U9Im87VMgKV23bHr2tawcP0pUROCOTFO/I/6AaGiG6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785700413; c=relaxed/simple;
	bh=Z78GI0z//ddridqQ0Fw2lwHzt8ABTBUgMh3xKppDT00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eDUg0lGq3FTb15JpjDd1a/kQ0gc4w7RVsbolZMPYFfIvVC7iUmIMO1/vzijx/3tDmh4ub5nVMuJkkmB82iUqklixUasPGNngbkk8Ycg2UdAlb41V9XtyR6GYtUssiF74kWuPc72Vmx8cE+07IMby7QrOpNBXT4EYfBeXw4TlGEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=UaP/pzs6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MKLkO1jE; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="UaP/pzs6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MKLkO1jE"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 5CD99EC004C;
	Sun,  2 Aug 2026 15:53:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 02 Aug 2026 15:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785700411; x=
	1785786811; bh=6K0rFA/42GWVg7pW/IyikAsYoBS9+Tp+qGJZ8yXnCxI=; b=U
	aP/pzs6zz0h0LRGxpIBr0UfOSA3k4RPcZ+eWdASVlXPduLOEja+rMbkgH+a+Lol5
	h4p8XVS5DX81DzyulmjCS/yF/gnumDchdKasWwuT47Y180r62cnpA98HuavD4Zdo
	Vz5xJ++O66i4VW1XVPuwSK005NT4r72SbndJLZc/2HzWAhuZGlqmMzTBmpv940le
	GdEjVMTURcktf3paxYxdasDsft4oKb+rLuK/XpT4USitZozQTN+0UlaW76BTN94A
	H7HtRTwj5GylftKchYfi2tAPRPLkTlBwEjybmZWoPIITGd8/oyi4RmHOp6b8Uzor
	aYQMeC6zSETuDd4EliC6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785700411; x=1785786811; bh=6
	K0rFA/42GWVg7pW/IyikAsYoBS9+Tp+qGJZ8yXnCxI=; b=MKLkO1jE/0Otbu/yq
	AHbx0+VXJ72xtZx1soDo9qTL7rAx5XMYwp4I3hN2qLVrYIWbV402IcJDodXO6qjL
	Lnlgl5RZ2BmhpnxwxK09hgUgvs5ew6Py2MN5Uk/KdcezdV46auopTVBZx3fmDhEI
	RUAcrAQvBZyBQjjiWEseXsgvYXFlgRvzwTUC9CgPba8+x8J6kyQY2z11wp0Gwyct
	MHbCDWS51F/+HYDwuY/160mejO67GvXUTS/NNKZwq4m543vc7zgwpA5RGiYKzFlh
	qyXRYF7gvxhp7ERmU9eD5Arp9whY6VHjCuQgMmBHqiNKcbKmhTqf/4iOn1gLzr3n
	8weIA==
X-ME-Sender: <xms:O6BvanKsh84b9JQ3I6n8WwMheCMf0PwtdYtDc734qcr-g3OeOn3Klg>
    <xme:O6BvalqAhlSYqML-xC-3ddTEPFTUCapFgNz_dQQcxGRpuPQAbr2jGHgqs5WL7qr7q
    reU4NcTkPPI9VfD9-sfR4zdHzBg9mZ34Nlf98oq3itrt-PPMXq5mnl4>
X-ME-Received: <xmr:O6Bvasofs3mi7HPjQy1rx7X9IeVROc__NFIXLGLuZorpMIGEU0JUmCXysqQ>
X-ME-Proxy-Cause: dmFkZTFcbv35QwNbwWPHQBcJdrWasH4YRFOBaNWig98oa0GgLD3LmQrthvyDgK5JnDhp96
    dBkNywOXlTP9Hby+cm0vRQHofuB4BhsdtVcBrMer/A2AOpegfr9Hr7RYzI6OqquxWhxeXC
    aB5bOw4cR5G6EDzO4v2r94SJnXRDYvi2NMwyCB/quID+suEuw0TjLUMYjjQ5pFm1F3OqpQ
    Ctej7rOharBpUeBz9hjZojzUlseCYYYMV+BulSa6+jD3O5m4ZOeULsSyQlLb9bciCyrhiP
    bT+z0cGYr8PFizBGTpPnPZCe+jZkx/DQlEsoaoSV2SjHlZpE6q2+n/t1AcZaLqu1qPGmmt
    J2A/ADzeAiJhREncqeCCozBMQV4vTj29Vg4C2eydWSSmaXBZYHSHzRhPGmFPpD43WFfAwZ
    VwO3prtQD7GXV9g5gi5N27oooKCPfcRAmxgWJ007AmrvaYUBHwSNdhNmfCQckaH+ClI1OJ
    LWjqa0LTLqe+LATNodWdp0RjOGRX+pPDo8Ajrtx3OVLFoKpEtGEYN2Q3kkTy8qjEvH/oWT
    U+TfvKX6dR1zXawrKnT+E6TJGIopcnWbyQhJTF83FDkAsugu5d9o2cDPuxokC61Bj+OJJR
    xMbu5MMFTRIXi/8Fp03WZ/pdmqUvQ0oEvj4PqNS5Cx5lPbKZ4cMwaR0aJpuw
X-ME-Proxy: <xmx:O6BvajHMeFU9YuWbrwYsubdZk8LFNHsi-TE-RsE_JPryAeGcF1WC4Q>
    <xmx:O6Bvamo6zXv_2RRQ_k5QTpKWtxRWSzcJ7dWZI0MruKshuGshiVZuuA>
    <xmx:O6Bvah1yzfRmuom7_BdmJ9P9ak4OSkFjvSdLSfZmyhsoKiEwHh3JZg>
    <xmx:O6BvavsccyD5jPT7x813ZDbnsaFiDcAOzd0r0hDZ8w10hKIygp0jJg>
    <xmx:O6BvamHD20uFDWsZLpkNj41JLFzw45tMuVKRdj7qK0hAHNbWms9QbgSg>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 15:53:30 -0400 (EDT)
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
Subject: [PATCH 16/16] selftests/mm: skip khugepaged shmem cases without a PMD page cache folio
Date: Sun,  2 Aug 2026 20:52:48 +0100
Message-ID: <20260802195254.1937477-17-kirill@shutemov.name>
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

The page cache caps folio order at MAX_PAGECACHE_ORDER, and
xas_split_alloc() puts that cap below the PMD order where a PMD is 512M --
arm64 with 64K base pages, as include/linux/pagemap.h says outright.
shmem_huge_global_enabled() then offers no PMD order at all, so
MADV_COLLAPSE of a shmem range answers -EINVAL and khugepaged passes over
it.

The shmem cases nonetheless ask for a PMD-sized shmem folio, so on such a
configuration four of them fail and the run bails out in the middle:

not ok 2 collapse_full not ok 4 collapse_single_pte_entry # Allocate huge
page...Bail out! madvise(MADV_COLLAPSE): Invalid argument (22)

That is the kernel declining something it deliberately does not support,
not a collapse defect.  Skip those cases where the PMD order is not a shmem
order, which thp_shmem_supported_orders() already reports -- it reads the
same per-size shmem_enabled controls the kernel only publishes for orders
the page cache can hold.  A tmpfs-backed file argument is skipped on the
same grounds, and a run left with nothing to collapse into skips outright.

Anonymous collapse is unaffected: its orders are not capped this way, and
the anonymous cases pass at a 512M PMD.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 9213ce1658d0..c5a3c3922581 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1584,6 +1584,27 @@ int main(int argc, char **argv)
 	hpage_pmd_nr = hpage_pmd_size / page_size;
 	hpage_pmd_order = __builtin_ctz(hpage_pmd_nr);
 
+	/*
+	 * The page cache caps folio order at MAX_PAGECACHE_ORDER, which
+	 * xas_split_alloc() puts below the PMD order on arm64 with 64K pages.
+	 * A PMD-sized page cache folio is then impossible, so the kernel
+	 * refuses these collapses by design and there is nothing to test.
+	 */
+	if (!(thp_shmem_supported_orders() & (1UL << hpage_pmd_order))) {
+		if (shmem_ops) {
+			ksft_print_msg("no PMD-order page cache folio: skipping shmem\n");
+			shmem_ops = NULL;
+		}
+		if (finfo.type == VMA_SHMEM && read_only_file_ops) {
+			ksft_print_msg("no PMD-order page cache folio: skipping tmpfs file\n");
+			read_only_file_ops = NULL;
+			read_write_file_read_ops = NULL;
+			read_write_file_write_ops = NULL;
+		}
+		if (!anon_ops && !shmem_ops && !read_only_file_ops)
+			ksft_exit_skip("Nothing left to collapse into\n");
+	}
+
 	if (anon_target_order &&
 	    !(thp_supported_orders() & (1UL << anon_target_order)))
 		ksft_exit_skip("Order %d is not a supported anon THP order\n",
-- 
2.54.0


Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DCF1DF261;
	Sat, 19 Sep 2026 00:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777513; cv=none; b=t7bZqaU5wfia1Ov/RopRr40i/ehh3s431aEIJp9vna0rsZOQ0yqG07a0rZLRB3yRGbYKgzP1ReQcgxHq9Q19q/TY9QUZ8N844C9cq3snEG7TEO6eE9mQ20QY68EtKKHAiGYOCU1I2Jsz1dCIKgxGeL4nQWh1FCpZVfL7LYK/6sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777513; c=relaxed/simple;
	bh=74sW+EnsmK5iOfReG2R+O+Tx+lpNiK3mfv6p06M79xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tIbxFgcC7HIv/AqvSR3w8drQS6DIEX+QIdTjW2G0G12ApdnI/N+j55LIri+DRMkQtWKPuhY79Eb2qlQ2smqPQ5a8iMcLBJMdsJAsrBUl3Xt8XqwpyUZ/qOocRTFIojiKR7G34AJ0DrjrikEG6YR+Uf+8fD0IwXngGdS2cmfgWDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=QK6trjxA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=okjo/XZx; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="QK6trjxA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="okjo/XZx"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 8DF9BEC01A0;
	Fri, 18 Sep 2026 20:25:08 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 18 Sep 2026 20:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789777508; x=
	1789863908; bh=0jxXZ932RTloRPkXJ26iTQ69+3zOv0gA9f87bGPUF1Y=; b=Q
	K6trjxA1vG1JZ/W8coRdqkfpWyM7J20BUChzzZo376iEalMb1/yBRYFSfm3J2MgA
	aKDB6+vRsZljeBE0T43fZBzaHRNG5W+HtZmx+fkJ7Fgjqka9klZPcBWAJRGUkpMN
	PeQbOt3Ypu/xl4uwhAMeUACvoWY5AbHzJjeNpVkEylYN1ibl/siIBK2p+7dV4OPk
	1/zkUaR87Pw+ILjEK+CGAAbHfxrVJebmtBWowP7WK4zQCbdIblYHBkvVFdsLqV8i
	NzgQJuhLED39AR1vG8gOyOAD43cLavsqpq7HljSGwfjvzfzi7znubjoEWrjiC35t
	2RN21e0qGVwglFoIJ6dHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789777508; x=1789863908; bh=0
	jxXZ932RTloRPkXJ26iTQ69+3zOv0gA9f87bGPUF1Y=; b=okjo/XZxMMeDR5lHq
	JfCHFY+gIsfdka8yKm6PiF+WLXMeE19SdTPTAi3zxsVGH3E8EaEfzIe+8DtOpUbl
	qi3DUkIzZLn4ynGlpKoVRLiH/xuAOFxFVemms/k1vUZGdk26hKmk5w/nM7AhlZKU
	2zSy0cgCPOpmTy7DxYg3a+dG2uYMa+fGkRq72sJ6PkJWwcLL5BCxmsyLv6oyZJcQ
	+LH4CXmjV6R6px7RGAYnrqRtFSxmKmmDn14cp1vflO8NVgYEzLAIOPoFoLnvnpa6
	byXNIdGcV1M2VdxQaA8v4y2WG7r/RPinfRvVGhJs7jA7IIrXnhiXMhZg32uA2j/k
	L0bmw==
X-ME-Sender: <xms:ZNatamJupdE8vMTCc9UXdPO-FPJNgk3fRhcdPxHZXT2wkywMkG3yow>
    <xme:ZNatamikOA3AXUoDz9WiPHKgupdtZLL0qtSz075bm1jHmH9Unvwxh6H5omhbXjJA8
    m-PxaK4eDEPUMAKu9-hR7z1jVba5ghG9sO5iqqPJSJIXH-TCEZUEV8>
X-ME-Received: <xmr:ZNatao7Id28xLDR6HRvCrzlqomqV7EnKx6ZTJnR5rZkSa8r0POCFNc1jT-c>
X-ME-Proxy-Cause: dmFkZTFyC+XeKYnZ766rqTYe4SsoatN0doBd7ADemiperjFlmE10ggdkgYpZeWmNOU4aBc
    lm02WEvCO2QGG+A0SGXMzCjVWjDSVCQ5WJ/xmSMbLZJLqVjt5aEnrGd0hUbHPJ/ejcqjFa
    xrmYY/YNxh9EpvRrTjNMqslNp6oZ1XKAjj0b9YUD/U+Umt4HJhNRFStrIx7jR3Gf+CAD8k
    /TwEvtSve0+WgA7utVqBt9LeXDUSIUkf7dn/1M9JWIyORT8Kp2cNKrwYutOzK/Z35sBm5S
    qWNICJAq9yYROUOkEgx1cQSYtjkPP2DMZwKGXS3JxTiE+xMdBmJUepOSBHs3/DvnVTIMFK
    gChYU2BEFFB9NOF1vNFE7k40lrB57q5k5i69CWvfmdsQKgad4bHeO3w/G34aFpcNwxvZGe
    ufJ1PCPrsJvoR2vup6W1g+fn0IkEMfRA6RUqWDjWoOW6hqdvB3U+zwIUdoYlJhLK5arfDX
    LJiqlHH+P0e7oXO8WGzpoqUmdA5LXT4pc5sWKdCjE8FpUjM8z0X7M1nYUIpQEI59TyEN+D
    esLRpRcwcZdpOu8A47+q8O+pQykY29kuTM456oHHusrDmTikzbG9Tfbid2g5c4noHAsuOT
    gy89aAeKZdFV6BEEx2YfQuDRFo67aWXGhOpI0SeNlPJV9a7GzSWOMqN4rEgQ
X-ME-Proxy: <xmx:ZNatajMqdgy9i24lfJKwANyHtLHHNSfr-ghLsF5FVs7wVBDscvZuCw>
    <xmx:ZNatavcyD-NRDZjkOIl71zkKnp6ta9HSpFA26AAxUIHepPVMZoA79A>
    <xmx:ZNatam38BcfJtmeWqFZHm1dJ0hofwYzhl-cBU2Y9IL_uGewtqTXlpA>
    <xmx:ZNatanMSxPyGvEyDDGETfCdDoOMDSjzT_wSRogMm1WvrKrfLxeknOw>
    <xmx:ZNataunTqQCeC25dD9HYralZp2xMeyvAR9ngW_lJhYxKmiWTY_pfkbc4>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 20:25:07 -0400 (EDT)
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
Subject: [PATCH v6 05/19] selftests/mm: make the swap cases' swapout reliable
Date: Sat, 19 Sep 2026 01:24:35 +0100
Message-ID: <20260919002451.496763-6-kirill@shutemov.name>
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

collapse_swapin_single_pte() and collapse_max_ptes_swap() swap a range out
and then require smaps to report exactly the count they asked for.  Two
things keep that count from arriving.

MADV_PAGEOUT is best effort, so the count often turns up a moment late.

And wait_for_scan() leaves the range eligible for collapsing, so
khugepaged is still working on it.  Collapsing reads the swapped-out pages
back in, so the daemon empties the swap as fast as the case fills it.  On
arm64 with 64K pages max_ptes_swap is 1024 pages, which is 64M a step, and
the case loses the race:

    # Swapout 1024 of 8192 pages... Fail
    not ok 10 collapse_max_ptes_swap

Retry for up to two seconds, holding the range out of khugepaged's reach
meanwhile.  The collapse each case runs next restores MADV_HUGEPAGE, so
only the setup is affected.

If the pages still won't swap out, skip: no swap, swap too small or full,
a memcg cap or busy writeback. None of that is a kernel bug.

Assisted-by: LLM
Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 41 +++++++++++++++++--------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 5318f3cfc0d0..13a2a47ab110 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -221,6 +221,29 @@ static bool check_swap(void *addr, unsigned long size)
 	return swap;
 }
 
+static bool swapout_range(void *p, unsigned long size)
+{
+	int i;
+
+	/* keep khugepaged from collapsing the range and swapping it back in */
+	if (madvise(p, size, MADV_NOHUGEPAGE))
+		ksft_exit_fail_perror("madvise(MADV_NOHUGEPAGE)");
+
+	/*
+	 * Retry several times because MADV_PAGEOUT is best effort.  Sleep
+	 * between the retries to give outstanding writeback a chance to
+	 * finish.
+	 */
+	for (i = 0; i < 40; i++) {
+		if (madvise(p, size, MADV_PAGEOUT))
+			ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
+		if (check_swap(p, size))
+			return true;
+		usleep(50 * 1000);
+	}
+	return false;
+}
+
 static void *alloc_mapping(int nr)
 {
 	void *p;
@@ -828,12 +851,10 @@ static void collapse_swapin_single_pte(struct collapse_context *c, struct mem_op
 	ops->fault(p, 0, hpage_pmd_size);
 
 	ksft_print_msg("Swapout one page...");
-	if (madvise(p, page_size, MADV_PAGEOUT))
-		ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
-	if (check_swap(p, page_size)) {
+	if (swapout_range(p, page_size)) {
 		success("OK");
 	} else {
-		fail("Fail");
+		skip("Could not swap out");
 		goto out;
 	}
 
@@ -854,12 +875,10 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
 	ops->fault(p, 0, hpage_pmd_size);
 
 	ksft_print_msg("Swapout %d of %d pages...", max_ptes_swap + 1, hpage_pmd_nr);
-	if (madvise(p, (max_ptes_swap + 1) * page_size, MADV_PAGEOUT))
-		ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
-	if (check_swap(p, (max_ptes_swap + 1) * page_size)) {
+	if (swapout_range(p, (max_ptes_swap + 1) * page_size)) {
 		success("OK");
 	} else {
-		fail("Fail");
+		skip("Could not swap out");
 		goto out;
 	}
 
@@ -871,12 +890,10 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
 		ops->fault(p, 0, hpage_pmd_size);
 		ksft_print_msg("Swapout %d of %d pages...", max_ptes_swap,
 		       hpage_pmd_nr);
-		if (madvise(p, max_ptes_swap * page_size, MADV_PAGEOUT))
-			ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
-		if (check_swap(p, max_ptes_swap * page_size)) {
+		if (swapout_range(p, max_ptes_swap * page_size)) {
 			success("OK");
 		} else {
-			fail("Fail");
+			skip("Could not swap out");
 			goto out;
 		}
 
-- 
2.54.0


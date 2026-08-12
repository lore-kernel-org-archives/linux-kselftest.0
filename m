Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EEA449B05;
	Wed, 12 Aug 2026 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540997; cv=none; b=gtoHtKv6QbY/zLBIcDd1cdNDRTnv9Mx9Wt3SPYz83HqspBp0fkEIppDLMROa8rt83qBLUCJESUYFAAxZyAQeH0Ksw5maKWvl6jyYiZwJIdf9zC0Dq21trxtVljnYYSYCKBX9TSYCrq8eL1ijVWPnZFYWuKyzbx+Rjk8tvWELX0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540997; c=relaxed/simple;
	bh=H0TqXrshxFAXwdZIal+W2xcXTqtId6iLEnI8xJeIFlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jqaCR7iuDZ9jpsemiVQepQdic9M74j2xhMiIVGwoNxu4U32Tk2q5q+6DJmq/8sqTjIlCkIP3QkcwEzU5w5+xh8HjYcZ4T9s1MZ27HmFmBp7s6nrD75BxXW1eiHqhLTgO5ugZjdObHhCZ0yVpYWVl34tGnGrZkun+GcDp8FhayA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=pRC/52Nz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DWl702yu; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="pRC/52Nz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DWl702yu"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AF2DC7A0106;
	Wed, 12 Aug 2026 09:23:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 12 Aug 2026 09:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786540993; x=
	1786627393; bh=QU5cOor2Ab9pLoeGxJ+Fiu9sKQhetOKhAO/atZ7UTrU=; b=p
	RC/52NzJJsirR+4TDQ7A08DdLIlBhGNLqUZLDkxE7dPfazDfVjp1DZdT9Ev5mShu
	vY+ADo1LybGGDNx2gTMaztsuRmpJq2ipzy6Mlx4Wy47ib+xRjHniNzlOgSrJY0Xf
	Cczpk3SlgHB4vjsJv/vMSwRDuH/4FxE6bRVExfluLUZ0FrYtUdaZPiJ7II4O6Kxq
	2wJETt5+E5omyL53ncUHwyT7uAVrNMTiOWBO5HDlD7Iygtq7s/7xgKpwh9kMMYfP
	xJqediQ/D7uRXY4LEJHIWG+9WIoEHq/KNmh8Kmz3MKh6L9yV8X46bJyoU0zIY/OH
	HKgDwLRPAIpMQZ6X6na0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786540993; x=1786627393; bh=Q
	U5cOor2Ab9pLoeGxJ+Fiu9sKQhetOKhAO/atZ7UTrU=; b=DWl702yuuHnkiOlUX
	X+ssNVIK6b19rNaaywVIH+CKKITcBO+w1IllVjvijCCevOg+gzviAqtL3LxMR+Dh
	e9sT1MgVr9NjCrV3xMFwckk2Wi205eEMHsDfds8zycdBrqCKaTTsYLMLUtZRtYds
	6G3git8eoEaKmP/dqMthOjignJOuMb0W4M/wDOwIXwLxOoga9XiEwM/ehwAwqkRo
	nHsexYmodp7LPUL3uDYsG/T5z3N2NrxbnaRyYBx53FwHRT8RKgN4oRauHcb8Z+rw
	GhHePx8sjGhQhe36kvNas2rczX0Ok9al/I8l6K2eKYVXxzaI3n9poYqpjt2Yxb4T
	AHP3g==
X-ME-Sender: <xms:wXN8akSNdxjty8FjrVFVq4atJOIHSwsm6vxvoTig3-9kDMY5kbe9Aw>
    <xme:wXN8atp9P0-TQXs_lq08WOEkxvF7y2TRnUXDK7ocp-gVihaxrgDZ4PkfmD8M-X08H
    htHQ2_KgqyFHC_hIVeQCXJpKXT3HVGbElE0CJuDqMkxUcoO3kfKBSSi>
X-ME-Received: <xmr:wXN8aqqC7kvwlVQ6R6L3IntTt4cOqhSoqgZkwq6gY2iPuJI8sZS334_Jt0E>
X-ME-Proxy-Cause: dmFkZTEWZPjKBYDoSh3uCuJ0ogiZvSuDj1RAgMuSmimalRft9LCPvZxyrluChLfTbkjo2r
    KkCK8Ttm4mqxi+W2/UjRoyI4gRuaMCGjIyoE2sYafZhhTXl0iIGCKEOr9/WVtZfHPc/pjz
    XsLpzK8U2Xu6F30SrJOujIlp1bmlomKUtpU/iiXSkRy6wwaI7NV8wAm1PQ0lHgRG0nCRKX
    WKIh8TtevEly/nhHwG2deu/klJhGkXN7h/CDYOOyqjOIkeF7MAFsC6fZtQDVeVkgzM4xU1
    Py5NrFUehZdXXi5LHUYxqNjNVNbuxWN2P2YJW6J2IL8s+zlVHHPN2YdKOlFVuMcbnWK9Qx
    kVqpeqVrcf8ZaStEY2VI8+3FWhIr21qDtmYPrSFHLNbwKtjKBMX5CJhId5vlxW1ejp+ZbT
    UQbEYHl8E0uRICu7ifmawK/TtGPzD9a2v2Ji8WOvraPW5mnOoDCNpqpACSUFLHEzdJY2xz
    +M5SOZpuG/y8PGt3CPQlLKczqCAHQeBmpGFllRpnfIT7qZqUY3cOJeUbWKswmuJkgk4ylz
    yXzzt+h9A4hT4cKZxd/tfRdcL9mdMK23tw3+UIvAnIz3tSRfwXHrJd8VaZt8wDmoxfTM8f
    ba6RfcTYpmZBdecltXKgKCyXs9QlX39+utlhyNGtdi4dYkR0EvMWRVCiudag
X-ME-Proxy: <xmx:wXN8ag2xck0-kwzlGXcsM8-96EXzfyIiGpUOANY4L6mhATkuUJjXPQ>
    <xmx:wXN8amgiLIIivL98e5ORdt1KHALqf7hw7F4WsLQAxSlc_nBOY4ZWKw>
    <xmx:wXN8ank8hUs69VOez2wkHs6R-IJstl9zt3Gm5ZH0Nbz3cFLnMm7LBg>
    <xmx:wXN8am-kPeJezlQoHa942CkfMuK8UJ1N0LZjVrvY1YGCnici9WrVLQ>
    <xmx:wXN8asaaZbFYvsPqbrPV3uK5WBCtn_CdFpZIncV3pH9NTeGEUia4b4b->
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 09:23:12 -0400 (EDT)
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
Subject: [PATCH v3 02/18] selftests/mm: skip collapse_compound_extreme where the PMD is too large
Date: Wed, 12 Aug 2026 14:22:48 +0100
Message-ID: <20260812132304.199287-3-kirill@shutemov.name>
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

collapse_compound_extreme builds a PTE table full of distinct PTE-mapped
compound pages by cycling hpage_pmd_nr fault-time THPs through mremap.  It
therefore needs hpage_pmd_nr PMD-order allocations in a row.  That is fine
at a 2M PMD (4K base pages) or a 32M one (16K), but a 512M PMD -- arm64
with 64K base pages -- makes each of those an order-13 allocation, which
the allocator cannot reliably hand out even once, let alone 8192 times.

The failure is not a quiet one: the case calls ksft_exit_fail_msg(), so the
whole binary stops and every case after it is lost.

Skip the case where the PMD is larger than 32M.  The MADV_COLLAPSE cases
still cover PMD-order collapse on those configurations, and 4K and 16K
PMDs are unaffected.

Assisted-by: Claude-Code:claude-opus-5
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 018b0698229c..48eb74c255f6 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -974,6 +974,16 @@ static void collapse_compound_extreme(struct collapse_context *c, struct mem_ops
 	void *p;
 	int i;
 
+	/*
+	 * The test needs hpage_pmd_nr PMD-order allocations, which is likely to
+	 * fail for large PMD sizes.  Skip if the PMD size is over 32M.
+	 */
+	if (hpage_pmd_size > (32UL << 20)) {
+		ksft_test_result_skip("%s: PMD too large for fault-time THP construction\n",
+				      __func__);
+		return;
+	}
+
 	p = ops->setup_area(1);
 	ksft_print_msg("Construct PTE page table full of different PTE-mapped compound pages\n");
 	for (i = 0; i < hpage_pmd_nr; i++) {
-- 
2.54.0


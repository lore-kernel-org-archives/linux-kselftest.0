Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD34F3451CD;
	Sun,  2 Aug 2026 19:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785700398; cv=none; b=Bz1o78gjG4mLYALV0QqTfCr/DqdDoF95L6hhxZLiOeYGLzh8SzpjbZL+VBP4JEysYxHOWutZfL9CtWsFA8xtR/d9eZTJZbde0eJlqzwBg35z12Gz/b4mhm8HGU/tvEMV/KOQl0BTf/oXS5ejkmc+budPNR+T9gvT6LXejlo7Vvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785700398; c=relaxed/simple;
	bh=NC8VzDQn9z9kSsn3cPI4FjgH2RnxYYo76F3S1YhILfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFEab2ScvXc0OMuXBJ6gM1hTxkCCMtfN0TfQsoOXZH1JJJxjbn5s7nrz8FLLXAUroaXBrGYBt02UN2yslYuomX9lJ8ytQ6z2Hq4q9hk6TE6/TjS6o3dqwtJA533CigVzBgoLdWFf2e5E4gEMemE50kVF9afxaOtJjyWaWpXh+LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=kNz7ivYD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=V/LoVwbA; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="kNz7ivYD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="V/LoVwbA"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EC3AD1400056;
	Sun,  2 Aug 2026 15:53:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 02 Aug 2026 15:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785700395; x=
	1785786795; bh=H44JK26m4Zj+SfIrO6VuSUoR2cZlhVi4rAW+EimBh4E=; b=k
	Nz7ivYDag2BKut0ro5VbcV/4kBFwahLe2YjpLoej9Jyi+ixkAEdALVL2Af47PFux
	J/X1n2m1RE3Mtml3fpY28gaQ50mjwTFpplW6PcV0/jivcGK1o56SVk65a4aTZWjs
	0blXcDeARdqn/juo34WKHZA3DpqC+q/VqME8byj4DKvM3J7BpCOCzczNGNvcEHnE
	EUt51VjqEokvRDWl/svtQ0CbWuk6oBFTY+bCJu0OoJgRK6kwTa9gEIFR3zHXkuWc
	B7OzMsDKcZpPzGR0CpVJynuWPWZ3ZL60OsnnSMBJ2V2V9d2lY33lG9tNk3V7/w/k
	zDGmIw1JlpxsvRPqeYy1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785700395; x=1785786795; bh=H
	44JK26m4Zj+SfIrO6VuSUoR2cZlhVi4rAW+EimBh4E=; b=V/LoVwbA1IbgqMEGa
	H24kE8AQoXybM2lBxYJFwN4mDDGYX7JA5OUpVY2eSRJXJxHvqfW4Iz8p74d8maUf
	TYIYFENy1CIp/Zbav4g7hx4Ei+NrlGhHEtzzJrwZ9E0we3CoV8ExZUAlJpIPCrqU
	bAljleKHnp4Dz9xoFpNfqaT7Gj9+RVEgCCSRVETi0TiiED1q1aMWOul5bnGF1KUD
	hNr9aaOrJESiBPIArQ55pX15/frvXqG5vWKPamWLsbzmsuwGihV3jI7/eS44aJak
	gjZXnJrtyZA7YcvOA/f7K2TJT5H6wCaRddNOomMcSVYwGIaZh4SDTy8zOD75mKo8
	bP8pw==
X-ME-Sender: <xms:K6BvakRh8eom8_Ld5GSEQkdMWuOrTn1_JS1yC5GcYl09VEGEiMichA>
    <xme:K6BvasQplTOME6kZ1Uya8aff57qkpjA11hu7aFpMB-grxSDtfKbkQwZgQfCuxCYFY
    CcIivhada8MK0FdWbAlsyJKV7VvRA6g0xfikiZJklqE83D_ikSmaoOp>
X-ME-Received: <xmr:K6Bvaux93rgGQLjmDdat9CQA0sFKmd4qU-uyKke-w4D_zMdWie_C79k62oA>
X-ME-Proxy-Cause: dmFkZTFcbv35QwNbwWPHQBcJdrWasH4YRFOBaNWig98oa0GgLD3LmQrthvyDgK5JnDhp96
    dBkNywOXlTP9Hby+cm0vRQHofuB4BhsdtVcBrMer/A2AOpegfr9Hr7RYzI6OqquxWhxeXC
    aB5bOw4cR5G6EDzO4v2r94SJnXRDYvi2NMwyCB/quID+suEuw0TjLUMYjjQ5pFm1F3OqpQ
    Ctej7rOharBpUeBz9hjZojzUlseCYYYMV+BulSa6+jD3O5m4ZOeULsSyQlLb9bciCyrhiP
    bT+z0cGYr8PFizBGTpPnPZCe+jZkx/DQlEsoaoSV2SjHlZpE6q2+n/t1AcZaLqu1qPGmas
    PhunGhbdXSVZZ0JW2Q7u2nd7H4XKfvnaBGal6+JQcn3sAZmJmQi/ZpIuGEya+WRJ2S+d86
    vxuCjftE5heNijEnl+FTv2HJYJjIZgU9pge1DM+9loyjS1KVWWWm/0TYqsnaUEWxQ+MIWw
    gG8Bj5uTuWOLL9k/NeM8rR66FsqQ09OYUZ8FlGkoxsmuh/Uuke9lLp3v92RwsVo8ecKtww
    TryvXTNqp/4AxVhP0g4gAko7bDM6IlXDicRZiOqygUSyw9IXXAuAeTnh/OHn8my296Jwm1
    uEBU/1jc1apLoQukcKLULVKlskI2rytGv0n8FgG4Xq9cXjyfAtOoDLD4jhCA
X-ME-Proxy: <xmx:K6Bvaqts2nQDudW01QQH8DIkKgJnWBGlaeYNNmv0PNhMyvGwKqNHKw>
    <xmx:K6BvalwqBEsxfUEs-kVa4pws498HnLspE54o5AEYlTYZPl3jjpA4QQ>
    <xmx:K6BvaicI3Zlqy-PQI2z3VPGQIOZPcUV2kwyU4FuEyJlLKYRYVWZtNw>
    <xmx:K6Bvaj37Gma1iABQWWCQQKcwidQqpuqsZBc-BBe9WfonAwZeX5MqDQ>
    <xmx:K6BvaiNjCW6LUDIX5UaIFKBG6pyQGm78sThDIwuE-cjopUTeq1-2rXK8>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 15:53:14 -0400 (EDT)
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
Subject: [PATCH 08/16] selftests/mm: skip collapse_compound_extreme where the PMD is too large
Date: Sun,  2 Aug 2026 20:52:40 +0100
Message-ID: <20260802195254.1937477-9-kirill@shutemov.name>
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

Its fault-time THP construction (x hpage_pmd_nr) cannot hand out a
512M order-13 page on arm64/64K, bailing the whole binary. Skip when
hpage_pmd_size > 32M; MADV_COLLAPSE-driven cases still exercise PMD-order
collapse there. No effect on 4K (2M) or 16K (32M) PMDs.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 81001e15765c..b43e060b4118 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -857,6 +857,21 @@ static void collapse_compound_extreme(struct collapse_context *c, struct mem_ops
 	void *p;
 	int i;
 
+	/*
+	 * Builds a PMD's worth of distinct PTE-mapped compound pages by cycling
+	 * hpage_pmd_nr fault-time THPs through mremap. Fault-time THP allocation
+	 * is best-effort, and this needs hpage_pmd_nr PMD-order pages in a row:
+	 * fine at a 2M (4K base) or 32M (16K base) PMD, but a 512M PMD (arm64/64K)
+	 * is an order-13 allocation the allocator cannot reliably hand out even
+	 * once, let alone 8192 times. Cap at a 32M PMD; MADV_COLLAPSE-driven cases
+	 * still cover PMD-order collapse on the larger configs.
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


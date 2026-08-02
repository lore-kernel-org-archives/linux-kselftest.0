Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6389B350A05;
	Sun,  2 Aug 2026 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785700411; cv=none; b=UHUmWTNhvhPk0MtMnX+LgTi+wOHBmqobLb5vql0PZcGqmg7KM8bv3cK2IOE/B3JcK1oU8ba0fHMPOatEehtag/PSma9RVoU4p9AiPfIUooaLAcaLlT6buSKa3D2o5q5S4ghqOENkenLYoXJTLJNT3KDqv64xAo12tyLzc0IeFdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785700411; c=relaxed/simple;
	bh=yVAibKXUJAe4Ssb1Y/vqUcEG83HlhIVvVZNLrC9b9R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JFTilBEYlul8hnjLBWTqkV4r6F2CZqmmkG4IpQE6C85wJjqzcBmywzGUcYnRbWS55Zc4eo8TKoqTsSpN6QIr4tD06pGtEtS198Mc13zx00FEgR2WtbScu2PcT9Ek2iAOKO0TjrOsoIgwbFZU2ubMs2QnLMggRYlnRI2qj3q5mEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=stznTiNQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FoLVHw5n; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="stznTiNQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FoLVHw5n"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id B1220EC003D;
	Sun,  2 Aug 2026 15:53:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 02 Aug 2026 15:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785700409; x=
	1785786809; bh=7FZW+EYif6AgDaxVaWyDapT5OvK8OdUCwgMiwqQSV3U=; b=s
	tznTiNQmqF5b2CZryy0KpGRsiV6OViYY7o2g+BDGldsxmmE3On+itwE4ig1lX7j7
	nQ8oNIvIRWhEls4xFBRnQ18I6s2Ov4YvwoqLRuS6q/tLkGcD6Gnyda5UtY77dHuK
	fvf7QIF8DFKFroWfbD7iZj7KZtAIqA8Iplv68qAP9WxzzAzGY/G6p8i+5rc7ENcg
	/fKraQHor5yns8BLROut5dlPG927qSWXcN1l0n1AmjtZcnMtMeGp8kNpZScQkFne
	VyCAEnBwHPClEs0x7MWgp7k9vUq0TK5ZnLuntmcvf0lUN7RTouUvQaMVLUHcZVDV
	jLrKdWxquKnCtW3WYXSxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785700409; x=1785786809; bh=7
	FZW+EYif6AgDaxVaWyDapT5OvK8OdUCwgMiwqQSV3U=; b=FoLVHw5nxx/F5py0v
	Qv+Z9yvEyjLh5uS3jW3LdLWXa30gKKbt/hdQDMutG7HrtIq8nNxzrN1B0YcEh/5R
	9UII/tnCBHRmkz/26Sc59oQl/zCOt4TyV0whjBkVJhu0IG4+PAl8zbzI+sM2wv2k
	+4z5Pxb1/3rjpIuvC1issdjLxznGlugOsqiGxc7jESe31jBvWQ2HtaQxQ+HL8edF
	jhC/0e1ZqmuATBUUVcvUfaYSeAQI8+PT+0Fj0OgOXMFbh4SrqyiE0OTBRDbzLelf
	vF0ovbSJPC7Ww1005CQcY8IKxFPkPYCkwIgGZfchYhEAwG3lOX9wm9oGk3E1Hj+p
	ssQIA==
X-ME-Sender: <xms:OaBvahh-9R6oNYXDo1ujSgu38lD7Ec1kpS0Oryes0fWFtevhAkMIVw>
    <xme:OaBvagjoq3YyqKaIDEiCqOVnWsXDhczNcdvXkHf9Qm4lEANRNMitJSXwaji_zWdS6
    woK2rv6VJYu9saMLVWeqk4NoQKdVwRwampI5IobVkw3iH4AF6jd7CdO>
X-ME-Received: <xmr:OaBvauCYLhcAZemYi8Q3UzhiLn3zhc2681MWMbuTV4fxSP70iGPGQ51nxtE>
X-ME-Proxy-Cause: dmFkZTFcbv35QwNbwWPHQBcJdrWasH4YRFOBaNWig98oa0GgLD3LmQrthvyDgK5JnDhp96
    dBkNywOXlTP9Hby+cm0vRQHofuB4BhsdtVcBrMer/A2AOpegfr9Hr7RYzI6OqquxWhxeXC
    aB5bOw4cR5G6EDzO4v2r94SJnXRDYvi2NMwyCB/quID+suEuw0TjLUMYjjQ5pFm1F3OqpQ
    Ctej7rOharBpUeBz9hjZojzUlseCYYYMV+BulSa6+jD3O5m4ZOeULsSyQlLb9bciCyrhiP
    bT+z0cGYr8PFizBGTpPnPZCe+jZkx/DQlEsoaoSV2SjHlZpE6q2+n/t1AcZaLqu1qPGmNN
    z90saZGKqwnA0OHicr5CRo1m0XGloodzuJN6K3LrYMdUc32o5HezHN5D6o7GxvEMVTCrqo
    Jg90XFZhCqxBOFcbyFx5zBccvUWjXs5XaDA8rcb4iouA/s3MarmqACnbgM0PLpelAVMi+k
    Hb7R+HOIQZfzGBH8GXPcKatXrPoj0/+8lcDKqGgqfAtsuODUcwMISJY2sznO+z4F83XX4V
    1zQ1kwEbWNbWIGFIs3sqYovc74Vqk85aYRlhMPALItw6p9oAb8/rNKP7CUhnrWRwko+1LA
    S1ErpvDI1RaQzESTmJ9TKO5XZAP5eeplJlBuAO8tJO3oOWoilwQuzOJdVKjQ
X-ME-Proxy: <xmx:OaBvao8eHQZS91AfBA8QM5Ksby3u4S2YHNGlsIR2pA_iv5WVXcZK8g>
    <xmx:OaBvanDAbMaRXuyaxYzlSKw2pxezxWRDkVmv5zSY_OXY9zCV7cKfZg>
    <xmx:OaBvaqvmqs4eTssPhayr-M7EXGlEMnb0oaOOa63gAjFHaGJduiZjGw>
    <xmx:OaBvanFRXXFFIY_u05n40tiEnj1uAFuc16kcG8QOGW9BqHlMl3sPcQ>
    <xmx:OaBvalcAEGy2CaMNUPVPO3Go97SELE7cZ9L7yzUjJN8EqsLyFjmD6uR8>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 15:53:28 -0400 (EDT)
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
Subject: [PATCH 15/16] selftests/mm: scale khugepaged's collapse wait with the PMD size
Date: Sun,  2 Aug 2026 20:52:47 +0100
Message-ID: <20260802195254.1937477-16-kirill@shutemov.name>
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

wait_for_scan() gives khugepaged a fixed three seconds, whatever a huge
page costs to build. collapse_full() asks for four of them, which is 8M at
a 2M PMD and 2G at a 512M PMD -- arm64 with 64K base pages -- and three
seconds does not cover copying 2G. The escape hatch does not help either:
it wants two full khugepaged passes inside the same three seconds, and one
pass over a 512M PMD takes about that long by itself.

So collapse_full fails there on a collapse that works. Measured with a
probe that faults 4 x 512M, marks it MADV_HUGEPAGE and polls: all four PMDs
collapse, with collapse_alloc=4 at the PMD size and no allocation
failures. Raising only this budget makes the test pass, and it does not
turn into a "Fail" -- which is what khugepaged completing two passes
without collapsing would produce.

Scale the budget with the memory to be collapsed: keep three seconds as
the floor and add a second per 64M. That leaves a 2M PMD at exactly the
three seconds it has now, and gives 35s at a 512M PMD, where the collapse
measures under 3s. Keying it on nr_hpages * hpage_pmd_size rather than the
PMD size alone matters because the callers ask for one or four; scaling
linearly on PMD size alone would ask for 768s, which is not a budget so
much as a hang.

This also brings the helper in line with khugepaged_full_pass(), which
already allows 30s and is why the order-parameterized cases pass at a 512M
PMD while this one did not.

arm64/64K: khugepaged all:anon 21 pass/1 fail -> 22 pass/0 fail. x86-64
unchanged, 129 ok.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 21a8fb24dc43..9213ce1658d0 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -573,8 +573,17 @@ static void madvise_collapse(const char *msg, char *p, int nr_hpages,
 static bool wait_for_scan(const char *msg, char *p, int nr_hpages,
 			  struct mem_ops *ops)
 {
+	/*
+	 * The budget has to cover khugepaged copying nr_hpages *
+	 * hpage_pmd_size, plus two of its passes over the mm. Three seconds
+	 * does that at a 2M PMD, but the same test moves 2G at a 512M PMD
+	 * (arm64 with 64K base pages) and 3s is then marginal: it fails on a
+	 * collapse that completes correctly, just not inside the budget.
+	 * Allow a further second per 64M to collapse.
+	 */
+	const unsigned long bytes = (unsigned long)nr_hpages * hpage_pmd_size;
+	int timeout = 6 + 2 * (bytes / (64UL << 20));
 	int full_scans;
-	int timeout = 6; /* 3 seconds */
 
 	/* Sanity check */
 	if (!ops->check_huge(p, 0))
-- 
2.54.0


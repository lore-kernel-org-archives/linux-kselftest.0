Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB3C64A91;
	Sat, 19 Sep 2026 00:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777503; cv=none; b=Ztg1ZoMaIm7TrzL8+DQB8xofgOnwYylp31jZZo2RbenXcXtJxuYBpflELWkxbz4Ds0wnu+2EwFZIAmOOC/gFxoy95mSQwEfJZTHUdtediQ8zEeNFv7VHP9MVLlfjBCD8Wj+M7UBnKuwwqbnv0AyMxxN2Vv5BdQlngZx/0LUtBX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777503; c=relaxed/simple;
	bh=W2HfU1srPKa1GnKZB50hCkDu/NdjzAz9+jIdL0D7zMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUcvuEGn2g/J+Nmf8iDHwwaVlVVn6p1Z2rj7CfiY48EkToGWipDM9DKMzRk1s0FPe5M+MdYANBrhpXNt3iN+98ns0oq6GhfkfoqdGbsayUh0VnZKxbFAxi/XnOGFT4cDVwFleRcsapwtlWLESKwNYgcA61qE2jegVkkS+6n9Tec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=jKbVWodS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W3Vq72TC; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="jKbVWodS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W3Vq72TC"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 05F8E1400165;
	Fri, 18 Sep 2026 20:25:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 18 Sep 2026 20:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789777501; x=
	1789863901; bh=Tvadg5PnjaO+JyB3jIAGCIC7KUlwEu9asx5MUc98HYY=; b=j
	KbVWodSA+B/CqaEXHYWQuWCYcGqo9M4Z8QzBSskiHvSL+vAK22rlxDcR6KlkKdZ0
	QjoGrQMdnGTPPmsVtlHLQ1mcbd+rm8KIYeYWPc1MmzqNH59+m1ozFMVxDQeolm7/
	/+0+1ek1ORfB297uPiv2ek0DLoyJHuTHg4o1hPTcsrJSdkei8bKfqXlgVnvT6jmi
	CVWak6Rb7CC8mHovQhhQInfGDOCLCJooBCsAsywyeb6/iBjF69665h901bMDsGkr
	AgBVhGLwHa28J5ubVohSb1tg7/aOctt6anmUFY1SKh9H2hGwhR3s+fJUt4U32Fhq
	0gyOd23dGUkYv/1G7IuMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789777501; x=1789863901; bh=T
	vadg5PnjaO+JyB3jIAGCIC7KUlwEu9asx5MUc98HYY=; b=W3Vq72TCPoDtcf1/9
	LO/wUW7jL+c4Ugac5akCOHVcS7Fl8zRMEp42qpXrNjduFd7GQgVTO0JvAEkCtdOx
	B1CSZtp/90GAB70U95KD1Cp8fpOrxw947yQyGNiD517UH1mn6fRFHhdRAVY/cH3I
	9aMBgD1CvE4j1OcuboSiOgsjURn8cgjbtOU138BPiXj1D62IxXR3Cm5rcFixswaY
	G7N6XQzJWNX5QSZSlmHCb2WUjfRt2IKyF8Pl8Az5WMzxNpXBup7Zm1K5Tx4gXDs7
	HwuAt78cyl+6yyGm/4zMYe7rBddiOLhp6jZB/9KtM+DZNynC3+550dThS5xTtouA
	clt4Q==
X-ME-Sender: <xms:XNataggQ2K1TYCtT6oMVlJoPUvwk7xbsWnCuE0_FuIP8brG9S3hB7Q>
    <xme:XNatahacCkXGSGks3T_YNvhNxPj38gT-c94Hah22HCdRu7nOQiwqtLItls1ePuXAo
    Z8VYM1pgsC26s6AlqOen8knz1ydYMe9p5nMWGdt4t1gwLetb6xlqRM>
X-ME-Received: <xmr:XNataqSRzBACeyT5jIzCtfzstpDmcYzYXYhbYDKpE5yNPRowGw_fB2fQVAQ>
X-ME-Proxy-Cause: dmFkZTFyC+XeKYnZ766rqTYe4SsoatN0doBd7ADemiperjFlmE10ggdkgYpZeWmNOU4aBc
    lm02WEvCO2QGG+A0SGXMzCjVWjDSVCQ5WJ/xmSMbLZJLqVjt5aEnrGd0hUbHPJ/ejcqjFa
    xrmYY/YNxh9EpvRrTjNMqslNp6oZ1XKAjj0b9YUD/U+Umt4HJhNRFStrIx7jR3Gf+CAD8k
    /TwEvtSve0+WgA7utVqBt9LeXDUSIUkf7dn/1M9JWIyORT8Kp2cNKrwYutOzK/Z35sBm5S
    qWNICJAq9yYROUOkEgx1cQSYtjkPP2DMZwKGXS3JxTiE+xMdBmJUepOSBHs3/DvnVTIMtw
    2JUZNzO3XtQf+ECyivU8gCQ3mPq0O/nR21ASeZ8wiqHq4vhuDkVDXyGnAP9iZreBgRlzge
    o8gf5broCgxBPTKv3nrKR50uDlFFuglaz1fGUy8vzBMvhz3CZ6OSlQypTWvSZzsEiaU/4o
    /vqHgwJ7B9CCZK13xRRxEzM5MMMxO6H/enQdxkRnQ7uikJj4CG+itPt52BaZ36xp8454wE
    FCFJzVqQiitn2P2x+lWUgCwtbCLkYRMilzmjYE27ZH7R1G1AJ0EWccBAuJRREaYof+HH3Z
    YheCIwHzJMTP5O55u6B1tUhiw0h1XUCcf4Ec6xZVdhKuxvXf112wOlIZ0bVw
X-ME-Proxy: <xmx:XNatapGMgV69beMW2fW16yM1uYC_i9h0MrRCXpSP-aHYSVHTqgTx1g>
    <xmx:XNatav2I8D6KGzdEL1bq_SvgdiLSk9ZTC0ifIE0KTwR2jFx9Fi0qhg>
    <xmx:XNatavsAydpkzlzE0olx0cgKIriJIg8hLbIRr_Fz4-yJqBnVw_nisg>
    <xmx:XNataumWzPNhr4Hew437PGmWmB5vIOEC2oK-icmZ5Q1flS2IbwmC2g>
    <xmx:XdatakIEQXXeE0mJRjx3MNfgJpvDBUnafU08Xc-Xrw9wwSI5WLeh9Goj>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 20:25:00 -0400 (EDT)
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
Subject: [PATCH v6 02/19] selftests/mm: skip collapse_compound_extreme() where the PMD is too large
Date: Sat, 19 Sep 2026 01:24:32 +0100
Message-ID: <20260919002451.496763-3-kirill@shutemov.name>
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

collapse_compound_extreme() builds a PTE table full of distinct PTE-mapped
compound pages by cycling hpage_pmd_nr fault-time THPs through mremap.  It
therefore needs hpage_pmd_nr PMD-order allocations in a row.  That is fine
at a 2M PMD (4K base pages) or a 32M one (16K).  A 512M PMD -- arm64 with
64K base pages -- makes each of those an order-13 allocation, which the
allocator cannot reliably hand out even once, let alone 8192 times.

The failure is not a quiet one: the case calls ksft_exit_fail_msg(), so the
whole binary stops and every case after it is lost.

Skip the case where the PMD is larger than 32M.  The MADV_COLLAPSE cases
still cover PMD-order collapse on those configurations, and 4K and 16K
PMDs are unaffected.

Assisted-by: LLM
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index c44bc18f7536..8a6d708026b7 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -940,6 +940,16 @@ static void collapse_compound_extreme(struct collapse_context *c, struct mem_ops
 	void *p;
 	int i;
 
+	/*
+	 * This needs hpage_pmd_nr PMD-order allocations in a row, which the
+	 * allocator will not supply if the PMD is very large.
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


Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0064503F7;
	Wed, 12 Aug 2026 13:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541001; cv=none; b=HiKkVQ6NGQ9il0j8hXQZMCEsaDXS/1JM5yFutM+CV2NzP7KrMccdhI24xKjTv95f2C2GwEI25hhoYSmtY+T5eQi1o5idAWwz95rgryDD1O1iZ85f5N0Dr4QmVw2YQFh9p45478Sm1j/vWeiGkWcsO99d80BZI2q+NeKBmp5Ells=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541001; c=relaxed/simple;
	bh=MCFYuxTEdi/0ELeKv4opLLuRr3T+vXEvJTsuz8bC+os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dvl3BupGgHNhww6oEN5csq9DnLTX+yBW3ROl6Lk1UZjL6RSK244EPFjnybqeB4KP5y7ixciKgcabwv/K/DYnk+by42CHTd9L3iXk6g9qIxbkcTPwrWaTVFYcM9h55e1DlvYs6JBpY9LB7eLLJoPJYnJttGX33h6MjXLeFRV8yaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=hWR6F651; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WBxWWHuT; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="hWR6F651";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WBxWWHuT"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1042F7A00D8;
	Wed, 12 Aug 2026 09:23:19 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 12 Aug 2026 09:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786540998; x=
	1786627398; bh=DF6XlsE3dfRr0xz9ihNAdyd1y2VRfqNvU66IRArOZEQ=; b=h
	WR6F651wjr7kxuKTtzxDR0x9diJvksCsJp8s6NJEtgTnAxeA5FCMl0hhZ6kAvvxr
	gTainIu9jqgofPJKLylovUYHVEQZAdQfXrKCcyo36cWA8dDexeOx4kBRJ6CPwdgh
	30G/hgL811VYz97ehy1oxWNjMlhEEgVJvlBs0udJZyPGu88vjJIGfi2sgqS/Ha2z
	U7WTXrFaOpiUGf6foEV03P0U2mT4IwxSxiZZCdcvVkgjiyLsLfQa3f00rsApdI13
	QEIHQ3OLXWsQY6PKquk7ZQDMot7jLHOJ6w++JKee5Sazzbh/AmFwqcq5Zqb8ZE6s
	ByPDZidU3a8AtZ+mlbfdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786540998; x=1786627398; bh=D
	F6XlsE3dfRr0xz9ihNAdyd1y2VRfqNvU66IRArOZEQ=; b=WBxWWHuT6MDoSl//n
	MJYbu/wzrDKD0JkzyGIqXAPcL/VtLdp02tydbvPq5iUiU5g0BCR9IJ7EqHkK64hl
	g3NTH0macTaCkGjfaI3UEkfVOF+OgO4Xs1KYPsl+Cm5uQTTeq3E8Xp7PA8otJQqr
	3hg7zsTSa7MkiWpU1cxuEf2fnescopubdtpqkx6RIV7i2T69xp/Jn3/fxZDAN8hL
	zjWmNWNS0QCM3GLA2/1IM6nENYFLuaZV3jqM3FAgA1UQ0+WaV7HdH3uz/oZ8fEUL
	N0u6HHQTygdH57XsT5LVvc1h/TAFRkERiRq3ko1Xu13q1zdbq6oCioZstDPTbZV+
	dTLzw==
X-ME-Sender: <xms:xnN8alNvZ8C2Z7r_88B-55yuKlgj1JZri_dGl0NyFZCGsqO8UaVrwQ>
    <xme:xnN8ar4_vUIGzHZUI7pDhDQ9wvGmdmWVUGdMl0AkohN34VFna_VnsAVZXtWzErX84
    acmQS92HtCd4eV_UaV4r5o1aY45hnzBSNelT9ghSIEc3GLpC9IZH_Y>
X-ME-Received: <xmr:xnN8aswXvkFbn4FEcjGtvejP0-369wDtkdU1s2s5DsIqpEcg6tcBv62Cfn8>
X-ME-Proxy-Cause: dmFkZTFzqtrNoSTXX2MRzKyN6p8XXqdjDSX08KYyJpXp82eYC1ae2GegaTOhbDzreYT/K0
    OAsc1zsfjWszwuQXvOMxV3FM9x50+HqAsA48u5Kq52QtHo+TJJPCEG+EOeKn5Il8AepNuY
    amkSO7LHncjzMJKy/SPUs50UUrTlzGP0ayf7b+h/q5NreZMQSrrfXSzcd6tsdBCg4Hhmbc
    7COQKDHpqWJD3HpoJ7/Bw0J3tcRV9tZIkmRGQ4nZ/O76iTBc+eN6GYtayu9aLLTJal0DNN
    hI5LqlugC7KhSFwlZIIFqKKnJB7XY7vZnEBEdRJ8Mvpq9sE5OflKN5J+H3ujbniJsnhlYI
    xji+6SmTFIQHxOuLmkmDVGavg0RuSKJZF7XoXVbUudqM9qjcQTvodLsb6C8iCX1SNL3Pkr
    qTC/Gfpp7WJRpjVUw/htERWzSW6ctrDxWN5OIVKdPBe6rx8N/aiFz6c3DafXPMeq8VXFAi
    6HVJlDqdRrV1tnvNqxl55teaK4UWpOdAfeUZk48tdS1rF6SAsYdUiF+wPN5/GM2xKWXzP2
    t7JYdbF+su8Sh0O5pXCYqk8pSorwSfj/04N2pbZTnhDX9EacJQuHhurJ3mQzqThkw/jYu9
    y4zbK892IeTWKp8C8x/yjYr8qVLaPz1JQ0vN7l8zE0Ssb5TNjrJeYffjqKuQ
X-ME-Proxy: <xmx:xnN8arR6PRGZRpXgSxEZKXRwqip2jYCGY4rmwH9MmSaP6iD3pDY8oQ>
    <xmx:xnN8ak9JI5hg36g_OKUAiJtwnvc7kGUnK3JaJRFh9g-Vo7HXwDuYpg>
    <xmx:xnN8aoJCAJEvV18qaUTOl9HHXNzlufYSK3cgu2vkrTJtcEFAXjr3nQ>
    <xmx:xnN8aotDplR0S-hVAhF1erIdmB_It2LVyTJOKU45vlpb_UtkutnfdA>
    <xmx:xnN8atsajQjH75xlROuggnLnMLv4AY-lqqEgYTxoX3gr6BfD9LlPbYvm>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 09:23:18 -0400 (EDT)
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
Subject: [PATCH v3 04/18] selftests/mm: skip khugepaged page cache cases without a PMD folio
Date: Wed, 12 Aug 2026 14:22:50 +0100
Message-ID: <20260812132304.199287-5-kirill@shutemov.name>
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

The page cache caps folio order at MAX_PAGECACHE_ORDER, which sits below
the PMD order where a PMD is 512M -- arm64 with 64K base pages.  A
PMD-sized page cache folio is then impossible, so MADV_COLLAPSE answers
-EINVAL and khugepaged passes over the range.  The shmem cases ask for one
anyway, so four of them fail and the run bails out in the middle.

The cap is one global, so it rules out every file mapping, not just shmem:
shmem_huge_global_enabled() drops the PMD order from what it allows, and
file_thp_enabled() refuses a regular file whose mapping cannot hold a PMD
folio.  Skip both mem types when the PMD order has no per-order
shmem_enabled control, which is the readable form of the cap: that control
is created for the orders in THP_ORDERS_ALL_FILE_DEFAULT.  A run left with
nothing to collapse into skips outright.

Anonymous collapse is unaffected: its orders are not capped this way.

Assisted-by: Claude-Code:claude-opus-5
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index a5ada78d90ee..c049ac997def 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1391,6 +1391,37 @@ int main(int argc, char **argv)
 
 	setbuf(stdout, NULL);
 
+	/*
+	 * The page cache caps folio order at MAX_PAGECACHE_ORDER, which
+	 * xas_split_alloc() puts below the PMD order on arm64 with 64K pages.
+	 * A PMD-sized page cache folio is then impossible, so the kernel
+	 * refuses these collapses by design and there is nothing to test.
+	 *
+	 * The cap is one global, so it rules out every file mapping, not just
+	 * shmem: shmem_huge_global_enabled() drops the PMD order from what it
+	 * allows, and file_thp_enabled() refuses a regular file whose mapping
+	 * cannot hold a PMD folio.
+	 *
+	 * The per-order shmem_enabled control below is what makes the cap
+	 * readable: it is created for the orders in THP_ORDERS_ALL_FILE_DEFAULT,
+	 * which is the cap and nothing else, so whether the PMD order has one
+	 * answers for a regular file as much as for shmem.
+	 */
+	if (!(thp_shmem_supported_orders() & (1UL << hpage_pmd_order))) {
+		if (shmem_ops) {
+			ksft_print_msg("no PMD-order page cache folio: skipping shmem\n");
+			shmem_ops = NULL;
+		}
+		if (read_only_file_ops) {
+			ksft_print_msg("no PMD-order page cache folio: skipping file\n");
+			read_only_file_ops = NULL;
+			read_write_file_read_ops = NULL;
+			read_write_file_write_ops = NULL;
+		}
+		if (!anon_ops && !shmem_ops && !read_only_file_ops)
+			ksft_exit_skip("Nothing left to collapse into\n");
+	}
+
 	default_settings.khugepaged.max_ptes_none = hpage_pmd_nr - 1;
 	default_settings.khugepaged.max_ptes_swap = hpage_pmd_nr / 8;
 	default_settings.khugepaged.max_ptes_shared = hpage_pmd_nr / 2;
-- 
2.54.0


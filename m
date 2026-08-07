Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8E6471250;
	Fri,  7 Aug 2026 11:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102625; cv=none; b=njGz04mkUMiAfrL8i2S0qKOLHmbkFlw+lIcfSfLuC211iKJNMv2IFu95AIDQYgs//FyIOjUtrDaXURXTTSdNbarCaJhsQAjHD+asRzKGMezJYS3ZRf0ia4phMqZELN0HQo0/SVLd7qc6epv7EZwvbjbC1ZI1KTu5Wah19PoRGA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102625; c=relaxed/simple;
	bh=QByATvCRuQCNL2ZnbBirX2salSuSQ+wbWK8XCWZ5bbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7iGQqjWClImtx4g+1ikHmOmvDIKUM3iFuzfkzuHMmT5MYwak4nfhZAM9/GOQ4FfAc5Ba0wVhFWAmg05ZqJJSABRo8CaWvgeed1qr7PpHOk3rsoFx8sixLFyIA5/WimVLHNgNOrbYV+iR9sBwK1FL5dyVC5ysUTvgjVIs4R4D4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=h5zdipvp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gssPUSgF; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="h5zdipvp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gssPUSgF"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0D1587A00C4;
	Fri,  7 Aug 2026 07:36:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Fri, 07 Aug 2026 07:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786102618; x=
	1786189018; bh=zfbh3GHFEDkfsexwK0f+yG1zta9ZtoxopU3TBc0ckuA=; b=h
	5zdipvpvC02jD1Mf8nIqPvjVbTcuzSYiXHGXFxb+7el/Svcri/ADkztxbLz5GWL3
	KqfGfeF7oWtK3HIa2iebgzMTmX8hVd2q1d1vWi52xdzrdFR45O4HcAAQh05g/c9o
	2qOukZfHTa4OiaUzl86d/xnEBJ7QE4/gaQYEeUj+hoKYH4KKQoLm13HkE49dT540
	g7zq+5u+63wrlJttq/T0ie8rKfBGbfg0JcKHnsw7B/x7j/4peSbAQd2iJ8knd+Xy
	u8erj9JSdUMy2gl5r71rsM72CNrwN8lF1YP47VYsW/CTl8qVeieJDWKwMpR+U93/
	4evmsh1zumRZw9vjclrpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786102618; x=1786189018; bh=z
	fbh3GHFEDkfsexwK0f+yG1zta9ZtoxopU3TBc0ckuA=; b=gssPUSgFT+Q7INiV2
	tQ1/YcEp833EIqd+keLsa6xOPmgW0gQlR4bZPJUnvaoOtQm8kJHA/v4/3YL1Jm6L
	YwZvYMF9sMlMok7tgJT8XrMUP+3oDe+1veAwjdAiR/PN+RKIgtHAr8t9IlUhJcQl
	c46NfKWL3XuCCdbbYf16kmkSV3u2g4ZTtFYt4bRd6wonYMfLs9QrNWYjhtwTDDiO
	dS7+Q3arOWlkGrjB30NABNDSFtB9BH+uAm4i/+XZ3TN99dOOfsaxCrM//85El/XB
	L8/SiYsVD5lFT6xDPZ47cgl1vu3mh4T02YGFvEJnKEvro8Rgm4/7i3Daa8y9ifJE
	2z86w==
X-ME-Sender: <xms:WsN1ajxhdv31ugW9kEmmV0CNnu3z6wPvJaFttsmDtu_ELA4y8zbORw>
    <xme:WsN1avOVPcAmM-9DgFTmfpOOPto6j_-iYOjsout26Zbei3C1s62ht1RJ84Nh9u87j
    wPAle8csmBC8HDLYLm00Ox4DKiJWZxsfRqFzSOvYGXW4PuNDC2fBrUs>
X-ME-Received: <xmr:WsN1al1qsm1_qo3RhlILNBoFynolNwu0n_Oh1rxDoEc2pJLk65V01he_ebk>
X-ME-Proxy-Cause: dmFkZTEfW3x2Qrq7ELqxlr/x69vk0aYaa/E/2AWrFAl7yu0Vg+jIGlS0mjOCk5J5e5/NJH
    T3J+l8M+cQ15gxg/u6FQhwxKudsrf7tN5cWcEThveGDS0KcOU0uMrzGx0YBmylEV4PfT2X
    SbTqClZY3SINVohR/2NzYRxeOu5tU+SgKqY1sS5oM8U15+ky277S+G1Ww7YAUM5Z6EK46p
    TQK1COWwyEQl/dhwe51H5lWCLFzTj8K9hkk/JBO/DvOgEgoe5sMihzFP04eKTIrZCF8dte
    tQwhoNU+zszgTlPncqprVsvTwAgpjyPciGBDZXKQScTz4u1orAuTZg8Fi2VomZsbF2qQaQ
    WX9kdIRFJUsNCeKzkNq4ymbXB/KQlMUzSHaY6cbAlDEBIXeOB8GtX5Jz9IxAs98YfmqVys
    qUOg8y01tLyLpPI4SZiwG0rtop3WKpCDrjgtoKCBxJBbeU2IEMYlxdlFMk+ayLhL+ZdCO/
    Y0kh9rPsL4eHcdlVUWt+xNYtPyuayojfxejvL8/ENVfvKva7UlexDsqTLfQFmefHNhwFLC
    NeoOEpJKUI6VIxeoPeAmv8h5L4IhZEzFBGCicLsjv4uRMpUGftkrAuJrOk0BYmnd2IBnr5
    AeBmqb+s6xoyvl+j5St0J+JNuAsOzEMoing/A1ja3RJXzjvRKr2LdXQOvUpw
X-ME-Proxy: <xmx:WsN1anHoHiakJwuHo2xNTPLJeVUkUbp_26I55ofeE_gD698vgR-5zQ>
    <xmx:WsN1asjQ8hR_hTycDaX3luy7QfV0udqf2j8UotQ6Eee3Nhxiqss_JA>
    <xmx:WsN1agenn_oNmPbYa-scVgvrhpz7Yv4YNFgtUch8XmlPjmrC0Ta1xw>
    <xmx:WsN1aiyOb4K1irk1ZVG_BYoDfnM1eHDC3M193Le2i1SfjrKFfWqlJA>
    <xmx:WsN1alSF04gR_c-3msl0R029L7vEpaT0libcMEp9GS2lCxmc8nH2GOIV>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 07:36:58 -0400 (EDT)
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
Subject: [PATCH v2 03/17] selftests/mm: skip khugepaged page cache cases without a PMD folio
Date: Fri,  7 Aug 2026 12:36:33 +0100
Message-ID: <20260807113647.3744609-4-kirill@shutemov.name>
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
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 0f828bfee31f..9b1da0dd0f8e 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1424,6 +1424,37 @@ int main(int argc, char **argv)
 
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


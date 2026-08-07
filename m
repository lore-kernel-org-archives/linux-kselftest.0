Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D9139EF25;
	Fri,  7 Aug 2026 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102621; cv=none; b=V/6lgc4ZrQ/kJD4yLwvXIfvwbVfw5wJQPlWDFg71Ld6nAec7xynVNI607GY95/OqrbjLJQNtWOabVenh+/IxK4+H3VjaXbm0vnne453odUGlB/zj/gHySoOilHlEFPBUun6zp8/uwykLnDNx/ajMP4/V6Hibu6yZjEhj7mW8Uwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102621; c=relaxed/simple;
	bh=ZKss5qEILIcku0QFzZjkA/LCUL/jkVDVD1M174XIDfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sFqhSamMPIx1T/GrffRr4h//+ymeMSdjL2QSi7GJ0f1xV4zVIdep811AzNvvJpzHwMZgmro7UkW0PSVOiMOyie+r7cLvPsCltto+EKE4+RUj8puagBdSR2Ez6mEQ/CEdq6n6IJTfdObEBbXoFx/LfN64X885J5rBEAqp1JXT0nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=wRFTL0rL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G9yXMvl1; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="wRFTL0rL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G9yXMvl1"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 638D47A004F;
	Fri,  7 Aug 2026 07:36:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 07 Aug 2026 07:36:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786102616; x=
	1786189016; bh=cIkdUEAwCGtCQWq2Mp8sW0xlTg8F6TBRnofJ/Fu60Hg=; b=w
	RFTL0rLMg4rHvQy8CWUQTbL2oYxVyCUHhwNRnLoht0C1AO7XQk4knl4UYUOTs895
	NCaUt70pAyVx+AO9jT5WzXPHmBKxdZb2sx7CXeQSi7GqWcI+YnnkPymz3gpbQDLT
	OazpJFPIGINitOehdRW1p3xiXQd/mS7FZy3qvn20cPF0HHPNqA6s6aA6xgIPgU9m
	7IxncNPZlHIsQyImxY12xKFEXo7zWbuOMUJYl+2T2brGgubvIz4v1EzI7P/kWezA
	eHkKpVBOeiMl8+6TC3dPxxA++4egmUWSIaWSev9uQJGjL+pvjE0wZ+ONNNNNIRTK
	TbVVCiK8ZI/l5RKEhH5zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786102616; x=1786189016; bh=c
	IkdUEAwCGtCQWq2Mp8sW0xlTg8F6TBRnofJ/Fu60Hg=; b=G9yXMvl15P/EqLODP
	h29CXXo6hMefBq7R0Vhm+RJpa0l0UNQVFna/dDXhn5vjylMS83MJYk5he0uAeZkg
	4XAq97piv/yjBwsIpUUHJItcCi6CSuJBilQzlqmjAM4M5uLLSdzAfxsLoqy+yEsQ
	y8inpySpQnxI5aH4/eZjPxDrXyc5W/tFlxIlWWQcrt9cDpWiEL1DQBi8zQCGVanb
	NjjlKhVlpyqy0M8+CBBzWMWos1l3uAq/KnmDkIgRPRtmWkvyvxEPNaBk7i5EpaZO
	mFtF0q7A5z9vDMXvQeEDNsPoLLbmhFbDo/0NtsTrMV9kBQfflflRWQQoFSDMTUjQ
	9BaXA==
X-ME-Sender: <xms:V8N1avJ_IoKeh4t6Fp221pkLeK8qUHyykUbThRIaQ8xq_ie_LoHkwg>
    <xme:V8N1anEt5gQwsvNVKGwdIyc1FyNyblhbZpF2vHUugyDYZdCJXOTvv3h_p4TXthnyL
    57vSiJ5ELj02e2rBeKZQJ-fgHbflEb7uMpNMajx1GfoyKFt-4290HsA>
X-ME-Received: <xmr:V8N1agMfvg1fiaT-XGns7E6_fK9CNVbM-Us6kLi48-53IvvaGUx7sI06rA0>
X-ME-Proxy-Cause: dmFkZTEfW3x2Qrq7ELqxlr/x69vk0aYaa/E/2AWrFAl7yu0Vg+jIGlS0mjOCk5J5e5/NJH
    T3J+l8M+cQ15gxg/u6FQhwxKudsrf7tN5cWcEThveGDS0KcOU0uMrzGx0YBmylEV4PfT2X
    SbTqClZY3SINVohR/2NzYRxeOu5tU+SgKqY1sS5oM8U15+ky277S+G1Ww7YAUM5Z6EK46p
    TQK1COWwyEQl/dhwe51H5lWCLFzTj8K9hkk/JBO/DvOgEgoe5sMihzFP04eKTIrZCF8dte
    tQwhoNU+zszgTlPncqprVsvTwAgpjyPciGBDZXKQScTz4u1orAuTZg8Fi2VomZsbF2qQAb
    k5JRNRlEKLgml6X7jbsTp0jsLf6g6Zd60MuoeVfy+Ysl9o2kZSA454ZGpdH/QaN/g9nDo7
    Lp0E+Yj9TpHDuTjBVlhsxP8CZiKBTsCPvulUuJTHqivMavkWvjquz4yvRe86vfQpe23O4r
    1YFtj5pDmVh+VEGw3bu3Yog3PVDXHZzc3fvQQ6UPbSlg3BvA2YgbQnlcHDtOWt4B3F4Fla
    HuGj+NlZ8rQdbbE1TBNrzJDV2TzID8bIeJ1Pbxpd+JvxADuRnrA77ZhfcLIvYV2PfbMZyC
    QoVrNtpUIdiF3f1AWD8fIQLDdou5dNdL02HdxcWEF/EHF6S93onH74yVe8xQ
X-ME-Proxy: <xmx:V8N1ah_3b0wo6y6lfe0vtOmnrmrQnPQwdIUhhR7GnNLhrZr5JWcJJA>
    <xmx:V8N1at5kDqUUbu_3q5mhFBgGdvnvHOFkCHuMxuG12h7PC4kMAgdwKA>
    <xmx:V8N1amV4sbW9zjC2OlXTO_xC2Ta6RfiQfKLINFbt0-tWgFlh-SF1Ag>
    <xmx:V8N1ajInyLGwSk0Ktgnrhw7UslU2aNXwHefb4Gsp5ornqnwIim9lSw>
    <xmx:WMN1asM_sngPdlkaKHy-zptFAfLysXjpkIDZROomQzcoYaIuhhWLvD8j>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 07:36:55 -0400 (EDT)
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
Subject: [PATCH v2 02/17] selftests/mm: scale khugepaged's collapse wait with the PMD size
Date: Fri,  7 Aug 2026 12:36:32 +0100
Message-ID: <20260807113647.3744609-3-kirill@shutemov.name>
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

wait_for_scan() gives every case the same three seconds, whatever the huge
page costs to build.  collapse_full asks for four of them: 8M at a 2M PMD,
but 2G at a 512M PMD -- arm64 with 64K base pages.

Three seconds is thin at that size rather than generous.  Across 80 runs of
collapse_full on arm64 with 64K pages the wait was half a second in 73 of
them, with a tail to two seconds, and the case has timed out in a full
matrix run, reporting a failure for a collapse that was still going.

Keep three seconds as the floor and add a second per 128M to collapse.  A
2M PMD is unchanged.  A 512M PMD gets 19 seconds, which is headroom over
the observed tail rather than a measured requirement.  The budget bounds
how long a real failure takes to report, not how long a passing case
waits: wait_for_scan() returns as soon as the collapse turns up.

arm64/64K: khugepaged all:anon 21 pass/1 fail -> 22 pass/0 fail.  x86-64 is
unchanged.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 51fc1f04d0a0..0f828bfee31f 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -602,8 +602,10 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
 		int nr_hpages, int collap_order, struct mem_ops *ops)
 {
 	unsigned long hpage_size = page_size << collap_order;
+	/* Three seconds as a floor, plus a second per 128M to collapse */
+	const unsigned long bytes = (unsigned long)nr_hpages * hpage_size;
+	int timeout = 6 + 2 * (bytes / (128UL << 20));
 	int full_scans;
-	int timeout = 6; /* 3 seconds */
 
 	/* Sanity check */
 	if (!ops->check_huge(p, len, 0, hpage_size))
-- 
2.54.0


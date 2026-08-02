Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1103446C3;
	Sun,  2 Aug 2026 19:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785700401; cv=none; b=QnBocaib2T+0LuyI1VASVluRde0FBzno1usqnXwi0mK43oFcf+ebVAcmSao3T+lgAUVTeemE+q1XV1g2q1B8BB4LZq/1HyQqgieyLXfdo/KeqBn0Qxf0TTkl8tardPyMRuhFkl3ng8HpPy84xQ/ScwKuSAQcRwOCggvZJGF9aOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785700401; c=relaxed/simple;
	bh=0o1ANBHb+OcjUVgiryl/ohA7RJ33c27OTtBRvP71Ung=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYY1nGvU5ZHDB1XpSu+wAOCVU06pSzIhzMP83hgDIw5y7bpjKTtDrPUHty8gaJ79RHskRhfxM3TZFUtfniv9+Tn903Eh5KSwuQApkj2FnWucN0dLPPpf5swhe3Zs9O2YWHWwPr8oX+GDxCpMdKg6HimwZh9P6JeH2cuvS0P10hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=bqON5889; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hE8VvX7+; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="bqON5889";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hE8VvX7+"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id B1C69EC009A;
	Sun,  2 Aug 2026 15:53:18 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 02 Aug 2026 15:53:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785700398; x=
	1785786798; bh=6xebinTgPoV/REKfvrBQ0nYwvMKhYoD/4B/S862zW6w=; b=b
	qON5889okXS8B1oWXPaDR8qp+/n5teUB2zsyksoLxyqoYewTu1ztJjQNfZlnmEuL
	m1xL2ZvhoRdixkCDocemXyVc0XqVo7pBGtxibKQE7NbXKZ1K3kWf3Y/tgnIXK1PP
	tjHuUAsh3NFyiCHQ6qiEZzLE6Gy0jW5XE4Nt0S+ETtWS1gSa1zQmAVYfDyl4ypNJ
	lPWDziMWZneU3JIDQ43EmUDNHBPlfIFOE7YfJ/+09KSL99Z4tIvqaiAohISXFreb
	VwSSRpAqJ0Me0z98SZDxQV0CQP3CRLO50kz3/SYOTGQF/ywTYeinQ4kcVFw+79MV
	K5MlXvjO99sWOJHeGxOqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785700398; x=1785786798; bh=6
	xebinTgPoV/REKfvrBQ0nYwvMKhYoD/4B/S862zW6w=; b=hE8VvX7+zKm4CDLIy
	t7tRCnXrDMfIeObKHuUH/IhinMtuAv99EJqQexlcfzBnPqrfBQeoOzs9eAppC1iA
	hfAEb4IJntTrBrTkaDyH5K0PQ9wKRImh0dxLtJwkXfanA2rPg/OsYmqtThEhf65I
	zk74HJX2dsTVv7eJHUIJH/oMGSGGCyxHn5JRbxnBcnzeJ5fw418MYVR7HdEErjb4
	G6ZHVX8TtJsLT5V6ApPURJncyT31kxsBXnyspFQJjPJEELvnXrxYaG3S4FjnSc9+
	bhY+HwEsFsnQo3ErpvgXswvvB51UoSSobLNhLbv4kpfaBdq/gyzbD43LOt3FrSx3
	hhCRw==
X-ME-Sender: <xms:LqBvahGlzspf5ju2IeXqY2KKtzWiNDuOoxoonRfQCiPqHHMjpOusDg>
    <xme:LqBvag02sZbYuc_K0ajsPj13DJZ2mEry26Kc3ZoSkEhC3-ribd2i6p5GJfKy0C3JK
    n-1cGEzwS0en3rDdDHcF_rb91OJqW2p9bpo4pMme7Na91IBG4kjdg>
X-ME-Received: <xmr:LqBvagFPJcBl1FDBTJf1G8il8zvkfVbxjfOt5h3kLnKG72TQgDDkJY285oM>
X-ME-Proxy-Cause: dmFkZTGeN1xI4bt1iclSzDFip0Bk/XaIhvbS/8i3JSTXfor37WXDF+RcNWPPd9pfiJK8Zw
    2BrRRh4rnHFGERiD1jpqkpu4TBSJEj+dkjcrMZ9PB457VyyAOaPr9tioF0eAgQ73LLdMGf
    ZnUc9d7R5xpl56ih9w8zQdF1AdPa5yFqJeaq79y1FNmaYwVg1fW3ZavvRb02VDPCTYSs5n
    EKi2mK0TcmJbPEDbjm1vybeof8AWtEC76nwVjuGNoLmfYq44vTWlCkOqLjX+gcHHM4Q7iT
    SPI3JBSpkIfgjo/e1nwt56byN8xWT3gnCcQMRcCsWQ2AE9kBILBwP01Qmf1NZFO2elKCT3
    V5Arm3Bh+UsFV8y9PS9UPHiLgvZro7zrpchUVgZEU5FRJZjfxrFJ14Bw/Qv2jtwqIdSkfi
    gvYyr7fENXm5B3vCTZS+UKdbhNWKrdW9LM5SC75XCXLj5IlwDB0ne4onZl2G8UCpFqpLpb
    TCzHqQqshfIgGbJOzFWns+sDWv98eKqOFQjuI0wqxeerYwpp5cupmK6wYoDxn686kqIX+X
    KPfziR/xF7gzZIYMjNdbekv2d9+QKyMejmWv2smFLNMWjMiP/GMQrKzSqLSPgZfNrQs6L2
    Q5n0Zg+rfsTR61F4b+w2mB6W+KYCgdrgGji/OGSvYfiSa4n9qryCLyr/TqVg
X-ME-Proxy: <xmx:LqBvapxQNiOZElmKUkNmm1jmgZqbQeIvUVYmzlKtbyYpTGqrXa3muQ>
    <xmx:LqBvavm9GjedUXF1rb90Y7R9UpMyADLDyo-0QSL-EHI-NXwaRyAVsw>
    <xmx:LqBvagDw1KIQZDp5ZDBBOpgB2Z8fKhcNJEIvz46_tJBQ8gbPAEkwVw>
    <xmx:LqBvaqKoAdwuT9sEc85-piA3Zax3iV2LZlG93UKzTTKvLBf7FGywyw>
    <xmx:LqBvakjE7aA3_jLKUPvcI8FvQVTBA0QifIIH0xFeJ5Unok66AzF7uRjZ>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 15:53:17 -0400 (EDT)
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
Subject: [PATCH 09/16] selftests/mm: skip khugepaged swap tests when no swap is configured
Date: Sun,  2 Aug 2026 20:52:41 +0100
Message-ID: <20260802195254.1937477-10-kirill@shutemov.name>
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

collapse_swapin_single_pte and collapse_max_ptes_swap swap pages out with
MADV_PAGEOUT and then require them to be swapped. With no swap area
configured MADV_PAGEOUT is a no-op, so check_swap() finds nothing and the
tests report a failure that only reflects the environment, not khugepaged.

Skip both when /proc/swaps shows no swap area, so a missing swap device
yields a SKIP rather than a spurious failure. A real swap-out failure with
swap present still fails as before.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index b43e060b4118..b074b005b62f 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -181,6 +181,21 @@ static void get_finfo(const char *dir)
 	ksft_exit_fail_msg("%s: Could not read: %s\n", __func__, path);
 }
 
+static bool has_swap(void)
+{
+	FILE *fp = fopen("/proc/swaps", "r");
+	char line[MAX_LINE_LENGTH];
+	bool ret = false;
+
+	if (!fp)
+		return false;
+	/* First line is the header; any following line is a swap area. */
+	if (fgets(line, sizeof(line), fp) && fgets(line, sizeof(line), fp))
+		ret = true;
+	fclose(fp);
+	return ret;
+}
+
 static bool check_swap(void *addr, unsigned long size)
 {
 	bool swap = false;
@@ -739,6 +754,10 @@ static void collapse_swapin_single_pte(struct collapse_context *c, struct mem_op
 	void *p;
 
 	p = ops->setup_area(1);
+	if (!has_swap()) {
+		skip("Skip (no swap configured)");
+		goto out;
+	}
 	ops->fault(p, 0, hpage_pmd_size);
 
 	ksft_print_msg("Swapout one page...");
@@ -765,6 +784,10 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
 	void *p;
 
 	p = ops->setup_area(1);
+	if (!has_swap()) {
+		skip("Skip (no swap configured)");
+		goto out;
+	}
 	ops->fault(p, 0, hpage_pmd_size);
 
 	ksft_print_msg("Swapout %d of %d pages...", max_ptes_swap + 1, hpage_pmd_nr);
-- 
2.54.0


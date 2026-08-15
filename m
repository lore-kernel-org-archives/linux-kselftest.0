Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E811C3446CE;
	Sat, 15 Aug 2026 01:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786759157; cv=none; b=Zm2aTfjvlJiyh+HQINOtahe9m88yqf7Y9cPSkRNRqJzI9e/8/L+Zs5Bw554r6buWRpQTnZbC0VkYuTY/9N4kTOh0UgvOWLom5ESsELz1wqPSyp064R/9STqVxjO2unU2Gksya4Of8uI+VlFeDodCpkH61Kq8kuGLcXPjZOARoAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786759157; c=relaxed/simple;
	bh=efwAuGkc+QfDFtsrIl0ZRjfy4OsmTsx9SEjf76BeyiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dn/R2IcIGY9L0g7sxPPnGgiTeHADEx/TU5JGJzS5/kL/jpVfg4I1t1Mvidyh/wd92wcEnkrv5zLfNw7+w2TgbWJAgSkGKfWeQrJCss9GuO6fyDITVfIQhKi9mtjTVYXzLoZ3pnDPdPmlRqc2TtdKg595XuqG9VV8ImrY0GO3gHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=qgG71gWC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C6EwAi+P; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="qgG71gWC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C6EwAi+P"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 21AA3EC0225;
	Fri, 14 Aug 2026 21:59:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 14 Aug 2026 21:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786759155; x=
	1786845555; bh=OagyuSQwqQVmdL1ycZwWlmABBXtstTQziQig8mkv9yQ=; b=q
	gG71gWCMufKBaweTLjyrV/2B+GqdIdc9XNhNl4EDaq8wdvzOjlZp+CCWTQYYN2SG
	ZuJK9NJvsnOUXPMWgTxGaUPM4MOdNigu9za7ZuHNG9irZxc7v8MJjpH3i3ZfHwO/
	H/IKMpuzhDLUmUcbg++btiig/qJGvAC+WqtxsY5hloQJb7jZjAdPHIotB9KBQ805
	uWcasdNt2iGu7ZIxzdGYPwNmgVbruDFB0CKmbtJMRSkgp1fITixmjIzqf2+jGm40
	LFmwvS91qgptyogFF6qf7a/OQR0eQw1rBve0Kkhhx2zpJRim/JZr3Yyo8SQ5giMc
	KfGiEgJX5gqiBj5w9VWnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786759155; x=1786845555; bh=O
	agyuSQwqQVmdL1ycZwWlmABBXtstTQziQig8mkv9yQ=; b=C6EwAi+PHIyxBEzN/
	AswsushfQm78lDT+1wG9nTDM++fwGfXMe1BmmgZJ8C3yfoJalZ+SWEKv13LeGj8+
	wQf5ktoxc4eoovmIvYHts0O95I11ARSu4C/X706yBhk722QunGFrkAtRIVttgBF1
	8rrLOvPiDi4B2SsyXCz8nU2ioJW0PdUq9YTHKyVybxXTivzMZupyDKOIM5VUiqVo
	seZggNcKAylcqGviHCZoLsBQytcwIaX70S+Nyrl3RrUte0rQAirsrderXB6BQN7j
	ZtdWDaDAf9qWBJsUfVIC8pZsB9unYY0vmfLqyqnckzIELIreHf4KFDd2B/GQZCu6
	iaI2A==
X-ME-Sender: <xms:88d_aibwQXtuBSVL_bt5_bB3rUeKbiGJIhCX4Ny43et2sjzn_dpTjQ>
    <xme:88d_apWrB96vI3SqOI4GNl_4Fyhmtq6UC8ms1xANicOm9X9RvTHAHgKlrp6g-Z1Nd
    7DwehQHqn5lR8Q4kd0imQXVSR8cExY10twNdTBIxj7OdQrhkdmoZxs>
X-ME-Received: <xmr:88d_alcshRnnOs_Oe_2tBtYjvNr_UjWjP49HpN6QkNOC6d0Ub8JHI2M73hU>
X-ME-Proxy-Cause: dmFkZTGF7teVIHNqoa5p2A8iL+trOmU4pExV0BsGEGBxavUqSy3vvyW/t2uVaC82ybAhbC
    FZe2jS418ApiE9B8lCjDVAvs2O/1hVxxIyd2QmVeomYKnxIQlXrdOkpVI2/A6aay1R5wM6
    752pE1oD84VvsYvCM8wHufwfHzQzVg5WF64m0thPV1o6CCL0N8QD0816LOjK9LaF9KdRdp
    ShDgDyNTb/bU59JqJj/g3oSWXYBnQXQHEYh7kafl/PHtgQjoSit3F73LPXI/q1yj04b//y
    CUybFuAxuhlNqjceRELXNaCNxBn+qS4c4JK+cmo8T/HSoyzm/Kml9mcKob58Fnvz9v9LJG
    902yBfSqobVpU5cPlkQIChl1GO+Rmll+tN/Ll/HfeQFiznCNQFe9p3Bw2O/4k1VVLkgnp/
    fCNJ9XNlNHoWrBoslggvY1/O0wVbkEVo72nb108ebE4dHY77E43Q/D93CzrVpJI8lpUeSv
    S7ewJu+RGF/Xk9Qmbq2DrWS1sPrmAz00HaDwyBDmVKiPA7VPtKH+xk7t6VDMzkQ5JWyuWd
    mUDndNMaYibXgmLXP9wwtQwVc/wLMzkZevCOD+5Nv+emmXcwO5XmKGH1VXQVx3J9ELqhZn
    53V+Fj/FwHyfPLhOipV4y47OWc7xGS+LvBp0c/5eGKo3LUBE7uLpEboq9Lgg
X-ME-Proxy: <xmx:88d_auMbmkfjlyowRipg_Wn3PgWaqg4o2Aitxeru3qfXF6lRgCj9Sg>
    <xmx:88d_alIkuE8XLEGbi53b-kN88JOf8e2AYgPsn8Ei5twH4pTl2ba-1A>
    <xmx:88d_ask06vh2jf0JOKOfj7enZTeoPwM4E3cxbdDtXqFqghwPq5SAmw>
    <xmx:88d_asY1Yq511zwTv80m-jkRmaDae_DEDBaX2nqD8Mgv669LoaU5vg>
    <xmx:88d_at6mpYM-PInK81kxNveNYH27YPB6CTm4kImUTyPrbp7IKvc0N3-N>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 21:59:14 -0400 (EDT)
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
Subject: [PATCH v4 04/19] selftests/mm: skip khugepaged page cache cases without a PMD folio
Date: Sat, 15 Aug 2026 02:58:46 +0100
Message-ID: <20260815015901.1236937-5-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815015901.1236937-1-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The page cache caps folio order at MAX_PAGECACHE_ORDER, which is smaller
than the PMD order on arm64 with 64K pages, where a PMD is 512M.  A
PMD-sized page cache folio is impossible there, so MADV_COLLAPSE answers
-EINVAL and khugepaged passes over the range.  The shmem cases ask for a
PMD-sized folio anyway, so four of them fail and the run bails out in the
middle.

MAX_PAGECACHE_ORDER is not shmem-specific: it caps every file folio.  Skip
both mem types where the cap is below the PMD order.

Anonymous collapse is unaffected: its orders are not capped this way.

Assisted-by: Claude-Code:claude-opus-5
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index c499804a0ec4..ec5c36a19d92 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1357,6 +1357,30 @@ int main(int argc, char **argv)
 
 	setbuf(stdout, NULL);
 
+	/*
+	 * The page cache caps folio order at MAX_PAGECACHE_ORDER, which is
+	 * below the PMD order on arm64 with 64K pages.  A PMD-sized page cache
+	 * folio is impossible there, so the kernel refuses these collapses by
+	 * design and there is nothing to test.  The cap is not shmem-specific:
+	 * it rules out regular files too, and the per-order shmem_enabled
+	 * controls exist for exactly the orders it allows, which is what makes
+	 * them readable here.
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


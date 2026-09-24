Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04534BFE8D;
	Thu, 24 Sep 2026 19:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277096; cv=none; b=hGpMkR065IQvvekblQ0PAcQg3NmKPXGRSVGAwdasIYodRWesSmGjQo0/dYXT/+g6jB2Nsy6+Xx+MBv37+rYZpKJ92IBCbYjrWDkSho+7oEZunjkdDNDBUB2wVoUUp9CmxlfuuXwqGC8+hnm8Kk1dD/Nk4XBD9Tx4DaiqM+8Q5ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277096; c=relaxed/simple;
	bh=Cp04Flq0uAtUr4B5wboFRQwEJBDejnd6LVB0IHI+q3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GjPHpPtzSB4QNC+FweT5nZAMpEdxRvEyRjhmp41J/QeEpMmW9sSPy4uqj0gOSrUYERQLkuF2XZbnNA1hnYBXh6Pfjrp7jcKVWArFcGHLlOiT1LX3ivOnt6HlfDE16L7SiNLovng1oQA7bQIDg9aPeCMSgcgeXr2N4ZiBW3gX1TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LBHSCsIo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LBHSCsIo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4DCB1E8D;
	Thu, 24 Sep 2026 12:11:29 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE7FC3F86F;
	Thu, 24 Sep 2026 12:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790277093; bh=Cp04Flq0uAtUr4B5wboFRQwEJBDejnd6LVB0IHI+q3A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LBHSCsIovix4NKw2QVz9ASL0qMoTQSCzI/HtXhZN1rnUVLy/HckTBXKlMu7oSmxhv
	 LBhZh+4Cp2BaUS1ZvfBbrQFQ+K+r+00tZJRMnxLWbrqj+kEVcKay3Ah1vmsSGJMGN4
	 HDWR0b2QRs4sTRc5zU+jVPOFwW/b0XYggwieCYkc=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Thu, 24 Sep 2026 20:11:16 +0100
Subject: [PATCH v8 1/4] kselftest: mm: prevent random failure of huge page
 split for khugepaged
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-fix_split-v8-1-cba7359d882a@arm.com>
References: <20260924-fix_split-v8-0-cba7359d882a@arm.com>
In-Reply-To: <20260924-fix_split-v8-0-cba7359d882a@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2770; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=Cp04Flq0uAtUr4B5wboFRQwEJBDejnd6LVB0IHI+q3A=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqtXXcbujZXi+XpYIK57ZqF2h1gdqKzbbdnd1tc
 /WPH1DdxI+JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarV13AAKCRBt1cPRWsUx
 M8E5DAC0eBy5F+3A6LbX3CvhUrMPz514WgNRmJz6yMM1DmIcrO7HnAvnTU5LrUm1sFNxjaOxsHF
 Ocg7mTwtnP6axffBSXJbyo8NmCs8YY1iDpbLSeigMOg2Jw3IHcr6XYELBb0N8cGuiW4HlbAuXc1
 lkNvBqOeNgKaomCSOv7Rgo+iPVkPM/z+DVpeeEh8a3j8AOuShl2vPcmlyaQRdkhNvtJNee68WcG
 KwudWeAIVwT1JdokYRp4/m+bMBL4O4z8laxQoacJkAfkC1vsUYdrXhPm8b+p8JEMXOBlAupxPyC
 bFpUiNleofMa99dxQQHXo6El1xYgUDVLHS45V05E+eoaXPlfGI8BgHJa1odRzv9J/EjiwDgv1Ft
 2zUmDRpY1iHc3y9hDmCdb3H3JmH81dNXppXP82mz2a6/vYixcVbxzZUqNPj8Aey9FMiLmTfkPnD
 SBHwFTvyyInl2c4MuI+7rIsXwBLuZmROBR6DieFJGbn755fOeWCcjuoSImQlauiE599BQ=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

There're some random failure for split_huge_page_test when khugepaged
collapses pages into pmd again which had split by the test.

Prevent the khugepaged's collapses for split page by setting the
mapped pmd-huge-page with MADV_NOHUGEPAGE before split.

Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/split_huge_page_test.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index c5d96a4b1db3..ef4058662b91 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -108,6 +108,18 @@ static char *allocate_zero_filled_hugepage(size_t len)
 	return result;
 }
 
+static void disable_khugepaged(void *addr, size_t len)
+{
+	/*
+	 * Disables khugepaged from collapsing THPs in range, existing THP
+	 * pages remain.
+	 */
+	if (!madvise(addr, len, MADV_NOHUGEPAGE))
+		return;
+
+	ksft_exit_fail_msg("MADV_NOHUGEPAGE failed, err=%d\n", errno);
+}
+
 static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hpages, size_t len)
 {
 	unsigned long rss_anon_before, rss_anon_after;
@@ -120,6 +132,8 @@ static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hp
 	if (!rss_anon_before)
 		ksft_exit_fail_msg("No RssAnon is allocated before split\n");
 
+	disable_khugepaged(one_page, len);
+
 	/* split all THPs */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
 		      (uint64_t)one_page + len, 0);
@@ -167,6 +181,8 @@ static void split_pmd_thp_to_order(int order)
 	if (!check_huge_anon(one_page, 4 * pmd_pagesize, 4, pmd_pagesize))
 		ksft_exit_fail_msg("No THP is allocated\n");
 
+	disable_khugepaged(one_page, len);
+
 	/* split all THPs */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
 		(uint64_t)one_page + len, order);
@@ -215,6 +231,8 @@ static void split_pte_mapped_thp(void)
 		goto out;
 	}
 
+	disable_khugepaged(thp_area, thp_area_size);
+
 	/*
 	 * To challenge spitting code, we will mremap a single page of each
 	 * THP (page[i] of thp[i]) in the thp_area into page_area. This will
@@ -482,6 +500,7 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
 		ksft_test_result_skip("Pagecache folio split skipped\n");
 		return -2;
 	}
+	disable_khugepaged(*addr, fd_size);
 	return 0;
 err_out_close:
 	close(*fd);

-- 
2.43.0


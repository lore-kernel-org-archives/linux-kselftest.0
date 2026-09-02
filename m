Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D1E346774;
	Wed,  2 Sep 2026 12:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350997; cv=none; b=lBW8uO3qYTtXj2sFnl5kjQBHCKrYyNqqea00BdJbN5sgIDZBZKDF4/mTlT70tttX2gXcXxjT2AIN1RvUNKx1EByxPuTlvSsDYD9FMXCldRPEFbuICir0r+3Dd99n5hvVKCkPPx9Ro4c7QS5l+qA3wuh9FGYsDB8oW+9jlHOb4Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350997; c=relaxed/simple;
	bh=pUsAF+NKDxZAuOCu2xwNuQnOqeW4ovfuiE8VNrQZxHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pEK6TnX/PAroagvGbMvLNW1SIFoYsNBdhlqlC8PEO2ZOeG18KD9yIGYZEdB6PH73yKS6IrJWMyfN936V+W7qqxBOSPOZms4NVMxZWXsoLYZFMI8N9J+68U4LVLHj9DsMSsvksMCHJjKeoW+VA3Un7spSHGXHD1mughNykKkH9Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aW7k6H1g; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aW7k6H1g"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5793C1682;
	Wed,  2 Sep 2026 05:09:46 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 187013F882;
	Wed,  2 Sep 2026 05:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350990; bh=pUsAF+NKDxZAuOCu2xwNuQnOqeW4ovfuiE8VNrQZxHY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aW7k6H1gR9hzfnUh1tz9Of7F89UvN9scnUZbNsi2t6A5hay2+g9HovUPxDmZqj+7J
	 YX2XUCiwDEnyufUi/0QdRQZuYlN/dypKriQjNvpLsrL3kq6knvnJLnHJD1gqA7A8Vu
	 IBUvhRE24MLrCs6NV1/IlnuQMc64aI4d1hbkIuT0=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 13:09:35 +0100
Subject: [PATCH v4 1/3] kselftest: mm: prevent random failure of huge page
 split for khugepaged
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-fix_split-v4-1-85f03905f7b1@arm.com>
References: <20260902-fix_split-v4-0-85f03905f7b1@arm.com>
In-Reply-To: <20260902-fix_split-v4-0-85f03905f7b1@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2707; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=pUsAF+NKDxZAuOCu2xwNuQnOqeW4ovfuiE8VNrQZxHY=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmBIG+FE6+7XlWbhEWVG74JauIQOW9hAlYcR6g
 GGYuvk9XL+JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgSBgAKCRBt1cPRWsUx
 MxCKDACXbSM/L+bTkLJMqPzk1LV+saJ5txv8ckKPghKNpOFx2JvGS6r1L2WaA0/GmfGD+iqAwUj
 u5J8xpzcj9qOi/NzHmXiLM/i7s7a+PkuZq+rZgzbcUX14z/enXwloDzXKywlCpyW0UvJPgPBdjQ
 QYCArgJ/F3luAO+g3ciMlAqrphnxFGWIptVVTVLvo3JgtBkC4+XAILexAxXHrI5J6T8dCyUx7A0
 bHOIKjfeze7prPgPaZs6kSQVef988xUoRm2ZE5yQcX6pct8wRSS1hbGpGzF8clYJkd0Zxt4piIH
 VKspVT1bxsZ/liTHAQYHx3Cs9zaE3y1OuKvgwYyJeYHTy24q115MISG+E0STomQCUpac4+00rqK
 0i7iY8Pmte+GsNZutcp0ZpxFsCqiwUh1lja0MDxXXrvtoVArlMfTx0JfjH+cBFbNBKVzJR1Vzw6
 NeRTEK6JBTg6r8QjtqXGBSgvHSQMlxiwo/ekhoX7KDKQlmkm/d4JHERrhVrUARjgvQWu8=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

There're some random failure for split_huge_page_test when khugepaged
collapses pages into pmd again which had split by the test.

Prevent the khugepaged's collapses for split page by setting the
mapped pmd-huge-page with MADV_NOHUGEPAGE before split.

Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/split_huge_page_test.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index 86a603692826..4bbad892bc57 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -168,6 +168,14 @@ static char *allocate_zero_filled_hugepage(size_t len)
 	return result;
 }
 
+static void madv_nohuge(void *addr, size_t len)
+{
+	if (!madvise(addr, len, MADV_NOHUGEPAGE))
+		return;
+
+	ksft_exit_fail_msg("MADV_NOHUGEPAGE failed, err=%d\n", errno);
+}
+
 static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hpages, size_t len)
 {
 	unsigned long rss_anon_before, rss_anon_after;
@@ -180,6 +188,9 @@ static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hp
 	if (!rss_anon_before)
 		ksft_exit_fail_msg("No RssAnon is allocated before split\n");
 
+	/* Prevent khugepaged from collapsing the pages. */
+	madv_nohuge(one_page, len);
+
 	/* split all THPs */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
 		      (uint64_t)one_page + len, 0);
@@ -227,6 +238,9 @@ static void split_pmd_thp_to_order(int order)
 	if (!check_huge_anon(one_page, 4 * pmd_pagesize, 4, pmd_pagesize))
 		ksft_exit_fail_msg("No THP is allocated\n");
 
+	/* Prevent khugepaged from collapsing the pages. */
+	madv_nohuge(one_page, len);
+
 	/* split all THPs */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
 		(uint64_t)one_page + len, order);
@@ -275,6 +289,9 @@ static void split_pte_mapped_thp(void)
 		goto out;
 	}
 
+	/* Prevent khugepaged from collapsing the pages. */
+	madv_nohuge(thp_area, thp_area_size);
+
 	/*
 	 * To challenge spitting code, we will mremap a single page of each
 	 * THP (page[i] of thp[i]) in the thp_area into page_area. This will
@@ -542,6 +559,8 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
 		ksft_test_result_skip("Pagecache folio split skipped\n");
 		return -2;
 	}
+	/* Prevent khugepaged from collapsing the pages. */
+	madv_nohuge(*addr, fd_size);
 	return 0;
 err_out_close:
 	close(*fd);

-- 
2.43.0


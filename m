Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392F343E066;
	Mon,  7 Sep 2026 08:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769182; cv=none; b=S2oNdd0p7gCJzEXlfnxidlhaQ1eXgTgNb3A5yNDRUTvv5cQPyx55HRMbbb1xWjE0YzQklxk++NQ+O8GktP5QMUnV+wK0G9uuTkCLrfedvo2gExWllJBOixU6jHP77vHdTkhFyiHG8s9I5NqzFxjXQTV02zxl7QyEpJHr3gF+qlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769182; c=relaxed/simple;
	bh=v3lJLJ64R7nLhf+mDAkhjmHG3DMXCLSo7wMzBe1cAD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TQv15eS7vrYSECA+hrNnkhlB4HOGJsULFJI2sTOQaijZ+SHLgDo7sYqplySbr5FyEKHqalJOqOizdrilYqjypOD20cVBXu6b8gL33leQdq15i513IVxSyiGNFss9fn+bzm9d4PXqJCREEh4lyqpHcIN/EDJdIsNS1xVr1jVIDfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NnJ3qfES; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NnJ3qfES"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FEC91A32;
	Mon,  7 Sep 2026 01:19:33 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7606B3F7D8;
	Mon,  7 Sep 2026 01:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788769177; bh=v3lJLJ64R7nLhf+mDAkhjmHG3DMXCLSo7wMzBe1cAD8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NnJ3qfESypCG/7s7VquBc3/XfgR2n8t9EM6vFOWw3zdnY3Tvv1TvVRy7AWYq/RyoN
	 Et6SPOvMpe3ZL49LqM2togYdq8LBddGWT6/LbFuH90rHVB83wvFt/W5/K2mR8f15pf
	 TdO1dh7OnueAOz8ujibMNlllM11syoCR99TQAZ/M=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 07 Sep 2026 09:19:26 +0100
Subject: [PATCH v5 1/3] kselftest: mm: prevent random failure of huge page
 split for khugepaged
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-fix_split-v5-1-822b810458bc@arm.com>
References: <20260907-fix_split-v5-0-822b810458bc@arm.com>
In-Reply-To: <20260907-fix_split-v5-0-822b810458bc@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2716; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=v3lJLJ64R7nLhf+mDAkhjmHG3DMXCLSo7wMzBe1cAD8=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqnnOR1zCSMGM7Z/DwbyT+XNBI5kcy3peCZqhUP
 2YNQyjt8cKJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCap5zkQAKCRBt1cPRWsUx
 M3WbC/9AcaZpg0ZOGpEKvpchDwI0fH3k+z7NXbEUuycIc7rMvohUVHUQkKblL3McQgw5FF/+Gwj
 g7ZRakjo6geuS38WpmXWjEajtJrLTi7f79q/FFrJYtRDLkMYAgK+/Wk5o4AxVNgJLgZS8VOSz/s
 FFaVd3Ia9GDrUxy+vNnqjtsPDX4RhrIP7jwhOYwDudA+Y9jGKpjRTg0G2keZDHqDq/RYE7rwgCP
 Ra1oLS9Pkqgk5w/zOnMZUHzosIPzkcQLP4mUdJZ6MA83STGnWVXMdr8nNDY6qCuMYB6w+mRLlQh
 3Rk13SsY+AP7BxObWRUnvsXGB2pufzUXBxVABSU4illlE8knM5lUzel3OdZQPF1zfXIys8xuGWC
 81hBCcuoesDSlh6KEmvxJxLIixOA/fBKim5hBl4BAsePVcBf9mY7GbTuKDIzRRafFfiwkN5zL1i
 KUlYSZ7B/0xkA9n/zU/QP+Cpm5N25CDxmVUZkhAxieoNxiXE7Y0oXAFHhgLHOmm/0jG8Y=
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
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/split_huge_page_test.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index c01d227d7fd6..cba327f77873 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -167,6 +167,18 @@ static char *allocate_zero_filled_hugepage(size_t len)
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
@@ -179,6 +191,8 @@ static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hp
 	if (!rss_anon_before)
 		ksft_exit_fail_msg("No RssAnon is allocated before split\n");
 
+	disable_khugepaged(one_page, len);
+
 	/* split all THPs */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
 		      (uint64_t)one_page + len, 0);
@@ -226,6 +240,8 @@ static void split_pmd_thp_to_order(int order)
 	if (!check_huge_anon(one_page, 4 * pmd_pagesize, 4, pmd_pagesize))
 		ksft_exit_fail_msg("No THP is allocated\n");
 
+	disable_khugepaged(one_page, len);
+
 	/* split all THPs */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
 		(uint64_t)one_page + len, order);
@@ -274,6 +290,8 @@ static void split_pte_mapped_thp(void)
 		goto out;
 	}
 
+	disable_khugepaged(thp_area, thp_area_size);
+
 	/*
 	 * To challenge spitting code, we will mremap a single page of each
 	 * THP (page[i] of thp[i]) in the thp_area into page_area. This will
@@ -541,6 +559,7 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
 		ksft_test_result_skip("Pagecache folio split skipped\n");
 		return -2;
 	}
+	disable_khugepaged(*addr, fd_size);
 	return 0;
 err_out_close:
 	close(*fd);

-- 
2.43.0


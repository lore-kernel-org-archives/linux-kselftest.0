Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCEE3E1CE4;
	Fri, 28 Aug 2026 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787904710; cv=none; b=FlsjnlxsDn7wKZSbYM7/KP10f3G1IiSDCKdygd7QAHwSKy8SZvjpxhU2iwhjHv0ggF24RVPnvxsHWhtHn/FqFxf/cSrTt2+WWdkrNodB9XlxH2jTpY7ZeONZ5213PCT6FZXf0TTg+ss7XSnT9sY8M+BcqVxqyQCj94MqfWTX+lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787904710; c=relaxed/simple;
	bh=0I8+Oez4/Fvep0PwEfY0VNcmLGz/KZXfSGanwudrUEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jvTBomnavGQnR2orAT2yalpZOodQ31inQ8pA5FCFxEVXGbGbg65056DuICbPHfpepDe88qPLJ7PyL7Eb2PuUER9zK1RJpDS/hN5mFIaz61UyiX461D6QiVVBrPs0Jgd8eBrHVWayOmB313IQxctQUudDt3IIKo9aprW1lpE2DuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=uzaOz1/o; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="uzaOz1/o"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A3D31688;
	Fri, 28 Aug 2026 01:11:42 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 794223F85F;
	Fri, 28 Aug 2026 01:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787904705; bh=0I8+Oez4/Fvep0PwEfY0VNcmLGz/KZXfSGanwudrUEc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uzaOz1/oJlW6bR6EV5BEwzUO3ZWDtOkiX8kQqTvtQIU+8Gstt90P/EfK0V5xpWkNj
	 68OSVH/YFW5zcfNWR7SNP8y2tmqKwNcLcLslb9UHvON4/PDR4Qmh3g6BKvZDU9lIay
	 TSFu6UJYE3d/Bf8dt+2bNttsDZ8Ly2mXLvKiGusM=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 28 Aug 2026 09:11:33 +0100
Subject: [PATCH v3 1/2] kselftest: mm: prevent random failure of huge page
 split for khugepaged
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-fix_split-v3-1-374022586a4b@arm.com>
References: <20260828-fix_split-v3-0-374022586a4b@arm.com>
In-Reply-To: <20260828-fix_split-v3-0-374022586a4b@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2554; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=0I8+Oez4/Fvep0PwEfY0VNcmLGz/KZXfSGanwudrUEc=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqkUK7V9mWLeZ9zL0R9lDWbj29vfP3HZbcACkU8
 XLC7wYRzBeJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapFCuwAKCRBt1cPRWsUx
 MzDVDACIL2ZyqeIY0AqiOfUb3ahEZz0Rfrp9OTdH2HaozEJu//mWMJfgISeHLcX1mIMhRKl1CGl
 YN1+8V4wMX3xvPj1HCQPgBmLNlyLnNm5+I8ELib45qcNWBhqxgzDiK9McBcHwkmhFZ6j+PqMvUY
 60h8P9i7i5Am6skrXngCeQN5hpLtBGyJwRoVy3RJ5eloa8epQpkhri6oqRNaPzXgWhzkTrrswHp
 PhBjE83yLQQXvHWXx78YOkBQAHHRNdp/PdQ7NPdX3e1kb5QlDWKXlB78I8pokt5viPN6R/iurR6
 U70GwNWPOz0yo0l+6xjpVCw5pS/xE6tsD2usTl3/WOPbdJssbinGjAT6AHq1Nv/dscvq+SHTJre
 CzFNwIc8ToSlZ1p8+lU3fOjsBUz2xRNKM4S2yIkLtNHJGhW7fYEMgnu9cPzX2u8IxR9kCVa9Xjb
 eHgKorOz6kpR+tC+1PpeU8FdefGOWSzKZlIyJMTw5FgBrZUKP8r4bqrvxl+KZ6GUtucnc=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

There're some random failure for split_huge_page_test when khugepaged
collapses pages into pmd again which had split by the test.

Prevent the khugepaged's collapses for split page by setting the
mapped pmd-huge-page with MADV_NOHUGEPAGE before split.

Reported-by: Kevin Brodsky <kevin.brodsky@arm.com>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/split_huge_page_test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index 86a603692826..c718269a291f 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -180,6 +180,10 @@ static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hp
 	if (!rss_anon_before)
 		ksft_exit_fail_msg("No RssAnon is allocated before split\n");
 
+	/* Prevent khugepaged from collapsing the pages. */
+	if (madvise(one_page, len, MADV_NOHUGEPAGE))
+		ksft_print_msg("madvise(MADV_NOHUGEPAGE) failed\n");
+
 	/* split all THPs */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
 		      (uint64_t)one_page + len, 0);
@@ -227,6 +231,10 @@ static void split_pmd_thp_to_order(int order)
 	if (!check_huge_anon(one_page, 4 * pmd_pagesize, 4, pmd_pagesize))
 		ksft_exit_fail_msg("No THP is allocated\n");
 
+	/* Prevent khugepaged from collapsing the pages. */
+	if (madvise(one_page, len, MADV_NOHUGEPAGE))
+		ksft_print_msg("madvise(MADV_NOHUGEPAGE) failed\n");
+
 	/* split all THPs */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
 		(uint64_t)one_page + len, order);
@@ -313,6 +321,10 @@ static void split_pte_mapped_thp(void)
 		goto out;
 	}
 
+	/* Prevent khugepaged from collapsing the pages. */
+	if (madvise(thp_area, thp_area_size, MADV_NOHUGEPAGE))
+		ksft_print_msg("madvise(MADV_NOHUGEPAGE) failed\n");
+
 	/* Split all THPs through the remapped pages. */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)page_area,
 		      (uint64_t)page_area + page_area_size, 0);
@@ -542,6 +554,9 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
 		ksft_test_result_skip("Pagecache folio split skipped\n");
 		return -2;
 	}
+	/* Prevent khugepaged from collapsing the pages. */
+	if (madvise(*addr, fd_size, MADV_NOHUGEPAGE))
+		ksft_print_msg("madvise(MADV_NOHUGEPAGE) failed\n");
 	return 0;
 err_out_close:
 	close(*fd);

-- 
2.43.0


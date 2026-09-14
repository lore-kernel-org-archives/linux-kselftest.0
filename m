Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DEA3E3163;
	Mon, 14 Sep 2026 07:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371023; cv=none; b=SiUmQLK7Z3vByh2NbNynO+bqeujNZPtUPS4twUXEfLQyuOd80yfeUcjgmi4+Od/BsimRJxerA5czpgWrI7lm4TglxC+8ZZ2H4FLJgI3WuvBR0bHdm8V+wHadbEdXO8K9H9I7KLAR7PLDdvUtMtYJvVIwvvMQdmadNzLlbDRkBQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371023; c=relaxed/simple;
	bh=SlD7ZbVM7WnFOn0I9sN0RsC4FPCdY4XpHKn67Smm3qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jo06AeiJH4rnQtC71PzovlYE/LS2iDFeI5+MXLOJZekvSjtsP90m17WAD4ST3m5pwDW5mkb6j5uRfP9wxTUOhuPgG3SVS3q1zEmbufMTALdgvhkTIqGF50hfxXeanlW3eZ0oEJnoLcnwEuOeqyb/cE47SJBtVQiefT6sYTb7ZHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Cl9+8G5o; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Cl9+8G5o"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 192AA1570;
	Mon, 14 Sep 2026 00:30:17 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5F053F59E;
	Mon, 14 Sep 2026 00:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789371020; bh=SlD7ZbVM7WnFOn0I9sN0RsC4FPCdY4XpHKn67Smm3qg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Cl9+8G5oMdP7lh+WHNE+fCbazaEny8SPmxKwgj1dFpDiT2ssk7ppCGxxjdzRMq06C
	 /zoIkoQFHy0NpNotetR3VDpQRW96FOjmkdKLOjMq5ZZeAPKux2A9UUbVvFiyURJEDi
	 rvJwvfnYCTpRqKKOdv+Ce6ZjXo7FLj8uEX4OKkFA=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 14 Sep 2026 08:30:10 +0100
Subject: [PATCH v6 1/3] kselftest: mm: prevent random failure of huge page
 split for khugepaged
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-fix_split-v6-1-16ed7123800b@arm.com>
References: <20260914-fix_split-v6-0-16ed7123800b@arm.com>
In-Reply-To: <20260914-fix_split-v6-0-16ed7123800b@arm.com>
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
 h=from:subject:message-id; bh=SlD7ZbVM7WnFOn0I9sN0RsC4FPCdY4XpHKn67Smm3qg=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqp6KE5jWbWA6Vl/LXzSbh4vusoY1JIpxqui00b
 WCllym4YfWJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaqeihAAKCRBt1cPRWsUx
 MyaxC/4q7Yi8BdaNwgF0uMQXrfTyws7nuywQBhuRw2f17xDGs+9SWebUV/TRY5zorq5APlq2rDn
 vAUc+bmXYBEZwGbDMjf1ge7BNaUlLdNacCsSVHLerps2U/Xf/DhVnI1Vzd84p5FeskRGOK9qUED
 NBiob6Xsls1V5MgdJlmPP3Vsajbq1LuPWT5QqEAbjgVbxsm1IxlwVlIARb7qVV44vCAPWAKUiqQ
 eMRpCJlIor1Hqu3v0RlbmqDD+Iyt5jJyzEwBN72cP2ZZT0puysglKmmG3NpZFqOa2BV06M7Jy/g
 74W98j8VURt3oU/3voT6uRYQgdn49bok7Fe3SraE5W9QZDt9Dro+1hdTbRnYi86satdvGQf+pkA
 Q/jmXBA93OT83ye7CmKMfzkPv1DQRi5wDIP0apRp2OHqYOwvevdfA04ncD4OrpOYoR+uXXb4waA
 Nw/pwiqvqKAevRt8Fu6fYf0WuOabIzy+4wWqxYSOrvva3ehFb+CcX0lwQqEOcHFTP4Xvo=
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


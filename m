Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EF229ACFD;
	Thu, 20 Aug 2026 19:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787254842; cv=none; b=FX4LPixqZpZJ4Mr/eTEhageAW/kVY+ddSsLdPFNNiV5oOvPCbRLkYOTH7vr3cIGOcQ7tP0wSaPdyAmVm0dE26MA1u9blyekrxE1BL+p2zqxpGTQYFWR7ziljCZmR0Ns9d+ZCIAnE3bmuxMdm9NKzTUNAXoK43IpeHTKc4WJstcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787254842; c=relaxed/simple;
	bh=uMRo3I+EyfXXqmw4cBxiWSky9p9AXwXW6zcs9CuZKso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T4bxp+urH3SJ08xEBMWLsXUIA+rUXY/T5uO4c85u4o03CTYs90l6njmR5cuR+srsehVwojqYeIL+UnYdm8RljTu6mMzQvgAQ0XtCPfBM/wMcajLWAu2+chKe1Sg8zNEjctm4xYCMSOQ0K6sQbR8oA0rQTzW5yzyPHHNbMIFXmG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=k40VweNT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="k40VweNT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72F6C20E3;
	Thu, 20 Aug 2026 12:40:35 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEA173F763;
	Thu, 20 Aug 2026 12:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787254839; bh=uMRo3I+EyfXXqmw4cBxiWSky9p9AXwXW6zcs9CuZKso=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k40VweNT0NG3FjlkrTCZGQt7NG81uUFpQzD/ZEn+8bQX2IurfEzfA3aLh+Iqfdwit
	 rVQ9lHzZg6bvqXF4vOIyWVQZWRIxpvPQKODvSf4B1Reho5a1G29PxEJHcbpqVnHvS5
	 cdr2y0f7YCyAY7jeeN45W2j9kYu7pLQp1MIjfM8Y=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Thu, 20 Aug 2026 20:40:15 +0100
Subject: [PATCH 1/2] kselftest: mm: prevent random failure of huge page
 split for khugepaged
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-fix_split-v1-1-ab430c58c7cf@arm.com>
References: <20260820-fix_split-v1-0-ab430c58c7cf@arm.com>
In-Reply-To: <20260820-fix_split-v1-0-ab430c58c7cf@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2249; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=uMRo3I+EyfXXqmw4cBxiWSky9p9AXwXW6zcs9CuZKso=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqh1gwFNiZL1JKhbXTdharWu6xO72tiOOQScaBM
 kX8t0XWnIiJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaodYMAAKCRBt1cPRWsUx
 MylyDACthWK3rDwGK6zCbh9WSTwdnNwTIofCM1WGv4e/TMI+PwoaYxSNF7LDRAUcCEZM9ttUPP+
 nIJsAIjVVKNx13eQ1onh344xtr79CSMN6FD3b3fPUu3RudaWG3WU8F3q5WoRhB/yLJHeqW2DNls
 LnZE++AfWw5quokjFbqLlsx1+LCKg65PDlWdmQPquYRfH5Y9YPTb0OR73/QJOw6zgixaI8Up+TB
 vSHJamhtvvkleUUf7o5HsuQW6jY3tA0HXXngEzkVr9s9tZPs8wnKc4yECfDeGu+VN+CaMXs+e3s
 HiO+gNocF5Ybyls2EcwEA9hCZDQ9jPFT9pFzP2JPwRABKGxA29zod2BsQ/6ZPaaWjWvrhB6jJoM
 97IqCIB4bvH3G1C8KiVhxJRjD47NBWpADf5671WNkQGdHV9CCWY9BvHebBMQyNpm3DTn6rJgpXI
 wecULLuSKPAnEapAkfzW4FjNF3LYeFhHl1AFudoanwgOWVHCUkXg6u3jAy7WmvT4us2n8=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

There're some random failure for split_huge_page_test when khugepaged
collapses pages into pmd again which had split by the test.

Prevent the khugepaged's collapses for split page by setting the
mapped pmd-huge-page with MADV_NOHUGEPAGE before split.

Reported-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/split_huge_page_test.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index 32b991472f744..99b45e5518199 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -303,6 +303,9 @@ static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hp
 	if (!rss_anon_before)
 		ksft_exit_fail_msg("No RssAnon is allocated before split\n");
 
+	/* Prevent khugepaged from collapsing the pages. */
+	madvise(one_page, len, MADV_NOHUGEPAGE);
+
 	/* split all THPs */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
 		      (uint64_t)one_page + len, 0);
@@ -350,6 +353,9 @@ static void split_pmd_thp_to_order(int order)
 	if (!check_huge_anon(one_page, 4, pmd_pagesize))
 		ksft_exit_fail_msg("No THP is allocated\n");
 
+	/* Prevent khugepaged from collapsing the pages. */
+	madvise(one_page, len, MADV_NOHUGEPAGE);
+
 	/* split all THPs */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
 		(uint64_t)one_page + len, order);
@@ -436,6 +442,9 @@ static void split_pte_mapped_thp(void)
 		goto out;
 	}
 
+	/* Prevent khugepaged from collapsing the pages. */
+	madvise(thp_area, thp_area_size, MADV_NOHUGEPAGE);
+
 	/* Split all THPs through the remapped pages. */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)page_area,
 		      (uint64_t)page_area + page_area_size, 0);
@@ -665,6 +674,8 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
 		ksft_test_result_skip("Pagecache folio split skipped\n");
 		return -2;
 	}
+	/* Prevent khugepaged from collapsing the pages. */
+	madvise(*addr, fd_size, MADV_NOHUGEPAGE);
 	return 0;
 err_out_close:
 	close(*fd);

-- 
2.43.0


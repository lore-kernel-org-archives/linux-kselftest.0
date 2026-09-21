Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393F847B439;
	Mon, 21 Sep 2026 10:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987220; cv=none; b=rFIcLqmchbrjMqVD2xnpi2Mfwi/eal/ImutrNXU1/SZK7h5CZuc6246K0IzITEqDt7K5cI8D3sYQicagV/z4t+08OQthnl/kmgAghkZE1sZtCr8YsMwUQzDDRpCVhmdEZSf5cKysMMmRAO4Pa5TcHjGexeqF/L/7DIPks1KPNnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987220; c=relaxed/simple;
	bh=nAZ5Nu8/Na8ryFI4SAROqdpt5betZtOhodIgZ1vFN/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dT/j2+ZSpQT2Flmhzy3JaL5XnxNFgHF57E0s3C8LP6oLaBztCrvCwDqbO/krHXsC0D4nY2bH7av9OLdFERNA0cKKLN0oQHjoHqWospgh1rx22UeT/7vImQ6nGKYOFiu66MLJFHV+Z3JbX3taS6wh2gXvsAaUEzpPKjR1Y3FtocU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QSuAO5qf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QSuAO5qf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9C531CE0;
	Mon, 21 Sep 2026 03:40:13 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 603FB3F86C;
	Mon, 21 Sep 2026 03:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789987217; bh=nAZ5Nu8/Na8ryFI4SAROqdpt5betZtOhodIgZ1vFN/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QSuAO5qfdzbTBibtYalj0EBb9NUMvqfJDkEzxiDY4t6TCHh5A8OVXvvXEkZOXyuPN
	 9w/gciK3NISvJLcCd7tpD1zOypNB0ER7HlT6QXFWHKFTpl00TijpVcWh1gcEh3hUVI
	 wbh7e19sl5OpXZCLVbJSbN2aATyAwAjJIHCEglEQ=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 21 Sep 2026 11:40:07 +0100
Subject: [PATCH v7 1/3] kselftest: mm: prevent random failure of huge page
 split for khugepaged
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-fix_split-v7-1-d25ec991159f@arm.com>
References: <20260921-fix_split-v7-0-d25ec991159f@arm.com>
In-Reply-To: <20260921-fix_split-v7-0-d25ec991159f@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2772; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=nAZ5Nu8/Na8ryFI4SAROqdpt5betZtOhodIgZ1vFN/Q=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqsQmJS49uY0WTGO7xDTb8XJ1buCo74SJ77Ym0b
 1aLUL4K+WiJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarEJiQAKCRBt1cPRWsUx
 M35vDACoT1PIgox1YUsx6mvHqeplFUSysSKEFx5zDxzyaHYhM7XddIhMZuQbuRPtxopLYkvGoXH
 95U134cSKw9csvK5zS9PkJwkCcBRVzGElv0U5EkqPRtZtSRBjofPqir5KsLhAbsnaV46XfkRcGx
 B4xn3KQ6R0cB4Yl5hg9YygocTcfDVrRRw3wTgh2TXTKfSW4DrV9mFBH79WTXHEA0ed7GPd6MdPa
 hzVCq1NKEk1V6tnk8/2d5eSzTtPNpOw7jDX+CzLSNHZieAm+ofDMKVOIHhna6qEzoR4xo0/40qh
 wdyL+afQBouI4BC/Nli8X7BSN9xqlpFv5+D2Gk6muNYYGceRMYgeOO+6o4Jgj+NV+xJoNO1o10q
 /ewTkqDsTHxxeElOg+EcOTOay1fUmd65mYl+ydB3oxDHonMZCyTdO2F0sd6leullFPRteOIPS7k
 6xZqRkiQK1IiUFE+DgrXm4s02W0VNYd6bYXoFvscCkU4R2Iy6EtIqd2gO/VFrWtAgy5os=
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
index c01d227d7fd6d..cba327f778734 100644
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


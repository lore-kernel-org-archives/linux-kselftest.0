Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8534F93DC;
	Thu,  1 Oct 2026 21:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889493; cv=none; b=rHFdsvCtn30Pf8o+rMla8tdqmN/VHXq3G48jwr0wptQECg2KF51K67eTGpsFDJvKv0ba5ISogz6Zf8I4d7E7I0ESA7HiCD4QeHgDsu+2jvmMLVXm8Tp2YDSGUnP/HvnEGpDx9Cu9lDQYk8wYY5XlJv9j/24Zfdl7Cfm/62CIOw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889493; c=relaxed/simple;
	bh=QTDzI9TFR5poyDcHbXwN5yB0vq+wEkyrdEszsBvl/zE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ebr3hv5PKNQy08zrJboJxPCO8uLPu1xS6LjzWTmktHfJ8Fzr55Ut2PIBzowHyNz6zzHkhoXQSaSCxY1C/QU3aJZOvvavtSON+H5IyszueTNQ1I3/9k2E1nAFceOfP4w3IShO2ufH2ShSuuO/dSj6uf1rBHyCCFq8YlTpvp3xHNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KuEUnD1L; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KuEUnD1L"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 797821476;
	Thu,  1 Oct 2026 14:18:06 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E38223F86F;
	Thu,  1 Oct 2026 14:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790889489; bh=QTDzI9TFR5poyDcHbXwN5yB0vq+wEkyrdEszsBvl/zE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KuEUnD1LIbrX/jzzm1mZU/5F3Ih+d9xB1/92+Mz5bXrOPOgmJGXD68Xo+HU4T+sjf
	 uUJU6JOq70hPW4Su+HLIYp5N+9TfL8d/JnhxGV8zCiyqzp4bxpqN5IGQS4LtYIuAmn
	 7L/Vp08sWJtgtf1TkHBorBCIGw/zajASP6GMTtmY=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Thu, 01 Oct 2026 22:17:51 +0100
Subject: [PATCH v9 1/4] kselftest: mm: prevent random failure of huge page
 split for khugepaged
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-fix_split-v9-1-0f4ba8bbdbdf@arm.com>
References: <20261001-fix_split-v9-0-0f4ba8bbdbdf@arm.com>
In-Reply-To: <20261001-fix_split-v9-0-0f4ba8bbdbdf@arm.com>
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
 linux-kernel@vger.kernel.org, Sarthak Sharma <sarthak.sharma@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2774; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=QTDzI9TFR5poyDcHbXwN5yB0vq+wEkyrdEszsBvl/zE=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqvs4JqSJ1v+3SCIVc/Qop0U3V/fHOG0In9DYc6
 qk+W9AnCi2JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCar7OCQAKCRBt1cPRWsUx
 M3GrDADMQ9d4L9YVcXONl31+8k2UAQroC+yDBfRk+kHoqTncqw/AFZd7JktlL4pZNsOiLhl9MB2
 hjUqOHiPzndcOKMiKCugRHmoiZ21xvIi6JpbXGzNWuOV4KTKl5Zgti4LXttMFTpdKDYMK5FUhZe
 fNyFE5cpSyny5d8rKJk/C2KbwvnYGZvijDOzpHkidAbG75XD8fKx+TQPyA79E3on2eAYmbPw7cE
 QR9lMSNFU7tuau5RgRmRi6N256cX1Fm8S5D4gIvcD8tikyGWY76r0/EEstl12wedqXytcHQpCBD
 ThZt2haAqv9Gt0IiEfCNJgHrzDtxfjrjw3KCHs2aQF93T9M3Lq3QKdvq1+1GJ5nKrzuTf8hof7l
 VFd3Fop4Eef5hmAd5aa6Af9XUJpvc2p1aVH8aP3ZjdvefZsyUjt4GUeXLSPo74mCTn92X2cemAX
 a6NWDcoLLOaJS8FPkHShJtN0GUSFQKiKAY+gwmyp2QuuGBVDTh/Urk7XRGZY9jZUo+eRE=
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
Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/split_huge_page_test.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index c5d96a4b1db3..36a6719ff09a 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -108,6 +108,15 @@ static char *allocate_zero_filled_hugepage(size_t len)
 	return result;
 }
 
+static void disable_khugepaged(void *addr, size_t len)
+{
+	/* Disables khugepaged from collapsing pages in range into THPs */
+	if (!madvise(addr, len, MADV_NOHUGEPAGE))
+		return;
+
+	ksft_exit_fail_perror("MADV_NOHUGEPAGE failed");
+}
+
 static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hpages, size_t len)
 {
 	unsigned long rss_anon_before, rss_anon_after;
@@ -120,6 +129,8 @@ static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hp
 	if (!rss_anon_before)
 		ksft_exit_fail_msg("No RssAnon is allocated before split\n");
 
+	disable_khugepaged(one_page, len);
+
 	/* split all THPs */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
 		      (uint64_t)one_page + len, 0);
@@ -167,6 +178,8 @@ static void split_pmd_thp_to_order(int order)
 	if (!check_huge_anon(one_page, 4 * pmd_pagesize, 4, pmd_pagesize))
 		ksft_exit_fail_msg("No THP is allocated\n");
 
+	disable_khugepaged(one_page, len);
+
 	/* split all THPs */
 	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
 		(uint64_t)one_page + len, order);
@@ -215,6 +228,8 @@ static void split_pte_mapped_thp(void)
 		goto out;
 	}
 
+	disable_khugepaged(thp_area, thp_area_size);
+
 	/*
 	 * To challenge spitting code, we will mremap a single page of each
 	 * THP (page[i] of thp[i]) in the thp_area into page_area. This will
@@ -482,6 +497,7 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
 		ksft_test_result_skip("Pagecache folio split skipped\n");
 		return -2;
 	}
+	disable_khugepaged(*addr, fd_size);
 	return 0;
 err_out_close:
 	close(*fd);

-- 
2.43.0


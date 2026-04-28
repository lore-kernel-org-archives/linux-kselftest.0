Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEA83264DD;
	Tue, 28 Apr 2026 20:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409043; cv=none; b=BeSYKv63X3RE+5ROAHZhzU1RMzNvMDmD+RQRIx3sy1Vi+Ign7r3MngB0+Z6F7OerLjv9Bg79x1IVAZIQy7/g+9DLRbbRE8ZV4cOaFIZuVIb+ST++byfW1/qjWkZk/KjczFdtm/royfp65GPe3FAePV9LmbhAJiFCJgTPTOfb6wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409043; c=relaxed/simple;
	bh=KqI8ngJ0bHSCR5ybdrrYCtTpsduBNLFEpTEruulHsAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oj0MAzoBL8DMtuJdlaBY4Gw/xXMzVdP9Y9GTEqNZs1NaIXiVv1Tk/IrxRsNY1eSaW6v1noF+dZ2H53uKtuOef6kh67o/OXrv9U++hHqGnj5KEYoTYohbil8/FtvSLHHVzFvnXMLTIp8hnsycIHUw+MJrUXzeZq2wC7Vn0tozTtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6vyVtym; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b6vyVtym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0D1C2BCAF;
	Tue, 28 Apr 2026 20:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409043;
	bh=KqI8ngJ0bHSCR5ybdrrYCtTpsduBNLFEpTEruulHsAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b6vyVtymTCj2d+q+Y2oUMB5e0dcR3J7rMQC3vYUuCcn2acCgMHRIvL++NeY/DO6tX
	 hqiegfojn5LEJcbJHvv+23wV1dpKRN7gD+UsQmxdy+hld4QS9UQaVZS/FXfG+e06a/
	 EsjLLe/vmaVM0LToBpQulWul0TZnK7Oh62hg7rbLCmqNaNnFoC0bwTUn/g0jldDPnk
	 TEzlvRBf5Hi8g92hYG7hgVpEcloUGmdj/BwToL/c0+R5JxJjmOP6vlnhcCFeeZfFWC
	 RaZlliozrcbOIEr+AnDahfOmMayXa4IATgC54fdL8tfZUUd5ZC1KJwjRwIcjoWs+V8
	 HapvnruYCpaAA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Luiz Capitulino <luizcap@redhat.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v3 11/54] selftests/mm: hugetlb_madv_vs_map: use kselftest framework
Date: Tue, 28 Apr 2026 23:41:57 +0300
Message-ID: <20260428204240.1924129-12-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428204240.1924129-1-rppt@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Convert hugetlb_madv_vs_map test to use kselftest framework for
reporting and tracking successful and failing runs.

Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Donet Tom <donettom@linux.ibm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 .../testing/selftests/mm/hugetlb_madv_vs_map.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
index efd774b41389..c7105c6d319b 100644
--- a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
+++ b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
@@ -25,7 +25,6 @@
 #include <unistd.h>
 
 #include "vm_util.h"
-#include "kselftest.h"
 
 #define INLOOP_ITER 100
 
@@ -86,12 +85,14 @@ int main(void)
 	 */
 	int max = 10;
 
+	ksft_print_header();
+	ksft_set_plan(1);
+
 	free_hugepages = get_free_hugepages();
 
-	if (free_hugepages != 1) {
+	if (free_hugepages != 1)
 		ksft_exit_skip("This test needs one and only one page to execute. Got %lu\n",
 			       free_hugepages);
-	}
 
 	mmap_size = default_huge_page_size();
 
@@ -100,10 +101,8 @@ int main(void)
 				MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB,
 				-1, 0);
 
-		if ((unsigned long)huge_ptr == -1) {
-			ksft_test_result_fail("Failed to allocate huge page\n");
-			return KSFT_FAIL;
-		}
+		if ((unsigned long)huge_ptr == -1)
+			ksft_exit_fail_msg("Failed to allocate huge page\n");
 
 		pthread_create(&thread1, NULL, madv, NULL);
 		pthread_create(&thread2, NULL, touch, NULL);
@@ -115,12 +114,13 @@ int main(void)
 
 		if (ret) {
 			ksft_test_result_fail("Unexpected huge page allocation\n");
-			return KSFT_FAIL;
+			ksft_finished();
 		}
 
 		/* Unmap and restart */
 		munmap(huge_ptr, mmap_size);
 	}
 
-	return KSFT_PASS;
+	ksft_test_result_pass("No unexpected huge page allocations\n");
+	ksft_finished();
 }
-- 
2.53.0


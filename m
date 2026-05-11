Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F0442EEC1;
	Mon, 11 May 2026 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517002; cv=none; b=V3FFDzAtPBIlGRwVw039DdhgkHPbMCHK8vdLXGdEY/6YZ0hjhQSNqperK0KwFPEGbeat5rDWnfgFDIxPkV8rH6tOn+SuVu9UOHb7ZxbGd+v6XC8wEr+6ESFYyDOgsyM64WftGDN9TtuSBxhUnbUztmJ2/YFLI6ktIuVe21R2kuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517002; c=relaxed/simple;
	bh=JQ7L3bAnl6OfnNGxdvwB4chBwQHdnR62+00+7kyj4+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sK/OM+NCkeAKH+l20cVSl2HgzZANTOjGUGjWwP4OlYKhRm46pr1ZVP6rluSXVwrB3mAWKhLSmDt+5fe9SAYfz8v2SooFn+Px0s9Jrueizgp4aAYxGM/b2t21KCvJpcQZKVNKJ8xXLeFTDU/jY6awYJsu2938oQQ0d2DkZZMIhSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QiNqujZO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QiNqujZO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFC3C2BCB0;
	Mon, 11 May 2026 16:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517002;
	bh=JQ7L3bAnl6OfnNGxdvwB4chBwQHdnR62+00+7kyj4+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QiNqujZO7YA4u8wUJwcZlme4YS+xtP9cryGs7K91V8H4GUnPu7FKMTzYd6xazP536
	 2wUaMPeL/0vIVgssWmFa3FAaN3cOfwawy2KTKuYPtN6Awkqkx8iaHoMY4/rt6MECkn
	 nwolV+/dFFyt7duubIrREIXjDaHhfZkxKJWVDQ4sgTbDXnJWW5XenAWiTjzcP8kZjW
	 M6qNo7AprTjX8xhO8kcvRQcmcfaDjoBp0NoF7wtxlifmnF/UHSvzBU6NnO2WzvWR+M
	 1WWLCgbok8oLJraqh5zJMA4zQ/gJFsEHqfzNiTFrf2+Vs3trdb2VGOy1QkRLvpuRwH
	 WU8bHnOj92Dmg==
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
	Li Wang <li.wang@linux.dev>,
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
Subject: [PATCH v4 11/55] selftests/mm: hugetlb_madv_vs_map: use kselftest framework
Date: Mon, 11 May 2026 19:27:55 +0300
Message-ID: <20260511162840.375890-12-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511162840.375890-1-rppt@kernel.org>
References: <20260511162840.375890-1-rppt@kernel.org>
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
Tested-by: Luiz Capitulino <luizcap@redhat.com>
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


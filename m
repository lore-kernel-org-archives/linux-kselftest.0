Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EDC355F52;
	Sat, 18 Apr 2026 10:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509970; cv=none; b=jPHuqwhAAsIOCxFOpYxsdlHtMRq37nBuiJOZO+wlbAwWz4M6tGZjELhy2i46CoT29awxnnBr4eTmMGBtz3aNa1xtgU1u+110iJdjpTC8olWN4DWfG4O9P75HWSBOulN9ZxOlhugdj1NHVT9XlE/gZ2e8cSoApxu33rDszgjHFhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509970; c=relaxed/simple;
	bh=1E1PaJAheFq68IlA7LKJisHu/YP5aoXijmYjIj2LOcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PDArzLjyCv+C/4ktajeOq9tWM7VSZDJFkpiauy7szzoxg2R7gyJqet3N2Mhnjsq2+zwpZCkAnIbEF/Ue2XFix4tPgGlDJTd3CzPHEKpWhxUAtI3GiwGfSSu0VSsVz34BwzMbhiGy1b2SjCBRkkYgVyOabDlJ6hC2e5CBkr3J5qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5BJ9msl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5BJ9msl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5527EC19424;
	Sat, 18 Apr 2026 10:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509970;
	bh=1E1PaJAheFq68IlA7LKJisHu/YP5aoXijmYjIj2LOcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R5BJ9mslNIuk/rQ8w8TVMGSGl81yQn4ewVmXUObVsJbqOt8XM5keJgOYEHrHoGslk
	 K1MzO1HAp+qmj6fR2Bkbly0NUW2cLba/0YYw28pnpAgbtei4OfD1+I9hxuRX5FYH5q
	 938IgERuWpQz6+mBbT9ZcA6/BeJM3vws08TRSfZd0GclXUKsgCGWQchBYZjkZaa80e
	 4nXhHzzXpdQ06MXAqCiwilWujY9A322auFRdoakjn7uGTJhYvxBhgv2QIlv1Fpuii1
	 g78xSm3lAgRrHL0/3MJgHa1TmG573fCQ/ZzV/YE/+j/jqJimqj4eNZmXbdhBQ5LzuG
	 ggYScjwlwG/Nw==
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
Subject: [PATCH v2 36/53] selftests/mm: hugetlb-madvise: add setup of HugeTLB pages
Date: Sat, 18 Apr 2026 13:55:21 +0300
Message-ID: <20260418105539.1261536-37-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418105539.1261536-1-rppt@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

hugetlb-madvise test skips testing if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-madvise.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb-madvise.c b/tools/testing/selftests/mm/hugetlb-madvise.c
index 3c08eb6db6a2..b20648d025e6 100644
--- a/tools/testing/selftests/mm/hugetlb-madvise.c
+++ b/tools/testing/selftests/mm/hugetlb-madvise.c
@@ -68,9 +68,9 @@ int main(int argc, char **argv)
 	if (!base_page_size)
 		ksft_exit_fail_msg("Unable to determine base page size\n");
 
+	if (!hugetlb_setup_default(MIN_FREE_PAGES))
+		ksft_exit_skip("Not enough free huge pages (have %lu, need %d)\n", hugetlb_free_default_pages(), MIN_FREE_PAGES);
 	free_hugepages = hugetlb_free_default_pages();
-	if (free_hugepages < MIN_FREE_PAGES)
-		ksft_exit_skip("Not enough free huge pages (have %lu, need %d)\n", free_hugepages, MIN_FREE_PAGES);
 
 	fd = memfd_create(argv[0], MFD_HUGETLB);
 	if (fd < 0)
-- 
2.53.0


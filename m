Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E0047AF5D;
	Mon, 11 May 2026 16:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517185; cv=none; b=TI5PcHElsjlNCLt0S2Va8+BCkf52I1Di3SRU7ea7RKx8A4lPPZUFgzUfcxAY5JOGGZSpaA+CGvXPU9F26lzBnfjbf8NI1Dlxvb9mmo5NVxvX3awHrP+jc7jE3Ujf+jtI4SsFrHxdww3YUB8hLjcUyO6sg2rrxTcDov7b60Kh+hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517185; c=relaxed/simple;
	bh=PGUNJLeTrs0+FxJCoiMscYft26irwSFdLVHwxAtSeKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDk+QUYuoxyxOrrcmsKtGIrQY+EBkg3DH1hoF64KE1X4ahKcJwMfqwzpQ5vB5BqnhbvpJDJtqGXL3228V/4ArOFCsp3UsFj/9f3+IdkMEhAGEuOphS6oVy6M5KI4az7ABdxKLvm3mvH9i5yS3Xje98jTKYmSMUjzeCDjFMnXljQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IB8vbeSh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IB8vbeSh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0429FC32781;
	Mon, 11 May 2026 16:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517185;
	bh=PGUNJLeTrs0+FxJCoiMscYft26irwSFdLVHwxAtSeKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IB8vbeSh6iqRbtZTF5PCCe4501ekuh6NNGhPiFBBOn01TnQc1c+mXrAQ6UYXFfUCj
	 MHCirvop+trNmfNW44+8CjPIBDZr/xhsMgVS+Ix39j3EgzALihfshFL5ckjEeLC2+I
	 2UP4mqFvdA3L7cEeXhTskt4swO8+bWSXYdNJpPPBO9ERrWkDj5GY4KvfWApNIvMN7G
	 q68MeL+KESlYY8aAvrNkhaWjG53Y7zGlTfwpyRaZSbv4CoczDmw6hBIRlazjDmvj+3
	 CTO3/DrJPgCCxYGv7lODWIsLrsxTkL6fXlQJ54n7cmSQ/4tkSwAgd9QZ8MziTcmvuT
	 7qLknUDEbDMJg==
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
Subject: [PATCH v4 39/55] selftests/mm: hugetlb_madv_vs_map: add setup of HugeTLB pages
Date: Mon, 11 May 2026 19:28:23 +0300
Message-ID: <20260511162840.375890-40-rppt@kernel.org>
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

hugetlb_madv_vs_map test skips testing if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb_madv_vs_map.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
index dfbd71a7f709..f94549efcc6f 100644
--- a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
+++ b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
@@ -77,7 +77,6 @@ void *map_extra(void *unused)
 int main(void)
 {
 	pthread_t thread1, thread2, thread3;
-	unsigned long free_hugepages;
 	void *ret;
 
 	/*
@@ -89,11 +88,9 @@ int main(void)
 	ksft_print_header();
 	ksft_set_plan(1);
 
-	free_hugepages = hugetlb_free_default_pages();
-
-	if (free_hugepages != 1)
+	if (!hugetlb_setup_default_exact(1))
 		ksft_exit_skip("This test needs one and only one page to execute. Got %lu\n",
-			       free_hugepages);
+			       hugetlb_free_default_pages());
 
 	mmap_size = default_huge_page_size();
 
-- 
2.53.0


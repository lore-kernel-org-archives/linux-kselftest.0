Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3365943E9FD;
	Mon, 11 May 2026 16:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517192; cv=none; b=tge8ou+OuiHNIL7gpVMc1lqrsHo3Gul4FX0HAKo5HhhzlKJmnKz52DIHrtxAKNtXCuFOFzdvd05fuoaO8sPpngyiykF0tcXmAspYGGUmEMsCXWknvHBErnhuMMAy6wXqAIhx85TDb6gRUHet2f+Dv0j4rpcHFH81wRZ9DTRZ1hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517192; c=relaxed/simple;
	bh=HSX9kg2IS/ubAXfSb84boVRWxEKf4aiyTi8nFn1g0Rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TKIDGl8uv8Zat7dBAfJMac8AsrBWYSyhnypbtQ0MB9q6BRSWBl/ioUX+yr7kKev2qWF4Nb5kW2lXrwMmFhUEplvBJdCAMybbqpLMuq1czmymsX5/BNyBdD+8R6moWSQXYEsFHbqtOwO6wWU2m2HZSawfrxHnLa+Z6efg3HJgu+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvdcrMVx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvdcrMVx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB2BC2BCFB;
	Mon, 11 May 2026 16:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517191;
	bh=HSX9kg2IS/ubAXfSb84boVRWxEKf4aiyTi8nFn1g0Rg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RvdcrMVxgTlD0DLApCar0Phrt7oyJOPve7nnS6YFXtQJvp6pDdFEBBDqOkpaGriMX
	 MOsqY29mubuJ7lbNZWYNpsjvJ+BEmiXitkC+yLfg/uCkG0QMnwd04wHlSzyLFrVHgc
	 e+516ign+YOGQ4MZ2ZB/YhnWQrx9rSfRBSum2+YoFc/TgS5DQ0g06FjJ1IbMiJ/LaD
	 AaH9axL3mRkwBP/Zun5odG3Ndo9n59idae/On20pAQoiad8uLCgMFnm471z7CG/NCa
	 W9aaJ64kZw/5ifkij2S8v8snkmv7NSbsirSx2FUwne1Ng2R1jjugfI7qz9Km7eg7Gc
	 wWoVDysxchadQ==
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
Subject: [PATCH v4 40/55] selftests/mm: hugetlb-mmap: add setup of HugeTLB pages
Date: Mon, 11 May 2026 19:28:24 +0300
Message-ID: <20260511162840.375890-41-rppt@kernel.org>
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

hugetlb-mmap test fails if there are no free huge pages prepared by a
wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-mmap.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb-mmap.c b/tools/testing/selftests/mm/hugetlb-mmap.c
index 395be5d0dc1a..0f2aad1b7dbd 100644
--- a/tools/testing/selftests/mm/hugetlb-mmap.c
+++ b/tools/testing/selftests/mm/hugetlb-mmap.c
@@ -105,28 +105,35 @@ int main(int argc, char **argv)
 {
 	size_t hugepage_size;
 	size_t length = LENGTH;
-	int shift = 0;
+	int shift = 0, nr;
 
 	ksft_print_header();
-	ksft_set_plan(2);
 
 	if (argc > 1)
 		length = atol(argv[1]) << 20;
 	if (argc > 2)
 		shift = atoi(argv[2]);
 
+	hugetlb_save_settings();
 	if (shift) {
 		hugepage_size = (1UL << shift);
 		ksft_print_msg("%lu kB hugepages\n", 1UL << (shift - 10));
 	} else {
 		hugepage_size = default_huge_page_size();
+		if (!hugepage_size)
+			ksft_exit_skip("Could not detect default hugetlb page size.");
 		ksft_print_msg("Default size hugepages (%lu kB)\n", hugepage_size >> 10);
 	}
 
 	/* munmap will fail if the length is not page aligned */
-	if (hugepage_size > length)
-		length = hugepage_size;
+	length = (length + hugepage_size - 1) & ~(hugepage_size - 1);
+	nr = length / hugepage_size;
+
+	hugetlb_set_nr_pages(hugepage_size, nr);
+	if (hugetlb_free_pages(hugepage_size) < nr)
+		ksft_exit_skip("Not enough %lu Kb pages\n", hugepage_size >> 10);
 
+	ksft_set_plan(2);
 	ksft_print_msg("Mapping %lu Mbytes\n", (unsigned long)length >> 20);
 
 	test_anon_mmap(length, shift);
-- 
2.53.0


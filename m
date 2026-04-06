Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BEA382284;
	Mon,  6 Apr 2026 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485263; cv=none; b=FewZAIG+CMM/N64O4xp3LI+xQI9EAei8RuaCnPTQkXiSAE/sKlIu9LYo3eq48auWiHocDY9Y6ZQnA0iAQ1LbvVDI0M0lGVGW9YHgljNjEEBSuI5v9l2vURt9rhRkHOpsuum7cV/+Is0Yf069sOTk9Gl4sFnKGwMWS7LQ8CjUVx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485263; c=relaxed/simple;
	bh=dW6FhGF6pU1ym+r/rDESusHBHIrjPAzWgWJPywW+wGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tpYWOyMjY+y2wtgiDowWT+ZpyjnjOBlcdUCrHnhd4XgB3ZgMmBUeJgO8HEypZycYHATXU/Eq9iQWHIEFyJMPssGCbQIBT8c3Avi7wDYriQzM98lAKcIm7K+GYVP8N3R+tzujxOMYlk96d9Gw7SaqnEuNpbBT+N/LcwiRT2Fvduw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdQtychc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdQtychc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD53EC4CEF7;
	Mon,  6 Apr 2026 14:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485263;
	bh=dW6FhGF6pU1ym+r/rDESusHBHIrjPAzWgWJPywW+wGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pdQtychcMReUIrt09oRyA0UJ8OmK/l26NtUky7BjAammmLCIwIgyeqs2T3kiqfLOB
	 TZ/5J9UlCUcOOOGCXKQ6RjNcZiBe3V/xWcy53pB8MX3kNuaASkFssiGh1jxkCGGZ4y
	 HfFLFrBfVuUcHv7/kCZw1WO7nuDrj1A5o4uOjZ3/11ySuYO1sLLXc9i14SUJuE3j9+
	 RBEnCU1r3TPgJSHrK+67xoLAGboRkfv++aI9CSIilLwcK2xjQFadHyI8pLLA6O4a0b
	 Ipx5uedNL2cAgPjpQ59NLEhWRVLKACF4qKgKAuo0FXhwgROiGEydYZBhQ6jGdC/Or7
	 ZNYzfa4r8S4Pw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
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
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 34/53] selftests/mm: hugepage_dio: add setup of HugeTLB pages
Date: Mon,  6 Apr 2026 17:17:16 +0300
Message-ID: <20260406141735.2179309-35-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406141735.2179309-1-rppt@kernel.org>
References: <20260406141735.2179309-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

hugepage_dio test fails if there are no free huge pages prepared by a
wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb_dio.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb_dio.c b/tools/testing/selftests/mm/hugetlb_dio.c
index 47019433ddaf..fb4600570e13 100644
--- a/tools/testing/selftests/mm/hugetlb_dio.c
+++ b/tools/testing/selftests/mm/hugetlb_dio.c
@@ -85,8 +85,6 @@ static void run_dio_using_hugetlb(int fd, unsigned int start_off,
 
 	/* Get the default huge page size */
 	h_pagesize = default_huge_page_size();
-	if (!h_pagesize)
-		ksft_exit_fail_msg("Unable to determine huge page size\n");
 
 	/* Reset file position since fd is shared across tests */
 	if (lseek(fd, 0, SEEK_SET) < 0)
@@ -94,10 +92,6 @@ static void run_dio_using_hugetlb(int fd, unsigned int start_off,
 
 	/* Get the free huge pages before allocation */
 	free_hpage_b = hugetlb_free_default_pages();
-	if (free_hpage_b == 0) {
-		close(fd);
-		ksft_exit_skip("No free hugepage, exiting!\n");
-	}
 
 	/* Allocate a hugetlb page */
 	orig_buffer = mmap(NULL, h_pagesize, mmap_prot, mmap_flags, -1, 0);
@@ -141,8 +135,8 @@ int main(void)
 
 	ksft_print_header();
 
-	/* Check if huge pages are free */
-	if (!hugetlb_free_default_pages())
+	/* request a huge page */
+	if (!hugetlb_setup_default(1))
 		ksft_exit_skip("No free hugepage, exiting\n");
 
 	fd = open("/tmp", O_TMPFILE | O_RDWR | O_DIRECT, 0664);
-- 
2.53.0


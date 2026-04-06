Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2938A311C1B;
	Mon,  6 Apr 2026 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485078; cv=none; b=Dy1vy0UILY5htTIH2oe7uKjv2CSY/+UXNjvg31EQ84Zoxd1Jb2P+SgWCkwyHJY4hadIq5gjl9UDWi2WONvbrfwqsZIyfuyYSV0vq4cFw8vlSQuqPSiuwxNycrIzZOdP00djizss8suuLjDLHF+kBgPhhErujLP7z65RBRx50fBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485078; c=relaxed/simple;
	bh=a4vQJGv5oSnYFOAuEaEUtLL2TvNcolXC7zAnBLawpZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U3d94IiZAcZb+xXoekoaq88+mD8iEA2Ry1AnMBMkYtknJc2iyCoROlFfLLPtJEmwIbL+OzvD5n6L0vYJ9GFpHgUbtRbaJxyv6dS7OFXGpM9aLLgpF0pCmtSH1kJMtX7240W/p911BI3+yxB/+cLpOWGfHMTYOmg2mKJYgT3glmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEpsZlte; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEpsZlte"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F26C4CEF7;
	Mon,  6 Apr 2026 14:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485077;
	bh=a4vQJGv5oSnYFOAuEaEUtLL2TvNcolXC7zAnBLawpZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fEpsZltem1eqf2vgJDiHXUdg8MFqoj8Y/2ecLrFLGPhbPbGX5Ow5vo+HPlwwFJij6
	 CpuMNgzQJuuZJujPtp7VOQwLZhTNyXOYCMvy6ua10Fmx2vJUf8pk808Y5CV1lgtX7w
	 FvPPhk8IxfI+P5H+Enip053hbmb4PiBcQ4aGqOv95QQepXA9P+eaBE/QGkk/Jwg8s+
	 zXehD+T8JwqNQ26TJTRNOZrxSCG6iOpPCSnEKViBiHXUsLLWJDte7+BNhUi5BmnFxY
	 IH3nI0Je2ybhKam6EMDj5vedW+w8Qg0GduWk/9e1ayp38PL5wAwN5T4fekNfFIRpWS
	 khM9ESJ7g02GQ==
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
Subject: [PATCH 02/53] selftests/mm: khugepaged: enable collapse_single_pte_entry_compound for shmem
Date: Mon,  6 Apr 2026 17:16:44 +0300
Message-ID: <20260406141735.2179309-3-rppt@kernel.org>
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

A comment in collapse_single_pte_entry_compound() says it can't run on
shmem because "MADV_DONTNEED can't evict tmpfs pages".
But MADV_REMOVE can!

Use MADV_REMOVE for tmpfs to evict pages and enable
collapse_single_pte_entry_compound() test for shmem.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 3fe7ef04ac62..e6fb01ca44ed 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -783,20 +783,17 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
 
 static void collapse_single_pte_entry_compound(struct collapse_context *c, struct mem_ops *ops)
 {
+	int advise = MADV_DONTNEED;
 	void *p;
 
 	p = alloc_hpage(ops);
 
-	if (is_tmpfs(ops)) {
-		/* MADV_DONTNEED won't evict tmpfs pages */
-		printf("tmpfs...");
-		skip("Skip");
-		goto skip;
-	}
+	if (is_tmpfs(ops))
+		advise = MADV_REMOVE;
 
 	madvise(p, hpage_pmd_size, MADV_NOHUGEPAGE);
 	printf("Split huge page leaving single PTE mapping compound page...");
-	madvise(p + page_size, hpage_pmd_size - page_size, MADV_DONTNEED);
+	madvise(p + page_size, hpage_pmd_size - page_size, advise);
 	if (ops->check_huge(p, 0))
 		success("OK");
 	else
@@ -805,7 +802,6 @@ static void collapse_single_pte_entry_compound(struct collapse_context *c, struc
 	c->collapse("Collapse PTE table with single PTE mapping compound page",
 		    p, 1, ops, true);
 	validate_memory(p, 0, page_size);
-skip:
 	ops->cleanup_area(p, hpage_pmd_size);
 }
 
@@ -1251,8 +1247,10 @@ int main(int argc, char **argv)
 
 	TEST(collapse_single_pte_entry_compound, khugepaged_context, anon_ops);
 	TEST(collapse_single_pte_entry_compound, khugepaged_context, file_ops);
+	TEST(collapse_single_pte_entry_compound, khugepaged_context, shmem_ops);
 	TEST(collapse_single_pte_entry_compound, madvise_context, anon_ops);
 	TEST(collapse_single_pte_entry_compound, madvise_context, file_ops);
+	TEST(collapse_single_pte_entry_compound, madvise_context, shmem_ops);
 
 	TEST(collapse_full_of_compound, khugepaged_context, anon_ops);
 	TEST(collapse_full_of_compound, khugepaged_context, file_ops);
-- 
2.53.0


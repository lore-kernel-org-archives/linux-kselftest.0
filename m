Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13339285CB6;
	Sat, 18 Apr 2026 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509761; cv=none; b=Sz9WN9h32YGkP2GcUmocEjgkAQ4uvMj2PjAuYyOhy7f05zNWTrf1pwJr3ngfsPWnzwEP2IOgtFe93QEwz/pL+UqFsiMzn/7csJRXgL/9J/20V0RAAoC1uz7zW4thCLl62XK9kipPgTNNC1YeAyHi/k1tqz5T4xrejgh9CBw5phk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509761; c=relaxed/simple;
	bh=a4vQJGv5oSnYFOAuEaEUtLL2TvNcolXC7zAnBLawpZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iuGtvWcEpLCVZLxqIOPvkHXanEu0FiU5hUkrNEAbhPFIjyOPzsh1abTKtjMvOYZRjh2B4i1ipJZMSgSlOBOaRcvinsJCO+OfSa0ZzwZWvrqaLMBGA1lAhJNVCH+O+J1Wuc72Qa+/v95l6FB0HJyKZjpJCiPw/KxO34AdniLRuiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fU5Wkbz9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fU5Wkbz9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212E0C2BCB5;
	Sat, 18 Apr 2026 10:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509760;
	bh=a4vQJGv5oSnYFOAuEaEUtLL2TvNcolXC7zAnBLawpZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fU5Wkbz9Sja6783ANt39zjljXRh68I8sQh4T5JbPnOi4qhQemlSPv0o9OMbFO447h
	 RWhwPCIk4pfY8epTLLPBtMea9XNdF+gamIZqp3rcgUrVfLZDR7SYMM4XMAkrd9S58R
	 tPRj63i2JmHfnJ6Ojwcfo5JtbghLxY+JApLP8qkTYdwkdTvx9jVagYDCmFVtrg8NHx
	 sUNGaPpQvUdtYus0fKiNYUeRKbSy6PRs/6W6LFFzRiKk0XOpcTnocl2HxPs5nX52OT
	 wW1njXV2z5eBHq5H8yeRkVRmYEJAnC9Z1A+niQzgD2pzAj6s436a3SO1EaMsVusZMm
	 mgmJHq+qGq4+w==
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
Subject: [PATCH v2 02/53] selftests/mm: khugepaged: enable collapse_single_pte_entry_compound for shmem
Date: Sat, 18 Apr 2026 13:54:47 +0300
Message-ID: <20260418105539.1261536-3-rppt@kernel.org>
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


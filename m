Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFE935AC37;
	Sat, 18 Apr 2026 10:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509982; cv=none; b=PPgh424NQVMEXT19zaa5WSnwxzA2DPm1YzjKSJNwuiKlxBQLNzLvqnO5Jo0am1ocgOnogknRSPWSnMNoMtfgjo2V4i6gD54CRAnPHYuXnonYIRFTnIhJZl4HbH8FtOilrcYvG/nKLO+GCMgZubCtqlbycLJtmykCcu7ZK23KnJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509982; c=relaxed/simple;
	bh=F5Wx66XeR8OpgrD7KwXUlLY+bzqPcaE/6HGIjMYJD1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pPr69ET2jiEHALXMJDV4heCqXAKEnoVrAqTfP+Bm49dhuormC5/7rEHMB/I3N8v01HVDO/950ndxdjfhCMmXpJCb60oXMLeXxxa/fuWWWcBG3wqxOyOsCb1X0M/8XGygk9ia+2i3dPKfXah5aifKKHt6416dipPLveYwhBTIIyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbz5b8Om; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbz5b8Om"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5EFC19424;
	Sat, 18 Apr 2026 10:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509982;
	bh=F5Wx66XeR8OpgrD7KwXUlLY+bzqPcaE/6HGIjMYJD1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nbz5b8Om0FfnosyCP8hYZhe6QvCcEJXMCrYtfkSmRMjD2ryRtB4aozsMpSynpM2/a
	 GqIVvYrlSRrNBiOmvFHK2dizYwpA1WYspVxS08tZKVS1fCj0z8HfxtuAjbTBqa7ThC
	 NZzLlDYNybslEe+bpDMdQKjHw651mbVQctFCkbdHmTWkIaIjZxvcyfA0YkaBVOfaVo
	 pXO5zFH+OcAmhvZphPeL9NNCmV/6fWyMcyLFeiv3T2aDRgaqL+ypWKgyoDNo1T/H4I
	 stAnfY+nu0H1XywfifEqLlf8A3n2bXHmh4mxaqNthPiozCQzfgqHiJ+yXcJwlU6/Ju
	 5Toh4ilx9724g==
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
Subject: [PATCH v2 38/53] selftests/mm: hugetlb-mmap: add setup of HugeTLB pages
Date: Sat, 18 Apr 2026 13:55:23 +0300
Message-ID: <20260418105539.1261536-39-rppt@kernel.org>
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

hugetlb-mmap test fails if there are no free huge pages prepared by a
wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-mmap.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb-mmap.c b/tools/testing/selftests/mm/hugetlb-mmap.c
index 3a7dd630f425..d629cf22bf5d 100644
--- a/tools/testing/selftests/mm/hugetlb-mmap.c
+++ b/tools/testing/selftests/mm/hugetlb-mmap.c
@@ -106,10 +106,9 @@ int main(int argc, char **argv)
 {
 	size_t hugepage_size;
 	size_t length = LENGTH;
-	int shift = 0;
+	int shift = 0, nr;
 
 	ksft_print_header();
-	ksft_set_plan(2);
 
 	if (argc > 1)
 		length = atol(argv[1]) << 20;
@@ -125,9 +124,13 @@ int main(int argc, char **argv)
 	}
 
 	/* munmap with fail if the length is not page aligned */
-	if (hugepage_size > length)
-		length = hugepage_size;
+	length = (length + hugepage_size) & ~(hugepage_size - 1);
+	nr = length / hugepage_size;
+
+	if (!hugetlb_setup_default(nr))
+		ksft_exit_skip("Not enough %lu Kb pages\n", hugepage_size >> 10);
 
+	ksft_set_plan(2);
 	ksft_print_msg("Mapping %lu Mbytes\n", (unsigned long)length >> 20);
 
 	test_anon_mmap(length, shift);
-- 
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF584A35;
	Tue, 28 Apr 2026 20:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409228; cv=none; b=gGzqwdCP6EWn6qjVsH1Kvs5pbKvsTrt86Z4aZP4EiUNY/HdEBvJo5mADglw1/M2VWNOHIf0cVW9YKkH+7kqG7Jwf8EKeKMpw5bhUq0eF1OMX8KJOEO2PNwwyMu9R6f50wIuswwSELyfPkjlG/qW9FHkkZcV4zIzoY0g8R7Vm1us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409228; c=relaxed/simple;
	bh=H40+pLu8ZXyLLCNuZ1aw7t2Lxy9FF78cv/g7Q6Z1blI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eNMiZTs7M0wx4rfvfhIB28ysVqm7ktJuIoTK5A3INcpBtaNiXjWZyNjuOcnr5qWDxXYgg9Fs68vaOWqu9K81lte7VmTQXthpvC/F0vMS4FvFVxzXxUr+dV87+fTqR760r9/rGEyhHQhh8+HFlCGhHHZV2xXaq63KE5YpGpruKJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUpSi+Wl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUpSi+Wl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298C0C2BCAF;
	Tue, 28 Apr 2026 20:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409228;
	bh=H40+pLu8ZXyLLCNuZ1aw7t2Lxy9FF78cv/g7Q6Z1blI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CUpSi+WlocgmOIRAqyCd2U0J+RRYYD0kUVlOkWBufcWndXzjq+aJv3VMiMpWVyD8z
	 ozi9L2nDHyBbYziKZZ1i7gja3h1ARE4bu52ED0clgVQgZXX1ivXZSQWZBpTW1LgLhR
	 IQ4OTgGQL21uWskksLhlCdonNTDXdCtIePG/Whe0MAlO0WSx+g1ilu9EinYENtB1/6
	 h7LBHRYPbTFIIHFWFa1BWOtAjaKwu86h9qMcDpxiXfCb+jeW7LAJ0nf20xpKYTHzF2
	 ComEQb8K1hGs1ctWo74laWEXNg4dFfgkEY+nMvzfEOwFs9czach7b/BvD4O9gjWYbC
	 6Zx00aMg0ep0A==
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
Subject: [PATCH v3 39/54] selftests/mm: hugetlb-mmap: add setup of HugeTLB pages
Date: Tue, 28 Apr 2026 23:42:25 +0300
Message-ID: <20260428204240.1924129-40-rppt@kernel.org>
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

hugetlb-mmap test fails if there are no free huge pages prepared by a
wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-mmap.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb-mmap.c b/tools/testing/selftests/mm/hugetlb-mmap.c
index 031085cb7d17..f12fc288ef4f 100644
--- a/tools/testing/selftests/mm/hugetlb-mmap.c
+++ b/tools/testing/selftests/mm/hugetlb-mmap.c
@@ -109,16 +109,16 @@ int main(int argc, char **argv)
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
 		hugepage_size = (1 << shift);
 		ksft_print_msg("%u kB hugepages\n", 1 << (shift - 10));
@@ -128,9 +128,14 @@ int main(int argc, char **argv)
 	}
 
 	/* munmap with fail if the length is not page aligned */
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


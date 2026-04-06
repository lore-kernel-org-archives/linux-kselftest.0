Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72B338237F;
	Mon,  6 Apr 2026 14:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485274; cv=none; b=HnTfRclhFgUe6MfZUhATiAP8gPy4FMrt1f7UOwwvK1hn0s4A8uEqO05GnvGv85kZLPN17WkWQn4pFI10GmNvo5rOyJbg7OuqI6r0nPhZ7mJO4i63v0zgd44O64bMYkLxoxu/NmTTuZFDOT/mJQ4jjECmoQlkC4Vx5h9acAnQLgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485274; c=relaxed/simple;
	bh=1E1PaJAheFq68IlA7LKJisHu/YP5aoXijmYjIj2LOcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5iCF+WSkspHstDiH6zq7OzccgyNGpYCFDjbcaWWqVwEdqDX7NMZ4AhDD+f9K3InuO0jetqf48YJeL88b5lJgWZjB6UwpahUZubOvPRkjpG4TjnUUtVry/fCHU5OdSJnSvM/ZGmq+3E1LY+1AcS2HPx0q9h4DS1k3kTX78wtFiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F26V/ngD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F26V/ngD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFD7C4AF0B;
	Mon,  6 Apr 2026 14:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485274;
	bh=1E1PaJAheFq68IlA7LKJisHu/YP5aoXijmYjIj2LOcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F26V/ngDISfUxXDEjbjCfD4dgkfEyZ7yLYKiAYXU3dZvt78HSd6yW8f/Aynk1/ykz
	 dllKi8Ge+eEDBUDSMJcm4pet77fXPNXVfpxmenPaAYUalmvRMQuMqV7m3v5ZEZyk6y
	 CSaDsayvVihY6TsIPfkAQWIlNwpyo5mOUSqxnmEUjPJW79Gn56z7kfUMOCjCzUVFiH
	 mNbeavG5e8L4W1vXgjmAUZFpDHvHIThbOO5blkWTfYvD+gOw9bYWOyjHm4bJjsHrfH
	 zfsvpZ+RvnxS5EuPznLvW10btFFCYHU1ihazksnij/taKvU5pOSgnlHgx2s5Hkukzx
	 UiVe4U+7kYhpQ==
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
Subject: [PATCH 36/53] selftests/mm: hugetlb-madvise: add setup of HugeTLB pages
Date: Mon,  6 Apr 2026 17:17:18 +0300
Message-ID: <20260406141735.2179309-37-rppt@kernel.org>
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


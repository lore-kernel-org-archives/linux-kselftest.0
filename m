Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB8537E317;
	Mon,  6 Apr 2026 14:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485112; cv=none; b=cXx/qqAfikXPyTgTsBLmwF9ZZrelqlSjHgQ2l71jsATpim0cha9/Kimg78o/IGUC1N1wwWpnxd1J0bhkAGAg08m5yLM9t8xGaS/YWCJxDfaB5dfai+cbsfaEiWTlzpbOW9GciM6HOliBYkGGMwWs4zXua62KqzWGg6DKdLyq0Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485112; c=relaxed/simple;
	bh=cHW95NZ42YfNcufefUqyP5vy9sk2uSEi5NqGd6FjA9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFB1bV/85F+kb6kvOomNwqZkBIprVEYG67Cb4o07m0ljbX4ctyWNHds+3+3TBMa2lQgljFUbJ/RMY634B9KPXfXnhUbMXfwToVJ2ZFp28AXYAjfSRGQzvlGoKOqtN0iIDYiAYRb4I6AyBIASrCO8/pSwRcRV0xH3mhCPW9npEU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbDpBxXk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbDpBxXk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3500BC2BC9E;
	Mon,  6 Apr 2026 14:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485112;
	bh=cHW95NZ42YfNcufefUqyP5vy9sk2uSEi5NqGd6FjA9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UbDpBxXkoh2MOdnNvogyfcjAd9o0RD0BIw5YWHsmCZEsSyouqb2A7B7qKWwXSuNL5
	 zU1k8lkIyulvmUhm5+oHtElMogza3qEtmnAsQTVQIsVpcn/zk8MDwvjxx1Rs88y5X+
	 jGR7y59IhXmfOC8/hkmCEJilYFRDQl1prX+P52/dPuHCILqGj8Xzo5dPghyfg1LjSC
	 q+heU+tRNJmzpCq30Zgnums5QbRXB1FDsiSglkpizQw+wQt6511TUj9WiP/75JhXHd
	 yP4o0JUBpw4hHuApGXB1xPjf/MhyyUzDfecYAm6fdE5tFmvVMTOBYbkBQzhK9VNOrv
	 rBfMhQ0x1BhSw==
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
Subject: [PATCH 08/53] selftests/mm: hugetlb-vmemmap: use kselftest framework
Date: Mon,  6 Apr 2026 17:16:50 +0300
Message-ID: <20260406141735.2179309-9-rppt@kernel.org>
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

Convert hugetlb-vmemmap test to use kselftest framework for reporting
and tracking successful and failing runs.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-vmemmap.c | 42 +++++++++-----------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb-vmemmap.c b/tools/testing/selftests/mm/hugetlb-vmemmap.c
index df366a4d1b92..485a6978b40f 100644
--- a/tools/testing/selftests/mm/hugetlb-vmemmap.c
+++ b/tools/testing/selftests/mm/hugetlb-vmemmap.c
@@ -63,7 +63,7 @@ static int check_page_flags(unsigned long pfn)
 	read(fd, &pageflags, sizeof(pageflags));
 	if ((pageflags & HEAD_PAGE_FLAGS) != HEAD_PAGE_FLAGS) {
 		close(fd);
-		printf("Head page flags (%lx) is invalid\n", pageflags);
+		ksft_print_msg("Head page flags (%lx) is invalid\n", pageflags);
 		return -1;
 	}
 
@@ -77,7 +77,7 @@ static int check_page_flags(unsigned long pfn)
 		if ((pageflags & TAIL_PAGE_FLAGS) != TAIL_PAGE_FLAGS ||
 		    (pageflags & HEAD_PAGE_FLAGS) == HEAD_PAGE_FLAGS) {
 			close(fd);
-			printf("Tail page flags (%lx) is invalid\n", pageflags);
+			ksft_print_msg("Tail page flags (%lx) is invalid\n", pageflags);
 			return -1;
 		}
 	}
@@ -91,44 +91,38 @@ int main(int argc, char **argv)
 {
 	void *addr;
 	unsigned long pfn;
+	int ret;
+
+	ksft_print_header();
+	ksft_set_plan(1);
 
 	pagesize  = psize();
 	maplength = default_huge_page_size();
-	if (!maplength) {
-		printf("Unable to determine huge page size\n");
-		exit(1);
-	}
+	if (!maplength)
+		ksft_exit_skip("Unable to determine huge page size\n");
 
 	addr = mmap(NULL, maplength, PROT_READ | PROT_WRITE,
 			MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
-	if (addr == MAP_FAILED) {
-		perror("mmap");
-		exit(1);
-	}
+	if (addr == MAP_FAILED)
+		ksft_exit_fail_perror("mmap");
 
 	/* Trigger allocation of HugeTLB page. */
 	write_bytes(addr, maplength);
 
 	pfn = virt_to_pfn(addr);
 	if (pfn == -1UL) {
+		ksft_perror("virt_to_pfn");
 		munmap(addr, maplength);
-		perror("virt_to_pfn");
-		exit(1);
+		ksft_exit_fail();
 	}
 
-	printf("Returned address is %p whose pfn is %lx\n", addr, pfn);
+	ksft_print_msg("Returned address is %p whose pfn is %lx\n", addr, pfn);
 
-	if (check_page_flags(pfn) < 0) {
-		munmap(addr, maplength);
-		perror("check_page_flags");
-		exit(1);
-	}
+	ret = check_page_flags(pfn);
 
-	/* munmap() length of MAP_HUGETLB memory must be hugepage aligned */
-	if (munmap(addr, maplength)) {
-		perror("munmap");
-		exit(1);
-	}
+	if (munmap(addr, maplength))
+		ksft_exit_fail_perror("munmap");
 
-	return 0;
+	ksft_test_result(!ret, "HugeTLB vmemmap page flags\n");
+	ksft_finished();
 }
-- 
2.53.0


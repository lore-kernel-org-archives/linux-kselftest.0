Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFB9383C82;
	Mon,  6 Apr 2026 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485338; cv=none; b=Gbyp4owLtetFBF7caopjZGy2Z4xe+ar56tafhCvenhr6RTQXwMY6edA0EtLGKlzvD3uZ9n5g3XjktQQBQ1KDOJfzjhaoht2Fa01dKkXAhvH1qFAPWvzeu7kkeWk1eq4nH1XR6+uapb1Si/D9H9TnTuHXCrj4SHyHrWnNNpH1lM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485338; c=relaxed/simple;
	bh=n2KgdfeDkv6qGICkBg3Vwdx+MRmhbjeNlFxUjnQTB8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OvdmXlRfk/74+zoHsafuMUGacDuYpGrVH2hYJrAbCRm6K/IEUibCM98bdj4jy9BddJN244B5frb9QF69rwBTM/TxifulbqFQkc+p8awajkVbn2IkO1n0RNR1WSvpr1sv5fgQsgpP0vHz0k/llW0SwGKyT6RDpSkmDxQvIiJaULE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVQdV5Nj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVQdV5Nj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024D9C4CEF7;
	Mon,  6 Apr 2026 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485338;
	bh=n2KgdfeDkv6qGICkBg3Vwdx+MRmhbjeNlFxUjnQTB8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HVQdV5NjOMae23YnkDJqbhXIXRIvarXLiGjQXNzVM1HhAdxTHA473+q34g55LSTac
	 +5Ic3jvWPiNUGJpsG2uFYh7yZs8OvMHrkXBVedvuRYGYipe+UY4//sbJKeg8G/peh+
	 G+OVu7eMqtC3fbRRBnQNpexqPfNnBENZM1Fc6yrAXZ6uPcH8PBASGM1RcMDGN3T4kX
	 RwmwF1jYqQPiW73FOCrlY8fblS3zwrks7eIj5di3ZWIO0aijiia7q3uVw8JqGNYv9Z
	 wpvvhhSx+81KPECoqbjFMVsBcAEWWMCJccHepUog8B0+9IZ72YU3O1x7aPuPUc1gsN
	 cWH3yZDX38qOQ==
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
Subject: [PATCH 47/53] selftests/mm: uffd-stress: use hugetlb_save and alloc huge pages
Date: Mon,  6 Apr 2026 17:17:29 +0300
Message-ID: <20260406141735.2179309-48-rppt@kernel.org>
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

uffd-stress skips HugeTLB tests if there are no free huge pages prepared
by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/uffd-stress.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-stress.c b/tools/testing/selftests/mm/uffd-stress.c
index 7e37cf3d27f6..9693d042f16f 100644
--- a/tools/testing/selftests/mm/uffd-stress.c
+++ b/tools/testing/selftests/mm/uffd-stress.c
@@ -479,9 +479,12 @@ int main(int argc, char **argv)
 	 * Ensure nr_parallel - 1 hugepages on top of that to account
 	 * for racy extra reservation of hugepages.
 	 */
-	if (gopts->test_type == TEST_HUGETLB &&
-	   hugetlb_free_default_pages() < 2 * (bytes / gopts->page_size) + gopts->nr_parallel - 1)
-		ksft_exit_skip("Skipping userfaultfd... not enough hugepages\n");
+	if (gopts->test_type == TEST_HUGETLB) {
+		unsigned long nr = 2 * (bytes / gopts->page_size) + gopts->nr_parallel - 1;
+
+		if (!hugetlb_setup_default(nr))
+			ksft_exit_skip("Skipping userfaultfd... not enough hugepages\n");
+	}
 
 	gopts->nr_pages_per_cpu = bytes / gopts->page_size / gopts->nr_parallel;
 	if (!gopts->nr_pages_per_cpu) {
-- 
2.53.0


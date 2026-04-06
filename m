Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E7F3815E2;
	Mon,  6 Apr 2026 14:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485286; cv=none; b=PV1zisqLkmxHQTlNY0CQsUAXUdSq/FgAVfmbZ3meB24IBcsnnkpJtswncr9YalW1GnWdu9zGtL3DvPscHD1gQQIm9wv57hoWqg3AI1Fxm5b7GuLDq5gdJeThzh2tL0fUx7qwQc1QSDCjTBeX6cg4KMfyNhxqbDTMuKbOqt80y+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485286; c=relaxed/simple;
	bh=dRPuiqqQJpQXjw6cIRi4fzLi2hziGrsSJ9cBq+BFA+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kO26hvNe6YBDAQ0upE/yUdkip0YVpyWCjdG2Y7WvuDXQMvM9GBuCbwGS32HWHc77jfz7WRzoeu9X61DCq5dgU+8pFMOnALmuze7vYBHoeK/PUnaUo0BKDvUJvzJYHJLfARw5EpXWxWOIpq326sSjs7hu10cbvDq9ERPZEmlnf8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMGesjNd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMGesjNd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A6EC4CEF7;
	Mon,  6 Apr 2026 14:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485286;
	bh=dRPuiqqQJpQXjw6cIRi4fzLi2hziGrsSJ9cBq+BFA+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GMGesjNduweHgKIV8krEDAGqLHO1r7xXJwYnceTnP6WCbRkgyqukMlbpdcz1Tn5+Z
	 KFRjqfaIPsIRfpjqovZhkQh6g464H5Qzjb8YNPudW9iZ6K3lqB6V1ENeS61eQy0daZ
	 dc9j/XUPWpDM/uNWmNamftKB9kX5QSiwEmZN9pZXEnLckPGSXG/OGka4lZwpNHb5uY
	 WxcD7uqyznnQ2O3UV3jHPgjGBUUOfWmNeba26uYXcPz0l78sBxA5snpMZpJo+GAkSB
	 s7DmLkMhGKqBkDueA5vx5yaoNA8GzsNNk9uFKCdxqmhJp0HU8jdOqxd+WOUdGJ1IOO
	 iD1OseX1StzOg==
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
Subject: [PATCH 38/53] selftests/mm: hugetlb-mmap: add setup of HugeTLB pages
Date: Mon,  6 Apr 2026 17:17:20 +0300
Message-ID: <20260406141735.2179309-39-rppt@kernel.org>
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

hugetlb-mmap test fails if there are no free huge pages prepared by a
wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-mmap.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb-mmap.c b/tools/testing/selftests/mm/hugetlb-mmap.c
index 5be68fbc36dc..d4edb233101d 100644
--- a/tools/testing/selftests/mm/hugetlb-mmap.c
+++ b/tools/testing/selftests/mm/hugetlb-mmap.c
@@ -107,10 +107,9 @@ int main(int argc, char **argv)
 {
 	size_t hugepage_size;
 	size_t length = LENGTH;
-	int shift = 0;
+	int shift = 0, nr;
 
 	ksft_print_header();
-	ksft_set_plan(2);
 
 	if (argc > 1)
 		length = atol(argv[1]) << 20;
@@ -126,9 +125,13 @@ int main(int argc, char **argv)
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


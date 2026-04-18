Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC963603EC;
	Sat, 18 Apr 2026 11:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776510051; cv=none; b=t+LNNxaZE2vL7V6JcwF0GUqEQ8NhSEEuHTGptRbyDXGHi4eIWjN6hgtQTTutvyfEMZe2YjmOY43LNTBixaBp/OUj0p2wqkgWprdUaU/rdN82kmqwGOwCILt4NNzFlEJRJke+5Jx8kmO3hS6xbTlmyG7cHcG/0yrQivBfnpSRyzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776510051; c=relaxed/simple;
	bh=HtpaUkBbB7ijuw6rctcgEdxPGwj4VxmBP6AvOyp0uHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZ6Ew+ZBl/2OOZ288huu6Y/a5WwqdBkm2khaoVjYZiWX+p6QAClYIkWvbL3LhYvyro6JhynDx8iYHSVg+Em3XigXPqoYu2dDMmcJMNnJC4EABnKq09lNsS4Qb1N4Ds6hFbbZlbFB5SNW4IRdoh6xkkYj/1Vd59Rez9+F/hgf1UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVA5jPII; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVA5jPII"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21DEC2BCB3;
	Sat, 18 Apr 2026 11:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776510050;
	bh=HtpaUkBbB7ijuw6rctcgEdxPGwj4VxmBP6AvOyp0uHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MVA5jPIINjA7F3oQghv84OSH2WSMeHnn/YBfm6n14Q9z0tjRkKUGb2q7gaxzMRmUg
	 o5yi0rCKBCxtl/HhHs1yr+W84697sgcBz0oNnYkqQaZZD9TjIfduUzlscnCGrDX0aB
	 VPO00MQx69uXOZfy+Yh42H58IVXOT+A2n0wWjEPjGCQzgrNZp8u3kdD74vNr6vMYvx
	 CAX+dPz4dP0GaqWHm48kwli5oW7KqjpjqbGz2hUBDVRHqn+UuZiZi4uv1CbZedn4wc
	 R/AlI+NDGTnqKxvPg0IJxenmMcL4MSz4xBKB3pmCzmDskIoHS3yFqmNm5wB2qy/twQ
	 monjMk+chBMZg==
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
Subject: [PATCH v2 49/53] selftests/mm: uffd-wp-mremap: add setup of HugeTLB pages
Date: Sat, 18 Apr 2026 13:55:34 +0300
Message-ID: <20260418105539.1261536-50-rppt@kernel.org>
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

uffd-wp-remap skips HugeTLB tests if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/uffd-wp-mremap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-wp-mremap.c b/tools/testing/selftests/mm/uffd-wp-mremap.c
index 9d67b11c2f28..f63fe02f404f 100644
--- a/tools/testing/selftests/mm/uffd-wp-mremap.c
+++ b/tools/testing/selftests/mm/uffd-wp-mremap.c
@@ -336,14 +336,14 @@ int main(int argc, char **argv)
 	struct thp_settings settings;
 	int i, j, plan = 0;
 
+	hugepage_save_settings(true, true);
+
 	pagesize = getpagesize();
 	nr_thpsizes = detect_thp_sizes(thpsizes, ARRAY_SIZE(thpsizes));
-	nr_hugetlbsizes = detect_hugetlb_page_sizes(hugetlbsizes,
-						    ARRAY_SIZE(hugetlbsizes));
+	nr_hugetlbsizes = hugetlb_setup(1, hugetlbsizes, ARRAY_SIZE(hugetlbsizes));
 
 	/* If THP is supported, save THP settings and initially disable THP. */
 	if (nr_thpsizes) {
-		thp_save_settings();
 		thp_read_settings(&settings);
 		for (i = 0; i < NR_ORDERS; i++) {
 			settings.hugepages[i].enabled = THP_NEVER;
-- 
2.53.0


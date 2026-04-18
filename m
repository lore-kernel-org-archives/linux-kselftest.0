Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE4D355F52;
	Sat, 18 Apr 2026 10:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509933; cv=none; b=GGjHIen0kctW4E7v3Eszwisl4hDE6DuRTweygAByW7FppmegJvm+baQbaMBVO4hd8DHWjvK4I5DNaP6wPIxgmmBHcKrJiE5GPsSDnjmS5FIsjzu6b6FQkLJrDYwymCuZ3OYXdKWlFTRVYx/I29SVvzPTg9TEcoHFNmD1VMxcxC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509933; c=relaxed/simple;
	bh=1/ugYRnvvCSRn7Fw/zm14SmACzlAtT74uoyJWfVmAG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qbPwdbQn7AKWFuQ5LLC+23oypV6CCyHqxgvlifXAYABuKodFt/QYqoxFa+rNLpJeTMXIlV/gpKKld14t3s23huHCrOg3V2u5zs8aj61r5PYwunLiSBVi3JLVWMn8t8pevyOWA9byvtABoJfO8TzsrL0GTpFMZQ5U3bYf7BZr9m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GaYvJpiU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GaYvJpiU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C54C2BCB3;
	Sat, 18 Apr 2026 10:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509933;
	bh=1/ugYRnvvCSRn7Fw/zm14SmACzlAtT74uoyJWfVmAG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GaYvJpiUhsFjtAZ6oeEfPRx/pDSIplMUmXnj8hsUT96vWC7ZP7+1Ea3T30s/eF94q
	 eKwXJsTOAnnBsGeNPkSmN5Gge3gcCZsHttWZQuA5S1Xdal4Wa+yRCt72wcdTRYVSw2
	 Vq0R2kuAVWMgrcQpyuRkMO5IXDnz2a9IMetzEEpNIDaXWn0UwgA/uq4u2yvXNnuBHi
	 4Yr1BeujIa1LBCQcjvTnNsPjHFQ0aT7tR643fszmn0nYlqhmMbFvsb12hWhn7iVQlh
	 XBgaInMNWixJfVi6KKF27h3E7ulZb1AEgipizlM0LmPhLz/dN865L5L1zq79f3maBg
	 vIGexg/0WiFSg==
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
Subject: [PATCH v2 30/53] selftests/mm: cow: add setup of HugeTLB pages
Date: Sat, 18 Apr 2026 13:55:15 +0300
Message-ID: <20260418105539.1261536-31-rppt@kernel.org>
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

cow tests skips HugeTLB tests if there are no free huge pages prepared
by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/cow.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
index 4321f4208fe3..1df513bf362d 100644
--- a/tools/testing/selftests/mm/cow.c
+++ b/tools/testing/selftests/mm/cow.c
@@ -1881,21 +1881,21 @@ int main(int argc, char **argv)
 
 	ksft_print_header();
 
+	hugepage_save_settings(true, true);
+
 	pagesize = getpagesize();
 	pmdsize = read_pmd_pagesize();
 	if (pmdsize) {
 		/* Only if THP is supported. */
 		thp_read_settings(&default_settings);
 		default_settings.hugepages[sz2ord(pmdsize, pagesize)].enabled = THP_INHERIT;
-		thp_save_settings();
 		thp_push_settings(&default_settings);
 
 		ksft_print_msg("[INFO] detected PMD size: %zu KiB\n",
 			       pmdsize / 1024);
 		nr_thpsizes = detect_thp_sizes(thpsizes, ARRAY_SIZE(thpsizes));
 	}
-	nr_hugetlbsizes = detect_hugetlb_page_sizes(hugetlbsizes,
-						    ARRAY_SIZE(hugetlbsizes));
+	nr_hugetlbsizes = hugetlb_setup(2, hugetlbsizes, ARRAY_SIZE(hugetlbsizes));
 	has_huge_zeropage = detect_huge_zeropage();
 
 	ksft_set_plan(ARRAY_SIZE(anon_test_cases) * tests_per_anon_test_case() +
-- 
2.53.0


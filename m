Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6503A4F23;
	Mon, 11 May 2026 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517093; cv=none; b=uhP+jhQuPAf7Mr4E2RDyNNuFcSlNjvSPiH9uS0yd809lgUkKBFF3cR3RnSLY8c5PvAVAP8hn0hlCQlXICLKRmr9E3XI8ss+PrtfloO4U3QowRJZpqU2ZU0iNsOgMkYJpQPp4gnqEHw06I57sZkr8GHj3vl0nfEKnwXYNOQlZUPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517093; c=relaxed/simple;
	bh=siynKJJiNzHCisWCUvercIcpwfP0ofNm0Gk9TEdW0mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mX2NDnRTSTJ8lhyC5QhYngSB5G50nCI3554GQM36DPw3nagJqx3ezXjpXT7zIbwboaQiJZcn1QpwDJPK9ZKErvEaoLmIg2d9cjHWqFfTI1CMR6AZ4RaqbkxN4vRoQMhY39Lgp40/RtzRSnoKB4Ha2L/Wh83yfYjfZ1bsLwS9IJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOt6xw4y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOt6xw4y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B53CC2BCB0;
	Mon, 11 May 2026 16:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517093;
	bh=siynKJJiNzHCisWCUvercIcpwfP0ofNm0Gk9TEdW0mg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oOt6xw4yUlrEKWcf+ajWEIEYByypVJ1Tf/KQvQugPn1VRbXqqjOuZSSnRfoU1PAxE
	 0nhAzxPaQnxHgRVAOA/gTe2p0+vAUoVdGBcr2aU3WBoBMMZmRr7VA4KpGfFC9szAMx
	 Sk1g3/x8WaHDImzZyE7bLmEJhcFWKe7nuZro0NmjkhdZunIyFrc5DLtwyWjFaElL1U
	 agYcWvMiteOROCnE1HSTD6dPsAeXQIbTPk2Dp6WlTkzqfUA/UBet2umh5raXijM5kx
	 edNzevDMa40cEcndJcKirRfxTCDpkR8MIByrNo/4M1/RaB+IMxpZbmzD76nWZGt/83
	 WIfQBJI2H5vDw==
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
	Li Wang <li.wang@linux.dev>,
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
Subject: [PATCH v4 25/55] selftests/mm: hugepage_settings: use unsigned long in detect_hugetlb_page_size
Date: Mon, 11 May 2026 19:28:09 +0300
Message-ID: <20260511162840.375890-26-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511162840.375890-1-rppt@kernel.org>
References: <20260511162840.375890-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

... instead of size_t to avoid type mismatch in 32 and 64 bit builds.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/cow.c               | 2 +-
 tools/testing/selftests/mm/gup_longterm.c      | 2 +-
 tools/testing/selftests/mm/hugepage_settings.c | 2 +-
 tools/testing/selftests/mm/hugepage_settings.h | 2 +-
 tools/testing/selftests/mm/uffd-wp-mremap.c    | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
index 4321f4208fe3..5e571216b8d2 100644
--- a/tools/testing/selftests/mm/cow.c
+++ b/tools/testing/selftests/mm/cow.c
@@ -37,7 +37,7 @@ static size_t pmdsize;
 static int nr_thpsizes;
 static size_t thpsizes[20];
 static int nr_hugetlbsizes;
-static size_t hugetlbsizes[10];
+static unsigned long hugetlbsizes[10];
 static int gup_fd;
 static bool has_huge_zeropage;
 
diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
index ab4eaf4feb7c..96dae0acd11a 100644
--- a/tools/testing/selftests/mm/gup_longterm.c
+++ b/tools/testing/selftests/mm/gup_longterm.c
@@ -33,7 +33,7 @@
 
 static size_t pagesize;
 static int nr_hugetlbsizes;
-static size_t hugetlbsizes[10];
+static unsigned long hugetlbsizes[10];
 static int gup_fd;
 
 static __fsword_t get_fs_type(int fd)
diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
index 3d6e4376de06..fa635667aabb 100644
--- a/tools/testing/selftests/mm/hugepage_settings.c
+++ b/tools/testing/selftests/mm/hugepage_settings.c
@@ -398,7 +398,7 @@ bool thp_is_enabled(void)
 	return mode == 1 || mode == 3;
 }
 
-int detect_hugetlb_page_sizes(size_t sizes[], int max)
+int detect_hugetlb_page_sizes(unsigned long sizes[], int max)
 {
 	DIR *dir = opendir("/sys/kernel/mm/hugepages/");
 	int count = 0;
diff --git a/tools/testing/selftests/mm/hugepage_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
index 4c51e9219f6a..f49bd7fba512 100644
--- a/tools/testing/selftests/mm/hugepage_settings.h
+++ b/tools/testing/selftests/mm/hugepage_settings.h
@@ -90,7 +90,7 @@ bool thp_is_enabled(void);
 
 /* HugeTLB */
 
-int detect_hugetlb_page_sizes(size_t sizes[], int max);
+int detect_hugetlb_page_sizes(unsigned long sizes[], int max);
 unsigned long default_huge_page_size(void);
 unsigned long get_free_hugepages(void);
 
diff --git a/tools/testing/selftests/mm/uffd-wp-mremap.c b/tools/testing/selftests/mm/uffd-wp-mremap.c
index 9d67b11c2f28..b44e02840a5e 100644
--- a/tools/testing/selftests/mm/uffd-wp-mremap.c
+++ b/tools/testing/selftests/mm/uffd-wp-mremap.c
@@ -12,12 +12,12 @@
 #include "uffd-common.h"
 
 static int pagemap_fd;
-static size_t pagesize;
 static int nr_pagesizes = 1;
+static unsigned long pagesize;
 static int nr_thpsizes;
 static size_t thpsizes[20];
 static int nr_hugetlbsizes;
-static size_t hugetlbsizes[10];
+static unsigned long hugetlbsizes[10];
 
 static int detect_thp_sizes(size_t sizes[], int max)
 {
@@ -245,7 +245,7 @@ static void test_one_folio(uffd_global_test_opts_t *gopts, size_t size, bool pri
 }
 
 struct testcase {
-	size_t *sizes;
+	unsigned long *sizes;
 	int *nr_sizes;
 	bool private;
 	bool swapout;
-- 
2.53.0


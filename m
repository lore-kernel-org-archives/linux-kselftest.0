Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4A034EF0F;
	Sat, 18 Apr 2026 10:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509767; cv=none; b=kjblLq5IpvTzTL/DmAMdxZRgSm1rt/qDG8QPdQFW5U36Xgc5ue8+j1V2Xc2a0kquHFjl1W1ZwgsKKIFzj29+jcDTBRKmqMmHoQqjQp5PEsgIXC0J2Jw4Jp58ZuphP3n2hq9MLoCKVH1TJbTEpVUyDcQWqDrtW/oeePLzVmWOBqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509767; c=relaxed/simple;
	bh=9WpiEMe0fIrSO87Y13ouVGDmAVGndwSJJptTqT0lDc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqByUBhUTKO2KeHX5eERBTLS0Lr6IbDwEdwULX0LeMWS731y1DAqXVbAOz9AHqPRx9S8QX2HiEpmyT5Ibj2UykZ3wNqYVUZx+W+Dhhx/HGdeiE9gAo1TH5PQ3+O7+qgVkOc+/icpioboJMgJ0uV3dqJSSe+ic2C02PY1Hmjq1i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVvEBaaI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVvEBaaI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B93C19424;
	Sat, 18 Apr 2026 10:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509766;
	bh=9WpiEMe0fIrSO87Y13ouVGDmAVGndwSJJptTqT0lDc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gVvEBaaI1hTKlI8TbOmjRSuoncRcm2VDyyEXeu7XMZux/XqTUFTWPanT0Ivb4eCjY
	 h/H/rekrCtcvW4+HcxJ292rL3yrOeGdO3y05jUXr65Zsub0BiAxAGsHjLjat6TKgIH
	 ZLFz4QVQbQw+FZhMSRfsNebX+nLchZ351xVJutTn7Nc20Q0mEgO4wCnrZbG541pCrV
	 ZK9VPHs3O7IaTGZdou2K3m//40DM9wszNjzahs6Kk98I+RbM0lV7mn0/H2CjmeIVUK
	 wP8mCM1x1ZHbkmUMOVip2DzudhsUvAU3VPtZ7fYNu1xYSqvCNA/R0xntQ+MbBJ4q0N
	 x4itC3hGWx3Cg==
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
Subject: [PATCH v2 03/53] selftests/mm: migration: don't assume hupe page is TWOMEG
Date: Sat, 18 Apr 2026 13:54:48 +0300
Message-ID: <20260418105539.1261536-4-rppt@kernel.org>
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

migration tests presume that both THP and HugeTLB huge pages are 2MB.

Add dynamic detection of huge page size with read_pmd_pagesize() for THP
and with default_huge_page_size() for HugeTLB.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed by: Donet Tom <donettom@linux.ibm.com>
---
 tools/testing/selftests/mm/migration.c | 44 +++++++++++++++++++-------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
index 60e78bbfc0e3..e3c2f831e15a 100644
--- a/tools/testing/selftests/mm/migration.c
+++ b/tools/testing/selftests/mm/migration.c
@@ -184,22 +184,27 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
  */
 TEST_F_TIMEOUT(migration, private_anon_thp, 2*RUNTIME)
 {
+	unsigned long pmdsize;
 	uint64_t *ptr;
 	int i;
 
 	if (!thp_is_enabled())
 		SKIP(return, "Transparent Hugepages not available");
 
+	pmdsize = read_pmd_pagesize();
+	if (!pmdsize)
+		SKIP(return, "Reading PMD pagesize failed");
+
 	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
 		SKIP(return, "Not enough threads or NUMA nodes available");
 
-	ptr = mmap(NULL, 2*TWOMEG, PROT_READ | PROT_WRITE,
+	ptr = mmap(NULL, 2 * pmdsize, PROT_READ | PROT_WRITE,
 		MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
 	ASSERT_NE(ptr, MAP_FAILED);
 
-	ptr = (uint64_t *) ALIGN((uintptr_t) ptr, TWOMEG);
-	ASSERT_EQ(madvise(ptr, TWOMEG, MADV_HUGEPAGE), 0);
-	memset(ptr, 0xde, TWOMEG);
+	ptr = (uint64_t *) ALIGN((uintptr_t) ptr, pmdsize);
+	ASSERT_EQ(madvise(ptr, pmdsize, MADV_HUGEPAGE), 0);
+	memset(ptr, 0xde, pmdsize);
 	for (i = 0; i < self->nthreads - 1; i++)
 		if (pthread_create(&self->threads[i], NULL, access_mem, ptr))
 			perror("Couldn't create thread");
@@ -215,6 +220,7 @@ TEST_F_TIMEOUT(migration, private_anon_thp, 2*RUNTIME)
 
 TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
 {
+	unsigned long pmdsize;
 	pid_t pid;
 	uint64_t *ptr;
 	int i;
@@ -222,17 +228,21 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
 	if (!thp_is_enabled())
 		SKIP(return, "Transparent Hugepages not available");
 
+	pmdsize = read_pmd_pagesize();
+	if (!pmdsize)
+		SKIP(return, "Reading PMD pagesize failed");
+
 	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
 		SKIP(return, "Not enough threads or NUMA nodes available");
 
-	ptr = mmap(NULL, 2 * TWOMEG, PROT_READ | PROT_WRITE,
+	ptr = mmap(NULL, 2 * pmdsize, PROT_READ | PROT_WRITE,
 		MAP_SHARED | MAP_ANONYMOUS, -1, 0);
 	ASSERT_NE(ptr, MAP_FAILED);
 
-	ptr = (uint64_t *) ALIGN((uintptr_t) ptr, TWOMEG);
-	ASSERT_EQ(madvise(ptr, TWOMEG, MADV_HUGEPAGE), 0);
+	ptr = (uint64_t *) ALIGN((uintptr_t) ptr, pmdsize);
+	ASSERT_EQ(madvise(ptr, pmdsize, MADV_HUGEPAGE), 0);
 
-	memset(ptr, 0xde, TWOMEG);
+	memset(ptr, 0xde, pmdsize);
 	for (i = 0; i < self->nthreads - 1; i++) {
 		pid = fork();
 		if (!pid) {
@@ -256,17 +266,22 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
  */
 TEST_F_TIMEOUT(migration, private_anon_htlb, 2*RUNTIME)
 {
+	unsigned long hugepage_size;
 	uint64_t *ptr;
 	int i;
 
 	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
 		SKIP(return, "Not enough threads or NUMA nodes available");
 
-	ptr = mmap(NULL, TWOMEG, PROT_READ | PROT_WRITE,
+	hugepage_size = default_huge_page_size();
+	if (!hugepage_size)
+		SKIP(return, "Reading HugeTLB pagesize failed\n");
+
+	ptr = mmap(NULL, hugepage_size, PROT_READ | PROT_WRITE,
 		MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
 	ASSERT_NE(ptr, MAP_FAILED);
 
-	memset(ptr, 0xde, TWOMEG);
+	memset(ptr, 0xde, hugepage_size);
 	for (i = 0; i < self->nthreads - 1; i++)
 		if (pthread_create(&self->threads[i], NULL, access_mem, ptr))
 			perror("Couldn't create thread");
@@ -281,6 +296,7 @@ TEST_F_TIMEOUT(migration, private_anon_htlb, 2*RUNTIME)
  */
 TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
 {
+	unsigned long hugepage_size;
 	pid_t pid;
 	uint64_t *ptr;
 	int i;
@@ -288,11 +304,15 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
 	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
 		SKIP(return, "Not enough threads or NUMA nodes available");
 
-	ptr = mmap(NULL, TWOMEG, PROT_READ | PROT_WRITE,
+	hugepage_size = default_huge_page_size();
+	if (!hugepage_size)
+		SKIP(return, "Reading HugeTLB pagesize failed\n");
+
+	ptr = mmap(NULL, hugepage_size, PROT_READ | PROT_WRITE,
 		MAP_SHARED | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
 	ASSERT_NE(ptr, MAP_FAILED);
 
-	memset(ptr, 0xde, TWOMEG);
+	memset(ptr, 0xde, hugepage_size);
 	for (i = 0; i < self->nthreads - 1; i++) {
 		pid = fork();
 		if (!pid) {
-- 
2.53.0


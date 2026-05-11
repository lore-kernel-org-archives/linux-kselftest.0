Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6BE421F12;
	Mon, 11 May 2026 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516943; cv=none; b=ogHilV0+XVfbu1Nt8omxUg4Nkj/dK/53oYhhiA1G21cCV4ll7VmHCaBXquJYHajvjItg55s7hm/p31H1LX+6jeK2/pcZO+Jbnk2Rk8d/rW/OJvuL303BLpF3zU1rv0K/OmykfusN9XeYzo8VAIQhY4l77wTSt7Fp9iPOYgAyIOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516943; c=relaxed/simple;
	bh=UE8G0ohpiQboN1dwA2glOHi5hY0F9YOdn4xqPowVqME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2SWYvTwKS/iVknN3E9vbo+WXQdRMbYhlKMvAlLAO2WRSSYs4SMFzNkIRVIgA2RujiNd/c1YKwERka3OjMBGmQKgZGT4MqwnQhC/y/fGHN9D20/m6dCudR8d9VfVRB0vfsjQm7SIg+56RkfZiVvwLtexhRjmX4960CtFQWSVmfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1KGPbpW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1KGPbpW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0271C2BCC9;
	Mon, 11 May 2026 16:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516943;
	bh=UE8G0ohpiQboN1dwA2glOHi5hY0F9YOdn4xqPowVqME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q1KGPbpWyalkzlLAICbfoZs5EGkLrExPqjuwaQN3G76p/q7dnhX9IPntEi3tS+z91
	 3QRleqG4S7WCIE/feXGpwHyMWEBOfvF3/xfffEV24B1MSIBBISohAh9DdvGYKy7KQ5
	 nHDMdREX82/f90i3bZNbRXvNsJG+lpitJdP5S8JFVD3+JlBraB1teGSFs6VGHCv7Tn
	 kp3yfBTMdUY9FF9nvFD/OeMcgJRW4VIGiaYFMdWpdoSK3lMhytJSfBtIubZ5rk+jkC
	 JblzX2jipY9/rSnLApK9YZuY+sjYkYqB5G6LItDBeoecUo9C0tGZvxzNxzepKhQ23A
	 AO22jIbeH/JZg==
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
Subject: [PATCH v4 02/55] selftests/mm: migration: don't assume huge page is TWOMEG
Date: Mon, 11 May 2026 19:27:46 +0300
Message-ID: <20260511162840.375890-3-rppt@kernel.org>
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

migration tests presume that both THP and HugeTLB huge pages are 2MB.

Add dynamic detection of huge page size with read_pmd_pagesize() for THP
and with default_huge_page_size() for HugeTLB.

Reviewed-by: Donet Tom <donettom@linux.ibm.com>
Reviewed-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Luiz Capitulino <luizcap@redhat.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/migration.c | 44 +++++++++++++++++++-------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
index 60e78bbfc0e3..0f5a4ddac529 100644
--- a/tools/testing/selftests/mm/migration.c
+++ b/tools/testing/selftests/mm/migration.c
@@ -184,22 +184,27 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
  */
 TEST_F_TIMEOUT(migration, private_anon_thp, 2*RUNTIME)
 {
+	uint64_t pmdsize;
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
+	uint64_t pmdsize;
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
+		SKIP(return, "Reading HugeTLB pagesize failed");
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
+		SKIP(return, "Reading HugeTLB pagesize failed");
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


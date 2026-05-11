Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E753042847C;
	Mon, 11 May 2026 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516950; cv=none; b=YvMwOOrjYWudnRPnvVTfCFXlhEULD8T4JE8f3V19LifW1wLwYB4l2d3kC61reVz/cSX4EcUEElTp+1lXuJIqn+PWzIoKGVn8jl86f7uPWV7Zoz1Ls8JcPMA2B3liRCjWvfVvfogPoagUpRHJJlINz6DRsZQVwhfV2kIiOrCYgFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516950; c=relaxed/simple;
	bh=d0vdvBKIbvc9uaMc8J9ShA2tg7UuWg8VeCoFP2+IYMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b1uXltMFHCWjO6WDE9ulxTuEK/nIDtr0tGkTtrlfi1ndkXJvJ7sL7ww4CsgTmv1+pKE8kfCEbIkmeYRou5ypN0MQ5Hs+1iwcrANsM5GM+dQ6E3nLArDCCCMpb/P1FhaXoXHzJLINyBNWHsxfH7tYU5FGzsFiXCU9tvCuv/5+8YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hoB9YXmZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hoB9YXmZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F4FC2BCB0;
	Mon, 11 May 2026 16:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516949;
	bh=d0vdvBKIbvc9uaMc8J9ShA2tg7UuWg8VeCoFP2+IYMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hoB9YXmZKpEaxzBEG7bMkYHvMHspR1WwsuhvtKAbu0e+sOqXcL71iO6ZG9vLUS7x/
	 /+UHRc3e+uJ8PpAr6NUHu1NswSy01BsQdQ8dNUXqjui9Xju7LquyzZwgqFDDYT1ZFz
	 HUrJg1ZeXwngUtSr8/CpNyesMcf/aexhnEVIfZmKWzCRAhLIFn6gslaIDu3//mhyzx
	 NWHrML2MXPF6YeK43c9d183XxhpNat+Ok50tvfMJA2MobHumf5fFM9Xptsob0sePln
	 sEfUd6h9iSDSaOMB7bPTUwVQphYG1A4Xj3aAjXrATcZpFxBnLeYJ9z/7Pl8UutIME5
	 ymxBHOhc5zKnA==
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
Subject: [PATCH v4 03/55] selftests/mm: migration: make nthreads represent number of working threads
Date: Mon, 11 May 2026 19:27:47 +0300
Message-ID: <20260511162840.375890-4-rppt@kernel.org>
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

Fixture setup sets self->nthreads to number of available CPUs minus 1
and then each test creates 'self->nthreads - 1' threads or processes, so
essentially nthreads counts the worker tasks and the main task.

Make nthreads represent the number of spawned tasks to simplify
thread/process creation and teardown.

While on it, make the fixture setup skip the tests if there are not
enough CPUs or NUMA nodes instead of checking this in each test.

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Luiz Capitulino <luizcap@redhat.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/migration.c | 47 +++++++++-----------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
index 0f5a4ddac529..16ffd3c55ee0 100644
--- a/tools/testing/selftests/mm/migration.c
+++ b/tools/testing/selftests/mm/migration.c
@@ -38,7 +38,7 @@ FIXTURE_SETUP(migration)
 
 	if (numa_available() < 0)
 		SKIP(return, "NUMA not available");
-	self->nthreads = numa_num_task_cpus() - 1;
+	self->nthreads = numa_num_task_cpus() - 2;
 	self->n1 = -1;
 	self->n2 = -1;
 
@@ -52,6 +52,9 @@ FIXTURE_SETUP(migration)
 			}
 		}
 
+	if (self->nthreads < 1 || self->n1 < 0 || self->n2 < 0)
+		SKIP(return, "Not enough threads or NUMA nodes available");
+
 	self->threads = malloc(self->nthreads * sizeof(*self->threads));
 	ASSERT_NE(self->threads, NULL);
 	self->pids = malloc(self->nthreads * sizeof(*self->pids));
@@ -127,20 +130,17 @@ TEST_F_TIMEOUT(migration, private_anon, 2*RUNTIME)
 	uint64_t *ptr;
 	int i;
 
-	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
-		SKIP(return, "Not enough threads or NUMA nodes available");
-
 	ptr = mmap(NULL, TWOMEG, PROT_READ | PROT_WRITE,
 		MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
 	ASSERT_NE(ptr, MAP_FAILED);
 
 	memset(ptr, 0xde, TWOMEG);
-	for (i = 0; i < self->nthreads - 1; i++)
+	for (i = 0; i < self->nthreads; i++)
 		if (pthread_create(&self->threads[i], NULL, access_mem, ptr))
 			perror("Couldn't create thread");
 
 	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
-	for (i = 0; i < self->nthreads - 1; i++)
+	for (i = 0; i < self->nthreads; i++)
 		ASSERT_EQ(pthread_cancel(self->threads[i]), 0);
 }
 
@@ -153,15 +153,12 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
 	uint64_t *ptr;
 	int i;
 
-	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
-		SKIP(return, "Not enough threads or NUMA nodes available");
-
 	ptr = mmap(NULL, TWOMEG, PROT_READ | PROT_WRITE,
 		MAP_SHARED | MAP_ANONYMOUS, -1, 0);
 	ASSERT_NE(ptr, MAP_FAILED);
 
 	memset(ptr, 0xde, TWOMEG);
-	for (i = 0; i < self->nthreads - 1; i++) {
+	for (i = 0; i < self->nthreads; i++) {
 		pid = fork();
 		if (!pid) {
 			prctl(PR_SET_PDEATHSIG, SIGHUP);
@@ -175,7 +172,7 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
 	}
 
 	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
-	for (i = 0; i < self->nthreads - 1; i++)
+	for (i = 0; i < self->nthreads; i++)
 		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
 }
 
@@ -195,9 +192,6 @@ TEST_F_TIMEOUT(migration, private_anon_thp, 2*RUNTIME)
 	if (!pmdsize)
 		SKIP(return, "Reading PMD pagesize failed");
 
-	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
-		SKIP(return, "Not enough threads or NUMA nodes available");
-
 	ptr = mmap(NULL, 2 * pmdsize, PROT_READ | PROT_WRITE,
 		MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
 	ASSERT_NE(ptr, MAP_FAILED);
@@ -205,12 +199,12 @@ TEST_F_TIMEOUT(migration, private_anon_thp, 2*RUNTIME)
 	ptr = (uint64_t *) ALIGN((uintptr_t) ptr, pmdsize);
 	ASSERT_EQ(madvise(ptr, pmdsize, MADV_HUGEPAGE), 0);
 	memset(ptr, 0xde, pmdsize);
-	for (i = 0; i < self->nthreads - 1; i++)
+	for (i = 0; i < self->nthreads; i++)
 		if (pthread_create(&self->threads[i], NULL, access_mem, ptr))
 			perror("Couldn't create thread");
 
 	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
-	for (i = 0; i < self->nthreads - 1; i++)
+	for (i = 0; i < self->nthreads; i++)
 		ASSERT_EQ(pthread_cancel(self->threads[i]), 0);
 }
 
@@ -232,9 +226,6 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
 	if (!pmdsize)
 		SKIP(return, "Reading PMD pagesize failed");
 
-	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
-		SKIP(return, "Not enough threads or NUMA nodes available");
-
 	ptr = mmap(NULL, 2 * pmdsize, PROT_READ | PROT_WRITE,
 		MAP_SHARED | MAP_ANONYMOUS, -1, 0);
 	ASSERT_NE(ptr, MAP_FAILED);
@@ -243,7 +234,7 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
 	ASSERT_EQ(madvise(ptr, pmdsize, MADV_HUGEPAGE), 0);
 
 	memset(ptr, 0xde, pmdsize);
-	for (i = 0; i < self->nthreads - 1; i++) {
+	for (i = 0; i < self->nthreads; i++) {
 		pid = fork();
 		if (!pid) {
 			prctl(PR_SET_PDEATHSIG, SIGHUP);
@@ -257,7 +248,7 @@ TEST_F_TIMEOUT(migration, shared_anon_thp, 2*RUNTIME)
 	}
 
 	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
-	for (i = 0; i < self->nthreads - 1; i++)
+	for (i = 0; i < self->nthreads; i++)
 		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
 }
 
@@ -270,9 +261,6 @@ TEST_F_TIMEOUT(migration, private_anon_htlb, 2*RUNTIME)
 	uint64_t *ptr;
 	int i;
 
-	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
-		SKIP(return, "Not enough threads or NUMA nodes available");
-
 	hugepage_size = default_huge_page_size();
 	if (!hugepage_size)
 		SKIP(return, "Reading HugeTLB pagesize failed");
@@ -282,12 +270,12 @@ TEST_F_TIMEOUT(migration, private_anon_htlb, 2*RUNTIME)
 	ASSERT_NE(ptr, MAP_FAILED);
 
 	memset(ptr, 0xde, hugepage_size);
-	for (i = 0; i < self->nthreads - 1; i++)
+	for (i = 0; i < self->nthreads; i++)
 		if (pthread_create(&self->threads[i], NULL, access_mem, ptr))
 			perror("Couldn't create thread");
 
 	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
-	for (i = 0; i < self->nthreads - 1; i++)
+	for (i = 0; i < self->nthreads; i++)
 		ASSERT_EQ(pthread_cancel(self->threads[i]), 0);
 }
 
@@ -301,9 +289,6 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
 	uint64_t *ptr;
 	int i;
 
-	if (self->nthreads < 2 || self->n1 < 0 || self->n2 < 0)
-		SKIP(return, "Not enough threads or NUMA nodes available");
-
 	hugepage_size = default_huge_page_size();
 	if (!hugepage_size)
 		SKIP(return, "Reading HugeTLB pagesize failed");
@@ -313,7 +298,7 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
 	ASSERT_NE(ptr, MAP_FAILED);
 
 	memset(ptr, 0xde, hugepage_size);
-	for (i = 0; i < self->nthreads - 1; i++) {
+	for (i = 0; i < self->nthreads; i++) {
 		pid = fork();
 		if (!pid) {
 			prctl(PR_SET_PDEATHSIG, SIGHUP);
@@ -327,7 +312,7 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
 	}
 
 	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
-	for (i = 0; i < self->nthreads - 1; i++)
+	for (i = 0; i < self->nthreads; i++)
 		ASSERT_EQ(kill(self->pids[i], SIGTERM), 0);
 }
 
-- 
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7434B383C6F;
	Tue, 28 Apr 2026 20:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409261; cv=none; b=ITRORMxXvIi7swDzQgxMSgXJ0SjfoQ/Pbi6TJrbE84oKMrp+MkZnPtodbR1eMvAvhBvCHXfjng8kil7q1rQAg4ny7PoOwS1HLsG3T9Hj5ygnZTczLzqOR+RfCpEw1xMqVLOrzx3HLFj6SGHRMSyoWDhcDj/EXkrR69tK4/5h0/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409261; c=relaxed/simple;
	bh=WQo8riTW+gdC2wg2rFje/aEFGdbZITZfBZEkLvZiGOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXNcWwzhz2MoRmaRCIbmB6umtBi4TIlDF8bIPvj4kEupzAbgK4JY3TKtiHFE9U6nMAk3/sZmTuE00jqzoNwUUsCB+pWQcFD/Vap0TR9vHQJyfWaPU2sDHSNu+1/j6Uo2+yR3a0jOEz0VVYmSQFvWSPBCD/BvUVbDW29luDtB938=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DfWyMyE+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DfWyMyE+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B86FC2BCC7;
	Tue, 28 Apr 2026 20:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409261;
	bh=WQo8riTW+gdC2wg2rFje/aEFGdbZITZfBZEkLvZiGOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DfWyMyE+wURM9Ch4JrXDDNborGc6PdSkvjRQf8LzswNdIbrYaZa/c4ViXt/F+1eWS
	 v4Wel4es9JGNXLZSfWHoRXqrxQgv+atphmr01IE9OCGqh67batJjGKF2qg/poHm8zN
	 JKfr7na4AcLN32XDtWYQa4XzLbyMpktAxE3pWTD/DG/2pi9ViTVaKJISeU6hQKku+s
	 2ThZMGJLLV9yfREP1ZXQbjGVpfkGLpQhDoIJ4ZH2VodxBG65B3q83D9JODrC/g5Ng8
	 rZ8xn82nE+Mb1Z6IUkm9t6BB2GJzd7/JBdDrDdD2+nUk3nyX17BRqr81pw1+dZa1Oz
	 Y89gz8lrylySA==
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
Subject: [PATCH v3 44/54] selftests/mm: migration: add setup of HugeTLB pages
Date: Tue, 28 Apr 2026 23:42:30 +0300
Message-ID: <20260428204240.1924129-45-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428204240.1924129-1-rppt@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

migration skips HugeTLB tests if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Since kselftest_harness runs fixture setup and the tests in child
processes, use HUGETLB_SETUP_DEFAULT_PAGES() that defines a constructor
that runs in the main process and add verification that there are enough
free huge pages to the tests that use them.

Reset signal handlers to defaults in FIXTURE_SETUP() so that sending
SIGTERM and SIGHUP during the tests won't cause restoration of HugeTLB
settings.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/migration.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
index 0212cd5bde6e..f212c1b06455 100644
--- a/tools/testing/selftests/mm/migration.c
+++ b/tools/testing/selftests/mm/migration.c
@@ -23,6 +23,8 @@
 #define MAX_RETRIES	100
 #define ALIGN(x, a)	(((x) + (a - 1)) & (~((a) - 1)))
 
+HUGETLB_SETUP_DEFAULT_PAGES(1)
+
 FIXTURE(migration)
 {
 	pthread_t *threads;
@@ -32,10 +34,21 @@ FIXTURE(migration)
 	int n2;
 };
 
+static void reset_signals(void)
+{
+	struct sigaction sa = { .sa_handler = SIG_DFL };
+
+	sigemptyset(&sa.sa_mask);
+	sigaction(SIGTERM, &sa, NULL);
+	sigaction(SIGHUP, &sa, NULL);
+}
+
 FIXTURE_SETUP(migration)
 {
 	int n;
 
+	reset_signals();
+
 	if (numa_available() < 0)
 		SKIP(return, "NUMA not available");
 	self->nthreads = numa_num_task_cpus() - 2;
@@ -271,6 +284,9 @@ TEST_F_TIMEOUT(migration, private_anon_htlb, 2*RUNTIME)
 	if (!hugepage_size)
 		SKIP(return, "Reading HugeTLB pagesize failed\n");
 
+	if (hugetlb_free_default_pages() < 1)
+		SKIP(return, "Not enough huge pages\n");
+
 	ptr = mmap(NULL, hugepage_size, PROT_READ | PROT_WRITE,
 		MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
 	ASSERT_NE(ptr, MAP_FAILED);
@@ -299,6 +315,9 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
 	if (!hugepage_size)
 		SKIP(return, "Reading HugeTLB pagesize failed\n");
 
+	if (hugetlb_free_default_pages() < 1)
+		SKIP(return, "Not enough huge pages\n");
+
 	ptr = mmap(NULL, hugepage_size, PROT_READ | PROT_WRITE,
 		MAP_SHARED | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
 	ASSERT_NE(ptr, MAP_FAILED);
-- 
2.53.0


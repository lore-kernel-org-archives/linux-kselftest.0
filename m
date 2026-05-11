Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668082609C5;
	Mon, 11 May 2026 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517224; cv=none; b=Hd0Va165W4+NUZEYtTmn5XSvSehy+2Rv+dI10kABoE+AU5sAYDg3Q5OuaDd+vwKVpE+9HdalBQdgCjB/EQJMKhI3jzWOMSZYYIS5Oy/3nFll04wVN+J2TftyADAbFf38qOuWB0J9fD6pP2Ev9FweRbqb/ldMT/9G4CNpxJuUACs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517224; c=relaxed/simple;
	bh=f0LPsZ8UtpMTj9mp/rE/Gt8kIOCrI3dD0EgIZPJUfRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hI6R3/NPRypJt4aFxgNvmk+5wKv6DV0xbZndN1rLSsEUwKsGi/BsukqujqkwhA03z2mq56fRYHaxn8+OVqa0NylBFl26FHgVSyb6aCKAIoC5DgqMlAmIoODmWS89EhnftGetHYGNQAN99Bzo+/icLRjA+fIL9o1EF06273LqRno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQRHJNZ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQRHJNZ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A772C2BCC9;
	Mon, 11 May 2026 16:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517224;
	bh=f0LPsZ8UtpMTj9mp/rE/Gt8kIOCrI3dD0EgIZPJUfRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DQRHJNZ+09dzgdo6rJipWL/W7o9A2l295KrXfH2LYm4bjfkeqt/JNmlhgAnclM3qQ
	 9K0lb4NrBcLFlfsOmZO6o2eiicj/FluFTJhY5oy0MflQWqOLEpuv6l0lT6FI4pRtli
	 1g0v/hawsHmS1an7MCk4wIPlonNCjLZ/XcYfwkGjNoxShQsL07nc9uhdKGftIhJ0vm
	 d8kDOejJEWaLvxyRswhs1es0i5C5ZQc/Yyy8EeSLmFVSaPCfRD9hjtigLVoZkmFdJE
	 aJSDCyeRmB+R035wO7zhFvE3Ki5t6hibjvD2g6Mo+DZDqlHoTvgjbirZGCOPbU2Cdq
	 pPeCj6jLjobrA==
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
Subject: [PATCH v4 45/55] selftests/mm: migration: add setup of HugeTLB pages
Date: Mon, 11 May 2026 19:28:29 +0300
Message-ID: <20260511162840.375890-46-rppt@kernel.org>
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

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/migration.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
index 7781a59bb9f8..29f7492453d4 100644
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
@@ -32,10 +34,23 @@ FIXTURE(migration)
 	int n2;
 };
 
+static void reset_signals(void)
+{
+	struct sigaction sa = { .sa_handler = SIG_DFL };
+
+	sigemptyset(&sa.sa_mask);
+	sigaction(SIGTERM, &sa, NULL);
+	sigaction(SIGHUP, &sa, NULL);
+	sigaction(SIGINT, &sa, NULL);
+	sigaction(SIGQUIT, &sa, NULL);
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
@@ -288,6 +303,9 @@ TEST_F_TIMEOUT(migration, private_anon_htlb, 2*RUNTIME)
 	if (!hugepage_size)
 		SKIP(return, "Reading HugeTLB pagesize failed");
 
+	if (hugetlb_free_default_pages() < 1)
+		SKIP(return, "Not enough huge pages");
+
 	ptr = mmap(NULL, hugepage_size, PROT_READ | PROT_WRITE,
 		MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
 	ASSERT_NE(ptr, MAP_FAILED);
@@ -316,6 +334,9 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
 	if (!hugepage_size)
 		SKIP(return, "Reading HugeTLB pagesize failed");
 
+	if (hugetlb_free_default_pages() < 1)
+		SKIP(return, "Not enough huge pages");
+
 	ptr = mmap(NULL, hugepage_size, PROT_READ | PROT_WRITE,
 		MAP_SHARED | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
 	ASSERT_NE(ptr, MAP_FAILED);
-- 
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3DA37DEAF;
	Mon,  6 Apr 2026 14:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485159; cv=none; b=W/XzIuN7ZpZtRLj5yOxIes5WuAnL7rLllhi6ESVRLkHiY5yG7uMGw05OkE+DuCFipAdkML4PGP6B4SQvYVDO1apWtZYNEI70ZWVebeZI7LnFyXhzlwA/0BhOugiMw0HCiADQmZj52aewrwxTTX+PHgQsBzynpkhKLL3ZmCaIYQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485159; c=relaxed/simple;
	bh=ZfbG35JDCFGHcQNJmFQWCxDhKC3iKoBsHHCyZ5Qqs18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7x+JaLOTy2SV1qg7q1cdUGt24B6QynMSmGvLYb21Kf8/OZTjznjoWXjZ0178pZlB8CmEWwnRlbk9OeZPfib9qrzX/LUHTGTCG/n8z03fsRuGSFyG5cKoIZB85UUFv3Tj/SwyrTxihX+xTiyiXK5zfJRLh/474h7XrKdZOQHrhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPjLSLrL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPjLSLrL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E883DC2BC9E;
	Mon,  6 Apr 2026 14:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485159;
	bh=ZfbG35JDCFGHcQNJmFQWCxDhKC3iKoBsHHCyZ5Qqs18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dPjLSLrLzNtv2x27Qg9/n+cuZi+T5XRaB5fe2R/1CC4nvnhtyO5kaRiI6J4Xamq8q
	 QsCWJrVjRXujo3RVixTBgwh3CNoAkzl0iqNnxdxGGaRUDblj3XGy+6odKaAoaQ2Y2R
	 RbcOTnVyF3qXwRqovJdGdsoQtpv83rZCc4EKLB6/BQXu3mqd+WrS5Ofy7/0zwOMDAi
	 2cB9YbYGZ3Uh0kihLzPqjoPYCj4FUqx5MBsBsRVxEbSTI/xMbH++v1lFFv/RSyHadT
	 4CM7pIptqvbVhKNeJ8EU485g5E9oaSTxzgZ7SluaLj+LYjq4RIuqrYlDiNJmEBBqJE
	 txJz8WV5ak8yA==
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
Subject: [PATCH 16/53] selftests/mm: protection_keys: use kselftest framework
Date: Mon,  6 Apr 2026 17:16:58 +0300
Message-ID: <20260406141735.2179309-17-rppt@kernel.org>
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

Convert protection_keys test to use kselftest framework for reporting
and tracking successful and failing runs.

Adjust dprintf0() printouts to use "#" in the beginning of the line for
TAP compatibility and add fflush(stdout) in the end of the test to
ensure all the ksft_print_*() messages are really output.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/pkey-helpers.h    |  6 +++--
 tools/testing/selftests/mm/protection_keys.c | 27 ++++++++++++--------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
index 7c29f075e40b..ae010b075417 100644
--- a/tools/testing/selftests/mm/pkey-helpers.h
+++ b/tools/testing/selftests/mm/pkey-helpers.h
@@ -71,10 +71,12 @@ static inline void sigsafe_printf(const char *format, ...)
 extern void abort_hooks(void);
 #define pkey_assert(condition) do {		\
 	if (!(condition)) {			\
-		dprintf0("assert() at %s::%d test_nr: %d iteration: %d\n", \
+		dprintf0("# assert() at %s::%d test_nr: %d iteration: %d\n", \
 				__FILE__, __LINE__,	\
 				test_nr, iteration_nr);	\
-		dprintf0("errno at assert: %d", errno);	\
+		dprintf0("# errno at assert: %d\n", errno);	\
+		ksft_test_result_fail("test %d (iteration %d)\n",	\
+				      test_nr, iteration_nr);		\
 		abort_hooks();			\
 		exit(__LINE__);			\
 	}					\
diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index 80c6124e8378..c069250969f5 100644
--- a/tools/testing/selftests/mm/protection_keys.c
+++ b/tools/testing/selftests/mm/protection_keys.c
@@ -136,6 +136,7 @@ static void tracing_off(void)
 
 void abort_hooks(void)
 {
+	fflush(stdout);
 	fprintf(stderr, "running %s()...\n", __func__);
 	tracing_off();
 #ifdef SLEEP_ON_ABORT
@@ -370,8 +371,8 @@ static void signal_handler(int signum, siginfo_t *si, void *vucontext)
 	if ((si->si_code == SEGV_MAPERR) ||
 	    (si->si_code == SEGV_ACCERR) ||
 	    (si->si_code == SEGV_BNDERR)) {
-		printf("non-PK si_code, exiting...\n");
-		exit(4);
+		dprintf0("# non-PK si_code: %d, exiting...\n", si->si_code);
+		exit(1);
 	}
 
 	si_pkey_ptr = siginfo_get_pkey_ptr(si);
@@ -719,7 +720,7 @@ static void setup_hugetlbfs(void)
 	long hpagesz_mb;
 
 	if (geteuid() != 0) {
-		fprintf(stderr, "WARNING: not run as root, can not do hugetlb test\n");
+		ksft_print_msg("WARNING: not run as root, can not do hugetlb test\n");
 		return;
 	}
 
@@ -855,7 +856,7 @@ void expected_pkey_fault(int pkey)
 
 #define do_not_expect_pkey_fault(msg)	do {			\
 	if (last_pkey_faults != pkey_faults)			\
-		dprintf0("unexpected PKey fault: %s\n", msg);	\
+		dprintf0("# unexpected PKey fault: %s\n", msg);	\
 	pkey_assert(last_pkey_faults == pkey_faults);		\
 } while (0)
 
@@ -1753,7 +1754,7 @@ static void run_tests_once(void)
 		tracing_off();
 		close_test_fds();
 
-		printf("test %s PASSED (iteration %d)\n", pkey_tests[test_nr].name, iteration_nr);
+		ksft_test_result_pass("test %s (iteration %d)\n", pkey_tests[test_nr].name, iteration_nr);
 		dprintf1("======================\n\n");
 	}
 	iteration_nr++;
@@ -1773,27 +1774,31 @@ int main(void)
 
 	setup_handlers();
 
-	printf("has pkeys: %d\n", pkeys_supported);
+	ksft_print_header();
 
 	if (!pkeys_supported) {
 		int size = PAGE_SIZE;
 		int *ptr;
 
-		printf("running PKEY tests for unsupported CPU/OS\n");
+		ksft_set_plan(1);
+		ksft_print_msg("running PKEY tests for unsupported CPU/OS\n");
 
 		ptr  = mmap(NULL, size, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
 		assert(ptr != (void *)-1);
 		test_mprotect_pkey_on_unsupported_cpu(ptr, 1);
-		exit(0);
+		ksft_test_result_pass("pkey on unsupported CPU/OS\n");
+		ksft_finished();
 	}
 
+	ksft_set_plan(ARRAY_SIZE(pkey_tests) * nr_iterations);
+
 	pkey_setup_shadow();
-	printf("startup pkey_reg: %016llx\n", read_pkey_reg());
+	ksft_print_msg("startup pkey_reg: %016llx\n", read_pkey_reg());
 	setup_hugetlbfs();
 
 	while (nr_iterations-- > 0)
 		run_tests_once();
 
-	printf("done (all tests OK)\n");
-	return 0;
+	ksft_finished();
+	fflush(stdout);
 }
-- 
2.53.0


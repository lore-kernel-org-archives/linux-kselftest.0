Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A3E2749D6;
	Mon, 11 May 2026 16:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517041; cv=none; b=OXx68cpEWtiEUDfCqJFSOQeS2A78A9DGurjANi6gBnAB9kA6XSLmLQkMUiyL/S5tcPb/Ky5MVEmwN2k8LIpV4LzLM//FaowTSN+zUZsGj19l0/nuv97YSQqqeWcIiT9e8ELcdHj0V2nY6/Gub4bkMjO59ns6SOxfYLzvitQY3Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517041; c=relaxed/simple;
	bh=eC4vwpU9vFNcN2z6oLk75iFVUlZ87Tp/bOty1j6wGoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nei+n0zVcWLX/2cK4BQH/kKwbUJin1enj9TeyRbYYRbX5p3vNuohiZLI08JehK6GI9tp+e67Brx2WWtcGG6bUxGkBo7YUlZkWfT7vXCp2IZm37fxsLe0cMlLTxCXEnLb4wm1MGrjhut01ZpVafksVWLvWF4WZCKdSJhB256JJaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkoB6HJX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkoB6HJX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FA0C2BCB0;
	Mon, 11 May 2026 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517041;
	bh=eC4vwpU9vFNcN2z6oLk75iFVUlZ87Tp/bOty1j6wGoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rkoB6HJXCHYtyEG2AUimuPNPvidE3aB0Akv6ICmiAVPx/xDs9UCCMtaHsztLUfCGH
	 OJ6eEg9qw/JhiyxAq2dmEUpeH8eDFKD8gjfJWQe1UxWHABs8OjdphW7RRLCfXZhxOX
	 le01II0hyWlKD76K2BfHYsq8z1fPNitGYxEX8UX1LyMJdMk0F97AnffUD+0b8u4t0H
	 bXaqVOdJdOHN+OFf1KXBWdtaG9Xiy4xk2Oo5fJl6G/9uMXFEkq/HdPFka81Bw1QIVQ
	 AYdjnxzYcW2LFhg7VQw14JBMAu/Xm7nlYidxLgqY1rCxszT/8Mpp4M3PwmAJM9qUcd
	 kHgBV96GkDMNA==
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
Subject: [PATCH v4 17/55] selftests/mm: protection_keys: use kselftest framework
Date: Mon, 11 May 2026 19:28:01 +0300
Message-ID: <20260511162840.375890-18-rppt@kernel.org>
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

Convert protection_keys test to use kselftest framework for reporting
and tracking successful and failing runs.

Adjust dprintf0() printouts to use "#" in the beginning of the line for
TAP compatibility.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/pkey-helpers.h    | 15 +++++------
 tools/testing/selftests/mm/protection_keys.c | 26 +++++++++++---------
 2 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
index 7c29f075e40b..2c377f4e9df1 100644
--- a/tools/testing/selftests/mm/pkey-helpers.h
+++ b/tools/testing/selftests/mm/pkey-helpers.h
@@ -71,13 +71,14 @@ static inline void sigsafe_printf(const char *format, ...)
 extern void abort_hooks(void);
 #define pkey_assert(condition) do {		\
 	if (!(condition)) {			\
-		dprintf0("assert() at %s::%d test_nr: %d iteration: %d\n", \
-				__FILE__, __LINE__,	\
-				test_nr, iteration_nr);	\
-		dprintf0("errno at assert: %d", errno);	\
-		abort_hooks();			\
-		exit(__LINE__);			\
-	}					\
+		dprintf0("# assert() at %s::%d test_nr: %d iteration: %d\n", \
+			 __FILE__, __LINE__,				\
+			 test_nr, iteration_nr);			\
+		dprintf0("# errno at assert: %d\n", errno);		\
+		abort_hooks();						\
+		ksft_exit_fail_msg("test %d (iteration %d)\n",		\
+				   test_nr, iteration_nr);		\
+	}								\
 } while (0)
 
 #define barrier() __asm__ __volatile__("": : :"memory")
diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index 80c6124e8378..d617b41dda6b 100644
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
@@ -1773,27 +1774,30 @@ int main(void)
 
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
 }
-- 
2.53.0


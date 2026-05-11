Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6108B42B751;
	Mon, 11 May 2026 16:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517061; cv=none; b=ZvM/8TIuiixXvVacXwmeXtW0txZ6kPc05awg7jCGpsqwUnR7YG0QwL+YuYOSN/QRs0z4mN+n1oJAtKBEYYW7uZed2x8BGJFgAxkk4c4x/KUmRiAF1wXguHfpYfSt74wgXx7kOPwvmcJoN8PfnbnIiA+nouFHd7htpad7ppv+P4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517061; c=relaxed/simple;
	bh=SJOiJDMA/vSNA+8ti7tULY2I5EV4K1CG/V/2/5w4uMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ivI1iKt2xkla9HUWI70JfTmpE7h48Kx6DcYHtbqSugiQX1g7LMUVRHDDxszDtXr0YKvoUxcsUVisehisG6hYzdO1d8DWSxMgGcev7rZ/PdS8A4cNW/eNFV+E+cE+mvm2UwRw8HMY3w+RlZimirna1Gd6jbVyHAZNcYXldo8+18o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRn3vCNd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRn3vCNd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8C1C2BCB0;
	Mon, 11 May 2026 16:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517060;
	bh=SJOiJDMA/vSNA+8ti7tULY2I5EV4K1CG/V/2/5w4uMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IRn3vCNdAsI/Bw7EGGIqZJ5+IdCLw5z7fyqwmjKIlgVIytOqJ6SeBHYZEEbQdzc7J
	 5RBzDpsx2PPOJUCOy8uIdb/2fhphC0lKT7GUTA/0QKt6OZ7jcvieKHODvoAANNVJs6
	 MCu3SEMm3HBgjq/goIXUfC5gHaKNQqGy6apwi/g8UcR9zqj8F3Lcr4WVIhKpJt57iW
	 2Yk2knkiTgrDXdgH1nGiUcmOCZ6LySrZcbvsz+jxkHAO91c+v0p48MkxG+WVxuQKdZ
	 ITbK+q7onYDHRVxT4vOswA3woJe6rxAYyKDLqYRgANqaAUFSkSLyYBmBChScrwHBQX
	 iz1Mt5c6AqSEA==
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
Subject: [PATCH v4 20/55] selftests/mm: uffd-unit-tests: use kselftest framework
Date: Mon, 11 May 2026 19:28:04 +0300
Message-ID: <20260511162840.375890-21-rppt@kernel.org>
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

Convert uffd-unit-tests to use kselftest framework for reporting and
tracking successful and failing runs.

Reviewed-by: Donet Tom <donettom@linux.ibm.com>

Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Luiz Capitulino <luizcap@redhat.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++----------
 1 file changed, 52 insertions(+), 53 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 6f5e404a446c..db7c26835487 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -86,47 +86,28 @@ typedef struct {
 	uffd_test_case_ops_t *test_case_ops;
 } uffd_test_case_t;
 
-static void uffd_test_report(void)
-{
-	printf("Userfaults unit tests: pass=%u, skip=%u, fail=%u (total=%u)\n",
-	       ksft_get_pass_cnt(),
-	       ksft_get_xskip_cnt(),
-	       ksft_get_fail_cnt(),
-	       ksft_test_num());
-}
+static char current_test[256];
 
 static void uffd_test_pass(void)
 {
-	printf("done\n");
-	ksft_inc_pass_cnt();
+	ksft_test_result_pass("%s\n", current_test);
 }
 
 #define  uffd_test_start(...)  do {		\
-		printf("Testing ");		\
-		printf(__VA_ARGS__);		\
-		printf("... ");			\
-		fflush(stdout);			\
+		snprintf(current_test, sizeof(current_test), __VA_ARGS__); \
 	} while (0)
 
-#define  uffd_test_fail(...)  do {		\
-		printf("failed [reason: ");	\
-		printf(__VA_ARGS__);		\
-		printf("]\n");			\
-		ksft_inc_fail_cnt();		\
+#define  uffd_test_fail(fmt, ...)  do {					\
+		ksft_print_msg("failed reason: [" fmt "]\n", ##__VA_ARGS__); \
+		ksft_test_result_fail("%s\n", current_test);		\
 	} while (0)
 
 static void uffd_test_skip(const char *message)
 {
-	printf("skipped [reason: %s]\n", message);
-	ksft_inc_xskip_cnt();
+	ksft_test_result_skip("%s (%s)\n", current_test, message);
 }
 
-/*
- * Returns 1 if specific userfaultfd supported, 0 otherwise.  Note, we'll
- * return 1 even if some test failed as long as uffd supported, because in
- * that case we still want to proceed with the rest uffd unit tests.
- */
-static int test_uffd_api(bool use_dev)
+static void test_uffd_api(bool use_dev)
 {
 	struct uffdio_api uffdio_api;
 	int uffd;
@@ -140,7 +121,7 @@ static int test_uffd_api(bool use_dev)
 		uffd = uffd_open_sys(UFFD_FLAGS);
 	if (uffd < 0) {
 		uffd_test_skip("cannot open userfaultfd handle");
-		return 0;
+		return;
 	}
 
 	/* Test wrong UFFD_API */
@@ -177,8 +158,6 @@ static int test_uffd_api(bool use_dev)
 	uffd_test_pass();
 out:
 	close(uffd);
-	/* We have a valid uffd handle */
-	return 1;
 }
 
 
@@ -1701,6 +1680,26 @@ static void usage(const char *prog)
 	exit(KSFT_FAIL);
 }
 
+static int uffd_count_tests(int n_tests, int n_mems, const char *test_filter)
+{
+	uffd_test_case_t *test;
+	int i, j, count = 0;
+
+	if (!test_filter)
+		count += 2;	/* test_uffd_api(false) + test_uffd_api(true) */
+
+	for (i = 0; i < n_tests; i++) {
+		test = &uffd_tests[i];
+		if (test_filter && !strstr(test->name, test_filter))
+			continue;
+		for (j = 0; j < n_mems; j++)
+			if (test->mem_targets & mem_types[j].mem_flag)
+				count++;
+	}
+
+	return count;
+}
+
 int main(int argc, char *argv[])
 {
 	int n_tests = sizeof(uffd_tests) / sizeof(uffd_test_case_t);
@@ -1711,8 +1710,7 @@ int main(int argc, char *argv[])
 	mem_type_t *mem_type;
 	uffd_test_args_t args;
 	const char *errmsg;
-	int has_uffd, opt;
-	int i, j;
+	int i, j, opt;
 
 	while ((opt = getopt(argc, argv, "f:hl")) != -1) {
 		switch (opt) {
@@ -1730,24 +1728,28 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	if (!test_filter && !list_only) {
-		has_uffd = test_uffd_api(false);
-		has_uffd |= test_uffd_api(true);
-
-		if (!has_uffd) {
-			printf("Userfaultfd not supported or unprivileged, skip all tests\n");
-			exit(KSFT_SKIP);
+	if (list_only) {
+		for (i = 0; i < n_tests; i++) {
+			test = &uffd_tests[i];
+			if (test_filter && !strstr(test->name, test_filter))
+				continue;
+			printf("%s\n", test->name);
 		}
+		return KSFT_PASS;
+	}
+
+	ksft_print_header();
+	ksft_set_plan(uffd_count_tests(n_tests, n_mems, test_filter));
+
+	if (!test_filter) {
+		test_uffd_api(false);
+		test_uffd_api(true);
 	}
 
 	for (i = 0; i < n_tests; i++) {
 		test = &uffd_tests[i];
 		if (test_filter && !strstr(test->name, test_filter))
 			continue;
-		if (list_only) {
-			printf("%s\n", test->name);
-			continue;
-		}
 		for (j = 0; j < n_mems; j++) {
 			mem_type = &mem_types[j];
 
@@ -1758,6 +1760,10 @@ int main(int argc, char *argv[])
 			uffd_test_ops = mem_type->mem_ops;
 			uffd_test_case_ops = test->test_case_ops;
 
+			if (!(test->mem_targets & mem_type->mem_flag))
+				continue;
+
+			uffd_test_start("%s on %s", test->name, mem_type->name);
 			if (mem_type->mem_flag & (MEM_HUGETLB_PRIVATE | MEM_HUGETLB)) {
 				gopts.page_size = default_huge_page_size();
 				if (gopts.page_size == 0) {
@@ -1777,10 +1783,6 @@ int main(int argc, char *argv[])
 			/* Initialize test arguments */
 			args.mem_type = mem_type;
 
-			if (!(test->mem_targets & mem_type->mem_flag))
-				continue;
-
-			uffd_test_start("%s on %s", test->name, mem_type->name);
 			if (!uffd_feature_supported(test)) {
 				uffd_test_skip("feature missing");
 				continue;
@@ -1794,10 +1796,7 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	if (!list_only)
-		uffd_test_report();
-
-	return ksft_get_fail_cnt() ? KSFT_FAIL : KSFT_PASS;
+	ksft_finished();
 }
 
 #else /* __NR_userfaultfd */
@@ -1806,8 +1805,8 @@ int main(int argc, char *argv[])
 
 int main(void)
 {
-	printf("Skipping %s (missing __NR_userfaultfd)\n", __file__);
-	return KSFT_SKIP;
+	ksft_print_header();
+	ksft_exit_skip("missing __NR_userfaultfd definition\n");
 }
 
 #endif /* __NR_userfaultfd */
-- 
2.53.0


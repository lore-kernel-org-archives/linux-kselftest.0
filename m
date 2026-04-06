Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E894311C1B;
	Mon,  6 Apr 2026 14:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485171; cv=none; b=ho0ge8BxSziwAS60q+3eOPQwyYgIBiD8HE/BCCTrgEdDUimvI+k4ug1Ect3AqyIaXILjkspAcq1McRBcWNg8pawfx3NVAwEr9+sjk/N34MkzgTIX6ovqby8ZbmKo4XNQOJw/meU9RlBkCteuPhww5Ch88eU0PkXf8lamffMyQqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485171; c=relaxed/simple;
	bh=0T8XGF7c4bz/U4v3lIA/VoisDbbIrRHxeXXAjkWdKoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k47eQyMOjmx+xOoAoMcyA6jtD3orL8tGzw+UJuf8tyDxyEV6tH4Pt5Ir5oFnhae0nSG7lHqqYeBz9OjA0Tr1fEUfS9wOEgGIyFb1rsyicPiRmaaB70NXTyCSLxb1lKavlsxrMsqtP5+kgomDF62VXR6gryE6jWW1laPGoNq0EXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1ZFD1Rq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1ZFD1Rq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BAA2C4AF09;
	Mon,  6 Apr 2026 14:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485170;
	bh=0T8XGF7c4bz/U4v3lIA/VoisDbbIrRHxeXXAjkWdKoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a1ZFD1RqsHLkHrakUsdL3Z+UmZe7qODbptg3tN1udMp/bCBRfqa43JO//7QUKbqBh
	 CBEtSS7KG2BSALrd719qlvCk5BdOLkwQ3aEzkax5vjqRlVhfGXmgvs7VhVXVcznnNf
	 QmaB9lSH6U1Ql/j34oqrXzmBtpHTUkJdhg21wUjd8RtikTnV8A/CFAP1pa5PxmFVvD
	 g7hmygAcHmusDzJlpupW9lWwRdOYrHVy4RDZsya/lBO9dZeszPU4ojHOTqiUlUV06g
	 wzTyGGZg4xz9aHKxY+Chzxs6fzIxQzo8mX8rF8IZnbi5HL7SvVumUweuj4BP4ceXUD
	 U5x2wTIiecT4Q==
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
Subject: [PATCH 18/53] selftests/mm: uffd-unit-tests: use kselftest framework
Date: Mon,  6 Apr 2026 17:17:00 +0300
Message-ID: <20260406141735.2179309-19-rppt@kernel.org>
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

Convert uffd-unit-tests to use kselftest framework for reporting and
tracking successful and failing runs.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 79 +++++++++++---------
 1 file changed, 44 insertions(+), 35 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 6f5e404a446c..1a33db281f8a 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -86,39 +86,24 @@ typedef struct {
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
 
 #define  uffd_test_fail(...)  do {		\
-		printf("failed [reason: ");	\
-		printf(__VA_ARGS__);		\
-		printf("]\n");			\
-		ksft_inc_fail_cnt();		\
+		ksft_test_result_fail("%s\n", current_test);	\
 	} while (0)
 
 static void uffd_test_skip(const char *message)
 {
-	printf("skipped [reason: %s]\n", message);
-	ksft_inc_xskip_cnt();
+	ksft_test_result_skip("%s (%s)\n", current_test, message);
 }
 
 /*
@@ -1701,6 +1686,26 @@ static void usage(const char *prog)
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
@@ -1730,24 +1735,31 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	if (!test_filter && !list_only) {
+	if (list_only) {
+		for (i = 0; i < n_tests; i++) {
+			test = &uffd_tests[i];
+			if (test_filter && !strstr(test->name, test_filter))
+				continue;
+			printf("%s\n", test->name);
+		}
+		return KSFT_PASS;
+	}
+
+	ksft_print_header();
+	ksft_set_plan(uffd_count_tests(n_tests, n_mems, test_filter));
+
+	if (!test_filter) {
 		has_uffd = test_uffd_api(false);
 		has_uffd |= test_uffd_api(true);
 
-		if (!has_uffd) {
-			printf("Userfaultfd not supported or unprivileged, skip all tests\n");
-			exit(KSFT_SKIP);
-		}
+		if (!has_uffd)
+			ksft_exit_skip("Userfaultfd not supported or unprivileged\n");
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
 
@@ -1794,10 +1806,7 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	if (!list_only)
-		uffd_test_report();
-
-	return ksft_get_fail_cnt() ? KSFT_FAIL : KSFT_PASS;
+	ksft_finished();
 }
 
 #else /* __NR_userfaultfd */
@@ -1806,8 +1815,8 @@ int main(int argc, char *argv[])
 
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


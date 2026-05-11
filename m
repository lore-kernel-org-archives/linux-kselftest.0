Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815A843C05B;
	Mon, 11 May 2026 16:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517015; cv=none; b=pEcut4BhqHUzIk/HE+8z/tsDvt+tBKq9xMR+1PH2bANNdwRgW0/rkOoIMycPnHF+3A9h9jkNVTxFhKn+gWlspnBEOD9e+xIAtj46CW/suxgTrZ0Ll719k+0hYKbpizDKIp1fv+ZM91r3lCuESK283ikxOHyDAgjZFOGKjOqMgzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517015; c=relaxed/simple;
	bh=+tyhzUeUEnzi1iDlGNaasRQg7y2vvwXExnHRF7PW/zI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X25KkXK+o7tlJ2t8bFMePNOVkw7i7Is9gmv9QHkZttnPW9Pxyc5irJCAQxnoIi5M+hTAeol4lYGoeFT7VLWunNF1Bi1TLAzougVibAscLek8CMBwPPWN9PvSZ5/Jyw42VzxbZzOJpuB8OORu9aGRz5Z3KRlQFwcD4twwWuGZqQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RASCVci0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RASCVci0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17673C2BCB0;
	Mon, 11 May 2026 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517015;
	bh=+tyhzUeUEnzi1iDlGNaasRQg7y2vvwXExnHRF7PW/zI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RASCVci0CiekyunSKFk+4nebtalZXqMtTqFsylGOr1atHx+Bw7NPglCdvbZ/xHxNr
	 1UdginOFsZHRcqOLvZ3RkOi2V53eKlyJ6BGa4LaboIQJ4YgH+XSR71l7ATIxM0teea
	 TVw9suEblqOdzta2E99NgpHM8ieM5L3JlwIi7KEdPXl1fmGuKHVgE/IrLx4s8KA2zh
	 ciK878p1BsNq/EhGvpc1jPwLCFlVW5vkn9aEjSqCwQiaF4u4cmlp3N98VHgJlP7hRI
	 mtOnS5erFLQHhf2/970mcaRkjuLTXGeN0w6KvYZtkF/nJwq9A5Sd/pvkOk0gQOYIiS
	 6no5loLDsWzZg==
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
Subject: [PATCH v4 13/55] selftests/mm: khugepaged: group tests in an array
Date: Mon, 11 May 2026 19:27:57 +0300
Message-ID: <20260511162840.375890-14-rppt@kernel.org>
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

Currently khugepaged decides if a test can run using TEST() macro that
checks what mem_ops and collapse_context are set by the command line
arguments.

For better compatibility with ksefltest framework, add an array of 'struct
test_case's and redefine TEST() macro to conditionally add enabled tests to
that array.

Then execute the enabled test by looping the test_case's array.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 43 +++++++++++++++++++++----
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 3fe7ef04ac62..4e3f6bd3b933 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1165,6 +1165,34 @@ static void parse_test_type(int argc, char **argv)
 	get_finfo(argv[1]);
 }
 
+typedef void (*test_fn)(struct collapse_context *c, struct mem_ops *ops);
+
+struct test_case {
+	struct collapse_context *ctx;
+	struct mem_ops *ops;
+	const char *desc;
+	test_fn fn;
+};
+
+#define MAX_TEST_CASES 64
+static struct test_case test_cases[MAX_TEST_CASES];
+static int nr_test_cases;
+
+#define TEST(t, c, o) do {						\
+	if (c && o) {							\
+		if (nr_test_cases >= MAX_TEST_CASES) {			\
+			printf("MAX_TEST_CASES is too small\n");	\
+			exit(EXIT_FAILURE);				\
+		}							\
+		test_cases[nr_test_cases++] = (struct test_case){	\
+			.ctx	= c,					\
+			.ops	= o,					\
+			.desc	= #t,					\
+			.fn	= t,					\
+		};							\
+	}								\
+	} while (0)
+
 int main(int argc, char **argv)
 {
 	int hpage_pmd_order;
@@ -1220,13 +1248,6 @@ int main(int argc, char **argv)
 
 	alloc_at_fault();
 
-#define TEST(t, c, o) do { \
-	if (c && o) { \
-		printf("\nRun test: " #t " (%s:%s)\n", c->name, o->name); \
-		t(c, o); \
-	} \
-	} while (0)
-
 	TEST(collapse_full, khugepaged_context, anon_ops);
 	TEST(collapse_full, khugepaged_context, file_ops);
 	TEST(collapse_full, khugepaged_context, shmem_ops);
@@ -1286,5 +1307,13 @@ int main(int argc, char **argv)
 	TEST(madvise_retracted_page_tables, madvise_context, file_ops);
 	TEST(madvise_retracted_page_tables, madvise_context, shmem_ops);
 
+	exit_status = KSFT_PASS;
+	for (int i = 0; i < nr_test_cases; i++) {
+		struct test_case *t = &test_cases[i];
+
+		printf("\nRun test: %s (%s:%s)\n", t->desc, t->ctx->name, t->ops->name);
+		t->fn(t->ctx, t->ops);
+	}
+
 	restore_settings(0);
 }
-- 
2.53.0


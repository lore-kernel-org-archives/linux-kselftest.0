Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AEF37E317;
	Mon,  6 Apr 2026 14:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485135; cv=none; b=QDZiADYscCfQIpkcblpwQ3eS7YgJIRbCEnwDpO2jCtxWXpw6orqawRZ36y2KNfkOXoF45MJPSzFU01atuK92D3xXUJ1VGEF2Ebp1YnIHJwD40HHnqx9xqXSzp4g9Sz2jrNDRiqFLp+agRiTMnCcSFLYkAIYnqGZj41rAPBPC7h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485135; c=relaxed/simple;
	bh=XhpXuGv3Q2N5RR3SFrfFVeXHJDW2/LrteJ1gRZygmv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TzKdf0IoGGtyW7cgbAVKC3iK6Zw5BkA/XP+Vv2k++wgB+pN51ftIEr+1DcaolAv7qXQtjvO8gwLA1GhWX3veTP/w7eBbRRJ6dsFw48Wl5zlQGM+hvVfrzOcDXtjFLU2EwvSWcSPkWqSOuU8P9xs16O+9fNb15J5nz29waHqKcTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8nwyTgS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8nwyTgS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4949DC4CEF7;
	Mon,  6 Apr 2026 14:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485135;
	bh=XhpXuGv3Q2N5RR3SFrfFVeXHJDW2/LrteJ1gRZygmv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h8nwyTgS4YxERVKRIl2J6mmLTYZmy2J2Bl6MhuHG1WEbspQaH44DvdR/FSR5Mk6cl
	 HS87h7FLp3GiprDlQRc/9sdMdVPrrKxpAe3VYkLYonXe4uuGuzOBbCH05LHIgKkt10
	 OK7cK7inCWzdP4X6KWo2wCweoHTPwbWDayt8COtHN4sckOHDpHgUj/k+IJOrigVjvg
	 KvzFOA2oJJ97uTcnkJJ3HMOfa3qlIsH2qTKozKhqfPJ92xb6fnlt734cy44gfv3/Fl
	 1N0xyuMkWOaAd8k/SD5sSGUPpgoC3FQ2nzzxKJ2sqnnd9hu+zsDx9SDgaCHgb6tGSE
	 +Ci8c/qpSG5Gg==
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
Subject: [PATCH 12/53] selftests/mm: khugepaged: group tests in an array
Date: Mon,  6 Apr 2026 17:16:54 +0300
Message-ID: <20260406141735.2179309-13-rppt@kernel.org>
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

Currently khugepaged decides if a test can run using TEST() macro that
checks what mem_ops and collapse_context are set by the command line
arguments.

For better compatibility with ksefltest framework, add an array of 'struct
test_case's and redefine TEST() macro to conditionally add enabled tests to
that array.

Then execute the enabled test by looping the test_case's array.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 43 +++++++++++++++++++++----
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index e6fb01ca44ed..1cdc5918d20d 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1161,6 +1161,34 @@ static void parse_test_type(int argc, char **argv)
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
+#define MAX_TEST_CASES 45
+static struct test_case test_cases[MAX_TEST_CASES];
+static int nr_test_cases;
+
+#define TEST(t, c, o) do {						\
+	if (c && o) {							\
+		if (nr_test_cases >= MAX_TEST_CASES) {			\
+			printf("MAX_ADD_CASES is too small\n");		\
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
@@ -1216,13 +1244,6 @@ int main(int argc, char **argv)
 
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
@@ -1284,5 +1305,13 @@ int main(int argc, char **argv)
 	TEST(madvise_retracted_page_tables, madvise_context, file_ops);
 	TEST(madvise_retracted_page_tables, madvise_context, shmem_ops);
 
+	for (int i = 0; i < nr_test_cases; i++) {
+		struct test_case *t = &test_cases[i];
+
+		exit_status = KSFT_PASS;
+		printf("\nRun test: %s: (%s:%s)\n", t->desc, t->ctx->name, t->ops->name);
+		t->fn(t->ctx, t->ops);
+	}
+
 	restore_settings(0);
 }
-- 
2.53.0


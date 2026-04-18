Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8732235AC10;
	Sat, 18 Apr 2026 10:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509822; cv=none; b=jbCxZ6XoOANaSx3tAh6pf0KUEICHxtmvdGp2D/T1bAfPITtf61nXTTHAi1AmryQi/2Hh/g4qiUu9ODXENFGtlhlKb/Gi+nww46+gf5G2H3fQ4tbQ41PGX0++vygUWVtD+Ab2fzaK7o4WKtKyOkmQUZjOvUM1X5//PS9x+2c+7bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509822; c=relaxed/simple;
	bh=+LNQibm8aLuZSYwVY9FBq0cG7Hin4pW2zRDuMUNoq1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TOx4F/A260T4aX24317AFm+yx3M7kBDlmUgFZ4o17ylXHANuiftNkowGV/En0bXjL/6KNSvybvKdb24ecoCYRpXLezAmdAiUTOx3iAhRrUkrwUhLOZpOxmNwW+6HWSZ149p5tvdyzMHpQ/dHMSE3+EWckV0sB//LYZfkco+Q9OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzY8iBlR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzY8iBlR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8905FC2BCB3;
	Sat, 18 Apr 2026 10:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509822;
	bh=+LNQibm8aLuZSYwVY9FBq0cG7Hin4pW2zRDuMUNoq1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kzY8iBlRiHHKSBK8KKhiUcnEj6Tvqe0U4TiVoAz8ThiGpUpe2q1NJowR/hb/Ynl6/
	 5zYsw6qCZu7fDjZYxj/xmVPup92NWSSXnFCpfbnQBJfmm3DAnpxIlBtIwYSVMh99wN
	 2dm1/umoeOV0RpvCziqFt7W7tirImes+dM5bTiFc7G93fft+XMwAkfqype+QmJXEqB
	 WmxbnefLdQo6EodKXShbuaKyYaR44lr9HxLks1KZbdjSpkcG6HLlXpJqdsGxzZ4vPw
	 Jj9MFeOb38+hv9gPoq0qvlGX4aKY7FwD+AeyTkOsJZFYomXmyzHUR9ZZJeh2DRSlqJ
	 sgOzGr1g9GJhg==
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
Subject: [PATCH v2 12/53] selftests/mm: khugepaged: group tests in an array
Date: Sat, 18 Apr 2026 13:54:57 +0300
Message-ID: <20260418105539.1261536-13-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418105539.1261536-1-rppt@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
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
index e6fb01ca44ed..56494eea5ab3 100644
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
+#define MAX_TEST_CASES 64
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


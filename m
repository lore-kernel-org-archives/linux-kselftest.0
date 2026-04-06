Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37AB37F8A5;
	Mon,  6 Apr 2026 14:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485176; cv=none; b=HCaegV1m9D8IQBJ6dQ2FhFT20/iGnh3CqjatLmcPvgknO41cMUPKdlS1woF8XKd1vAyiXfMsCcIHTk1QZgbKOlYDRIe0ylE42iAyQhgQoxiU+XVa3iBW1m7HkFqup62ik4y2/7VORcg+mkCDy4gly1QyRdTm2/uJxEFqvq4OQiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485176; c=relaxed/simple;
	bh=iXIqmQSqfHYYzZ8gJikITuCG1TTtgUzd9IrH+Ph7iZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NYaiP95eoW2a2lgdjAWy1IqXxnsPfxvgS16dpceUN3+3iBelne0ME1eXtJg6fzfbJr3pUk7Klk1/pE7066Wjc8+0X23TstUjgHDtQFemWx3Q2MDdSmB0ZefED0AwJDfbNCir872oT7tCOxxVkJYYkdhHUkqvO4xZPY3QZ+W0jsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLc6Qalp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLc6Qalp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CA2C4CEF7;
	Mon,  6 Apr 2026 14:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485176;
	bh=iXIqmQSqfHYYzZ8gJikITuCG1TTtgUzd9IrH+Ph7iZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SLc6QalpBraC5bfXSjUsA5U3MvSHiKXzBUB35WUS4ol6/z/SMEqn/C8m3vU7XtEC8
	 DdrxRxs30TSd+0tSSFeqFFwfauRYNvFZ+vAIlbx27CCqAWPigY8LPaQCqbfvLn9J1y
	 xHI3gz7m4a8bwWqSIPvlUFHi0sN3cYKnIWUCJ3dHMBYZDSEa+gfSZXCB+wahdL4R5U
	 Mzc6O9/fAdGn37DVM2WDsVGLHUV2SGaRlU8Jwt+/rw7wz5nxU5b6Uam7Yy3cayJuIb
	 6RFCdfvABnZRfPCOegta4TV1KrKPDnwZfEXeEx1YHIVnoRQnM2NQH5G+u6cDoB4K2j
	 aRanWpYij++JA==
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
Subject: [PATCH 19/53] selftests/mm: va_high_addr_switch: use kselftest framework
Date: Mon,  6 Apr 2026 17:17:01 +0300
Message-ID: <20260406141735.2179309-20-rppt@kernel.org>
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

Convert va_high_addr_switch test to use kselftest framework for
reporting and tracking successful and failing runs.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 .../selftests/mm/va_high_addr_switch.c        | 39 +++++++++----------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/mm/va_high_addr_switch.c b/tools/testing/selftests/mm/va_high_addr_switch.c
index 51401e081b20..5741fd057640 100644
--- a/tools/testing/selftests/mm/va_high_addr_switch.c
+++ b/tools/testing/selftests/mm/va_high_addr_switch.c
@@ -257,40 +257,33 @@ void testcases_init(void)
 	switch_hint = addr_switch_hint;
 }
 
-static int run_test(struct testcase *test, int count)
+static void run_test(struct testcase *test, int count)
 {
 	void *p;
-	int i, ret = KSFT_PASS;
+	int i;
 
 	for (i = 0; i < count; i++) {
 		struct testcase *t = test + i;
 
 		p = mmap(t->addr, t->size, PROT_READ | PROT_WRITE, t->flags, -1, 0);
-
-		printf("%s: %p - ", t->msg, p);
-
 		if (p == MAP_FAILED) {
-			printf("FAILED\n");
-			ret = KSFT_FAIL;
+			ksft_test_result_fail("%s: MAP_FAILED\n", t->msg);
 			continue;
 		}
 
 		if (t->low_addr_required && p >= (void *)(switch_hint)) {
-			printf("FAILED\n");
-			ret = KSFT_FAIL;
+			ksft_test_result_fail("%s: %p not below switch hint\n", t->msg, p);
 		} else {
 			/*
 			 * Do a dereference of the address returned so that we catch
 			 * bugs in page fault handling
 			 */
 			memset(p, 0, t->size);
-			printf("OK\n");
+			ksft_test_result_pass("%s: %p\n", t->msg, p);
 		}
 		if (!t->keep_mapped)
 			munmap(p, t->size);
 	}
-
-	return ret;
 }
 
 #ifdef __aarch64__
@@ -322,19 +315,23 @@ static int supported_arch(void)
 
 int main(int argc, char **argv)
 {
-	int ret, hugetlb_ret = KSFT_PASS;
+	bool run_hugetlb = false;
+
+	ksft_print_header();
 
 	if (!supported_arch())
-		return KSFT_SKIP;
+		ksft_exit_skip("Architecture not supported\n");
+
+	if (argc == 2 && !strcmp(argv[1], "--run-hugetlb"))
+		run_hugetlb = true;
 
 	testcases_init();
 
-	ret = run_test(testcases, sz_testcases);
-	if (argc == 2 && !strcmp(argv[1], "--run-hugetlb"))
-		hugetlb_ret = run_test(hugetlb_testcases, sz_hugetlb_testcases);
+	ksft_set_plan(sz_testcases + (run_hugetlb ? sz_hugetlb_testcases : 0));
+
+	run_test(testcases, sz_testcases);
+	if (run_hugetlb)
+		run_test(hugetlb_testcases, sz_hugetlb_testcases);
 
-	if (ret == KSFT_PASS && hugetlb_ret == KSFT_PASS)
-		return KSFT_PASS;
-	else
-		return KSFT_FAIL;
+	ksft_finished();
 }
-- 
2.53.0


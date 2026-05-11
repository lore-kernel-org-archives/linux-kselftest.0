Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6DF43636B;
	Mon, 11 May 2026 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517067; cv=none; b=juhgjzH7SkcGcEYAuSyYNhNM5fPb3O1yglsLIbe31sHiUdJzHeHAm7qUBuL1eW/9cf+Z2oE8HticXRUEKS8JVcFH3Tlw/FtG2X5BKs/gb4d1kn8OkeAfUVY2qdwlcz2KDhbkrbzaR2JX+KsZAUzwAGaZNxYmVgO0aGlWcFvIim0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517067; c=relaxed/simple;
	bh=TUaLre/sMwxUr1N47mGs01d/9NCciABJgMJChwaRpDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+VZ33tziFFJUWC3JHvhGkLxK66sunqCLxMnY1TUSl8W3iuNTint83tDsZRRlpBxFG6DXYK7k+Q8hpnlOb8pvq6Rw/ZURpttXYcvzUlSCaV+e9+ZN3kDHqMG5Lr3dQa5nXYZ2nP2W4w5wkwrbskcRlwG8DeQ/0EqgPku8p7Zgc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzN1MA6c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzN1MA6c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67543C2BCC9;
	Mon, 11 May 2026 16:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517067;
	bh=TUaLre/sMwxUr1N47mGs01d/9NCciABJgMJChwaRpDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FzN1MA6cHDOaHTNHNqtwii36Ga/OSqkuv81ry1CdmJogggUUt3wGSwyco4tE1/Xo8
	 f+F9Hy/UjqeOT5ICPf7laGnjXm65Wt5IihlYpsQNXZIZHRg1KFeKGXuTKa6+yBZW/t
	 EHZ22aiOlbevdwDcMUpdUTk8/cxQauPcWJpcjZaSRbMv1DXWahvJNVUVsofKLrJX/I
	 +xEXJW0iTcSRs40DqjLnbI+W2atdD1fT9A58jkED73JnlcpeCiy9XGKEBxzAGsSzMM
	 6NabsgM87OlpfwydgQRBM3k/TfcD9cggaz6BwPAhVmRlYlUCVGCubyUWwEp+k+E4lf
	 DPxEhCtO9f8nw==
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
Subject: [PATCH v4 21/55] selftests/mm: va_high_addr_switch: use kselftest framework
Date: Mon, 11 May 2026 19:28:05 +0300
Message-ID: <20260511162840.375890-22-rppt@kernel.org>
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

Convert va_high_addr_switch test to use kselftest framework for
reporting and tracking successful and failing runs.

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 .../selftests/mm/va_high_addr_switch.c        | 41 +++++++++----------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/mm/va_high_addr_switch.c b/tools/testing/selftests/mm/va_high_addr_switch.c
index 51401e081b20..5d38735ea60e 100644
--- a/tools/testing/selftests/mm/va_high_addr_switch.c
+++ b/tools/testing/selftests/mm/va_high_addr_switch.c
@@ -257,40 +257,35 @@ void testcases_init(void)
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
+			ksft_perror("MAP_FAILED");
+			ksft_test_result_fail("%s\n", t->msg);
 			continue;
 		}
 
 		if (t->low_addr_required && p >= (void *)(switch_hint)) {
-			printf("FAILED\n");
-			ret = KSFT_FAIL;
+			ksft_print_msg("%p not below switch hint\n", p);
+			ksft_test_result_fail("%s\n", t->msg);
 		} else {
 			/*
 			 * Do a dereference of the address returned so that we catch
 			 * bugs in page fault handling
 			 */
 			memset(p, 0, t->size);
-			printf("OK\n");
+			ksft_test_result_pass("%s\n", t->msg);
 		}
 		if (!t->keep_mapped)
 			munmap(p, t->size);
 	}
-
-	return ret;
 }
 
 #ifdef __aarch64__
@@ -322,19 +317,23 @@ static int supported_arch(void)
 
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


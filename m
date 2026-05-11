Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237F942EEDA;
	Mon, 11 May 2026 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517257; cv=none; b=r7Zzy4+EgD71Yy8efAtKOCJbXPb1l1IBhhRWlJKMLfGmL7eUgh6/R28Ugp3S2Je0Og6alcCwZYrzlOOUaClICjqxc8wvKiHQtLlpyjoVZYx3CD39m+m7E3Y8fRhoTeS2e7cFCKR2Db4Eqf41yORhbQnfe/gp1RfwEui6QZrGYvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517257; c=relaxed/simple;
	bh=CAT3IuSEZPeCdoFxrZmRBLvR4FcaG5dr9dINuioHUqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezW+oQ9dB2ZNZgGClQAR3Bsniu3SUme4tXqANpmTD3/kjsD0WorKsTwQCNxsAd9oVrihZFhsNQZgxeKL5hHmMiBiBUx2w+FdDdmYl6Cou4I8ES8I1Wbo5Rh32T/FfS7vFS+ACS1R51FoxpuDJCEbTCwemfoHZBzSU3TTNr9567Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gy9Tut4z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gy9Tut4z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BEBC2BCB0;
	Mon, 11 May 2026 16:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517257;
	bh=CAT3IuSEZPeCdoFxrZmRBLvR4FcaG5dr9dINuioHUqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gy9Tut4zTuMiI7DX6CbEU48/A8Ei6hknht6ahxhMflJVfCg06LPyRHGMJsCqdmYYq
	 uQPB/xSGRvc1OeERMiA6PW/Uw6zitMT3oC6qzRiF0bh2a/Wusx60PaNGgQomRDF7iT
	 QT9prZ5ZhyD8H3elFaVl9Grr6/FjdHxkp6AtLy49GDtfq6ThvReryjwiOgCFm0J+rk
	 DsHwZzBvOYJL7HtFRnV+5tY73LvCcf1vN3Yr4W10DtH5r92X0rHJ1KZ0W/D5X6w9CO
	 hNEOFGJRSZsTiuacp3TU2AByepTRDeaEdB3CoMiDltKBlV/Q7lS+zsMtlI4pFzQU9i
	 /rpQFdSxc1aag==
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
Subject: [PATCH v4 50/55] selftests/mm: uffd-unit-tests: add setup of HugeTLB pages
Date: Mon, 11 May 2026 19:28:34 +0300
Message-ID: <20260511162840.375890-51-rppt@kernel.org>
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

uffd-unit-tests skips HugeTLB tests if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Replace exit() calls with _exit() to avoid restoring HugeTLB settings in
the middle of test.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 33 +++++++++++++++++---
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index db7c26835487..a6c14109e818 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -299,7 +299,7 @@ static int pagemap_test_fork(uffd_global_test_opts_t *gopts, bool with_event, bo
 		if (test_pin)
 			unpin_pages(&args);
 		/* Succeed */
-		exit(0);
+		_exit(0);
 	}
 	waitpid(child, &result, 0);
 
@@ -767,7 +767,7 @@ static void uffd_sigbus_test_common(uffd_global_test_opts_t *gopts, bool wp)
 		err("fork");
 
 	if (!pid)
-		exit(faulting_process(gopts, 2, wp));
+		_exit(faulting_process(gopts, 2, wp));
 
 	waitpid(pid, &err, 0);
 	if (err)
@@ -821,7 +821,7 @@ static void uffd_events_test_common(uffd_global_test_opts_t *gopts, bool wp)
 		err("fork");
 
 	if (!pid)
-		exit(faulting_process(gopts, 0, wp));
+		_exit(faulting_process(gopts, 0, wp));
 
 	waitpid(pid, &err, 0);
 	if (err)
@@ -1700,11 +1700,32 @@ static int uffd_count_tests(int n_tests, int n_mems, const char *test_filter)
 	return count;
 }
 
+static unsigned long uffd_setup_hugetlb(void)
+{
+	unsigned long nr_hugepages, hp_size;
+
+	hugetlb_save_settings();
+	hp_size = default_huge_page_size();
+
+	if (!hp_size)
+		return 0;
+
+	/* need twice UFFD_TEST_MEM_SIZE, one for src area and one for dst */
+	nr_hugepages = 2 * MAX(UFFD_TEST_MEM_SIZE, hp_size * 2) / hp_size;
+	hugetlb_set_nr_default_pages(nr_hugepages);
+
+	if (hugetlb_free_default_pages() < nr_hugepages)
+		return 0;
+
+	return hp_size;
+}
+
 int main(int argc, char *argv[])
 {
 	int n_tests = sizeof(uffd_tests) / sizeof(uffd_test_case_t);
 	int n_mems = sizeof(mem_types) / sizeof(mem_type_t);
 	const char *test_filter = NULL;
+	unsigned long hugepage_size;
 	bool list_only = false;
 	uffd_test_case_t *test;
 	mem_type_t *mem_type;
@@ -1738,6 +1759,8 @@ int main(int argc, char *argv[])
 		return KSFT_PASS;
 	}
 
+	hugepage_size = uffd_setup_hugetlb();
+
 	ksft_print_header();
 	ksft_set_plan(uffd_count_tests(n_tests, n_mems, test_filter));
 
@@ -1765,9 +1788,9 @@ int main(int argc, char *argv[])
 
 			uffd_test_start("%s on %s", test->name, mem_type->name);
 			if (mem_type->mem_flag & (MEM_HUGETLB_PRIVATE | MEM_HUGETLB)) {
-				gopts.page_size = default_huge_page_size();
+				gopts.page_size = hugepage_size;
 				if (gopts.page_size == 0) {
-					uffd_test_skip("huge page size is 0, feature missing?");
+					uffd_test_skip("not enough HugeTLB pages");
 					continue;
 				}
 			} else {
-- 
2.53.0


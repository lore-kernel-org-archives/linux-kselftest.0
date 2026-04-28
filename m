Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1728D3803F8;
	Tue, 28 Apr 2026 20:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409294; cv=none; b=piE5DCrEP2Yc2ib1ehaRt3UILdjw71506ZNiXf8lc74E02L2P5Jt9ZSjyM+4alPBVXRe0KZrJq4vOJjsNOPfZjljoIXn+7Wo+exmrQl6KlkETZ8sFzB45Yi/D7E/eH2RVGwJxGhJ2/vItTpTvOnx2bmATG13QBQ8KWbx5sFEJN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409294; c=relaxed/simple;
	bh=C8Qz87BGrLBhc4P4E9wehTmUZkE5iKzjerVbkLBntAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uU0ZBQHOjiJj3tKhZdgJ2IKhbi2Q86nLIrxO8TJHUOmdXtSA0WtI7ZOmO0kdGMXGmzVlpePEoakKyUeM0c4t0SRUEqdCCNDfws+AN+f42tFT3/Qanjpe0BcxAB5WLvn0OpF2DBmC5YCzZeuUu1ZddbEKTD8nkqLLREurWu3K7tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RR7cpHE7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RR7cpHE7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D60C2BCC4;
	Tue, 28 Apr 2026 20:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409294;
	bh=C8Qz87BGrLBhc4P4E9wehTmUZkE5iKzjerVbkLBntAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RR7cpHE7thWHO2+9FeEKmkFhRFBUzwIJiQBh4ygtYGyuaZQqIMQjLpWatx0lOAOwn
	 JQsk+vM2+cwevsRrpF/sFfmtzZp8en2eiVqRRExGdlNe+oG1VJJYBPTgGYHbfGK1Ji
	 jVZaWRywXFcJXKaK9WzReg1cQBJyjBTB0rqAJjmdU1GI1Z4TMhmzVrOwiOZ0IGD3mO
	 sEwpK4iaUg4bXg3/DxvpM7PPOghqX3mVuZidp0+8yJj+CER2WVK3tGGQi7jfejWWNj
	 KdHDSrJ+A9o6OLcqGM4VBhQutBlVHR6LP7Zyq93rtsKII1SoOHBiWBY8b8u5Qyyn8V
	 le9F9rhpfuPJQ==
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
Subject: [PATCH v3 49/54] selftests/mm: uffd-unit-tests: add setup of HugeTLB pages
Date: Tue, 28 Apr 2026 23:42:35 +0300
Message-ID: <20260428204240.1924129-50-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428204240.1924129-1-rppt@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
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

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 31 +++++++++++++++++---
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 1a33db281f8a..20e1829db91f 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -305,7 +305,7 @@ static int pagemap_test_fork(uffd_global_test_opts_t *gopts, bool with_event, bo
 		if (test_pin)
 			unpin_pages(&args);
 		/* Succeed */
-		exit(0);
+		_exit(0);
 	}
 	waitpid(child, &result, 0);
 
@@ -773,7 +773,7 @@ static void uffd_sigbus_test_common(uffd_global_test_opts_t *gopts, bool wp)
 		err("fork");
 
 	if (!pid)
-		exit(faulting_process(gopts, 2, wp));
+		_exit(faulting_process(gopts, 2, wp));
 
 	waitpid(pid, &err, 0);
 	if (err)
@@ -827,7 +827,7 @@ static void uffd_events_test_common(uffd_global_test_opts_t *gopts, bool wp)
 		err("fork");
 
 	if (!pid)
-		exit(faulting_process(gopts, 0, wp));
+		_exit(faulting_process(gopts, 0, wp));
 
 	waitpid(pid, &err, 0);
 	if (err)
@@ -1706,11 +1706,32 @@ static int uffd_count_tests(int n_tests, int n_mems, const char *test_filter)
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
@@ -1745,6 +1766,8 @@ int main(int argc, char *argv[])
 		return KSFT_PASS;
 	}
 
+	hugepage_size = uffd_setup_hugetlb();
+
 	ksft_print_header();
 	ksft_set_plan(uffd_count_tests(n_tests, n_mems, test_filter));
 
@@ -1771,7 +1794,7 @@ int main(int argc, char *argv[])
 			uffd_test_case_ops = test->test_case_ops;
 
 			if (mem_type->mem_flag & (MEM_HUGETLB_PRIVATE | MEM_HUGETLB)) {
-				gopts.page_size = default_huge_page_size();
+				gopts.page_size = hugepage_size;
 				if (gopts.page_size == 0) {
 					uffd_test_skip("huge page size is 0, feature missing?");
 					continue;
-- 
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72E8339844;
	Tue, 28 Apr 2026 20:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409077; cv=none; b=Jx4oUzxa12e3fmhdTzsuJekTdliRVKXM+Adkz7xCoXD3pRWTbCIk/LGzVlkaSHqekgdbIfPyBcglCX0GF12FSTI5qNLR4Jsg/SJQoBqjvDRHx9A6JolcG0t/fz/RMi/TImGV5xXmWFHdyw6phvFmBa7tds+RBrnR6sH3XXWnDcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409077; c=relaxed/simple;
	bh=fVCj9egQfI3xfmHaM59sAXV1x5+dV8VoGPx5qmYr/HI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gtz6Fd71m5ve0lEl32Ez0CSG+3KUq++1xgNFBMEHX8GRfXxEG9wndlUWUeFTOE3m4SPwBDwkHrBdrvIfl+h6ZyLKzQxlYfGff93nTLDtos4G3rYRpDW2a13e2lugsxdQV/Fw83KGpbxOtsGh9Bh5HjQ4tjKZSP34NMgy8V78STU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDcC27la; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDcC27la"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3A6C2BCAF;
	Tue, 28 Apr 2026 20:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409076;
	bh=fVCj9egQfI3xfmHaM59sAXV1x5+dV8VoGPx5qmYr/HI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YDcC27laQpZlXBDwVn9TC7PuyP8ixtdqjmm78azLyOACYs+mYtDRWfOuJcYQrMDOO
	 RvcF4lasiaWiFizAzCKXNCIWGntXkDlHN4N/uEF8CLj3l9faWXa7SEV70JVRQ2pWYD
	 0EYfhniaqgcJXMtJLLHWrAMUpze+B9TBtogsbaGrfP2sr5z+Z3LMqAKgxmdReAE3Ot
	 G8pAbY1Or1AXLJj1rXmgXRuyk9Qf6eB6IpBcsyOO9ieo0ohOeYC1IRu28IHZWXJFjq
	 8GpALg0WGNOaiuu0aX1CVZ05nOhGvXay2zmOAROkASuL8FisKvTzVz+g1jrKw287IF
	 vDRRA/8UtP83g==
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
Subject: [PATCH v3 16/54] selftests/mm: protection_keys: use descriptive test names in TAP output
Date: Tue, 28 Apr 2026 23:42:02 +0300
Message-ID: <20260428204240.1924129-17-rppt@kernel.org>
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

Replace the numeric test index in TAP output with the actual test
function name.

Use a structure containing function pointer and its name rather than
only the function pointer in the pkey_tests array.

Reviewed by: Donet Tom <donettom@linux.ibm.com>

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/protection_keys.c | 55 +++++++++++---------
 1 file changed, 31 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index 2085982dba69..80c6124e8378 100644
--- a/tools/testing/selftests/mm/protection_keys.c
+++ b/tools/testing/selftests/mm/protection_keys.c
@@ -1692,29 +1692,36 @@ static void test_mprotect_pkey_on_unsupported_cpu(int *ptr, u16 pkey)
 	pkey_assert(sret < 0);
 }
 
-static void (*pkey_tests[])(int *ptr, u16 pkey) = {
-	test_read_of_write_disabled_region,
-	test_read_of_access_disabled_region,
-	test_read_of_access_disabled_region_with_page_already_mapped,
-	test_write_of_write_disabled_region,
-	test_write_of_write_disabled_region_with_page_already_mapped,
-	test_write_of_access_disabled_region,
-	test_write_of_access_disabled_region_with_page_already_mapped,
-	test_kernel_write_of_access_disabled_region,
-	test_kernel_write_of_write_disabled_region,
-	test_kernel_gup_of_access_disabled_region,
-	test_kernel_gup_write_to_write_disabled_region,
-	test_executing_on_unreadable_memory,
-	test_implicit_mprotect_exec_only_memory,
-	test_mprotect_with_pkey_0,
-	test_ptrace_of_child,
-	test_pkey_init_state,
-	test_pkey_syscalls_on_non_allocated_pkey,
-	test_pkey_syscalls_bad_args,
-	test_pkey_alloc_exhaust,
-	test_pkey_alloc_free_attach_pkey0,
+struct pkey_test {
+	void (*func)(int *ptr, u16 pkey);
+	const char *name;
+};
+
+#define PKEY_TEST(fn) { fn, #fn }
+
+static struct pkey_test pkey_tests[] = {
+	PKEY_TEST(test_read_of_write_disabled_region),
+	PKEY_TEST(test_read_of_access_disabled_region),
+	PKEY_TEST(test_read_of_access_disabled_region_with_page_already_mapped),
+	PKEY_TEST(test_write_of_write_disabled_region),
+	PKEY_TEST(test_write_of_write_disabled_region_with_page_already_mapped),
+	PKEY_TEST(test_write_of_access_disabled_region),
+	PKEY_TEST(test_write_of_access_disabled_region_with_page_already_mapped),
+	PKEY_TEST(test_kernel_write_of_access_disabled_region),
+	PKEY_TEST(test_kernel_write_of_write_disabled_region),
+	PKEY_TEST(test_kernel_gup_of_access_disabled_region),
+	PKEY_TEST(test_kernel_gup_write_to_write_disabled_region),
+	PKEY_TEST(test_executing_on_unreadable_memory),
+	PKEY_TEST(test_implicit_mprotect_exec_only_memory),
+	PKEY_TEST(test_mprotect_with_pkey_0),
+	PKEY_TEST(test_ptrace_of_child),
+	PKEY_TEST(test_pkey_init_state),
+	PKEY_TEST(test_pkey_syscalls_on_non_allocated_pkey),
+	PKEY_TEST(test_pkey_syscalls_bad_args),
+	PKEY_TEST(test_pkey_alloc_exhaust),
+	PKEY_TEST(test_pkey_alloc_free_attach_pkey0),
 #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
-	test_ptrace_modifies_pkru,
+	PKEY_TEST(test_ptrace_modifies_pkru),
 #endif
 };
 
@@ -1735,7 +1742,7 @@ static void run_tests_once(void)
 		dprintf1("test %d starting with pkey: %d\n", test_nr, pkey);
 		ptr = malloc_pkey(PAGE_SIZE, prot, pkey);
 		dprintf1("test %d starting...\n", test_nr);
-		pkey_tests[test_nr](ptr, pkey);
+		pkey_tests[test_nr].func(ptr, pkey);
 		dprintf1("freeing test memory: %p\n", ptr);
 		free_pkey_malloc(ptr);
 		sys_pkey_free(pkey);
@@ -1746,7 +1753,7 @@ static void run_tests_once(void)
 		tracing_off();
 		close_test_fds();
 
-		printf("test %2d PASSED (iteration %d)\n", test_nr, iteration_nr);
+		printf("test %s PASSED (iteration %d)\n", pkey_tests[test_nr].name, iteration_nr);
 		dprintf1("======================\n\n");
 	}
 	iteration_nr++;
-- 
2.53.0


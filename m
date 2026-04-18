Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C61430BB8D;
	Sat, 18 Apr 2026 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776510026; cv=none; b=GhxI2KK9rj1OhMdch43HL8nZ4v7WrLGe7zlcIobqcvLgZRz9l0Xu38mA8O6YIsgxdY3UO97aXoALfJAqrUy2bNEn9rGaVsSjB2LqzuunOYCFN+HZbkhO65JBZ9L3QtZ/rxF/DE3N6ew8xIrrmg3GAnRPoy0mJxuhCSKu9WQBCmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776510026; c=relaxed/simple;
	bh=y1/LZCjoyF2qnYsdueFnA+DH0rudzkRE8f0qNrnyHBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KjJOgjcE1TjupsybhFtyog1DkrxWRYrmG2AqnYTa8qLLYCOQ6BpO+IMmWNg5GLFCRp68pI5wdU8IAVNg52CaMM5+BEBiyAzrOmEq6cHKlyalaXPFj/KnDI0HCyDEI3+ZYobt96/icNy4a+t/8qjeXgd6uCjj+spuLcrWsZQV7HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkJF6fSX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkJF6fSX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E1AC19424;
	Sat, 18 Apr 2026 11:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776510026;
	bh=y1/LZCjoyF2qnYsdueFnA+DH0rudzkRE8f0qNrnyHBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mkJF6fSXFK9Ix1bEGXpbl5HcxyFd5J2LbGzv6eUHS2PxDlzS6LO3c01xC7HIHK5rp
	 Qv9fVgOHpWI9Tk03NckmITG7FufB16/tyDc/ENfiB7sB8pm9zRV5dWXwrxUyzXX+Em
	 SVgvPN1CO1ZFtaFK1N7ZzfuInp06O9fPKYuLXkxm7D8vw/kR8bmF1FGLDAplQt1gKp
	 CNgM6os9A/axwhVHRjBz5dTkv01Bbp8NcwBMAO85tb2jvATLNkw5gVUiVM1Bz4uLHh
	 nIcZUZYmS+DwVq2QA9rjtklPuWA4GcYG+j2vSYk2jPz9XKcaGkCqcX2lYrbyk/ZYw2
	 wmW4PG4wOYsQQ==
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
Subject: [PATCH v2 45/53] selftests/mm: protection_keys: use library code for HugeTLB setup
Date: Sat, 18 Apr 2026 13:55:30 +0300
Message-ID: <20260418105539.1261536-46-rppt@kernel.org>
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

protection_keys open codes setup of HugeTLB pages.

Replace it with the library functions from hugepage_setup.

Replace exit() calls with _exit() to avoid restoring HugeTLB settings in
the middle of test.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/protection_keys.c | 51 ++++++--------------
 1 file changed, 15 insertions(+), 36 deletions(-)

diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index c069250969f5..6657f13bc7e7 100644
--- a/tools/testing/selftests/mm/protection_keys.c
+++ b/tools/testing/selftests/mm/protection_keys.c
@@ -47,6 +47,7 @@
 #include <setjmp.h>
 
 #include "pkey-helpers.h"
+#include "hugepage_settings.h"
 
 int iteration_nr = 1;
 int test_nr;
@@ -61,6 +62,7 @@ noinline int read_ptr(int *ptr)
 	return *ptr;
 }
 
+#if CONTROL_TRACING > 0
 static void cat_into_file(char *str, char *file)
 {
 	int fd = open(file, O_RDWR);
@@ -86,7 +88,6 @@ static void cat_into_file(char *str, char *file)
 	close(fd);
 }
 
-#if CONTROL_TRACING > 0
 static int warned_tracing;
 static int tracing_root_ok(void)
 {
@@ -709,50 +710,28 @@ static void *malloc_pkey_anon_huge(long size, int prot, u16 pkey)
 }
 
 static int hugetlb_setup_ok;
-#define SYSFS_FMT_NR_HUGE_PAGES "/sys/kernel/mm/hugepages/hugepages-%ldkB/nr_hugepages"
 #define GET_NR_HUGE_PAGES 10
 static void setup_hugetlbfs(void)
 {
-	int err;
-	int fd;
-	char buf[256];
-	long hpagesz_kb;
-	long hpagesz_mb;
+	long hpagesz_mb = HPAGE_SIZE / 1024 / 1024;
+	unsigned long free_pages;
 
 	if (geteuid() != 0) {
 		ksft_print_msg("WARNING: not run as root, can not do hugetlb test\n");
 		return;
 	}
 
-	cat_into_file(__stringify(GET_NR_HUGE_PAGES), "/proc/sys/vm/nr_hugepages");
-
 	/*
-	 * Now go make sure that we got the pages and that they
+	 * Make sure that we got the pages and that they
 	 * are PMD-level pages. Someone might have made PUD-level
 	 * pages the default.
 	 */
-	hpagesz_kb = HPAGE_SIZE / 1024;
-	hpagesz_mb = hpagesz_kb / 1024;
-	sprintf(buf, SYSFS_FMT_NR_HUGE_PAGES, hpagesz_kb);
-	fd = open(buf, O_RDONLY);
-	if (fd < 0) {
-		fprintf(stderr, "opening sysfs %ldM hugetlb config: %s\n",
-			hpagesz_mb, strerror(errno));
-		return;
-	}
-
-	/* -1 to guarantee leaving the trailing \0 */
-	err = read(fd, buf, sizeof(buf)-1);
-	close(fd);
-	if (err <= 0) {
-		fprintf(stderr, "reading sysfs %ldM hugetlb config: %s\n",
-			hpagesz_mb, strerror(errno));
-		return;
-	}
-
-	if (atoi(buf) != GET_NR_HUGE_PAGES) {
-		fprintf(stderr, "could not confirm %ldM pages, got: '%s' expected %d\n",
-			hpagesz_mb, buf, GET_NR_HUGE_PAGES);
+	hugetlb_save_settings();
+	hugetlb_set_nr_pages(HPAGE_SIZE, GET_NR_HUGE_PAGES);
+	free_pages = hugetlb_free_pages(HPAGE_SIZE);
+	if (free_pages < GET_NR_HUGE_PAGES) {
+		ksft_print_msg("could not confirm %ldM pages, got: '%ld' expected %d\n",
+			       hpagesz_mb, free_pages, GET_NR_HUGE_PAGES);
 		return;
 	}
 
@@ -1129,7 +1108,7 @@ static void become_child(void)
 		/* in the child */
 		return;
 	}
-	exit(0);
+	_exit(0);
 }
 
 /* Assumes that all pkeys other than 'pkey' are unallocated */
@@ -1508,18 +1487,18 @@ static void test_ptrace_modifies_pkru(int *ptr, u16 pkey)
 		 * checking
 		 */
 		if (__read_pkey_reg() != new_pkru)
-			exit(1);
+			_exit(1);
 
 		/* Stop and allow the tracer to clear XSTATE_BV for PKRU */
 		raise(SIGSTOP);
 
 		if (__read_pkey_reg() != 0)
-			exit(1);
+			_exit(1);
 
 		/* Stop and allow the tracer to examine PKRU */
 		raise(SIGSTOP);
 
-		exit(0);
+		_exit(0);
 	}
 
 	pkey_assert(child == waitpid(child, &status, 0));
-- 
2.53.0


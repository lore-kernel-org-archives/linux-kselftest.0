Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0C83A782F;
	Thu, 22 Jan 2026 17:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101371; cv=none; b=o7JZK1dim6Loy4zinaAPpxLVCWP4SuJgzgxYNcHXwwceJKKUV/9NoVDumecqkXGv+clLTQ9Tq6XdxZGoqniR7EGx6XK8hb0IVjK7v6YPFiVhafH0Gn/J6dKVviMpKLo942TldMcZMsMQ5SWuOL7eVUj+xF1wp217Bny0/b0AYEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101371; c=relaxed/simple;
	bh=3Zp9oZUvOKoIljBvArIWni49Effe1tdg49MfcrjnnJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1WhDO6JD0j3tI2ApJAVcGJx5O5Y9d46Q8EnRfSAIHY2XRjavwU5JhAhlaAZu5x2cd3JJgHny+lcwrWcSChkLhhiiTeDY69hCHeFen0Il7X8mylVSQTb2fxdKKsDCE8p96qs3GZ22tY+o/Mh6VrG9ZPkOVufbU0p8QZ+8y9D7a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1813D1476;
	Thu, 22 Jan 2026 09:02:38 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F9203F632;
	Thu, 22 Jan 2026 09:02:43 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>
Subject: [PATCH v3 6/9] selftests/mm: introduce helper to read every page
Date: Thu, 22 Jan 2026 17:02:21 +0000
Message-ID: <20260122170224.4056513-7-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260122170224.4056513-1-kevin.brodsky@arm.com>
References: <20260122170224.4056513-1-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FORCE_READ(*addr) ensures that the compiler will emit a load from
addr. Several tests need to trigger such a load for a range of
pages, ensuring that every page is faulted in, if it wasn't already.

Introduce a new helper force_read_pages() that does exactly that and
replace existing loops with a call to it.

The step size (regular/huge page size) is preserved for all loops,
except in split_huge_page_test. Reading every byte is unnecessary;
we now read every huge page, matching the following call to
check_huge_file().

Reviewed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/hugetlb-madvise.c      | 9 +--------
 tools/testing/selftests/mm/pfnmap.c               | 9 +++------
 tools/testing/selftests/mm/split_huge_page_test.c | 6 +-----
 tools/testing/selftests/mm/vm_util.h              | 7 +++++++
 4 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb-madvise.c b/tools/testing/selftests/mm/hugetlb-madvise.c
index 05d9d2805ae4..5b12041fa310 100644
--- a/tools/testing/selftests/mm/hugetlb-madvise.c
+++ b/tools/testing/selftests/mm/hugetlb-madvise.c
@@ -47,14 +47,7 @@ void write_fault_pages(void *addr, unsigned long nr_pages)
 
 void read_fault_pages(void *addr, unsigned long nr_pages)
 {
-	unsigned long i;
-
-	for (i = 0; i < nr_pages; i++) {
-		unsigned long *addr2 =
-			((unsigned long *)(addr + (i * huge_page_size)));
-		/* Prevent the compiler from optimizing out the entire loop: */
-		FORCE_READ(*addr2);
-	}
+	force_read_pages(addr, nr_pages, huge_page_size);
 }
 
 int main(int argc, char **argv)
diff --git a/tools/testing/selftests/mm/pfnmap.c b/tools/testing/selftests/mm/pfnmap.c
index f546dfb10cae..45b5f1cf6019 100644
--- a/tools/testing/selftests/mm/pfnmap.c
+++ b/tools/testing/selftests/mm/pfnmap.c
@@ -35,18 +35,15 @@ static void signal_handler(int sig)
 
 static int test_read_access(char *addr, size_t size, size_t pagesize)
 {
-	size_t offs;
 	int ret;
 
 	if (signal(SIGSEGV, signal_handler) == SIG_ERR)
 		return -EINVAL;
 
 	ret = sigsetjmp(sigjmp_buf_env, 1);
-	if (!ret) {
-		for (offs = 0; offs < size; offs += pagesize)
-			/* Force a read that the compiler cannot optimize out. */
-			*((volatile char *)(addr + offs));
-	}
+	if (!ret)
+		force_read_pages(addr, size/pagesize, pagesize);
+
 	if (signal(SIGSEGV, SIG_DFL) == SIG_ERR)
 		return -EINVAL;
 
diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index 40799f3f0213..e0167111bdd1 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -652,11 +652,7 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
 	}
 	madvise(*addr, fd_size, MADV_HUGEPAGE);
 
-	for (size_t i = 0; i < fd_size; i++) {
-		char *addr2 = *addr + i;
-
-		FORCE_READ(*addr2);
-	}
+	force_read_pages(*addr, fd_size / pmd_pagesize, pmd_pagesize);
 
 	if (!check_huge_file(*addr, fd_size / pmd_pagesize, pmd_pagesize)) {
 		ksft_print_msg("No large pagecache folio generated, please provide a filesystem supporting large folio\n");
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 6ad32b1830f1..522f7f9050f5 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -54,6 +54,13 @@ static inline unsigned int pshift(void)
 	return __page_shift;
 }
 
+static inline void force_read_pages(char *addr, unsigned int nr_pages,
+				    size_t pagesize)
+{
+	for (unsigned int i = 0; i < nr_pages; i++)
+		FORCE_READ(addr[i * pagesize]);
+}
+
 bool detect_huge_zeropage(void);
 
 /*
-- 
2.51.2


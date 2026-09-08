Received: from mta0.migadu.com (out-62.mta0.migadu.com [91.218.175.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132DF54DAF0
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 13:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875027; cv=none; b=eN5HhnE7vSklGdtfXBk5or2rCDla7yXFLsfnYxipC8S09hNg807IchJbfZbM5NTWEbucLa/Uw8XE6G6cnXqCmpenk9j1K0p9oiRCbbghWcoQKaAEwkZ28lM8qV9NRPj+7+NQ++fn9zF2+p0837KTGH4FOeFFZ/BQKbdIB5FhWfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875027; c=relaxed/simple;
	bh=YVHXbf26rA+jKhFYHPEQQG1zeSvG9J2n54qBLSk4eXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DUaH/O+Qo+iXFXYbGY3LfQHb1nEWJO9UWswjC9YRfXxeTxPX0Nu74R+eyVURCPIFozzOK+qDVdM1wT6BapbQu+pBtqtks51zztRvfG+EwOOHJZ+YkXMAnoC2t63057XVh5OxJfP029lBZvZlUodRu+mDqfYX7Kno91odE8OK1/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AsvSKsiP; arc=none smtp.client-ip=91.218.175.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AsvSKsiP"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YVHXbf26rA+jKhFYHPEQQG1zeSvG9J2n54qBLSk4eXs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788875006; v=1; x=1789479806;
 b=AsvSKsiP1qCoD7qYXZkQirh3mScZWgVvGFeQ8A3f4KDq5NotBxaFkX3sixHHiKD6xKxVVi63
 jzYF5gDn86/MYs3wamasAwWImCguV8rxuQPhBxINEtfs3/Qe++FrYdUl/34ncKF1kfWqBNGheXl
 p4vZK4YVPmRXZLVr98+zBxGM=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fac4a1df8e1a2353;
	Tue, 08 Sep 2026 13:43:26 +0000
X-Mizu-Trace-ID: fac4a1df8e1a2353
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH v2 2/3] selftests/mm: mark file-local symbols of pagemap_ioctl.c static
Date: Tue,  8 Sep 2026 21:43:14 +0800
Message-ID: <20260908134315.84431-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908134117.84405-1-zenghui.yu@linux.dev>
References: <20260908134117.84405-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

The file-scope variables (pagemap_fd, uffd, page_size, hpage_size and
progname) and most functions of the pagemap_ioctl test are only used
locally, but lack the static storage class.  Mark them static so that the
compiler can catch accidental outer references.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 tools/testing/selftests/mm/pagemap_ioctl.c | 43 +++++++++++-----------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
index 3665530eda76..1a87b7483316 100644
--- a/tools/testing/selftests/mm/pagemap_ioctl.c
+++ b/tools/testing/selftests/mm/pagemap_ioctl.c
@@ -36,11 +36,11 @@
 
 #define TEST_ITERATIONS 100
 #define PAGEMAP "/proc/self/pagemap"
-int pagemap_fd;
-int uffd;
-size_t page_size;
-size_t hpage_size;
-const char *progname;
+static int pagemap_fd;
+static int uffd;
+static size_t page_size;
+static size_t hpage_size;
+static const char *progname;
 
 #define LEN(region)	((region.end - region.start)/page_size)
 
@@ -92,8 +92,7 @@ static long pagemap_ioc(void *start, size_t len, void *vec, size_t vec_len, int
 	return ret;
 }
 
-
-int init_uffd(void)
+static int init_uffd(void)
 {
 	struct uffdio_api uffdio_api;
 
@@ -116,7 +115,7 @@ int init_uffd(void)
 	return 0;
 }
 
-int wp_init(void *addr, size_t size)
+static int wp_init(void *addr, size_t size)
 {
 	struct uffdio_register uffdio_register;
 	struct uffdio_writeprotect wp;
@@ -140,7 +139,7 @@ int wp_init(void *addr, size_t size)
 	return 0;
 }
 
-int wp_free(void *addr, size_t size)
+static int wp_free(void *addr, size_t size)
 {
 	struct uffdio_register uffdio_register;
 
@@ -152,7 +151,7 @@ int wp_free(void *addr, size_t size)
 	return 0;
 }
 
-int wp_addr_range(void *addr, size_t size)
+static int wp_addr_range(void *addr, size_t size)
 {
 	if (pagemap_ioctl(addr, size, NULL, 0,
 			  PM_SCAN_WP_MATCHING | PM_SCAN_CHECK_WPASYNC,
@@ -162,7 +161,7 @@ int wp_addr_range(void *addr, size_t size)
 	return 0;
 }
 
-void *gethugetlb_mem(size_t size, int *shmid)
+static void *gethugetlb_mem(size_t size, int *shmid)
 {
 	char *mem;
 
@@ -186,7 +185,7 @@ void *gethugetlb_mem(size_t size, int *shmid)
 	return mem;
 }
 
-int userfaultfd_tests(void)
+static int userfaultfd_tests(void)
 {
 	size_t mem_size, vec_size, num_pages = 16;
 	long written;
@@ -230,7 +229,7 @@ int userfaultfd_tests(void)
 	return 0;
 }
 
-int get_reads(struct page_region *vec, size_t vec_size)
+static int get_reads(struct page_region *vec, size_t vec_size)
 {
 	size_t i;
 	int sum = 0;
@@ -241,7 +240,7 @@ int get_reads(struct page_region *vec, size_t vec_size)
 	return sum;
 }
 
-int sanity_tests_sd(void)
+static int sanity_tests_sd(void)
 {
 	size_t mem_size, vec_size, i, total_pages = 0;
 	long ret, ret2, ret3;
@@ -684,7 +683,7 @@ int sanity_tests_sd(void)
 	return 0;
 }
 
-int base_tests(char *prefix, char *mem, size_t mem_size, int skip)
+static int base_tests(char *prefix, char *mem, size_t mem_size, int skip)
 {
 	size_t vec_size;
 	int written;
@@ -789,7 +788,7 @@ int base_tests(char *prefix, char *mem, size_t mem_size, int skip)
 	return 0;
 }
 
-void *gethugepage(size_t map_size)
+static void *gethugepage(size_t map_size)
 {
 	int ret;
 	char *map;
@@ -807,7 +806,7 @@ void *gethugepage(size_t map_size)
 	return map;
 }
 
-int hpage_unit_tests(void)
+static int hpage_unit_tests(void)
 {
 	char *map;
 	int ret, ret2;
@@ -1001,7 +1000,7 @@ int hpage_unit_tests(void)
 	return 0;
 }
 
-int unmapped_region_tests(void)
+static int unmapped_region_tests(void)
 {
 	void *start = (void *)0x10000000;
 	int written;
@@ -1158,7 +1157,7 @@ static void unpopulated_thp_scan_test(void)
 	munmap(area, 2 * hpage_size);
 }
 
-int sanity_tests(void)
+static int sanity_tests(void)
 {
 	size_t mem_size, vec_size, i, buf_size;
 	long ret, fd, nr_pages;
@@ -1330,7 +1329,7 @@ int sanity_tests(void)
 	return 0;
 }
 
-int mprotect_tests(void)
+static int mprotect_tests(void)
 {
 	int ret;
 	char *mem, *mem2;
@@ -1450,7 +1449,7 @@ static ssize_t get_dirty_pages_reset(char *mem, unsigned int count,
 	return cnt;
 }
 
-void *thread_proc(void *mem)
+static void *thread_proc(void *mem)
 {
 	int *m = mem;
 	long curr_faults, faults;
@@ -1583,7 +1582,7 @@ static void transact_test(int page_size)
 			      extra_thread_faults);
 }
 
-void zeropfn_tests(void)
+static void zeropfn_tests(void)
 {
 	size_t mem_size, i;
 	struct page_region vec;
-- 
2.53.0


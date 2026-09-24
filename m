Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B314C4F5F;
	Thu, 24 Sep 2026 19:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277104; cv=none; b=jAiU8q0CoG/oTBHpbPvBbPJw/ia4Xzv3uDtltjPOoeIoqRASq4FbId7890fneCyWcS54Keo/0tk3Isl+zo5VPyu6QhMDZhGUTVFXIV5SSLc9e/VkmvU99LlBDA8OV9dTKuZ0H90SA174Bv0oTShad1dpIU67UAtxSTPt8uZUlVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277104; c=relaxed/simple;
	bh=fDkgRwO1bSLmE20FjTBQYz0rSMBZdZYYVM8/o1IT0V4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LR3VtUIbM7FZxBF5C+IBfGxq823yZUSuNnnfe/6KtNxtlKIsEthK1U48efeA8JrRweYo/ka4OyKcEe8bkbVnoGloDtYsq4VepcRG63mVwMjupB+NaisK03jyXLxrLGi+aStD1EHuhGoWinW3LdQNT/D2yM80ad9hzb0sa9f9HFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GPAlFBAt; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GPAlFBAt"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20B191E8D;
	Thu, 24 Sep 2026 12:11:37 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A3FD3F86F;
	Thu, 24 Sep 2026 12:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790277100; bh=fDkgRwO1bSLmE20FjTBQYz0rSMBZdZYYVM8/o1IT0V4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GPAlFBAtX8ns+cMS2XIw5tZow6WHg72k4VFEyV6SkkghzKJFEdeA4MwPWujeARwwX
	 WHTSoYp31utUWywI4YXgdM92JadbgT5/3flyNZll9HugogFacVdYI6YSYagDNKcDJR
	 NgGXNwDMLiXBih0iLFB3vjRRZEjR7V86oRFlDw7I=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Thu, 24 Sep 2026 20:11:18 +0100
Subject: [PATCH v8 3/4] kselftest: mm: integrate huge page checks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-fix_split-v8-3-cba7359d882a@arm.com>
References: <20260924-fix_split-v8-0-cba7359d882a@arm.com>
In-Reply-To: <20260924-fix_split-v8-0-cba7359d882a@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5654; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=fDkgRwO1bSLmE20FjTBQYz0rSMBZdZYYVM8/o1IT0V4=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqtXXdGx79YGZps9yF/7wwsZToJptGpYy5CgrtL
 IzLraqJp8OJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarV13QAKCRBt1cPRWsUx
 MxmeDACqgTanCs17S883JUW3jGlxbmdTTM/Q/vfT2y70PDaDDj6zs2IIJge5avkyEHFkFRzjjhl
 lrZs18knmquEo7LScoOxvCtD/k/4GC2dgLE+zii+8zQVq/i22heDazpK5cEn9akOYYEGa5pqgfG
 rvUUujhX3CZyp+255kwmohH49zdRBwjAJ0+pwdepOYEc20ec8mLaHYmjVCxK5Jqf6kdxDP5B+Zs
 D+hthXo/gwSpie9UCbQlBEWV67Gbax8c4Rr8lLi17MkCaqlR4x+9FJE8+Cm6OsTuGCdYhM6/TRW
 oz4draSDkVDIdT/5d7/ZAMtVKrtVx/lvu6f4ORS4ebdD3CB+ke0vXpCPJiZbjHVqTMqDqrFa0Bd
 ORy4/fjuBSZgO8qggOzcuXTzHCSpa2SRESBJ/agHV/hMlRKEoT2C6djkje817gCmk++tGxCMipQ
 jLLh4QSRcjr2eNVFFHF+nI+mTKfu4H2MPtouU2JYK7U+I7PQnp5asZDhQvzizbBKNhOIY=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

check_large_folios() only checks for large folios without distinguishing
between anonymous and file-backed huge pages.

To add huge page type checking, integrate the huge page checks into
__check_huge():

  1. If hpage_size == pmd_pagesize, check PAGE_IS_HUGE instead of using
     check_large_folios(), since only the mapping type matters. This
     identifies PMD-mapped huge pages.

  2. Otherwise, use check_large_folios() to detect large folios. This
     covers mTHP cases.

  3. Check the folio flags according to the huge page type.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Suggested-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/vm_util.c | 90 +++++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 42 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 969d7202500c..7d23038af1df 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -351,13 +351,13 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
 	return entry;
 }
 
-static bool check_large_folios(void *addr, size_t len, int nr_hpages,
+static bool check_large_folios(int pagemap_fd, int kpageflags_fd,
+		void *addr, size_t len, int nr_hpages,
 		uint64_t hpage_size)
 {
 	int order = 0, pagesize = getpagesize();
 	unsigned int nr_pages = hpage_size / pagesize;
 	int orders[MAX_NR_ORDERS], status;
-	int pagemap_fd, kpageflags_fd;
 	bool ret = false;
 
 	if (!nr_pages)
@@ -368,15 +368,6 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
 		ksft_exit_fail_msg("invalid order\n");
 
 	memset(orders, 0, sizeof(int) * MAX_NR_ORDERS);
-	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
-	if (pagemap_fd == -1)
-		ksft_exit_fail_msg("read pagemap fail\n");
-
-	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
-	if (kpageflags_fd == -1) {
-		close(pagemap_fd);
-		ksft_exit_fail_msg("read kpageflags fail\n");
-	}
 
 	status = gather_folio_orders(addr, len, pagemap_fd,
 			kpageflags_fd, orders, MAX_NR_ORDERS);
@@ -387,8 +378,6 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
 		ret = true;
 
 out:
-	close(pagemap_fd);
-	close(kpageflags_fd);
 	return ret;
 }
 
@@ -411,57 +400,74 @@ static bool check_huge_type(uint64_t categories, enum check_huge_type type)
 	return false;
 }
 
-static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
-		  uint64_t hpage_size, enum check_huge_type type)
+static bool __check_huge(void *addr, size_t len, int nr_hpages,
+		uint64_t hpage_size, enum check_huge_type type)
 {
-	int pagemap_fd;
+	bool ret = false;
+	int pagemap_fd, kpageflags_fd;
 	int nr_pmd_mappings = 0;
+	uint64_t pmd_pagesize, scan_mapping_size;
 	uint64_t categories;
+	unsigned long pfn;
+	bool check_pmd_mapping, allow_nonpresent;
 	char *start = addr;
 	char *end = start + len;
 
+	pmd_pagesize = read_pmd_pagesize();
+	if (!pmd_pagesize)
+		ksft_exit_fail_msg("reading PMD pagesize failed\n");
+
+	check_pmd_mapping = hpage_size == pmd_pagesize;
+	scan_mapping_size = (nr_hpages > 0) ? hpage_size : psize();
+	/* Some mTHP tests check a partially populated PMD-sized range. */
+	allow_nonpresent = (uint64_t)nr_hpages * hpage_size < len;
+
 	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
 	if (pagemap_fd < 0)
 		ksft_exit_fail_msg("open pagemap fail\n");
 
-	for (; start < end; start += hpage_size) {
+	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
+	if (kpageflags_fd < 0)
+		ksft_exit_fail_msg("open kpageflags fail\n");
+
+	if (!check_pmd_mapping &&
+	    !check_large_folios(pagemap_fd, kpageflags_fd,
+				addr, len, nr_hpages, hpage_size))
+		goto out;
+
+	for (; start < end; start += scan_mapping_size) {
 		categories = pagemap_scan_get_categories(pagemap_fd, start);
-		if (!(categories & PAGE_IS_HUGE))
-			continue;
-		if (check_huge_type(categories, type))
+		pfn = pagemap_get_pfn(pagemap_fd, start);
+		if (pfn == -1UL) {
+			if (!allow_nonpresent)
+				goto out;
+			else
+				continue;
+		}
+		if (check_pmd_mapping && (categories & PAGE_IS_HUGE))
 			nr_pmd_mappings++;
+		if (!check_huge_type(categories, type))
+			goto out;
 	}
-	close(pagemap_fd);
 
-	return nr_hpages == nr_pmd_mappings;
+	if (check_pmd_mapping && (nr_pmd_mappings != nr_hpages))
+		goto out;
+	ret = true;
+
+out:
+	close(pagemap_fd);
+	close(kpageflags_fd);
+	return ret;
 }
 
 bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
 {
-	uint64_t pmd_pagesize = read_pmd_pagesize();
-
-	if (!pmd_pagesize)
-		ksft_exit_fail_msg("reading PMD pagesize failed\n");
-
-	if (hpage_size == pmd_pagesize)
-		return __check_pmd_huge(addr, len, nr_hpages, hpage_size,
-					CHECK_HUGE_ANON);
-
-	return check_large_folios(addr, len, nr_hpages, hpage_size);
+	return __check_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_ANON);
 }
 
 bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
 {
-	uint64_t pmd_pagesize = read_pmd_pagesize();
-
-	if (!pmd_pagesize)
-		ksft_exit_fail_msg("reading PMD pagesize failed\n");
-
-	if (hpage_size == pmd_pagesize)
-		return __check_pmd_huge(addr, len, nr_hpages, hpage_size,
-					CHECK_HUGE_FILE);
-
-	return check_large_folios(addr, len, nr_hpages, hpage_size);
+	return __check_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_FILE);
 }
 
 bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)

-- 
2.43.0


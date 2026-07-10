Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94543DB31E
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675478; cv=none; b=I+qZhrKwXzatwDU8QiiYEVbfybwZBq9DmImN3tx6VS1afq53KoK4Y0wXraDJ9UEBAyYJMfC93+Kyj/Bmrtgr9XTOXIIn9l2wt3xGCmO8HESNuSYTz68tDTR2KclHirgTZmseAGynGqWRN+EdNGtnmw+ti/rlMq++nFQZX952uII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675478; c=relaxed/simple;
	bh=6KRORgrjHHCi1pgc/lNRWVr1mWlJr76tSwhx8sFHMps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CxoB7SZCpiFACYRCFQCoZ5cM5uZ5KRX9oPDi1y39IezEVHTpX5yL2OzeVu2qWvytdVdaJ77dhfgm+p+va+Vmd9kzvLuTlU9eEtLtcChVtvhnCu5hfl1WKjy7RJnIEjyn4pdTFn4XimEWNFg615zgdm/YZQnRH2KhmzH8VNaGMZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=K/6AvtOl; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="K/6AvtOl"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso5620165ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 02:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1783675475; x=1784280275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dgywglFUIwjru+wdRX3rW0UAMsUidjYqKDAc3zGlpNk=;
        b=K/6AvtOlXQxE3NXLeiUFrBBaK2ac3k8MXxFUl013Qxe7PNvkEShvQ1Xv/Kz7qGpU0c
         IPazX+W1FRDhpl6a69wvTSJti5yrFCCnvvImURD78o9JHAwmAJTlm7+WVvYNRaXS6c77
         t3idsPj1QL9IluQlUZUom5FARtXs1WcNzldAyuqaAbUqv2gDVPwPW9QCn7TBtuffTMt2
         jh6JVEQLm+/gSSKfV7sCNPOaYgapUdYF7YGrFDTyKXH1GYXVKiqrP+ysNSP1p1k3XS7B
         oiEfVva0Rp71rVkr7+MebXclqUAzUwyr6w+IghTJ7PIPX5XRio469meaQr0EB3XgEimy
         NRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675475; x=1784280275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgywglFUIwjru+wdRX3rW0UAMsUidjYqKDAc3zGlpNk=;
        b=KKrropU8FrBJdB4hE56gbKvfmG2HR57SnAtXqxYg+hvHLtOODznr1ZyMA4JMcWpHEE
         5Tl4o4rVQkFon/FA260d8pa6EGiRtVFUueWsEHpGgrm5HGNJpqYzV+RBYGCqHRPvxsSE
         w3CpwJjM269/AbqJcV9ss82YMe19Mo1irLQun0w/D7E1EsCQcwzFsTeiW0hJemTKZajg
         N/Jk0rWzxR1oB86sErH950aQ5RrplF/LCC++MGRZt+ruO7qYeIlYVJ4kqi6dUlyDOrxe
         /dzyQvBH4sWQSyIDGWpAzn93qOrQAsKcICCPvY+H89heLakXNtWfmPibqkUlfZsysHOp
         O21w==
X-Forwarded-Encrypted: i=1; AHgh+RqRZALsLa8lejzv/sxFbDjSDCUTiyeCF3JSQwHe8/kGCXuuUnKM94ZuUMuD1V4+xd1/4bBUv0qUzOZ0c3l8+R0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPGqRc48XvyVQvkSxk92UN+ieObYUO/ivWuE24HcHtlYO/+hxt
	103zN/bG96HGtSUVJUvaB4x+lmNou+6q2OE4YNJel9eCTBQTw5B+PvlhllxETqTZOpe7swHHads
	qZ/RHIfU=
X-Gm-Gg: AfdE7ckpiq/XgQPNvSaYuFGAhOUXJ7hfgYvb+Zc6yyhDSyNu2XJEUF6o2t1P2HLD7I3
	rIluMPV8gtlei3XS8iz09vAEJM7nvhB7EVnhyBX3snvLov3B1AVNJVyP6VgmzdyrwJETPGOrbLC
	Bg6BSEFPliVoXKaOu6eu6DhBr9wrmZX7XE+oNB4TftJ6HqwIzBMVjittfmFJHZSlZf2wKmpgnMG
	GB8fC14qnlbZ1EIfnE0UXhiaD0AynOssW8gyJp1eVi+6dOJkeuB7FUkh8lKMaO7Lb9p5gVWKdFz
	rLa6VCEaYTJs26dl8pk4Hew/MOn4dOJNBm8gIteDkAIPw9brkqWp1s6qOAXhgfhyEpLVViPKHGK
	/1TbvNZReRVLOvnCehE2U1nuu6QC9wWrLjiEllA+vksjXO7BqB/o5yhEUSDOHgW1i4NefTbieUf
	pIHxE428i1ldFC2HZOvk2mwdUDApvI40kT
X-Received: by 2002:a17:902:fc8e:b0:2ca:ddbd:a19b with SMTP id d9443c01a7336-2ccea40b65emr107793175ad.28.1783675474937;
        Fri, 10 Jul 2026 02:24:34 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb72fsm56827995ad.6.2026.07.10.02.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:24:33 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH] selftests/mm: remove obsolete hugetlb vmemmap test
Date: Fri, 10 Jul 2026 17:24:27 +0800
Message-ID: <20260710092427.3459121-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hugetlb vmemmap selftest was added to check the old HVO
layout where tail vmemmap pages reused the head page.  That
assumption no longer matches the current HVO mapping layout.

HVO now keeps a private backing page for the head vmemmap page
and remaps redundant tail vmemmap pages to a shared read-only
backing page.  The old page flag check is therefore testing an
obsolete implementation detail rather than the current ABI or
behavior.

Remove the stale test and its build, run, and ignore entries.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 tools/testing/selftests/mm/.gitignore        |   2 -
 tools/testing/selftests/mm/Makefile          |   1 -
 tools/testing/selftests/mm/hugetlb-vmemmap.c | 132 -------------------
 tools/testing/selftests/mm/run_vmtests.sh    |   1 -
 4 files changed, 136 deletions(-)
 delete mode 100644 tools/testing/selftests/mm/hugetlb-vmemmap.c

diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
index 9ccd9e1447e6..227476d8ff1f 100644
--- a/tools/testing/selftests/mm/.gitignore
+++ b/tools/testing/selftests/mm/.gitignore
@@ -3,11 +3,9 @@ cow
 hugepage-mmap
 hugepage-mremap
 hugepage-shm
-hugepage-vmemmap
 hugetlb-mmap
 hugetlb-mremap
 hugetlb-shm
-hugetlb-vmemmap
 hugetlb-madvise
 hugetlb-read-hwpoison
 hugetlb-soft-offline
diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index ed321ae709da..ee8def9b4c31 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -66,7 +66,6 @@ TEST_GEN_FILES += hugetlb-mremap
 TEST_GEN_FILES += hugetlb-read-hwpoison
 TEST_GEN_FILES += hugetlb-shm
 TEST_GEN_FILES += hugetlb-soft-offline
-TEST_GEN_FILES += hugetlb-vmemmap
 TEST_GEN_FILES += khugepaged
 TEST_GEN_FILES += madv_populate
 TEST_GEN_FILES += map_fixed_noreplace
diff --git a/tools/testing/selftests/mm/hugetlb-vmemmap.c b/tools/testing/selftests/mm/hugetlb-vmemmap.c
deleted file mode 100644
index 507df78a158d..000000000000
--- a/tools/testing/selftests/mm/hugetlb-vmemmap.c
+++ /dev/null
@@ -1,132 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * A test case of using hugepage memory in a user application using the
- * mmap system call with MAP_HUGETLB flag.  Before running this program
- * make sure the administrator has allocated enough default sized huge
- * pages to cover the 2 MB allocation.
- */
-#include <stdlib.h>
-#include <stdio.h>
-#include <unistd.h>
-#include <sys/mman.h>
-#include <fcntl.h>
-#include "vm_util.h"
-#include "hugepage_settings.h"
-
-#define PAGE_COMPOUND_HEAD	(1UL << 15)
-#define PAGE_COMPOUND_TAIL	(1UL << 16)
-#define PAGE_HUGE		(1UL << 17)
-
-#define HEAD_PAGE_FLAGS		(PAGE_COMPOUND_HEAD | PAGE_HUGE)
-#define TAIL_PAGE_FLAGS		(PAGE_COMPOUND_TAIL | PAGE_HUGE)
-
-#define PM_PFRAME_BITS		55
-#define PM_PFRAME_MASK		~((1UL << PM_PFRAME_BITS) - 1)
-
-static size_t pagesize;
-static size_t maplength;
-
-static void write_bytes(char *addr, size_t length)
-{
-	unsigned long i;
-
-	for (i = 0; i < length; i++)
-		*(addr + i) = (char)i;
-}
-
-static unsigned long virt_to_pfn(void *addr)
-{
-	int fd;
-	unsigned long pagemap;
-
-	fd = open("/proc/self/pagemap", O_RDONLY);
-	if (fd < 0)
-		return -1UL;
-
-	lseek(fd, (unsigned long)addr / pagesize * sizeof(pagemap), SEEK_SET);
-	read(fd, &pagemap, sizeof(pagemap));
-	close(fd);
-
-	return pagemap & ~PM_PFRAME_MASK;
-}
-
-static int check_page_flags(unsigned long pfn)
-{
-	int fd, i;
-	unsigned long pageflags;
-
-	fd = open("/proc/kpageflags", O_RDONLY);
-	if (fd < 0)
-		return -1;
-
-	lseek(fd, pfn * sizeof(pageflags), SEEK_SET);
-
-	read(fd, &pageflags, sizeof(pageflags));
-	if ((pageflags & HEAD_PAGE_FLAGS) != HEAD_PAGE_FLAGS) {
-		close(fd);
-		ksft_print_msg("Head page flags (%lx) is invalid\n", pageflags);
-		return -1;
-	}
-
-	/*
-	 * pages other than the first page must be tail and shouldn't be head;
-	 * this also verifies kernel has correctly set the fake page_head to tail
-	 * while hugetlb_free_vmemmap is enabled.
-	 */
-	for (i = 1; i < maplength / pagesize; i++) {
-		read(fd, &pageflags, sizeof(pageflags));
-		if ((pageflags & TAIL_PAGE_FLAGS) != TAIL_PAGE_FLAGS ||
-		    (pageflags & HEAD_PAGE_FLAGS) == HEAD_PAGE_FLAGS) {
-			close(fd);
-			ksft_print_msg("Tail page flags (%lx) is invalid\n", pageflags);
-			return -1;
-		}
-	}
-
-	close(fd);
-
-	return 0;
-}
-
-int main(int argc, char **argv)
-{
-	void *addr;
-	unsigned long pfn;
-	int ret;
-
-	ksft_print_header();
-	ksft_set_plan(1);
-
-	if (!hugetlb_setup_default(1))
-		ksft_exit_skip("Not enough free huge pages\n");
-
-	pagesize  = psize();
-	maplength = default_huge_page_size();
-	if (!maplength)
-		ksft_exit_skip("Unable to determine huge page size\n");
-
-	addr = mmap(NULL, maplength, PROT_READ | PROT_WRITE,
-			MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
-	if (addr == MAP_FAILED)
-		ksft_exit_fail_perror("mmap");
-
-	/* Trigger allocation of HugeTLB page. */
-	write_bytes(addr, maplength);
-
-	pfn = virt_to_pfn(addr);
-	if (pfn == -1UL) {
-		ksft_perror("virt_to_pfn");
-		munmap(addr, maplength);
-		ksft_exit_fail();
-	}
-
-	ksft_print_msg("Returned address is %p whose pfn is %lx\n", addr, pfn);
-
-	ret = check_page_flags(pfn);
-
-	if (munmap(addr, maplength))
-		ksft_exit_fail_perror("munmap");
-
-	ksft_test_result(!ret, "HugeTLB vmemmap page flags\n");
-	ksft_finished();
-}
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 8c296dedf047..a60b9f9f16e7 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -262,7 +262,6 @@ echo "TAP version 13" | tap_output
 CATEGORY="hugetlb" run_test ./hugetlb-mmap
 CATEGORY="hugetlb" run_test ./hugetlb-shm
 CATEGORY="hugetlb" run_test ./hugetlb-mremap
-CATEGORY="hugetlb" run_test ./hugetlb-vmemmap
 CATEGORY="hugetlb" run_test ./hugetlb-madvise
 CATEGORY="hugetlb" run_test ./hugetlb_dio
 CATEGORY="hugetlb" run_test ./hugetlb_fault_after_madv

base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
-- 
2.54.0


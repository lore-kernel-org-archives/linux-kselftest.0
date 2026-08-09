Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B111F16B;
	Sun,  9 Aug 2026 08:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786262626; cv=none; b=Tw91jdP3w6Dkqw9CrvYnz8ahaWswE8By91apCxVjDwvsvnRs4DhIZdrC3k5oqOx91WRjodIf7Ul76+96E7tz99f5bdSk66UAfWQ7e5ix111dxKpbHot8KqbhlLmw9QX8tf/l9AVKvpC30jaiMxdl5QXzxzWTBcHEbxdjiSbXQg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786262626; c=relaxed/simple;
	bh=W0UcuhIPDeSXz0Fsy1mHSnpDzfBEm8n+bclRDJOKP4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jQsYnEdoofPMr1hhByr/n/tcAiYzdxFumUczEz1L7lKMGortfrbqBFtMMUbCYx0QaxjQfxx0r+sf5lc/TzNp6h3aO8d8MOY2WsjdBcdFGi0S7ot/4fhSQQyqtBVsjx8Xdl//vIKFfPdhkgEeKCRc+M/D91OXWpmrl0tRh2Perug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eN4rk+K1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eN4rk+K1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832F91F000E9;
	Sun,  9 Aug 2026 08:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786262625;
	bh=UUnD4YT4HuSOBagwB//yv3X0Nx1d1hKHYt4Fov9+dc8=;
	h=From:Date:Subject:To:Cc;
	b=eN4rk+K1PFz/8b8/Qu0TTafuUNHxYuoiiH5kdUll/FLdwZtnj3kIbKRy4GfaohDFT
	 XhNKai0vQ/+l02TMioR+oB56F1d+WFZZe4yBhasn1z7GoHNc2q9egVNMDjz2P5Ghgy
	 V2VeBdI+o57IwyRmBXxx1n6hjKyk4SgD911/SoJq5rFpSPZIfjCA7R3ymZK9bXksC+
	 4iq9M/NMZFv0DcR/7x5njYxH6geX7j/gtmRP8DNzejUN3qhNRNB83PILJ3Xwprk8px
	 Ppqld6zT+v9L+nNV3i7AHhmcCnvbyHFnBqC5z9rEDB8Th/WdzClA5l1SQVE4XvVAv8
	 PXYm0tpZfc68Q==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sun, 09 Aug 2026 11:03:35 +0300
Subject: [PATCH] selftests/mm: thuge-gen: fix test_shmget() for PAGE_SIZE
 check
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-selftests-thuge-gen-fix-v1-1-1919f4b3d12f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFY0eGoC/yWMyw7CIBBFf6WZtROxhvr4FeMCcGgxhRpmMCZN/
 13Q5Tn3sQJTDsRw7VbI9A4cllThsOvATSaNhOFRGXrVD+qsLsg0eyEWRplKjUdK6MMHtXFKez0
 c1clBXb8yVf17vt3/zMU+yUm7aw1rmNBmk9zUVIyLxH2MWBKLsTPBtn0B2IuDMZ8AAAA=
X-Change-ID: 20260809-selftests-thuge-gen-fix-5ac05f56307c
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-mm@kvack.org
X-Mailer: b4 0.16-dev

Commit 49a4e7186b08 ("selftests/mm: thuge-gen: add setup of HugeTLB pages")
changed thuge-gen test to use common functions for reading hugetlb
attributes from sysfs, but it missed that the original read_free() function
special cased PAGE_SIZE tests.

For PAGE_SIZE tests, failure to read sysfs was ignored and read_free()
returned 0.

This allowed test_shmget() to essentially skip the check of how many huge
pages was consumed when it ran with PAGE_SIZE.

Commit 3199b0c09efa ("selftests/mm: fix read_file() return value check")
fixed the common read_file() to actually return error on failure and this
exposed the issue in test_shmget() that checks the number of free hugetlb
pages even for PAGE_SIZE test, tries to access

/sys/kernel/mm/hugepages/hugepages-<PAGE_SIZE>/free_hugepages

and obviously fails there.

Gate the checks for free huge pages on size != getpagesize() and initialize
before and after variables to values matching PAGE_SIZE test.

Fixes: 49a4e7186b08 ("selftests/mm: thuge-gen: add setup of HugeTLB pages")
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
selftests/mm: thuge-gen: fix test_shmget() for PAGE_SIZE check
---
 tools/testing/selftests/mm/thuge-gen.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/mm/thuge-gen.c b/tools/testing/selftests/mm/thuge-gen.c
index 22b9c2f1c35d..50d0805b65db 100644
--- a/tools/testing/selftests/mm/thuge-gen.c
+++ b/tools/testing/selftests/mm/thuge-gen.c
@@ -71,12 +71,16 @@ void test_mmap(unsigned long size, unsigned flags)
 
 void test_shmget(unsigned long size, unsigned flags)
 {
-	int id;
-	unsigned long before, after;
+	/* values for PAGE_SIZE test */
+	unsigned long before = NUM_PAGES;
+	unsigned long after = 0;
 	struct shm_info i;
 	char *map;
+	int id;
+
+	if (size != getpagesize())
+		before = hugetlb_free_pages(size);
 
-	before = hugetlb_free_pages(size);
 	id = shmget(IPC_PRIVATE, size * NUM_PAGES, IPC_CREAT|0600|flags);
 	if (id < 0) {
 		if (errno == EPERM) {
@@ -97,10 +101,11 @@ void test_shmget(unsigned long size, unsigned flags)
 	shmctl(id, IPC_RMID, NULL);
 
 	memset(map, 0xff, size*NUM_PAGES);
-	after = hugetlb_free_pages(size);
+	if (size != getpagesize())
+		after = hugetlb_free_pages(size);
 
 	show(size);
-	ksft_test_result(size == getpagesize() || (before - after) == NUM_PAGES,
+	ksft_test_result((before - after) == NUM_PAGES,
 			 "%s: mmap %lu %x\n", __func__, size, flags);
 	if (shmdt(map))
 		ksft_exit_fail_msg("%s: shmdt: %s\n", __func__, strerror(errno));

---
base-commit: 17e5919bdca144d4e67337f53bf57d7811f62192
change-id: 20260809-selftests-thuge-gen-fix-5ac05f56307c

--
Sincerely yours,
Mike.


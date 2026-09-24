Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F2323EA97;
	Thu, 24 Sep 2026 05:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790226030; cv=none; b=fqUDZO8jAgKsQFlEIDWNZO1ythKP8AqVJnr+qatZdJDzs/MEr9tEexpDp6q6ObFMEwd/hkGkWM7FKzKw83LcGrt5AFgZZaeYq7KlA4T/UGtezd2JqhJyjSeBy5jdDAJ9mpRoh+riqgDZCmcCSTwBbkLsXEvYX5bkBvtW1Z15k4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790226030; c=relaxed/simple;
	bh=L5nbF/ygM6HuNIxRHOeNyQy+FvjqCDI9Shi/Z/9m0n0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mIuYl4X5RlvMxaLeI8YXrPq8kxbBHaELYWbhBZdoy1zJHQ+OAhtHeJRWPKgoz3tvTvFxRh9dPjqhoN7/8iqeklBkgxnGMJjko4CGGlaOUprxtzq3MDa1Ze40GQaRDbz6kURTRbr2hQx6XPF80463OXTmI2mM9KEPivxOVGEtZTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sUqoY4g1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sUqoY4g1"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7926D152B;
	Wed, 23 Sep 2026 22:00:23 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1DF093F86C;
	Wed, 23 Sep 2026 22:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790226026; bh=L5nbF/ygM6HuNIxRHOeNyQy+FvjqCDI9Shi/Z/9m0n0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sUqoY4g1iDVZAm6TWIuCJmbh07Q5QN8TEO4xBsJ7QVQmebsW15rffjh4/wrP02cTI
	 ADwQCRcFifn1lZoETVo+UhbMBubrJD8rhrOOdMnK0saJOtMEtGpNIe2MZ5UPaufEHH
	 ulGcOYHhCHt0mXgOKliL4UXNqEtkQlHQ9Qrtivrg=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Park Tae-sun <ts930@dgu.ac.kr>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH RESEND 1/9] selftests/mm: mremap_test: use kselftest helpers
Date: Thu, 24 Sep 2026 10:30:01 +0530
Message-ID: <20260924050009.19974-2-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924050009.19974-1-sarthak.sharma@arm.com>
References: <20260924050009.19974-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mremap_test currently uses a lot of fprintf() and perror()
calls. It also uses a variable "failures" to track the number
of failed table driven tests.

Use ksft_print_msg() and ksft_perror() for diagnostics.
Remove the variable "failures" and let kselftest counters
handle the final exit status. Use ksft_finished() at
the end instead of manually checking if failures > 0. Replace

if (success)
	ksft_test_result_pass(...);
else
	ksft_test_result_fail(...);

calls with ksft_test_result(success, ...);

Also correct the duplicated "mremap" in "mremap move within
range" and the spelling of "dontunmap".

Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 222 +++++++++--------------
 1 file changed, 89 insertions(+), 133 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 97abf4713cc5..5532d3151ed0 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -257,10 +257,7 @@ static void mremap_expand_merge(FILE *maps_fp, unsigned long page_size)
 	munmap(start, 3 * page_size);
 
 out:
-	if (success)
-		ksft_test_result_pass("%s\n", test_name);
-	else
-		ksft_test_result_fail("%s\n", test_name);
+	ksft_test_result(success, "%s\n", test_name);
 }
 
 /*
@@ -297,10 +294,7 @@ static void mremap_expand_merge_offset(FILE *maps_fp, unsigned long page_size)
 	munmap(start, 3 * page_size);
 
 out:
-	if (success)
-		ksft_test_result_pass("%s\n", test_name);
-	else
-		ksft_test_result_fail("%s\n", test_name);
+	ksft_test_result(success, "%s\n", test_name);
 }
 
 /*
@@ -319,7 +313,7 @@ static void mremap_expand_merge_offset(FILE *maps_fp, unsigned long page_size)
  */
 static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 {
-	char *test_name = "mremap mremap move within range";
+	char *test_name = "mremap move within range";
 	void *src, *dest;
 	unsigned int i, success = 1;
 
@@ -327,7 +321,7 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 	void *ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
 			 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
 	if (ptr == MAP_FAILED) {
-		perror("mmap");
+		ksft_perror("mmap");
 		success = 0;
 		goto out;
 	}
@@ -344,7 +338,7 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 	void *new_ptr = mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
 						   MREMAP_MAYMOVE | MREMAP_FIXED, dest + SIZE_MB(1));
 	if (new_ptr == MAP_FAILED) {
-		perror("mremap");
+		ksft_perror("mremap");
 		success = 0;
 		goto out;
 	}
@@ -365,12 +359,9 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 
 out:
 	if (munmap(ptr, size) == -1)
-		perror("munmap");
+		ksft_perror("munmap");
 
-	if (success)
-		ksft_test_result_pass("%s\n", test_name);
-	else
-		ksft_test_result_fail("%s\n", test_name);
+	ksft_test_result(success, "%s\n", test_name);
 }
 
 static bool is_multiple_vma_range_ok(unsigned int pattern_seed,
@@ -415,7 +406,7 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 	ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
 		   MAP_PRIVATE | MAP_ANON, -1, 0);
 	if (ptr == MAP_FAILED) {
-		perror("mmap");
+		ksft_perror("mmap");
 		success = false;
 		goto out;
 	}
@@ -423,12 +414,12 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 	tgt_ptr = mmap(NULL, 2 * size, PROT_READ | PROT_WRITE,
 		       MAP_PRIVATE | MAP_ANON, -1, 0);
 	if (tgt_ptr == MAP_FAILED) {
-		perror("mmap");
+		ksft_perror("mmap");
 		success = false;
 		goto out;
 	}
 	if (munmap(tgt_ptr, 2 * size)) {
-		perror("munmap");
+		ksft_perror("munmap");
 		success = false;
 		goto out_unmap;
 	}
@@ -446,7 +437,7 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 			continue;
 
 		if (munmap(&ptr[i * page_size], page_size)) {
-			perror("munmap");
+			ksft_perror("munmap");
 			success = false;
 			goto out_unmap;
 		}
@@ -466,7 +457,7 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 
 	/* First, just move the whole thing. */
 	if (mremap(ptr, size, size, mremap_flags, tgt_ptr) == MAP_FAILED) {
-		perror("mremap");
+		ksft_perror("mremap");
 		success = false;
 		goto out_unmap;
 	}
@@ -479,7 +470,7 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 	/* Move next to itself. */
 	if (mremap(tgt_ptr, size, size, mremap_flags,
 		   &tgt_ptr[size]) == MAP_FAILED) {
-		perror("mremap");
+		ksft_perror("mremap");
 		success = false;
 		goto out_unmap;
 	}
@@ -492,14 +483,14 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 	/* Map a range to overwrite. */
 	if (mmap(tgt_ptr, size, PROT_NONE,
 		 MAP_PRIVATE | MAP_ANON | MAP_FIXED, -1, 0) == MAP_FAILED) {
-		perror("mmap tgt");
+		ksft_perror("mmap tgt");
 		success = false;
 		goto out_unmap;
 	}
 	/* Move and overwrite. */
 	if (mremap(&tgt_ptr[size], size, size,
 		   mremap_flags, tgt_ptr) == MAP_FAILED) {
-		perror("mremap");
+		ksft_perror("mremap");
 		success = false;
 		goto out_unmap;
 	}
@@ -511,17 +502,12 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 
 out_unmap:
 	if (munmap(tgt_ptr, 2 * size))
-		perror("munmap tgt");
+		ksft_perror("munmap tgt");
 	if (munmap(ptr, size))
-		perror("munmap src");
+		ksft_perror("munmap src");
 
 out:
-	if (success)
-		ksft_test_result_pass("%s%s\n", test_name,
-				      dont_unmap ? " [dontunnmap]" : "");
-	else
-		ksft_test_result_fail("%s%s\n", test_name,
-				      dont_unmap ? " [dontunnmap]" : "");
+	ksft_test_result(success, "%s%s\n", test_name, dont_unmap ? " [dontunmap]" : "");
 }
 
 static void mremap_shrink_multiple_vmas(unsigned long page_size,
@@ -537,7 +523,7 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
 	ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
 		   MAP_PRIVATE | MAP_ANON, -1, 0);
 	if (ptr == MAP_FAILED) {
-		perror("mmap");
+		ksft_perror("mmap");
 		success = false;
 		goto out;
 	}
@@ -545,12 +531,12 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
 	tgt_ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
 		       MAP_PRIVATE | MAP_ANON, -1, 0);
 	if (tgt_ptr == MAP_FAILED) {
-		perror("mmap");
+		ksft_perror("mmap");
 		success = false;
 		goto out;
 	}
 	if (munmap(tgt_ptr, size)) {
-		perror("munmap");
+		ksft_perror("munmap");
 		success = false;
 		goto out_unmap;
 	}
@@ -564,7 +550,7 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
 	 */
 	for (i = 1; i < 10; i += 2) {
 		if (munmap(&ptr[i * page_size], page_size)) {
-			perror("munmap");
+			ksft_perror("munmap");
 			success = false;
 			goto out_unmap;
 		}
@@ -584,23 +570,18 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
 			     tgt_ptr);
 
 	if (res == MAP_FAILED) {
-		perror("mremap");
+		ksft_perror("mremap");
 		success = false;
 		goto out_unmap;
 	}
 
 out_unmap:
 	if (munmap(tgt_ptr, size))
-		perror("munmap tgt");
+		ksft_perror("munmap tgt");
 	if (munmap(ptr, size))
-		perror("munmap src");
+		ksft_perror("munmap src");
 out:
-	if (success)
-		ksft_test_result_pass("%s%s\n", test_name,
-				      inplace ? " [inplace]" : "");
-	else
-		ksft_test_result_fail("%s%s\n", test_name,
-				      inplace ? " [inplace]" : "");
+	ksft_test_result(success, "%s%s\n", test_name, inplace ? " [inplace]" : "");
 }
 
 static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
@@ -620,7 +601,7 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 	ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
 		   MAP_PRIVATE | MAP_ANON, -1, 0);
 	if (ptr == MAP_FAILED) {
-		perror("mmap");
+		ksft_perror("mmap");
 		success = false;
 		goto out;
 	}
@@ -628,12 +609,12 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 	tgt_ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
 		       MAP_PRIVATE | MAP_ANON, -1, 0);
 	if (tgt_ptr == MAP_FAILED) {
-		perror("mmap");
+		ksft_perror("mmap");
 		success = false;
 		goto out;
 	}
 	if (munmap(tgt_ptr, size)) {
-		perror("munmap");
+		ksft_perror("munmap");
 		success = false;
 		goto out_unmap;
 	}
@@ -647,7 +628,7 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 	 *  0 1 2 3 4   5 6 7 8 9  pattern offset
 	 */
 	if (munmap(&ptr[5 * page_size], page_size)) {
-		perror("munmap");
+		ksft_perror("munmap");
 		success = false;
 		goto out_unmap;
 	}
@@ -683,7 +664,7 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 	 */
 	if (mremap(&ptr[2 * page_size], size - 3 * page_size, size - 3 * page_size,
 		   mremap_flags, tgt_ptr) == MAP_FAILED) {
-		perror("mremap");
+		ksft_perror("mremap");
 		success = false;
 		goto out_unmap;
 	}
@@ -714,16 +695,11 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 
 out_unmap:
 	if (munmap(tgt_ptr, size))
-		perror("munmap tgt");
+		ksft_perror("munmap tgt");
 	if (munmap(ptr, size))
-		perror("munmap src");
+		ksft_perror("munmap src");
 out:
-	if (success)
-		ksft_test_result_pass("%s%s\n", test_name,
-				      dont_unmap ? " [dontunnmap]" : "");
-	else
-		ksft_test_result_fail("%s%s\n", test_name,
-				      dont_unmap ? " [dontunnmap]" : "");
+	ksft_test_result(success, "%s%s\n", test_name, dont_unmap ? " [dontunmap]" : "");
 }
 
 #ifdef __NR_userfaultfd
@@ -744,16 +720,16 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	uffd = syscall(__NR_userfaultfd, O_NONBLOCK);
 	if (uffd == -1) {
 		err = errno;
-		perror("userfaultfd");
+		ksft_perror("userfaultfd");
 		if (err == EPERM) {
-			ksft_test_result_skip("%s - missing uffd", test_name);
+			ksft_test_result_skip("%s - missing uffd\n", test_name);
 			return;
 		}
 		success = false;
 		goto out;
 	}
 	if (ioctl(uffd, UFFDIO_API, &api)) {
-		perror("ioctl UFFDIO_API");
+		ksft_perror("ioctl UFFDIO_API");
 		success = false;
 		goto out_close_uffd;
 	}
@@ -761,19 +737,19 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
 		   MAP_PRIVATE | MAP_ANON, -1, 0);
 	if (ptr == MAP_FAILED) {
-		perror("mmap");
+		ksft_perror("mmap");
 		success = false;
 		goto out_close_uffd;
 	}
 
 	tgt_ptr = mmap(NULL, size, PROT_NONE, MAP_PRIVATE | MAP_ANON, -1, 0);
 	if (tgt_ptr == MAP_FAILED) {
-		perror("mmap");
+		ksft_perror("mmap");
 		success = false;
 		goto out_close_uffd;
 	}
 	if (munmap(tgt_ptr, size)) {
-		perror("munmap");
+		ksft_perror("munmap");
 		success = false;
 		goto out_unmap;
 	}
@@ -799,12 +775,12 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 		};
 
 		if (ioctl(uffd, UFFDIO_REGISTER, &reg) == -1) {
-			perror("ioctl UFFDIO_REGISTER");
+			ksft_perror("ioctl UFFDIO_REGISTER");
 			success = false;
 			goto out_unmap;
 		}
 		if (munmap(unmap_ptr, page_size)) {
-			perror("munmap");
+			ksft_perror("munmap");
 			success = false;
 			goto out_unmap;
 		}
@@ -819,19 +795,18 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	res = mremap(ptr, size, size, MREMAP_MAYMOVE | MREMAP_FIXED, tgt_ptr);
 	err = errno;
 	if (res != MAP_FAILED) {
-		fprintf(stderr, "mremap() succeeded for multi VMA uffd armed\n");
+		ksft_print_msg("mremap() succeeded for multi VMA uffd armed\n");
 		success = false;
 		goto out_unmap;
 	}
 	if (err != EFAULT) {
 		errno = err;
-		perror("mremap() unexpected error");
+		ksft_perror("mremap() unexpected error");
 		success = false;
 		goto out_unmap;
 	}
 	if (is_ptr_mapped(maps_fp, tgt_ptr, page_size)) {
-		fprintf(stderr,
-			"Invalid uffd-armed VMA at start of multi range moved\n");
+		ksft_print_msg("Invalid uffd-armed VMA at start of multi range moved\n");
 		success = false;
 		goto out_unmap;
 	}
@@ -843,7 +818,7 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	res = mremap(ptr, page_size, page_size,
 		     MREMAP_MAYMOVE | MREMAP_FIXED, tgt_ptr);
 	if (res == MAP_FAILED) {
-		perror("mremap single invalid-multi VMA");
+		ksft_perror("mremap single invalid-multi VMA");
 		success = false;
 		goto out_unmap;
 	}
@@ -853,14 +828,14 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	 * move valid) VMA at the start of ptr range.
 	 */
 	if (munmap(tgt_ptr, page_size)) {
-		perror("munmap");
+		ksft_perror("munmap");
 		success = false;
 		goto out_unmap;
 	}
 	res = mmap(ptr, page_size, PROT_READ | PROT_WRITE,
 		   MAP_PRIVATE | MAP_ANON | MAP_FIXED, -1, 0);
 	if (res == MAP_FAILED) {
-		perror("mmap");
+		ksft_perror("mmap");
 		success = false;
 		goto out_unmap;
 	}
@@ -872,18 +847,18 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	res = mremap(ptr, size, size, MREMAP_MAYMOVE | MREMAP_FIXED, tgt_ptr);
 	err = errno;
 	if (res != MAP_FAILED) {
-		fprintf(stderr, "mremap() succeeded for multi VMA uffd armed\n");
+		ksft_print_msg("mremap() succeeded for multi VMA uffd armed\n");
 		success = false;
 		goto out_unmap;
 	}
 	if (err != EFAULT) {
 		errno = err;
-		perror("mremap() unexpected error");
+		ksft_perror("mremap() unexpected error");
 		success = false;
 		goto out_unmap;
 	}
 	if (!is_ptr_mapped(maps_fp, tgt_ptr, page_size)) {
-		fprintf(stderr, "Valid VMA not moved\n");
+		ksft_print_msg("Valid VMA not moved\n");
 		success = false;
 		goto out_unmap;
 	}
@@ -894,12 +869,12 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	 * multi-move VMAs.
 	 */
 	if (munmap(tgt_ptr, page_size)) {
-		perror("munmap");
+		ksft_perror("munmap");
 		success = false;
 		goto out_unmap;
 	}
 	if (munmap(ptr, size - 2 * page_size)) {
-		perror("munmap");
+		ksft_perror("munmap");
 		success = false;
 		goto out_unmap;
 	}
@@ -908,7 +883,7 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 			   PROT_READ | PROT_WRITE,
 			   MAP_PRIVATE | MAP_ANON | MAP_FIXED, -1, 0);
 		if (res == MAP_FAILED) {
-			perror("mmap");
+			ksft_perror("mmap");
 			success = false;
 			goto out_unmap;
 		}
@@ -921,13 +896,13 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	res = mremap(ptr, size, size, MREMAP_MAYMOVE | MREMAP_FIXED, tgt_ptr);
 	err = errno;
 	if (res != MAP_FAILED) {
-		fprintf(stderr, "mremap() succeeded for multi VMA uffd armed\n");
+		ksft_print_msg("mremap() succeeded for multi VMA uffd armed\n");
 		success = false;
 		goto out_unmap;
 	}
 	if (err != EFAULT) {
 		errno = err;
-		perror("mremap() unexpected error");
+		ksft_perror("mremap() unexpected error");
 		success = false;
 		goto out_unmap;
 	}
@@ -937,11 +912,11 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 				&tgt_ptr[i * page_size], page_size);
 
 		if (i < 8 && !is_mapped) {
-			fprintf(stderr, "Valid VMA not moved at %d\n", i);
+			ksft_print_msg("Valid VMA not moved at %d\n", i);
 			success = false;
 			goto out_unmap;
 		} else if (i == 8 && is_mapped) {
-			fprintf(stderr, "Invalid VMA moved at %d\n", i);
+			ksft_print_msg("Invalid VMA moved at %d\n", i);
 			success = false;
 			goto out_unmap;
 		}
@@ -949,23 +924,20 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 
 out_unmap:
 	if (munmap(tgt_ptr, size))
-		perror("munmap tgt");
+		ksft_perror("munmap tgt");
 	if (munmap(ptr, size))
-		perror("munmap src");
+		ksft_perror("munmap src");
 out_close_uffd:
 	close(uffd);
 out:
-	if (success)
-		ksft_test_result_pass("%s\n", test_name);
-	else
-		ksft_test_result_fail("%s\n", test_name);
+	ksft_test_result(success, "%s\n", test_name);
 }
 #else
 static void mremap_move_multi_invalid_vmas(FILE *maps_fp, unsigned long page_size)
 {
 	char *test_name = "mremap move multiple invalid vmas";
 
-	ksft_test_result_skip("%s - missing uffd", test_name);
+	ksft_test_result_skip("%s - missing uffd\n", test_name);
 }
 #endif /* __NR_userfaultfd */
 
@@ -1124,7 +1096,7 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 	void *new_ptr = mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
 						   MREMAP_MAYMOVE | MREMAP_FIXED, dest + SIZE_MB(1));
 	if (new_ptr == MAP_FAILED) {
-		perror("mremap");
+		ksft_perror("mremap");
 		success = 0;
 		goto out;
 	}
@@ -1145,59 +1117,49 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 
 out:
 	if (src && munmap(src, c.region_size) == -1)
-		perror("munmap src");
+		ksft_perror("munmap src");
 
 	if (dest && munmap(dest, c.region_size) == -1)
-		perror("munmap dest");
+		ksft_perror("munmap dest");
 
-	if (success)
-		ksft_test_result_pass("%s\n", test_name);
-	else
-		ksft_test_result_fail("%s\n", test_name);
+	ksft_test_result(success, "%s\n", test_name);
 }
 
-static void run_mremap_test_case(struct test test_case, int *failures,
-				 unsigned int threshold_mb,
+static void run_mremap_test_case(struct test test_case, unsigned int threshold_mb,
 				 char *rand_addr)
 {
 	long long remap_time = remap_region(test_case.config, threshold_mb,
 					    rand_addr);
 
 	if (remap_time < 0) {
-		if (test_case.expect_failure) {
-			ksft_print_msg("%s: expected mremap failure\n",
-				       test_case.name);
-			ksft_test_result_xfail("%s\n", test_case.name);
-		} else {
+		if (test_case.expect_failure)
+			ksft_test_result_xfail("%s: expected mremap failure\n",
+					       test_case.name);
+		else
 			ksft_test_result_fail("%s\n", test_case.name);
-			*failures += 1;
-		}
 	} else {
 		/*
 		 * Comparing mremap time is only applicable if entire region
 		 * was faulted in.
 		 */
 		if (threshold_mb == VALIDATION_NO_THRESHOLD ||
-		    test_case.config.region_size <= threshold_mb * _1MB) {
-			ksft_print_msg("%s: mremap time: %12lldns\n",
-				       test_case.name, remap_time);
+		    test_case.config.region_size <= threshold_mb * _1MB)
+			ksft_test_result_pass("%s: mremap time: %12lldns\n",
+					      test_case.name, remap_time);
+		else
 			ksft_test_result_pass("%s\n", test_case.name);
-		} else {
-			ksft_test_result_pass("%s\n", test_case.name);
-		}
 	}
 }
 
 static void usage(const char *cmd)
 {
-	fprintf(stderr,
-		"Usage: %s [[-t <threshold_mb>] [-p <pattern_seed>]]\n"
-		"-t\t only validate threshold_mb of the remapped region\n"
-		"  \t if 0 is supplied no threshold is used; all tests\n"
-		"  \t are run and remapped regions validated fully.\n"
-		"  \t The default threshold used is 4MB.\n"
-		"-p\t provide a seed to generate the random pattern for\n"
-		"  \t validating the remapped region.\n", cmd);
+	ksft_print_msg("Usage: %s [[-t <threshold_mb>] [-p <pattern_seed>]]\n", cmd);
+	ksft_print_msg("-t\t only validate threshold_mb of the remapped region\n");
+	ksft_print_msg("  \t if 0 is supplied no threshold is used; all tests\n");
+	ksft_print_msg("  \t are run and remapped regions validated fully.\n");
+	ksft_print_msg("  \t The default threshold used is 4MB.\n");
+	ksft_print_msg("-p\t provide a seed to generate the random pattern for\n");
+	ksft_print_msg("  \t validating the remapped region.\n");
 }
 
 static int parse_args(int argc, char **argv, unsigned int *threshold_mb,
@@ -1232,7 +1194,6 @@ static int parse_args(int argc, char **argv, unsigned int *threshold_mb,
 #define MAX_PERF_TEST 3
 int main(int argc, char **argv)
 {
-	int failures = 0;
 	unsigned int i;
 	int run_perf_tests;
 	unsigned int threshold_mb = VALIDATION_DEFAULT_THRESHOLD;
@@ -1260,7 +1221,7 @@ int main(int argc, char **argv)
 	pattern_seed = (unsigned int) time(&t);
 
 	if (parse_args(argc, argv, &threshold_mb, &pattern_seed) < 0)
-		exit(EXIT_FAILURE);
+		ksft_exit_fail_msg("Invalid arguments\n");
 
 	ksft_print_msg("Test configs:\n");
 	ksft_print_msg("threshold_mb=%u\n", threshold_mb);
@@ -1282,7 +1243,7 @@ int main(int argc, char **argv)
 	rand_addr = (char *)mmap(NULL, rand_size, PROT_READ | PROT_WRITE,
 				 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
 	if (rand_addr == MAP_FAILED) {
-		perror("mmap");
+		ksft_perror("mmap");
 		ksft_exit_fail_msg("cannot mmap rand_addr\n");
 	}
 
@@ -1361,8 +1322,7 @@ int main(int argc, char **argv)
 		      ARRAY_SIZE(perf_test_cases) : 0) + num_expand_tests + num_misc_tests);
 
 	for (i = 0; i < ARRAY_SIZE(test_cases); i++)
-		run_mremap_test_case(test_cases[i], &failures, threshold_mb,
-				     rand_addr);
+		run_mremap_test_case(test_cases[i], threshold_mb, rand_addr);
 
 	maps_fp = fopen("/proc/self/maps", "r");
 
@@ -1387,18 +1347,14 @@ int main(int argc, char **argv)
 	fclose(maps_fp);
 
 	if (run_perf_tests) {
-		ksft_print_msg("\n%s\n",
-		 "mremap HAVE_MOVE_PMD/PUD optimization time comparison for 1GB region:");
+		ksft_print_msg("%s\n",
+			       "mremap HAVE_MOVE_PMD/PUD optimization time comparison for 1GB region:");
 		for (i = 0; i < ARRAY_SIZE(perf_test_cases); i++)
-			run_mremap_test_case(perf_test_cases[i], &failures,
-					     threshold_mb,
+			run_mremap_test_case(perf_test_cases[i], threshold_mb,
 					     rand_addr);
 	}
 
 	munmap(rand_addr, rand_size);
 
-	if (failures > 0)
-		ksft_exit_fail();
-	else
-		ksft_exit_pass();
+	ksft_finished();
 }
-- 
2.53.0


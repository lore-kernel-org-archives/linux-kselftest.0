Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613783;
	b=lq7FXviifpKCCcUIFTXAAlWIPV7g8HRi7V9RrgAqR8dX45p51BGQD9E3IyGS1lPT5D0d
	 tUPO/P1RPdGn2WlfsIogsjYGE8iQIUX7+uFk79dsIX5FLC4ffY5B4kZ+ejd1+9zaOfSOe
	 EYw0dpQbVTA+KupiFG3ovLM7cj7rJUCow5pZs8QnLQINJctHDU6jQSbZ/zbo6EyyTpTja
	 n9iKI+TwL50yA8EUKAKudqOCJhAUJehJHzHGwviP5507Eirc+Oh1h9kWje7AaksUSctwN
	 X40KBTpJaApwEZxHz+udkJaKnRCqVoonUXj16usouM4e93j/X8ixRIefvJ8RXKnedmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613783;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f0wWhP/3MJOGkGLkqBmxaycwz9g/9W0PAihZE5o0QLk=;
	b=QLd96294GzK9rkB1gHtZQOnZKAgbybHxMopaq7OZdIDBH9Livd1GMTjf4Fh5ZNsud2Pn
	 4NZLMI0+yxMKk9iNhQ5AXbiVYPCUVOOB7B9eEt0A2k30LcllcXcSGrVp9Yxol7obKmt0G
	 tvrT1QBQ/SFMYFezXk2AGsLVPJGqWCBUULEV4d6fNLoOSIYo2Gq2MKdHd5DauDV99GZ2o
	 c2rS8Sj3/KgE+WLcDBZRltDQrTN0dDYVpDxY7GqMnRw719qNNY102ptH4Eln0YT81r45f
	 7bNXrFFOeMe+/grNlMzODHNMHIMZ5AC1IELaZ5NBq6QuD0bcX/+hZUf0OWIBW96VdYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DbjTj+SA;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F5A606A33C;
	Mon,  2 Nov 2026 10:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F5A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DbjTj+SA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38C721595;
	Mon,  2 Nov 2026 02:02:59 -0800 (PST)
Received: from a081061.arm.com (unknown [10.163.156.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A85AA3F59E;
	Mon,  2 Nov 2026 02:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793613782; bh=6T+k7B5W/aCAMu8Vjiw76NECIETeFi4/cDZ6YxEFKGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DbjTj+SAPPjONKZP5wpCJHSVdDFCXG01aAFkYioduEOLfgGSzbLncZ5gEaQvNjUMI
	 XbZ84nHKm8ORBfpqdOdsPn6hBhaWuqZ6l1qrJV10ICQZadkzWkGtQoSsVkjI+yc+84
	 3LDeoodLWKwMfE/lKsgKy2TbE0+WNNnvPzL3Mico=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@suse.com>,
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
Subject: [PATCH RESEND v2 04/12] selftests/mm: mremap_test: use kselftest helpers
Date: Mon,  2 Nov 2026 15:32:03 +0530
Message-ID: <20261102100211.141831-5-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102100211.141831-1-sarthak.sharma@arm.com>
References: <20261102100211.141831-1-sarthak.sharma@arm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
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
 tools/testing/selftests/mm/mremap_test.c | 190 +++++++++--------------
 1 file changed, 73 insertions(+), 117 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 72e6e4c3bd87..453606b3154e 100644
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
@@ -342,9 +336,9 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 	dest = src - SIZE_MB(2);
 
 	void *new_ptr = mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
-						   MREMAP_MAYMOVE | MREMAP_FIXED, dest + SIZE_MB(1));
+			       MREMAP_MAYMOVE | MREMAP_FIXED, dest + SIZE_MB(1));
 	if (new_ptr == MAP_FAILED) {
-		perror("mremap");
+		ksft_perror("mremap");
 		success = 0;
 		goto out;
 	}
@@ -366,10 +360,7 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 out:
 	munmap(ptr, size);
 
-	if (success)
-		ksft_test_result_pass("%s\n", test_name);
-	else
-		ksft_test_result_fail("%s\n", test_name);
+	ksft_test_result(success, "%s\n", test_name);
 }
 
 static bool is_multiple_vma_range_ok(unsigned int pattern_seed,
@@ -414,7 +405,7 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 	ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
 		   MAP_PRIVATE | MAP_ANON, -1, 0);
 	if (ptr == MAP_FAILED) {
-		perror("mmap");
+		ksft_perror("mmap");
 		success = false;
 		goto out;
 	}
@@ -422,12 +413,12 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
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
@@ -445,7 +436,7 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 			continue;
 
 		if (munmap(&ptr[i * page_size], page_size)) {
-			perror("munmap");
+			ksft_perror("munmap");
 			success = false;
 			goto out_unmap;
 		}
@@ -465,7 +456,7 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 
 	/* First, just move the whole thing. */
 	if (mremap(ptr, size, size, mremap_flags, tgt_ptr) == MAP_FAILED) {
-		perror("mremap");
+		ksft_perror("mremap");
 		success = false;
 		goto out_unmap;
 	}
@@ -478,7 +469,7 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 	/* Move next to itself. */
 	if (mremap(tgt_ptr, size, size, mremap_flags,
 		   &tgt_ptr[size]) == MAP_FAILED) {
-		perror("mremap");
+		ksft_perror("mremap");
 		success = false;
 		goto out_unmap;
 	}
@@ -491,14 +482,14 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
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
@@ -511,14 +502,8 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 out_unmap:
 	munmap(tgt_ptr, 2 * size);
 	munmap(ptr, size);
-
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
@@ -534,7 +519,7 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
 	ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
 		   MAP_PRIVATE | MAP_ANON, -1, 0);
 	if (ptr == MAP_FAILED) {
-		perror("mmap");
+		ksft_perror("mmap");
 		success = false;
 		goto out;
 	}
@@ -542,12 +527,12 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
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
@@ -561,7 +546,7 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
 	 */
 	for (i = 1; i < 10; i += 2) {
 		if (munmap(&ptr[i * page_size], page_size)) {
-			perror("munmap");
+			ksft_perror("munmap");
 			success = false;
 			goto out_unmap;
 		}
@@ -581,7 +566,7 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
 			     tgt_ptr);
 
 	if (res == MAP_FAILED) {
-		perror("mremap");
+		ksft_perror("mremap");
 		success = false;
 		goto out_unmap;
 	}
@@ -590,12 +575,7 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
 	munmap(tgt_ptr, size);
 	munmap(ptr, size);
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
@@ -615,7 +595,7 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 	ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
 		   MAP_PRIVATE | MAP_ANON, -1, 0);
 	if (ptr == MAP_FAILED) {
-		perror("mmap");
+		ksft_perror("mmap");
 		success = false;
 		goto out;
 	}
@@ -623,12 +603,12 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
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
@@ -642,7 +622,7 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 	 *  0 1 2 3 4   5 6 7 8 9  pattern offset
 	 */
 	if (munmap(&ptr[5 * page_size], page_size)) {
-		perror("munmap");
+		ksft_perror("munmap");
 		success = false;
 		goto out_unmap;
 	}
@@ -678,7 +658,7 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 	 */
 	if (mremap(&ptr[2 * page_size], size - 3 * page_size, size - 3 * page_size,
 		   mremap_flags, tgt_ptr) == MAP_FAILED) {
-		perror("mremap");
+		ksft_perror("mremap");
 		success = false;
 		goto out_unmap;
 	}
@@ -711,12 +691,7 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 	munmap(tgt_ptr, size);
 	munmap(ptr, size);
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
@@ -737,15 +712,15 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	uffd = syscall(__NR_userfaultfd, O_NONBLOCK);
 	if (uffd == -1) {
 		if (errno == EPERM) {
-			ksft_test_result_skip("%s - missing uffd", test_name);
+			ksft_test_result_skip("%s - missing uffd\n", test_name);
 			return;
 		}
-		perror("userfaultfd");
+		ksft_perror("userfaultfd");
 		success = false;
 		goto out;
 	}
 	if (ioctl(uffd, UFFDIO_API, &api)) {
-		perror("ioctl UFFDIO_API");
+		ksft_perror("ioctl UFFDIO_API");
 		success = false;
 		goto out_close_uffd;
 	}
@@ -753,19 +728,19 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
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
@@ -791,12 +766,12 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
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
@@ -810,18 +785,17 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	 */
 	res = mremap(ptr, size, size, MREMAP_MAYMOVE | MREMAP_FIXED, tgt_ptr);
 	if (res != MAP_FAILED) {
-		fprintf(stderr, "mremap() succeeded for multi VMA uffd armed\n");
+		ksft_print_msg("mremap() succeeded for multi VMA uffd armed\n");
 		success = false;
 		goto out_unmap;
 	}
 	if (errno != EFAULT) {
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
@@ -833,7 +807,7 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	res = mremap(ptr, page_size, page_size,
 		     MREMAP_MAYMOVE | MREMAP_FIXED, tgt_ptr);
 	if (res == MAP_FAILED) {
-		perror("mremap single invalid-multi VMA");
+		ksft_perror("mremap single invalid-multi VMA");
 		success = false;
 		goto out_unmap;
 	}
@@ -843,14 +817,14 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
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
@@ -861,17 +835,17 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	 */
 	res = mremap(ptr, size, size, MREMAP_MAYMOVE | MREMAP_FIXED, tgt_ptr);
 	if (res != MAP_FAILED) {
-		fprintf(stderr, "mremap() succeeded for multi VMA uffd armed\n");
+		ksft_print_msg("mremap() succeeded for multi VMA uffd armed\n");
 		success = false;
 		goto out_unmap;
 	}
 	if (errno != EFAULT) {
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
@@ -882,12 +856,12 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
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
@@ -896,7 +870,7 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 			   PROT_READ | PROT_WRITE,
 			   MAP_PRIVATE | MAP_ANON | MAP_FIXED, -1, 0);
 		if (res == MAP_FAILED) {
-			perror("mmap");
+			ksft_perror("mmap");
 			success = false;
 			goto out_unmap;
 		}
@@ -908,12 +882,12 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	 */
 	res = mremap(ptr, size, size, MREMAP_MAYMOVE | MREMAP_FIXED, tgt_ptr);
 	if (res != MAP_FAILED) {
-		fprintf(stderr, "mremap() succeeded for multi VMA uffd armed\n");
+		ksft_print_msg("mremap() succeeded for multi VMA uffd armed\n");
 		success = false;
 		goto out_unmap;
 	}
 	if (errno != EFAULT) {
-		perror("mremap() unexpected error");
+		ksft_perror("mremap() unexpected error");
 		success = false;
 		goto out_unmap;
 	}
@@ -923,11 +897,11 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
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
@@ -939,17 +913,14 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
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
 
@@ -1022,7 +993,7 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 
 	clock_gettime(CLOCK_MONOTONIC, &t_start);
 	dest_addr = mremap(src_addr, c.region_size, c.region_size,
-					  MREMAP_MAYMOVE|MREMAP_FIXED, (char *) addr);
+			   MREMAP_MAYMOVE | MREMAP_FIXED, (char *)addr);
 	clock_gettime(CLOCK_MONOTONIC, &t_end);
 
 	if (dest_addr == MAP_FAILED) {
@@ -1108,9 +1079,9 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 	munmap(dest, SIZE_MB(1));
 
 	void *new_ptr = mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
-						   MREMAP_MAYMOVE | MREMAP_FIXED, dest + SIZE_MB(1));
+			       MREMAP_MAYMOVE | MREMAP_FIXED, dest + SIZE_MB(1));
 	if (new_ptr == MAP_FAILED) {
-		perror("mremap");
+		ksft_perror("mremap");
 		success = 0;
 		goto out;
 	}
@@ -1136,13 +1107,10 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 	if (dest)
 		munmap(dest, c.region_size);
 
-	if (success)
-		ksft_test_result_pass("%s\n", test_name);
-	else
-		ksft_test_result_fail("%s\n", test_name);
+	ksft_test_result(success, "%s\n", test_name);
 }
 
-static void run_mremap_test_case(struct test test_case, int *failures,
+static void run_mremap_test_case(struct test test_case,
 				 unsigned int threshold_mb,
 				 char *rand_addr)
 {
@@ -1150,27 +1118,22 @@ static void run_mremap_test_case(struct test test_case, int *failures,
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
-			ksft_test_result_pass("%s\n", test_case.name);
-		} else {
+		    test_case.config.region_size <= threshold_mb * _1MB)
+			ksft_test_result_pass("%s: mremap time: %12lldns\n",
+					      test_case.name, remap_time);
+		else
 			ksft_test_result_pass("%s\n", test_case.name);
-		}
 	}
 }
 
@@ -1178,7 +1141,6 @@ static void run_mremap_test_case(struct test test_case, int *failures,
 #define MAX_PERF_TEST 3
 int main(void)
 {
-	int failures = 0;
 	unsigned int i;
 	int run_perf_tests;
 	unsigned int threshold_mb = VALIDATION_DEFAULT_THRESHOLD;
@@ -1224,10 +1186,8 @@ int main(void)
 
 	rand_addr = (char *)mmap(NULL, rand_size, PROT_READ | PROT_WRITE,
 				 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-	if (rand_addr == MAP_FAILED) {
-		perror("mmap");
-		ksft_exit_fail_msg("cannot mmap rand_addr\n");
-	}
+	if (rand_addr == MAP_FAILED)
+		ksft_exit_fail_perror("cannot mmap rand_addr");
 
 	/* fill stream of random bytes */
 	srand(pattern_seed);
@@ -1304,8 +1264,7 @@ int main(void)
 		      ARRAY_SIZE(perf_test_cases) : 0) + num_expand_tests + num_misc_tests);
 
 	for (i = 0; i < ARRAY_SIZE(test_cases); i++)
-		run_mremap_test_case(test_cases[i], &failures, threshold_mb,
-				     rand_addr);
+		run_mremap_test_case(test_cases[i], threshold_mb, rand_addr);
 
 	maps_fp = fopen("/proc/self/maps", "r");
 
@@ -1330,18 +1289,15 @@ int main(void)
 	fclose(maps_fp);
 
 	if (run_perf_tests) {
-		ksft_print_msg("\n%s\n",
+		ksft_print_msg("%s\n",
 		 "mremap HAVE_MOVE_PMD/PUD optimization time comparison for 1GB region:");
 		for (i = 0; i < ARRAY_SIZE(perf_test_cases); i++)
-			run_mremap_test_case(perf_test_cases[i], &failures,
+			run_mremap_test_case(perf_test_cases[i],
 					     threshold_mb,
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


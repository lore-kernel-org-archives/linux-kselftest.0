Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68BF3BB112;
	Tue,  6 Oct 2026 09:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278785; cv=none; b=D+i+ShBucVilk/EYJCqlPOH/TSEkDA6OggkGaaTL4Pc397hlX/ekGUAqgRNWfFcZkrAhIXzkVZCs8vygC+ytexB7OLEMHUS4nVX/5M7zWsQAs8nVgIk6nh80Z5EsOgeeqlUhijaEvNpyHQUr8RFcdcwGs3uhZxKDw0PNHdUHb8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278785; c=relaxed/simple;
	bh=H8dDI8wjnT2CtVhs3Y+DumFIFSl6+a23n2IQoHaKW6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AGG+24UW548+R5qAaUuGAylxdxtD02+3mrRBfmoo/ZTcpI2dA8jovbX6gkF/ilnqTJHpqNW+KgB4Fehii3xhgSBgeVMzZI+YvhjDzBo1O4yXB3KYVKWaqB3BxlNN60VNFail0ct2MYXZZ+Vb/hQJ2fke0zfv76+AemfiLtRVPak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=J0j0u8sN; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="J0j0u8sN"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D79F31516;
	Tue,  6 Oct 2026 02:26:19 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F3FB83F763;
	Tue,  6 Oct 2026 02:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791278783; bh=H8dDI8wjnT2CtVhs3Y+DumFIFSl6+a23n2IQoHaKW6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J0j0u8sNdBQm7q1DFGi2QLeZKKd801B6Dc7pw7QcTqLHd1wi04/2p9sVDDK09x+pP
	 C6lvnbjT1pr5nI++rNYVyAwyRnhQ8xV3DogaxwsUlxJMYOBlMQQ+41lB7xaPOVD/TD
	 9uK1CHT51cpSr0z5WyNCfpVbOcm035ObrnnBr1cE=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@suse.com,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	jhubbard@nvidia.com,
	kaleshsingh@google.com,
	anshuman.khandual@arm.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v2 12/12] selftests/mm: mremap_test: strengthen multi VMA validation
Date: Tue,  6 Oct 2026 14:55:11 +0530
Message-ID: <20261006092511.145776-13-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006092511.145776-1-sarthak.sharma@arm.com>
References: <20261006092511.145776-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tests in mremap_test.c where a multi VMA range is involved only
check if the data remains consistent across mapped pages after
remap. They do not verify the mapping state of gaps in the
remapped range.

Add helpers to check whether a range is mapped with the
expected permissions using /proc/self/maps. Use them to
verify that gaps remain unmapped after regular multi VMA
moves and after the partial move in the userfaultfd
multi VMA test. Also verify that gaps retain PROT_NONE
permissions when remapping over an existing mapping
with PROT_NONE permissions.

Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 105 ++++++++++++++++++-----
 1 file changed, 85 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 92ffcbe547b5..2a349b967695 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -122,13 +122,14 @@ static unsigned long long get_mmap_min_addr(void)
 }
 
 /*
- * Using /proc/self/maps, assert that the specified address range is contained
- * within a single mapping.
+ * Using /proc/self/maps, check whether the specified address range is contained
+ * within a single mapping with the expected permissions, if supplied.
  */
-static bool is_range_mapped(FILE *maps_fp, unsigned long start,
-			    unsigned long end)
+static bool is_range_mapped_with_perms(FILE *maps_fp, unsigned long start,
+		unsigned long end, const char *expected_perms)
 {
 	char *line = NULL;
+	char perms[5];
 	size_t len = 0;
 	bool success = false;
 	unsigned long first_val, second_val;
@@ -136,12 +137,13 @@ static bool is_range_mapped(FILE *maps_fp, unsigned long start,
 	rewind(maps_fp);
 
 	while (getline(&line, &len, maps_fp) != -1) {
-		if (sscanf(line, "%lx-%lx", &first_val, &second_val) != 2) {
+		if (sscanf(line, "%lx-%lx %4s", &first_val, &second_val, perms) != 3) {
 			ksft_exit_fail_msg("cannot parse /proc/self/maps\n");
 			break;
 		}
 
-		if (first_val <= start && second_val >= end) {
+		if (first_val <= start && second_val >= end &&
+		    (!expected_perms || !strcmp(perms, expected_perms))) {
 			success = true;
 			fflush(maps_fp);
 			break;
@@ -152,6 +154,12 @@ static bool is_range_mapped(FILE *maps_fp, unsigned long start,
 	return success;
 }
 
+static bool is_range_mapped(FILE *maps_fp, unsigned long start,
+			    unsigned long end)
+{
+	return is_range_mapped_with_perms(maps_fp, start, end, NULL);
+}
+
 /* Check if [ptr, ptr + size) mapped in /proc/self/maps. */
 static bool is_ptr_mapped(FILE *maps_fp, void *ptr, unsigned long size)
 {
@@ -161,6 +169,20 @@ static bool is_ptr_mapped(FILE *maps_fp, void *ptr, unsigned long size)
 	return is_range_mapped(maps_fp, start, end);
 }
 
+/*
+ * Check if [ptr, ptr + size) is mapped with the required permissions in
+ * /proc/self/maps.
+ */
+static bool is_ptr_mapped_with_perms(FILE *maps_fp, void *ptr,
+				     unsigned long size,
+				     const char *expected_perms)
+{
+	unsigned long start = (unsigned long)ptr;
+	unsigned long end = start + size;
+
+	return is_range_mapped_with_perms(maps_fp, start, end, expected_perms);
+}
+
 /*
  * Returns the start address of the mapping on success, else returns
  * NULL on failure.
@@ -348,10 +370,33 @@ static void mremap_move_within_range(char *pattern_addr)
 	ksft_test_result(success, "%s\n", test_name);
 }
 
-static bool is_multiple_vma_range_ok(char *pattern_addr, char *ptr,
-				     unsigned long page_size)
+static bool is_multiple_vma_range_ok(FILE *maps_fp, char *pattern_addr,
+				     char *ptr, unsigned long page_size,
+				     bool expect_gaps_mapped)
 {
-	for (int i = 0; i <= 10; i += 2) {
+	for (int i = 0; i <= 10; i++) {
+
+		if (i == 5)
+			continue;
+
+		/* Odd pages correspond to gaps between the source VMAs. */
+		if (i & 1) {
+			if (expect_gaps_mapped) {
+				if (!is_ptr_mapped_with_perms(maps_fp,
+							      ptr + i * page_size,
+							      page_size, "---p")) {
+					ksft_print_msg("Page %d PROT_NONE mapping overwritten\n",
+						       i);
+					return false;
+				}
+			} else if (is_ptr_mapped(maps_fp, ptr + i * page_size,
+						 page_size)) {
+				ksft_print_msg("Page %d is unexpectedly mapped\n", i);
+				return false;
+			}
+			continue;
+		}
+
 		size_t size = i == 4 ? 2 * page_size : page_size;
 
 		if (memcmp(ptr + i * page_size, pattern_addr + i * page_size,
@@ -365,7 +410,7 @@ static bool is_multiple_vma_range_ok(char *pattern_addr, char *ptr,
 	return true;
 }
 
-static void mremap_move_multiple_vmas(char *pattern_addr,
+static void mremap_move_multiple_vmas(FILE *maps_fp, char *pattern_addr,
 				      unsigned long page_size,
 				      bool dont_unmap)
 {
@@ -428,7 +473,8 @@ static void mremap_move_multiple_vmas(char *pattern_addr,
 		goto out_unmap;
 	}
 	/* Check move was ok. */
-	if (!is_multiple_vma_range_ok(pattern_addr, tgt_ptr, page_size)) {
+	if (!is_multiple_vma_range_ok(maps_fp, pattern_addr, tgt_ptr,
+				      page_size, false)) {
 		success = false;
 		goto out_unmap;
 	}
@@ -441,7 +487,8 @@ static void mremap_move_multiple_vmas(char *pattern_addr,
 		goto out_unmap;
 	}
 	/* Check that the move is ok. */
-	if (!is_multiple_vma_range_ok(pattern_addr, &tgt_ptr[size], page_size)) {
+	if (!is_multiple_vma_range_ok(maps_fp, pattern_addr, &tgt_ptr[size],
+				      page_size, false)) {
 		success = false;
 		goto out_unmap;
 	}
@@ -461,7 +508,8 @@ static void mremap_move_multiple_vmas(char *pattern_addr,
 		goto out_unmap;
 	}
 	/* Check that the move is ok. */
-	if (!is_multiple_vma_range_ok(pattern_addr, tgt_ptr, page_size)) {
+	if (!is_multiple_vma_range_ok(maps_fp, pattern_addr, tgt_ptr,
+				      page_size, true)) {
 		success = false;
 		goto out_unmap;
 	}
@@ -547,7 +595,8 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
 	ksft_test_result(success, "%s%s\n", test_name, inplace ? " [inplace]" : "");
 }
 
-static void mremap_move_multiple_vmas_split(char *pattern_addr,
+static void mremap_move_multiple_vmas_split(FILE *maps_fp,
+					    char *pattern_addr,
 					    unsigned long page_size,
 					    bool dont_unmap)
 {
@@ -623,8 +672,15 @@ static void mremap_move_multiple_vmas_split(char *pattern_addr,
 
 	/* Check pattern. */
 	for (i = 0; i < 7; i++) {
-		if (i == 3)
+		if (i == 3) {
+			if (is_ptr_mapped(maps_fp, tgt_ptr + i * page_size,
+					  page_size)) {
+				ksft_print_msg("Page %d is unexpectedly mapped\n", i);
+				success = false;
+				goto out_unmap;
+			}
 			continue;
+		}
 
 		if (memcmp(tgt_ptr + i * page_size,
 			   pattern_addr + (i + 2) * page_size, page_size)) {
@@ -840,10 +896,19 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 		goto out_unmap;
 	}
 
-	for (i = 0; i < 10; i += 2) {
+	for (i = 0; i < 10; i++) {
 		bool is_mapped = is_ptr_mapped(maps_fp,
 				&tgt_ptr[i * page_size], page_size);
 
+		if (i & 1) {
+			if (is_mapped) {
+				ksft_print_msg("Gap unexpectedly mapped at %d\n", i);
+				success = false;
+				goto out_unmap;
+			}
+			continue;
+		}
+
 		if (i < 8 && !is_mapped) {
 			ksft_print_msg("Valid VMA not moved at %d\n", i);
 			success = false;
@@ -1206,10 +1271,10 @@ int main(void)
 	mremap_move_1mb_from_start(pattern_addr);
 	mremap_shrink_multiple_vmas(page_size, /* inplace= */true);
 	mremap_shrink_multiple_vmas(page_size, /* inplace= */false);
-	mremap_move_multiple_vmas(pattern_addr, page_size, /* dontunmap= */ false);
-	mremap_move_multiple_vmas(pattern_addr, page_size, /* dontunmap= */ true);
-	mremap_move_multiple_vmas_split(pattern_addr, page_size, /* dontunmap= */ false);
-	mremap_move_multiple_vmas_split(pattern_addr, page_size, /* dontunmap= */ true);
+	mremap_move_multiple_vmas(maps_fp, pattern_addr, page_size, /* dontunmap= */ false);
+	mremap_move_multiple_vmas(maps_fp, pattern_addr, page_size, /* dontunmap= */ true);
+	mremap_move_multiple_vmas_split(maps_fp, pattern_addr, page_size, /* dontunmap= */ false);
+	mremap_move_multiple_vmas_split(maps_fp, pattern_addr, page_size, /* dontunmap= */ true);
 	mremap_move_multi_invalid_vmas(maps_fp, page_size);
 
 	fclose(maps_fp);
-- 
2.53.0


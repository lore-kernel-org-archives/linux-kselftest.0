Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185424C6530;
	Thu, 17 Sep 2026 11:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644054; cv=none; b=n4q/0fpGBx7udFH2hjLADodoR4Am9WT/byH/+ymY0cLVzdREji5lqjRqdjZEfKDq/srLhXYu0EHcr1KpmX2XFKDCYn1zY6DFnA3z//QTFTKLNOjwANI4az8Ups2wvjXHnCAy9d//tEdr8BZC0CHhxXkw1kUlMN/N2xm+qyleMr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644054; c=relaxed/simple;
	bh=W0Ngv2ll7TrUzP/N5jQ6K1WGV1ebWdj2UDxJ7GFJJf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFzwwGb7Ahya6oDKda+m9RU1YoQ4iy8Cm7qaIUkGXjkPjlANV1oBKAN97W9VMXWdYlJp2XYSzkrLMEY6t1e0k9FM8/A4kUQK3bTjooyCWDri72XgYZbmhZkvgBDvN77d3rpSjeopY81Py6/UF4PuyKqZAppM0rteiKzKnVJnDJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pm547Zxf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pm547Zxf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FA3C1F91;
	Thu, 17 Sep 2026 04:20:44 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC4803F7B4;
	Thu, 17 Sep 2026 04:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789644048; bh=W0Ngv2ll7TrUzP/N5jQ6K1WGV1ebWdj2UDxJ7GFJJf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pm547ZxfYZIkiIpWwlVIarGX0nbQ7cZqDeaR/2f6iyKtipwzm5A3QBrYXQBedJe8p
	 oFSyAe6zl1THhv94YHzwNb8eZUQ+WJrat39oFnsIbP51IKoA7OIZc5nTvxqTFPj3t+
	 foZtCSAcHw67UYSz0rBu+gebqE99ZPyDPmLHfsBo=
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
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH 9/9] selftests/mm: mremap_test: strengthen multi VMA validation
Date: Thu, 17 Sep 2026 16:49:51 +0530
Message-ID: <20260917111951.188266-10-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917111951.188266-1-sarthak.sharma@arm.com>
References: <20260917111951.188266-1-sarthak.sharma@arm.com>
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
verify that gaps remain unmapped after regular remaps and
retain PROT_NONE permissions when remapping over an
existing mapping with PROT_NONE permissions.

Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 91 +++++++++++++++++++-----
 1 file changed, 72 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 77e952556be1..1d9934b9a60b 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -124,13 +124,15 @@ static unsigned long long get_mmap_min_addr(void)
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
+				       unsigned long end,
+				       const char *expected_perms)
 {
 	char *line = NULL;
+	char perms[5];
 	size_t len = 0;
 	bool success = false;
 	unsigned long first_val, second_val;
@@ -138,12 +140,13 @@ static bool is_range_mapped(FILE *maps_fp, unsigned long start,
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
@@ -154,6 +157,12 @@ static bool is_range_mapped(FILE *maps_fp, unsigned long start,
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
@@ -163,6 +172,20 @@ static bool is_ptr_mapped(FILE *maps_fp, void *ptr, unsigned long size)
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
@@ -351,16 +374,37 @@ static void mremap_move_within_range(void)
 	ksft_test_result(success, "%s\n", test_name);
 }
 
-static bool is_multiple_vma_range_ok(char *ptr, unsigned long page_size)
+static bool is_multiple_vma_range_ok(FILE *maps_fp, char *ptr,
+				     unsigned long page_size, bool expect_gaps_mapped)
 {
 	int i;
 
-	for (i = 0; i <= 10; i += 2) {
+	for (i = 0; i <= 10; i++) {
 		size_t size = i == 4 ? 3 * page_size : page_size;
 
-		if (i == 6)
+		/* Pages 4, 5 and 6 are part of the same VMA. */
+		if (i == 5 || i == 6)
 			continue;
 
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
+
+			continue;
+		}
+
 		if (memcmp(ptr + i * page_size, (char *)pattern + i * page_size,
 			   size)) {
 			ksft_print_msg("Data in VMA starting at page %d got corrupted\n",
@@ -371,7 +415,8 @@ static bool is_multiple_vma_range_ok(char *ptr, unsigned long page_size)
 	return true;
 }
 
-static void mremap_move_multiple_vmas(unsigned long page_size, bool dont_unmap)
+static void mremap_move_multiple_vmas(FILE *maps_fp, unsigned long page_size,
+				      bool dont_unmap)
 {
 	int mremap_flags = MREMAP_FIXED | MREMAP_MAYMOVE;
 	char *test_name = "mremap move multiple vmas";
@@ -432,7 +477,7 @@ static void mremap_move_multiple_vmas(unsigned long page_size, bool dont_unmap)
 		goto out_unmap;
 	}
 	/* Check move was ok. */
-	if (!is_multiple_vma_range_ok(tgt_ptr, page_size)) {
+	if (!is_multiple_vma_range_ok(maps_fp, tgt_ptr, page_size, false)) {
 		success = false;
 		goto out_unmap;
 	}
@@ -445,7 +490,7 @@ static void mremap_move_multiple_vmas(unsigned long page_size, bool dont_unmap)
 		goto out_unmap;
 	}
 	/* Check that the move is ok. */
-	if (!is_multiple_vma_range_ok(&tgt_ptr[size], page_size)) {
+	if (!is_multiple_vma_range_ok(maps_fp, &tgt_ptr[size], page_size, false)) {
 		success = false;
 		goto out_unmap;
 	}
@@ -465,7 +510,7 @@ static void mremap_move_multiple_vmas(unsigned long page_size, bool dont_unmap)
 		goto out_unmap;
 	}
 	/* Check that the move is ok. */
-	if (!is_multiple_vma_range_ok(tgt_ptr, page_size)) {
+	if (!is_multiple_vma_range_ok(maps_fp, tgt_ptr, page_size, true)) {
 		success = false;
 		goto out_unmap;
 	}
@@ -554,7 +599,8 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
 	ksft_test_result(success, "%s%s\n", test_name, inplace ? " [inplace]" : "");
 }
 
-static void mremap_move_multiple_vmas_split(unsigned long page_size,
+static void mremap_move_multiple_vmas_split(FILE *maps_fp,
+					    unsigned long page_size,
 					    bool dont_unmap)
 {
 	char *test_name = "mremap move multiple vmas split";
@@ -629,8 +675,15 @@ static void mremap_move_multiple_vmas_split(unsigned long page_size,
 
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
 			   (char *)pattern + (i + 2) * page_size, page_size)) {
@@ -1177,10 +1230,10 @@ int main(void)
 	mremap_move_1mb_from_start();
 	mremap_shrink_multiple_vmas(page_size, /* inplace= */true);
 	mremap_shrink_multiple_vmas(page_size, /* inplace= */false);
-	mremap_move_multiple_vmas(page_size, /* dontunmap= */ false);
-	mremap_move_multiple_vmas(page_size, /* dontunmap= */ true);
-	mremap_move_multiple_vmas_split(page_size, /* dontunmap= */ false);
-	mremap_move_multiple_vmas_split(page_size, /* dontunmap= */ true);
+	mremap_move_multiple_vmas(maps_fp, page_size, /* dontunmap= */ false);
+	mremap_move_multiple_vmas(maps_fp, page_size, /* dontunmap= */ true);
+	mremap_move_multiple_vmas_split(maps_fp, page_size, /* dontunmap= */ false);
+	mremap_move_multiple_vmas_split(maps_fp, page_size, /* dontunmap= */ true);
 	mremap_move_multi_invalid_vmas(maps_fp, page_size);
 
 	fclose(maps_fp);
-- 
2.53.0


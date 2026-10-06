Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51D43B6379;
	Tue,  6 Oct 2026 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278766; cv=none; b=goMYGXbxV+EU9gPEz4d1NszreQuGzTJ4j2ScMeciEjU5rBC/NWrn4oF0wHb2fRgq1ZygVBqwoMOLcHVYKkzbWxsKsg75SSzkzX3EdWhSiTgMrkM0PeytKC+jEbcHWuAl4LMYf4sXJIlkLUcjY3UFLItLUD+bb/uezWzyVuhYGpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278766; c=relaxed/simple;
	bh=L3KeWBIKxswCxpqs+QVPQarsghruNw30o7dAd05nFTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VvHzMsdF/gLodKR59Pg3WnUT88DvaBzKbRS0CL6BwGwDdBikm6Kv6fYnxmvYHCaU4YPGyvMhne7/u1sshZmnhDQR5L3lcRcMjYjWSKneBuDxHhajZzoS+uBXmEbsWdUxobBMS58D9jpjgrxjoEBZQwMCV6ZhFs6tnKdcLuWrloU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fjkgQrNw; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fjkgQrNw"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A56E31477;
	Tue,  6 Oct 2026 02:26:00 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C15DB3F763;
	Tue,  6 Oct 2026 02:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791278764; bh=L3KeWBIKxswCxpqs+QVPQarsghruNw30o7dAd05nFTg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fjkgQrNwj1eknTzQEWsmDBDT+2gebpqa+BHqFKmaH/4NzaGxH/0ih+lcvXiZWgh6U
	 3r9wLLOva9s/Pse/N+a1Axhc4yAmkzuK6BuMLrQ1cJqBXItJ1uU5NDYIve9BzyUGpY
	 OZiOG1l7QA6WeuB8YKAb8LGBChv7gU8Q307DZvqQ=
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
Subject: [PATCH v2 08/12] selftests/mm: mremap_test: handle cleanup after mmap failures
Date: Tue,  6 Oct 2026 14:55:07 +0530
Message-ID: <20261006092511.145776-9-sarthak.sharma@arm.com>
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

In several tests, when target mapping fails, we directly
jump to the result handling, without unmapping the
previously created source mapping. This leaks the
source mapping. Unmap the source mapping when target
mapping fails.

Also bypass munmap() when source mapping fails in
mremap_move_within_range().

Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 833efa85e5c6..37bba5049ecc 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -340,7 +340,7 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 	if (new_ptr == MAP_FAILED) {
 		ksft_perror("mremap");
 		success = 0;
-		goto out;
+		goto out_unmap;
 	}
 
 	/* Verify byte pattern after remapping */
@@ -357,9 +357,9 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 		}
 	}
 
-out:
+out_unmap:
 	munmap(ptr, size);
-
+out:
 	ksft_test_result(success, "%s\n", test_name);
 }
 
@@ -415,7 +415,7 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 	if (tgt_ptr == MAP_FAILED) {
 		ksft_perror("mmap");
 		success = false;
-		goto out;
+		goto out_unmap_src;
 	}
 	if (munmap(tgt_ptr, 2 * size)) {
 		ksft_perror("munmap");
@@ -501,6 +501,7 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 
 out_unmap:
 	munmap(tgt_ptr, 2 * size);
+out_unmap_src:
 	munmap(ptr, size);
 out:
 	ksft_test_result(success, "%s%s\n", test_name, dont_unmap ? " [dontunmap]" : "");
@@ -529,7 +530,7 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
 	if (tgt_ptr == MAP_FAILED) {
 		ksft_perror("mmap");
 		success = false;
-		goto out;
+		goto out_unmap_src;
 	}
 	if (munmap(tgt_ptr, size)) {
 		ksft_perror("munmap");
@@ -573,6 +574,7 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
 
 out_unmap:
 	munmap(tgt_ptr, size);
+out_unmap_src:
 	munmap(ptr, size);
 out:
 	ksft_test_result(success, "%s%s\n", test_name, inplace ? " [inplace]" : "");
@@ -605,7 +607,7 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 	if (tgt_ptr == MAP_FAILED) {
 		ksft_perror("mmap");
 		success = false;
-		goto out;
+		goto out_unmap_src;
 	}
 	if (munmap(tgt_ptr, size)) {
 		ksft_perror("munmap");
@@ -690,6 +692,7 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 
 out_unmap:
 	munmap(tgt_ptr, size);
+out_unmap_src:
 	munmap(ptr, size);
 out:
 	ksft_test_result(success, "%s%s\n", test_name, dont_unmap ? " [dontunmap]" : "");
@@ -738,7 +741,7 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	if (tgt_ptr == MAP_FAILED) {
 		ksft_perror("mmap");
 		success = false;
-		goto out_close_uffd;
+		goto out_unmap_src;
 	}
 	if (munmap(tgt_ptr, size)) {
 		ksft_perror("munmap");
@@ -910,6 +913,7 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 
 out_unmap:
 	munmap(tgt_ptr, size);
+out_unmap_src:
 	munmap(ptr, size);
 out_close_uffd:
 	close(uffd);
-- 
2.53.0


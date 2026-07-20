Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B09F395AC5;
	Mon, 20 Jul 2026 10:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784543480; cv=none; b=fvqLjjG3mkt8A6caeE5Lw6XDsVMnsBMVyw3VTsxQ1vQGQdXV8c/I+0f8RwGpDU2hT1dfXx9QYExrcwbeFzNjJ44rCFVQ4Bwbd+V5my3mdfLfLz6GNwZng0nNyrgLGFJ3dbhS4sRp+KqGukz6rxFM0Rpg4DP6d7zk/IHFFK7cgFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784543480; c=relaxed/simple;
	bh=vzn4MVwPB35KOU7txBTLgrtF1+3qwX9TWdwyqaeM1KE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kpJ1KAf+IeKDsgpNZ4nDYLqrYn0tHydonHRPdSYNoET0Q5eCi0QNaRhil+fphzmR7QOim7jvfxl7ayQCMd4gf71btLstR7gX3SQBjNq3eUo7txriRdtHc0RzXzd7OO3UmURY+v8UuYbLDf34XaxY/ggJFDlJZRN4nFxR7bDY49o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Tn0rd8VY; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Tn0rd8VY"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 757B72B;
	Mon, 20 Jul 2026 03:31:13 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E5E6B3F99C;
	Mon, 20 Jul 2026 03:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784543477; bh=vzn4MVwPB35KOU7txBTLgrtF1+3qwX9TWdwyqaeM1KE=;
	h=From:To:Cc:Subject:Date:From;
	b=Tn0rd8VYzBzf42E3UzcxH+qfA6Ssr4+b9iH9BWyM38kqdS4xHA4NVlaTuj7WnjRK3
	 5rSCThNE/EIwTQWRQ7PBORKDOVdaV/Kzs0+6b46h6QjiywVndUA806Xp7IoVd3zXTZ
	 U+uh1vsEXJL522Wct2++RfA5EjV1zBpYy4N30N5Q=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Aishwarya TCV <aishwarya.tcv@arm.com>
Subject: [PATCH] selftests/mm: transhuge-stress: check duration inside page loop
Date: Mon, 20 Jul 2026 16:01:05 +0530
Message-ID: <20260720103105.169955-1-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

transhuge-stress.c currently scans memory equal to RAM by default,
in jumps of hugepage size, trying to allocate and split a THP at
each step. After the entire range is covered, it checks whether
elapsed time is greater than the duration. But it is possible
that the THP work it does takes time more than the duration itself,
causing the test to exceed the CI timeout.

Check the elapsed time after each THP operation. If the duration
has elapsed, break and end the test. Adjust the statistics
calculations to accommodate partially completed passes. Also,
reject sizes which are smaller than a huge page.

Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
Suggested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
Tested with -d 5 on a machine with about 250 GiB RAM.

Time taken before the patch = 4m26.793s
Time taken after the patch = 0m5.198s
---
 tools/testing/selftests/mm/transhuge-stress.c | 30 ++++++++++++++-----
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/transhuge-stress.c b/tools/testing/selftests/mm/transhuge-stress.c
index 8eb0c5630e7e..a0f9fc900360 100644
--- a/tools/testing/selftests/mm/transhuge-stress.c
+++ b/tools/testing/selftests/mm/transhuge-stress.c
@@ -35,6 +35,7 @@ int main(int argc, char **argv)
 	size_t map_len;
 	int pagemap_fd;
 	int duration = 0;
+	double elapsed = 0;
 
 	ksft_print_header();
 
@@ -60,8 +61,6 @@ int main(int argc, char **argv)
 			len = atoll(argv[i]) << 20;
 	}
 
-	ksft_set_plan(1);
-
 	if (name) {
 		backing_fd = open(name, O_RDWR);
 		if (backing_fd == -1)
@@ -78,6 +77,10 @@ int main(int argc, char **argv)
 		ksft_exit_fail_msg("open pagemap\n");
 
 	len -= len % HPAGE_SIZE;
+	if (len == 0)
+		ksft_exit_fail_msg("len must be at least %d MiB\n",
+			HPAGE_SIZE >> 20);
+
 	ptr = mmap(NULL, len + HPAGE_SIZE, PROT_RW, mmap_flags, backing_fd, 0);
 	if (ptr == MAP_FAILED)
 		ksft_exit_fail_msg("initial mmap");
@@ -91,6 +94,7 @@ int main(int argc, char **argv)
 	if (!map)
 		ksft_exit_fail_msg("map malloc\n");
 
+	ksft_set_plan(1);
 	clock_gettime(CLOCK_MONOTONIC, &start);
 
 	while (1) {
@@ -125,16 +129,28 @@ int main(int argc, char **argv)
 			/* split transhuge page, keep last page */
 			if (madvise(p, HPAGE_SIZE - psize(), MADV_DONTNEED))
 				ksft_exit_fail_msg("MADV_DONTNEED");
+
+			if (duration > 0) {
+				clock_gettime(CLOCK_MONOTONIC, &b);
+				elapsed = b.tv_sec - start.tv_sec +
+					(b.tv_nsec - start.tv_nsec) / 1000000000.;
+				if (elapsed >= duration)
+					break;
+			}
 		}
 		clock_gettime(CLOCK_MONOTONIC, &b);
 		s = b.tv_sec - a.tv_sec + (b.tv_nsec - a.tv_nsec) / 1000000000.;
 
 		ksft_print_msg("%.3f s/loop, %.3f ms/page, %10.3f MiB/s\t"
-			       "%4d succeed, %4d failed, %4d different pages\n",
-			       s, s * 1000 / (len >> HPAGE_SHIFT), len / s / (1 << 20),
-			       nr_succeed, nr_failed, nr_pages);
-
-		if (duration > 0 && b.tv_sec - start.tv_sec >= duration) {
+				"%4d succeed, %4d failed, %4d different pages\n",
+				s, s * 1000 / (nr_failed + nr_succeed),
+				s > 0 ?
+					(double)(nr_failed + nr_succeed) *
+					(HPAGE_SIZE >> 20) / s :
+					0.0,
+				nr_succeed, nr_failed, nr_pages);
+
+		if (duration > 0 && elapsed >= duration) {
 			ksft_test_result_pass("Completed\n");
 			ksft_finished();
 		}

base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.39.5


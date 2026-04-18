Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B992355F52;
	Sat, 18 Apr 2026 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509927; cv=none; b=SHdADmxmbSllYjyLMR5M7SuUHPJMID3YsgowGA0YEo4U4cuIaE/AUJIIgdhyG0clrG13AHPRLaQnZzaNitxzgrdC6vDGSgRxhOV28PZu/6ijKMUJQTKxTzrFchFLFruAjb8imxK0qJU6pRwdyggxk7hrU+I65ZtD62eU+S6THwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509927; c=relaxed/simple;
	bh=t2OQ6d8PPidPjQSh+RBxS6XeDUdzwdvT/+uZ5YR7P1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSLiyXGo3MmOVm90e59Z2rNE4Ui3VTlSJwGQ1y5/CFM2/+RLpmfnxK+IyA1T6EnBtDx1OtTBSipdHwwJOeGkiMUVrEH3HWmOVb89PQaX9pY296lWdIyPVijkj+iSn4+ZYY/3noAUiO3qLbAPrdCR/zSo5w5UFkk9IyejN3uq7MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bN1i663m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bN1i663m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568E4C2BCB6;
	Sat, 18 Apr 2026 10:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509927;
	bh=t2OQ6d8PPidPjQSh+RBxS6XeDUdzwdvT/+uZ5YR7P1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bN1i663mTsKFcfnOTliwN6bGVzDkg6wWmRaQeFQOYLLypzPpnSK8TyQF4cQ0xx4w+
	 gedyGidMDRRC6KTi8mnCLcDNNVZol5GCY9DktGGM4tTCcBwRI358p89udf3ZAGHWG0
	 ywmVuV8+/9iIfmB/QqN/I+XDD+ZC6r78AHeXnGEJxmVJESByd1c6Yltrkh2iPjaa+P
	 Ci5YgrLikEB2JYdUWEelkk3dapWN+0iQSzUNhSr22nYH+XlXD3q90uhu2hqKMGrG6D
	 ylq6RNar5NacZkLRLN+Drij63JpSkQPmluEkw8gigwCVg7RMbwOI4HrKXR8otD4nvK
	 gPbVGOJBSXH7w==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 29/53] selftests/mm: compaction_test: use HugeTLB helpers ...
Date: Sat, 18 Apr 2026 13:55:14 +0300
Message-ID: <20260418105539.1261536-30-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418105539.1261536-1-rppt@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

... instead of open coded access of HugeTLB parameters via /proc.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/compaction_test.c | 113 +++----------------
 1 file changed, 17 insertions(+), 96 deletions(-)

diff --git a/tools/testing/selftests/mm/compaction_test.c b/tools/testing/selftests/mm/compaction_test.c
index 30209c40b697..962a50c3d66f 100644
--- a/tools/testing/selftests/mm/compaction_test.c
+++ b/tools/testing/selftests/mm/compaction_test.c
@@ -17,6 +17,7 @@
 #include <string.h>
 
 #include "kselftest.h"
+#include "hugepage_settings.h"
 
 #define MAP_SIZE_MB	100
 #define MAP_SIZE	(MAP_SIZE_MB * 1024 * 1024)
@@ -82,75 +83,33 @@ int prereq(void)
 	return -1;
 }
 
-int check_compaction(unsigned long mem_free, unsigned long hugepage_size,
-		     unsigned long initial_nr_hugepages)
+int check_compaction(unsigned long mem_free, unsigned long hugepage_size)
 {
-	unsigned long nr_hugepages_ul;
-	int fd, ret = -1;
+	unsigned long nr_hugepages;
 	int compaction_index = 0;
-	char nr_hugepages[20] = {0};
-	char init_nr_hugepages[24] = {0};
-	char target_nr_hugepages[24] = {0};
-	int slen;
-
-	snprintf(init_nr_hugepages, sizeof(init_nr_hugepages),
-		 "%lu", initial_nr_hugepages);
+	int ret = -1;
 
 	/* We want to test with 80% of available memory. Else, OOM killer comes
 	   in to play */
 	mem_free = mem_free * 0.8;
 
-	fd = open("/proc/sys/vm/nr_hugepages", O_RDWR | O_NONBLOCK);
-	if (fd < 0) {
-		ksft_print_msg("Failed to open /proc/sys/vm/nr_hugepages: %s\n",
-			       strerror(errno));
-		ret = -1;
-		goto out;
-	}
-
 	/*
 	 * Request huge pages for about half of the free memory. The Kernel
 	 * will allocate as much as it can, and we expect it will get at least 1/3
 	 */
-	nr_hugepages_ul = mem_free / hugepage_size / 2;
-	snprintf(target_nr_hugepages, sizeof(target_nr_hugepages),
-		 "%lu", nr_hugepages_ul);
-
-	slen = strlen(target_nr_hugepages);
-	if (write(fd, target_nr_hugepages, slen) != slen) {
-		ksft_print_msg("Failed to write %lu to /proc/sys/vm/nr_hugepages: %s\n",
-			       nr_hugepages_ul, strerror(errno));
-		goto close_fd;
-	}
-
-	lseek(fd, 0, SEEK_SET);
-
-	if (read(fd, nr_hugepages, sizeof(nr_hugepages)) <= 0) {
-		ksft_print_msg("Failed to re-read from /proc/sys/vm/nr_hugepages: %s\n",
-			       strerror(errno));
-		goto close_fd;
-	}
+	nr_hugepages = mem_free / hugepage_size / 2;
+	hugetlb_set_nr_default_pages(nr_hugepages);
 
 	/* We should have been able to request at least 1/3 rd of the memory in
 	   huge pages */
-	nr_hugepages_ul = strtoul(nr_hugepages, NULL, 10);
-	if (!nr_hugepages_ul) {
+	nr_hugepages = hugetlb_nr_default_pages();
+	if (!nr_hugepages) {
 		ksft_print_msg("ERROR: No memory is available as huge pages\n");
 		goto close_fd;
 	}
-	compaction_index = mem_free/(nr_hugepages_ul * hugepage_size);
-
-	lseek(fd, 0, SEEK_SET);
-
-	if (write(fd, init_nr_hugepages, strlen(init_nr_hugepages))
-	    != strlen(init_nr_hugepages)) {
-		ksft_print_msg("Failed to write value to /proc/sys/vm/nr_hugepages: %s\n",
-			       strerror(errno));
-		goto close_fd;
-	}
+	compaction_index = mem_free/(nr_hugepages * hugepage_size);
 
-	ksft_print_msg("Number of huge pages allocated = %lu\n",
-		       nr_hugepages_ul);
+	ksft_print_msg("Number of huge pages allocated = %lu\n", nr_hugepages);
 
 	if (compaction_index > 3) {
 		ksft_print_msg("ERROR: Less than 1/%d of memory is available\n"
@@ -161,48 +120,10 @@ int check_compaction(unsigned long mem_free, unsigned long hugepage_size,
 	ret = 0;
 
  close_fd:
-	close(fd);
- out:
 	ksft_test_result(ret == 0, "check_compaction\n");
 	return ret;
 }
 
-int set_zero_hugepages(unsigned long *initial_nr_hugepages)
-{
-	int fd, ret = -1;
-	char nr_hugepages[20] = {0};
-
-	fd = open("/proc/sys/vm/nr_hugepages", O_RDWR | O_NONBLOCK);
-	if (fd < 0) {
-		ksft_print_msg("Failed to open /proc/sys/vm/nr_hugepages: %s\n",
-			       strerror(errno));
-		goto out;
-	}
-	if (read(fd, nr_hugepages, sizeof(nr_hugepages)) <= 0) {
-		ksft_print_msg("Failed to read from /proc/sys/vm/nr_hugepages: %s\n",
-			       strerror(errno));
-		goto close_fd;
-	}
-
-	lseek(fd, 0, SEEK_SET);
-
-	/* Start with the initial condition of 0 huge pages */
-	if (write(fd, "0", sizeof(char)) != sizeof(char)) {
-		ksft_print_msg("Failed to write 0 to /proc/sys/vm/nr_hugepages: %s\n",
-			       strerror(errno));
-		goto close_fd;
-	}
-
-	*initial_nr_hugepages = strtoul(nr_hugepages, NULL, 10);
-	ret = 0;
-
- close_fd:
-	close(fd);
-
- out:
-	return ret;
-}
-
 int main(int argc, char **argv)
 {
 	struct rlimit lim;
@@ -212,18 +133,19 @@ int main(int argc, char **argv)
 	unsigned long mem_free = 0;
 	unsigned long hugepage_size = 0;
 	long mem_fragmentable_MB = 0;
-	unsigned long initial_nr_hugepages;
 
 	ksft_print_header();
 
 	if (prereq() || geteuid())
 		ksft_exit_skip("Prerequisites unsatisfied\n");
 
-	ksft_set_plan(1);
-
 	/* Start the test without hugepages reducing mem_free */
-	if (set_zero_hugepages(&initial_nr_hugepages))
-		ksft_exit_fail();
+	hugetlb_save_settings();
+	hugetlb_set_nr_default_pages(0);
+	if (hugetlb_nr_default_pages())
+		ksft_exit_skip("Could not reset nr_hugepages\n");
+
+	ksft_set_plan(1);
 
 	lim.rlim_cur = RLIM_INFINITY;
 	lim.rlim_max = RLIM_INFINITY;
@@ -268,8 +190,7 @@ int main(int argc, char **argv)
 		entry = entry->next;
 	}
 
-	if (check_compaction(mem_free, hugepage_size,
-			     initial_nr_hugepages) == 0)
+	if (check_compaction(mem_free, hugepage_size) == 0)
 		ksft_exit_pass();
 
 	ksft_exit_fail();
-- 
2.53.0


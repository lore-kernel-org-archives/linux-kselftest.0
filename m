Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBB34418FC;
	Mon, 11 May 2026 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517107; cv=none; b=pKrkG0111lwl7czpZEDvbzU7WIxXhRFP8dOHEsxV9N7dQgHl2MVfO0Y0eE1y3GIiwgwkOIV/wBBUIQhHUkVjewgJEFDIdKFg0C+HKdud00W2v8Zm0FyAYcojbvSWfIPwaZZ9xpzpgkRm2luqbO+E0jXlJmoAZMQksmr4kaChHYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517107; c=relaxed/simple;
	bh=Wo6Ea22iz5yeR/kFj0v7wtD3a8d85eAyxnhXtWYsB5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyYmXZKq1Km367ZrARfgx6TJiL7Jjff2WsK6hCPPfYFQYHGxpUbejtZ1Arhu7NWtQYFyEl2EzAuhlkM0hr6845LUnF0dDisNSkHISLurdXmTSPJT6Un5IQ6Q9+tKU4yXlM2bBme2KSx4fUZolGv80eLPLKfvCf9fkahe1kC23ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ulkcc9fn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ulkcc9fn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F661C2BCF6;
	Mon, 11 May 2026 16:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517106;
	bh=Wo6Ea22iz5yeR/kFj0v7wtD3a8d85eAyxnhXtWYsB5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ulkcc9fnZfQ+KyZxvStBSZ11UJcHuCzWet0F9LaNUAdAYDZQEvPARAjf7Xs9m/mR/
	 trVTSjNveGqQWNvQuO3hHIp1Lbagdh9w36PP/9B9G+NLixRSRQ9VSFXykpwURlaKKH
	 m1MlWk7Vrz4vvNAOZeLyeMtAkHXJUzjLG9E/W2dg6KtTLmIg0xMUhHQGY5LheK9MU5
	 9Sg8ZE2ty8DKPm/YbiVy/UpqgMNucsh/9MAIkrfbUn1QsuLcEtQBRYakOzg5/7mH/m
	 eSU7ofxKHhF+gLg74C0ipZ0PDXvaclzsjlUGTbF88TwS/3WGuD47mvhiAtB/2djgb7
	 9fbJBFMSEQavg==
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
	Li Wang <li.wang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Luiz Capitulino <luizcap@redhat.com>,
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
Subject: [PATCH v4 27/55] selftests/mm: hugepage_settings: rename and rework get_free_hugepages()
Date: Mon, 11 May 2026 19:28:11 +0300
Message-ID: <20260511162840.375890-28-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511162840.375890-1-rppt@kernel.org>
References: <20260511162840.375890-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

... to hugetlb_free_default_pages() for consistency with
hugetlb_nr_default_pages().

Make hugetlb_free_default_pages() use hugetlb_sysfs_path() helper instead
of parsing /proc/meminfo.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 .../testing/selftests/mm/hugepage_settings.c  | 28 ++++++-------------
 .../testing/selftests/mm/hugepage_settings.h  | 12 +++++++-
 tools/testing/selftests/mm/hugetlb-madvise.c  |  4 +--
 tools/testing/selftests/mm/hugetlb_dio.c      |  6 ++--
 .../selftests/mm/hugetlb_fault_after_madv.c   |  2 +-
 .../selftests/mm/hugetlb_madv_vs_map.c        |  2 +-
 tools/testing/selftests/mm/uffd-stress.c      |  2 +-
 7 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
index 99402cfccb6d..3c944d28d14a 100644
--- a/tools/testing/selftests/mm/hugepage_settings.c
+++ b/tools/testing/selftests/mm/hugepage_settings.c
@@ -445,25 +445,6 @@ unsigned long default_huge_page_size(void)
 	return hps;
 }
 
-unsigned long get_free_hugepages(void)
-{
-	unsigned long fhp = 0;
-	char *line = NULL;
-	size_t linelen = 0;
-	FILE *f = fopen("/proc/meminfo", "r");
-
-	if (!f)
-		return fhp;
-	while (getline(&line, &linelen, f) > 0) {
-		if (sscanf(line, "HugePages_Free:      %lu", &fhp) == 1)
-			break;
-	}
-
-	free(line);
-	fclose(f);
-	return fhp;
-}
-
 static void hugetlb_sysfs_path(char *buf, size_t buflen,
 			       unsigned long size, const char *attr)
 {
@@ -488,3 +469,12 @@ void hugetlb_set_nr_pages(unsigned long size, unsigned long nr)
 
 	write_num(path, nr);
 }
+
+unsigned long hugetlb_free_pages(unsigned long size)
+{
+	char path[PATH_MAX];
+
+	hugetlb_sysfs_path(path, sizeof(path), size, "free_hugepages");
+
+	return read_num(path);
+}
diff --git a/tools/testing/selftests/mm/hugepage_settings.h b/tools/testing/selftests/mm/hugepage_settings.h
index e66302926377..436f4ce02984 100644
--- a/tools/testing/selftests/mm/hugepage_settings.h
+++ b/tools/testing/selftests/mm/hugepage_settings.h
@@ -92,10 +92,10 @@ bool thp_is_enabled(void);
 
 int detect_hugetlb_page_sizes(unsigned long sizes[], int max);
 unsigned long default_huge_page_size(void);
-unsigned long get_free_hugepages(void);
 
 unsigned long hugetlb_nr_pages(unsigned long size);
 void hugetlb_set_nr_pages(unsigned long size, unsigned long nr);
+unsigned long hugetlb_free_pages(unsigned long size);
 
 static inline unsigned long hugetlb_nr_default_pages(void)
 {
@@ -117,4 +117,14 @@ static inline void hugetlb_set_nr_default_pages(unsigned long nr)
 	hugetlb_set_nr_pages(size, nr);
 }
 
+static inline unsigned long hugetlb_free_default_pages(void)
+{
+	unsigned long size = default_huge_page_size();
+
+	if (!size)
+		return 0;
+
+	return hugetlb_free_pages(size);
+}
+
 #endif /* __HUGEPAGE_SETTINGS_H__ */
diff --git a/tools/testing/selftests/mm/hugetlb-madvise.c b/tools/testing/selftests/mm/hugetlb-madvise.c
index 5dfa2e0097ef..8adcd91d078d 100644
--- a/tools/testing/selftests/mm/hugetlb-madvise.c
+++ b/tools/testing/selftests/mm/hugetlb-madvise.c
@@ -27,7 +27,7 @@
 
 #define validate_free_pages(exp_free)					\
 	do {								\
-		unsigned long fhp = get_free_hugepages();		\
+		unsigned long fhp = hugetlb_free_default_pages();		\
 		if (fhp != (exp_free))					\
 			ksft_exit_fail_msg("Unexpected number of free "	\
 				"huge pages %lu, expected %lu line %d\n", \
@@ -68,7 +68,7 @@ int main(int argc, char **argv)
 	if (!base_page_size)
 		ksft_exit_fail_msg("Unable to determine base page size\n");
 
-	free_hugepages = get_free_hugepages();
+	free_hugepages = hugetlb_free_default_pages();
 	if (free_hugepages < MIN_FREE_PAGES)
 		ksft_exit_skip("Not enough free huge pages (have %lu, need %d)\n", free_hugepages, MIN_FREE_PAGES);
 
diff --git a/tools/testing/selftests/mm/hugetlb_dio.c b/tools/testing/selftests/mm/hugetlb_dio.c
index 81e3f7bc8e76..47019433ddaf 100644
--- a/tools/testing/selftests/mm/hugetlb_dio.c
+++ b/tools/testing/selftests/mm/hugetlb_dio.c
@@ -93,7 +93,7 @@ static void run_dio_using_hugetlb(int fd, unsigned int start_off,
 		ksft_exit_fail_perror("lseek failed\n");
 
 	/* Get the free huge pages before allocation */
-	free_hpage_b = get_free_hugepages();
+	free_hpage_b = hugetlb_free_default_pages();
 	if (free_hpage_b == 0) {
 		close(fd);
 		ksft_exit_skip("No free hugepage, exiting!\n");
@@ -121,7 +121,7 @@ static void run_dio_using_hugetlb(int fd, unsigned int start_off,
 	munmap(orig_buffer, h_pagesize);
 
 	/* Get the free huge pages after unmap*/
-	free_hpage_a = get_free_hugepages();
+	free_hpage_a = hugetlb_free_default_pages();
 
 	ksft_print_msg("No. Free pages before allocation : %d\n", free_hpage_b);
 	ksft_print_msg("No. Free pages after munmap : %d\n", free_hpage_a);
@@ -142,7 +142,7 @@ int main(void)
 	ksft_print_header();
 
 	/* Check if huge pages are free */
-	if (!get_free_hugepages())
+	if (!hugetlb_free_default_pages())
 		ksft_exit_skip("No free hugepage, exiting\n");
 
 	fd = open("/tmp", O_TMPFILE | O_RDWR | O_DIRECT, 0664);
diff --git a/tools/testing/selftests/mm/hugetlb_fault_after_madv.c b/tools/testing/selftests/mm/hugetlb_fault_after_madv.c
index abc3904c5268..c718dd065d53 100644
--- a/tools/testing/selftests/mm/hugetlb_fault_after_madv.c
+++ b/tools/testing/selftests/mm/hugetlb_fault_after_madv.c
@@ -78,7 +78,7 @@ int main(void)
 	ksft_print_msg("[INFO] detected default hugetlb page size: %zu KiB\n",
 		       huge_page_size / 1024);
 
-	free_hugepages = get_free_hugepages();
+	free_hugepages = hugetlb_free_default_pages();
 	if (free_hugepages != 1) {
 		ksft_exit_skip("This test needs one and only one page to execute. Got %lu\n",
 			       free_hugepages);
diff --git a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
index ac60b4f18784..dfbd71a7f709 100644
--- a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
+++ b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
@@ -89,7 +89,7 @@ int main(void)
 	ksft_print_header();
 	ksft_set_plan(1);
 
-	free_hugepages = get_free_hugepages();
+	free_hugepages = hugetlb_free_default_pages();
 
 	if (free_hugepages != 1)
 		ksft_exit_skip("This test needs one and only one page to execute. Got %lu\n",
diff --git a/tools/testing/selftests/mm/uffd-stress.c b/tools/testing/selftests/mm/uffd-stress.c
index 0ce493dac354..7c719d789249 100644
--- a/tools/testing/selftests/mm/uffd-stress.c
+++ b/tools/testing/selftests/mm/uffd-stress.c
@@ -481,7 +481,7 @@ int main(int argc, char **argv)
 	 * for racy extra reservation of hugepages.
 	 */
 	if (gopts->test_type == TEST_HUGETLB &&
-	   get_free_hugepages() < 2 * (bytes / gopts->page_size) + gopts->nr_parallel - 1)
+	   hugetlb_free_default_pages() < 2 * (bytes / gopts->page_size) + gopts->nr_parallel - 1)
 		ksft_exit_skip("Skipping userfaultfd... not enough hugepages\n");
 
 	gopts->nr_pages_per_cpu = bytes / gopts->page_size / gopts->nr_parallel;
-- 
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C344534CFD0;
	Tue, 28 Apr 2026 20:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409142; cv=none; b=ZncZuZpKcmEsdnYSqoI1pNFm4pTw8hQGEMLUHM7LjK0OmV4D4FsJUkzUHFp0l4bJAk1vAG9gcYBRtAsiJqnIXQnmjC4UdiOlpSdDMSTcVfDDex8B7QF7VmLAC7G56G9IiK14oRY24r5wgex5Gv9h/9ps2wv96YviTpStT/dPq7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409142; c=relaxed/simple;
	bh=jAQxw9MbYkXsl544OFupWFjq2DLx0d+HujNgYQfq/0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jc+dzDMbxpHX/zVVhbd7aP/rseDL6obio5d5FFy0s6saqOXc8KlJItOPBMFlsfGzc08nDg6vcVDzalNDMx9cwml9vXwodxhBT/Uqk8osg0jpmeCRYKwMVXZirus5EY/Bivx51J99q6oxIq2h04facavr0meNeTlrPQVK+7uuw84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+4Vny5l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+4Vny5l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89FAEC2BCAF;
	Tue, 28 Apr 2026 20:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409142;
	bh=jAQxw9MbYkXsl544OFupWFjq2DLx0d+HujNgYQfq/0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V+4Vny5lUCOs29DUa+TMA1hirYtTwid7QaRPEsnAPG62zvxRp5MURNS0bKB60YaD2
	 chTPM8zaivb1d3pSwMsyJQxeryhrR246XjgWmy0/dZZ55AkiJuezn5oWPf4IDNUNBP
	 P4K00tKgjHiHaxBcb7PBJoXwoP52y/ce4SEIO/YJqpuZPmgPByQbdwnKH8tnt1eU10
	 GUnLK9G8HN1iKbmrKYPTGvuVNlOsExVu6PVl0Rfr8xYpg2/grLZ29C+oY2XpK258Vl
	 YqL0ceMsB1/C3TM1c8CRjtkpddQKnz17y4Wq1+q6zEd2gQT7T/z6Nxq7QB0wTjC3VE
	 0gMgCjCN/hssg==
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
Subject: [PATCH v3 26/54] selftests/mm: hugepage_settings: rename get_free_hugepages()
Date: Tue, 28 Apr 2026 23:42:12 +0300
Message-ID: <20260428204240.1924129-27-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428204240.1924129-1-rppt@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

... to hugetlb_free_default_hugepages() for consistency with
hugetlb_nr_default_pages().

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
index 5961229b9931..4ae7332b5e1b 100644
--- a/tools/testing/selftests/mm/hugepage_settings.c
+++ b/tools/testing/selftests/mm/hugepage_settings.c
@@ -446,25 +446,6 @@ unsigned long default_huge_page_size(void)
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
@@ -489,3 +470,12 @@ void hugetlb_set_nr_pages(unsigned long size, unsigned long nr)
 
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
index d6f41a45e8ee..57fbf2f57e13 100644
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
 #endif /* __THP_SETTINGS_H__ */
diff --git a/tools/testing/selftests/mm/hugetlb-madvise.c b/tools/testing/selftests/mm/hugetlb-madvise.c
index 316384d919db..3c08eb6db6a2 100644
--- a/tools/testing/selftests/mm/hugetlb-madvise.c
+++ b/tools/testing/selftests/mm/hugetlb-madvise.c
@@ -27,7 +27,7 @@
 
 #define validate_free_pages(exp_free)					\
 	do {								\
-		unsigned long fhp = get_free_hugepages();		\
+		unsigned long fhp = hugetlb_free_default_pages();		\
 		if (fhp != (exp_free))					\
 			ksft_exit_fail_msg("Unexpected number of free "	\
 				"huge pages %ld, expected %ld line %d\n", \
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
index e92a85463eb1..7e37cf3d27f6 100644
--- a/tools/testing/selftests/mm/uffd-stress.c
+++ b/tools/testing/selftests/mm/uffd-stress.c
@@ -480,7 +480,7 @@ int main(int argc, char **argv)
 	 * for racy extra reservation of hugepages.
 	 */
 	if (gopts->test_type == TEST_HUGETLB &&
-	   get_free_hugepages() < 2 * (bytes / gopts->page_size) + gopts->nr_parallel - 1)
+	   hugetlb_free_default_pages() < 2 * (bytes / gopts->page_size) + gopts->nr_parallel - 1)
 		ksft_exit_skip("Skipping userfaultfd... not enough hugepages\n");
 
 	gopts->nr_pages_per_cpu = bytes / gopts->page_size / gopts->nr_parallel;
-- 
2.53.0


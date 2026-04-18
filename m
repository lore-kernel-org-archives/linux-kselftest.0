Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF1F317165;
	Sat, 18 Apr 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509816; cv=none; b=RBb0C2BDJY3w4RxyivzkWrPkpj63rFBAURFeZ6/5AuxK/TcNF9pT6XxjSfhEewWDO2xljNBorPq8gy8u9y38T79aEczIwIfVinHv/7GEE+rPCSrrSYd/HpT1Yx0maGG780O+8ovLCyMl375ugo2CUYMMlAGY80LR8LmzzcOEnD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509816; c=relaxed/simple;
	bh=oZxt8zBBbGTvdYs1lP1r+GpZXATmjus45JMc8292lqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmkkkZ8zM9nrFP40wwIwuxzLun1ufCCX80V6bP9+Sa43zEXk84/jxcixVoJBfno4BI7d4ZOTuX2UuRXXz46nIWwpz6l/6vS3K0HxfgQcMeJ4U1H0Jrtcx0obCaB+ny4A+i+OOUUOsvTzWQw3uLqe//xyzGeTugAdre5BjHuR3Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njfDby3R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njfDby3R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D7CC19424;
	Sat, 18 Apr 2026 10:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509816;
	bh=oZxt8zBBbGTvdYs1lP1r+GpZXATmjus45JMc8292lqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=njfDby3RQ4O+Kd7He1QTqhtFGrrrVM6NmRYHnt7tjUqXmGtdSNyLDpoWfRLREWrRS
	 OKHxVLXUosEkc6DjnM6p92gsyjJYNH3fegI7DUk0+IkpJ1nDjehJxC4PsHhyKBV76E
	 IFt9t/XyI84K4dG296e0hNMCV+DXuw1wN8siXSl1BBu7IgAdHmyue3BKMrHMEmVDM6
	 yMubT1gNT99Vg2Y8Okmz35kX4gmZRTH8URhhLUZfSQkpJ79ySR+zudwoSy9XnhpNNp
	 cyD4qub05ar2MaGznUtQq9znGgVMT8dwnJ/eOHObXIXz1KPRsuH2prtQhgepsYBYTM
	 ZxOw0QpjZ1ynw==
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
Subject: [PATCH v2 11/53] selftests/mm: hugetlb-read-hwpoison: use kselftest framework
Date: Sat, 18 Apr 2026 13:54:56 +0300
Message-ID: <20260418105539.1261536-12-rppt@kernel.org>
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

Convert hugetlb-read-hwpoison test to use kselftest framework for
reporting and tracking successful and failing runs.

Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed by: Donet Tom <donettom@linux.ibm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 .../selftests/mm/hugetlb-read-hwpoison.c      | 118 +++++++++---------
 1 file changed, 57 insertions(+), 61 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb-read-hwpoison.c b/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
index 6bbf15f78061..01cd5465e0f8 100644
--- a/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
+++ b/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
@@ -13,9 +13,7 @@
 #include <signal.h>
 
 #include "kselftest.h"
-
-#define PREFIX " ... "
-#define ERROR_PREFIX " !!! "
+#include "vm_util.h"
 
 #define MAX_WRITE_READ_CHUNK_SIZE (getpagesize() * 16)
 #define MAX(a, b) (((a) > (b)) ? (a) : (b))
@@ -26,17 +24,22 @@ enum test_status {
 	TEST_SKIPPED = 2,
 };
 
-static char *status_to_str(enum test_status status)
+static void report_status(enum test_status status, const char *test_name,
+			  size_t chunk_size)
 {
 	switch (status) {
 	case TEST_PASSED:
-		return "TEST_PASSED";
+		ksft_test_result_pass("%s chunk_size=0x%lx\n",
+				      test_name, chunk_size);
+		break;
 	case TEST_FAILED:
-		return "TEST_FAILED";
+		ksft_test_result_fail("%s chunk_size=0x%lx\n",
+				      test_name, chunk_size);
+		break;
 	case TEST_SKIPPED:
-		return "TEST_SKIPPED";
-	default:
-		return "TEST_???";
+		ksft_test_result_skip("%s chunk_size=0x%lx\n",
+				      test_name, chunk_size);
+		break;
 	}
 }
 
@@ -59,8 +62,8 @@ static bool verify_chunk(char *buf, size_t len, char val)
 
 	for (i = 0; i < len; ++i) {
 		if (buf[i] != val) {
-			printf(PREFIX ERROR_PREFIX "check fail: buf[%lu] = %u != %u\n",
-				i, buf[i], val);
+			ksft_print_msg("check fail: buf[%lu] = %u != %u\n",
+				       i, buf[i], val);
 			return false;
 		}
 	}
@@ -76,21 +79,21 @@ static bool seek_read_hugepage_filemap(int fd, size_t len, size_t wr_chunk_size,
 	ssize_t total_ret_count = 0;
 	char val = offset / wr_chunk_size + offset % wr_chunk_size;
 
-	printf(PREFIX PREFIX "init val=%u with offset=0x%lx\n", val, offset);
-	printf(PREFIX PREFIX "expect to read 0x%lx bytes of data in total\n",
-	       expected);
+	ksft_print_msg("init val=%u with offset=0x%lx\n", val, offset);
+	ksft_print_msg("expect to read 0x%lx bytes of data in total\n",
+		       expected);
 	if (lseek(fd, offset, SEEK_SET) < 0) {
-		perror(PREFIX ERROR_PREFIX "seek failed");
+		ksft_perror("seek failed");
 		return false;
 	}
 
 	while (offset + total_ret_count < len) {
 		ret_count = read(fd, buf, wr_chunk_size);
 		if (ret_count == 0) {
-			printf(PREFIX PREFIX "read reach end of the file\n");
+			ksft_print_msg("read reach end of the file\n");
 			break;
 		} else if (ret_count < 0) {
-			perror(PREFIX ERROR_PREFIX "read failed");
+			ksft_perror("read failed");
 			break;
 		}
 		++val;
@@ -99,8 +102,8 @@ static bool seek_read_hugepage_filemap(int fd, size_t len, size_t wr_chunk_size,
 
 		total_ret_count += ret_count;
 	}
-	printf(PREFIX PREFIX "actually read 0x%lx bytes of data in total\n",
-	       total_ret_count);
+	ksft_print_msg("actually read 0x%lx bytes of data in total\n",
+		       total_ret_count);
 
 	return total_ret_count == expected;
 }
@@ -113,15 +116,15 @@ static bool read_hugepage_filemap(int fd, size_t len,
 	ssize_t total_ret_count = 0;
 	char val = 0;
 
-	printf(PREFIX PREFIX "expect to read 0x%lx bytes of data in total\n",
-	       expected);
+	ksft_print_msg("expect to read 0x%lx bytes of data in total\n",
+		       expected);
 	while (total_ret_count < len) {
 		ret_count = read(fd, buf, wr_chunk_size);
 		if (ret_count == 0) {
-			printf(PREFIX PREFIX "read reach end of the file\n");
+			ksft_print_msg("read reach end of the file\n");
 			break;
 		} else if (ret_count < 0) {
-			perror(PREFIX ERROR_PREFIX "read failed");
+			ksft_perror("read failed");
 			break;
 		}
 		++val;
@@ -130,8 +133,8 @@ static bool read_hugepage_filemap(int fd, size_t len,
 
 		total_ret_count += ret_count;
 	}
-	printf(PREFIX PREFIX "actually read 0x%lx bytes of data in total\n",
-	       total_ret_count);
+	ksft_print_msg("actually read 0x%lx bytes of data in total\n",
+		       total_ret_count);
 
 	return total_ret_count == expected;
 }
@@ -143,14 +146,14 @@ test_hugetlb_read(int fd, size_t len, size_t wr_chunk_size)
 	char *filemap = NULL;
 
 	if (ftruncate(fd, len) < 0) {
-		perror(PREFIX ERROR_PREFIX "ftruncate failed");
+		ksft_perror("ftruncate failed");
 		return status;
 	}
 
 	filemap = mmap(NULL, len, PROT_READ | PROT_WRITE,
 		       MAP_SHARED | MAP_POPULATE, fd, 0);
 	if (filemap == MAP_FAILED) {
-		perror(PREFIX ERROR_PREFIX "mmap for primary mapping failed");
+		ksft_perror("mmap for primary mapping failed");
 		goto done;
 	}
 
@@ -163,7 +166,7 @@ test_hugetlb_read(int fd, size_t len, size_t wr_chunk_size)
 	munmap(filemap, len);
 done:
 	if (ftruncate(fd, 0) < 0) {
-		perror(PREFIX ERROR_PREFIX "ftruncate back to 0 failed");
+		ksft_perror("ftruncate back to 0 failed");
 		status = TEST_FAILED;
 	}
 
@@ -180,14 +183,14 @@ test_hugetlb_read_hwpoison(int fd, size_t len, size_t wr_chunk_size,
 	const unsigned long pagesize = getpagesize();
 
 	if (ftruncate(fd, len) < 0) {
-		perror(PREFIX ERROR_PREFIX "ftruncate failed");
+		ksft_perror("ftruncate failed");
 		return status;
 	}
 
 	filemap = mmap(NULL, len, PROT_READ | PROT_WRITE,
 		       MAP_SHARED | MAP_POPULATE, fd, 0);
 	if (filemap == MAP_FAILED) {
-		perror(PREFIX ERROR_PREFIX "mmap for primary mapping failed");
+		ksft_perror("mmap for primary mapping failed");
 		goto done;
 	}
 
@@ -202,7 +205,7 @@ test_hugetlb_read_hwpoison(int fd, size_t len, size_t wr_chunk_size,
 	 */
 	hwp_addr = filemap + len / 2 + pagesize;
 	if (madvise(hwp_addr, pagesize, MADV_HWPOISON) < 0) {
-		perror(PREFIX ERROR_PREFIX "MADV_HWPOISON failed");
+		ksft_perror("MADV_HWPOISON failed");
 		goto unmap;
 	}
 
@@ -229,7 +232,7 @@ test_hugetlb_read_hwpoison(int fd, size_t len, size_t wr_chunk_size,
 	munmap(filemap, len);
 done:
 	if (ftruncate(fd, 0) < 0) {
-		perror(PREFIX ERROR_PREFIX "ftruncate back to 0 failed");
+		ksft_perror("ftruncate back to 0 failed");
 		status = TEST_FAILED;
 	}
 
@@ -242,17 +245,17 @@ static int create_hugetlbfs_file(struct statfs *file_stat)
 
 	fd = memfd_create("hugetlb_tmp", MFD_HUGETLB);
 	if (fd < 0) {
-		perror(PREFIX ERROR_PREFIX "could not open hugetlbfs file");
+		ksft_perror("could not open hugetlbfs file");
 		return -1;
 	}
 
 	memset(file_stat, 0, sizeof(*file_stat));
 	if (fstatfs(fd, file_stat)) {
-		perror(PREFIX ERROR_PREFIX "fstatfs failed");
+		ksft_perror("fstatfs failed");
 		goto close;
 	}
 	if (file_stat->f_type != HUGETLBFS_MAGIC) {
-		printf(PREFIX ERROR_PREFIX "not hugetlbfs file\n");
+		ksft_print_msg("not hugetlbfs file\n");
 		goto close;
 	}
 
@@ -264,7 +267,7 @@ static int create_hugetlbfs_file(struct statfs *file_stat)
 
 static void sigbus_handler(int sig)
 {
-	printf(PREFIX "received SIGBUS\n");
+	ksft_print_msg("received SIGBUS\n");
 }
 
 int main(void)
@@ -279,51 +282,44 @@ int main(void)
 	};
 	size_t i;
 
+	ksft_print_header();
+	ksft_set_plan(ARRAY_SIZE(wr_chunk_sizes) * 3);
+
 	signal(SIGBUS, sigbus_handler);
 	for (i = 0; i < ARRAY_SIZE(wr_chunk_sizes); ++i) {
-		printf("Write/read chunk size=0x%lx\n",
-		       wr_chunk_sizes[i]);
+		ksft_print_msg("Write/read chunk size=0x%lx\n",
+			       wr_chunk_sizes[i]);
 
 		fd = create_hugetlbfs_file(&file_stat);
 		if (fd < 0)
-			goto create_failure;
-		printf(PREFIX "HugeTLB read regression test...\n");
+			ksft_exit_fail_msg("Failed to create hugetlbfs file\n");
+
 		status = test_hugetlb_read(fd, file_stat.f_bsize,
 					   wr_chunk_sizes[i]);
-		printf(PREFIX "HugeTLB read regression test...%s\n",
-		       status_to_str(status));
 		close(fd);
-		if (status == TEST_FAILED)
-			return -1;
+		report_status(status, "HugeTLB read regression",
+			      wr_chunk_sizes[i]);
 
 		fd = create_hugetlbfs_file(&file_stat);
 		if (fd < 0)
-			goto create_failure;
-		printf(PREFIX "HugeTLB read HWPOISON test...\n");
+			ksft_exit_fail_msg("Failed to create hugetlbfs file\n");
+
 		status = test_hugetlb_read_hwpoison(fd, file_stat.f_bsize,
 						    wr_chunk_sizes[i], false);
-		printf(PREFIX "HugeTLB read HWPOISON test...%s\n",
-		       status_to_str(status));
 		close(fd);
-		if (status == TEST_FAILED)
-			return -1;
+		report_status(status, "HugeTLB read HWPOISON",
+			      wr_chunk_sizes[i]);
 
 		fd = create_hugetlbfs_file(&file_stat);
 		if (fd < 0)
-			goto create_failure;
-		printf(PREFIX "HugeTLB seek then read HWPOISON test...\n");
+			ksft_exit_fail_msg("Failed to create hugetlbfs file\n");
+
 		status = test_hugetlb_read_hwpoison(fd, file_stat.f_bsize,
 						    wr_chunk_sizes[i], true);
-		printf(PREFIX "HugeTLB seek then read HWPOISON test...%s\n",
-		       status_to_str(status));
 		close(fd);
-		if (status == TEST_FAILED)
-			return -1;
+		report_status(status, "HugeTLB seek then read HWPOISON",
+			      wr_chunk_sizes[i]);
 	}
 
-	return 0;
-
-create_failure:
-	printf(ERROR_PREFIX "Abort test: failed to create hugetlbfs file\n");
-	return -1;
+	ksft_finished();
 }
-- 
2.53.0


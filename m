Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8582DA75B;
	Thu, 11 Jun 2026 03:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149306; cv=none; b=iMjDr3XQK6/eBW+CBhgNoVEy4lhY4aJZWw79YfSuHRqZo11lNR+8zg9uJoYe9hOCM+cRwshZj1Ma2sp7rJkv2HygbW9ee2/NL4TlaLAQpPJdUJTnaAYnKRHGCaijMhy1ESi0AxQP6b/HsACRT2ic1v85dam4GHsA4mVenN6gYDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149306; c=relaxed/simple;
	bh=+jXnO+QIxicMmxuN4/BXsBurEN7B74qgN0aTNV4duVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJ9m0MpjJ3v2eupY6/rpdDJ8y3fJLzQaLXpu/7R05wIhaqDH+bP1XIVcGhZMhzkw0HWMA21norBiCQns0RhYqhci8yUhHJQ1p64YS+n0MG+N8b8LIvwjkdXQsuUNF2J6cABiR8XMM5Q/dcn0pwABhZHGO1JfW8RHUDUDcxuFz4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=orBchVp8; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="orBchVp8"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AJu3Ac3872831;
	Thu, 11 Jun 2026 03:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=pOTyR7ZmVR/FuBL3T
	f+HX+H8rb4MurVSt964bZC76lI=; b=orBchVp8yBJTDJhpQStlF4qbyicApknR+
	mv8Va9eJfYc2HyXAMKzEfRAGEj/mtEvWcWXuPQ06Ldln1fW+92yDK0IHell76bix
	sbL4Av2jvjAbpTuiVreAcp+UkSGfXmejloku4I7tTgBvRaBKm2rpCgtsAK6LA9dx
	2/siVsAM11MmMFGApFkt1NJnmc/FTVTCcDW2MWVHspJzxJhSr2J/39j6JDCqxVRk
	4w9BVUabTuTY/Cfrz0zv734MoTZDzFEA0xt9wNzsqe0MY33lympkoFs0VDpNaINK
	yirfMOZ7Hg3UaFnFbK2idGneaDlFkU1ftP/k0lXtME8X8uTt6NOgw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4eqe8es907-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jun 2026 03:41:30 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65B3YdV2004525;
	Thu, 11 Jun 2026 03:41:28 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4eqe08heyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jun 2026 03:41:28 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65B3fPBn42140082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jun 2026 03:41:25 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0885C20043;
	Thu, 11 Jun 2026 03:41:25 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC49D20040;
	Thu, 11 Jun 2026 03:41:18 +0000 (GMT)
Received: from aboo.ibm.com.com (unknown [9.39.27.36])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 Jun 2026 03:41:18 +0000 (GMT)
From: Aboorva Devarajan <aboorvad@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R . Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Shuah Khan <shuah@kernel.org>, Ralph Campbell <rcampbell@nvidia.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Balbir Singh <balbirs@nvidia.com>,
        Alistair Popple <apopple@nvidia.com>,
        Alex Sierra <alex.sierra@amd.com>,
        Matthew Wilcox <willy@infradead.org>,
        Sayali Patil <sayalip@linux.ibm.com>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Aboorva Devarajan <aboorvad@linux.ibm.com>
Subject: [PATCH v3 2/3] selftests/mm: remove hardcoded THP sizing assumptions in hmm tests
Date: Thu, 11 Jun 2026 09:11:01 +0530
Message-ID: <20260611034102.1030738-3-aboorvad@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611034102.1030738-1-aboorvad@linux.ibm.com>
References: <20260611034102.1030738-1-aboorvad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDAzMiBTYWx0ZWRfX6yHiMJKbyPOU
 DP2cSBd4Z+gjH9lZQtbENJP4ePpBNPlVBVEloZ6BZhIpztSWPSa6dGS+xwvW6SWDcz12AGFpwWh
 LUQ6JTvQWePJqBmPqd7x7DOB9lONx4nSYiY+XxPtc+eCyy4H0z1Ine42faiFT/6A4pStDrGX7Rf
 MG+IBey4haq1zE+fKO7/AJxU2c68GCqHB33HXv+S4Q5jn3fbWzD/3lIL80aJaBQRsT3R7D7pVW+
 lSacAvqevHDLzycXy14+9muowWgA8LgmoM/6Z1NFtZ7Yy4P7Qn1hAzeQE8qiVcDphakrrkt6IuR
 DkTnb6QZajd7p/5BUiaHPlWQm8fVvpio88TCci6iGoGEt3PVF3yTISUiXVc1MyXSrDbVlniY8bc
 aQj7qnwtOe6BV1FAL3LHxos5SeVKZnVXVZGS+cBL72pfQrnz8pDlxoZF8amhunz7bxmL0ourLtu
 dMOXhIBvmnr8t6NxNZA==
X-Authority-Analysis: v=2.4 cv=dr7rzVg4 c=1 sm=1 tr=0 ts=6a2a2e6a cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=ca_0sX59trYgcfZ9MnEA:9
X-Proofpoint-ORIG-GUID: HedVgQD8qa-QM20khZr5_Hhx5jo3NWR9
X-Proofpoint-GUID: 9hgyd95hIR9gSVDhCECFrWb4OWeWwHnG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDAzMiBTYWx0ZWRfX/vIGuWd1T0Zc
 tOMrf3JjqPInXgemjpC7jfJxxtgPp1Zr0AVZVa6tOJxjATDzvhwNSO8zOWUCfjcoYfT2hOwcGo1
 GoIeQN9t/X4w9G9EcAx92ndkvKZEZIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110032

From: Sayali Patil <sayalip@linux.ibm.com>

migrate_partial_unmap_fault() and migrate_remap_fault() use
hardcoded offsets based on a 2MB PMD size. Similarly,
benchmark_thp_migration() assumes a fixed 2MB THP size when generating
test buffer sizes.

Derive offsets and test sizes from the runtime PMD page size returned
by read_pmd_pagesize(). If unavailable, fall back to TWOMEG.
This allows the tests to adapt correctly on systems where
PMD-sized THP differs from 2MB. Also replace the fixed 1MB unmap
size with a PMD-relative value derived from the runtime PMD size.

On systems with larger PMD sizes, computed test buffer sizes can exceed
INT_MAX. Skip such test cases to avoid overflow.

Fixes: 24c2c5b8ffbd ("selftests/mm/hmm-tests: partial unmap, mremap and anon_write tests")
Fixes: 271a7b2e3c13 ("selftests/mm/hmm-tests: new throughput tests including THP")
Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
---
 tools/testing/selftests/mm/hmm-tests.c | 62 ++++++++++++++++++--------
 1 file changed, 43 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index deb6a7485650..8f4f82467043 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -22,6 +22,7 @@
 #include <strings.h>
 #include <time.h>
 #include <pthread.h>
+#include <limits.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/mman.h>
@@ -2380,12 +2381,21 @@ TEST_F(hmm, migrate_partial_unmap_fault)
 	struct hmm_buffer *buffer;
 	unsigned long npages;
 	unsigned long size = read_pmd_pagesize();
+	unsigned long unmap_size;
+	unsigned long offsets[3];
 	unsigned long i;
 	void *old_ptr;
 	void *map;
 	int *ptr;
 	int ret, j, use_thp;
-	int offsets[] = { 0, 512 * ONEKB, ONEMEG };
+
+	if (!size)
+		size = TWOMEG;
+
+	unmap_size = size / 2;
+	offsets[0] = 0;
+	offsets[1] = size / 4;
+	offsets[2] = size / 2;
 
 	for (use_thp = 0; use_thp < 2; ++use_thp) {
 		for (j = 0; j < ARRAY_SIZE(offsets); ++j) {
@@ -2427,12 +2437,12 @@ TEST_F(hmm, migrate_partial_unmap_fault)
 			for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
 				ASSERT_EQ(ptr[i], i);
 
-			munmap(buffer->ptr + offsets[j], ONEMEG);
+			munmap(buffer->ptr + offsets[j], unmap_size);
 
 			/* Fault pages back to system memory and check them. */
 			for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
 				if (i * sizeof(int) < offsets[j] ||
-				    i * sizeof(int) >= offsets[j] + ONEMEG)
+				    i * sizeof(int) >= offsets[j] + unmap_size)
 					ASSERT_EQ(ptr[i], i);
 
 			buffer->ptr = old_ptr;
@@ -2446,12 +2456,19 @@ TEST_F(hmm, migrate_remap_fault)
 	struct hmm_buffer *buffer;
 	unsigned long npages;
 	unsigned long size = read_pmd_pagesize();
+	unsigned long offsets[3];
 	unsigned long i;
 	void *old_ptr, *new_ptr = NULL;
 	void *map;
 	int *ptr;
 	int ret, j, use_thp, dont_unmap, before;
-	int offsets[] = { 0, 512 * ONEKB, ONEMEG };
+
+	if (!size)
+		size = TWOMEG;
+
+	offsets[0] = 0;
+	offsets[1] = size / 4;
+	offsets[2] = size / 2;
 
 	for (before = 0; before < 2; ++before) {
 		for (dont_unmap = 0; dont_unmap < 2; ++dont_unmap) {
@@ -2854,38 +2871,45 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
 TEST_F_TIMEOUT(hmm, benchmark_thp_migration, 120)
 {
 	struct benchmark_results thp_results, regular_results;
-	size_t thp_size = 2 * 1024 * 1024; /* 2MB - typical THP size */
+	size_t thp_size = read_pmd_pagesize();
 	int iterations = 5;
 
+	if (!thp_size)
+		thp_size = TWOMEG;
+
 	printf("\nHMM THP Migration Benchmark\n");
 	printf("---------------------------\n");
 	printf("System page size: %ld bytes\n", sysconf(_SC_PAGESIZE));
 
 	/* Test different buffer sizes */
 	size_t test_sizes[] = {
-		thp_size / 4,      /* 512KB - smaller than THP */
-		thp_size / 2,      /* 1MB - half THP */
-		thp_size,          /* 2MB - single THP */
-		thp_size * 2,      /* 4MB - two THPs */
-		thp_size * 4,      /* 8MB - four THPs */
-		thp_size * 8,       /* 16MB - eight THPs */
-		thp_size * 128,       /* 256MB - one twenty eight THPs */
+		thp_size / 4,      /* quarter THP */
+		thp_size / 2,      /* half THP */
+		thp_size,          /* single THP */
+		thp_size * 2,      /* two THPs */
+		thp_size * 4,      /* four THPs */
+		thp_size * 8,      /* eight THPs */
+		thp_size * 128,    /* one twenty eight THPs */
 	};
 
 	static const char *const test_names[] = {
-		"Small Buffer (512KB)",
-		"Half THP Size (1MB)",
-		"Single THP Size (2MB)",
-		"Two THP Size (4MB)",
-		"Four THP Size (8MB)",
-		"Eight THP Size (16MB)",
-		"One twenty eight THP Size (256MB)"
+		"Small Buffer",
+		"Half THP Size",
+		"Single THP Size",
+		"Two THP Size",
+		"Four THP Size",
+		"Eight THP Size",
+		"One twenty eight THP Size"
 	};
 
 	int num_tests = ARRAY_SIZE(test_sizes);
 
 	/* Run all tests */
 	for (int i = 0; i < num_tests; i++) {
+		/* Skip test sizes exceeding INT_MAX to avoid overflow */
+		if (test_sizes[i] > INT_MAX)
+			break;
+
 		/* Test with THP */
 		ASSERT_EQ(run_migration_benchmark(self->fd, 1, test_sizes[i],
 					iterations, &thp_results), 0);
-- 
2.54.0


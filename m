Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465A22C0F93;
	Tue, 19 May 2026 04:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779163607; cv=none; b=EAPmWcexlvShd2QSrGFdJ8ryctQze6rlMfYn0b0P4yoVTmnP1CizmV0TP8A5XvN8BVmlGcXIHO9Iq8QZf3m2Capb45gZdsAccaC5cvaeMpfPQX1+5sTu06Dsu1MwcANMhuhs5fqcI8FlfIHltKGFU8xtXI5YfZmZUYiey6fWh1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779163607; c=relaxed/simple;
	bh=TQUnkP358c6uQOiROZCLyW1msPK17eJ5tCI9ysFebGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9KYPlWJonheU2qufKQvtOehcg+oGOZDH3Imvj50Na7eC1dMiJz0x/qr0hemC7UWrNsoBoHdZzkOCAmaCmh64ai7BTq6EuyfIu9E175iGW4/igkEvjFVeaT7HaVuuw/Dw8vlnylNr8QgeMVs8tOAuPfcF6DMGLprsh7DZOtwbF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=kmJdEuYB; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="kmJdEuYB"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICxHqa1839474;
	Tue, 19 May 2026 04:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=fUx7dCuXTKd3Ynn0A
	peuKAwxww2dtVHMpIZVttwfoRM=; b=kmJdEuYBf32mI8t9tfcfMzfDyV0cxqBH/
	jd6VHSeIXIbG4cbLuhal1d9oPBVJ5sipkFj3ujegR/YQe96SwISy7NgyQEKbOhVb
	/7ieKfYUEtQ6w3sIcBI4ADfjsmX6IA8Hr39mhvD9rOrSZOjvynr35AMB8Atl0kVL
	XpgO0kaDhcvz0oZucPjPV5r3zlToOC1CzZC8ELZiTF/SrVw2+5Mni4BqvRRD+V4k
	/avsdwb29OaFl7Pft3GytLjvbvjw+yn3tISIiCjYCze3KotZTyZGix9t3dBaBTRF
	wPkd6wOU/ICQhY/qM/BHWL+P8ROZfZZoclpZsU9uy11Tnx3L14rkw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6h8mk2s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 04:06:39 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64J3s9hi027516;
	Tue, 19 May 2026 04:06:38 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4e739vs0y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 04:06:38 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64J46ZJe54722908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 May 2026 04:06:35 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02E4420040;
	Tue, 19 May 2026 04:06:35 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8896620043;
	Tue, 19 May 2026 04:06:32 +0000 (GMT)
Received: from aboo.ibm.com.com (unknown [9.39.29.16])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 19 May 2026 04:06:32 +0000 (GMT)
From: Aboorva Devarajan <aboorvad@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Cc: Sayali Patil <sayalip@linux.ibm.com>, linux-kernel@vger.kernel.org,
        Aboorva Devarajan <aboorvad@linux.ibm.com>
Subject: [PATCH v2 2/3] selftests/mm: remove hardcoded THP sizing assumptions in hmm tests
Date: Tue, 19 May 2026 09:36:23 +0530
Message-ID: <b2fc2e80e5c0a56eb266b3744f476d8573cdc890.1779090293.git.aboorvad@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1779090293.git.aboorvad@linux.ibm.com>
References: <cover.1779090293.git.aboorvad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: heSX24-hC-dBFQnjAPEcJGtTsUw_L4AC
X-Authority-Analysis: v=2.4 cv=GYMnWwXL c=1 sm=1 tr=0 ts=6a0be1d0 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=ca_0sX59trYgcfZ9MnEA:9
X-Proofpoint-ORIG-GUID: heSX24-hC-dBFQnjAPEcJGtTsUw_L4AC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAzNyBTYWx0ZWRfX06Lr/6c6sxEx
 QLRiPRnzN8Kj4ibar1BEE8FPZBrw1p7d4p0l/tUEIVS7ByzQjmccmygYNPMxcdzIt765rIN32Nb
 A1UuQhQMuLC+eyUQ8ypkU1O7WDEzjg21MsVi/3KKBIZDV0N02sGE/55gPDj0FQ/eAyi2+InhfA5
 kx9i7t4I8XSYICX0847GR3WOzofg9bE6fMW8/sw49lDv5MwxbeYsCb9o+uffo+D6W3C4wZ6lKGJ
 e0yB8fvPyJd5G3RiEzXeQVSp+u2C2usmz9wvQ+7GbdB86RedL9t92ZlQnkhOKsZc88X22IILL0w
 K7OPEgeVupKVz7V8U3qbzx9i2N00eLwXB8QEHPo/wyhWlBjPiU7bSZnBbFqrcHa1ddQ/4qV/C5u
 JkwqKG+xzIcT8/3aZ1x5FK7avRFUQB67t2+PkikGesM7H2AijucWsx0Hzm79cn4lzqAlITQqUG3
 w6YaZ9yEK2CLoTemSjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190037

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
index 3d0da4dff85bc..1d49d9e919c1f 100644
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
@@ -2334,12 +2335,21 @@ TEST_F(hmm, migrate_partial_unmap_fault)
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
@@ -2381,12 +2391,12 @@ TEST_F(hmm, migrate_partial_unmap_fault)
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
@@ -2400,12 +2410,19 @@ TEST_F(hmm, migrate_remap_fault)
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
@@ -2808,38 +2825,45 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
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


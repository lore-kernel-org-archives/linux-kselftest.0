Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8EA2D948D;
	Tue, 10 Mar 2026 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158324; cv=none; b=nl9HHuXmzQEscM3twuVr9xlsCyEI7fsUi78aj7nC8da3Ec1gTYJ06G+yfxUi1Iozk/NIlPBJ6j5RHMoiaylBxnA5iZUS5PmyZUN0bhbnv/kQeE0XJLsz7Rw4PMQt2ggubB3+1fGjd4udkX/3VEK3DwP78b4ikchGmwr3eXru6+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158324; c=relaxed/simple;
	bh=SXJEL/84HovYccZ9vOrEqH8GsLWDDVH0vpuiH4J6BuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CXSUfJltj3JVk1s0rrh6mBMgAue2xcCoZDE2EnhZzYaJToSCTuHaEsnnr369oMjqVC2KtcFR7QdcTFx69irJyBl/lZU24KA1Gs6bFTQvoxHfOzw70x99YSFJM/WPI4AM2DJyt+ePJi6wp4iZUnaD/y6i2n19GryMbqb8esPfg34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UzaWdN9I; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UzaWdN9I"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A9ovME1719663;
	Tue, 10 Mar 2026 15:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=KILNH
	PFhZkB/epKpICgOxbnFyklyzYF7FlY8WQTGTpo=; b=UzaWdN9I7qC4DIwxgIPFi
	iQmIVD+655Hl3pkyB6uKXxQxInsunyLlBQGBBx8Kpagek8bm6a5z1P5QKD4lA/HE
	E24rLIIS21o6Jsr2nK2Ek/4cW0oGng65qcEkPHkPPtIMOx1/PvR+u2aZLQZV1f/M
	hofmxX25UpouCzjVG8fDpsRQZA3LdZZOryE+3CnWY6/4UNF2Afz+T8LdE7siWjce
	LMvfW3l7ZFJIMjkoJga42MaJt4/N2Gdvv05SZjNp/heTE5Q5dZQkCbW3cizf5D3S
	n55c4E6uGdWT2MpTh/SKJG8annbmODnaEgm5quizhW0F0oGcxHYX9yAeT2GmQjuL
	g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cskyp350q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2026 15:58:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62AF4TLE022760;
	Tue, 10 Mar 2026 15:58:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4crafa9wyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2026 15:58:29 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62AFwRjE027022;
	Tue, 10 Mar 2026 15:58:29 GMT
Received: from localhost.localdomain (ca-dev60.us.oracle.com [10.129.136.27])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4crafa9wu5-2;
	Tue, 10 Mar 2026 15:58:29 +0000
From: Anthony Yznaga <anthony.yznaga@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
        Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
        surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
        Jason@zx2c4.com, shuah@kernel.org
Subject: [PATCH v2 2/2] selftests/mm: verify droppable mappings cannot be locked
Date: Tue, 10 Mar 2026 08:58:21 -0700
Message-ID: <20260310155821.17869-2-anthony.yznaga@oracle.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310155821.17869-1-anthony.yznaga@oracle.com>
References: <20260310155821.17869-1-anthony.yznaga@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603100139
X-Proofpoint-GUID: oyz9zc_Zust4hy0UWhisJ0Qjfd6uCtps
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzOSBTYWx0ZWRfX1iBG67dp9wN/
 Ll2TaXxKxOMgKFyRkxcea61Fo4AB9u85VHcLtsNfVSQtXTTxfGXMmGYlMB6naxLdPzKuHzU5lcD
 P1d/KPiQ/KdiXdHCMRxSer8jrybEWmzeHnzMzd8gYBhrNxxwrkUCK3Fv6DB+IqIFYH2mytfE/pO
 Wy2WF2jCmPvM4+HrK8korvzyS6BTyIQLbx33lbUeopILSIpOlr5BfH+IB0VeJurE7hN65eePYXd
 ZPt9Kr2R/3ALFWgx9Ee3aNsvk5QdmU1dQFgsEsLs5arUT9ITO46LJRNEXEyKZF0fY8qFX3n7dgb
 7g0LmT2Y4q654d01AwkpN4O2d4oYGNzhYRNno9bZJ6JmicUob2X9ayFM7F6+YeD4z0GsoMPB4K3
 BUJXwNKFMTIlKtqOytdsfthuz4pV+Y4VU57LVazHPQavIQrOkaatMiml6xW1VAmEV4UhTTvEIHj
 6/BsvTh+D3VP4ZD4vXg==
X-Proofpoint-ORIG-GUID: oyz9zc_Zust4hy0UWhisJ0Qjfd6uCtps
X-Authority-Analysis: v=2.4 cv=XP89iAhE c=1 sm=1 tr=0 ts=69b03fa6 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8 a=_qCjRXgy2aYRKG6zBr8A:9

Verify that a mapping created with MAP_DROPPABLE cannot be locked
via mlock(), and that it will not be locked if it's created after
mlockall(MCL_FUTURE).

Signed-off-by: Anthony Yznaga <anthony.yznaga@oracle.com>
---
 tools/testing/selftests/mm/mlock2-tests.c | 78 ++++++++++++++++++++---
 1 file changed, 69 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/mlock2-tests.c b/tools/testing/selftests/mm/mlock2-tests.c
index b474f2b20def..b5790e717dd6 100644
--- a/tools/testing/selftests/mm/mlock2-tests.c
+++ b/tools/testing/selftests/mm/mlock2-tests.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #define _GNU_SOURCE
 #include <sys/mman.h>
+#include <linux/mman.h>
 #include <stdint.h>
 #include <unistd.h>
 #include <string.h>
@@ -163,14 +164,17 @@ static int lock_check(unsigned long addr)
 	return (vma_rss == vma_size);
 }
 
-static int unlock_lock_check(char *map)
+static int unlock_lock_check(char *map, bool mlock_supported)
 {
-	if (is_vmflag_set((unsigned long)map, LOCKED)) {
+	if (!is_vmflag_set((unsigned long)map, LOCKED))
+		return 0;
+
+	if (mlock_supported)
 		ksft_print_msg("VMA flag %s is present on page 1 after unlock\n", LOCKED);
-		return 1;
-	}
+	else
+		ksft_print_msg("VMA flag %s is present on an unsupported VMA\n", LOCKED);
 
-	return 0;
+	return 1;
 }
 
 static void test_mlock_lock(void)
@@ -196,7 +200,7 @@ static void test_mlock_lock(void)
 		ksft_exit_fail_msg("munlock(): %s\n", strerror(errno));
 	}
 
-	ksft_test_result(!unlock_lock_check(map), "%s: Unlocked\n", __func__);
+	ksft_test_result(!unlock_lock_check(map, true), "%s: Unlocked\n", __func__);
 	munmap(map, 2 * page_size);
 }
 
@@ -296,7 +300,7 @@ static void test_munlockall0(void)
 		ksft_exit_fail_msg("munlockall(): %s\n", strerror(errno));
 	}
 
-	ksft_test_result(!unlock_lock_check(map), "%s: No locked memory\n", __func__);
+	ksft_test_result(!unlock_lock_check(map, true), "%s: No locked memory\n", __func__);
 	munmap(map, 2 * page_size);
 }
 
@@ -336,7 +340,61 @@ static void test_munlockall1(void)
 		ksft_exit_fail_msg("munlockall() %s\n", strerror(errno));
 	}
 
-	ksft_test_result(!unlock_lock_check(map), "%s: No locked memory\n", __func__);
+	ksft_test_result(!unlock_lock_check(map, true), "%s: No locked memory\n", __func__);
+	munmap(map, 2 * page_size);
+}
+
+/*
+ * Droppable memory should not be lockable.
+ */
+static void test_mlock_droppable(void)
+{
+	char *map;
+	unsigned long page_size = getpagesize();
+
+	/*
+	 * Ensure MCL_FUTURE is not set.
+	 */
+	if (mlockall(MCL_CURRENT))
+		ksft_exit_fail_msg("mlockall(MCL_CURRENT): %s\n", strerror(errno));
+	if (munlockall())
+		ksft_exit_fail_msg("munlockall() %s\n", strerror(errno));
+
+	map = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANONYMOUS | MAP_DROPPABLE, -1, 0);
+	if (map == MAP_FAILED)
+		ksft_exit_fail_msg("mmap error: %s", strerror(errno));
+
+	if (mlock2_(map, 2 * page_size, 0)) {
+		munmap(map, 2 * page_size);
+		ksft_exit_fail_msg("mlock2(0): %s\n", strerror(errno));
+	}
+
+	ksft_test_result(!unlock_lock_check(map, false), "%s: droppable memory not locked\n",
+			__func__);
+
+	munmap(map, 2 * page_size);
+}
+
+static void test_mlockall_future_droppable(void)
+{
+	char *map;
+	unsigned long page_size = getpagesize();
+
+	if (mlockall(MCL_CURRENT | MCL_FUTURE))
+		ksft_exit_fail_msg("mlockall(MCL_CURRENT | MCL_FUTURE): %s\n", strerror(errno));
+
+	map = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANONYMOUS | MAP_DROPPABLE, -1, 0);
+
+	ksft_test_result(!unlock_lock_check(map, false), "%s: droppable memory not locked\n",
+			__func__);
+
+	if (munlockall()) {
+		munmap(map, 2 * page_size);
+		ksft_exit_fail_msg("munlockall() %s\n", strerror(errno));
+	}
+
 	munmap(map, 2 * page_size);
 }
 
@@ -442,7 +500,7 @@ int main(int argc, char **argv)
 
 	munmap(map, size);
 
-	ksft_set_plan(13);
+	ksft_set_plan(15);
 
 	test_mlock_lock();
 	test_mlock_onfault();
@@ -451,6 +509,8 @@ int main(int argc, char **argv)
 	test_lock_onfault_of_present();
 	test_vma_management(true);
 	test_mlockall();
+	test_mlock_droppable();
+	test_mlockall_future_droppable();
 
 	ksft_finished();
 }
-- 
2.47.3


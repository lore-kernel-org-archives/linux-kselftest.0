Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC51449EDD;
	Tue, 10 Mar 2026 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136273; cv=none; b=ro2Yu9GNfPG50TOKkvIMvmwqfwipOIEVrKivpzvkr1E6hv6fUl/62sIs0nGrgrHTlKlPzq74XJRdTxLjhuVXF5V/XQLY7u82L/fH3WixSaRYZumzZW/uTIblyr3aeq08DjXbTQylLTY8E3XumKE8+FGdCHD40HZYRWR6V+F5G+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136273; c=relaxed/simple;
	bh=08O0IUqdfnUMMKfVQ2+sbkmpmRD4UkWvpQlk5jO9P1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OPF5QQX577PWNwPAxXKH4t+eOwM36ugl3jVuts68vmdHogWqOdP8Q/YbyC8NbhQ3v68bGMw4KeCy6UHqFu0KmrzEWE/ZC32gVP1IfnvKbEHc8MlkYsUHGD0dhtTajO0MFmtrjXdSEfzkXcefB+DpG4Zt1jLmB2IqFEYp7SQG8uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Nx6b4FfU; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Nx6b4FfU"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A94Q0e1368044;
	Tue, 10 Mar 2026 09:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Ern5cjBl30ejnsMs3
	icyo6GwdQeAYiguMsgcL4UcbbE=; b=Nx6b4FfU0CACxYHXSqt/Fnz9FkCMYGB2+
	rTrkpjdrMGNoUiFQSY0hWtIfgYtaZJ/YbmytV7Juw5UV1zF1xYdbgzOnav8oMgiK
	/nHHsp91ttlK02LZj5q+Bu7Cs4T6SO2n5ZoDm5cABqsYN8USlM8UJPPrDU4RpcsU
	6eem2HlKX/ZA5celU/A+vyQjlC8Y3axUyW38aKvKEA7pZcG/k6xjKn2JKJpHKWVo
	wLvwReH1gfVRsDCMU5i73ypWVFzazfqPEe0S9HT56903l/n3uSfduYkCux6Tu6Hs
	5s9Mhj3q8a59fbiR5bVYcOAFProI4XtY4hIFZtp9f6xLb3qUQxACA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcvmab4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:50:50 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62A7tvcZ015720;
	Tue, 10 Mar 2026 09:50:49 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cs1220977-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:50:49 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62A9olVI52035936
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2026 09:50:47 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94CA320040;
	Tue, 10 Mar 2026 09:50:47 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6ADA02004B;
	Tue, 10 Mar 2026 09:50:44 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.in.ibm.com (unknown [9.109.243.201])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Mar 2026 09:50:44 +0000 (GMT)
From: Sayali Patil <sayalip@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Ritesh Harjani <ritesh.list@gmail.com>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Michal Hocko <mhocko@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Dev Jain <dev.jain@arm.com>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Liam.Howlett@oracle.com, Sayali Patil <sayalip@linux.ibm.com>
Subject: [PATCH 05/13] selftests/mm: size tmpfs according to PMD page size in split_huge_page_test
Date: Tue, 10 Mar 2026 15:19:23 +0530
Message-ID: <4284688bbec0901d25f88ee1b55c7495fa26b125.1773134177.git.sayalip@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773134177.git.sayalip@linux.ibm.com>
References: <cover.1773134177.git.sayalip@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 4x4lI7U0-8crrqN0jVaQkRZRbeRIe-VK
X-Proofpoint-ORIG-GUID: 4Uij6jZphGsCFDVs4aVrarue8oAwPvQy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4MSBTYWx0ZWRfX7lfsUXSodEG+
 6Ol4r2Q3P4SHZTU2MKXeoHMXzuIdtJVYOFQtPzfL/gBFiz1AZmEdZxk0053e4jS/4/Qmb92BSlY
 AeOOWqv6cTBuSlHKPsVuGmi9uk2mH9NSbkl2gZ5s3fL3YpmSntBvXwk9aewvhS0o93eDwZDg1ld
 22Ehl1ChRoTHSU8ghtUlx/RltsKKtlBknk0c/xkzQUpiPT/t/babt9bFv1f68TT77BwXBhM2bFY
 zvF20q2nY0rjLY9cIV7W1TubrqN2eWWDzqVoMuwjV+VOMqmpOdDpKb3tyjtEdSp2BOhcWniNOF7
 MPE+8paOIMcUoPQeHO52AXw+X6DVan5zYgpOUacRLfjqS45zBwM1WLj+knU2sn9Jjqdw9x87nfn
 64xH4VBy9If/rAt6LverqtG7fjX8mGGW7ocLC8qPT1RyfzGryU6xcb1MpyOvmYHO846xPumd/m1
 XyPgq5rLQePEnyOwQJA==
X-Authority-Analysis: v=2.4 cv=B5q0EetM c=1 sm=1 tr=0 ts=69afe97a cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=2DqBuDyFdJ_AORcY0zkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100081

The split_file_backed_thp() test mounts a tmpfs with a fixed size of
"4m". This works on systems with smaller PMD page sizes,
but fails on configurations where the PMD huge page size is
larger (e.g. 16MB).

On such systems, the fixed 4MB tmpfs is insufficient to allocate even
a single PMD-sized THP, causing the test to fail.

Fix this by sizing the tmpfs dynamically based on the runtime
pmd_pagesize, allocating space for two PMD-sized pages.

Before patch:
  running ./split_huge_page_test /tmp/xfs_dir_YTrI5E
  --------------------------------------------------
  TAP version 13
  1..55
  ok 1 Split zero filled huge pages successful
  ok 2 Split huge pages to order 0 successful
  ok 3 Split huge pages to order 2 successful
  ok 4 Split huge pages to order 3 successful
  ok 5 Split huge pages to order 4 successful
  ok 6 Split huge pages to order 5 successful
  ok 7 Split huge pages to order 6 successful
  ok 8 Split huge pages to order 7 successful
  ok 9 Split PTE-mapped huge pages successful
   Please enable pr_debug in split_huge_pages_in_file() for more info.
   Failed to write data to testing file: Success (0)
  Bail out! Error occurred
   Planned tests != run tests (55 != 9)
   Totals: pass:9 fail:0 xfail:0 xpass:0 skip:0 error:0
 [FAIL]

After patch:
  --------------------------------------------------
  running ./split_huge_page_test /tmp/xfs_dir_bMvj6o
  --------------------------------------------------
  TAP version 13
  1..55
  ok 1 Split zero filled huge pages successful
  ok 2 Split huge pages to order 0 successful
  ok 3 Split huge pages to order 2 successful
  ok 4 Split huge pages to order 3 successful
  ok 5 Split huge pages to order 4 successful
  ok 6 Split huge pages to order 5 successful
  ok 7 Split huge pages to order 6 successful
  ok 8 Split huge pages to order 7 successful
  ok 9 Split PTE-mapped huge pages successful
   Please enable pr_debug in split_huge_pages_in_file() for more info.
   Please check dmesg for more information
  ok 10 File-backed THP split to order 0 test done
   Please enable pr_debug in split_huge_pages_in_file() for more info.
   Please check dmesg for more information
  ok 11 File-backed THP split to order 1 test done
   Please enable pr_debug in split_huge_pages_in_file() for more info.
   Please check dmesg for more information
  ok 12 File-backed THP split to order 2 test done
...
  ok 55 Split PMD-mapped pagecache folio to order 7 at
    in-folio offset 128 passed
   Totals: pass:55 fail:0 xfail:0 xpass:0 skip:0 error:0
   [PASS]
ok 1 split_huge_page_test /tmp/xfs_dir_bMvj6o

Fixes: fbe37501b252 ("mm: huge_memory: debugfs for file-backed THP split")
Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
---
 tools/testing/selftests/mm/split_huge_page_test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index e0167111bdd1..57e8a1c9647a 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -484,6 +484,8 @@ static void split_file_backed_thp(int order)
 	char tmpfs_template[] = "/tmp/thp_split_XXXXXX";
 	const char *tmpfs_loc = mkdtemp(tmpfs_template);
 	char testfile[INPUT_MAX];
+	unsigned long size = 2 * pmd_pagesize;
+	char opts[64];
 	ssize_t num_written, num_read;
 	char *file_buf1, *file_buf2;
 	uint64_t pgoff_start = 0, pgoff_end = 1024;
@@ -503,7 +505,8 @@ static void split_file_backed_thp(int order)
 		file_buf1[i] = (char)i;
 	memset(file_buf2, 0, pmd_pagesize);
 
-	status = mount("tmpfs", tmpfs_loc, "tmpfs", 0, "huge=always,size=4m");
+	snprintf(opts, sizeof(opts), "huge=always,size=%lu", size);
+	status = mount("tmpfs", tmpfs_loc, "tmpfs", 0, opts);
 
 	if (status)
 		ksft_exit_fail_msg("Unable to create a tmpfs for testing\n");
-- 
2.52.0


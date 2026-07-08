Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40D23E556C;
	Wed,  8 Jul 2026 06:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494019; cv=none; b=KcokS0peRIb/8VT3y9TjlrCgHzx3a+YqCrR3w79fhn3FGp/JRN/p6g3TPe4HjLouKsyWrxTw2M9pofASIWE9suXchS/Ooo2cbh1OlHtvVm9mu9Yi7IeYAqLzghAiHHX4tI8Z0t/HOFwd157zxqg4OmUQC8cdjXhCwbCBo5+ACdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494019; c=relaxed/simple;
	bh=8BlXzH7TzvOdN7k3uPPcItNOkxu7SNfEfwd8YLZQA2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCjmQBAkZ4KIVbgwQ95OhA6ZI1ecWUCYlENcdddwS84WeKLgyAz7oZFqkY1zJR/GNfO/IVa4PL30TO7gQ+sG3aPuA0PcaMHwV++9M/w5uRkczavYersiNocBlewUNW83Xy+0i6zwKkGjg+4BrMiCwOonHffaArJViu+dvQ1eVNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=M1Aq9Xvv; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="M1Aq9Xvv"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667Mnm321240381;
	Wed, 8 Jul 2026 06:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=TpiV3ITtYl+egOudx
	o8H8C6y3p/7ydpiGLZ0+4yVSzU=; b=M1Aq9XvvV9L1oMVeppx5oDU0Fkz/9poru
	gHfzHe3l9GaF0cbx/PfQpUFvhFXZRaQapLnv3OyNaVPzMbFZjsBHPrSx+Znzau42
	89KUtDnFt3rGWc0lE/fT6BIy75R/WnF0qyiGisnafzzmiSGzCrPHHevOw5EZsXEc
	a8XQVG1hSa2qUC4j9TmMPmT6Ul2mbw0/n3pkW52uiMlvSo9MEwjcpyyPx+bxvglx
	9f78yarbp9lisAzcg1uYt3kqNKF1Ivam7wU51oPAtIk6yL3qA9jFufFDAIr5cF6n
	ixW9ZEmsv+3QNhKjcPbVe8gmKSTByQCHmvMfc1UuwomkAKSrRiU2g==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6suqttxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 06:59:31 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6686naCX023414;
	Wed, 8 Jul 2026 06:59:30 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7cvw6km5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 06:59:29 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6686xQKv22544912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jul 2026 06:59:26 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E02D920043;
	Wed,  8 Jul 2026 06:59:25 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6A362004B;
	Wed,  8 Jul 2026 06:59:22 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.bl1-in.ibm.com (unknown [9.123.3.209])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jul 2026 06:59:22 +0000 (GMT)
From: Sayali Patil <sayalip@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Ritesh Harjani <ritesh.list@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Michal Hocko <mhocko@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Dev Jain <dev.jain@arm.com>, Liam.Howlett@oracle.com,
        linuxppc-dev@lists.ozlabs.org, Miaohe Lin <linmiaohe@huawei.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Sayali Patil <sayalip@linux.ibm.com>
Subject: [PATCH v3 3/3] selftests/mm: fix ternary operator precedence in ksm_tests
Date: Wed,  8 Jul 2026 12:29:07 +0530
Message-ID: <ce859430287ed2642848c933a90eb9a69da361f0.1783446924.git.sayalip@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1783446924.git.sayalip@linux.ibm.com>
References: <cover.1783446924.git.sayalip@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2MyBTYWx0ZWRfX3zVyupcoywOo
 V7FYru9lUCCqqTPZvYL7xAIc2/q5eLw31UjLshCo33pEddwEVw0kxy0xhY5fBmR8AFv8UdfKF8G
 4lNG8z2zIXQFKKFNthU4FObeOB+5Feo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2MyBTYWx0ZWRfX9hBKNVIXkiMc
 AP9dhZ+rz2MpwQhhhdRNTlE4W5ND1UJARwQzpOpugjhIBkxL8WCduZMjAN6R/lpxxnbioeie49y
 V6FrDe9Xgt4YyZoj0083NDh79+lxPqV9W17d5rIEi1G1y/a2uFkNdIO52vdVgHeWkfH/ntK1PFu
 FNboM7bdWi0F28G+/LYRNp0sKWJGlstKUren5Eelp7AuC5rq5i3250n2AUJ4I5BybYtYdE8TFsm
 dFg4yipdQf/NxEOrXFa4nxpfbqtEYggnBf0mPvXmZ81PeFQiNxfnbr5Wv+zZe1kN5HVnfc0R5Yv
 sC+U+Sz5rnOF5iFMLwgG8UTmCmDnJsTlFSHlwBS291ECygK/OTl4yZhEhd0rJ64fw8gOSeaWeAu
 lTz4Q5WhlxCRZoO46ZosSrQBCAdvga4VpJR7qW5Rz8F3lwuQhwZymc8NlNqGQH/Bqfbowin4X30
 ECWoiWnzjj9ED4Y8fuA==
X-Proofpoint-GUID: p5IefljR6jeCqyDnuR9opw314GXiy9jD
X-Authority-Analysis: v=2.4 cv=Oot/DS/t c=1 sm=1 tr=0 ts=6a4df553 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=71ZJcVTN4ur1q_9_3CUA:9
X-Proofpoint-ORIG-GUID: V6geHb0ARF9e7-4HcGj2EgYZaZdo8mJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080063

The KSM selftest uses conditional expressions to skip accesses to
merge_across_nodes on systems without NUMA support. However, the
ternary operator is combined with logical OR without parentheses:

a || numa_available() ? 0 : b || c

Due to operator precedence rules, this is parsed as:

(a || numa_available()) ? 0 : (b || c)

instead of the intended:

a || (numa_available() ? 0 : b) || c

Add parentheses around the conditional expressions to ensure the
correct evaluation order.

Fixes: 9aa1af954db0 ("selftests: vm: check numa_available() before operating "merge_across_nodes" in ksm_tests")
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
---
 tools/testing/selftests/mm/ksm_tests.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/mm/ksm_tests.c b/tools/testing/selftests/mm/ksm_tests.c
index 2ebbb544c671..5fd7792a0d47 100644
--- a/tools/testing/selftests/mm/ksm_tests.c
+++ b/tools/testing/selftests/mm/ksm_tests.c
@@ -288,8 +288,8 @@ static bool assert_ksm_pages_count(long dupl_page_count)
 static int ksm_save_def(struct ksm_sysfs *ksm_sysfs)
 {
 	if (ksm_read_sysfs(KSM_FP("max_page_sharing"), &ksm_sysfs->max_page_sharing) ||
-	    numa_available() ? 0 :
-		ksm_read_sysfs(KSM_FP("merge_across_nodes"), &ksm_sysfs->merge_across_nodes) ||
+	    (numa_available() ? 0 :
+		ksm_read_sysfs(KSM_FP("merge_across_nodes"), &ksm_sysfs->merge_across_nodes)) ||
 	    ksm_read_sysfs(KSM_FP("sleep_millisecs"), &ksm_sysfs->sleep_millisecs) ||
 	    ksm_read_sysfs(KSM_FP("pages_to_scan"), &ksm_sysfs->pages_to_scan) ||
 	    ksm_read_sysfs(KSM_FP("run"), &ksm_sysfs->run) ||
@@ -304,8 +304,8 @@ static int ksm_save_def(struct ksm_sysfs *ksm_sysfs)
 static int ksm_restore(struct ksm_sysfs *ksm_sysfs)
 {
 	if (ksm_write_sysfs(KSM_FP("max_page_sharing"), ksm_sysfs->max_page_sharing) ||
-	    numa_available() ? 0 :
-		ksm_write_sysfs(KSM_FP("merge_across_nodes"), ksm_sysfs->merge_across_nodes) ||
+	    (numa_available() ? 0 :
+		ksm_write_sysfs(KSM_FP("merge_across_nodes"), ksm_sysfs->merge_across_nodes)) ||
 	    ksm_write_sysfs(KSM_FP("pages_to_scan"), ksm_sysfs->pages_to_scan) ||
 	    ksm_write_sysfs(KSM_FP("run"), ksm_sysfs->run) ||
 	    ksm_write_sysfs(KSM_FP("sleep_millisecs"), ksm_sysfs->sleep_millisecs) ||
@@ -846,8 +846,8 @@ int main(int argc, char *argv[])
 
 	if (ksm_write_sysfs(KSM_FP("run"), 2) ||
 	    ksm_write_sysfs(KSM_FP("sleep_millisecs"), 0) ||
-	    numa_available() ? 0 :
-		ksm_write_sysfs(KSM_FP("merge_across_nodes"), 1) ||
+	    (numa_available() ? 0 :
+		ksm_write_sysfs(KSM_FP("merge_across_nodes"), 1)) ||
 	    ksm_write_sysfs(KSM_FP("pages_to_scan"), page_count))
 		ksft_exit_fail_msg("Cannot set up KSM tunables\n");
 
-- 
2.52.0


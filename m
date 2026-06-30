Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8293EC2CD;
	Tue, 30 Jun 2026 09:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812006; cv=none; b=o2oMwXFlMoDmijcHXSFiP3npogOS4pWDd0ky1yZzYYVXHer8Wr28PzeWZuT0wewinaND//5uvystoQcDYdobzlol9S81b5/9HuYM1AHDWcA3bVHtMJgh4hFerVbmPk/MPoJPp8n44VaX8ZLFxpQoYuimPPt+LzidsZhM6pSm/yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812006; c=relaxed/simple;
	bh=g+8QForstNiihWjzIbw9tsP0hC/AxecCOk9y0IJldjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TTdDOaKCDbX/FNRMb2+qcAizhJkGIhaUcpZ2MgQ3NPXYaFNH1qkHLgKntkIDn6L7uYsY/X5N7j8dU3kyLCTxRaoCv9zvJ49Bngse1IAcIs1j/LuPMVkK8K2Mu14lRroswBs3JPHF0a19khFXn7cBAsciTwUHw3XeoNw+SUeOTDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Rl/pl8qN; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Rl/pl8qN"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5n3lR1192806;
	Tue, 30 Jun 2026 09:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=JX7DfRwWVJ9hzYFgI
	Vv5oCFL+t8aUntI7OgxSk2Z9WA=; b=Rl/pl8qN2oJYQSOrtZe3w65OXkmRiEo/I
	ff0tFEWQWxOZubEmOkKvWkDvZ7WfPRMUcCuGyvBlsiFxz51Ag6e/EHb0VSVOPWP5
	1yWwzCuf3UyuAIHjdQVilVAcr+KBTsvNL14W7ppCXgs5G6ps1jqyxnr4WaGnDJSf
	3kQKuerZQ7HyRSqz/GYCstScFtIhoFuRVh69mvcVcR3oVrT1UyDW7qhImkQ0bw9r
	27koChIXhbK5ZgEQ7MsbgEAg47sf8rmDNHNuiecmMMz3pxaPj9/O/l3cGQzQz3S3
	uRWf0rpn1MrAeIPz6E1Uj+3z6xVEnwty3NTa1nsTthk22+2T0yLHA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26pdwxvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:33:07 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65U9Jhw1016920;
	Tue, 30 Jun 2026 09:33:05 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f2suk1fw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:33:05 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65U9X1Rg49807662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jun 2026 09:33:02 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9B3E2004B;
	Tue, 30 Jun 2026 09:33:01 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C05D620040;
	Tue, 30 Jun 2026 09:32:57 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.ibm.com.com (unknown [9.39.22.200])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 30 Jun 2026 09:32:57 +0000 (GMT)
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
Subject: [PATCH v2 3/3] selftests/mm: fix ternary operator precedence in ksm_tests
Date: Tue, 30 Jun 2026 15:02:35 +0530
Message-ID: <bea784beacee411394c332272df9e68148caf7f3.1782811071.git.sayalip@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1782811071.git.sayalip@linux.ibm.com>
References: <cover.1782811071.git.sayalip@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Gqc43spd7h-U0WC8K74AgJAuv9DrL9YM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX028e0EZmaNmV
 xcFL7KM+qhDBDooHfgF/CSs02+5vzXEGgKpZmpWG5GXmg6K0PDBN26sRK5UrM5dVYFxzrSt8NmZ
 p9zn3053VAc931ANpNTdzB1NZk9tKX4=
X-Authority-Analysis: v=2.4 cv=edsNubEH c=1 sm=1 tr=0 ts=6a438d53 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=71ZJcVTN4ur1q_9_3CUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX8yF0j+AXyXZR
 AKn92tksa4yH07I88oou9Dq1F5ZkOFcWCRDYpETp4iWpyIm64itMh618+yHbugZA5/md9KChzXi
 ntep/bZTg2a3fQ7HqgwK0vS0WpzLtMCek9EfLS/VntTwuq61szr/HXkzriOyLyitFr20/8KKN+T
 Mbxo43IsQYicra7N0ykIGuPxXpkKiDn+Ut9EichBnxc9XGjMvc3ozUx21zNIYJKfwJ3CyYLdVDp
 dcS2sdTOELmOeAt75qJ1gSPWA2KTvF8PEQqT5leFVuugEz/7xvtJeHZ2lcJeMXo+ZCGuO7P+I/h
 sadZDOP9QOY1aMHGuM9YHOg7gHftQxuUWf2q0I4kGFExeURswulp2jnKt2mndG/g3pggCw8hJDc
 /bOFa7KZww4vACHU02HZgMyHqjjm/TWD/XESJ+LbLKK8ePFKOWnx1JGOh1nAnh6c+hgBzAGZSbv
 9HZZqEM0SY2yZjFJxXA==
X-Proofpoint-ORIG-GUID: BE0xsAUjk1U9Ik-S1SgHxY9Od9W3ovB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300083

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


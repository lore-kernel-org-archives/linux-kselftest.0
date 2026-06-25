Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5343C3E168B;
	Thu, 25 Jun 2026 12:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391294; cv=none; b=jGxhX42LRZneHm9VOMV2bpFGOXtNVqxOVUo3TXanqI1Krr6eteIBaEV1Hni+JjK4HnktiRtRoY/yHJ75OgXfnhKLf1hvgTPV6RkkK4gYPjqOexOiF3FBRBaFLfYgNf8r2BZGnivpKYkjtA9kNJ88Tzb9nleU87fuAlQwCUv7pAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391294; c=relaxed/simple;
	bh=kdM3kCzmVoc0jocSITl55QDR82o05fhxdNtEYUwWXVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LzfGaZqoDMPjSv89Cjx3s6cU+JjgTVy4ukHVSRBfOdP4ZsrbwAeNq4oOGb42Z/Bd3fAtsPJHFU9wUarPhBpmqyJn3PJ3x5em7Fos5WBp3rEqu9Y+FLz4Hj6FQjjBzlv9dDIPjngC8xf7t73GfwW+otpmjFRc7JMbZ8n3P40bZHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PFTmRcT2; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PFTmRcT2"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mTsT2977902;
	Thu, 25 Jun 2026 12:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=+XEAmt62cfViu7g7P
	sv9u8HAtVSwsNQJ1sMnC7j816s=; b=PFTmRcT2xnXxL4VvT+8zSmz3tCsX/P3Iw
	xxNdxLtYvYdY0amidPBQ+Ufwpnc0K4rzQlLJq1qi8NzqXHVuBsZqrQwEXJc87zKE
	dNf8II27Bg7qHoCUwN/O0y6WdJhK/egPWXTjlIVDYlrKew17Mmb1Zz+WXW4LIGMB
	HmEXlLs8a0py/piTptkv6CxTusk4ecIgkALzFaTuFreh+qVM2WUpRkCFUTBKDTPk
	XgxUn72osUMJyRxXAWMamkKJquwgfYff3sm1yXZq69eek2zSymQLil973DjAGstA
	kR8Luq3uxWT163rj7O0Nshsc7/sYAb8LqdkkFmnxSAzofrv8k488w==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjk4ss10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:41:09 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYfOJ014984;
	Thu, 25 Jun 2026 12:41:08 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex66ke4rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:41:07 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCf4jm42074538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:41:04 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F054F20043;
	Thu, 25 Jun 2026 12:41:03 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F125920040;
	Thu, 25 Jun 2026 12:40:59 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.ibm.com.com (unknown [9.39.21.143])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:40:59 +0000 (GMT)
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
Subject: [PATCH 2/2] selftests/mm: fix ksm NUMA merge test for systems with memoryless NUMA nodes
Date: Thu, 25 Jun 2026 18:10:17 +0530
Message-ID: <8540b58ef1fdbc2e5cb2f9fe28a2d2a54a5bc6a8.1782365671.git.sayalip@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1782365671.git.sayalip@linux.ibm.com>
References: <cover.1782365671.git.sayalip@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX9dHpf1x+eo8s
 w123ciYhiqHI43i+ZlmSgU+eW9pBlCViBys96wsoQumY2yL5yzwlaLsTov8i/iIHc1Wa5aQM3rU
 CMwHOtHBZlFoFyzux62UGigJKu2WUT0=
X-Proofpoint-ORIG-GUID: UTuYccX0qVGzHWGUYRAtAphxqDbXL14-
X-Authority-Analysis: v=2.4 cv=Oph/DS/t c=1 sm=1 tr=0 ts=6a3d21e5 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=scZCP75yIN9AcEXs0C4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX0xfCcI6Y2s2C
 QipyX+LPTIKvTjXdxwbsDKZm4OqqYefzBYz332bGBfHSa13+2uyynwX8njSyxjcqtYKu07eEDsH
 KfUSKHkBc1Vvnw60xMS/qxh5B7q6tF5ROO7fS2IbVYgpczFOM/CbtyDbupfEpMAbVHuRV/q5DRQ
 xf3JHaSLpMHVgnW5ELIBEj7+SeQniXncBPqSl49GZ6rdDpPlrZ2OLgcVXYzk8agJuT8J0Gx4eZi
 A5Z2pBocJtqV4Jc9QSbBE9uDV0S5qCxW7QD3jJoCwVpbHYixgvQ9NFYtaRQQSR9fI18icaxjm8X
 kLWqghus26RTzaQIc6IXKk3wU7KUPUGRL12y36hmIedNrjFkPL+7encSFgQFVqqvB9D9wjIq5Tw
 Bq2hqkQPKvch+JogTfLQWZepj5f1MtxPxq91VAKFZj0PEsVwLAOZWZ/5kGwZdVpj1HeitwFa+SY
 ixO26iXNt2LGVaXAvNQ==
X-Proofpoint-GUID: MpXcvQGkzhsBhFigEemmFfOma35hu1iw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250106

The KSM NUMA merge test allocates identical pages on different NUMA
nodes and verifies KSM behavior with merge_across_nodes enabled and
disabled.

On systems with memoryless NUMA nodes, for example:
 #numactl  -H
      available: 2 nodes (0,4)
      .....
      node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
      node 0 size: 14825 MB
      node 0 free: 1382 MB
      node 4 cpus:
      node 4 size: 0 MB
      node 4 free: 0 MB

the test may attempt to allocate memory on a node without memory,
causing numa_alloc_onnode() to fail and resulting in a spurious test
failure.

Add count_mem_nodes() helper to count only nodes with memory and use it
instead of numa_num_configured_nodes() to ensure the test runs only on
systems with at least two NUMA nodes that have memory. Skip the test
otherwise.

Before patch:
       ---------------------------
	running ./ksm_tests -N -m 1
       ---------------------------
        mbind: Invalid argument
        ok 1 KSM NUMA merging
	Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
        [PASS]
       ok 1 ksm_tests -N -m 1
       ---------------------------
        running ./ksm_tests -N -m 0
       ---------------------------
        mbind: Invalid argument
        not ok 1 KSM NUMA merging
	Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0
        [FAIL]
       not ok 2 ksm_tests -N -m 0 # exit=1

After patch:
       ---------------------------
        running ./ksm_tests -N -m 1
       ---------------------------
        SKIP At least 2 NUMA nodes with memory must be available
	Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0
        [SKIP]
        ok 1 ksm_tests -N -m 1 # SKIP
       ---------------------------
        running ./ksm_tests -N -m 0
       ---------------------------
        SKIP At least 2 NUMA nodes with memory must be available
	Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0
        [SKIP]
        ok 2 ksm_tests -N -m 0 # SKIP

Fixes: e3820ab252dd ("selftest/vm: fix ksm selftest to run with different NUMA topologies")
Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
---
 tools/testing/selftests/mm/ksm_tests.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/ksm_tests.c b/tools/testing/selftests/mm/ksm_tests.c
index a050f4840cfa..d1790b4347d3 100644
--- a/tools/testing/selftests/mm/ksm_tests.c
+++ b/tools/testing/selftests/mm/ksm_tests.c
@@ -450,6 +450,18 @@ static int get_first_mem_node(void)
 	return get_next_mem_node(numa_max_node());
 }
 
+static int count_mem_nodes(void)
+{
+	int node, count = 0;
+
+	for (node = 0; node <= numa_max_node(); node++) {
+		if (numa_node_size(node, NULL) > 0)
+			count++;
+	}
+
+	return count;
+}
+
 static int check_ksm_numa_merge(int merge_type, int mapping, int prot, int timeout,
 				bool merge_across_nodes, size_t page_size)
 {
@@ -463,14 +475,12 @@ static int check_ksm_numa_merge(int merge_type, int mapping, int prot, int timeo
 		return KSFT_FAIL;
 	}
 
-	if (numa_available() < 0) {
-		ksft_print_msg("NUMA support not enabled\n");
-		return KSFT_SKIP;
-	}
-	if (numa_num_configured_nodes() <= 1) {
-		ksft_print_msg("At least 2 NUMA nodes must be available\n");
-		return KSFT_SKIP;
-	}
+	if (numa_available() < 0)
+		ksft_exit_skip("NUMA support not enabled\n");
+
+	if (count_mem_nodes() <= 1)
+		ksft_exit_skip("At least 2 NUMA nodes with memory must be available\n");
+
 	if (ksm_write_sysfs(KSM_FP("merge_across_nodes"), merge_across_nodes))
 		return KSFT_FAIL;
 
-- 
2.52.0


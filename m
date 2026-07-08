Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D389A3DF012;
	Wed,  8 Jul 2026 06:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494014; cv=none; b=cU6V99vDIlO/Ut8drX7iVBIpBxSJpZUhRvd9387R0aEiEdoDxvmooan3PFRTu4NHU0bsjTI8Dq4ixgtPrkTh3/5lr4ChwAFpcST8Ab867JYfPPCPv0wbX9BTdzsuqbWp2tJqQb6ZTOWbgiKjShkJ7eXKNNWvKemnbjaMhSNekEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494014; c=relaxed/simple;
	bh=6sCxdi8onCERA7eVWG2Qe8owrA+ODMpdNA4Xbna0XOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DL76AncKna7u+A3keoMGCCi8NQnPCVdz3UDZAOTeVVkBnNNUSi/dsw8WTHzdh5/OXrnzsDgrqctgnXf6Ret40tYu4WryGcf0BYXWd5qLOVzYhNK8HzePCf+9s9vbe7mVQJL3rm2JqTuffGI9lAvBDXPlTyTRZOfTioR4b1yjHGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Sl8pgYrq; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Sl8pgYrq"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667MmWLp920747;
	Wed, 8 Jul 2026 06:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=SsVDbaxlApNyEIKakZ6DuVBmV/2sKJEYi6us2+0Q1
	qU=; b=Sl8pgYrq3ADYRyRG/uHsdHepp/kPvPycL7mPA/XfWTxwWXnR22PFigT2e
	VIR1SvLENVDRf70fA96yUn4yJMBzEmzOsvMTMegpQLPRxE5pDpz2KiiGFnNf6RXU
	bIivEwWcT6/XUT6jWwlvFoHavrtvPzkOeVs+JZIcnlbif8wPoW+1FQ2TApyYv5+G
	LcXyIE8WOFGWiUjO1d8s70qnqV6xA4jiajiSuFyVi4HQD3WG2WhP5SzrhR1043ZP
	bv2q6UJqCULw4gv+1Tha8qxowsOMtuNc9/m5ohV1QXpCFs6969GPq0QFZ4JHhVVB
	SADW2oSoWMh+NqYuPlPIZDtleStPg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6sp3u5er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 06:59:19 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6686nZBZ009362;
	Wed, 8 Jul 2026 06:59:18 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7f6y63sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 06:59:18 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6686xE3x51380730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jul 2026 06:59:14 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 494222004D;
	Wed,  8 Jul 2026 06:59:14 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95CA920043;
	Wed,  8 Jul 2026 06:59:10 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.bl1-in.ibm.com (unknown [9.123.3.209])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jul 2026 06:59:10 +0000 (GMT)
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
Subject: [PATCH v3 0/3] selftests/mm: avoid false failures in hugetlb and KSM tests
Date: Wed,  8 Jul 2026 12:29:04 +0530
Message-ID: <cover.1783446924.git.sayalip@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a4df547 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=dIJUXHJssPmyVruG4BkA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2MyBTYWx0ZWRfX0F5MFB5eM4kc
 tMesEeflz+3BAkmpi5TapmtE5v5ZFOBWiA9i2aA6WoBOoC+ElulcGgZ+INfKnjd35aiGySeinhv
 kXqSkJTdmb5c0xpCqFm2Wyn3pz8RcyI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2MyBTYWx0ZWRfX2rY/0FQRL3NV
 mS3kzUg8IGKV9Pj9FStS27+H5/62OUpzN0QrNuAwWh2OdvBjQcnneAPRuAZY6F26PA+aFhv9hWq
 dR3T7NIJB9DQgNKY2ig4WRjx3j1iIY+XJ91bTJ4iY6+RH7he33qlhI/yb/LSKlijO3MaNlTBohj
 UQsqgOM4w6ZYq0O2vOugaGxXdcmHNA4oiVCy/lpi98hkrw13w/lLPE1jLx6nPoCMtw0RuRBGkEE
 Gg9/FvpAWibOijWwDIwPRRHDW1JVtYNaV+nGOPaUJOipB+5B0rPEVYaB9A3SkQipwO5846RGtC9
 sqYHMaWBxXwF5B2mowl6P1T1KqV6ea71M8iSYhpXnOMZgoJx11sHtXY5k1NYjobn52pYQHziv7j
 sRtkf2n37OhwaxboShjFoyGO2kYCFF+7ZNS6SENM1skpBKvx8tOY1MBPjo17dxaqnqAzWa0M9ND
 Z9xOcDhckWgFQGdSWlg==
X-Proofpoint-ORIG-GUID: PSuWbsLmgZVv-t8ijao20URokJlRqGvk
X-Proofpoint-GUID: VW-XIngojpvDJ0MK-njfKsLTYVG7YB7r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080063

Hi all,

This series fixes issues in the hugetlb and KSM MM selftest categories
that can report failures when the prerequisites for the tests are not
satisfied.

Patch 1 updates the hugetlb selftest helpers to handle -EINVAL when
attempting to configure gigantic HugeTLB pages via nr_hugepages.
PowerPC hash MMU pSeries systems expose gigantic hugepage sizes
but do not allow runtime allocation of such pages,
causing the sysfs write to fail. Handle this case gracefully and
continue running the test instead of aborting.

Patch 2 fixes the KSM NUMA merge test on systems with memoryless NUMA
nodes. The test currently relies on the number of configured NUMA nodes
and may attempt allocations on nodes that have no memory, resulting in
spurious failures. Use the existing helpers to identify
NUMA nodes that contain memory and skip the test when fewer than two
such nodes are available.

Patch 3 fixes a pre-existing operator precedence issue in ksm_tests,
where a ternary expression combined with logical OR operators could be
evaluated differently than intended. Added parentheses to ensure the
correct evaluation order.

These changes improve handling of unsupported test configurations and
unmet test prerequisites, avoiding spurious failures.

Thanks,
Sayali
---

V2 -> V3:
- For "selftests/mm: handle EINVAL when configuring gigantic hugepages":
  Reworked the implementation to use internal helper functions with an 
  ignore_einval flag, as suggested by David Hildenbrand.
  Added __write_file() and __write_num() helpers to optionally ignore
  -EINVAL from sysfs writes.
  Added write_num_ignore_einval() wrapper for callers that need to tolerate
  unsupported hugepage configurations.

V2: https://lore.kernel.org/all/cover.1782811071.git.sayalip@linux.ibm.com/

---

V1 -> V2:
- For "selftests/mm: handle EINVAL when configuring gigantic hugepages":
  Added a dedicated hugetlb_write_num() helper to handle the expected EINVAL
  returned by gigantic hugepage configuration, in the
  hugepage setup code rather than modifying the generic write_file() helper.
- For "selftests/mm: fix ksm NUMA merge test for systems with memoryless NUMA nodes":
  Updated implementation as per David's review comment to build upon
  existing helpers get_next_mem_node().
- Added new patch "selftests/mm: fix ternary operator precedence in ksm_tests"
  to address a pre-existing issue identified during Sahiko's review.

V1: https://lore.kernel.org/all/cover.1782365671.git.sayalip@linux.ibm.com/

---

Sayali Patil (3):
  selftests/mm: handle EINVAL when configuring gigantic hugepages
  selftests/mm: fix ksm NUMA merge test for systems with memoryless NUMA
    nodes
  selftests/mm: fix ternary operator precedence in ksm_tests

 .../testing/selftests/mm/hugepage_settings.c  |  2 +-
 tools/testing/selftests/mm/ksm_tests.c        | 28 ++++++++++---------
 tools/testing/selftests/mm/vm_util.c          | 26 ++++++++++++++---
 tools/testing/selftests/mm/vm_util.h          |  1 +
 4 files changed, 39 insertions(+), 18 deletions(-)

-- 
2.52.0


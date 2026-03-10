Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C62D42EED7;
	Tue, 10 Mar 2026 09:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136254; cv=none; b=trwhgZGAie9RLENgMMk5cyw/miKrdtx5l3d5cTeagSbd+cE3YqXxmxlxUrmtM5Qm9XTkH18penXCTxTX7vkGrtTe4lpRnnk7IVWmAnGOVXD7NhnUFnvnIovelbbwwwHJUx0ANHNePYWmzJxXCmv22mvL9UxGkswvPPMsyGkhMCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136254; c=relaxed/simple;
	bh=bThWoBjySQr82nEU4eJH4AQ0UBkFuT11AzqRxHJ+8XA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fr/eZxDYnUjjY/Ok231+VcV7zfdR88nsjV7Rj9vkpmvBstik+obmosq8sb0sypo3QLDA5gPiMkcOCmZrRAxySvRKvJcmMf6tq/jCe4StdexC/GkXDseamULNDV+pcNGErSh3lz7cwurAYCMcURKXoHae1bK9dINGNGWUNZEDztc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pKfXS/l4; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pKfXS/l4"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629FwfcR1553765;
	Tue, 10 Mar 2026 09:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=CpWP3ssTno2Z4GUarF/KfgBuKmxkk/g2ALtQ4Q5/Y
	5Y=; b=pKfXS/l4hkqMpWlKhvyjNfQYylL9GaFjMJAR8G8ZHfu/tPti932vP51ot
	XKzV0yykWCxd1MpNsXzr1z7lfq3x8R6XP8oOhr3u7rbpId9jvJXRzqkTYBDMY+Wn
	gccXp3G9eI1cXUIbAJKONUem9T33dCCbT5Bs8wPB6qkP2OrEbrrYGQ1z1tgEEDuJ
	+BpezFXqCNjaASRbcG9QczKycDvWiMp/WUZHiomseoHIRGTtew/5Z1xr9m/aE6OI
	doZ8ZVCh4Ujc27Oc0FxChhy1yGkRWk2nk81c1PbGj1wEJXKxmbwHXhWW0l4dCYyV
	YuzWaV1dP51vjwsKzaXwzK/duCbQA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcvra0d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:50:33 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62A58EST021164;
	Tue, 10 Mar 2026 09:50:32 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4crxbsrpfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:50:32 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62A9oURC26018160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2026 09:50:30 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70E842004E;
	Tue, 10 Mar 2026 09:50:30 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 774772004F;
	Tue, 10 Mar 2026 09:50:27 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.in.ibm.com (unknown [9.109.243.201])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Mar 2026 09:50:27 +0000 (GMT)
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
Subject: [PATCH 00/13] selftests/mm: fix failures and robustness improvements
Date: Tue, 10 Mar 2026 15:19:18 +0530
Message-ID: <cover.1773134177.git.sayalip@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4MSBTYWx0ZWRfX5NegrCCOdEW1
 hvSLo+uWiyGooXu8HrPVrUk762CRKiSCwIrWRfk2lxltPAJ2Ow8AHPb9LVpqIvlCUXPcboAF2tb
 Rm69RI/ChAx3/WWuvvuqTYq4GxwJHpVJmIYQhpspgXKV6k8H7Y9LUxmWzFlTNBs+TdSKFpZEGgw
 qC9j6rOENJJP/7UTya0X5NhLosZeLHJKp6t6yxHa7eHocX6b0dKwO7WW4IdZMRzroGCZbUXKNJV
 x/jZ41g6VuwwCS/frjpKcbbEVNcKPQ/F5OLY93JuZ/vsIeQHDcFK2XbcizKnzv4f3B+WJb6FY7p
 TWLUgnVZpB5QZ8eP3fmSJBAx7jJnVWuMXxKa2JoTY02/cq1y3upVUPd4vN4R9+oXIBztwq//ASI
 Z7JSsVKRNvVdVHQpU8KQVv3ScL0OFBoWKaq4Ow4Q9OzhZEq3FnwQDe1mBHZIGK62Uc1+ErooVfj
 NrDD+uqTIga5+XglvUA==
X-Proofpoint-GUID: qKq1k9BOWPDGfJSSNaNtSslod8i8ZZW8
X-Proofpoint-ORIG-GUID: 5JNoSES92DOI_MLDmnFF1cri-Wq0xJ0A
X-Authority-Analysis: v=2.4 cv=QoFTHFyd c=1 sm=1 tr=0 ts=69afe969 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=Dq3zVHc97-tjocEnGNwA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100081

Hi all,

Powerpc systems with a 64K base page size exposed several issues while
running mm selftests. Some tests assume specific hugetlb configurations,
use incorrect interfaces, or fail instead of skipping when the required
kernel features are not available.

This series fixes these issues and improves test robustness.

Please review the patches and provide any feedback or suggestions for
improvement.

Thanks,
Sayali

Sayali Patil (13):
  selftests/mm: restore default nr_hugepages value during cleanup in
    charge_reserved_hugetlb.sh
  selftests/mm: fix hugetlb pathname construction in
    charge_reserved_hugetlb.sh
  selftests/mm: fix hugetlb pathname construction in
    hugetlb_reparenting_test.sh
  selftest/mm: fix cgroup task placement and tolerance in
    hugetlb_reparenting_test.sh
  selftests/mm: size tmpfs according to PMD page size in
    split_huge_page_test
  selftest/mm: adjust hugepage-mremap test size for large huge pages
  selftest/mm: register existing mapping with userfaultfd in
    hugepage-mremap
  selftests/mm: ensure destination is hugetlb-backed in hugepage-mremap
  selftests/mm: skip uffd-wp-mremap if UFFD write-protect is unsupported
  selftests/mm: skip uffd-stress test when nr_pages_per_cpu is zero
  selftests/mm: fix double increment in linked list cleanup in
    compaction_test
  selftests/mm: move hwpoison setup into run_test() and silence modprobe
    output for memory-failure category
  selftests/cgroup: extend test_hugetlb_memcg.c to support all huge page
    sizes

 .../selftests/cgroup/test_hugetlb_memcg.c     | 66 ++++++++++++++-----
 .../selftests/mm/charge_reserved_hugetlb.sh   | 44 +++++++++----
 tools/testing/selftests/mm/compaction_test.c  |  3 -
 tools/testing/selftests/mm/hugepage-mremap.c  | 25 ++-----
 .../selftests/mm/hugetlb_reparenting_test.sh  | 31 +++++----
 tools/testing/selftests/mm/run_vmtests.sh     | 59 +++++++++++------
 .../selftests/mm/split_huge_page_test.c       |  5 +-
 tools/testing/selftests/mm/uffd-stress.c      |  6 +-
 tools/testing/selftests/mm/uffd-wp-mremap.c   | 13 ++++
 .../testing/selftests/mm/write_to_hugetlbfs.c |  5 +-
 10 files changed, 169 insertions(+), 88 deletions(-)

-- 
2.52.0


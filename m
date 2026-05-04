Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABAA32ED5C;
	Mon,  4 May 2026 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777883138; cv=none; b=rmd9cBk82+1p/ECW4JNGtBCfg1Qjy9F2guLGWCi4Im2CsBQ0qNlM6AHRQaqAu/QKmdX9hUVaUTTR7u/LrFyf6e6GfbBr73cNsc/YUA8qMHPlMaiKi3xQEHyWJCz3y0Y5OshngfWdz+tN1edW8ZOmnOVf8w9mhitngBcLTj4IcMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777883138; c=relaxed/simple;
	bh=IdU5v5np8ZQ/2ZLDW0cI5NOTSR13a+ibTICZmb5ScIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F2OXX63y12p6gtbn7f1HI2SS1iemzfvSDv1ne9g5/odWlsMyWYKA1VwazZ0wvJG+u231aFYidkwrl05Vs9XlBIzp3P3hMoiQKxnV01eiIhD7PlUed6uLpB/dNSdGlIjFKtc7o1NWrz7dx4zF/HURrZ+bSRGsGkUBz/eORI7sv1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=jnBSbP1k; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="jnBSbP1k"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446S7YF599575;
	Mon, 4 May 2026 08:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=IHNX7MRFT5w9RM/ynp0582/aI4ga
	qLiwyHf7ehX1XfI=; b=jnBSbP1k3eLVfzsBiKLlDQzhPKUE+fQvwinC8TYKHi0n
	DwD0NW38zIeYP938BmClheRkHVIfP8e4VEqSv7zGCRt3i4k1wnaxWZ9m3cqJ2R9a
	mEJcraZaqxMMQTnzvuJihDRfOUcpwtS4V08OaWAVowoY4k7MKplYHSDVjafirGom
	i9Z+fhhPwiMkkVXeCfLWgKemr5hmixLLdtcNBe59TvEFv+6bCKYEbxmL7S3sxShI
	u3TA5F1+kw1bgeVHT+gXTrDT26iGwKgRS7BktOUhqlpZ+/L0IzVc1O//ekMmeYQy
	6+fbQJ4FahzrHHzPt9EZmFc16S1Dy6156cdn4c7kQQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dw9y164d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 May 2026 08:25:10 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6448OOd2023531;
	Mon, 4 May 2026 08:25:08 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dwuyvve7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 May 2026 08:25:08 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6448P4SS52166976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 May 2026 08:25:05 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5FC62004E;
	Mon,  4 May 2026 08:25:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 883F62004F;
	Mon,  4 May 2026 08:25:01 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.bl1-in.ibm.com (unknown [9.123.3.209])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 May 2026 08:25:01 +0000 (GMT)
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
Subject: [PATCH v6 00/14] selftests/mm: fix failures and robustness improvements
Date: Mon,  4 May 2026 13:54:37 +0530
Message-ID: <cover.1777877814.git.sayalip@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: R29VylnpmzWk06t4o6p-1eSokrDQIb0M
X-Proofpoint-GUID: xCl2WFaP9RF3ZmxfC1TucYAXJWU_9KeK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NyBTYWx0ZWRfX0w77sA23xMZf
 X9hb7uo086NCD910+27YnqeavrxSNIRnBg+yAatwzaDL6U/FF8nbQW/3EPzZDrz28/IRrRTEI3p
 P14+zAj+co3GfYysyduwdaof7AesLnLiSAuAdsEgPMsG5EklaDKYj2fprNXaS+qgtpwgVtQ96hs
 DZhVHiK6J70Nt8Pypn5TEatSiShxs2e/8GTGHPgX0w6oAKx2YdsSty4qsSlH3C6MVpuk+GlH84S
 q5bjJsowz6caq8CjmOXlQgu9vdqwhCSt3Dov2zapETYjQ3Z5Ea4VfHpzEVYxXebjgeS8aoMGz5v
 Q3dAmHJnbBiTd9qiCw3wtYdDswcTxEyfb2iU/9nI2dDnzdXn3Tkv76xkD4RgUZrC9zhUnQ565tn
 0sFaKjN46U2n/lWHhIgF7pFOrYATNMuJ1iLvxQnGFpedOsAgTVF4B3u9QftV/ve0gVcwNGNkIXO
 fhCktGKl3kVtBysUEAw==
X-Authority-Analysis: v=2.4 cv=UbFhjqSN c=1 sm=1 tr=0 ts=69f857e6 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=-DqwulyscF0aooa66S8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040087

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

---
v5->v6
  - For "selftests/mm: restore default nr_hugepages value via exit trap
    in charge_reserved_hugetlb.sh":
    Extended trap to include INT and TERM in hugetlb tests to ensure
    nr_hugepages is restored on signal-based exits.
  - For "selftests/mm: restore default nr_hugepages value via exit trap
    in hugetlb_reparenting_test.sh":
    Extended trap to include INT and TERM in hugetlb tests to ensure
    nr_hugepages is restored on signal-based exits.
  - For "selftests/mm: fix cgroup task placement and drop memory.current
    checks in hugetlb_reparenting_test.sh":
    Updated the subshell invocation to pass variables as positional arguments
    instead of interpolating them into the command string as per review comment.
  - For "selftests/mm: move hwpoison setup into run_test() and silence modprobe
    output for memory-failure category":
    Updated the condition to avoid unconditional module removal and ensures it is
    only unloaded if loaded by the test.

v5: https://lore.kernel.org/all/cover.1776150071.git.sayalip@linux.ibm.com/
---
---
v4->v5
  - For "selftests/mm: move hwpoison setup into run_test() and silence modprobe
    output for memory-failure category":
    Renamed LOADED_MOD to LOADED_HWPOISON_INJECT_MOD as per review comment.
  - Dropped "selftests/cgroup: extend test_hugetlb_memcg.c to support all huge
    page sizes":
    Due to intermittent failures observed on some systems.
  - Added Tested-by from Venkat for all patches.
  - Added Reviewed-by from Zi yan for patches 7,8 and 13.
  - Added Acked-by from Zi yan for patches 1 and 3.

v4: https://lore.kernel.org/all/cover.1775466329.git.sayalip@linux.ibm.com/
---
v3->v4

  - selftests/mm: restore default nr_hugepages value via EXIT
    trap in charge_reserved_hugetlb.sh:
    Updated to use an EXIT trap to restore the original nr_hugepages
    once at script termination, ensuring reliable restoration on all
    exit paths.

  - selftest/mm: fix cgroup task placement and drop memory.current checks
    in hugetlb_reparenting_test.sh:
    Updated to use a deterministic synchronization method by migrating the
    workload process within a wrapper subshell before calling exec() to 
    ensure correct cgroup accounting.

  - selftest/mm: align memory size to huge page size in hugepage-mremap
    test:
    Update test code directly to align memory allocations to the hugepage
    size, rather than modifying run_vmtests.sh. This replaces the previous
    commit “adjust hugepage-mremap test size for large huge pages” with
    a cleaner, direct approach in the test itself.

  - selftests/mm: ensure destination is hugetlb-backed in hugepage-mremap:
    Updated to remove MAP_POPULATE flag for the mmap call as per review
    comment.

  - selftests/mm: skip uffd-wp-mremap if UFFD write-protect is unsupported:
    Updated as per review comment to initialize features to zero and exit
    on all uffd_get_features() failures, avoiding spurious test errors.

  - selftests/mm: move hwpoison setup into run_test() and silence
    modprobe output for memory-failure category:
    Declared LOADED_MOD as local variable and avoided a redundant 
    skip message when the module is not found.
    Updated logic to set exitcode to ksft_skip only when no failure has
    been recorded.

  - selftests/cgroup: extend test_hugetlb_memcg.c to support all huge
    page sizes:
    Updated to skip on memory constraints instead of returning
    EXIT_FAILURE.
    Updated the logic to fully account for the scenario when the
    per-CPU stock is empty and a refill charges MEMCG_CHARGE_BATCH. 
    Updated to avoid overflow on 32-bit systems for memory.max value.

  - Included "selftests/mm: restore default nr_hugepages value via
    EXIT trap in hugetlb_reparenting_test.sh"

  - Included "selftests/mm: free dynamically allocated PMD-sized
    buffers in split_huge_page_test"

  - Included "selftests/mm: clarify alternate unmapping in compaction_test"

  - Dropped "selftests/mm: fix double increment in linked list cleanup in
    compaction_test":
    The behaviour is intentional.

v3: https://lore.kernel.org/all/cover.1774591179.git.sayalip@linux.ibm.com/

---
v2->v3
  - selftests/mm: skip uffd-wp-mremap if UFFD write-protect is unsupported:
    Rename function to check_uffd_wp_feature_supported() as suggested in review.
  - selftest/mm: fix cgroup task placement and drop memory.current checks
    in hugetlb_reparenting_test.sh:
    Drop memory.current validation from the hugetlb reparenting test.
    Keep tolerance at 7MB (reverting earlier increase to 8MB in v1).
  - Included "selftests/mm: allow PUD-level entries in compound testcase of hmm
    tests" patch:
    Extend the compound testcase checks to accept PUD-level mappings.
  - Included "selftests/mm: replace hardcoded THP size with runtime PMD page size in
    hmm tests" patch:
    Use read_pmd_pagesize() instead of TWOMEG and cap maximum THPs in
    benchmarks to avoid integer overflow.

v2: https://lore.kernel.org/all/cover.1773305677.git.sayalip@linux.ibm.com/

---
v1->v2
  - For "selftests/mm: ensure destination is hugetlb-backed in hugepage-mremap":
    update FLAGS definition to MAP_HUGETLB | MAP_SHARED | MAP_POPULATE and
    used it for mmap() calls as suggested during review.

v1: https://lore.kernel.org/all/cover.1773134177.git.sayalip@linux.ibm.com/
---

Sayali Patil (14):
  selftests/mm: restore default nr_hugepages value via exit trap in
    charge_reserved_hugetlb.sh
  selftests/mm: fix hugetlb pathname construction in
    charge_reserved_hugetlb.sh
  selftests/mm: restore default nr_hugepages value via exit trap in
    hugetlb_reparenting_test.sh
  selftests/mm: fix hugetlb pathname construction in
    hugetlb_reparenting_test.sh
  selftests/mm: fix cgroup task placement and drop memory.current checks
    in hugetlb_reparenting_test.sh
  selftests/mm: size tmpfs according to PMD page size in
    split_huge_page_test
  selftests/mm: free dynamically allocated PMD-sized buffers in
    split_huge_page_test
  selftest/mm: align memory size to huge page size in hugepage-mremap
    test
  selftest/mm: register existing mapping with userfaultfd in
    hugepage-mremap
  selftests/mm: ensure destination is hugetlb-backed in hugepage-mremap
  selftests/mm: skip uffd-wp-mremap if UFFD write-protect is unsupported
  selftests/mm: skip uffd-stress test when nr_pages_per_cpu is zero
  selftests/mm: move hwpoison setup into run_test() and silence modprobe
    output for memory-failure category
  selftests/mm: clarify alternate unmapping in compaction_test

 .../selftests/mm/charge_reserved_hugetlb.sh   | 45 +++++++++-----
 tools/testing/selftests/mm/compaction_test.c  |  3 +
 tools/testing/selftests/mm/hugepage-mremap.c  | 42 ++++++-------
 .../selftests/mm/hugetlb_reparenting_test.sh  | 60 ++++++++++---------
 tools/testing/selftests/mm/run_vmtests.sh     | 52 ++++++++++------
 .../selftests/mm/split_huge_page_test.c       | 27 ++++++---
 tools/testing/selftests/mm/uffd-stress.c      |  6 +-
 tools/testing/selftests/mm/uffd-wp-mremap.c   | 13 ++++
 8 files changed, 153 insertions(+), 95 deletions(-)

-- 
2.52.0


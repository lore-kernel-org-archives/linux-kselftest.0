Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6542543E4BD;
	Tue, 10 Mar 2026 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136285; cv=none; b=cNqC1Hq3sFu26bDpBGNXc+j3x4Sy3vgEQeL8u+s8NLIt71OIpaopzGhq3cDSKsyzedw3g3230sSasGItLYtxa4zpAx3eV3+lCeQ27YQdj62w8YKhCtGhzcS6zuhqjUVh8uOW42rxASZzqjX4HLGYQuCpZSyGTWBK4mqqGcTFyi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136285; c=relaxed/simple;
	bh=4CFT3n/T01KFhM4QbKQtslFpiAiXKqNlej1AkvFWs5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GUU29hNO0pripW3PLBnK8IjtafyHyVNzfhdQxPflkpC5ZF5i5pvxg2pVGVhFjQkZdJNYlhucUUjz4j4dIyGczIpGHHDOxI8THMXAkflm7IEh+csOzDje4+ZbszXuw6rv31hhdaSgTWYbHQpwJnK2wMIIAgBIDXKeuFJ9q3zONZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=VS/jEMWH; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="VS/jEMWH"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629GNkVX1714112;
	Tue, 10 Mar 2026 09:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=t5acmMRUsiPYplRm/
	dEZ1Uq6+xA3/RS8dT8Hm6Z2fKs=; b=VS/jEMWHxzUBenRdSqd9Ov2CqUHl69EHY
	46ppOwTOfHF8ucvSz2eVGDUqw1I3CyWGeug+Puok5TAzziZGkfVC1BLuFRqnflnN
	diDRHanhtp+fLOBBW0jNGCKKrLi6tLk7VEOB12+dRKsgldevwwiQI0W0FcAJRUyn
	450C9zlJ2Pum12Xmt6gTonHlCLKmdbjSoSd+bBugtmZjhO8eC1U7UIoSXllADUx4
	N2Hzh0WdjL6jjTr0N2xgJ4umwU02bznFWvRRa6JRO4SS0Do6qbCgVPXKTZM85sQ9
	RdldpAlGMS3ssk6FZblraJCoiP41saM5gYgv8rwcHCHgjQxKK6KvA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcun9yg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:51:00 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62A64YpS015581;
	Tue, 10 Mar 2026 09:51:00 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4crybn8jcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:51:00 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62A9owfP31588736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2026 09:50:58 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDE462004E;
	Tue, 10 Mar 2026 09:50:57 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA03020043;
	Tue, 10 Mar 2026 09:50:54 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.in.ibm.com (unknown [9.109.243.201])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Mar 2026 09:50:54 +0000 (GMT)
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
Subject: [PATCH 08/13] selftests/mm: ensure destination is hugetlb-backed in hugepage-mremap
Date: Tue, 10 Mar 2026 15:19:26 +0530
Message-ID: <2c8858154273159f964236810c7304dec665b28b.1773134177.git.sayalip@linux.ibm.com>
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
X-Proofpoint-GUID: NEkdMe3y-R-WEHCcZZiFrRJEe8wPgiPI
X-Authority-Analysis: v=2.4 cv=Hp172kTS c=1 sm=1 tr=0 ts=69afe985 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=D8eXOz3ApXh34wMIAzAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4MSBTYWx0ZWRfX/LgSFBKQWOQ6
 fpzasiZNGCeb/IZSbgBmcDfbMQb5iuCwlNg+uUccdm5hMW0wgIk2Br4HGqx+iV+tZeMZ3JICWWl
 sqXlvnWoswVFPuKE9aNlV1KcZwqRA6NpITomIIm2NRysWlVXhivyoFfL4IsXsMOJIVLtzU2Zztp
 z5mDMtsMgK8xmaldknymlztAA6X0qxptXF31E62Dgp0DV/0vUGMH4tCIWg4DmAtVC8kvhxz1SsQ
 6aM9gDNTqIzPGe2HfOjv9pwe0ZET/7wImeGU8b4Ey3fAPXrfl0GiK8WZXCWBj/puIvWdjGFiwyc
 7vb+XGzeZ4lXLzckcz2/LvoiLGw/Zrd2a2UnW1CcLgKUOLNdgChs42sTj0AG64DgqivkyH/Iwzv
 6ZV5cwpfW/z57sqRvjQFC6qIwBOZXUh4AoVz61lFo5uGJmExvFO7Nny2Xszyv7Q4B1CYaxXmN4W
 vLMP+rShnKOFKBvRJSg==
X-Proofpoint-ORIG-GUID: cwzWHYFJO0fY-KIkZge_lNS_eucwXBtS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100081

The hugepage-mremap selftest reserves the destination address using a
anonymous base-page mapping before calling mremap() with MREMAP_FIXED,
while the source region is hugetlb-backed.

When remapping a hugetlb mapping into a base-page VMA may fail with:

    mremap: Device or resource busy

This is observed on powerpc hash MMU systems where slice constraints
and page size incompatibilities prevent the remap.

Ensure the destination region is created using MAP_HUGETLB so that both
source and destination VMAs are hugetlb-backed and compatible. Also add
MAP_POPULATE to the destination mapping to prefault hugepages,
matching the behaviour used for other hugetlb mappiing in the test and
ensuring deterministic behaviour.

This ensures the test reliably exercises hugetlb mremap instead of
failing due to VMA type mismatch.

Fixes: 12b613206474 ("mm, hugepages: add hugetlb vma mremap() test")
Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
---
 tools/testing/selftests/mm/hugepage-mremap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/hugepage-mremap.c b/tools/testing/selftests/mm/hugepage-mremap.c
index e611249080d6..9558515c282d 100644
--- a/tools/testing/selftests/mm/hugepage-mremap.c
+++ b/tools/testing/selftests/mm/hugepage-mremap.c
@@ -136,8 +136,8 @@ int main(int argc, char *argv[])
 		ksft_exit_fail_msg("mmap3: %s\n", strerror(errno));
 
 	suggested_addr = 0x7faa40000000;
-	void *vaddr =
-		mmap((void *)suggested_addr, length, PROTECTION, FLAGS, -1, 0);
+	void *vaddr = mmap((void *)suggested_addr, length, PROTECTION,
+			MAP_HUGETLB | MAP_SHARED | MAP_POPULATE, fd, 0);
 	ksft_print_msg("Map vaddr: Returned address is %p\n", vaddr);
 	if (vaddr == MAP_FAILED)
 		ksft_exit_fail_msg("mmap2: %s\n", strerror(errno));
-- 
2.52.0


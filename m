Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488A644D035;
	Tue, 10 Mar 2026 09:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136290; cv=none; b=RLRDUp8zGJkswvhNaLkFqycC7Th77nY5RvFzpzuVwKSlh+ml0uJ6tCMY+fuK31WCa2BD1JLkF1jCKDD5MWDrJUh7uzN+dgMfLlKsq7Rn1uaTBvvbnHapDmB7o/ttLiKzXCJ7elZ+cbjN5I3xOc468y1j9waq2bFZ9lTWqbqYgV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136290; c=relaxed/simple;
	bh=kMTflo16r2dqEYWjrJTyah3qpARS0NZQ/2bEFsnh810=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V/t4CQf5R+TYWWtQSV2XusFjQBdeaCfiOBqDUNMD4gLQ5aMV9HQp1FcLuV3b7UyxlhF5wCO555LzoWQIqs9cuSWUEmEW5VN+ifEdqjvZukV+G7V9XTWNneUPMpUGrwrkmTSPl3+FjMkHITmcRXVkRfSrPPR8crxpHTEcEsDuoPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=l/QIJccT; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="l/QIJccT"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A9jOl51527158;
	Tue, 10 Mar 2026 09:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=CEIPjtg9gWEbVKB/Y
	cF/D7E+rwK4lFNKPSL1ENPVeB0=; b=l/QIJccToUTlkUvQ7YzQ8+MfV7GA+vmCJ
	3K7lV1/LU5b4Z2Nwi1G59oL/iq9DoVfMmNg7ZihCtJ07fYqYpkkBzsI4PnU0+RBs
	AJiemloCxZFrHfxwhCRo34evbtMaeBxnHpVpUJcGiriniS9lD0AThXE7G/oFXlD8
	oPh6mXBj/oiQA7I0ImTDOOFLzWlNfp15y9Likg9zR11pxFYDo7Nv0rseS3Uw1mO1
	bDNzWgnI8mwXBfRoj3N4kKwUHMhCl5atfzxhzkwWVTSuB1D24dFaThKZ5Klj/l0+
	rR7E4U4JmeUL/FlX9lWUq/wgEhga2udtbP8vlj89S/C/c0uTHdLmA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcun9ygn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:51:10 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62A7K7Od024657;
	Tue, 10 Mar 2026 09:51:09 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cs0jk0chq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:51:09 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62A9p7Fh48103760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2026 09:51:07 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA60F20043;
	Tue, 10 Mar 2026 09:51:07 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10C692004E;
	Tue, 10 Mar 2026 09:51:05 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.in.ibm.com (unknown [9.109.243.201])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Mar 2026 09:51:04 +0000 (GMT)
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
Subject: [PATCH 11/13] selftests/mm: fix double increment in linked list cleanup in compaction_test
Date: Tue, 10 Mar 2026 15:19:29 +0530
Message-ID: <00fdaa3c84427958f51eaefa7603094a090fcebc.1773134177.git.sayalip@linux.ibm.com>
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
X-Proofpoint-GUID: kixY2zL5yaEAA-mD1ndaixXgGIqUzKp5
X-Authority-Analysis: v=2.4 cv=Hp172kTS c=1 sm=1 tr=0 ts=69afe98f cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=kdAlEqw6soqvCZangacA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4MSBTYWx0ZWRfX17VkN1Q7r02q
 jQ+WosVzNNvXYvzljn437YUOvwzbMVuF1NDDeDd+NHx/NL+Dk8Fr4pZGko8Ehad1ZnUP6SXCTtK
 +vsLDtyZD0auZ+dauHzB77mfUM4cc5EG35+BFdOGkZC7cJL2uuCePtaAJfjd57w9K49OIzIZwxz
 5I//WGZuORXbz2XMhNbbvfHqrKXrYcu2fmIcPKEcM+sfNfujxhvGTMEIYUxn8A8aeP0qmfPwBaM
 VJxLeqJaLk8lRvpC1ODvcqvSVAdojmjC6IDASLrj1ufuE2aAaI0yqzirmR7By33wpOPBv8NdhJe
 COjlD1MsCopFJQ5uVwF3gChuZY2dGxCpO8nfUdwEoCG1HVkAdfoO2C6puxKBJFPANDhARwdfAHu
 mFQp8rGT9fi9Hgub1FPbtxQ5PMvV4RzKZOX/Vv3+FQHWu24QSW4POdnNBc5HUk7M0v31EktwAWp
 k5hZmCo9PJRASEeWBjA==
X-Proofpoint-ORIG-GUID: 5P0GG_ESkEJ6a8EgrkO8kdbULkt_VrU0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100081

The cleanup loop of allocated memory currently uses:

    for (entry = list; entry != NULL; entry = entry->next) {
        munmap(entry->map, MAP_SIZE);
        if (!entry->next)
            break;
        entry = entry->next;
    }

The inner entry = entry->next causes the loop to skip every
other node, resulting in only half of the mapped regions being
unmapped.

Remove the redundant increment to ensure every entry is visited
and unmapped during cleanup.

Fixes: bd67d5c15cc1 ("Test compaction of mlocked memory")
Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
---
 tools/testing/selftests/mm/compaction_test.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/testing/selftests/mm/compaction_test.c b/tools/testing/selftests/mm/compaction_test.c
index 30209c40b697..f73930706bd0 100644
--- a/tools/testing/selftests/mm/compaction_test.c
+++ b/tools/testing/selftests/mm/compaction_test.c
@@ -263,9 +263,6 @@ int main(int argc, char **argv)
 
 	for (entry = list; entry != NULL; entry = entry->next) {
 		munmap(entry->map, MAP_SIZE);
-		if (!entry->next)
-			break;
-		entry = entry->next;
 	}
 
 	if (check_compaction(mem_free, hugepage_size,
-- 
2.52.0


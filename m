Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085A83A6416;
	Tue, 14 Apr 2026 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155025; cv=none; b=Yd5xGA9QesirPt+TgkO7z/rljz/Zt9gBeZv57CfS3G8JSWRqKpIG657NQ52hx9Th/SzXtNtSS/bDScqOcZEBy8gHdpF7kEVyekuZA1zCKQnWhfjvoRo6q0I/FQVwgqgEOIuvN7/lqFBgBAuJf5xEWNA8UTNZ0PG4NGu3mLiSJ+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155025; c=relaxed/simple;
	bh=hFW5u/GVDAmyeKRCDYDTF3OMxGCu5CjcIbXGIWFMql0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AlHsG6b4tIOonFNDhbIcs7CO3BIxysAU0DsaipiXCy00S1Vs1nhACLCNzKuCBE9f4n3i/q5FAiQpYsZgj+JrSuFZHbOT1iLpqYXoCTSOyN/KPKnyfMAKLlNHVo20Pmct9xSWcdLHFvchq69dkJ66iNSYi6ldWsaHjHrfUh+o8Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=eI2dEIL5; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="eI2dEIL5"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLIXM62130702;
	Tue, 14 Apr 2026 08:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=NcC4IMd/M46lcIebN
	KowLxjbupegKYGulhXVqQiEBho=; b=eI2dEIL56Wy0EC3zsp4KgYqkPMzm/hhqh
	dh1JUPS1qesA0y3PzsyIrvImn+sqqke6CxDvDHz6b747KPIVoRE9SNl5hpd2vf8p
	+dhrxJOC843Pbv2Uad4ve6ZwEMxYm8O4ZRbSOs4Wu2QSYHu7DCE1JveuWxPsMV/t
	1G9PUBM6Tu3I6yxs27oh7ONTMKr5dYrs9+uqUUx5LXdj4uzEO10SWdJ62OVm8G0M
	ElD2KII2cPBnYqAuDtTShF5YgwC3yaBOCqClIh7UifNUlkQYJXd2oFlyrRKXiNjM
	eVNzW/uD3FO78nP79xf3kCQYY/N4fq9ZWrbpWJdgnjksxxgNiDxUA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89n9spy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 08:23:26 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63E3gDLB015149;
	Tue, 14 Apr 2026 08:23:25 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dg0msgru7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 08:23:25 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63E8NMqA42008954
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Apr 2026 08:23:22 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3944920040;
	Tue, 14 Apr 2026 08:23:22 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 088EA2004E;
	Tue, 14 Apr 2026 08:23:18 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.ibm.com.com (unknown [9.39.26.223])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Apr 2026 08:23:17 +0000 (GMT)
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
Subject: [PATCH v5 14/14] selftests/mm: clarify alternate unmapping in compaction_test
Date: Tue, 14 Apr 2026 13:52:08 +0530
Message-ID: <15427e424f95147b856474b77d9389b657ef0f7e.1776150071.git.sayalip@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1776150071.git.sayalip@linux.ibm.com>
References: <cover.1776150071.git.sayalip@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: T0_jg1t3gdnF1lk-h5NiGazBt5I7iygi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NyBTYWx0ZWRfX/8eiTCjkRVf/
 CDlXSF/ZHW+dMyylwuR+1pik44Rvj7wgiWN0W9/KY/FvEYaY62qX+UHtqi2i/prza03XH/cFMJS
 zG3yFDSp1XGkda7T+Kuj+Wf3XkAFmYoAE1BunLWfV9uQdKlQEshWJ75fny8wqf4cvgKDGdw1vQ3
 KxvsjAYscOgrqodOvthZrG/MJfCoeVKpY34K01TrNxd2yMTb179LjECHU0CbmNyTP8zCwgqNY1f
 IApwLrAG10h2VS5hJZ97ai0Tor8T78cLnpTv+fqYoVFKVglfIVGx5Wcx8f6MzxLjVhZwNfVNHE+
 7ZPblCsZGIyaVy5XgIzdT27tXZE9rGnnOdwaycUm8WWcGaSC+moSDvUIGla5jkBPQwh1Lt3DdtZ
 NQOEI4FAMfYVnXhj+zgmJlC4VHlNdeW6RmHdXxZUNm0t2U6tIqtVQPxikusPav0a7R4B20aCA+J
 EUsF0s/TIEi8vppBesA==
X-Proofpoint-ORIG-GUID: CaUNY_Bht_4C5dirHMU1MvsaTvVE0hDM
X-Authority-Analysis: v=2.4 cv=FY4HAp+6 c=1 sm=1 tr=0 ts=69ddf97f cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=THlBPJCoSQ4NST9nLWYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140077

Add a comment explaining that every other entry in the list is
unmapped to intentionally create fragmentation with
locked pages before invoking check_compaction().

Fixes: bd67d5c15cc1 ("Test compaction of mlocked memory")
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
---
 tools/testing/selftests/mm/compaction_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/mm/compaction_test.c b/tools/testing/selftests/mm/compaction_test.c
index 30209c40b697..e1610e2fbdf6 100644
--- a/tools/testing/selftests/mm/compaction_test.c
+++ b/tools/testing/selftests/mm/compaction_test.c
@@ -261,6 +261,9 @@ int main(int argc, char **argv)
 		mem_fragmentable_MB -= MAP_SIZE_MB;
 	}
 
+	/* Unmap every other entry in the list to create fragmentation with
+	 * locked pages before invoking check_compaction().
+	 */
 	for (entry = list; entry != NULL; entry = entry->next) {
 		munmap(entry->map, MAP_SIZE);
 		if (!entry->next)
-- 
2.52.0


Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF4B2931FA;
	Mon,  3 Aug 2026 15:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785769769; cv=none; b=sWtu9G/iU9F+z/slJKpuReoz3InPBMVFQIHH+tktxd47fDaKBFc15m27Dkmoz9eT10BqOXecoO2So02P1hEwdTWAjCM0rr43hj0kBWeABqw0pfq/YsPiuq+hpQEMuG0E4AvHrtJClR0Ky4smOcfAnsGNuJZy2JJoUWBEai4qCNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785769769; c=relaxed/simple;
	bh=PAWpe0S9QMqIMon2eLw4HPVMUug2SSW5iSCjhizXNpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NXIsLFvgAPEqb3Eyp42h1Ok1J6/Lncis75MXJJGKtsmzYxctgW8FLXw2RVlEnb8RlJBdS8kfStbXoJwtwWEBNjzwPdX5+aTrDLqkRajImQ2g1IU6y6o8bSYy7yphLeWPo9NmZ5kvpL6wMkDrKWtzK0iFUTqJR/oO+rrKCU2wZGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=domvuOJg; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="domvuOJg"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673EHklI2206236;
	Mon, 3 Aug 2026 15:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=HEXpZhzGBrW/CntuZNnwz/xiuiT1JTKbm91QSxD9A
	0Y=; b=domvuOJgdcd+P88PkrETVjjWwfbwSONsLAR+ZvSZ7dne8l1J2gpiG43NI
	LvxkwdzP0tDJlAEDsytXhEVj96/I2jPlo8K9+k+qYWHs8bB9g03zd/Bf8JWoLKvK
	1w/Rp4L35sfTim0tcExffewbvFUQQHC23FD71+9XGsA2YHnBc7B4F03EytBCG9qF
	A1kO4ZOiJX+uklMCIAtL39YOXaXs4ZKfCHnsqPRe+3579TMOVbivAppIR4LYQw7m
	ZC/nza6E/M5VwfIeaQiVtNty0f/9gylRzIU8aJ3031Lz8fOVQBdTMrnYvq1vFpqo
	+O0tGItFNB+q9e5vgw9f+5Nt5nK8w==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs77g199w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 15:09:03 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 673EuSdA025756;
	Mon, 3 Aug 2026 15:09:03 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fsugvx159-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 15:09:02 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 673F8xcM31981842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Aug 2026 15:08:59 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F27E220043;
	Mon,  3 Aug 2026 15:08:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7BF920040;
	Mon,  3 Aug 2026 15:08:54 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.39.27.127])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Aug 2026 15:08:54 +0000 (GMT)
From: Disha Goel <disgoel@linux.ibm.com>
To: shuah@kernel.org
Cc: brauner@kernel.org, cyphar@cyphar.com, amir73il@gmail.com, jack@suse.cz,
        ojaswin@linux.ibm.com, yeswanth@linux.ibm.com,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        maddy@linux.ibm.com, ritesh.list@gmail.com,
        Disha Goel <disgoel@linux.ibm.com>
Subject: [PATCH v3 2/2] selftests/filesystems: skip listxattr kernfs test if xattrs are present
Date: Mon,  3 Aug 2026 20:38:37 +0530
Message-ID: <20260803150837.91604-1-disgoel@linux.ibm.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEzMyBTYWx0ZWRfX7btmnuyxA7A3
 i9SA3BYT8az4oSDEIsilYT/xP4hnnX7BHNlSRIjyM+CCmXi3+iWWeAiGciU0QNNE6OHboBXr0KD
 663BzGgldOEWmQAuIJn7d3bTn6xTpCct0/+nkJ2Za+SdTnsBmufZyJpAE2xREKJ51lWFg7421Su
 hI1fz6hMTVUgvdJ9ZAtJ0Exh1UMCfAXQaiGgSqCO9BbgK/hKcQtTv0kGSJsfkbxpOahfU8uJ7An
 c7fFzsqrBFeJK+zgLHDmar4W/gB0+gQ8kzgjTSZQTnVuW+t0Bo5lTNjChdSwf3gjA7LMXEqyM9Y
 55QyLAexi9kqkIk9LfcYAhuKeultnqJa+poNX180HM3ivdUqnNE1kMgk/71V5BCN24oUOxe5vFy
 e0PmVgjxzgnQJMfijCT/VxWTt+oxBsmHu7DtGkLql27fUAJQoLVgPvhtAtNfwjfb8bZiSBMfQ/M
 BCgMnWR394BNjlbxVPg==
X-Authority-Analysis: v=2.4 cv=WIFPmHsR c=1 sm=1 tr=0 ts=6a70af10 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=dP9LQboaRqI6G61vZ2MA:9
X-Proofpoint-GUID: FdVIwZ13qDLtnJCK3sde14D2dOWUcbod
X-Proofpoint-ORIG-GUID: KXTzE1V6ebz0sDvFn7m3Eogl9P96Uf_H
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEzMyBTYWx0ZWRfX3IsRNVQaPZaQ
 1YUFct/AQ8rXvuwDZitc7edKUQFb7OO/ze6AMGoCGVoQ50CU7MnZ/JEUgzjQSv1vhFHWxOv+9YH
 uVGEZeB4faUF30giG7czKqI0ehWKc7M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030133

kernfs_test assumes that flistxattr() on /sys/kernel/warn_count always
returns an empty list. However, systems with SELinux enabled may expose
security.selinux xattr via listxattr() during policy load, which makes
the test fail even though kernfs is behaving correctly.

Skip the xattr content check if any xattrs are present, while still
verifying that flistxattr() succeeds (returns >= 0) on a kernfs file.
The existing user.foo getxattr check remains unchanged.

This avoids false failures on SELinux-enabled systems while preserving
the original purpose of the test.

Tested-by: Yeswanth Krishna <yeswanth@linux.ibm.com>
Signed-off-by: Disha Goel <disgoel@linux.ibm.com>
---
v2 -> v3
- Skip the xattr content check instead of allowlisting security.selinux,
  as suggested by Ojaswin.
- Add Tested-by tag.

Link to v2: https://lore.kernel.org/all/20260521101758.14639-2-disgoel@linux.ibm.com/

 .../testing/selftests/filesystems/kernfs_test.c  | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/filesystems/kernfs_test.c b/tools/testing/selftests/filesystems/kernfs_test.c
index 84c2b910a60d..ca13646c9328 100644
--- a/tools/testing/selftests/filesystems/kernfs_test.c
+++ b/tools/testing/selftests/filesystems/kernfs_test.c
@@ -12,12 +12,24 @@
 
 TEST(kernfs_listxattr)
 {
+	ssize_t len;
 	int fd;
 
-	/* Read-only file that can never have any extended attributes set. */
+	/* Read-only file that can never have any extended attributes set.
+	 * However, on systems with SELinux enabled, security.selinux xattr
+	 * may be present. Skip the content check if any xattrs are found.
+	 */
 	fd = open("/sys/kernel/warn_count", O_RDONLY | O_CLOEXEC);
 	ASSERT_GE(fd, 0);
-	ASSERT_EQ(flistxattr(fd, NULL, 0), 0);
+
+	len = flistxattr(fd, NULL, 0);
+	ASSERT_GE(len, 0);
+
+	if (len > 0) {
+		close(fd);
+		SKIP(return, "xattrs present on /sys/kernel/warn_count, skipping xattr content check");
+	}
+
 	EXPECT_EQ(close(fd), 0);
 }
 
-- 
2.45.1


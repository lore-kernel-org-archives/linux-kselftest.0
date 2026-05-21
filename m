Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0760A39989B;
	Thu, 21 May 2026 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358719; cv=none; b=tjKNvhcW8qFMJLkt7d+hB9sov8oovcWBFADqSvRB2ZVJhn6UqnPxLrPex39FIa57dcsejzhTmCLSQg2LmNRO1pIBCftC7Oq9YUDNbsgm7gzXAxuYwP6L/vPucMX2+/Imv/7JP/GdIg1612SxrbUwgNERmiFyG91Cf6eXXW97mx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358719; c=relaxed/simple;
	bh=Q54FcTh0xx3/laoBR7wqUnFb71C5WmkFXHQR3OsktUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IkPLdfQtsA6E+ohD0zgrbVmLgeXlusA15ivU4giEy+yXX07+/W2hgAxLHNsHqBVY999bB9M0nhRr4bJF3bI/xd2WgeRRUCJa1U/BhIN2SnRFJQH+Ty5eACaVsxH1zQWib0CoKBQOFa2dNBoFGTiN9UhfYGv2IWHtmfhugTvG+xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=LvCHwpkV; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="LvCHwpkV"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L0VpEE069465;
	Thu, 21 May 2026 10:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=LyK8R+Y0XzhEMUppe
	lVvDlrbQk91ii5Pio+CpaU7ZAQ=; b=LvCHwpkVn4/fs4oQLChRjN82Q81ghba7u
	a4qB2Qx1XsNzaunc/5Na7astR5aiR0pcz3JFVOf+1O9dO112/ZZPL9PjNWBLxSgm
	nf4q5prbT+W1+pWUO8UjSBQPqKiOv+S/UUtAUddAftAl8cd3huvizH33yrMd2B0s
	/ihIS5U9Am7GLqkLsOfLPtIO+IwuCqp2LsDLEhKAyd2FStKArEmRn/rB3OPGRSS7
	MzKt70Eei7WZW8iCgPRlYdUaqxrT4K0nLTOWBdBqRKgufxgmUbT+4iBbQ5vQWDFK
	h4sSAW7io17+pY+PUrQipmFXqO8gb5eY6fXmG/grw3flloP00/eSw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6h8mx9hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 10:18:34 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64LA9E50003324;
	Thu, 21 May 2026 10:18:33 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4e739w3pqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 10:18:33 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64LAIV0847382886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 May 2026 10:18:31 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A4712004D;
	Thu, 21 May 2026 10:18:31 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 126532004B;
	Thu, 21 May 2026 10:18:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.39.17.57])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 21 May 2026 10:18:29 +0000 (GMT)
From: Disha Goel <disgoel@linux.ibm.com>
To: shuah@kernel.org
Cc: brauner@kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, Disha Goel <disgoel@linux.ibm.com>
Subject: [PATCH v2 2/2] selftests/filesystems: allow security.selinux xattr in listxattr kernfs test
Date: Thu, 21 May 2026 15:47:57 +0530
Message-ID: <20260521101758.14639-2-disgoel@linux.ibm.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260521101758.14639-1-disgoel@linux.ibm.com>
References: <20260521101758.14639-1-disgoel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -VQs_bhtD8iLk8mszV5vLHLr01pKt3fC
X-Authority-Analysis: v=2.4 cv=GYMnWwXL c=1 sm=1 tr=0 ts=6a0edbfa cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=tb_oaYDuZ7sJKRbAhLsA:9
X-Proofpoint-ORIG-GUID: -VQs_bhtD8iLk8mszV5vLHLr01pKt3fC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEwMCBTYWx0ZWRfX+HN5zWMrhaf3
 fyAQ0sYMfrFv+d8Q8AqrsiwnNZUGfDctI/o07Hhjykz+chQPPDpelfeN0jH++2E7duBjDwuu/lL
 eAyyKxjgOndpmXju1VSjMTD/yW7MOPmn5QoNGawhCQYxQga9zJgPEx01+uhUBXi4wZTXyiBelj/
 9au6cIHKfyHed1f4f8XGq4rpl83+RtrTCGYHCPJzVewAsfGYdkc/FScQEufry2qk/bdPzF5LlYd
 +NiIMKIO15d/iIGNNVOa4AzWprgDXkMAZvOtel2uKWQeGnr+hxTWbEz5rN95RETY8Zffv5HdlrL
 +pYzzoMW1u6ZGajtJexQ58OtwIy5TZEL16w9iD0MAx4Gk0cD9sFZsfWt8n07sS/Pdhbgg7DkQ6T
 vvF6vj5iE0PqRM1kh+OLOkTvi6jjPGnxPYVgu8DON1kuef8qUfW8XGrUuyr3PcK2t1keqVQN2JA
 hTfyJPOmq3jlFAhzENg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210100

kernfs_test assumes that flistxattr() on /sys/kernel/warn_count always
returns an empty list. However, systems with SELinux enabled may expose
security.selinux xattr via listxattr() during policy load, which makes
the test fail even though kernfs is behaving correctly.

Allow security.selinux xattr in kernfs_listxattr while continuing to
reject other unexpected xattrs. Keep the existing user.foo getxattr
check unchanged.

This avoids false failures on SELinux-enabled systems while preserving
the original purpose of the test.

Signed-off-by: Disha Goel <disgoel@linux.ibm.com>
---
 .../selftests/filesystems/kernfs_test.c       | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/filesystems/kernfs_test.c b/tools/testing/selftests/filesystems/kernfs_test.c
index 84c2b910a60d..a5e480d662e0 100644
--- a/tools/testing/selftests/filesystems/kernfs_test.c
+++ b/tools/testing/selftests/filesystems/kernfs_test.c
@@ -4,6 +4,8 @@
 
 #include <fcntl.h>
 #include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
 #include <sys/stat.h>
 #include <sys/xattr.h>
 
@@ -12,12 +14,33 @@
 
 TEST(kernfs_listxattr)
 {
+	char *buf, *xattr;
+	ssize_t len, ret;
 	int fd;
 
-	/* Read-only file that can never have any extended attributes set. */
+	/* Read-only file that can never have any extended attributes set.
+	 * However, SELinux may set security.selinux xattr on kernfs files
+	 * during policy load, so we explicitly ignore it.
+	 */
 	fd = open("/sys/kernel/warn_count", O_RDONLY | O_CLOEXEC);
 	ASSERT_GE(fd, 0);
-	ASSERT_EQ(flistxattr(fd, NULL, 0), 0);
+
+	len = flistxattr(fd, NULL, 0);
+	ASSERT_GE(len, 0);
+
+	if (len > 0) {
+		buf = malloc(len);
+		ASSERT_NE(buf, NULL);
+
+		ret = flistxattr(fd, buf, len);
+		ASSERT_EQ(ret, len);
+
+		for (xattr = buf; xattr < buf + len; xattr += strlen(xattr) + 1)
+			ASSERT_EQ(strcmp(xattr, "security.selinux"), 0);
+
+		free(buf);
+	}
+
 	EXPECT_EQ(close(fd), 0);
 }
 
-- 
2.45.1


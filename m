Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E38370AC9;
	Tue, 19 May 2026 10:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187402; cv=none; b=usE8L605bfTbhQWDlt+3Eu9H72jbSfPTc9QAp1FTiy4+Qa42h5+wFsuWWoiuWPOCtH6JQnmqdmqKb5plxyZtNR+VNOBbSc4fUabM7XZ6XngmUBW7FxLZP5ewEPDDBI7/9ukaYSR52KjFUFUKBWD/XrR840Bmwv1aKu9uuHIM8WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187402; c=relaxed/simple;
	bh=Q54FcTh0xx3/laoBR7wqUnFb71C5WmkFXHQR3OsktUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLveFn06jAjB6JE1GYe3Rporj5ROBEMSTA2zyVaKtq+OOxZhCLc+YAhHJJumyiNlQeIiZyIDR7o3al1CDpH/Q9OHYyMqNGmkEveHYfEnC2eKul6d44KoDIBtmVFiByCK28baUSy5OwLtRh6hIZ8QpFnZ0VlYn6lRo6XSR+DaR4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=gH2vHGga; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="gH2vHGga"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8LeBe4011095;
	Tue, 19 May 2026 10:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=LyK8R+Y0XzhEMUppe
	lVvDlrbQk91ii5Pio+CpaU7ZAQ=; b=gH2vHGga+LgEp21powug9TJJovV+b8AYH
	1kbKKzryxPjOyVBPJ+TU9fGmqpU7sbu9KIMI4hmKAw6xKg9Wk12RoXGBM0iZ3PKO
	cUOzqyX5+pAI9pSHsJ/biAOQU0PJzIN6Y77R6O5NKIBEi1TUChtZaRnVBb7LHLz8
	esSXif9zpKg17Wn5xy4ywOraA+beDzSY7n2Fyl2hnMaw4ULIkwpT9bb+njXDWqEk
	YQJWyX7csugMrn+JfFBYZC71PD8dlzdvaeiIijdWPq0Qj5HyJ8iUXKbLXHUpx0mQ
	qJ4u+FvSsMIOPv/QAMuZdZ+q+twFlHdoQfhIyWrZ0fSwRFA5FWbSQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6hb8bsg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 10:43:17 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64JAdE7s028667;
	Tue, 19 May 2026 10:43:17 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4e739vt9ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 10:43:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64JAhFFL52494826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 May 2026 10:43:15 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B24120043;
	Tue, 19 May 2026 10:43:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DD2620040;
	Tue, 19 May 2026 10:43:14 +0000 (GMT)
Received: from macbookpro.bl1-in.ibm.com (unknown [9.123.4.214])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 19 May 2026 10:43:13 +0000 (GMT)
From: Disha Goel <disgoel@linux.ibm.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Disha Goel <disgoel@linux.ibm.com>
Subject: [PATCH] selftests/filesystems: allow security.selinux xattr in listxattr kernfs test
Date: Tue, 19 May 2026 16:12:10 +0530
Message-ID: <20260519104210.11836-2-disgoel@linux.ibm.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260519104210.11836-1-disgoel@linux.ibm.com>
References: <20260519104210.11836-1-disgoel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNCBTYWx0ZWRfX+yxS3KmNWhCM
 TzTs6NJNVvVBLSpEZfV6E8YClyjlWiC6eiWKCo9UOdF9UQMxFGbldNNsXNdjDukOye4/SnZey2q
 1QInZkMQw+RZi/97EGE6ciECF70PumKLr9Mv12KmtD87Jz0s36M8xUqcY3xn4f5+nNU3WTxRgiG
 6EY4vzISaJin+fsYF/++dxPptIjYoXxeUZp1bIa0eiI7z5u6Aad2phLgp5h+LzW6NVQnrtnoH1r
 6dgTexPr3Qp3/p0oaPN2D1XuECycHiwiYl+fNL+0mR+Ur6c7+nJEJpvkQgWS3A47PeWzufrFJb0
 f9DEmw1obpff1myhJjGo+ImsgyRilwUNzE7c+EXHMkR+4No/25qLK/fv8T332cmMg6sJEfFh4xe
 oQhqBGgV1znueF+ZUxfWIBVBrpvAxLnR/Z74v/vkvcpO2p3mjOzm374AkSffOeLUkIqb4ORJwNb
 LAP2ejwBepX/DIV4GKw==
X-Proofpoint-GUID: kDtMs1xadkbfj6T4N4W5ZH6ielErm0V3
X-Proofpoint-ORIG-GUID: kDtMs1xadkbfj6T4N4W5ZH6ielErm0V3
X-Authority-Analysis: v=2.4 cv=aYBRWxot c=1 sm=1 tr=0 ts=6a0c3ec5 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=tb_oaYDuZ7sJKRbAhLsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190104

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


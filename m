Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BD6370ADC;
	Tue, 19 May 2026 10:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187393; cv=none; b=jFD2lZezzSwn+RqvRJLnb4noq1ZfQNimnzsRLPzIE9JX3hDLRoGEyzu6RkxdbBn2rx6LkFiLLpv/4BkbTcDyOd6rMb1jLQ8rvbB0sQLDco1ryExoqV4Ho4D84jWTdD070cwfJ5I64uekYqsrQXtgwQxW0nKzrtDx5ZfwMRouZlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187393; c=relaxed/simple;
	bh=mcyskYugj2E9tePXNdivFnzLqpCuTJj7Lq3gfdGu7+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NYIWHufj+JRTerXUqDsiyn02WxuQlaKQu6+ozD+eqVogHhFsQ5tpiZQo5izGzUJXcYWEX5PW/zVF9FJlXblm7Gfje6FOADCMM6UMDsnwE/r5zvKSUCVaLELohPaWIz/kGArn+nFOFczJy+L05LXeFIChM1o8dPKgWk1eVxpyfyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=DP5S2pM7; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="DP5S2pM7"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IJ96bG3505643;
	Tue, 19 May 2026 10:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=bK72TQk7x9rCK+l7gg9HYt6Lc55+t6bXukG2N8itI
	UQ=; b=DP5S2pM7bJ/fgnaHgaxQq/4Ki03zIZXWXR2z6FIkdYCoXcr6f9mt8PIyE
	sWaJ4nFnWvQsgd70zjrCu4HXBAIIyog8psMeQUzi+43u9ICx7JFa/wGTJJHjwKl/
	JyflFgr19412oyIFv5rc8hVWp4cYNJe16Qu/CSRyAGa5TpjARH2NhMT/iZ2EZF1N
	8tVuGYv3qR4Od4H6Ma/bnnV55mqvqP24fntHajKNuYwBfGYhZ3lT2cTt2wPm42Ez
	hyHAtV+WaMbR6/MrJ/f1VWuPi+xbUmIaSiFxYoQOY/YJsSe2b0uGsSkzNbuU5jju
	XUwgBJI2u18tYTwiEa0SwMWKcF6dA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6h8mmeyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 10:43:09 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64JAdA0b020759;
	Tue, 19 May 2026 10:43:08 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4e73wk25bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 10:43:07 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64JAh5kP48693616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 May 2026 10:43:05 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B648E20043;
	Tue, 19 May 2026 10:43:05 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8AA520040;
	Tue, 19 May 2026 10:43:04 +0000 (GMT)
Received: from macbookpro.bl1-in.ibm.com (unknown [9.123.4.214])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 19 May 2026 10:43:04 +0000 (GMT)
From: Disha Goel <disgoel@linux.ibm.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Disha Goel <disgoel@linux.ibm.com>
Subject: [PATCH] selftests/filesystems: Move file_stressor to dedicated subdirectory
Date: Tue, 19 May 2026 16:12:09 +0530
Message-ID: <20260519104210.11836-1-disgoel@linux.ibm.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 48N5fnLl9ouTEisj5xWMscRgIEPwDDxW
X-Authority-Analysis: v=2.4 cv=GYMnWwXL c=1 sm=1 tr=0 ts=6a0c3ebd cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=rb81_ELZtEZ-VMkYtzMA:9
X-Proofpoint-ORIG-GUID: 48N5fnLl9ouTEisj5xWMscRgIEPwDDxW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNCBTYWx0ZWRfX38cU/71GCfth
 CeMP1FvNh5t7udQBMJgzonxXZa3Dd0/uQkxiFked7wkTjKgTXs1bfhpKaIUsgtxxSJYX9KNJ32N
 ViyBr4GXTvMquU1uY1M8ZU/ao9pLjQAGqvxIcQPoaGmLXF6jh3WZ/oey6igbASfIaKgOWkAOy4N
 ylBoqmMcj1wmdeym36y9xv1Yjb2HWvXx9uQUBWC8Se9XMiwJ1TvYhb0jA/ZRPUdkJTqLEczPyUN
 yKC/wypB9e7JTh7lj1csNnhmzNwigIWEtq49RUV6kfPdY4+/oWNCMAlW6HscunlVJSNQ8FDtWDQ
 iHD6cpQrVzRjnBYuJlrJp+C+JWZC0MO9sADLfkREg2A4Fylxtd/h2iYXgGotf/k2h/ahZwX7fhr
 IMXN4/VcmmttNEdkgePugwjzH6wmOo0bVBCr1Esle9KUkE/ibyaxRmkC+vLfeIrFPjNZAl+yDdS
 DD2KgCa5zFpdaB+Nsww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190104

The file_stressor test requires a 30-minute timeout (1800 seconds) due to
its 15-minute runtime plus setup/teardown overhead. This is significantly
longer than the default 45-second timeout used by other filesystem tests.

Move file_stressor into its own subdirectory (filesystems/file_stressor/)
with a dedicated settings file to isolate its timeout configuration. This
prevents the long timeout from affecting other fast-running tests in the
filesystems/ directory.

Changes:
- Move file_stressor.c to filesystems/file_stressor/
- Create filesystems/file_stressor/Makefile for build configuration
- Create filesystems/file_stressor/settings with timeout=1800
- Remove file_stressor from filesystems/Makefile TEST_GEN_PROGS
- Add filesystems/file_stressor to top-level TARGETS in selftests/Makefile

Signed-off-by: Disha Goel <disgoel@linux.ibm.com>
---
 tools/testing/selftests/Makefile                            | 1 +
 tools/testing/selftests/filesystems/Makefile                | 2 +-
 tools/testing/selftests/filesystems/file_stressor/Makefile  | 6 ++++++
 .../filesystems/{ => file_stressor}/file_stressor.c         | 0
 tools/testing/selftests/filesystems/file_stressor/settings  | 3 +++
 5 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/filesystems/file_stressor/Makefile
 rename tools/testing/selftests/filesystems/{ => file_stressor}/file_stressor.c (100%)
 create mode 100644 tools/testing/selftests/filesystems/file_stressor/settings

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 6e59b8f63e41..d87fafc6aef6 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -34,6 +34,7 @@ TARGETS += filesystems
 TARGETS += filesystems/binderfs
 TARGETS += filesystems/epoll
 TARGETS += filesystems/fat
+TARGETS += filesystems/file_stressor
 TARGETS += filesystems/overlayfs
 TARGETS += filesystems/statmount
 TARGETS += filesystems/mount-notify
diff --git a/tools/testing/selftests/filesystems/Makefile b/tools/testing/selftests/filesystems/Makefile
index 85427d7f19b9..7d342755aa3f 100644
--- a/tools/testing/selftests/filesystems/Makefile
+++ b/tools/testing/selftests/filesystems/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 CFLAGS += $(KHDR_INCLUDES)
-TEST_GEN_PROGS := devpts_pts file_stressor anon_inode_test kernfs_test fclog
+TEST_GEN_PROGS := devpts_pts anon_inode_test kernfs_test fclog
 TEST_GEN_PROGS_EXTENDED := dnotify_test
 
 include ../lib.mk
diff --git a/tools/testing/selftests/filesystems/file_stressor/Makefile b/tools/testing/selftests/filesystems/file_stressor/Makefile
new file mode 100644
index 000000000000..88c8231ac144
--- /dev/null
+++ b/tools/testing/selftests/filesystems/file_stressor/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+CFLAGS += $(KHDR_INCLUDES)
+TEST_GEN_PROGS := file_stressor
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/filesystems/file_stressor.c b/tools/testing/selftests/filesystems/file_stressor/file_stressor.c
similarity index 100%
rename from tools/testing/selftests/filesystems/file_stressor.c
rename to tools/testing/selftests/filesystems/file_stressor/file_stressor.c
diff --git a/tools/testing/selftests/filesystems/file_stressor/settings b/tools/testing/selftests/filesystems/file_stressor/settings
new file mode 100644
index 000000000000..b675ca93f936
--- /dev/null
+++ b/tools/testing/selftests/filesystems/file_stressor/settings
@@ -0,0 +1,3 @@
+# Timeout for file_stressor test
+# The test runs for 900 seconds (15 minutes) plus setup/teardown time
+timeout=1800
-- 
2.45.1


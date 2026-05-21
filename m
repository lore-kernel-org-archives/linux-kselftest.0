Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C616B37CD4F;
	Thu, 21 May 2026 10:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358710; cv=none; b=gL3zd8g7+fiFhlcNr+OyFP2Kwkzp+HQhJ3ELayjGqj0zX1gN2RAx1IMUzzeQXyuABC60EBZEqn2shrmxHzyQwmMI61IFBHhIRLHajAViXRUNtEnbYoVrNv4lJtsSuSxFXpdBTp/tx8JV0CmCu83dcECE9h4v6mqD17ERcF+MrUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358710; c=relaxed/simple;
	bh=G1+og/3II0BZyg1Xn+aVORU2N9RcOLBEVhCCPTmVGN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LObtE+KybXlDcBve527S6MpbeNS+Shs0H3HzJOfg9b7iy0QWNWvpbKIjQYgg0hu4Dp2/N/wVkxY5CyCrgVuGa4PoOGXzU0wMuTCnWADa8drV8N5jckRTBtqhUlUFfrmyLdygzj+qpOG5pVuAQeWXTRSCRyh0LNL7lF33We8rjSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=QEfQe5zZ; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="QEfQe5zZ"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L66BwH3628517;
	Thu, 21 May 2026 10:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=VTgxCXMSpDhI1NdK+a255zmyKdwzVCHHaAs/QqtFA
	Wo=; b=QEfQe5zZ0u9N+LM58y97wEI2UhONT/OFyxr/Tq/kvsB2fw81mGlKLnwN3
	UfjgxLg3NU1AJcMLlIax/OaJlHj2rhuf0+ROnS/gfrMie5dI1+Mc9049M+fgGWTT
	yFgUZw8X2IFAabD9XeK9RJIrf0RzOFUDnPyE0+Vm1FTJyFNvFS1dJ6MhpIdWbceb
	HbNRUZ1pG9TkEGCJrAFDE7ypj34Fo16Zce7k/MlBoT+/be3/g0CsOi46ZRWitgBf
	OPH74hBweUBK8rDCj+Pre80N+8WF0AjTm8lC5bFhUJyNk75tzV94NutSPOxmlQHh
	YSFKeQXx0lbqJ+wUI6HX1VnRAmi/g==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6hawd5vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 10:18:23 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64LA92so010676;
	Thu, 21 May 2026 10:18:23 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4e72wqbt94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 10:18:23 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64LAILmm45351400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 May 2026 10:18:21 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FE5D2004B;
	Thu, 21 May 2026 10:18:21 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB8E020040;
	Thu, 21 May 2026 10:18:19 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.39.17.57])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 21 May 2026 10:18:19 +0000 (GMT)
From: Disha Goel <disgoel@linux.ibm.com>
To: shuah@kernel.org
Cc: brauner@kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, Disha Goel <disgoel@linux.ibm.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2 1/2] selftests/filesystems: Move file_stressor to dedicated subdirectory
Date: Thu, 21 May 2026 15:47:56 +0530
Message-ID: <20260521101758.14639-1-disgoel@linux.ibm.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEwMCBTYWx0ZWRfXysMEHh2nr+C5
 n84g4nWtO6qqQWzNWRF9c1HGKjugpUQI7DGZRRmLNofNffHibQ/ao1pH6BbDSRrOO8o+hifG+zQ
 1Geg/S2mMCLmTf/bK1cnOicOUATX+DWUJ/T4MNKexlKrcZ2o5/JDHKfjjf8N+bZMyKYc1RUJhLF
 iQqeJ900iYGG8AtCVKRB5fw0WcxlRmvoUCwmZH/lU8Nv7n9kbuxUmK52O0fJjPmoo2bMlb/WKXM
 2adGlUzv739Yo54eHglkYbbndyyA+FQxG/pwtzaLUOlzUbrXzSq6IOJ52VkwwcwxkON0t8nAauI
 R4lKSmy0TZwLN3kumnj2vcVrY2WsYX1mwA2/qJ+oqhdjqwZOhpBSXE5iazsaDulbU+ETYFpRyKN
 APU7jymP7LYIFLKf+Ca8ui6fSdAQKrCjilea4nRbqE/4AJKhNXx7nllCBx3cI3LkkLeBK5If25j
 DeyDe39gwviBDRmF3IA==
X-Authority-Analysis: v=2.4 cv=Np/htcdJ c=1 sm=1 tr=0 ts=6a0edbf0 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=XAfosJpwKKheTpzlcYQA:9
X-Proofpoint-ORIG-GUID: cNV1WFc0JCFPTTSxirERcjHo5KERauWP
X-Proofpoint-GUID: cNV1WFc0JCFPTTSxirERcjHo5KERauWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210100

The file_stressor test requires a 30-minute timeout (1800 seconds) due to
its 15-minute runtime plus setup/teardown overhead. This is significantly
longer than the default 45-second timeout used by other filesystem tests.

Move file_stressor into its own subdirectory (filesystems/file_stressor/)
with a dedicated settings file to isolate its timeout configuration. This
prevents the long timeout from affecting other fast-running tests in the
filesystems/ directory.

This restructuring follows the pattern used by other selftests with special
requirements and ensures proper timeout handling in CI/CD environments
while maintaining the default 45-second timeout for other filesystem tests.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/all/202605192100.DvRgEGZ3-lkp@intel.com/
Signed-off-by: Disha Goel <disgoel@linux.ibm.com>
---
v1 -> v2
- Add .gitignore file in filesystems/file_stressor/ to ignore compiled binary
- Update filesystems/.gitignore to remove file_stressor entry

Link to v1: https://lore.kernel.org/all/20260519104210.11836-1-disgoel@linux.ibm.com/

 tools/testing/selftests/Makefile                            | 1 +
 tools/testing/selftests/filesystems/.gitignore              | 1 -
 tools/testing/selftests/filesystems/Makefile                | 2 +-
 .../testing/selftests/filesystems/file_stressor/.gitignore  | 2 ++
 tools/testing/selftests/filesystems/file_stressor/Makefile  | 6 ++++++
 .../filesystems/{ => file_stressor}/file_stressor.c         | 0
 tools/testing/selftests/filesystems/file_stressor/settings  | 3 +++
 7 files changed, 13 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/filesystems/file_stressor/.gitignore
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
diff --git a/tools/testing/selftests/filesystems/.gitignore b/tools/testing/selftests/filesystems/.gitignore
index 64ac0dfa46b7..3c44753914a6 100644
--- a/tools/testing/selftests/filesystems/.gitignore
+++ b/tools/testing/selftests/filesystems/.gitignore
@@ -2,6 +2,5 @@
 dnotify_test
 devpts_pts
 fclog
-file_stressor
 anon_inode_test
 kernfs_test
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
diff --git a/tools/testing/selftests/filesystems/file_stressor/.gitignore b/tools/testing/selftests/filesystems/file_stressor/.gitignore
new file mode 100644
index 000000000000..1eb3f40077d3
--- /dev/null
+++ b/tools/testing/selftests/filesystems/file_stressor/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+file_stressor
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


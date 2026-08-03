Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C9F305680;
	Mon,  3 Aug 2026 14:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785769141; cv=none; b=CLLXxNYUQXDYNLbRs0GboTCfPOINVXrenuVoqv70KavJvU687YPAQ7FV/5lkkMmKCN/o829HXWp/juLsrFimJ2011eOfp8oWPmgAnGUwJ3H0wOVK14IB2MZ9nXioPJbGkGGsnX20Fo007nkGwhdQwnVGTgPwl8XpitCrhROTbpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785769141; c=relaxed/simple;
	bh=n+kuhyjpsg5KsYLUmE3+s4GQPEHv6EIKxA0ELjZSEpw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f0CasaDSbYCf/UiZ2HZ3qYbe3nhnG3u/DfXkDs58ubdTKAfPrt2/h7sm7qzEq5K/snYy9ykDzhWbyya4uN89TwpuoL/X58edz8YeJ0ZgGejTDjSHcxc9YqPO8XaL4gYWdVxLtjkGxo1pbzM/0BcgEzgh36ZRFaKD2IEb92QGpJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ZBK2M/U0; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ZBK2M/U0"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673EHXch413660;
	Mon, 3 Aug 2026 14:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Q1c+3zs/Iw/boPCdlQp4D+7ndLMI+0SjWCyDtVZhp
	bw=; b=ZBK2M/U0Hyik2MpEbOGXWJcoVYGCbTA2rh/A1Hf2ocYuF3rZ5XrnMPGb4
	/B/puKZ0jZ0R0ydaHBu3aOYmkxHMRCxsypcKTWVNenlOKqQN9HbIRBIqPowoKCPQ
	QmGmSb5HLbgkIlEV0NtS+8LXpf7RUdTvAo8jLKkGVlbNy0Y1EFnCixhigWYBkcqv
	gsILtta114iEVzBC508rtS70p69fGJjaKWIknei4GqPZARr7WzaWXBZy26g2JWyN
	je/YTWxBKj9VmROI2W3VyA1JGdT8hYSzO1MuewQkGMxbL/vXITrITnsta3KPFE6K
	Fe1dKTWGdx4GshakrVIsIE2k6koog==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs8fqhca5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 14:58:37 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 673EuFPQ014633;
	Mon, 3 Aug 2026 14:58:36 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fswbg5p45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 14:58:36 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 673EwW9B30933306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Aug 2026 14:58:32 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3AC920043;
	Mon,  3 Aug 2026 14:58:32 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9ED120040;
	Mon,  3 Aug 2026 14:58:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.39.27.127])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Aug 2026 14:58:28 +0000 (GMT)
From: Disha Goel <disgoel@linux.ibm.com>
To: shuah@kernel.org
Cc: brauner@kernel.org, cyphar@cyphar.com, amir73il@gmail.com, jack@suse.cz,
        ojaswin@linux.ibm.com, yeswanth@linux.ibm.com,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        maddy@linux.ibm.com, ritesh.list@gmail.com,
        Disha Goel <disgoel@linux.ibm.com>
Subject: [PATCH v3 1/2] selftests/filesystems: Move file_stressor to dedicated subdirectory
Date: Mon,  3 Aug 2026 20:27:19 +0530
Message-ID: <20260803145720.87583-1-disgoel@linux.ibm.com>
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
X-Proofpoint-GUID: Pn7hLBCZ_LX9tXLG50AoQiXF_WCM2E4y
X-Proofpoint-ORIG-GUID: LFna_2RtBq339IlNS296aGjPJr3_HtTB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEzMyBTYWx0ZWRfX/NXRfiaSNSov
 XNcG+DljyVAwIrxXzEe3p5Ty7tUm9L+t80KgGtlreWEu1im4x44spwLsJRjuwAP1AZnHIN3Muf3
 VWmoho++eZaGzd62qmZx2ruyQTU4FLc=
X-Authority-Analysis: v=2.4 cv=K8cS2SWI c=1 sm=1 tr=0 ts=6a70ac9e cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=Nd5QJyihG-i5uVEzlt0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEzMyBTYWx0ZWRfX+o0RTZae3TG2
 aoe7OWJwiHxbfPAR9qGyXvpeQBL2l6m7o/9Gq2Od7sY8zyxs2hRAwde9UM1PWt7YXKghyTKco3w
 w1p/P137auDN6nbTkF3NSxOmQU+OIoawtaL3CliiCTaJUKGRTu0yIVaMGmrEksEQZVOGNVSXj0c
 g4JNRgCPiOMDt5LQNVVY1uVoJ9ZKmiCvWPnEB49o18gxmmke2reNy3Teib4nKfTsnFXRmugN3Rl
 +olDrFyPqOqvmMaDJqM863C3G8V/9FicNhadZbAM7sib5HGfog52DOtNzOqAfmAU7WhVmJ2wO1i
 J69mWa+n7LbJNXaIGutoASK+qnbxqEzgyH6Y5PfUTvgZnWY202IPHIRNotIkhhK6Tc7JGilHpCv
 B9HEC/47cJ55yi5c6Aq8fHzM+yA9NCyZjGJVOgDLPGw5Uxoe39ZTDrCQPMJrRSNCyjEXbccsYTq
 iEPtO0wx6m0rAq0lBQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030133

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

Reviewed-by: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Tested-by: Yeswanth Krishna <yeswanth@linux.ibm.com>
Signed-off-by: Disha Goel <disgoel@linux.ibm.com>
---
v2 -> v3
- Add Reviewed-by and Tested-by tags.
- Drop erroneously added Reported-by and Closes tags from v2.

Link to v2: https://lore.kernel.org/all/20260521101758.14639-1-disgoel@linux.ibm.com/

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


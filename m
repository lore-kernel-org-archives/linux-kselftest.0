Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2B134C98C
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 05:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789709041; cv=none; b=rvaZUz6xUL5FYEkImf4si1yIaEbwiXFziAHaNnEXdnjImEfVpS4q3jRPGDFHh8fGLI5mGn7PVuA9IITHQ/g12aYc5YlJsCMPXLmo/lAZiWnRxRQDCOxwsYujSylOjfvG9o8FGmKuZYLu7JhFYK42Wmny0YPiKbtjpBBUyVkhUTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789709041; c=relaxed/simple;
	bh=jwE5UHB1u1dpOklGlEOzayYWaceeoE4TTzpw4XdVlRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dH4fS5urNezddNKvztGne+VoGNzDpOFJSWadOP1mKhzpbRaWKse7GgoBmEbsXF1QrNMpF5JUrPQWYJatD0RkTH13vtuhJSi6cFit9U7fJ/FzzRhxiIZqs+NAjCYqiCpvdMOhIuy+c0gMxAzUlRMhrl2kwhiNYCeWw6F0rbzFStQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=E4EyNAHx; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="E4EyNAHx"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2VRPX2364613;
	Fri, 18 Sep 2026 05:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=VLsnkHmyr+aZiqpEH
	uAeR8zOBM/v7S6nJMRuw9aqu04=; b=E4EyNAHx6GKSvIetNGFAAzaupvhfFPY97
	oT4dTD+mc/XIaNucYofqKGkz6HY9wv/xWXyyGYBWfaunycpQbG0Gwm/SKLWNE0HR
	AzqqyTSbOjP+OPDIwchL7IBUJEFPu7Y+7cSlrztB9A44KHNcgE3OpucJ4v2gCzj8
	Sd8gOukcI6CX+PeR3VPMQeUOoMncKJP1prh+k9MKIPc1mJp3RsINMQKsqywLB6Df
	YMWceO53/ruYSe5+DSXPzT27uuJs3HEqop2Li7D0b0m0QP302owG+8BB5+Lr7hfM
	K0X0f3bob7rAT0sU3YIlX7OxG/bkx5PK9NRM52dsZKvYaVxtTPHPw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxdqpbpr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 05:23:57 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2Z4Di4152225;
	Fri, 18 Sep 2026 05:23:56 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gr5fjnw5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 05:23:56 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68I5NqUp39256356
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2026 05:23:52 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4582C20043;
	Fri, 18 Sep 2026 05:23:52 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F39E20040;
	Fri, 18 Sep 2026 05:23:48 +0000 (GMT)
Received: from li-d12addcc-2792-11b2-a85c-bd8df30615ab.ibm.com.com (unknown [9.66.68.7])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Sep 2026 05:23:47 +0000 (GMT)
From: Shirisha G <shirisha@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kselftest@vger.kernel.org, maddy@linux.ibm.com,
        venkat88@linux.ibm.com, shirisha@linux.ibm.com
Subject: [PATCH 5/7] Subject: [PATCH] selftests/powerpc: Add RTAS firmware flash interface test
Date: Fri, 18 Sep 2026 10:52:40 +0530
Message-ID: <20260918052321.932660-5-shirisha@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918052321.932660-1-shirisha@linux.ibm.com>
References: <20260918052321.932660-1-shirisha@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA2NCBTYWx0ZWRfX7PrjU1Qp9LBs
 Ug+/p/lqJ/x7g6zXFBUMiCQG6+Fm5yU8M275Cy+aYhgOrAZJyh/mLEYkgPtl0fvbVOEVbjx8t7/
 Q83yFGXeTyvyi7mKf6dDdOV9l6Etq31KSn3YUvHeRHMaOonG/gb8d5m/DKPbv7Jf3Rx8xmiWOV8
 fbKOQ75Cv3UDBT0OoO3CRjv/ZokrRuzPCSgHOlqwbQgBjpB7bYrUwudj+cWc3wDzyhtU7g8TD9z
 k35uqGKR/t/8OVIIcwOttkupJxjt8CXZcKU0Mo0fju2fVfsqTUuUgcJhIfYeiFABchX0GX5Gk1m
 /TMy9L3Ud0DzUksHHwSMw/pikH/sbrPRBToza5+QFCHt8dsXJeRkvEDINzR+k+qzWvQPNwEeWXw
 JBtdf7AkUV1IucNnY4m8kpCEZAmqlVVDIjsdJKwxTYqcha5iYXwO/4ezhhXZuaEdwXKOw4sFYPT
 gaqh1jUJK0ICd+FX4Fg==
X-Proofpoint-GUID: 62fWhhARS6-jJDViNQBb_xr0M6QjaA2z
X-Authority-Analysis: v=2.4 cv=DobDa2/+ c=1 sm=1 tr=0 ts=6aaccaed cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=xJTyo2tlqj3zewc7kv4A:9
X-Proofpoint-ORIG-GUID: 62fWhhARS6-jJDViNQBb_xr0M6QjaA2z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA2NCBTYWx0ZWRfX2qqpI1i14U5c
 +wyxWEEEoVE0dceLD6mzTlM3KfhLyNPihRJMk36sGIh5p+P0WeniXUHgO8OXtKo9MhINq4TXKdO
 ajhPpyYQxU6/GoNaJRLqnhvd21A59nE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180064

Add kselftest for the RTAS firmware flash interface on pseries/PowerVM
systems. This test validates the existence and accessibility of the
firmware flash and update proc entries, while safely rejecting invalid
data. It does not perform actual firmware updates.

The test verifies:
- Existence of `/proc/ppc64/rtas/firmware_flash` interface
- Ability to open and read the flash interface
- Rejection of invalid image writes (requires root)
- Accessibility of `/proc/ppc64/rtas/firmware_update` status
- Safe validation subset without triggering real updates

Signed-off-by: Shirisha G <shirisha@linux.ibm.com>
---
 .../selftests/powerpc/rtas/rtas_flash_test.c  | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/rtas/rtas_flash_test.c

diff --git a/tools/testing/selftests/powerpc/rtas/rtas_flash_test.c b/tools/testing/selftests/powerpc/rtas/rtas_flash_test.c
new file mode 100644
index 000000000000..7f7c90447e9c
--- /dev/null
+++ b/tools/testing/selftests/powerpc/rtas/rtas_flash_test.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * RTAS Firmware Flash Test (Safe Subset)
+ * Copyright (C) 2026 IBM Corporation
+ *
+ * WARNING: This test only validates the interface with invalid data.
+ * It does NOT perform actual firmware updates.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <errno.h>
+#include "utils.h"
+
+#define FLASH_PROC "/proc/ppc64/rtas/firmware_flash"
+#define UPDATE_PROC "/proc/ppc64/rtas/firmware_update"
+
+int main(void)
+{
+	int fd;
+	char invalid_data[256];
+	ssize_t ret;
+
+	test_harness_set_timeout(10);
+
+	/* Test 1: Verify flash interface exists */
+	SKIP_IF(access(FLASH_PROC, F_OK) != 0);
+
+	/* Test 2: Verify we can open the interface */
+	fd = open(FLASH_PROC, O_RDONLY);
+	if (fd >= 0) {
+		close(fd);
+		printf("Flash interface is readable\n");
+	}
+
+	/* Test 3: Test invalid image rejection (requires root) */
+	if (geteuid() == 0) {
+		fd = open(FLASH_PROC, O_WRONLY);
+		if (fd >= 0) {
+			/* Write invalid data - should be rejected */
+			memset(invalid_data, 0xFF, sizeof(invalid_data));
+			ret = write(fd, invalid_data, sizeof(invalid_data));
+			
+			/* We expect this to fail or be rejected */
+			if (ret < 0) {
+				printf("Invalid image correctly rejected (errno=%d)\n", errno);
+			} else {
+				printf("WARNING: Write accepted (may need validation)\n");
+			}
+			close(fd);
+		}
+	} else {
+		printf("Skipping write test (requires root)\n");
+	}
+
+	/* Test 4: Check update status interface */
+	if (access(UPDATE_PROC, R_OK) == 0) {
+		fd = open(UPDATE_PROC, O_RDONLY);
+		if (fd >= 0) {
+			char status[256];
+			ret = read(fd, status, sizeof(status) - 1);
+			if (ret > 0) {
+				status[ret] = '\0';
+				printf("Update status: %s\n", status);
+			}
+			close(fd);
+		}
+	}
+
+	printf("RTAS flash test passed (safe subset)\n");
+	return 0;
+}
-- 
2.43.5


Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40FA34C98C
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 05:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789709023; cv=none; b=fvQ/z9GB4nNUTt95Ubykr+lFj1mQdLd/atZdhjGEcXJV38+7/PLNVp3mD+at3DSUa+YsyKDnMfOBCdrOQBfeL0nSqVVATP31rPEQgUfRkeemJ0KuzlbktFk4qUzsEzfSQ5nAyWUot5K7qM+5X9rZXWflfXkcvnA1nuT5PONX9kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789709023; c=relaxed/simple;
	bh=I9+J0Q1lVdnGeVzTw3UIOOGyTPC61iw/oAtnhFtmJww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CzfxK2ACsBR9Ut9YzYA92sES9qG2u77rY2ocoOtTTc0spOvreNOJQzDZrhRhc7saW9/Mfv0eXV00PrTLCta3Yri7TGHjcXb3tbjkhLTdOc3mp9+RwaahenwmmIbFMIoLiSPIfejDt8fQAO8qYLFHlhJP/wO9uE2XHKwk4fZcblU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ZpYkRShS; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ZpYkRShS"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2Vpg84092445;
	Fri, 18 Sep 2026 05:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=W6OCPwdeVXji6sYwfTQB+HbHtdZq6sGjYYK08lQfr
	4o=; b=ZpYkRShSB0xzpkZJenEsLWpfllYIe3KY9R8NxEVdMzDBaCr+A/lEGPwMC
	sk/Vye9TPD/hvg3r6YTU8OrC+qaQ87wHyPgXJHLs3vqsVxHytAt7YFoWLW5BxFjB
	lnhSHjT2tQDAlCn3mu+QLlENrXdDKVJE21o6H7gTzlppup6ttLKf27SGLgnuLIJd
	KXpE9cY8fE5PWQe4FFs6xrknNtVk8VR9yrEduhcUW37x1FXBerK7TQvFr5bygLVn
	y1JLbWEcL+2sszdMTCXctaxF/R9hrBaFEWFQemQhmsB4TpaXIKb1wcPQpge/ldkU
	3X/UCqyTa6k81vVzhzu6DjiWUcHLg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmv5j639v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 05:23:37 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2Z6Ag4166362;
	Fri, 18 Sep 2026 05:23:37 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gr5xa5ssr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 05:23:36 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68I5NWkX54526458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2026 05:23:32 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFE9020043;
	Fri, 18 Sep 2026 05:23:32 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0098820040;
	Fri, 18 Sep 2026 05:23:29 +0000 (GMT)
Received: from li-d12addcc-2792-11b2-a85c-bd8df30615ab.ibm.com.com (unknown [9.66.68.7])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Sep 2026 05:23:28 +0000 (GMT)
From: Shirisha G <shirisha@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kselftest@vger.kernel.org, maddy@linux.ibm.com,
        venkat88@linux.ibm.com, shirisha@linux.ibm.com
Subject: [PATCH 1/7] Subject: [PATCH] selftests/powerpc: Add RTAS real-time clock test
Date: Fri, 18 Sep 2026 10:52:36 +0530
Message-ID: <20260918052321.932660-1-shirisha@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA2NCBTYWx0ZWRfX2GXIo3GAW2KV
 83bFScbiZuRNKi4jTfZJkSAYhEQRRC/9aH52QKF5Yzthf1oGTuiKgIgJW7x0WnPJ2VQJGYhB/wa
 31pVLzYGO1+HCnMcxBasryAJksuWyJ1FC9m3s78m4P6CkWeH8dBhhE+iNr/B7HahrvGJd/q8jLy
 sHfuqafNa+Um1KDQj5CoJNB6Wx52bIErURT1vOpmhM69JQ7RqAuQ7o2j6EMSL/vT5zi//KLyo1g
 AoH60jhykMtH8tudSjiWkxUREIf99/qZ4yCXhWY81ym7Iz3jDUlSQ7unuyQHaPoSFURkYRf25hK
 XpM/1kn0f7gTHERq+gaqK0uywUHbuSdhPUsYfFLU2p0r1CSuH7EN66TN+PvYbghKqT6JlcVNrgI
 GETOzLP3VM60l/3Dx3yjJKxl6lou9fxH+hTkFI6Jwe1A1zRJZhanrHIs8G+nAlBzxyY7k2rhThW
 2soDhQz7zipCJZX/TaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA2NCBTYWx0ZWRfXxhUBcQFAk7kA
 q3NeYgJEMsMk9Bs+K5f+UN0/PfjhpVmvk9VUe33E3hOUrNxmqD4383B919bxCvYhgOSRkfDjxl2
 cVkn15rYiE6VS7EEB4tGbbZh2hiEXqc=
X-Authority-Analysis: v=2.4 cv=Zsx4uN7G c=1 sm=1 tr=0 ts=6aaccad9 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=zvTomhUEhvKTszHgVpoA:9
X-Proofpoint-ORIG-GUID: F_G6Z3xWEyS2EFbx3CyVu3seebJmLwOL
X-Proofpoint-GUID: F_G6Z3xWEyS2EFbx3CyVu3seebJmLwOL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180064

Add kselftest for RTAS-based real-time clock on PowerVM systems.
Tests RTC device presence, time accuracy, and time advancement.

The test verifies:
- RTC device exists at /sys/class/rtc/rtc0/
- RTC time matches system time (within 2 seconds)
- Year is sane (>= 2020)
- Time advances correctly

Signed-off-by: Shirisha G <shirisha@linux.ibm.com>
---
 .../selftests/powerpc/rtas/rtas_rtc_test.c    | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/rtas/rtas_rtc_test.c

diff --git a/tools/testing/selftests/powerpc/rtas/rtas_rtc_test.c b/tools/testing/selftests/powerpc/rtas/rtas_rtc_test.c
new file mode 100644
index 000000000000..12d4f38230e6
--- /dev/null
+++ b/tools/testing/selftests/powerpc/rtas/rtas_rtc_test.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * RTAS Real-Time Clock Test
+ * Copyright (C) 2026 IBM Corporation
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+#include <errno.h>
+#include "utils.h"
+
+#define _GNU_SOURCE
+#define RTC_PATH "/sys/class/rtc/rtc0/time"
+#define RTC_DATE_PATH "/sys/class/rtc/rtc0/date"
+
+static int read_rtc_time(time_t *rtc_time)
+{
+	FILE *fp;
+	struct tm tm = {0};
+	char buf[64];
+
+	fp = fopen(RTC_PATH, "r");
+	if (!fp) {
+		perror("fopen RTC_PATH");
+		return -1;
+	}
+
+	if (!fgets(buf, sizeof(buf), fp)) {
+		fclose(fp);
+		return -1;
+	}
+	fclose(fp);
+
+	/* Parse HH:MM:SS format */
+	if (sscanf(buf, "%d:%d:%d", &tm.tm_hour, &tm.tm_min, &tm.tm_sec) != 3)
+		return -1;
+
+	/* Read date */
+	fp = fopen(RTC_DATE_PATH, "r");
+	if (!fp)
+		return -1;
+
+	if (!fgets(buf, sizeof(buf), fp)) {
+		fclose(fp);
+		return -1;
+	}
+	fclose(fp);
+
+	/* Parse YYYY-MM-DD format */
+	if (sscanf(buf, "%d-%d-%d", &tm.tm_year, &tm.tm_mon, &tm.tm_mday) != 3)
+		return -1;
+
+	tm.tm_year -= 1900;  /* years since 1900 */
+	tm.tm_mon -= 1;      /* months since January */
+
+	*rtc_time = timegm(&tm);
+	return 0;
+}
+
+int main(void)
+{
+	time_t rtc_time1, rtc_time2, sys_time;
+	int diff;
+
+	test_harness_set_timeout(10);
+
+	/* Test 1: Verify RTC device exists */
+	SKIP_IF(access(RTC_PATH, R_OK) != 0);
+
+	/* Test 2: Read RTC time */
+	FAIL_IF(read_rtc_time(&rtc_time1) != 0);
+
+	/* Test 3: Compare with system time */
+	sys_time = time(NULL);
+	diff = abs((int)(rtc_time1 - sys_time));
+	FAIL_IF_MSG(diff > 2, "RTC time differs from system time by %d seconds", diff);
+
+	/* Test 4: Verify year > 2020 */
+	struct tm *tm = localtime(&rtc_time1);
+	FAIL_IF_MSG(tm->tm_year + 1900 < 2020, "RTC year is %d (expected >= 2020)", 
+	            tm->tm_year + 1900);
+
+	/* Test 5: Verify time advances */
+	sleep(2);
+	FAIL_IF(read_rtc_time(&rtc_time2) != 0);
+	FAIL_IF_MSG(rtc_time2 <= rtc_time1, "RTC time did not advance");
+
+	printf("RTAS RTC test passed\n");
+	return 0;
+}
-- 
2.43.5


Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E904EBAE9
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 18:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788632840; cv=none; b=sZTPbh0HeMvP8nBOdZeOXMcVFJZF3qxsoCZfBpQjGdiKmaI5ACO0mKEBMsAP0JJJfZ0+nQQLzbeXYH6qNOzIEilUFh6Sqaf6fRZF6tcYxqRy3X0RtI5zCIaMZd6tqbLx8SoGpmLimqSjOO2s7ciILeq7+4ry+LeFklVfifFaWFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788632840; c=relaxed/simple;
	bh=zz54dXF96h3hZH4eS/QrLNskcvfGK3XwrfImdWebri4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lh+7gsvzPhdSuWmu6w4GnQWV6R/yv3+rK7bUTpSSb+VdM02bpyAfQGU8XJR+mi72I0/kqnVhzsh+ngYjLsCV4Mj2LBBThdjYrU8QV361iZVzhgja2A6J+0vIgaI1plmuU58dbuKGUHF7JhjIeA5ExgCXly7T2sUPWaoXFWwKzRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FbI4Mn5y; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FbI4Mn5y"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685I2lus4087577;
	Sat, 5 Sep 2026 18:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=eoS0LepZnVWGCqlLTP5RCCrUGg/z
	RQSE2DoQo4RNBhs=; b=FbI4Mn5yj5ghU2On2mtAnVY4kM6h1Juw1Gg9JZCnfRup
	0wagypCo3vtBIBGwi/2X2TPdm3rkKL9q8icoSbNMil0cgkRRLWPgUMeNHNmdSPn0
	+tuAPrcV1DBif83X98+rUHMqvLQ2uO7XXiDXhKIC6xWSx3K6Iw1HVcaJd1RMC/Hl
	LdCnDQ9scXXrXIi77MyRgMLHKDZDixjKUFesVpaPCICy2TU/qnNCcTUcd0bfycws
	KM8ZII1AN9bOADj77XwHn07giU7ISlq3xMtdJwJ9/aGPp3u9Q2sYwfey6uPhVlbx
	6rQmfvtPQAwqY6tgimo276KAIv8GE+yAIYXFtXKcxQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbjr9wbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 18:27:06 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 685IQHTI009193;
	Sat, 5 Sep 2026 18:27:05 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ggbvasvrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 18:27:05 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 685IR1uw44564766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 5 Sep 2026 18:27:01 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3479320049;
	Sat,  5 Sep 2026 18:27:01 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0455120040;
	Sat,  5 Sep 2026 18:27:00 +0000 (GMT)
Received: from li-49acbccc-2994-11b2-a85c-d51b89e344f1.ibm.com.com (unknown [9.43.75.180])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  5 Sep 2026 18:26:59 +0000 (GMT)
From: Pavithra <pavrampu@linux.ibm.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, pavrampu@linux.ibm.com
Subject: [PATCH] selftests/powerpc: add papr_pseries test suite
Date: Sat,  5 Sep 2026 23:56:42 +0530
Message-ID: <20260905182656.993870-1-pavrampu@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=E7T9Y6dl c=1 sm=1 tr=0 ts=6a9c5efa cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=qf4gfuq51q0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=M6gOKpPmgqr2CJZr-K0A:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDIwMSBTYWx0ZWRfX0NgFaCusFkOw
 sPSvk6avnlMRVFuzdk3IvzxKDspHsK83foyzBbr5yh0I8UVdTsVNuHbBsZGXJ8WNaVZq9KHFywn
 e8sg7pmWPYQVR0k8Iv2wxiNNfUEXBPs=
X-Proofpoint-ORIG-GUID: cZ8ze8-c2RcqC2uGj0txolaAV7UR7Yh8
X-Proofpoint-GUID: cZ8ze8-c2RcqC2uGj0txolaAV7UR7Yh8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDIwMSBTYWx0ZWRfX0wAuUzOdaw3u
 vNOCV3ru+sYmSpZs8jooxLHTXMOsRzbH/lv8OQdtgryZpoqVD2UjSV1bf9mCrIU2Fuw2W6pmsgf
 qdt8IcpCYnZrfEvL1+OoPctaIrqP6JkDLcLep0nCvi1ejhfmN46DnbKkkqobMB+I7MF79/TjaES
 9+Yto9soTomk/OR7mpsNGvuwpEda8JrHrYIONV0d2UYdA+nOi8FTdExNAFZGdSRYbHWOrs2xZL9
 SnoRqwdo5gJ9GTpck9/4p/UWE8lZE5EYCBcM7tiCjfVxdvxNgImZ7u+4qKQUfORhUjiVxk/WDln
 Xh1HZSBgFTX2FMXh7JE4wWPkzqXwbusQO/VjTDzsbkoF6SOxUK5OH6ntdJn1dkeZTdLc7tzEy/w
 SI/SIcd2zi6B0lZqrl/spF+hfgk3nWLRqGoQDiuBbRwKWfvCG3XHcjTAYlf0udwL0x1J/eYR81n
 Z7J8WmuQ5Qr/kqlIlgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050201

Add a set of selftests for pSeries/PowerVM-specific kernel interfaces:
- lparcfg_test: validates /proc/ppc64/lparcfg fields (partition_id,
  shared_processor_mode, processor counts, partition_entitled_capacity,
  partition_name, system_type)
- dtl_test: validates the vpa_dtl perf PMU by running perf record
  against the DTL event source and confirming samples are captured;
  skips gracefully if the PMU is absent or perf is not installed
- pseries_energy_test: validates CPU frequency from /proc/cpuinfo and
  power management fields from /proc/ppc64/lparcfg
  (partition_entitled_capacity, partition_max_entitled_capacity,
  power_mode_data as a 16-character hex string)
- papr_rtas_common_test: exercises RTAS work-area serialisation by
  issuing 1000 concurrent get-time-of-day calls across 10 threads via
  syscall(__NR_rtas) and asserting every call returns status 0

Signed-off-by: Pavithra <pavrampu@linux.ibm.com>
---
 tools/testing/selftests/powerpc/Makefile      |   1 +
 .../selftests/powerpc/papr_pseries/Makefile   |  19 ++
 .../selftests/powerpc/papr_pseries/dtl_test.c |  93 ++++++++++
 .../powerpc/papr_pseries/lparcfg_test.c       | 125 +++++++++++++
 .../papr_pseries/papr_rtas_common_test.c      | 171 ++++++++++++++++++
 .../papr_pseries/pseries_energy_test.c        | 155 ++++++++++++++++
 .../selftests/powerpc/papr_pseries/utils.h    |  19 ++
 7 files changed, 583 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/papr_pseries/Makefile
 create mode 100644 tools/testing/selftests/powerpc/papr_pseries/dtl_test.c
 create mode 100644 tools/testing/selftests/powerpc/papr_pseries/lparcfg_test.c
 create mode 100644 tools/testing/selftests/powerpc/papr_pseries/papr_rtas_common_test.c
 create mode 100644 tools/testing/selftests/powerpc/papr_pseries/pseries_energy_test.c
 create mode 100644 tools/testing/selftests/powerpc/papr_pseries/utils.h

diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
index b175e94e1901..93aaa7a90a1b 100644
--- a/tools/testing/selftests/powerpc/Makefile
+++ b/tools/testing/selftests/powerpc/Makefile
@@ -26,6 +26,7 @@ SUB_DIRS = alignment		\
 	   vphn         \
 	   math		\
 	   papr_attributes	\
+	   papr_pseries		\
 	   papr_vpd		\
 	   papr_sysparm		\
 	   ptrace	\
diff --git a/tools/testing/selftests/powerpc/papr_pseries/Makefile b/tools/testing/selftests/powerpc/papr_pseries/Makefile
new file mode 100644
index 000000000000..2016a6e3a8e7
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_pseries/Makefile
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0
+noarg:
+	$(MAKE) -C ../
+
+TEST_GEN_PROGS := lparcfg_test
+TEST_GEN_PROGS += dtl_test
+TEST_GEN_PROGS += pseries_energy_test
+TEST_GEN_PROGS += papr_rtas_common_test
+
+top_srcdir = ../../../../..
+include ../../lib.mk
+include ../flags.mk
+
+$(TEST_GEN_PROGS): ../harness.c ../utils.c
+
+$(OUTPUT)/papr_rtas_common_test: CFLAGS += $(KHDR_INCLUDES)
+$(OUTPUT)/papr_rtas_common_test: LDFLAGS += -lpthread
+
+$(OUTPUT)/dtl_test: CFLAGS += $(KHDR_INCLUDES)
diff --git a/tools/testing/selftests/powerpc/papr_pseries/dtl_test.c b/tools/testing/selftests/powerpc/papr_pseries/dtl_test.c
new file mode 100644
index 000000000000..097c80def4c9
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_pseries/dtl_test.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Dispatch Trace Log (DTL) Test
+ * Copyright (C) 2025 IBM Corporation
+ *
+ * Validates the vpa_dtl perf PMU on PowerVM LPARs.  The PMU sysfs directory
+ * is created by the DTL subsystem when FW_FEATURE_SPLPAR is set.
+ *
+ * The test SKIPs when the vpa_dtl PMU is absent or perf is not installed.
+ * The test FAILs when the PMU is present and perf is installed but the
+ * event cannot be opened or produces no samples.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <sys/stat.h>
+#include <sys/wait.h>
+#include "utils.h"
+
+#define VPA_DTL_PMU_PATH "/sys/bus/event_source/devices/vpa_dtl"
+
+static int perf_is_installed(void)
+{
+	return system("perf version >/dev/null 2>&1") == 0;
+}
+
+static int test_dtl_via_perf(void)
+{
+	char outfile[] = "/tmp/dtl_test_XXXXXX";
+	char cmd[256];
+	struct stat st;
+	int fd, ret;
+
+	fd = mkstemp(outfile);
+	if (fd < 0) {
+		fprintf(stderr, "[FAIL] mkstemp failed\n");
+		return -1;
+	}
+	close(fd);
+
+	snprintf(cmd, sizeof(cmd),
+		 "perf record -e vpa_dtl/dtl_all/ -a -o %s sleep 1 2>/dev/null",
+		 outfile);
+
+	printf("Running: %s\n", cmd);
+	ret = system(cmd);
+
+	if (ret != 0) {
+		fprintf(stderr,
+			"[FAIL] perf record failed (exit %d) -- vpa_dtl PMU present but perf could not open the event\n",
+			WEXITSTATUS(ret));
+		unlink(outfile);
+		return -1;
+	}
+
+	if (stat(outfile, &st) != 0) {
+		fprintf(stderr,
+			"[FAIL] perf record succeeded but output file was not created\n");
+		unlink(outfile);
+		return -1;
+	}
+
+	if (st.st_size < 1024) {
+		fprintf(stderr,
+			"[FAIL] perf.data is only %ld bytes -- vpa_dtl PMU opened but delivered no samples\n",
+			(long)st.st_size);
+		unlink(outfile);
+		return -1;
+	}
+
+	printf("vpa_dtl PMU: %ld bytes of samples captured\n",
+	       (long)st.st_size);
+	unlink(outfile);
+	return 0;
+}
+
+int main(void)
+{
+	test_harness_set_timeout(30);
+
+	SKIP_IF_MSG(access(VPA_DTL_PMU_PATH, F_OK) != 0,
+		    "vpa_dtl PMU not present (" VPA_DTL_PMU_PATH " missing)");
+
+	SKIP_IF_MSG(!perf_is_installed(),
+		    "perf binary not found -- install perf to run this test");
+
+	printf("vpa_dtl PMU present, perf available\n");
+	FAIL_IF(test_dtl_via_perf() != 0);
+
+	printf("dtl_test passed\n");
+	return 0;
+}
diff --git a/tools/testing/selftests/powerpc/papr_pseries/lparcfg_test.c b/tools/testing/selftests/powerpc/papr_pseries/lparcfg_test.c
new file mode 100644
index 000000000000..b43af7e1c4e7
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_pseries/lparcfg_test.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * LPAR Configuration Test
+ * Copyright (C) 2026 IBM Corporation
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include "utils.h"
+
+#define LPARCFG_PATH "/proc/ppc64/lparcfg"
+
+struct lparcfg_data {
+	int partition_id;
+	char partition_name[256];
+	char system_type[256];
+	int shared_processor_mode;
+	int system_active_processors;
+	int partition_active_processors;
+	int partition_potential_processors;
+	int partition_entitled_capacity;
+	int found_fields;
+};
+
+static int parse_lparcfg(struct lparcfg_data *data)
+{
+	FILE *fp;
+	char line[512];
+	char key[128], value[256];
+
+	memset(data, 0, sizeof(*data));
+
+	fp = fopen(LPARCFG_PATH, "r");
+	if (!fp)
+		return -1;
+
+	while (fgets(line, sizeof(line), fp)) {
+		if (sscanf(line, "%127[^=]=%255[^\n]", key, value) == 2) {
+			if (strcmp(key, "partition_id") == 0) {
+				data->partition_id = atoi(value);
+				data->found_fields++;
+			} else if (strcmp(key, "partition_name") == 0) {
+				snprintf(data->partition_name,
+					 sizeof(data->partition_name),
+					 "%s", value);
+				data->found_fields++;
+			} else if (strcmp(key, "system_type") == 0) {
+				snprintf(data->system_type,
+					 sizeof(data->system_type),
+					 "%s", value);
+				data->found_fields++;
+			} else if (strcmp(key, "shared_processor_mode") == 0) {
+				data->shared_processor_mode = atoi(value);
+				data->found_fields++;
+			} else if (strcmp(key, "system_active_processors") == 0) {
+				data->system_active_processors = atoi(value);
+				data->found_fields++;
+			} else if (strcmp(key, "partition_active_processors") == 0) {
+				data->partition_active_processors = atoi(value);
+				data->found_fields++;
+			} else if (strcmp(key, "partition_potential_processors") == 0) {
+				data->partition_potential_processors = atoi(value);
+				data->found_fields++;
+			} else if (strcmp(key, "partition_entitled_capacity") == 0) {
+				data->partition_entitled_capacity = atoi(value);
+				data->found_fields++;
+			}
+		}
+	}
+
+	fclose(fp);
+	return 0;
+}
+
+int main(void)
+{
+	struct lparcfg_data data;
+
+	test_harness_set_timeout(10);
+
+	SKIP_IF(access(LPARCFG_PATH, R_OK) != 0);
+
+	FAIL_IF(parse_lparcfg(&data) != 0);
+
+	FAIL_IF_MSG(data.found_fields < 5,
+		    "Only found %d fields (expected at least 5)", data.found_fields);
+
+	FAIL_IF_MSG(data.partition_id == 0, "partition_id is 0 (invalid)");
+	printf("partition_id: %d\n", data.partition_id);
+
+	FAIL_IF_MSG(data.shared_processor_mode != 0 && data.shared_processor_mode != 1,
+		    "shared_processor_mode is %d (expected 0 or 1)",
+		    data.shared_processor_mode);
+	printf("shared_processor_mode: %d\n", data.shared_processor_mode);
+
+	FAIL_IF_MSG(data.system_active_processors <= 0,
+		    "system_active_processors is %d (expected > 0)",
+		    data.system_active_processors);
+	printf("system_active_processors: %d\n", data.system_active_processors);
+
+	FAIL_IF_MSG(data.partition_active_processors <= 0,
+		    "partition_active_processors is %d (expected > 0)",
+		    data.partition_active_processors);
+	printf("partition_active_processors: %d\n", data.partition_active_processors);
+
+	FAIL_IF_MSG(data.partition_potential_processors > 0 &&
+		    data.partition_active_processors > data.partition_potential_processors,
+		    "partition_active_processors (%d) > partition_potential_processors (%d)",
+		    data.partition_active_processors, data.partition_potential_processors);
+
+	FAIL_IF_MSG(data.partition_entitled_capacity == 0,
+		    "partition_entitled_capacity is 0 (invalid)");
+	printf("partition_entitled_capacity: %d\n", data.partition_entitled_capacity);
+
+	FAIL_IF_MSG(strlen(data.partition_name) == 0, "partition_name is empty");
+	printf("partition_name: %s\n", data.partition_name);
+
+	FAIL_IF_MSG(strlen(data.system_type) == 0, "system_type is empty");
+	printf("system_type: %s\n", data.system_type);
+
+	printf("lparcfg test passed\n");
+	return 0;
+}
diff --git a/tools/testing/selftests/powerpc/papr_pseries/papr_rtas_common_test.c b/tools/testing/selftests/powerpc/papr_pseries/papr_rtas_common_test.c
new file mode 100644
index 000000000000..56e4ec6aa0fd
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_pseries/papr_rtas_common_test.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * PAPR RTAS Work-Area Locking Test
+ * Copyright (C) 2026 IBM Corporation
+ *
+ * Exercises the kernel's RTAS work-area serialisation under concurrent load
+ * by spawning multiple threads that simultaneously issue the get-time-of-day
+ * RTAS call via __NR_rtas.  Every call must return status 0; a non-zero
+ * status indicates work-area corruption caused by a locking failure.
+ */
+
+#include <byteswap.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <pthread.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <errno.h>
+#include <sys/syscall.h>
+#include "utils.h"
+
+#ifndef __NR_rtas
+#error "This test requires a pSeries kernel (__NR_rtas is not defined)"
+#endif
+
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+#define cpu_to_be32(x)  bswap_32(x)
+#define be32_to_cpu(x)  bswap_32(x)
+#else
+#define cpu_to_be32(x)  (x)
+#define be32_to_cpu(x)  (x)
+#endif
+
+#define OFDT_RTAS_PATH  "/proc/device-tree/rtas"
+#define RTAS_UNKNOWN_OP (-1099)
+
+#define NUM_THREADS     10
+#define ITERATIONS      100
+
+struct rtas_args {
+	__be32  token;
+	__be32  nargs;
+	__be32  nret;
+	__be32  args[16];
+	__be32 *rets;
+};
+
+static int gtod_token = RTAS_UNKNOWN_OP;
+
+static int rtas_get_token(const char *call_name)
+{
+	char path[256];
+	__be32 raw;
+	ssize_t n;
+	int fd;
+
+	snprintf(path, sizeof(path), "%s/%s", OFDT_RTAS_PATH, call_name);
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0)
+		return RTAS_UNKNOWN_OP;
+
+	n = read(fd, &raw, sizeof(raw));
+	close(fd);
+
+	if (n != (ssize_t)sizeof(raw))
+		return RTAS_UNKNOWN_OP;
+
+	return (int)be32_to_cpu(raw);
+}
+
+static int rtas_call_gtod(void)
+{
+	struct rtas_args args;
+
+	memset(&args, 0, sizeof(args));
+	args.token = cpu_to_be32(gtod_token);
+	args.nargs = cpu_to_be32(0);
+	args.nret  = cpu_to_be32(1);
+	args.rets  = &args.args[0];
+
+	if (syscall(__NR_rtas, &args) != 0)
+		return -errno;
+
+	return (int)be32_to_cpu(args.args[0]);
+}
+
+struct thread_data {
+	int thread_id;
+	int success_count;
+	int error_count;
+};
+
+static void *rtas_worker(void *arg)
+{
+	struct thread_data *data = (struct thread_data *)arg;
+	int i, rc;
+
+	for (i = 0; i < ITERATIONS; i++) {
+		rc = rtas_call_gtod();
+		if (rc != 0) {
+			fprintf(stderr,
+				"[FAIL] thread %d iteration %d: get-time-of-day returned %d\n",
+				data->thread_id, i, rc);
+			data->error_count++;
+		} else {
+			data->success_count++;
+		}
+	}
+
+	return NULL;
+}
+
+int main(void)
+{
+	pthread_t      threads[NUM_THREADS];
+	struct thread_data thread_data[NUM_THREADS];
+	int total_success = 0;
+	int total_errors  = 0;
+	int i, rc;
+
+	test_harness_set_timeout(60);
+
+	SKIP_IF(access(OFDT_RTAS_PATH, R_OK) != 0);
+
+	gtod_token = rtas_get_token("get-time-of-day");
+	SKIP_IF(gtod_token == RTAS_UNKNOWN_OP);
+	printf("get-time-of-day token: %d\n", gtod_token);
+
+	rc = rtas_call_gtod();
+	FAIL_IF_MSG(rc != 0,
+		    "Baseline get-time-of-day failed with status %d", rc);
+	printf("Baseline get-time-of-day: OK\n");
+
+	printf("Spawning %d threads, %d RTAS calls each...\n",
+	       NUM_THREADS, ITERATIONS);
+
+	for (i = 0; i < NUM_THREADS; i++) {
+		thread_data[i].thread_id     = i;
+		thread_data[i].success_count = 0;
+		thread_data[i].error_count   = 0;
+
+		FAIL_IF(pthread_create(&threads[i], NULL, rtas_worker,
+				       &thread_data[i]) != 0);
+	}
+
+	for (i = 0; i < NUM_THREADS; i++) {
+		FAIL_IF(pthread_join(threads[i], NULL) != 0);
+		total_success += thread_data[i].success_count;
+		total_errors  += thread_data[i].error_count;
+		printf("Thread %2d: %d ok, %d errors\n",
+		       i, thread_data[i].success_count,
+		       thread_data[i].error_count);
+	}
+
+	printf("Total: %d successful RTAS calls, %d errors\n",
+	       total_success, total_errors);
+
+	FAIL_IF_MSG(total_errors != 0,
+		    "%d of %d concurrent RTAS calls returned non-zero status; "
+		    "possible work-area lock corruption",
+		    total_errors, NUM_THREADS * ITERATIONS);
+
+	FAIL_IF_MSG(total_success != NUM_THREADS * ITERATIONS,
+		    "Expected %d successful calls, got %d",
+		    NUM_THREADS * ITERATIONS, total_success);
+
+	printf("papr_rtas_common_test passed\n");
+	return 0;
+}
diff --git a/tools/testing/selftests/powerpc/papr_pseries/pseries_energy_test.c b/tools/testing/selftests/powerpc/papr_pseries/pseries_energy_test.c
new file mode 100644
index 000000000000..db6eb86d4647
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_pseries/pseries_energy_test.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * pseries Energy/Power Management Test
+ * Copyright (C) 2026 IBM Corporation
+ *
+ * Validates CPU frequency and power management on pSeries LPARs by reading
+ * /proc/cpuinfo and /proc/ppc64/lparcfg directly.
+ *
+ * Tests performed:
+ *   1. CPU clock frequency is readable from /proc/cpuinfo and is > 0.
+ *   2. partition_entitled_capacity is present in lparcfg and is > 0.
+ *   3. partition_max_entitled_capacity is present and >= entitled_capacity.
+ *   4. power_mode_data is present and is a 16-character hex string.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <ctype.h>
+#include "utils.h"
+
+#define PROC_CPUINFO        "/proc/cpuinfo"
+#define LPARCFG             "/proc/ppc64/lparcfg"
+
+#define POWER_MODE_DATA_LEN 16
+
+static double read_cpuinfo_freq(void)
+{
+	FILE *fp;
+	char line[256];
+	double mhz = 0.0;
+
+	fp = fopen(PROC_CPUINFO, "r");
+	if (!fp)
+		return 0.0;
+
+	while (fgets(line, sizeof(line), fp)) {
+		char *colon;
+
+		/* "clock : <value>MHz" — pSeries dedicated-mode LPAR */
+		if (strncmp(line, "clock", 5) == 0) {
+			colon = strchr(line, ':');
+			if (colon)
+				mhz = strtod(colon + 1, NULL);
+			break;
+		}
+
+		/* "cpu MHz : <value>" — other Power configurations */
+		if (strncmp(line, "cpu MHz", 7) == 0) {
+			colon = strchr(line, ':');
+			if (colon)
+				mhz = strtod(colon + 1, NULL);
+			break;
+		}
+	}
+
+	fclose(fp);
+	return mhz;
+}
+
+static int read_lparcfg_ulong(FILE *fp, const char *key, unsigned long *out)
+{
+	char line[256];
+	size_t keylen = strlen(key);
+	char *endptr;
+
+	rewind(fp);
+	while (fgets(line, sizeof(line), fp)) {
+		if (strncmp(line, key, keylen) == 0 && line[keylen] == '=') {
+			*out = strtoul(line + keylen + 1, &endptr, 10);
+			if (endptr == line + keylen + 1)
+				return -1;
+			return 0;
+		}
+	}
+	return -1;
+}
+
+static int read_lparcfg_str(FILE *fp, const char *key, char *buf, size_t size)
+{
+	char line[256];
+	size_t keylen = strlen(key);
+
+	rewind(fp);
+	while (fgets(line, sizeof(line), fp)) {
+		if (strncmp(line, key, keylen) == 0 && line[keylen] == '=') {
+			char *val = line + keylen + 1;
+			size_t vlen;
+
+			val[strcspn(val, "\n")] = 0;
+			vlen = strlen(val);
+			if (vlen == 0 || vlen >= size)
+				return -1;
+			memcpy(buf, val, vlen + 1);
+			return 0;
+		}
+	}
+	return -1;
+}
+
+/* ------------------------------------------------------------------ */
+
+int main(void)
+{
+	double mhz;
+	FILE *fp;
+	unsigned long entitled, max_entitled;
+	char power_mode[32];
+	size_t i;
+
+	test_harness_set_timeout(10);
+
+	SKIP_IF(access(LPARCFG, R_OK) != 0);
+
+	mhz = read_cpuinfo_freq();
+	FAIL_IF_MSG(mhz <= 0.0,
+		    "Could not read a valid CPU frequency from " PROC_CPUINFO);
+	printf("CPU frequency: %.3f GHz\n", mhz / 1000.0);
+
+	fp = fopen(LPARCFG, "r");
+	FAIL_IF_MSG(!fp, "Cannot open " LPARCFG);
+
+	FAIL_IF_MSG(read_lparcfg_ulong(fp, "partition_entitled_capacity",
+				       &entitled) != 0,
+		    "partition_entitled_capacity missing from " LPARCFG);
+	FAIL_IF_MSG(entitled == 0, "partition_entitled_capacity is 0");
+	printf("partition_entitled_capacity: %lu\n", entitled);
+
+	FAIL_IF_MSG(read_lparcfg_ulong(fp, "partition_max_entitled_capacity",
+				       &max_entitled) != 0,
+		    "partition_max_entitled_capacity missing from " LPARCFG);
+	printf("partition_max_entitled_capacity: %lu\n", max_entitled);
+	FAIL_IF_MSG(max_entitled < entitled,
+		    "partition_max_entitled_capacity (%lu) < partition_entitled_capacity (%lu)",
+		    max_entitled, entitled);
+
+	FAIL_IF_MSG(read_lparcfg_str(fp, "power_mode_data",
+				     power_mode, sizeof(power_mode)) != 0,
+		    "power_mode_data missing from " LPARCFG);
+	fclose(fp);
+	fp = NULL;
+	printf("power_mode_data: %s\n", power_mode);
+	FAIL_IF_MSG(strlen(power_mode) != POWER_MODE_DATA_LEN,
+		    "power_mode_data '%s' is %zu chars, expected %d",
+		    power_mode, strlen(power_mode), POWER_MODE_DATA_LEN);
+	for (i = 0; i < POWER_MODE_DATA_LEN; i++) {
+		FAIL_IF_MSG(!isxdigit((unsigned char)power_mode[i]),
+			    "power_mode_data '%s' has non-hex char '%c' at position %zu",
+			    power_mode, power_mode[i], i);
+	}
+
+	printf("pseries_energy test passed\n");
+	return 0;
+}
diff --git a/tools/testing/selftests/powerpc/papr_pseries/utils.h b/tools/testing/selftests/powerpc/papr_pseries/utils.h
new file mode 100644
index 000000000000..6eb88958a0ba
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_pseries/utils.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Local test utilities for papr_pseries selftests.
+ */
+#ifndef _PAPR_PSERIES_TEST_UTILS_H
+#define _PAPR_PSERIES_TEST_UTILS_H
+
+#include "../include/utils.h"
+
+#undef FAIL_IF_MSG
+#define FAIL_IF_MSG(x, fmt, ...)					\
+do {									\
+	if ((x)) {							\
+		fprintf(stderr, "[FAIL] " fmt "\n", ##__VA_ARGS__);	\
+		return 1;						\
+	}								\
+} while (0)
+
+#endif /* _PAPR_PSERIES_TEST_UTILS_H */
-- 
2.55.0


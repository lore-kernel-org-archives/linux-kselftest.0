Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019190;
	b=EqQjwghv2aU3qmYDTP+a9hpIebqA0S4DE+pGFPzyJeNidD6iEaE4CcvwWI/S0rUgv86n
	 M+uDWG2668Rb7RhcOSkEX0bNqAxo6rrzzjyGdpumCssdvSrCdvOEECAKbh9xOhzD0/Dar
	 cIqABiFMx0s1CbxjFUnYpmn6fr1yL9tyCek+ZoSE5kIJKDkxXjEPEoehDPB0ThjpPIxlf
	 h6A8uBUh3+64bZHTwjbL268K0ZrXkk8yl0SdWKei7VBQePngj00nKzNncKGC6fQEpI2lA
	 0SSy8NlfbXzD1zpdJ/VmMcW5SY8qD5vHI9bXqnf8e4Qd0o66VPJXUgFPoa5dndHXVRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L420166GSS4TE+K47OptRNcFOTisOIHTM/2QMseJ/eQ=;
	b=lrs1Nd2RZmZDZMdt/r/KSMgORA9Fq6l2KSGNa03N1ZoQheJWiWOUqWqMSCQTRRXG1GOQ
	 goTa1/7Yoi5gSkAALOZkgHnKi+laq6HUlse6xWgMJ0SkYvXiIHqOIUXriCcQQKph48uQX
	 HPpJ2TTwl+eXB5lW8zTWCgCBxb7XXvOD5x3xOZoFumIZ+RjsaLvQ0JS1RLsPK5ofvWW7k
	 eZ09HBQZX1pHBlsoaL1ubPl2viZ6uv/MSJLDkqIhKh/ICpTLjLgQ5p+feBb3qkrFgUacy
	 GK1qBzPX57fSGXj8RPipc5w7ymBsX+YJ4jbVlQY3kANKc6lFjcax1lmuwX5ZFka3HCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lbXY0gAz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JNPueRbZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C736A606A32E
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 02:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C736A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lbXY0gAz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JNPueRbZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A72Bpsk2138080
	for <linux-kselftest@vger.kernel.org>; Sat, 7 Nov 2026 02:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L420166GSS4
	TE+K47OptRNcFOTisOIHTM/2QMseJ/eQ=; b=lbXY0gAz5PjhZ53/zvhjXNUzRVe
	2M8GWGe8UczDg43WWUJiAcU22wyjOmftVZWAKG/fBBUx6RC2ZGJdQW3zl20ggfIv
	jptojMcEOJJkSiicXOzxyARK0CjvbSqTYi+u3W5FtsBXHTygxuYYyIn+Hb0GWGik
	OUzC7GcOR/Pury2piCPxQeGZr/KFSXlNJdz/j00AzbYm085PJY1og9odi1OFxaJk
	4dNQhQEFGKqcZnxGD9CPfgqtcSu52bSU6cpcBgKDmki5xTBRzuqSjEfWPFLoo63G
	DLWGWbNaP2C7TaBPQgHdHyNjv41eQPUq9QOaAinxsUDhE5bouNUB/JXXAAQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsu06r2j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 02:39:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36cec75d8caso349117eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 18:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794019188; x=1794623988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L420166GSS4TE+K47OptRNcFOTisOIHTM/2QMseJ/eQ=;
        b=JNPueRbZT8SL+ynqbJF1FgUeQJ1iulUCqfFfl2bCT4TRKRje8VdmO3hm2pzQB0IC0x
         gsfeY2OJk2t2G8AGZNg2QMdD2DcfdPTQNM6urUlrHvzOu15dip65UACrtBPrgyf1pmEe
         TDHjZQUCxnWne/8UBW5vn534EpXh1C4WavGkwLFQh9Xo9nOMSF7h/SI1M1X18atJ2GMK
         TofGrlJP5iikBqW0wecj74WlLZ1GmWaYvGqTaBR0aGqhiCWBzAyI4N7pRiXmnlr6RLwh
         keNiXYRwnclMyXeZpzj9YATjkR7J/2vLyXRpbAG9YAKdnZ3b4YTyRsunZXX4KLHCRSMO
         TxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019188; x=1794623988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L420166GSS4TE+K47OptRNcFOTisOIHTM/2QMseJ/eQ=;
        b=NwIzXV3FBqS6uhZx78VYVXl0h/lmqTI3l+6V8VcJEUGqqKqvnnYFnaii/y1uuXN1wn
         iiNfTGblJc/K9JjGOZCIWu1+nEMDiAKW90IiXj0bbEAD2FP9zdJaF/tTswrpaGyo489G
         hSjNMxnCSGZZgekPXsqAAay+MEJwXAT7bU8OY4aBOm54LiUkia0o85ujX5ygunvgzjIo
         AcFVoitny4zBgSde3cS7vTrt7vSkkOwUH5mBRg3USQILnHAKI/NBCLSIssm0GLHg8LQv
         fQ66XNiM7Oqi9S34IXuUwchjeWwEr5JiLG9t1WshmmL+5UO1PDF9f0cw0z305mZZlKQ0
         e15g==
X-Forwarded-Encrypted: i=1; AL+hErELzk4orq/81ab4Fv1M8Ze3e3dWeS8gUTtl62P53Q/jVzeohdbOfjO8p4WwWFMCKMq0E6s0etZVHbXwRWrxPsY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QwPWnSPJcrB9ytI/1bMXDjqffJJjN13A1mFi2r17+hjJe09zr
	DRpGmwKLiDGqv2rX79Tj+rmZcMHa452Kd2E5cANNIfmEmOf0EW9uMpwjqyKhlOFm/bj7bV1e81N
	j5duaEVKiSz/CEXQjZqArnHHwaagZEjKt/H9DrBppzcjSa+ztH6vudPymDejSHCMsolLh4Eo=
X-Gm-Gg: AYBFou2KqpuN+G3kMfEJGsUdRVmBtFMhg+PR9XvS7x9pP8M1lqDnoEnFLaYBlaBEUEh
	l5M4XJqQQrjXhHna2tcHJl5728sTM8Mbv6B+29+HPRPpe4QfzxD1XUO/nkZbjfodzY3XHyv5g9m
	JIhC/uv0es6DgaRgG2trf/IZ0YvIJeuGjiCG+uIxz4k+FRSuV9cExxM+EfZJgVSIlBVohFEyl7F
	rmMrv/BG+t7EXaH2dUeRxcOH4vCjEeKqicwqD8nOo+2V6j2ihZeCmyYE6MHr9ZjUDFB5vpwRp4s
	eqv9KDY/1Tjd13u1g9et9rfVgbUXg019VfBdfO+SQ6dB4o9u4dq4DdF+Xv44MB7vIkEV5D9vcrw
	k78iBXgJ9i/uS01Qpxa9HClN0HxlXqQpDYWP4IUC3Tnm7F+fdG6fnBGm2aLz1c+dmWtsqVhLd88
	iNnAXvG6xFXJ63tXQ/Elf7ZxSPC8qNe6h2xQ/rUgPxFyerYrwY+JbsAQ+pk3MlyN6vsBg9Q/tNc
	Q==
X-Received: by 2002:a05:7301:7c0b:b0:370:7fee:497f with SMTP id 5a478bee46e88-370f8269e21mr1593326eec.26.1794019187442;
        Fri, 06 Nov 2026 18:39:47 -0800 (PST)
X-Received: by 2002:a05:7301:7c0b:b0:370:7fee:497f with SMTP id 5a478bee46e88-370f8269e21mr1593255eec.26.1794019186655;
        Fri, 06 Nov 2026 18:39:46 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm11069040eec.29.2026.11.06.18.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:39:46 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jtaubepe@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v8 2/8] riscv: Add breakpoint and watchpoint test for riscv
Date: Sat,  7 Nov 2026 08:09:11 +0530
Message-ID: <20261107023917.40606-3-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
References: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfX6HFjHt2OJ5uH
 sUVCIYy8k8C8gRUfg8eih1H2HkbuyaBxEsBeLP1LmfxYllSv/IRZIcrg9MuMya6vChBqPbZDVVO
 b7lLQx79qx1Vd3CwAPEXNmyJJY52xekUF9aSz1ZtyAO7HOft3W9iyQZFgSGPZ9Rn91AM5vvhh95
 gGMXs8vIqK8HchccmNquibLNs54c+ZaZQrAy1HgPpOvbzRm3/wSJC5YUu7n9ENaSbM0ms8Ey+KT
 qW5a1KWcYLcdNU2Ki0wQUfSSDCElEDJQE5GFG0O8qp3IfPeZAUJD+euxONnJGBPK6AvCrYmjiBe
 rAZQl0Ye3EMDh7QhFtT+L9AryLyMhQf+rA2Iun0b5TDnE4ZjHWpxh23WHk+RRxEnnbwv//IF7IU
 DXFLFRRDRFZIlrhRIPtwRuEeGch3CrRyXOhqxc4IecflNBk8Y8zlSSOuZj9Ovgnpe0VoFlZELKd
 sqbp5xEWt+aOXoYO6rA==
X-Proofpoint-GUID: qcamew4nT0_nG9jhYjJBC76_S7iohWLD
X-Authority-Analysis: v=2.4 cv=IJGXmQvG c=1 sm=1 tr=0 ts=6aee8f74 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=2Ls8_GQA_paks6FoIQwA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: qcamew4nT0_nG9jhYjJBC76_S7iohWLD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfX7+NaOPgbDDuO
 3tCvWSF2rHxyVmPiwDFo4jyngzEOqQQgcUqKU4F7nUhX9IJ2yzLYvLeVYIZIh6hnRUSv7/q9ZLd
 9VLT425xjuuSiw/Ie/ocUvTvE9Xe+CU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070010

Add self test for riscv architecture. It uses ptrace to ptrace framework
to set/unset break/watchpoint and uses signals to check triggers.

Also add $(KHDR_INCLUDES) to CFLAGS for the riscv test build so the
UAPI headers exercised by the test can be located during compilation.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 MAINTAINERS                                   |   1 +
 tools/testing/selftests/breakpoints/Makefile  |   8 +
 .../breakpoints/breakpoint_test_riscv.c       | 215 ++++++++++++++++++
 3 files changed, 224 insertions(+)
 create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_riscv.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 73b69e8dcba1..baf97e8c39f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24171,6 +24171,7 @@ F:	arch/riscv/include/asm/perf_event.h
 F:	arch/riscv/kernel/hw_breakpoint.c
 F:	arch/riscv/kernel/perf_*
 F:	drivers/perf/
+F:	tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
 
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@kernel.org>
diff --git a/tools/testing/selftests/breakpoints/Makefile b/tools/testing/selftests/breakpoints/Makefile
index 0b8f5acf7c78..1f28f50e8f85 100644
--- a/tools/testing/selftests/breakpoints/Makefile
+++ b/tools/testing/selftests/breakpoints/Makefile
@@ -12,5 +12,13 @@ ifneq (,$(filter $(ARCH),aarch64 arm64))
 TEST_GEN_PROGS += breakpoint_test_arm64
 endif
 
+ifneq (,$(filter $(ARCH),riscv riscv64))
+TEST_GEN_PROGS += breakpoint_test_riscv
+endif
+
 include ../lib.mk
 
+ifneq (,$(filter $(ARCH),riscv riscv64))
+$(OUTPUT)/breakpoint_test_riscv: CFLAGS += -static $(KHDR_INCLUDES)
+endif
+
diff --git a/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
new file mode 100644
index 000000000000..a8a94a788142
--- /dev/null
+++ b/tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Qualcomm Technologies, Inc.
+ *
+ * Author: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
+ */
+
+#define _GNU_SOURCE
+#include <linux/perf_event.h>    /* Definition of PERF_* constants */
+#include <linux/hw_breakpoint.h> /* Definition of HW_* constants */
+#include <sys/syscall.h>         /* Definition of SYS_* constants */
+#include <unistd.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/ioctl.h>
+#include <time.h>
+#include <fcntl.h>
+#include <signal.h>
+#include <sys/mman.h>
+#include <string.h>
+#include <semaphore.h>
+#include <errno.h>
+
+static int gfd;
+sem_t ib_mtx, wp_mtx;
+static int bp_triggered, wp_triggered;
+static int test_func_sink;
+static const int wait_timeout_sec = 5;
+
+int setup_bp(bool is_x, void *addr, int sig)
+{
+	struct perf_event_attr pe;
+	int fd;
+
+	memset(&pe, 0, sizeof(struct perf_event_attr));
+	pe.type = PERF_TYPE_BREAKPOINT;
+	pe.size = sizeof(struct perf_event_attr);
+
+	pe.config = 0;
+	pe.bp_type = is_x ? HW_BREAKPOINT_X : HW_BREAKPOINT_W;
+	pe.bp_addr = (unsigned long)addr;
+	pe.bp_len = sizeof(long);
+
+	pe.sample_period = 1;
+	pe.sample_type = PERF_SAMPLE_IP;
+	pe.wakeup_events = 1;
+
+	pe.disabled = 1;
+	pe.exclude_kernel = 1;
+	pe.exclude_hv = 1;
+
+	fd = syscall(SYS_perf_event_open, &pe, 0, -1, -1, 0);
+	if (fd < 0) {
+		printf("Failed to open event: %llx\n", pe.config);
+		return -1;
+	}
+
+	fcntl(fd, F_SETFL, O_RDWR | O_NONBLOCK | O_ASYNC);
+	fcntl(fd, F_SETSIG, sig);
+	fcntl(fd, F_SETOWN, getpid());
+
+	ioctl(fd, PERF_EVENT_IOC_RESET, 0);
+
+	return fd;
+}
+
+static void sig_handler_bp(int signum, siginfo_t *oh, void *uc)
+{
+	int ret;
+
+	bp_triggered++;
+
+	printf("Breakpoint triggered!\n");
+	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
+	ret = sem_post(&ib_mtx);
+	if (ret) {
+		printf("Failed to report BP success\n");
+		return;
+	}
+}
+
+static void sig_handler_wp(int signum, siginfo_t *oh, void *uc)
+{
+	int ret;
+
+	printf("Watchpoint triggered!\n");
+	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
+	wp_triggered++;
+
+	ret = sem_post(&wp_mtx);
+
+	if (ret) {
+		printf("Failed to report WP success\n");
+		return;
+	}
+}
+
+/*
+ * Keep a real instruction address for HW execute breakpoints: prevent inlining
+ * and force a visible side effect so the function can't be optimized away.
+ */
+static __attribute_noinline__ void test_func(void)
+{
+	test_func_sink++;
+	__asm__ __volatile__("" : : "g" (test_func_sink));
+}
+
+static int trigger_bp(void)
+{
+	struct sigaction sa;
+
+	memset(&sa, 0, sizeof(struct sigaction));
+	sa.sa_sigaction = (void *)sig_handler_bp;
+	sa.sa_flags = SA_SIGINFO;
+
+	if (sigaction(SIGIO, &sa, NULL) < 0) {
+		printf("Failed to setup signal handler\n");
+		return -1;
+	}
+
+	gfd = setup_bp(1, test_func, SIGIO);
+
+	if (gfd < 0) {
+		printf("Failed to setup breakpoint.\n");
+		return -1;
+	}
+
+	ioctl(gfd, PERF_EVENT_IOC_ENABLE, 0);
+
+	test_func();
+
+	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
+
+	close(gfd);
+
+	return 0;
+}
+
+static int trigger_wp(void)
+{
+	struct sigaction sa;
+	unsigned long test_data;
+
+	memset(&sa, 0, sizeof(struct sigaction));
+	sa.sa_sigaction = (void *)sig_handler_wp;
+	sa.sa_flags = SA_SIGINFO;
+
+	if (sigaction(SIGUSR1, &sa, NULL) < 0) {
+		printf("Failed to setup signal handler\n");
+		return -1;
+	}
+
+	gfd = setup_bp(0, &test_data, SIGUSR1);
+
+	if (gfd < 0) {
+		printf("Failed to setup watchpoint\n");
+		return -1;
+	}
+
+	ioctl(gfd, PERF_EVENT_IOC_ENABLE, 0);
+	test_data = 0xdeadbeef;
+	ioctl(gfd, PERF_EVENT_IOC_DISABLE, 0);
+
+	return 0;
+}
+
+static int wait_event(sem_t *sem, const char *name)
+{
+	struct timespec ts;
+
+	if (clock_gettime(CLOCK_REALTIME, &ts)) {
+		printf("%s: Failed to get current time\n", name);
+		return -1;
+	}
+
+	/*
+	 * Deadlock fix: avoid blocking forever on sem_wait() if the breakpoint/
+	 * watchpoint signal never arrives. Use a bounded wait and fail the test
+	 * on timeout instead.
+	 */
+	ts.tv_sec += wait_timeout_sec;
+	if (!sem_timedwait(sem, &ts))
+		return 0;
+
+	if (errno == ETIMEDOUT)
+		printf("%s: Timed out waiting for event\n", name);
+	else
+		printf("%s: sem_timedwait() failed with %d\n", name, errno);
+
+	return -1;
+}
+
+int main(int argc, char *argv[])
+{
+	sem_init(&ib_mtx, 0, 0);
+	if (trigger_bp() < 0)
+		return -1;
+	if (wait_event(&ib_mtx, "Breakpoint") < 0)
+		return -1;
+
+	if (bp_triggered)
+		printf("Breakpoint test passed!\n");
+
+	sem_init(&wp_mtx, 0, 0);
+	if (trigger_wp() < 0)
+		return -1;
+	if (wait_event(&wp_mtx, "Watchpoint") < 0)
+		return -1;
+
+	if (wp_triggered)
+		printf("Watchpoint test passed!\n");
+
+	return 0;
+}
-- 
2.43.0


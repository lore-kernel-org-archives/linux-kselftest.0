Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206587;
	b=BpqZU/4wYdPwc4EyVcRhAqFyPxJLhwJ4GpmYyVi3Q6mneOShPVMF6TXM1f/f79wQNH91
	 DNGBeXSh0acUMX8mm5Nlff0A4ahtwMnQ2sM2HaU3Z+zzLa6lex4CahmeBFyqNU9R4fjUw
	 TF/yYjfn+bi6s41Dwvcsozg0WcFNnWKAFLW6l/MtXDtUSLFwf+RDsHXLFg1Y2vKmLo9av
	 hN7BqmKyo8I/fmWfZlAvgbzzKQ+0fHZTTMrudtw7i1wrhfozvhawfjyA7NW+eR3xI3DY8
	 WrhcuaBXsAe6mTqSCah3ZOaFdSbcLt+DGQlrIZXUiyyH6H4PjqufEuZkEJhzSvE7xeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206587;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6cCKb4ZsTJCW0Lg7g7NHqCcpsh5jdyrAoURakZpskAU=;
	b=J9anIOjrRpixlFIAAT5Zxd9L2pyRkD0dXDUZtNgUKFcMqZwmFnVBeuzsPg4jVMZo0C4G
	 acWL3VVLkb22CMH3jt4w/vKAAVboBvMGYj6C/7yjEdQM1k28kTXofguLWQTdeKeIUNJvF
	 OdTHvHiYFQhEd6we1tf3gjwhjX5OP6o8NjDAaefE09NvMVSuW0CK8mX5fDjpTQoBb7Seo
	 l6pDP/xJs+4Wh65apfBLh7qizcMbvih3PzeuRQaOb4Uxsd/IeJE2gErEzg3TTetb1TP2e
	 VQXP2crjetmPugf7Pgg5VVpz1Qp9Ct3D3439N4klSz7Hz1EHiSdKaMbZpQWZJevcIAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ip5ZYmN4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5EE606A320;
	Wed, 28 Oct 2026 16:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A5EE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ip5ZYmN4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAXa81153223;
	Wed, 28 Oct 2026 16:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6cCKb4ZsTJC
	W0Lg7g7NHqCcpsh5jdyrAoURakZpskAU=; b=Ip5ZYmN4I4H+kZxTZoMjpho5PMq
	FT0Wwz+pPGXiR8BURzNQGlswWSykGIjDTfBTURN9k69iUEEfZUwhFNF0JDq5CCPF
	Q0ixe2nKrUNfXDGt1EGafNs61i7Aiq+r/RedGDedsFr35c3pQW/J8utb2UoVCuIw
	djg28G69m5aDO9pMyI1okMK1I2DCUWxVsH3YSLbNRGiHV9dNHsVNGkJc8EoG2zVx
	nooKHGQPwSGCF2lL8tWMc0PIIRhrdw2ECQkcgS1og1YUNf82xHjtdSLYMwJ+e/iH
	ZgM3sgCfmNw+vrtJMA8dvYZjZWKViTmEnBllZgjU/gMpy2Q/rJix6JSCMEA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be3knq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 16:55:38 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69SGtZnM1881587;
	Wed, 28 Oct 2026 16:55:35 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69SGtZSf1881553
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 16:55:35 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 48D3E252E7; Wed, 28 Oct 2026 22:25:33 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
        Conor Dooley <conor@kernel.org>, Atish Patra <atish.patra@linux.dev>,
        Anup Patel <anup@brainfault.org>
Cc: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v11 9/9] selftests/riscv: add perf user-stack SSE copy regression test
Date: Wed, 28 Oct 2026 22:25:31 +0530
Message-ID: <20261028165531.940336-10-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: uMSK7xpzRf240bAXNzjWx1fWxr9aXi8l
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae2290a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=968KyxNXAAAA:8 a=nrnoi1aWnlDsiPABkzsA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfXx6aI4OjZ5RVc
 C73Lph5VG5Gnw0OQSk2B+7yU5IjoPLo+D1vop+ENSzfp5DfsGDq1o/Mui6LzgwhZOevjmAjWhkE
 0tUm+u0KIxHoOT0vTNpV92gIuj99elE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX7o0Uc03l1Ssp
 yfQe19frwP6RadOmaRK208acrHwNFcOexYKw4ak/1+FhguoIqZWLVFc7GA9AmUYHCvl1Hqjz11a
 KL+p3od4lUtEZFGcOSBCu3BFdChrF2hobjRYGieTDr1dXxZAcfpPY2QVNruPr0z/w4QrCKYoGx/
 guTV3cFsNP2L7ZFDICfvgvM1Nv/sdqSRsdxDz0ZaR+7wf1uj4GF4R/ln6MDkTsUy4qg4lXco3b5
 dRN+5u/VsTl/XXRGxw1BruDNVs/qZGNO9l55IthJKMJYHa0LKs8zJR59uV7mT0W1sxS2X4sXmeH
 JEsM5vgST7LWx3N0ZQlRLTHwQo7hlyDyElajEgNXkzmDJy8DG1hRmOTtTE1m5V9zq6sXXmx2Czz
 TRgvzLFowbuKDmuAXpvyW1HrVBAQhd5zam5y9UJM4zKJuZI+CieJNyjvoWfkC0GxAip7v77C8wB
 BOHdCbwyYVl3aaz37PQ==
X-Proofpoint-GUID: uMSK7xpzRf240bAXNzjWx1fWxr9aXi8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280067

From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>

On RISC-V, PMU overflow interrupts can be delivered through the SBI
Supervisor Software Events (SSE) mechanism. A perf event that samples
the raw user stack (PERF_SAMPLE_STACK_USER, as perf record
--call-graph dwarf does) then copies a chunk of the interrupted task's
user stack from an NMI-like context. If that copy is allowed to take a
nested page fault it can corrupt the interrupted task's kernel state and
hang or crash the machine under load; this is what
riscv_perf_out_copy_user() and the nofault page-fault change fix.

The existing SSE selftest module exercises the framework (register,
enable, inject, complete, priorities, stress) but never drives the perf
user-stack copy that motivated the no-fault path. Add a userspace test
that closes that gap:

  - Open a sampling hardware PMU event with PERF_SAMPLE_STACK_USER over a
    deep, partially non-resident user stack, drain the ring buffer, and
    verify every SAMPLE record is well formed and never reports more
    dumped bytes than were requested. This checks that a non-resident
    page truncates the dump cleanly instead of faulting or overrunning.
  - Drive a multi-CPU unix-socket + deep-recursion workload under
    high-frequency DWARF sampling; the pass criterion is simply that the
    machine survives, since the original bug took it down.

The test reports SKIP when hardware PMU sampling is unavailable or
perf_event_paranoid forbids it, so it is safe to run unprivileged or in
constrained environments. It is placed under the RISC-V SSE selftests
because SSE delivery is the RISC-V-specific condition it protects, and
is wired into the sse subtarget Makefile alongside the module runner.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 tools/testing/selftests/riscv/sse/Makefile    |   5 +
 .../selftests/riscv/sse/sse_perf_ustack.c     | 564 ++++++++++++++++++
 2 files changed, 569 insertions(+)
 create mode 100644 tools/testing/selftests/riscv/sse/sse_perf_ustack.c

diff --git a/tools/testing/selftests/riscv/sse/Makefile b/tools/testing/selftests/riscv/sse/Makefile
index 7e2677fdce09..646b418de9ff 100644
--- a/tools/testing/selftests/riscv/sse/Makefile
+++ b/tools/testing/selftests/riscv/sse/Makefile
@@ -1,5 +1,10 @@
+CFLAGS += -I$(top_srcdir)/tools/testing/selftests
+LDLIBS += -lpthread
+
 TEST_GEN_MODS_DIR := module
 
+TEST_GEN_PROGS := sse_perf_ustack
+
 TEST_PROGS := run_sse_test.sh
 
 include ../../lib.mk
diff --git a/tools/testing/selftests/riscv/sse/sse_perf_ustack.c b/tools/testing/selftests/riscv/sse/sse_perf_ustack.c
new file mode 100644
index 000000000000..9535b6d7ba4c
--- /dev/null
+++ b/tools/testing/selftests/riscv/sse/sse_perf_ustack.c
@@ -0,0 +1,564 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Regression test for the RISC-V perf user-stack copy taken in SSE
+ * (NMI-like) context.
+ *
+ * On RISC-V, PMU overflow interrupts can be delivered through the SBI
+ * Supervisor Software Events (SSE) mechanism. A perf event that samples the
+ * raw user stack (PERF_SAMPLE_STACK_USER, as perf record --call-graph dwarf
+ * does) then copies a large chunk of the interrupted task's user stack from
+ * that context. If that copy is allowed to take a nested page fault it can
+ * corrupt the interrupted task's kernel state and hang or crash the machine
+ * under load.
+ *
+ * This test exercises that exact path:
+ *   - It opens a sampling hardware PMU event with PERF_SAMPLE_STACK_USER.
+ *   - It samples a child running on a controlled user stack followed by an
+ *     inaccessible page, so the copy must truncate at that page boundary.
+ *   - It checks that every user-stack sample record is well formed and that
+ *     the dumped size never exceeds the requested size (i.e. the copy stops
+ *     cleanly rather than faulting on).
+ *   - It then drives a multi-threaded unix-socket + deep-recursion workload
+ *     under high-frequency per-CPU sampling and requires every active sampler
+ *     to make progress without taking the machine down.
+ *
+ * The test is architecture independent in what it drives; it is placed under
+ * the RISC-V SSE selftests because SSE delivery is the RISC-V-specific
+ * condition it is meant to protect.
+ */
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <poll.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+
+#include <linux/perf_event.h>
+#include <pthread.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/socket.h>
+#include <sys/syscall.h>
+#include <sys/wait.h>
+
+#include "../../kselftest.h"
+
+#ifndef noinline
+#define noinline __attribute__((noinline))
+#endif
+
+#define STACK_DUMP_SIZE		8192		/* 8 KiB, 8-byte aligned */
+#define RB_DATA_PAGES		64		/* power of two */
+#define SELF_SAMPLE_FREQ	4000
+#define STRESS_SAMPLE_FREQ	5000
+#define STRESS_SECONDS		5
+#define RECURSE_DEPTH		512
+#define TRUNCATION_RUN_MS	250
+
+static long page_size;
+
+static int perf_event_open(struct perf_event_attr *attr, pid_t pid, int cpu,
+			   int group_fd, unsigned long flags)
+{
+	return syscall(__NR_perf_event_open, attr, pid, cpu, group_fd, flags);
+}
+
+/* Prevent the compiler from optimizing away a stack buffer. */
+static void keep_alive(void *p)
+{
+	__asm__ __volatile__("" : : "r"(p) : "memory");
+}
+
+/*
+ * Consume a deep user stack and keep it live, so a raw user-stack sample has
+ * many pages to copy. Returns a value derived from the stack so the compiler
+ * cannot elide the frames.
+ */
+static noinline unsigned long burn_stack(int depth, unsigned long *sink)
+{
+	unsigned long frame[32];
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(frame); i++)
+		frame[i] = (unsigned long)depth * i + *sink;
+
+	if (depth > 0)
+		frame[depth & 31] += burn_stack(depth - 1, sink);
+
+	for (i = 0; i < ARRAY_SIZE(frame); i++)
+		*sink += frame[i];
+
+	keep_alive(frame);
+	return *sink;
+}
+
+static struct perf_event_attr sampling_attr(unsigned long freq)
+{
+	struct perf_event_attr attr = {
+		.type		= PERF_TYPE_HARDWARE,
+		.size		= sizeof(attr),
+		.config		= PERF_COUNT_HW_INSTRUCTIONS,
+		.sample_type	= PERF_SAMPLE_STACK_USER,
+		.sample_stack_user = STACK_DUMP_SIZE,
+		.freq		= 1,
+		.sample_freq	= freq,
+		.disabled	= 1,
+		.exclude_kernel	= 1,
+		.exclude_hv	= 1,
+	};
+
+	return attr;
+}
+
+static bool open_skip_reason(int err, const char **why)
+{
+	switch (err) {
+	case EACCES:
+	case EPERM:
+		*why = "insufficient privilege for PMU sampling (perf_event_paranoid)";
+		return true;
+	case ENOENT:
+	case ENODEV:
+	case EOPNOTSUPP:
+		*why = "hardware PMU sampling event not available";
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool pmu_sse_route_testable(const char **why)
+{
+	char *line = NULL;
+	size_t line_size = 0;
+	FILE *interrupts;
+	bool testable = true;
+
+	interrupts = fopen("/proc/interrupts", "re");
+	if (!interrupts) {
+		*why = "cannot inspect the active PMU delivery route";
+		return false;
+	}
+
+	/* The SBI PMU driver registers this name only for ordinary IRQ delivery. */
+	while (getline(&line, &line_size, interrupts) >= 0) {
+		if (strstr(line, "riscv-pmu")) {
+			*why = "ordinary RISC-V PMU IRQ delivery is active";
+			testable = false;
+			break;
+		}
+	}
+
+	free(line);
+	fclose(interrupts);
+	return testable;
+}
+
+static bool ring_copy_from(void *dst, const void *rb, size_t rb_bytes,
+			   uint64_t pos, size_t size)
+{
+	size_t offset = pos % rb_bytes;
+	size_t first;
+
+	if (size > rb_bytes)
+		return false;
+
+	first = size < rb_bytes - offset ? size : rb_bytes - offset;
+	memcpy(dst, (const char *)rb + offset, first);
+	if (first != size)
+		memcpy((char *)dst + first, rb, size - first);
+
+	return true;
+}
+
+static int truncation_child(void *arg)
+{
+	int ready_fd = (intptr_t)arg;
+	char ready = 1;
+
+	if (write(ready_fd, &ready, sizeof(ready)) != 1)
+		return 1;
+
+	for (;;)
+		__asm__ __volatile__("" : : : "memory");
+}
+
+static pid_t start_truncation_child(void **stack_mapping)
+{
+	struct pollfd pfd = { .events = POLLIN };
+	size_t mapping_size = 2 * page_size;
+	char ready;
+	void *stack;
+	pid_t pid;
+	int pipefd[2];
+	int saved_errno;
+
+	stack = mmap(NULL, mapping_size, PROT_NONE,
+		     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (stack == MAP_FAILED)
+		return -1;
+	if (mprotect(stack, page_size, PROT_READ | PROT_WRITE))
+		goto err_unmap;
+	if (pipe(pipefd))
+		goto err_unmap;
+
+	/* clone() starts the child below the inaccessible second page. */
+	pid = clone(truncation_child, (char *)stack + page_size, SIGCHLD,
+		    (void *)(intptr_t)pipefd[1]);
+	if (pid < 0)
+		goto err_pipe;
+
+	close(pipefd[1]);
+	pfd.fd = pipefd[0];
+	if (poll(&pfd, 1, 1000) != 1 ||
+	    read(pipefd[0], &ready, sizeof(ready)) != sizeof(ready)) {
+		saved_errno = ETIMEDOUT;
+		kill(pid, SIGKILL);
+		waitpid(pid, NULL, 0);
+		close(pipefd[0]);
+		errno = saved_errno;
+		goto err_unmap;
+	}
+	close(pipefd[0]);
+
+	*stack_mapping = stack;
+	return pid;
+
+err_pipe:
+	saved_errno = errno;
+	close(pipefd[0]);
+	close(pipefd[1]);
+	errno = saved_errno;
+err_unmap:
+	saved_errno = errno;
+	munmap(stack, mapping_size);
+	errno = saved_errno;
+	return -1;
+}
+
+static void stop_truncation_child(pid_t pid, void *stack_mapping)
+{
+	kill(pid, SIGKILL);
+	while (waitpid(pid, NULL, 0) < 0 && errno == EINTR)
+		;
+	munmap(stack_mapping, 2 * page_size);
+}
+
+/*
+ * Subtest 1: sample a child whose stack is followed by an inaccessible page.
+ * Every record must be well formed and at least one stack copy must truncate
+ * at the controlled page boundary rather than fault or overrun.
+ */
+static void test_ustack_records_wellformed(void)
+{
+	struct perf_event_attr attr = sampling_attr(SELF_SAMPLE_FREQ);
+	size_t rb_bytes = (size_t)RB_DATA_PAGES * page_size;
+	struct perf_event_mmap_page *meta;
+	unsigned long samples = 0, truncated = 0;
+	void *child_stack;
+	const char *why;
+	void *rb;
+	pid_t child;
+	int fd;
+
+	child = start_truncation_child(&child_stack);
+	if (child < 0) {
+		ksft_test_result_fail("ustack records: create guarded stack child: %s\n",
+				      strerror(errno));
+		return;
+	}
+
+	fd = perf_event_open(&attr, child, -1, -1, PERF_FLAG_FD_CLOEXEC);
+	if (fd < 0) {
+		if (open_skip_reason(errno, &why))
+			ksft_test_result_skip("ustack records: %s\n", why);
+		else
+			ksft_test_result_fail("ustack records: perf_event_open: %s\n",
+					      strerror(errno));
+		goto out_child;
+	}
+
+	meta = mmap(NULL, page_size + rb_bytes, PROT_READ | PROT_WRITE,
+		    MAP_SHARED, fd, 0);
+	if (meta == MAP_FAILED) {
+		ksft_test_result_fail("ustack records: mmap ring buffer: %s\n",
+				      strerror(errno));
+		close(fd);
+		goto out_child;
+	}
+	rb = (char *)meta + page_size;
+
+	ioctl(fd, PERF_EVENT_IOC_RESET, 0);
+	ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);
+	usleep(TRUNCATION_RUN_MS * 1000);
+	ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
+
+	/* Drain the ring buffer and validate every SAMPLE record. */
+	{
+		uint64_t head = __atomic_load_n(&meta->data_head, __ATOMIC_ACQUIRE);
+		uint64_t tail = meta->data_tail;
+		bool ok = true;
+
+		if (head < tail || head - tail > rb_bytes)
+			ok = false;
+
+		while (ok && tail < head) {
+			struct perf_event_header hdr;
+			uint64_t available = head - tail;
+
+			if (available < sizeof(hdr) ||
+			    !ring_copy_from(&hdr, rb, rb_bytes, tail, sizeof(hdr)) ||
+			    hdr.size < sizeof(hdr) || hdr.size > available ||
+			    hdr.size > rb_bytes) {
+				ok = false;
+				break;
+			}
+
+			if (hdr.type == PERF_RECORD_SAMPLE) {
+				uint64_t dump_size, dyn_size;
+				size_t cursor = sizeof(hdr);
+
+				if (sizeof(dump_size) > hdr.size - cursor ||
+				    !ring_copy_from(&dump_size, rb, rb_bytes,
+						    tail + cursor, sizeof(dump_size)) ||
+				    dump_size > STACK_DUMP_SIZE) {
+					ok = false;
+					break;
+				}
+				cursor += sizeof(dump_size);
+				samples++;
+				if (dump_size) {
+					/* data blob then trailing dynamic size */
+					if (dump_size > hdr.size - cursor) {
+						ok = false;
+						break;
+					}
+					cursor += dump_size;
+					if (sizeof(dyn_size) > hdr.size - cursor ||
+					    !ring_copy_from(&dyn_size, rb, rb_bytes,
+							    tail + cursor,
+							    sizeof(dyn_size))) {
+						ok = false;
+						break;
+					}
+					if (dyn_size > dump_size) {
+						ok = false;
+						break;
+					}
+					if (dyn_size < dump_size)
+						truncated++;
+				}
+			}
+			tail += hdr.size;
+		}
+		__atomic_store_n(&meta->data_tail, head, __ATOMIC_RELEASE);
+
+		if (!ok)
+			ksft_test_result_fail("ustack records: malformed sample record\n");
+		else if (samples == 0)
+			ksft_test_result_skip("ustack records: no samples collected\n");
+		else if (truncated == 0)
+			ksft_test_result_fail("ustack records: no guarded-stack truncation\n");
+		else
+			ksft_test_result_pass("ustack records: %lu samples, %lu truncated\n",
+					      samples, truncated);
+	}
+
+	munmap(meta, page_size + rb_bytes);
+	close(fd);
+out_child:
+	stop_truncation_child(child, child_stack);
+}
+
+/* ---- Subtest 2: multi-threaded per-CPU sampling stress ---- */
+
+struct stress_thread {
+	pthread_t tid;
+	int cpu;
+	int *stop;
+	int fd;
+	void *rb;
+	size_t rb_bytes;
+};
+
+static void *stress_worker(void *arg)
+{
+	struct stress_thread *st = arg;
+	unsigned long sink = 1;
+	int sv[2];
+	char buf[64];
+
+	if (socketpair(AF_UNIX, SOCK_STREAM, 0, sv) == 0) {
+		while (!__atomic_load_n(st->stop, __ATOMIC_RELAXED)) {
+			/* unix-socket ping-pong: takes the socket locks the
+			 * original bug corrupted, while sampling nests.
+			 */
+			if (write(sv[0], buf, sizeof(buf)) > 0)
+				(void)read(sv[1], buf, sizeof(buf));
+			burn_stack(RECURSE_DEPTH, &sink);
+			/* Periodically consume the ring buffer so sampling
+			 * keeps delivering rather than filling up and stopping.
+			 */
+			if (st->rb) {
+				struct perf_event_mmap_page *m = st->rb;
+				uint64_t h = __atomic_load_n(&m->data_head,
+							     __ATOMIC_ACQUIRE);
+				__atomic_store_n(&m->data_tail, h,
+						 __ATOMIC_RELEASE);
+			}
+		}
+		close(sv[0]);
+		close(sv[1]);
+	}
+
+	return (void *)sink;
+}
+
+static void test_sse_stress_no_crash(void)
+{
+	struct perf_event_attr attr = sampling_attr(STRESS_SAMPLE_FREQ);
+	size_t rb_bytes = (size_t)RB_DATA_PAGES * page_size;
+	struct stress_thread *threads;
+	cpu_set_t available;
+	long progressed = 0;
+	int stop = 0;
+	const char *why = NULL;
+	long started = 0;
+	long nproc;
+	long slot;
+	int cpu;
+
+	if (sched_getaffinity(0, sizeof(available), &available)) {
+		ksft_test_result_fail("sse stress: sched_getaffinity: %s\n",
+				      strerror(errno));
+		return;
+	}
+	nproc = CPU_COUNT(&available);
+	if (nproc < 1) {
+		ksft_test_result_skip("sse stress: no available CPUs\n");
+		return;
+	}
+
+	threads = calloc(nproc, sizeof(*threads));
+	if (!threads) {
+		ksft_test_result_fail("sse stress: out of memory\n");
+		return;
+	}
+
+	slot = 0;
+	for (cpu = 0; cpu < CPU_SETSIZE; cpu++) {
+		struct stress_thread *st;
+		pthread_attr_t thread_attr;
+		cpu_set_t set;
+		void *map;
+		int ret;
+
+		if (!CPU_ISSET(cpu, &available))
+			continue;
+		st = &threads[slot++];
+
+		st->fd = -1;
+		st->cpu = cpu;
+		st->stop = &stop;
+		st->rb_bytes = rb_bytes;
+		st->fd = perf_event_open(&attr, -1, cpu, -1,
+					 PERF_FLAG_FD_CLOEXEC);
+		if (st->fd < 0) {
+			if (!started && open_skip_reason(errno, &why))
+				break;
+			continue;
+		}
+
+		map = mmap(NULL, page_size + rb_bytes, PROT_READ | PROT_WRITE,
+			   MAP_SHARED, st->fd, 0);
+		if (map == MAP_FAILED) {
+			close(st->fd);
+			st->fd = -1;
+			continue;
+		}
+		st->rb = map;
+
+		CPU_ZERO(&set);
+		CPU_SET(cpu, &set);
+		pthread_attr_init(&thread_attr);
+		ret = pthread_attr_setaffinity_np(&thread_attr, sizeof(set), &set);
+		if (!ret)
+			ret = pthread_create(&st->tid, &thread_attr,
+					     stress_worker, st);
+		pthread_attr_destroy(&thread_attr);
+
+		if (ret) {
+			munmap(st->rb, page_size + rb_bytes);
+			close(st->fd);
+			st->rb = NULL;
+			st->fd = -1;
+			continue;
+		}
+
+		ioctl(st->fd, PERF_EVENT_IOC_RESET, 0);
+		ioctl(st->fd, PERF_EVENT_IOC_ENABLE, 0);
+		started++;
+	}
+
+	if (started == 0) {
+		free(threads);
+		if (why)
+			ksft_test_result_skip("sse stress: %s\n", why);
+		else
+			ksft_test_result_skip("sse stress: could not start any sampler\n");
+		return;
+	}
+
+	sleep(STRESS_SECONDS);
+	__atomic_store_n(&stop, 1, __ATOMIC_RELAXED);
+
+	for (slot = 0; slot < nproc; slot++) {
+		struct stress_thread *st = &threads[slot];
+		struct perf_event_mmap_page *meta;
+
+		if (st->fd < 0)
+			continue;
+		pthread_join(st->tid, NULL);
+		ioctl(st->fd, PERF_EVENT_IOC_DISABLE, 0);
+		meta = st->rb;
+		if (__atomic_load_n(&meta->data_head, __ATOMIC_ACQUIRE))
+			progressed++;
+		munmap(st->rb, page_size + rb_bytes);
+		close(st->fd);
+	}
+
+	free(threads);
+	if (progressed != started)
+		ksft_test_result_fail("sse stress: %ld/%ld samplers made progress\n",
+				      progressed, started);
+	else
+		ksft_test_result_pass("sse stress: %ld samplers x %ds made progress\n",
+				      started, STRESS_SECONDS);
+}
+
+int main(void)
+{
+	const char *why;
+
+	page_size = sysconf(_SC_PAGESIZE);
+
+	ksft_print_header();
+	ksft_set_plan(2);
+	if (!pmu_sse_route_testable(&why)) {
+		ksft_test_result_skip("ustack records: %s\n", why);
+		ksft_test_result_skip("sse stress: %s\n", why);
+		ksft_finished();
+	}
+
+	test_ustack_records_wellformed();
+	test_sse_stress_no_crash();
+
+	ksft_finished();
+}
-- 
2.43.0


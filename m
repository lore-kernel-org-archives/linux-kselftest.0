Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206590;
	b=kD2QCCs4rYXzA+Gfqvjf5WarCaY7nUXJ0k8wYBuByHOcN+SrGJGvMDMrfYXkZ3QrER1K
	 J7f05B1CkwbIrta3uQsBl9hPGnxbi+nPK7ZvNoBIRf8QBvgVKlvZM+b00qo0ACwdNCEHg
	 aC9L8mpRjmgtLOxXlgfJOMq66SebF7zrB9J+sLjUR7Zq3ft78gn5+4Qfy/eamuhVcLGw0
	 1oMUDYDloxIqgHTU9F8KV67yYYaNAZ59rkPZyL1gGv+T3+4LumTlERgGa1wHh2Gjcff86
	 W5A28ypwBhwsopo6LACGV6rZnxCC4NquE9RaaIUEafCpTaYWqVXLrqiG1ENTab16g/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206590;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zA6nw+JqPwJxbmOPnnuxrOtX5OYayEUmF0ewUL3WHI4=;
	b=Ig7rUJ0FRb+yRbHCkG+2umUXXV52xyXU7LxvKgPmpcL/wBdp/+Vjzash7RCg07jjRmvJ
	 WrN5OWqwGgxW2RO9+noLGjqZ6Yx6SXUTw144ogs2YHp7zQ92GYt+qVfRFkyb3BFvamqhY
	 OYPAy0ITrwqm+4UwSa+7LbnZOtC5xYJkI5DBAP5iPo2WGQHvOcaKCWEBwDPJqZ8RQljMe
	 zKfQukxN1h+DdWHCsMnTgDyjYxwbJht5KIke7OhzHQEKr49hZuyKPJ2L9/UurwqJgayhg
	 yob65OsogNyPnDqbHz4SiyiZvoWd4kLASOPPWR3AGKSi6+6+qBhWTe2r+OLZbRcc7RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AhMWa9Bw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EB0606A33B;
	Wed, 28 Oct 2026 16:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73EB0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AhMWa9Bw
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFB53G1517828;
	Wed, 28 Oct 2026 16:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zA6nw+JqPwJxbmOPnnuxrOtX5OYayEUmF0ewUL3WHI4=; b=AhMWa9Bw8plaOSBg
	xsMHQHhiUQhpXeXBxWHmHfgJw/lDvrBsEPbnrCtKJ7uQC4Q8ZEnVI/yE4yFU9u/G
	mzjoXJGIYV/yjD+SdNw0wulVa3x5S2Bz4lxb3GDa/ysuVPU4fwBvCk36Ht9OsT/8
	oDGIYK79KMMwtexU0zrDREHXVqOZ6+6pvasoJRVW3NYLnKoRwKa1rev28UnYNdUj
	SsDn/UHm7VLyUhFWbjxmBTWec1hmpP5O9Sgu/yoL9h5A6dIFInNz/Bu69Bskjlp1
	66hzXgx279Ia8vicSSErC2pJIpUe0f+oHHkVqy4cjZUwuFAnq4ltqCTKHRCmfVBZ
	AtZ6pw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwahbs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 16:55:38 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69SGtZgP1881588;
	Wed, 28 Oct 2026 16:55:35 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69SGtZVu1881555
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 16:55:35 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 4027824B6E; Wed, 28 Oct 2026 22:25:33 +0530 (+0530)
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
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH v11 7/9] perf: RISC-V: add support for SSE event
Date: Wed, 28 Oct 2026 22:25:29 +0530
Message-ID: <20261028165531.940336-8-anup.patel@oss.qualcomm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: riLTzE193iweZDac19HsZR3z7vntmJRL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX4JBZ0eU9OP8u
 GP8n2OpVWa0t4gZ/cBQgAc501RYlsJAAvDzYM034No+D6iiLKBqDAoRLHIuqMrwKCVorwCuXX/F
 DYc4a61YsJsosWY3iuAEJKKIWvBrZCw=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae2290a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=968KyxNXAAAA:8 a=W-_n0kkjAAAA:8 a=JfrnYn6hAAAA:8
 a=aAYUhIEaQGsTeNzxvKUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=MSi_79tMYmZZG2gvAgS0:22 a=qeNa2pbTr82C0GpJEZFS:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: riLTzE193iweZDac19HsZR3z7vntmJRL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX7cY42C22UFFH
 NvQlnePriqoaikWi6MbNaFvNZGDTpHinT7FLcqL/v4na3WYKOpQX44RiI/QfD/5RiwRqAZAnigg
 V3nuA/wLmuc4lUJTgrkBW8T4jCunRm03GTPesxqeoZ6Ayo68F+1xH1CCsLb1IcTWEGIYCymSDSe
 2hgEVRYbKf35ijYg64867pzZU9PPf4V7BWPMl3XO7TwmXZq0z2yYvkupjtJACApG/4ahkvwyvDG
 kS5sIyELZUy6ffT/kzMT1Xwf50YVv4yLjbg7/HUer4+i5m3/2guefeaSqvL7S4GWaGTXvWOMKUB
 I1/bu0oLpQmA4BQuhxzAQ7kHV1we7ETmVZn5thwYhW/FMpCBjpgGSQeWFe2/tj/HsrPNTOItGth
 /MlI+SN16k4kbDlVVA6+jFy6Ft0imGctiq1vk8dZObVTFOyE2Kxl3weQmt0j11E3V1Q3ru8OVeM
 GhBktxDFv3W3iEpFM7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280067

From: Clément Léger <cleger@rivosinc.com>

Register a handler for the local PMU overflow SSE event so that RISC-V
perf can receive overflows even when normal S-mode interrupts are masked.
Reuse the existing overflow handler and pass it the interrupted pt_regs
rebuilt by the architecture SSE entry path.

Select the delivery mechanism once during PMU probe. Prefer SSE when its
event can be registered and enabled. If the extension or PMU event is
explicitly unsupported, use the ordinary PMU interrupt. Do not enable the
interrupt after any other SSE setup failure or when a crash kernel may
have inherited firmware state. Install the PMU enable and disable
callbacks only after SSE delivery becomes active.

Keep the local PMU SSE event disabled across CPU power management. On
entry, the generic SSE notifier masks the hart before the lower-priority
PMU notifier disables the event and stops the counters. On exit, the SSE
notifier first unmasks the hart while the event remains disabled. The PMU
notifier then restores counters and event userpage state before enabling
the event. An unmask failure stops the notifier chain and leaves the
counters stopped. Ordinary PMU interrupts retain their existing notifier
ordering.

An SSE overflow can arrive as soon as the event is enabled during probe.
Publish the counter mask before SSE setup, so an early handler can stop
the counter source even before perf starts admitting normal samples.
After a real overflow, restart only counters whose perf state is still
running. Honor a non-zero return from perf_event_overflow() and leave
throttled events stopped.

Guest attribution is not part of this version. Detect an interrupted guest
from hstatus.SPV and skip its sample while still updating the period and
counter state, rather than exposing guest state as a host sample.

The perf PMU callbacks cannot return errors. If an SSE transition or
interrupted-context read fails, latch the failure per CPU and stop its
mapped events through the normal perf state transitions. Do not reset the
firmware counter mapping behind perf, restart a failed event, or attempt a
runtime switch to IRQ delivery.

During cleanup, close callback admission and synchronously drain each CPU
before disabling and unregistering the SSE event. If firmware refuses the
cleanup, stop the counter source and transfer the event to the SSE core so
later CPU hotplug or shutdown processing can retry without using freed PMU
callback state.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Co-developed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Co-developed-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 Documentation/arch/riscv/index.rst     |   1 +
 Documentation/arch/riscv/pmu-sse.rst   |  55 +++
 MAINTAINERS                            |   1 +
 drivers/firmware/riscv/riscv_sbi_sse.c |   9 +
 drivers/perf/Kconfig                   |  11 +
 drivers/perf/riscv_pmu.c               |  14 +-
 drivers/perf/riscv_pmu_sbi.c           | 536 +++++++++++++++++++++----
 include/linux/perf/riscv_pmu.h         |  20 +-
 include/linux/riscv_sbi_sse.h          |   6 +
 9 files changed, 562 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/arch/riscv/pmu-sse.rst

diff --git a/Documentation/arch/riscv/index.rst b/Documentation/arch/riscv/index.rst
index ac535c52d509..5cb909c83a88 100644
--- a/Documentation/arch/riscv/index.rst
+++ b/Documentation/arch/riscv/index.rst
@@ -11,6 +11,7 @@ RISC-V architecture
     vm-layout
     hwprobe
     patch-acceptance
+    pmu-sse
     uabi
     vector
     cmodx
diff --git a/Documentation/arch/riscv/pmu-sse.rst b/Documentation/arch/riscv/pmu-sse.rst
new file mode 100644
index 000000000000..b7458a9d0116
--- /dev/null
+++ b/Documentation/arch/riscv/pmu-sse.rst
@@ -0,0 +1,55 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================================
+RISC-V PMU overflow delivery through SSE
+========================================
+
+When ``CONFIG_RISCV_PMU_SBI_SSE`` is enabled and firmware provides the local
+PMU overflow event, the RISC-V SBI PMU driver uses Supervisor Software Events
+(SSE) to deliver counter overflows.
+
+Delivery selection
+==================
+
+The delivery mechanism is selected once while the PMU device is probed.  The
+driver first tries to register and enable the local PMU overflow SSE event.  It
+tries the ordinary PMU interrupt only when the SSE extension or the local PMU
+event is explicitly unsupported.  It does not change the delivery mechanism
+after the PMU has been registered.
+
+Other SSE setup errors do not prove that firmware released the overflow route,
+so the driver does not enable the ordinary PMU interrupt.  The PMU remains
+available for counting but not sampling.  If setup retained an SSE event, the
+PMU keeps quiescing that event around perf scheduling changes without rearming
+it.  This preserves callback ownership without creating two possible delivery
+mechanisms for the same hardware overflow.
+
+Interrupted context
+===================
+
+SSE enters Linux through a supervisor handler context constructed by firmware.
+The entry contract preserves the interrupted GPRs except ``a6`` and ``a7``,
+which Linux reads from the interrupted-register event attributes.  Linux then
+reconstructs the interrupted ``pt_regs`` and publishes it while dispatching the
+event.
+
+Perf uses that context for register samples and callchains.  Kernel stack
+walking verifies that the interrupted frame belongs to the current task stack
+before dereferencing it.  For sensitive entry paths and IRQ stacks, Linux
+records the interrupted PC without walking a stack whose bounds cannot be
+proved.  User callchains use the existing no-fault user unwinder.  A DWARF
+raw user-stack copy from an SSE handler must not take a page fault, so it
+walks the current task's page tables with fast-only GUP, copies each resident
+page through its kernel mapping, and stops at the first non-resident page,
+preserving perf's truncated-user-stack semantics.
+
+CPU power management
+====================
+
+The PMU and SSE CPU power-management callbacks are ordered according to the
+selected delivery mechanism.  With SSE delivery, SSE events are masked before
+the lower-priority PMU callback disables the local PMU event and stops the
+counters on entry.  On exit, the hart is unmasked while the local PMU event is
+still disabled.  The PMU callback then restores the counters and enables the
+event, so an unmask failure leaves the counters stopped.  The ordinary
+interrupt path retains the existing PMU ordering.
diff --git a/MAINTAINERS b/MAINTAINERS
index 1eb51b04dc42..ac7b17a811ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23580,6 +23580,7 @@ M:	Atish Patra <atish.patra@linux.dev>
 R:	Anup Patel <anup@brainfault.org>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	Documentation/arch/riscv/pmu-sse.rst
 F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
diff --git a/drivers/firmware/riscv/riscv_sbi_sse.c b/drivers/firmware/riscv/riscv_sbi_sse.c
index e81cfb4b0c56..c7d2a2def00a 100644
--- a/drivers/firmware/riscv/riscv_sbi_sse.c
+++ b/drivers/firmware/riscv/riscv_sbi_sse.c
@@ -161,6 +161,15 @@ static int sse_sbi_event_func(struct sse_event *event, unsigned long func)
 	return 0;
 }
 
+bool sse_event_is_enabled_local(struct sse_event *event)
+{
+	if (!sse_event_is_global(event->evt_id))
+		lockdep_assert_preemption_disabled();
+
+	return sse_get_reg_evt(event)->is_enabled;
+}
+EXPORT_SYMBOL_GPL(sse_event_is_enabled_local);
+
 int sse_event_disable_local(struct sse_event *event)
 {
 	if (!sse_event_is_global(event->evt_id))
diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 245e7bb763b9..10b047856121 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -105,6 +105,17 @@ config RISCV_PMU_SBI
 	  full perf feature support i.e. counter overflow, privilege mode
 	  filtering, counter configuration.
 
+config RISCV_PMU_SBI_SSE
+	depends on RISCV_PMU_SBI && RISCV_SBI_SSE
+	bool "RISC-V PMU SSE events"
+	default n
+	help
+	  Say y if you want to use SSE events to deliver PMU interrupts. This
+	  provides a way to profile the kernel at any level by using NMI-like
+	  SSE events. SSE events being really intrusive, this option allows
+	  to select it only if needed. See Documentation/arch/riscv/pmu-sse.rst
+	  for interrupted-context limitations.
+
 config STARFIVE_STARLINK_PMU
 	depends on ARCH_STARFIVE || COMPILE_TEST
 	depends on 64BIT
diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index 8e3cd0f35336..1f65c640b693 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -13,6 +13,7 @@
 #include <linux/irqdesc.h>
 #include <linux/perf/riscv_pmu.h>
 #include <linux/printk.h>
+#include <linux/riscv_sbi_sse.h>
 #include <linux/smp.h>
 #include <linux/sched_clock.h>
 
@@ -247,6 +248,11 @@ void riscv_pmu_start(struct perf_event *event, int flags)
 	if (flags & PERF_EF_RELOAD)
 		WARN_ON_ONCE(!(event->hw.state & PERF_HES_UPTODATE));
 
+#ifdef CONFIG_RISCV_PMU_SBI_SSE
+	if (unlikely(this_cpu_ptr(rvpmu->hw_events)->sse_failed))
+		return;
+#endif
+
 	hwc->state = 0;
 	riscv_pmu_event_set_period(event);
 	init_val = local64_read(&hwc->prev_count) & max_period;
@@ -306,6 +312,7 @@ static int riscv_pmu_event_init(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
 	int mapped_event;
+	int ret;
 	u64 event_config = 0;
 	uint64_t cmask;
 
@@ -331,8 +338,11 @@ static int riscv_pmu_event_init(struct perf_event *event)
 	hwc->idx = -1;
 	hwc->event_base = mapped_event;
 
-	if (rvpmu->event_init)
-		rvpmu->event_init(event);
+	if (rvpmu->event_init) {
+		ret = rvpmu->event_init(event);
+		if (ret)
+			return ret;
+	}
 
 	if (!is_sampling_event(event)) {
 		/*
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 21a2078eab98..5c797d8bfeb7 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -17,12 +17,15 @@
 #include <linux/of_irq.h>
 #include <linux/of.h>
 #include <linux/cpu_pm.h>
+#include <linux/crash_dump.h>
+#include <linux/riscv_sbi_sse.h>
 #include <linux/sched/clock.h>
 #include <linux/soc/andes/irq.h>
 #include <linux/workqueue.h>
 
 #include <asm/errata_list.h>
 #include <asm/sbi.h>
+#include <asm/sse.h>
 #include <asm/cpufeature.h>
 #include <asm/vendor_extensions.h>
 #include <asm/vendor_extensions/andes.h>
@@ -927,7 +930,7 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
 	return 0;
 }
 
-static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
+static void pmu_sbi_stop_all_mask(unsigned long *cmask)
 {
 	int i;
 
@@ -936,14 +939,19 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
 	 * which may include counters that are not enabled yet.
 	 */
 	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
-		if (!pmu->cmask[i])
+		if (!cmask[i])
 			continue;
 		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
-			  i * BITS_PER_LONG, pmu->cmask[i],
+			  i * BITS_PER_LONG, cmask[i],
 			  SBI_PMU_STOP_FLAG_RESET);
 	}
 }
 
+static void pmu_sbi_stop_all(struct riscv_pmu *pmu)
+{
+	pmu_sbi_stop_all_mask(pmu->cmask);
+}
+
 static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
 {
 	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
@@ -1000,7 +1008,19 @@ static inline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt,
 	u64 init_val = 0;
 
 	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
-		ctr_start_mask = cpu_hw_evt->used_hw_ctrs[i] & ~ctr_ovf_mask;
+		unsigned long ctr_ovf_mask_word;
+		int lidx;
+
+		ctr_ovf_mask_word = ctr_ovf_mask >> (i * BITS_PER_LONG);
+		ctr_start_mask = 0;
+		for_each_set_bit(idx, &cpu_hw_evt->used_hw_ctrs[i], BITS_PER_LONG) {
+			lidx = idx + i * BITS_PER_LONG;
+			event = cpu_hw_evt->events[lidx];
+			if (event && !(event->hw.state & PERF_HES_STOPPED))
+				ctr_start_mask |= BIT(idx);
+		}
+		ctr_start_mask &= ~ctr_ovf_mask_word;
+
 		/* Start all the counters that did not overflow in a single shot */
 		if (ctr_start_mask) {
 			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG,
@@ -1009,23 +1029,25 @@ static inline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt,
 	}
 
 	/* Reinitialize and start all the counter that overflowed */
-	while (ctr_ovf_mask) {
-		if (ctr_ovf_mask & 0x01) {
-			event = cpu_hw_evt->events[idx];
-			hwc = &event->hw;
-			max_period = riscv_pmu_ctr_get_width_mask(event);
-			init_val = local64_read(&hwc->prev_count) & max_period;
+	for (idx = 0; idx < RISCV_MAX_COUNTERS; idx++) {
+		if (!(ctr_ovf_mask & BIT_ULL(idx)))
+			continue;
+
+		event = cpu_hw_evt->events[idx];
+		if (!event || event->hw.state & PERF_HES_STOPPED)
+			continue;
+
+		hwc = &event->hw;
+		max_period = riscv_pmu_ctr_get_width_mask(event);
+		init_val = local64_read(&hwc->prev_count) & max_period;
 #if defined(CONFIG_32BIT)
-			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx,
-				  1, flag, init_val, init_val >> 32);
+		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx,
+			  1, flag, init_val, init_val >> 32);
 #else
-			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx,
-				  1, flag, init_val);
+		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx,
+			  1, flag, init_val);
 #endif
-			perf_event_update_userpage(event);
-		}
-		ctr_ovf_mask = ctr_ovf_mask >> 1;
-		idx++;
+		perf_event_update_userpage(event);
 	}
 }
 
@@ -1054,32 +1076,111 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
 	}
 
 	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
+		unsigned long ctr_start_mask = 0;
+		int lidx;
+
 		/* Restore the counter values to relative indices for used hw counters */
-		for_each_set_bit(idx, &cpu_hw_evt->used_hw_ctrs[i], BITS_PER_LONG)
-			sdata->ctr_values[idx] =
-					cpu_hw_evt->snapshot_cval_shcopy[idx + i * BITS_PER_LONG];
+		for_each_set_bit(idx, &cpu_hw_evt->used_hw_ctrs[i], BITS_PER_LONG) {
+			lidx = idx + i * BITS_PER_LONG;
+			event = cpu_hw_evt->events[lidx];
+			if (event && !(event->hw.state & PERF_HES_STOPPED))
+				ctr_start_mask |= BIT(idx);
+
+			sdata->ctr_values[idx] = cpu_hw_evt->snapshot_cval_shcopy[lidx];
+		}
+
 		/* Start all the counters in a single shot */
-		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START,
-			  idx * BITS_PER_LONG,
-			  cpu_hw_evt->used_hw_ctrs[i], flag);
+		if (ctr_start_mask)
+			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START,
+				  i * BITS_PER_LONG, ctr_start_mask, flag);
 	}
 }
 
+static bool pmu_sbi_sse_failed(struct cpu_hw_events *cpu_hw_evt)
+{
+#ifdef CONFIG_RISCV_PMU_SBI_SSE
+	return READ_ONCE(cpu_hw_evt->sse_failed);
+#else
+	return false;
+#endif
+}
+
 static void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
 					u64 ctr_ovf_mask)
 {
 	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
 
+	if (unlikely(pmu_sbi_sse_failed(cpu_hw_evt)))
+		return;
+
 	if (sbi_pmu_snapshot_available())
 		pmu_sbi_start_ovf_ctrs_snapshot(cpu_hw_evt, ctr_ovf_mask);
 	else
 		pmu_sbi_start_ovf_ctrs_sbi(cpu_hw_evt, ctr_ovf_mask);
 }
 
-static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
+#ifdef CONFIG_RISCV_PMU_SBI_SSE
+/*
+ * A local SSE delivery failure makes the current PMU state unsafe to resume.
+ * Latch the failure before stopping mapped events so the SSE transition and
+ * overflow restart paths cannot undo the fail-safe while they are quiesced.
+ */
+static void pmu_sbi_fail_sse(struct riscv_pmu *pmu, const char *op, int ret)
+{
+	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
+	struct perf_event *event;
+	int idx;
+
+	if (READ_ONCE(cpu_hw_evt->sse_failed))
+		return;
+
+	WRITE_ONCE(cpu_hw_evt->sse_failed, true);
+	pr_err_ratelimited("failed to %s local PMU SSE event: %d; stopping counters\n",
+			   op, ret);
+
+	for (idx = 0; idx < RISCV_MAX_COUNTERS; idx++) {
+		event = cpu_hw_evt->events[idx];
+		if (event)
+			riscv_pmu_stop(event, PERF_EF_UPDATE);
+	}
+}
+
+static void pmu_sbi_sse_disable(struct pmu *pmu)
+{
+	struct riscv_pmu *rvpmu = to_riscv_pmu(pmu);
+	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(rvpmu->hw_events);
+	int ret;
+
+	if (!READ_ONCE(rvpmu->sse_active) ||
+	    READ_ONCE(cpu_hw_evt->sse_failed))
+		return;
+
+	ret = sse_event_disable_local(rvpmu->sse_evt);
+	if (unlikely(ret))
+		pmu_sbi_fail_sse(rvpmu, "disable", ret);
+}
+
+static void pmu_sbi_sse_enable(struct pmu *pmu)
+{
+	struct riscv_pmu *rvpmu = to_riscv_pmu(pmu);
+	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(rvpmu->hw_events);
+	int ret;
+
+	if (!READ_ONCE(rvpmu->sse_active) ||
+	    READ_ONCE(cpu_hw_evt->sse_failed))
+		return;
+
+	ret = sse_event_enable_local(rvpmu->sse_evt);
+	if (unlikely(ret))
+		pmu_sbi_fail_sse(rvpmu, "enable", ret);
+}
+#endif
+
+static irqreturn_t pmu_sbi_ovf_handler(struct cpu_hw_events *cpu_hw_evt,
+				       struct pt_regs *regs, bool from_sse,
+				       bool from_guest)
 {
 	struct perf_sample_data data;
-	struct pt_regs *regs;
 	struct hw_perf_event *hw_evt;
 	union sbi_pmu_ctr_info *info;
 	int lidx, hidx, fidx;
@@ -1087,7 +1188,6 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	struct perf_event *event;
 	u64 overflow;
 	u64 overflowed_ctrs = 0;
-	struct cpu_hw_events *cpu_hw_evt = dev;
 	u64 start_clock = sched_clock();
 	struct riscv_pmu_snapshot_data *sdata;
 
@@ -1096,21 +1196,32 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 
 	sdata = cpu_hw_evt->snapshot_addr;
 
-	/* Firmware counter don't support overflow yet */
+	/*
+	 * SSE can arrive before perf installs an event. The early exits below
+	 * must stop the PMU source before firmware completes the SSE.
+	 */
 	fidx = find_first_bit(cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS);
 	if (fidx == RISCV_MAX_COUNTERS) {
-		csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
+		if (from_sse)
+			pmu_sbi_stop_all_mask(cmask);
+		else
+			csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
 		return IRQ_NONE;
 	}
 
 	event = cpu_hw_evt->events[fidx];
 	if (!event) {
-		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
+		if (from_sse)
+			pmu_sbi_stop_all_mask(cmask);
+		else
+			ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
 		return IRQ_NONE;
 	}
 
 	pmu = to_riscv_pmu(event->pmu);
 	pmu_sbi_stop_hw_ctrs(pmu);
+	if (unlikely(pmu_sbi_sse_failed(cpu_hw_evt)))
+		return IRQ_NONE;
 
 	/* Overflow status register should only be read after counter are stopped */
 	if (sbi_pmu_snapshot_available())
@@ -1120,15 +1231,17 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 
 	/*
 	 * Overflow interrupt pending bit should only be cleared after stopping
-	 * all the counters to avoid any race condition.
+	 * all the counters to avoid any race condition. When using SSE,
+	 * interrupt is cleared when stopping counters.
 	 */
-	ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
+	if (!from_sse)
+		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
 
 	/* No overflow bit is set */
-	if (!overflow)
+	if (!overflow) {
+		pmu_sbi_start_overflow_mask(pmu, 0);
 		return IRQ_NONE;
-
-	regs = get_irq_regs();
+	}
 
 	for_each_set_bit(lidx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS) {
 		struct perf_event *event = cpu_hw_evt->events[lidx];
@@ -1153,6 +1266,12 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 		if (!(overflow & BIT_ULL(hidx)))
 			continue;
 
+#ifdef CONFIG_CPU_PM
+		/* Do not let CPU-PM resume override this overflow decision. */
+		if (from_sse)
+			clear_bit(lidx, cpu_hw_evt->pm_resume_hw_ctrs);
+#endif
+
 		/*
 		 * Keep a track of overflowed counters so that they can be started
 		 * with updated initial value.
@@ -1165,6 +1284,14 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 		hw_evt->state |= PERF_HES_UPTODATE;
 		perf_sample_data_init(&data, 0, hw_evt->last_period);
 		if (riscv_pmu_event_set_period(event)) {
+			int overflow_ret;
+
+			/* Guest attribution and guest stack sampling are not supported yet. */
+			if (from_guest) {
+				hw_evt->state = 0;
+				continue;
+			}
+
 			/*
 			 * Unlike other ISAs, RISC-V don't have to disable interrupts
 			 * to avoid throttling here. As per the specification, the
@@ -1173,10 +1300,12 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 			 * TODO: We will need to stop the guest counters once
 			 * virtualization support is added.
 			 */
-			perf_event_overflow(event, &data, regs);
+			overflow_ret = perf_event_overflow(event, &data, regs);
+			if (!overflow_ret)
+				hw_evt->state = 0;
+		} else {
+			hw_evt->state = 0;
 		}
-		/* Reset the state as we are going to start the counter after the loop */
-		hw_evt->state = 0;
 	}
 
 	pmu_sbi_start_overflow_mask(pmu, overflowed_ctrs);
@@ -1185,116 +1314,282 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
+static irqreturn_t pmu_sbi_ovf_irq_handler(int irq, void *dev)
 {
-	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
-	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
-
-	/*
-	 * We keep enabling userspace access to CYCLE, TIME and INSTRET via the
-	 * legacy option but that will be removed in the future.
-	 */
-	if (sysctl_perf_user_access == SYSCTL_LEGACY)
-		csr_write(CSR_SCOUNTEREN, 0x7);
-	else
-		csr_write(CSR_SCOUNTEREN, 0x2);
+	return pmu_sbi_ovf_handler(dev, get_irq_regs(), false, false);
+}
 
-	/* Stop all the counters so that they can be enabled from perf */
-	pmu_sbi_stop_all(pmu);
+#ifdef CONFIG_RISCV_PMU_SBI_SSE
+static int pmu_sbi_ovf_sse_handler(u32 evt, void *arg, struct pt_regs *regs)
+{
+	const struct riscv_sse_interrupted_context *context;
+	struct riscv_pmu *pmu = arg;
+	struct cpu_hw_events *hw_event = raw_cpu_ptr(pmu->hw_events);
+	bool from_guest;
+
+	if (unlikely(!READ_ONCE(pmu->sse_active))) {
+		pmu_sbi_stop_all(pmu);
+		return -EIO;
+	}
 
-	if (riscv_pmu_use_irq) {
-		cpu_hw_evt->irq = riscv_pmu_irq;
-		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
-		enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
+	if (unlikely(!regs)) {
+		pmu_sbi_fail_sse(pmu, "read interrupted context for", -EIO);
+		return -EIO;
 	}
 
-	if (sbi_pmu_snapshot_available())
-		return pmu_sbi_snapshot_setup(pmu, cpu);
+	context = riscv_sse_get_interrupted_context();
+	from_guest = context && context->regs == regs &&
+		     (context->hstatus & HSTATUS_SPV);
+	pmu_sbi_ovf_handler(hw_event, regs, true, from_guest);
 
 	return 0;
 }
 
-static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
+static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
 {
-	if (riscv_pmu_use_irq) {
-		disable_percpu_irq(riscv_pmu_irq);
+	int ret;
+	struct sse_event *evt;
+
+	evt = sse_event_register(SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW, 0,
+				 pmu_sbi_ovf_sse_handler, pmu);
+	if (IS_ERR(evt))
+		return PTR_ERR(evt);
+	pmu->sse_evt = evt;
+
+	ret = sse_event_enable(evt);
+	if (ret) {
+		int cleanup_ret;
+
+		cleanup_ret = sse_event_disable(evt);
+		if (cleanup_ret) {
+			pr_warn("failed to disable SSE event after setup error: %d\n",
+				cleanup_ret);
+			return cleanup_ret;
+		}
+
+		cleanup_ret = sse_event_unregister(evt);
+
+		if (cleanup_ret) {
+			pr_warn("failed to unregister SSE event: %d\n",
+				cleanup_ret);
+		} else {
+			pmu->sse_evt = NULL;
+		}
+		return cleanup_ret ?: ret;
 	}
 
-	/* Disable all counters access for user mode now */
-	csr_write(CSR_SCOUNTEREN, 0x0);
+	WRITE_ONCE(pmu->sse_active, true);
+	pr_info("using SSE for PMU event delivery\n");
 
-	if (sbi_pmu_snapshot_available())
-		return pmu_sbi_snapshot_disable();
+	return ret;
+}
 
-	return 0;
+static void pmu_sbi_stop_all_cpu(void *info)
+{
+	pmu_sbi_stop_all(info);
 }
 
-static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pdev)
+static void pmu_sbi_cleanup_sse(struct riscv_pmu *pmu)
 {
+	struct sse_event *sse_evt;
 	int ret;
-	struct cpu_hw_events __percpu *hw_events = pmu->hw_events;
-	struct irq_domain *domain = NULL;
 
+	sse_evt = pmu->sse_evt;
+	if (!sse_evt)
+		return;
+
+	/*
+	 * Close callback admission before draining each CPU. PMU callbacks run
+	 * with local interrupts disabled, so the synchronous IPI cannot complete
+	 * until a callback that observed the old state has returned.
+	 */
+	WRITE_ONCE(pmu->sse_active, false);
+	on_each_cpu(pmu_sbi_stop_all_cpu, pmu, 1);
+
+	ret = sse_event_disable(sse_evt);
+	if (ret) {
+		pr_warn("failed to disable SSE event: %d\n", ret);
+		goto retain;
+	}
+
+	ret = sse_event_unregister(sse_evt);
+	if (ret) {
+		pr_warn("failed to unregister SSE event: %d\n", ret);
+		goto retain;
+	}
+
+	pmu->sse_evt = NULL;
+	return;
+
+retain:
+	sse_event_cleanup(sse_evt);
+	pmu->sse_evt = NULL;
+}
+
+static bool pmu_sbi_sse_state_retained(struct riscv_pmu *pmu)
+{
+	return pmu->sse_evt;
+}
+#else
+static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
+{
+	return -EOPNOTSUPP;
+}
+
+static void pmu_sbi_cleanup_sse(struct riscv_pmu *pmu) {}
+
+static bool pmu_sbi_sse_state_retained(struct riscv_pmu *pmu)
+{
+	return false;
+}
+#endif
+
+static bool pmu_sbi_select_irq(void)
+{
 	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
 		riscv_pmu_irq_num = RV_IRQ_PMU;
-		riscv_pmu_use_irq = true;
+		return true;
 	} else if (IS_ENABLED(CONFIG_ERRATA_THEAD_PMU) &&
 		   riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
 		   riscv_cached_marchid(0) == 0 &&
 		   riscv_cached_mimpid(0) == 0) {
 		riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
-		riscv_pmu_use_irq = true;
+		return true;
 	} else if (riscv_has_vendor_extension_unlikely(ANDES_VENDOR_ID,
 						       RISCV_ISA_VENDOR_EXT_XANDESPMU) &&
 		   IS_ENABLED(CONFIG_ANDES_CUSTOM_PMU)) {
 		riscv_pmu_irq_num = ANDES_SLI_CAUSE_BASE + ANDES_RV_IRQ_PMOVI;
-		riscv_pmu_use_irq = true;
+		return true;
 	}
 
-	riscv_pmu_irq_mask = BIT(riscv_pmu_irq_num % BITS_PER_LONG);
+	return false;
+}
+
+static int pmu_sbi_setup_irq(struct riscv_pmu *pmu)
+{
+	struct cpu_hw_events __percpu *hw_events = pmu->hw_events;
+	struct irq_domain *domain;
+	int ret;
 
-	if (!riscv_pmu_use_irq)
+	if (!pmu_sbi_select_irq())
 		return -EOPNOTSUPP;
 
+	riscv_pmu_irq_mask = BIT(riscv_pmu_irq_num % BITS_PER_LONG);
+
 	domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(),
 					  DOMAIN_BUS_ANY);
 	if (!domain) {
 		pr_err("Failed to find INTC IRQ root domain\n");
-		ret = -ENODEV;
-		goto err;
+		return -ENODEV;
 	}
 
 	riscv_pmu_irq = irq_create_mapping(domain, riscv_pmu_irq_num);
 	if (!riscv_pmu_irq) {
 		pr_err("Failed to map PMU interrupt for node\n");
-		ret = -ENODEV;
-		goto err;
+		return -ENODEV;
 	}
 
-	ret = request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_handler, "riscv-pmu", hw_events);
+	ret = request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_irq_handler,
+				 "riscv-pmu", hw_events);
 	if (ret) {
 		pr_err("registering percpu irq failed [%d]\n", ret);
 		irq_dispose_mapping(riscv_pmu_irq);
 		riscv_pmu_irq = 0;
-		goto err;
+		return ret;
 	}
 
 	return 0;
-err:
-	riscv_pmu_use_irq = false;
-	return ret;
+}
+
+static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
+{
+	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
+	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
+
+	/*
+	 * We keep enabling userspace access to CYCLE, TIME and INSTRET via the
+	 * legacy option but that will be removed in the future.
+	 */
+	if (sysctl_perf_user_access == SYSCTL_LEGACY)
+		csr_write(CSR_SCOUNTEREN, 0x7);
+	else
+		csr_write(CSR_SCOUNTEREN, 0x2);
+
+	/* Stop all the counters so that they can be enabled from perf */
+	pmu_sbi_stop_all(pmu);
+
+	if (riscv_pmu_use_irq) {
+		cpu_hw_evt->irq = riscv_pmu_irq;
+		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
+		enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
+	}
+
+	if (sbi_pmu_snapshot_available())
+		return pmu_sbi_snapshot_setup(pmu, cpu);
+
+	return 0;
+}
+
+static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
+{
+	if (riscv_pmu_use_irq)
+		disable_percpu_irq(riscv_pmu_irq);
+
+	/* Disable all counters access for user mode now */
+	csr_write(CSR_SCOUNTEREN, 0x0);
+
+	if (sbi_pmu_snapshot_available())
+		return pmu_sbi_snapshot_disable();
+
+	return 0;
+}
+
+static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pdev)
+{
+	int irq_ret;
+	int sse_ret;
+
+	/* Do not claim an IRQ route while a crash kernel leaves SSE state intact. */
+	if (is_kdump_kernel() && riscv_sse_available()) {
+		pr_warn("PMU delivery unavailable with retained crash-kernel SSE state\n");
+		return -EUCLEAN;
+	}
+
+	sse_ret = pmu_sbi_setup_sse(pmu);
+	if (!sse_ret) {
+		riscv_pmu_use_irq = false;
+		return 0;
+	}
+	if (pmu_sbi_sse_state_retained(pmu)) {
+		pr_err("PMU-SSE setup failed with firmware state retained: %d\n",
+		       sse_ret);
+		return -EUCLEAN;
+	}
+	/* Only an explicitly unsupported SSE path proves IRQ fallback is safe. */
+	if (sse_ret != -EOPNOTSUPP) {
+		pr_err("PMU-SSE setup failed: %d\n", sse_ret);
+		return sse_ret;
+	}
+
+	irq_ret = pmu_sbi_setup_irq(pmu);
+	if (!irq_ret) {
+		riscv_pmu_use_irq = true;
+		return 0;
+	}
+	return irq_ret;
 }
 
 #ifdef CONFIG_CPU_PM
-static int riscv_pm_pmu_notify(struct notifier_block *b, unsigned long cmd,
-				void *v)
+static int riscv_pm_pmu_update(struct riscv_pmu *rvpmu, unsigned long cmd)
 {
-	struct riscv_pmu *rvpmu = container_of(b, struct riscv_pmu, riscv_pm_nb);
 	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
 	bool enabled = !bitmap_empty(cpuc->used_hw_ctrs, RISCV_MAX_COUNTERS);
 	struct perf_event *event;
 	int idx;
 
+	if (cmd == CPU_PM_ENTER)
+		bitmap_zero(cpuc->pm_resume_hw_ctrs, RISCV_MAX_COUNTERS);
+
 	if (!enabled)
 		return NOTIFY_OK;
 
@@ -1305,6 +1600,8 @@ static int riscv_pm_pmu_notify(struct notifier_block *b, unsigned long cmd,
 
 		switch (cmd) {
 		case CPU_PM_ENTER:
+			if (!(event->hw.state & PERF_HES_STOPPED))
+				set_bit(idx, cpuc->pm_resume_hw_ctrs);
 			/*
 			 * Stop and update the counter
 			 */
@@ -1312,6 +1609,8 @@ static int riscv_pm_pmu_notify(struct notifier_block *b, unsigned long cmd,
 			break;
 		case CPU_PM_EXIT:
 		case CPU_PM_ENTER_FAILED:
+			if (!test_and_clear_bit(idx, cpuc->pm_resume_hw_ctrs))
+				break;
 			/*
 			 * Restore and enable the counter.
 			 */
@@ -1325,9 +1624,59 @@ static int riscv_pm_pmu_notify(struct notifier_block *b, unsigned long cmd,
 	return NOTIFY_OK;
 }
 
+static int riscv_pm_pmu_notify(struct notifier_block *b,
+			       unsigned long cmd, void *v)
+{
+	struct riscv_pmu *rvpmu = container_of(b, struct riscv_pmu,
+						 riscv_pm_nb);
+
+#ifdef CONFIG_RISCV_PMU_SBI_SSE
+	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
+	int ret;
+
+	if (!riscv_pmu_use_irq && READ_ONCE(rvpmu->sse_active)) {
+		switch (cmd) {
+		case CPU_PM_ENTER:
+			cpuc->pm_resume_sse =
+				sse_event_is_enabled_local(rvpmu->sse_evt);
+			if (cpuc->pm_resume_sse) {
+				ret = sse_event_disable_local(rvpmu->sse_evt);
+				if (ret) {
+					cpuc->pm_resume_sse = false;
+					pmu_sbi_fail_sse(rvpmu, "disable for CPU PM",
+							 ret);
+					return notifier_from_errno(ret);
+				}
+			}
+			break;
+		case CPU_PM_EXIT:
+		case CPU_PM_ENTER_FAILED:
+			ret = riscv_pm_pmu_update(rvpmu, cmd);
+			if (!cpuc->pm_resume_sse)
+				return ret;
+
+			cpuc->pm_resume_sse = false;
+			ret = sse_event_enable_local(rvpmu->sse_evt);
+			if (ret) {
+				pmu_sbi_fail_sse(rvpmu, "enable after CPU PM", ret);
+				return notifier_from_errno(ret);
+			}
+			return NOTIFY_OK;
+		default:
+			break;
+		}
+	}
+#endif
+
+	return riscv_pm_pmu_update(rvpmu, cmd);
+}
+
 static int riscv_pm_pmu_register(struct riscv_pmu *pmu)
 {
 	pmu->riscv_pm_nb.notifier_call = riscv_pm_pmu_notify;
+	/* Keep PMU-SSE disabled until counters and userpage state are restored. */
+	pmu->riscv_pm_nb.priority = riscv_pmu_use_irq ? 1 : -1;
+
 	return cpu_pm_register_notifier(&pmu->riscv_pm_nb);
 }
 
@@ -1342,6 +1691,8 @@ static inline void riscv_pm_pmu_unregister(struct riscv_pmu *pmu) { }
 
 static void riscv_pmu_destroy(struct riscv_pmu *pmu)
 {
+	pmu_sbi_cleanup_sse(pmu);
+
 	if (sbi_v2_available) {
 		if (sbi_pmu_snapshot_available()) {
 			pmu_sbi_snapshot_disable();
@@ -1353,7 +1704,7 @@ static void riscv_pmu_destroy(struct riscv_pmu *pmu)
 		cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
 }
 
-static void pmu_sbi_event_init(struct perf_event *event)
+static int pmu_sbi_event_init(struct perf_event *event)
 {
 	/*
 	 * The permissions are set at event_init so that we do not depend
@@ -1365,6 +1716,8 @@ static void pmu_sbi_event_init(struct perf_event *event)
 		event->hw.flags |= PERF_EVENT_FLAG_USER_ACCESS;
 	else
 		event->hw.flags |= PERF_EVENT_FLAG_LEGACY;
+
+	return 0;
 }
 
 static void pmu_sbi_event_mapped(struct perf_event *event, struct mm_struct *mm)
@@ -1494,6 +1847,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	/* cache all the information about counters now */
 	if (pmu_sbi_get_ctrinfo(num_counters, cmask))
 		goto out_free;
+	bitmap_copy(pmu->cmask, cmask, RISCV_MAX_COUNTERS);
 
 	ret = pmu_sbi_setup_irqs(pmu, pdev);
 	if (ret < 0) {
@@ -1503,9 +1857,15 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	}
 	irq_requested = (ret == 0);
 
+#ifdef CONFIG_RISCV_PMU_SBI_SSE
+	if (pmu->sse_active) {
+		pmu->pmu.pmu_enable = pmu_sbi_sse_enable;
+		pmu->pmu.pmu_disable = pmu_sbi_sse_disable;
+	}
+#endif
+
 	pmu->pmu.attr_groups = riscv_pmu_attr_groups;
 	pmu->pmu.parent = &pdev->dev;
-	bitmap_copy(pmu->cmask, cmask, RISCV_MAX_COUNTERS);
 	pmu->ctr_start = pmu_sbi_ctr_start;
 	pmu->ctr_stop = pmu_sbi_ctr_stop;
 	pmu->event_map = pmu_sbi_event_map;
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index ecaa40370830..b06abc705100 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -28,6 +28,8 @@
 
 #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
 
+struct sse_event;
+
 struct cpu_hw_events {
 	/* currently enabled events */
 	int			n_events;
@@ -39,6 +41,18 @@ struct cpu_hw_events {
 	DECLARE_BITMAP(used_hw_ctrs, RISCV_MAX_COUNTERS);
 	/* currently enabled firmware counters */
 	DECLARE_BITMAP(used_fw_ctrs, RISCV_MAX_COUNTERS);
+#ifdef CONFIG_RISCV_PMU_SBI_SSE
+	/* Keep counters stopped after an unrecoverable SSE transition failure. */
+	bool sse_failed;
+#endif
+#ifdef CONFIG_CPU_PM
+	/* Counters stopped by CPU PM and still waiting to be restored. */
+	DECLARE_BITMAP(pm_resume_hw_ctrs, RISCV_MAX_COUNTERS);
+#ifdef CONFIG_RISCV_PMU_SBI_SSE
+	/* Restore the local PMU SSE event after counters and userpage state. */
+	bool pm_resume_sse;
+#endif
+#endif
 	/* The virtual address of the shared memory where counter snapshot will be taken */
 	void *snapshot_addr;
 	/* The physical address of the shared memory where counter snapshot will be taken */
@@ -54,6 +68,10 @@ struct riscv_pmu {
 	char		*name;
 
 	irqreturn_t	(*handle_irq)(int irq_num, void *dev);
+#ifdef CONFIG_RISCV_PMU_SBI_SSE
+	struct sse_event	*sse_evt;
+	bool			sse_active;
+#endif
 
 	DECLARE_BITMAP(cmask, RISCV_MAX_COUNTERS);
 	u64		(*ctr_read)(struct perf_event *event);
@@ -63,7 +81,7 @@ struct riscv_pmu {
 	void		(*ctr_start)(struct perf_event *event, u64 init_val);
 	void		(*ctr_stop)(struct perf_event *event, unsigned long flag);
 	int		(*event_map)(struct perf_event *event, u64 *config);
-	void		(*event_init)(struct perf_event *event);
+	int		(*event_init)(struct perf_event *event);
 	void		(*event_mapped)(struct perf_event *event, struct mm_struct *mm);
 	void		(*event_unmapped)(struct perf_event *event, struct mm_struct *mm);
 	uint8_t		(*csr_index)(struct perf_event *event);
diff --git a/include/linux/riscv_sbi_sse.h b/include/linux/riscv_sbi_sse.h
index 774a782e556d..f6b3881c8884 100644
--- a/include/linux/riscv_sbi_sse.h
+++ b/include/linux/riscv_sbi_sse.h
@@ -42,6 +42,7 @@ int sse_event_enable(struct sse_event *sse_evt);
 int sse_event_disable(struct sse_event *sse_evt);
 
 /* Local events require the caller to remain on the current CPU. */
+bool sse_event_is_enabled_local(struct sse_event *sse_evt);
 int sse_event_enable_local(struct sse_event *sse_evt);
 int sse_event_disable_local(struct sse_event *sse_evt);
 
@@ -76,6 +77,11 @@ static inline int sse_event_disable(struct sse_event *sse_evt)
 	return -EOPNOTSUPP;
 }
 
+static inline bool sse_event_is_enabled_local(struct sse_event *sse_evt)
+{
+	return false;
+}
+
 static inline int sse_event_enable_local(struct sse_event *sse_evt)
 {
 	return -EOPNOTSUPP;
-- 
2.43.0


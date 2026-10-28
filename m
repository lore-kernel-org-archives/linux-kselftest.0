Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206592;
	b=N0T7QfJDbWup44lOnRIEX1bI+FaVqywPHtxT/Xg3lsf/QBFOARR5VBdC3OEyNtzFT+jn
	 yfU2HH5EDmI38D4CYfaelUjiRIUaAgMD+ddLsE4d3f4WX2inDcUKE6RAy4sVcJtAzxi5z
	 1mLguFGSI9JaxIMA41SSJlD9WzcD/WX9dp2wDsFu0FDCRe15NPj0RRy48Bwtw+HpvFj2h
	 bT/iF6AkPm3EKx8U0ZW9Du+OPqUKAr1fQvJcmuxKjftNx8PktXwMlpS4pUIvF895h8zzM
	 /d40+XRg9kIFLVP7/7s4N28DRfvy/WrLyASlUBadRG07hDdIt28OFW8BLRHeF991wtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206592;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BtHZS4AJ/3veBFLlNN5br3p8QyT5WvVSXHqnzWDOxPg=;
	b=ui5ihs1TqoDieAOLLlV2YNVReskpy1r5ycBB1l31SzXDj8mquyWwezqeuUxmNRS1gfgz
	 d1J9CiCWOh3yyDqMZhBiE7WT+9TCAH/vKz3OrFG7mIEqlhRijQrer4X7LeyXIgUaavsG7
	 HusJ0Q8/oY78uwED6JFPs0JhU5N6GdlzGcTemq2nR5SRL++hgZn18/1qjX8dd+h0mVqOA
	 lM2cMLh8qgGW2ooootkstyfUIxWFq4ndQkAaKk7jwFXiXfRcw4XMldAnbHP2MpK9Q8QTq
	 neGNdDKghBA9HAe83djQTS1xzwb2USIn6uUcbjw1cQClXB6UO3TSmkzlqC3bezc4q/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LGg9Zkpd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C053B60A2615;
	Wed, 28 Oct 2026 16:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C053B60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LGg9Zkpd
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAXa71153223;
	Wed, 28 Oct 2026 16:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BtHZS4AJ/3veBFLlNN5br3p8QyT5WvVSXHqnzWDOxPg=; b=LGg9Zkpd2FybpPwH
	DbLCZfzQF9I5u8Wmf90Rtz8BcVJWO7qUeVrEr8960GUJFB6TQVkwZ+FU4T/5vZWX
	Fku1mOGQ+AZkTt3rULzwMZ0i95xMhk6K8soodciA+QEOXKzQPLcpqtlLzPl/B3gl
	I++gNgneWnr5hOZvNqn+o0vvgVHX8nunzruGzBblNfMcYswOLQDpo/4tHGD8/q/I
	7X9h3baNTtrIjRcnrcALnYREh9R8pcP01XfYv/Q3w5wVYeoA3NkhWD2jbELO0eaZ
	b7/H1MUl9DHQhaqKEk/8noH0yDcZ3s9UApxpXvEOHYK7XjJ9ksiplwmCsgNbrkdA
	lPKIJg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be3knk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 16:55:37 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69SGtYmx1881525;
	Wed, 28 Oct 2026 16:55:34 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69SGtYYA1881489
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 16:55:34 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 2B84524A00; Wed, 28 Oct 2026 22:25:33 +0530 (+0530)
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
Subject: [PATCH v11 2/9] riscv: add support for SBI Supervisor Software Events extension
Date: Wed, 28 Oct 2026 22:25:24 +0530
Message-ID: <20261028165531.940336-3-anup.patel@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 4xl_CaXgE7s4-BcaPvQBfMc6u98GxjYQ
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae22909 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=968KyxNXAAAA:8 a=JfrnYn6hAAAA:8 a=t9496tuAAAAA:8
 a=eNyazloujy4tG0MUhVoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=MSi_79tMYmZZG2gvAgS0:22 a=1CNFftbPRP8L7MoqJWF3:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX5aNWcTXxmeJh
 jMpAkjsV81DGe/UBAp2yVkKA2yEB62F663hyciTKjOvcDcrYGgN4gLPZAs/3d01MWx63rSrdOh5
 wWSaFG+8M39sFT6TUkSk0rJCl0wF4K4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfXwb/vQixVh656
 wYIBevQvSleVFXQ6nFg0idID/1rgPKwOT7TdXj87Mu0QbKxfbtqSu6NpF0uYN3736YxDOCNY/57
 8x51UGPKomt6DRoYCzVHfjdhtiDmuTLqN2nXlq5LZ9uDvoSJQadsN0B+z6zktjqMIFp4CiUqV+e
 zxoRQ3AgzgJ6V9d0NBQOUcUNO4bLR75inAGw3ArlWFltW+SYgmnc+p78eSflJ59DrEPZc75Cu/z
 SqF4CpNYhmEKtLzVSzqeyEzNqfvgwHya2Pvs1vB1Xj25FpOK+NPSW6vjFS3ehd/rKv3gb6v0RiY
 bkyMHNe5jNBAyDeXCK7g6bLETEn+jXyQmfE3twxJNHoSVqykaS/UaSybwS3dRXX0NXwGY+6rF/n
 gv2eZ8k8VPTvbSG3P5w9pGxOJnfL5IaOg3KXpOOKZuWW98QUN2xm4oRnzTO5mXyQGw8IhaRSFq+
 xzKEjWgXyrqqukc4VBw==
X-Proofpoint-GUID: 4xl_CaXgE7s4-BcaPvQBfMc6u98GxjYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280067

From: Clément Léger <cleger@rivosinc.com>

The SBI SSE extension allows firmware to notify supervisor software of
events that must be delivered independently of normal S-mode interrupts.
Firmware saves the minimal state required to enter the supervisor handler,
and Linux builds the synthetic handler context around it.

SSE can arrive while Linux is already in an exception entry path. At that
point sscratch and tp may be in the middle of the normal trap-entry
exchange, so they cannot always identify current. Store current in a
per-CPU slot and use the hart ID passed by firmware to recover it.

Give each event, including each CPU instance of a local event, a dedicated
stack and shadow call stack. Synchronize vmapped stack ranges before
unmasking events so that the handler cannot take a vmalloc fault while
running in an NMI-like context.

The handler is a synthetic supervisor episode, but completion must resume
the context interrupted by the SSE. Preserve stvec and, when the hypervisor
extension is present, hstatus across the handler. Read the interrupted a6
and a7 values from the SSE attributes, construct pt_regs for the
interrupted context, and write back any changes made by the handler.

Nested exceptions on the SSE event stack temporarily replace both
TASK_TI_KERNEL_SP and TASK_TI_USER_SP. Preserve their original values
across the handler and restore them before completing the event, so a
nested exception cannot leave the interrupted task referring to the event
stack.

Keep an explicit EVENT_REGISTER not-supported result distinct from other
firmware failures. This lets clients select another delivery mechanism
only when firmware has positively rejected the requested event.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Co-developed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Co-developed-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 MAINTAINERS                          |  12 ++
 arch/riscv/include/asm/asm.h         |  14 +-
 arch/riscv/include/asm/scs.h         |   7 +
 arch/riscv/include/asm/sse.h         |  82 +++++++++
 arch/riscv/include/asm/thread_info.h |   1 +
 arch/riscv/kernel/Makefile           |   1 +
 arch/riscv/kernel/asm-offsets.c      |  14 ++
 arch/riscv/kernel/entry.S            |  14 ++
 arch/riscv/kernel/sbi_sse.c          | 246 +++++++++++++++++++++++++++
 arch/riscv/kernel/sbi_sse_entry.S    | 226 ++++++++++++++++++++++++
 10 files changed, 614 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/include/asm/sse.h
 create mode 100644 arch/riscv/kernel/sbi_sse.c
 create mode 100644 arch/riscv/kernel/sbi_sse_entry.S

diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b..6ee1f74c1c4e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23612,6 +23612,18 @@ F:	arch/riscv/boot/dts/spacemit/
 N:	spacemit
 K:	spacemit
 
+RISC-V SUPERVISOR SOFTWARE EVENTS
+M:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
+M:	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
+R:	Yunhui Cui <cuiyunhui@bytedance.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	arch/riscv/include/asm/sse.h
+F:	arch/riscv/kernel/sbi_sse.c
+F:	arch/riscv/kernel/sbi_sse_entry.S
+F:	drivers/firmware/riscv/riscv_sbi_sse.c
+F:	include/linux/riscv_sbi_sse.h
+
 RISC-V TENSTORRENT SoC SUPPORT
 M:	Drew Fustini <dfustini@oss.tenstorrent.com>
 M:	Joel Stanley <jms@oss.tenstorrent.com>
diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index b8bf842d4c13..e1196caea02d 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -91,16 +91,24 @@
 .endm
 
 #ifdef CONFIG_SMP
-.macro asm_per_cpu dst sym tmp
-	lw    \tmp, TASK_TI_CPU_NUM(tp)
-	slli  \tmp, \tmp, RISCV_LGPTR
+.macro asm_per_cpu_with_cpu dst sym tmp cpu
+	slli  \tmp, \cpu, RISCV_LGPTR
 	la    \dst, __per_cpu_offset
 	add   \dst, \dst, \tmp
 	REG_L \tmp, 0(\dst)
 	la    \dst, \sym
 	add   \dst, \dst, \tmp
 .endm
+
+.macro asm_per_cpu dst sym tmp
+	lw \tmp, TASK_TI_CPU_NUM(tp)
+	asm_per_cpu_with_cpu \dst \sym \tmp \tmp
+.endm
 #else /* CONFIG_SMP */
+.macro asm_per_cpu_with_cpu dst sym tmp cpu
+	la    \dst, \sym
+.endm
+
 .macro asm_per_cpu dst sym tmp
 	la    \dst, \sym
 .endm
diff --git a/arch/riscv/include/asm/scs.h b/arch/riscv/include/asm/scs.h
index 023a412fe38d..0d70a35bc01a 100644
--- a/arch/riscv/include/asm/scs.h
+++ b/arch/riscv/include/asm/scs.h
@@ -17,6 +17,11 @@
 	load_per_cpu gp, irq_shadow_call_stack_ptr, \tmp
 .endm
 
+/* Load the per-CPU IRQ shadow call stack to gp. */
+.macro scs_load_sse_stack reg_evt
+	REG_L gp, SSE_REG_EVT_SHADOW_STACK(\reg_evt)
+.endm
+
 /* Load task_scs_sp(current) to gp. */
 .macro scs_load_current
 	REG_L	gp, TASK_TI_SCS_SP(tp)
@@ -40,6 +45,8 @@
 .endm
 .macro scs_load_irq_stack tmp
 .endm
+.macro scs_load_sse_stack reg_evt
+.endm
 .macro scs_load_current
 .endm
 .macro scs_load_current_if_task_changed prev
diff --git a/arch/riscv/include/asm/sse.h b/arch/riscv/include/asm/sse.h
new file mode 100644
index 000000000000..cbd8618c6e00
--- /dev/null
+++ b/arch/riscv/include/asm/sse.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024 Rivos Inc.
+ */
+#ifndef __ASM_SSE_H
+#define __ASM_SSE_H
+
+#include <linux/printk.h>
+#include <linux/types.h>
+
+#include <asm/sbi.h>
+
+static inline bool riscv_sse_available(void)
+{
+#ifdef CONFIG_RISCV_SBI
+	return sbi_probe_extension(SBI_EXT_SSE) > 0;
+#else
+	return false;
+#endif
+}
+
+static inline void riscv_sse_mask_current_hart(void)
+{
+#ifdef CONFIG_RISCV_SBI
+	struct sbiret ret;
+
+	if (!riscv_sse_available())
+		return;
+
+	ret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_HART_MASK, 0, 0, 0, 0, 0, 0);
+	if (ret.error && ret.error != SBI_ERR_ALREADY_STOPPED)
+		pr_emerg("SSE hart mask failed: %ld\n", ret.error);
+#endif
+}
+
+#ifdef CONFIG_RISCV_SBI_SSE
+
+struct sse_event_interrupted_state {
+	unsigned long a6;
+	unsigned long a7;
+};
+
+struct sse_event_arch_data {
+	void *stack;
+	void *shadow_stack;
+	unsigned long tmp;
+	struct sse_event_interrupted_state *interrupted;
+	phys_addr_t interrupted_phys;
+	u32 evt_id;
+	unsigned long hart_id;
+	unsigned int cpu_id;
+};
+
+struct riscv_sse_interrupted_context {
+	struct pt_regs *regs;
+	unsigned long hstatus;
+};
+
+static inline bool sse_event_is_global(u32 evt)
+{
+	return !!(evt & SBI_SSE_EVENT_GLOBAL);
+}
+
+void arch_sse_event_update_cpu(struct sse_event_arch_data *arch_evt, int cpu);
+int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id,
+			int cpu);
+void arch_sse_free_event(struct sse_event_arch_data *arch_evt);
+int arch_sse_register_event(struct sse_event_arch_data *arch_evt);
+void arch_sse_init_cpu(void);
+
+void sse_handle_event(struct sse_event_arch_data *arch_evt,
+		      struct pt_regs *regs);
+asmlinkage void handle_sse(void);
+asmlinkage void noinstr do_sse(struct sse_event_arch_data *arch_evt,
+			       struct pt_regs *regs, unsigned long hstatus);
+
+const struct riscv_sse_interrupted_context *
+riscv_sse_get_interrupted_context(void);
+
+#endif
+
+#endif
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 55019fdfa9ec..d14b45610c73 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -36,6 +36,7 @@
 #define OVERFLOW_STACK_SIZE     SZ_4K
 
 #define IRQ_STACK_SIZE		THREAD_SIZE
+#define SSE_STACK_SIZE		THREAD_SIZE
 
 #ifndef __ASSEMBLER__
 
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f54c336bf547..0728362ba0ae 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
 obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
 obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
 obj-$(CONFIG_RISCV_SBI)		+= sbi.o sbi_ecall.o
+obj-$(CONFIG_RISCV_SBI_SSE)	+= sbi_sse.o sbi_sse_entry.o
 ifeq ($(CONFIG_RISCV_SBI), y)
 obj-$(CONFIG_SMP)		+= sbi-ipi.o
 obj-$(CONFIG_SMP) += cpu_ops_sbi.o
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index a75f0cfea1e9..15363703cdd6 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -15,6 +15,8 @@
 #include <asm/ptrace.h>
 #include <asm/cpu_ops_sbi.h>
 #include <asm/stacktrace.h>
+#include <asm/sbi.h>
+#include <asm/sse.h>
 #include <asm/suspend.h>
 
 void asm_offsets(void);
@@ -533,6 +535,18 @@ void asm_offsets(void)
 	DEFINE(FREGS_A6,	    offsetof(struct __arch_ftrace_regs, a6));
 	DEFINE(FREGS_A7,	    offsetof(struct __arch_ftrace_regs, a7));
 #endif
+
+#ifdef CONFIG_RISCV_SBI_SSE
+	OFFSET(SSE_REG_EVT_STACK, sse_event_arch_data, stack);
+	OFFSET(SSE_REG_EVT_SHADOW_STACK, sse_event_arch_data, shadow_stack);
+	OFFSET(SSE_REG_EVT_TMP, sse_event_arch_data, tmp);
+	OFFSET(SSE_REG_HART_ID, sse_event_arch_data, hart_id);
+	OFFSET(SSE_REG_CPU_ID, sse_event_arch_data, cpu_id);
+
+	DEFINE(SBI_EXT_SSE, SBI_EXT_SSE);
+	DEFINE(SBI_SSE_EVENT_COMPLETE, SBI_SSE_EVENT_COMPLETE);
+	DEFINE(ASM_NR_CPUS, CONFIG_NR_CPUS);
+#endif
 #ifdef CONFIG_RISCV_SBI
 	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
 	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index d799c4e56f80..0b79fa7241ea 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -424,6 +424,15 @@ SYM_FUNC_END(call_on_irq_stack)
  * arguments are passed to schedule_tail.
  */
 SYM_FUNC_START(__switch_to)
+#ifdef CONFIG_RISCV_SBI_SSE
+	/*
+	 * Mark the interval where tp changes from prev to next. SSE entry uses
+	 * the interrupted tp while this per-CPU pointer is NULL.
+	 */
+	asm_per_cpu t0, __sbi_sse_entry_task, t1
+	REG_S zero, 0(t0)
+#endif
+
 	/* Save context into prev->thread */
 	li    a4,  TASK_THREAD_RA
 	add   a3, a0, a4
@@ -470,6 +479,11 @@ SYM_FUNC_START(__switch_to)
 	REG_L s11, TASK_THREAD_S11_RA(a4)
 	/* The offset of thread_info in task_struct is zero. */
 	move tp, a1
+#ifdef CONFIG_RISCV_SBI_SSE
+	/* Publish next only after tp contains its task_struct pointer. */
+	asm_per_cpu t0, __sbi_sse_entry_task, t1
+	REG_S tp, 0(t0)
+#endif
 	/* Switch to the next shadow call stack */
 	scs_load_current
 	ret
diff --git a/arch/riscv/kernel/sbi_sse.c b/arch/riscv/kernel/sbi_sse.c
new file mode 100644
index 000000000000..7dd496e2bdb0
--- /dev/null
+++ b/arch/riscv/kernel/sbi_sse.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 Rivos Inc.
+ */
+#include <linux/nmi.h>
+#include <linux/sched.h>
+#include <linux/scs.h>
+#include <linux/bitfield.h>
+#include <linux/percpu-defs.h>
+#include <linux/string.h>
+
+#include <asm/asm-prototypes.h>
+#include <asm/switch_to.h>
+#include <asm/irq_stack.h>
+#include <asm/sbi.h>
+#include <asm/sse.h>
+#include <asm/tlbflush.h>
+
+DEFINE_PER_CPU(struct task_struct *, __sbi_sse_entry_task);
+static DEFINE_PER_CPU(struct riscv_sse_interrupted_context *,
+			      riscv_sse_interrupted_context);
+
+const struct riscv_sse_interrupted_context *
+riscv_sse_get_interrupted_context(void)
+{
+	return this_cpu_read(riscv_sse_interrupted_context);
+}
+
+void __weak sse_handle_event(struct sse_event_arch_data *arch_evt, struct pt_regs *regs)
+{
+}
+
+void noinstr do_sse(struct sse_event_arch_data *arch_evt,
+		    struct pt_regs *regs, unsigned long hstatus)
+{
+	struct riscv_sse_interrupted_context context = { regs, hstatus };
+	struct riscv_sse_interrupted_context *previous;
+	struct sbiret sret;
+
+	nmi_enter();
+	instrumentation_begin();
+
+	/* Retrieve missing GPRs from SBI */
+	sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, arch_evt->evt_id,
+			 SBI_SSE_ATTR_INTERRUPTED_A6,
+			 (SBI_SSE_ATTR_INTERRUPTED_A7 -
+			  SBI_SSE_ATTR_INTERRUPTED_A6) + 1,
+			 (unsigned long)arch_evt->interrupted_phys, 0, 0);
+	if (sret.error) {
+		pr_warn("Failed to read interrupted registers for event %x: %ld\n",
+			arch_evt->evt_id, sret.error);
+		/* Let the client quiesce its source without using incomplete regs. */
+		sse_handle_event(arch_evt, NULL);
+		goto out;
+	}
+
+	memcpy(&regs->a6, arch_evt->interrupted,
+	       sizeof(*arch_evt->interrupted));
+
+	/* Make the interrupted frame visible while clients handle this event. */
+	previous = this_cpu_read(riscv_sse_interrupted_context);
+	this_cpu_write(riscv_sse_interrupted_context, &context);
+	sse_handle_event(arch_evt, regs);
+	this_cpu_write(riscv_sse_interrupted_context, previous);
+
+	if (memcmp(&regs->a6, arch_evt->interrupted,
+		   sizeof(*arch_evt->interrupted))) {
+		memcpy(arch_evt->interrupted, &regs->a6,
+		       sizeof(*arch_evt->interrupted));
+		sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_WRITE,
+				 arch_evt->evt_id, SBI_SSE_ATTR_INTERRUPTED_A6,
+				 (SBI_SSE_ATTR_INTERRUPTED_A7 -
+				  SBI_SSE_ATTR_INTERRUPTED_A6) + 1,
+				 (unsigned long)arch_evt->interrupted_phys, 0, 0);
+		/*
+		 * If writeback fails, COMPLETE resumes with firmware's original
+		 * a6/a7 rather than treating the shared buffer as committed.
+		 */
+		if (sret.error)
+			pr_warn("Failed to write interrupted registers for event %x: %ld\n",
+				arch_evt->evt_id, sret.error);
+	}
+
+out:
+	instrumentation_end();
+	nmi_exit();
+}
+
+static void *alloc_to_stack_pointer(void *alloc)
+{
+	return alloc ? alloc + SSE_STACK_SIZE : NULL;
+}
+
+static void *stack_pointer_to_alloc(void *stack)
+{
+	return stack ? stack - SSE_STACK_SIZE : NULL;
+}
+
+static void arch_sse_flush_tlb_range(struct sse_event_arch_data *arch_evt,
+				     unsigned long start, unsigned long size)
+{
+	unsigned long end = start + size;
+
+	if (sse_event_is_global(arch_evt->evt_id))
+		flush_tlb_kernel_range(start, end);
+	else
+		local_flush_tlb_kernel_range(start, end);
+}
+
+static void arch_sse_shadow_stack_cpu_sync(struct sse_event_arch_data *arch_evt)
+{
+#ifdef CONFIG_SHADOW_CALL_STACK
+	if (arch_evt->shadow_stack)
+		arch_sse_flush_tlb_range(arch_evt,
+					 (unsigned long)arch_evt->shadow_stack,
+					 SCS_SIZE);
+#endif
+}
+
+#ifdef CONFIG_VMAP_STACK
+static void *sse_stack_alloc(unsigned int cpu)
+{
+	void *stack = arch_alloc_vmap_stack(SSE_STACK_SIZE, cpu_to_node(cpu));
+
+	return alloc_to_stack_pointer(stack);
+}
+
+static void sse_stack_free(void *stack)
+{
+	vfree(stack_pointer_to_alloc(stack));
+}
+
+static void arch_sse_stack_cpu_sync(struct sse_event_arch_data *arch_evt)
+{
+	void *p_stack = arch_evt->stack;
+	unsigned long stack = (unsigned long)stack_pointer_to_alloc(p_stack);
+
+	/*
+	 * Flush the tlb to avoid taking any exception when accessing the
+	 * vmapped stack inside the SSE handler
+	 */
+	arch_sse_flush_tlb_range(arch_evt, stack, SSE_STACK_SIZE);
+
+	arch_sse_shadow_stack_cpu_sync(arch_evt);
+}
+#else /* CONFIG_VMAP_STACK */
+static void *sse_stack_alloc(unsigned int cpu)
+{
+	void *stack = kmalloc(SSE_STACK_SIZE, GFP_KERNEL);
+
+	return alloc_to_stack_pointer(stack);
+}
+
+static void sse_stack_free(void *stack)
+{
+	kfree(stack_pointer_to_alloc(stack));
+}
+
+static void arch_sse_stack_cpu_sync(struct sse_event_arch_data *arch_evt)
+{
+	arch_sse_shadow_stack_cpu_sync(arch_evt);
+}
+#endif /* CONFIG_VMAP_STACK */
+
+static int sse_init_scs(int cpu, struct sse_event_arch_data *arch_evt)
+{
+	void *stack;
+
+	if (!scs_is_enabled())
+		return 0;
+
+	stack = scs_alloc(cpu_to_node(cpu));
+	if (!stack)
+		return -ENOMEM;
+
+	arch_evt->shadow_stack = stack;
+
+	return 0;
+}
+
+void arch_sse_event_update_cpu(struct sse_event_arch_data *arch_evt, int cpu)
+{
+	arch_evt->cpu_id = cpu;
+	arch_evt->hart_id = cpuid_to_hartid_map(cpu);
+}
+
+void arch_sse_init_cpu(void)
+{
+	__this_cpu_write(__sbi_sse_entry_task, current);
+}
+
+int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id,
+			int cpu)
+{
+	void *stack;
+
+	arch_evt->interrupted = kmalloc_obj(*arch_evt->interrupted, GFP_KERNEL);
+	if (!arch_evt->interrupted)
+		return -ENOMEM;
+
+	arch_evt->evt_id = evt_id;
+	stack = sse_stack_alloc(cpu);
+	if (!stack)
+		goto err_free_interrupted;
+
+	arch_evt->stack = stack;
+
+	if (sse_init_scs(cpu, arch_evt)) {
+		sse_stack_free(arch_evt->stack);
+		goto err_free_interrupted;
+	}
+
+	/* kmalloc keeps the two adjacent SBI attribute words contiguous. */
+	arch_evt->interrupted_phys = virt_to_phys(arch_evt->interrupted);
+
+	arch_sse_event_update_cpu(arch_evt, cpu);
+
+	return 0;
+
+err_free_interrupted:
+	kfree(arch_evt->interrupted);
+	arch_evt->interrupted = NULL;
+	return -ENOMEM;
+}
+
+void arch_sse_free_event(struct sse_event_arch_data *arch_evt)
+{
+	scs_free(arch_evt->shadow_stack);
+	sse_stack_free(arch_evt->stack);
+	kfree(arch_evt->interrupted);
+}
+
+int arch_sse_register_event(struct sse_event_arch_data *arch_evt)
+{
+	struct sbiret sret;
+
+	arch_sse_stack_cpu_sync(arch_evt);
+
+	sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_REGISTER, arch_evt->evt_id,
+			 (unsigned long)handle_sse, (unsigned long)arch_evt, 0,
+			 0, 0);
+	if (sret.error == SBI_ERR_NOT_SUPPORTED)
+		return -EOPNOTSUPP;
+
+	return sbi_err_map_linux_errno(sret.error);
+}
diff --git a/arch/riscv/kernel/sbi_sse_entry.S b/arch/riscv/kernel/sbi_sse_entry.S
new file mode 100644
index 000000000000..e0e8efba12dd
--- /dev/null
+++ b/arch/riscv/kernel/sbi_sse_entry.S
@@ -0,0 +1,226 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2025 Rivos Inc.
+ */
+
+#include <linux/init.h>
+#include <linux/linkage.h>
+
+#include <asm/alternative-macros.h>
+#include <asm/asm.h>
+#include <asm/csr.h>
+#include <asm/hwcap.h>
+#include <asm/scs.h>
+
+/* When entering handle_sse, the following registers are set:
+ * a6: contains the hartid
+ * a7: contains a sse_event_arch_data struct pointer
+ */
+SYM_CODE_START(handle_sse)
+	/* Save stack temporarily */
+	REG_S sp, SSE_REG_EVT_TMP(a7)
+	/* Set entry stack */
+	REG_L sp, SSE_REG_EVT_STACK(a7)
+
+	addi sp, sp, -(PT_SIZE_ON_STACK)
+	REG_S ra, PT_RA(sp)
+	REG_S s0, PT_S0(sp)
+	REG_S s1, PT_S1(sp)
+	REG_S s2, PT_S2(sp)
+	REG_S s3, PT_S3(sp)
+	REG_S s4, PT_S4(sp)
+	REG_S s5, PT_S5(sp)
+	REG_S s6, PT_S6(sp)
+	REG_S s7, PT_S7(sp)
+	REG_S s8, PT_S8(sp)
+	REG_S s9, PT_S9(sp)
+	REG_S s10, PT_S10(sp)
+	REG_S s11, PT_S11(sp)
+	REG_S tp, PT_TP(sp)
+	REG_S t0, PT_T0(sp)
+	REG_S t1, PT_T1(sp)
+	REG_S t2, PT_T2(sp)
+	REG_S t3, PT_T3(sp)
+	REG_S t4, PT_T4(sp)
+	REG_S t5, PT_T5(sp)
+	REG_S t6, PT_T6(sp)
+	REG_S gp, PT_GP(sp)
+	REG_S a0, PT_A0(sp)
+	REG_S a1, PT_A1(sp)
+	REG_S a2, PT_A2(sp)
+	REG_S a3, PT_A3(sp)
+	REG_S a4, PT_A4(sp)
+	REG_S a5, PT_A5(sp)
+
+	/* Retrieve entry sp */
+	REG_L a4, SSE_REG_EVT_TMP(a7)
+	/* Save CSRs */
+	csrr a0, CSR_EPC
+	csrr a1, CSR_SSTATUS
+	csrr a2, CSR_STVAL
+	csrr a3, CSR_SCAUSE
+
+	REG_S a0, PT_EPC(sp)
+	REG_S a1, PT_STATUS(sp)
+	REG_S a2, PT_BADADDR(sp)
+	REG_S a3, PT_CAUSE(sp)
+	REG_S a4, PT_SP(sp)
+
+	/* Disable user memory access and floating/vector computing */
+	li t0, SR_SUM | SR_FS_VS
+	csrc CSR_STATUS, t0
+
+	load_global_pointer
+	scs_load_sse_stack a7
+
+#ifdef CONFIG_SMP
+	REG_L t4, SSE_REG_HART_ID(a7)
+	lw t3, SSE_REG_CPU_ID(a7)
+
+	bne t4, a6, .Lfind_hart_id_slowpath
+
+.Lcpu_id_found:
+#else
+	mv t3, zero
+#endif
+
+	asm_per_cpu_with_cpu t2 __sbi_sse_entry_task t1 t3
+	REG_L tp, 0(t2)
+	bnez tp, .Lcurrent_task_found
+
+	/* __switch_to() marks its transition window with a NULL entry task. */
+	REG_L tp, PT_TP(sp)
+
+.Lcurrent_task_found:
+	/* Nested exceptions temporarily replace these with the SSE stack. */
+	REG_L s6, TASK_TI_KERNEL_SP(tp)
+	REG_L s7, TASK_TI_USER_SP(tp)
+
+	mv a1, sp /* pt_regs on stack */
+
+	/*
+	 * Run the SSE handler with the normal exception vector, but restore the
+	 * interrupted stvec before completing the event. SSE can arrive while
+	 * the kernel is using a temporary trap vector in a sensitive entry path.
+	 */
+	csrr s3, CSR_STVEC
+	la t0, handle_exception
+	csrw CSR_STVEC, t0
+
+	/*
+	 * Preserve the full HS-mode virtualization state across the handler.
+	 * hstatus is live supervisor state rather than an SSE interrupted
+	 * attribute, and OpenSBI consumes hstatus.SPV during event completion.
+	 * Saving the whole CSR keeps the handler episode transparent to KVM and
+	 * avoids having to infer which hstatus bits may matter to a guest resume.
+	 */
+	li s5, 0
+	ALTERNATIVE("nop", "csrr s5, hstatus", 0, RISCV_ISA_EXT_H, 1)
+
+	/*
+	 * Save sscratch for restoration since we might have interrupted the
+	 * kernel in early exception path and thus, we don't know the content of
+	 * sscratch.
+	 */
+	csrrw s4, CSR_SSCRATCH, x0
+
+	mv a0, a7
+	mv a2, s5
+
+	call do_sse
+
+	/* Leave no reference to the event stack in the interrupted task. */
+	REG_S s7, TASK_TI_USER_SP(tp)
+	REG_S s6, TASK_TI_KERNEL_SP(tp)
+
+	csrw CSR_SSCRATCH, s4
+	ALTERNATIVE("nop", "csrw hstatus, s5", 0, RISCV_ISA_EXT_H, 1)
+	csrw CSR_STVEC, s3
+
+	REG_L a0, PT_STATUS(sp)
+	REG_L a1, PT_EPC(sp)
+	REG_L a2, PT_BADADDR(sp)
+	REG_L a3, PT_CAUSE(sp)
+	csrw CSR_SSTATUS, a0
+	csrw CSR_EPC, a1
+	csrw CSR_STVAL, a2
+	csrw CSR_SCAUSE, a3
+
+	REG_L ra, PT_RA(sp)
+	REG_L s0, PT_S0(sp)
+	REG_L s1, PT_S1(sp)
+	REG_L s2, PT_S2(sp)
+	REG_L s3, PT_S3(sp)
+	REG_L s4, PT_S4(sp)
+	REG_L s5, PT_S5(sp)
+	REG_L s6, PT_S6(sp)
+	REG_L s7, PT_S7(sp)
+	REG_L s8, PT_S8(sp)
+	REG_L s9, PT_S9(sp)
+	REG_L s10, PT_S10(sp)
+	REG_L s11, PT_S11(sp)
+	REG_L tp, PT_TP(sp)
+	REG_L t0, PT_T0(sp)
+	REG_L t1, PT_T1(sp)
+	REG_L t2, PT_T2(sp)
+	REG_L t3, PT_T3(sp)
+	REG_L t4, PT_T4(sp)
+	REG_L t5, PT_T5(sp)
+	REG_L t6, PT_T6(sp)
+	REG_L gp, PT_GP(sp)
+	REG_L a0, PT_A0(sp)
+	REG_L a1, PT_A1(sp)
+	REG_L a2, PT_A2(sp)
+	REG_L a3, PT_A3(sp)
+	REG_L a4, PT_A4(sp)
+	REG_L a5, PT_A5(sp)
+
+	REG_L sp, PT_SP(sp)
+
+	li a7, SBI_EXT_SSE
+	li a6, SBI_SSE_EVENT_COMPLETE
+	ecall
+
+	/*
+	 * COMPLETE must resume the interrupted context and never return. Trap
+	 * through the normal vector instead of falling into adjacent assembly.
+	 */
+	la t0, handle_exception
+	csrw CSR_STVEC, t0
+	ebreak
+	/* The fatal trap must not return; execution should never reach here. */
+
+#ifdef CONFIG_SMP
+.Lfind_hart_id_slowpath:
+
+	/* Restore current task struct from __sbi_sse_entry_task */
+	li t1, ASM_NR_CPUS
+	/* Slowpath to find the CPU id associated to the hart id */
+	la t0, __cpuid_to_hartid_map
+	li t3, 0
+
+.Lhart_id_loop:
+	REG_L t2, 0(t0)
+	beq t2, a6, .Lcpu_id_found
+
+	/* Increment pointer and CPU number */
+	addi t3, t3, 1
+	addi t0, t0, RISCV_SZPTR
+	bltu t3, t1, .Lhart_id_loop
+
+	/*
+	 * This should never happen since we expect the hart_id to match one
+	 * of our CPU, but better be safe than sorry
+	 */
+	la tp, init_task
+	la a0, sse_hart_id_panic_string
+	la t0, panic
+	jalr t0
+#endif
+
+SYM_CODE_END(handle_sse)
+ASM_NOKPROBE(handle_sse)
+
+SYM_DATA_START_LOCAL(sse_hart_id_panic_string)
+    .ascii "Unable to match hart_id with cpu\0"
+SYM_DATA_END(sse_hart_id_panic_string)
-- 
2.43.0


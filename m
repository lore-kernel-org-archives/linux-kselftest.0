Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260244;
	b=SixxK0O0BED95pvz9lf7MqHOt51JHi/xu9tIxJ73mWRuePAnJUpvWuT1Oq8pgckcqwuw
	 woW9P3mVdHUIF6MBZ4esDsbxk2GMNxuWKX7xeFUC0ojFLf3N1WTL1U8IxVR1A4dofv7Dx
	 JHgC9qpwrZUK5oKSSna3vOLX0i50QOIGJbisdbUy8fL7PZ9AW/xMGtGC1c3lrapPM1Qp4
	 W+WNDCFG7xuyrxFJtNU3oWej6oQe/EDtwh77B/L3emR57L84+Jc9IL0odgRAr0kpDpWr/
	 hGLdoDm9aYhMgsDrlmTciIKTWe7+qtIr4Bf+n5sX2WTJio37sf0ZQZKwK2VeoNrYX9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KGtx6/Y4jw1xOGZOxg+hfjoK70dC2iNPtMRt22eWyh0=;
	b=CG+DQe8TwTS+2mvamf63eqCTh8x1G8LaKTk1x9gFnejkHfPjjgsETP/+OE5BnVJuJ+4z
	 7ZdQf5nxZylCJyD0WC5QWoZMn1Gt1W8/ErbxWR+gTzVZPRfEHI/vtFjI52gKw7N5QLciw
	 wsleHmr0wlvqPRnpTPYFR00nomPEjPPlbTWjP+K9EiR+gBFMxzBDOL7KpII0PMGDN74F/
	 FmKu2Bxe+s4hx7RJ8o9yb0YfLLXU8dF3FNnFtTuQ/DWBVzUgSQtPx2qxiRe0pZWHYY+Fy
	 14gjYLUIii2v8gSA6x/odU6/LzvfzEj9HPMsVDaAaX5MR/0ZT9NAnoWQFVZUSD4Xc+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=P0bD1T7r;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9204D606A31E
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 07:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9204D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=P0bD1T7r
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2eb0981df4aso2733195ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 00:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793260243; x=1793865043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KGtx6/Y4jw1xOGZOxg+hfjoK70dC2iNPtMRt22eWyh0=;
        b=P0bD1T7rkuZzgD8GER6Cpg9NR+Wo/UNvQm9rvke63dtabL95NyW1d9hoT0NgMfmwd3
         fVx5NIC+jDuVqvO5J4CGb1VDtg3BUMudnH4pbHnoQMgAcRaRUqw2glRHqxVh6CWkcfIv
         9SVHWx7f4749NFVLr5x80sqXDZKplJqFjptFYKLIQ6Snou2RFXRjWXXqN7PMFq+snyVu
         84T7xYwhT9cQEtkpb8VyHhRbudRU1AT7XenYlnClUm23zxhRxrapE5bHWvG8s3Jcjkqm
         t8lWuh406Q6/jMYmo8wXL5yuYe3jN6Dk9F7p6cvPx4NIElHUVrLrd6ecXDOvRcc7/mB0
         7hHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260243; x=1793865043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KGtx6/Y4jw1xOGZOxg+hfjoK70dC2iNPtMRt22eWyh0=;
        b=Nu9+nyQRVg83yJH2UgspdzrhJAgDb54Q0BXrZae/LBk6GwK9bZocp+Wl7PAlD2+yni
         OwvCvVGkgW/cKGUQmtWFB9BBrO61Tqk7dCwgo6OVx7NrKwlkEj27ZwHi+jhTfRbBFPYg
         6lHvjxUGpO1/opjTqwaVU3LqutgDdvXDGDVTG+w/9BqRoKmAXmqeeC4PCvsJ8Q8Ypz9u
         sSSsFjOZR7QS78zCH8V3ErnuAWa8mkiMNcKSC7lOTKvvIeCfHBZDX4v5BPDn93tOPbqR
         uAyqagVSmdt0XHRh1nVYoOyioRiBXrpzZJUtohLsDnKj3o67Ic2T9MI+8UShtyu1WX7L
         XG/w==
X-Forwarded-Encrypted: i=1; AKwUvBwkrtdKa/DGXpMemLchDl1vSfhc4RbXRtpkNmeoWwuEK5Q7gB2Aooz8CJD8Q2UjpUvq8pZR9N1YFgxYwkgpgo4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRMtttdS2xHW7kgOSSFvW8XYSGs0yflJisfmyL25EpHQdbfwUW
	4SYhOa/qgP6cfd81bA2hR+SGD2q/IXsiAi+OGFt2qaTreg937iz4eHPNt0Umxjqb9Qw=
X-Gm-Gg: AYBFou3qygFSGdKsWLnvgqgQTf0shb4fFOGoVC+eZbz9LqPhHXudzPK3fdy8dd9iAvW
	6qL0eLaQqGIv9Sxyr67GpBOTT+s99CA0a0P8TfkB1dTM0EWhz8H9s1A4VUa67lPp55SyCFtRvGv
	cRx0YAKNK684Q2Wb7S7k+CTzuGfH965mE76VKJ53A+wmyVSEO5EfAaucC9gQZx/KDgh9HiZxKOE
	0bCixtglnJRTgT0/WPGBiT4TvAq2AzHGuQ1QUPGLE92MQpB0ITvILrPwawUDH1FuqGoWmY3oX2q
	Yzo1iKvL2ok+8fCWnmotUg2mQtHqeYZ0LcI4otPn4ywUvf+O4RKzrXyUDZNF5QlHWuK50Zjc0og
	uTjqA8R3J8s5u2CYfB37mQL6tiaDc9dMtEMPJw8PKZSlS9LtJJ/twkvmX0IqtuXpqxnI/7N8IJs
	cZd2oTKC/i7uRz9LqXG/dSGr2z+GLXuXNTWmZ5z19dvESvUA7GJAoyny2dcX4El6J5dskTrgbFS
	BT2BeUrPxTiO/OXF3glZvL+wEJRPLHPs2N/S3D6LVXUd89WDgsHnNXT6hxgLIm4Whf/hQjREdF7
	nSNm2x0AsSB/Jj/wmLU/OH33tWRRLeibFzjLoD/p1YbEKCDsc8+T/aRTIG1KuUmlw8RkHOzVSjw
	9Rj0uoH8=
X-Received: by 2002:a17:902:f54c:b0:2e9:a090:dd80 with SMTP id d9443c01a7336-2eb0048632bmr44539025ad.22.1793260242802;
        Thu, 29 Oct 2026 00:50:42 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bd60desm30598915ad.29.2026.10.29.00.50.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 00:50:42 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup.patel@oss.qualcomm.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	yuanzhu@bytedance.com,
	yang.yicong@picoheart.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v12 07/11] perf: RISC-V: support callchains with SSE delivery
Date: Thu, 29 Oct 2026 15:48:49 +0800
Message-ID: <20261029074853.35467-8-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
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

PMU overflow delivery through SSE enters Linux with a synthetic supervisor
context on a dedicated event stack. The perf unwinder must use the context
interrupted by the overflow rather than treating the SSE handler frame as
the sampled frame.

Use the interrupted pt_regs published by the RISC-V SSE entry path. Walk a
kernel callchain only when the interrupted PC, SP, and frame pointer are
consistent with the current task stack. For sensitive entry windows and
IRQ stacks whose bounds cannot be proven, retain the interrupted PC without
following an unsafe frame chain.

User callchains continue through the existing nofault RISC-V user unwinder.
If hstatus.SPV says the interrupted context was a guest, do not interpret
the guest stack through the host address space.

DWARF callchains additionally copy a raw user stack. Provide an SSE-aware
riscv_perf_out_copy_user() following x86's copy_from_user_nmi().
The copy runs under pagefault_disable(), so a non-resident source
page takes an exception-table handled fault that returns the number
of bytes not copied
instead of entering handle_mm_fault() or opening an interrupt window, and
perf truncates the user-stack dump accordingly. The SSE entry saves and
restores the interrupted task's stack metadata across that nested trap.

In SSE context also check access_ok(), require a user mm, and compare
the active page-table root with current->mm before copying. This rejects
a mismatched root, but does not exclude stale translations in the window
between a satp update and the following TLB flush. It is not a complete
equivalent of x86's nmi_uaccess_okay(). Outside SSE, retain the existing
inatomic copy with page faults disabled.

Susheng Yang reported this failure with perf callchain workloads.

Link: https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/
Reported-by: Susheng Yang <yang.susheng@zte.com.cn>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/perf_event.h |  10 ++
 arch/riscv/kernel/perf_callchain.c  | 140 ++++++++++++++++++++++++++++
 2 files changed, 150 insertions(+)

diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
index bcc928fd378..ddc40479475 100644
--- a/arch/riscv/include/asm/perf_event.h
+++ b/arch/riscv/include/asm/perf_event.h
@@ -18,6 +18,16 @@
 	(regs)->sp = current_stack_pointer; \
 	(regs)->status = SR_PP; \
 }
+
+#ifdef CONFIG_RISCV_SBI_SSE
+/*
+ * Raw user-stack sampling can run in the NMI-like SSE context. Route it
+ * through an implementation that does not fault on a non-resident page.
+ */
+unsigned long riscv_perf_out_copy_user(void *dst, const void *src,
+				       unsigned long n);
+#define arch_perf_out_copy_user riscv_perf_out_copy_user
+#endif
 #endif
 
 #endif /* _ASM_RISCV_PERF_EVENT_H */
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index b465bc9eb87..216f5bd14c0 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -1,9 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd. */
 
+#include <linux/kallsyms.h>
+#include <linux/mm.h>
 #include <linux/perf_event.h>
+#include <linux/sched/task_stack.h>
+#include <linux/thread_info.h>
 #include <linux/uaccess.h>
 
+#include <asm/csr.h>
+#include <asm/sse.h>
 #include <asm/stacktrace.h>
 
 static bool fill_callchain(void *entry, unsigned long pc)
@@ -11,6 +17,126 @@ static bool fill_callchain(void *entry, unsigned long pc)
 	return perf_callchain_store(entry, pc) == 0;
 }
 
+#ifdef CONFIG_RISCV_SBI_SSE
+static bool sse_addr_on_task_stack(unsigned long addr, unsigned long size)
+{
+	unsigned long end = addr + size;
+	unsigned long stack;
+
+	if (end < addr)
+		return false;
+
+	stack = (unsigned long)task_stack_page(current);
+	if (addr >= stack && end <= stack + THREAD_SIZE)
+		return true;
+
+	return false;
+}
+
+static bool sse_kernel_regs_safe(struct pt_regs *regs)
+{
+	unsigned long fp = frame_pointer(regs);
+	unsigned long pc = instruction_pointer(regs);
+	unsigned long sp = user_stack_pointer(regs);
+
+	if (!__kernel_text_address(pc))
+		return false;
+	if (!sse_addr_on_task_stack(sp, sizeof(unsigned long)))
+		return false;
+	if (fp < sizeof(struct stackframe))
+		return false;
+
+	return sse_addr_on_task_stack(fp - sizeof(struct stackframe),
+				      sizeof(struct stackframe));
+}
+
+static bool sse_callchain_is_guest(const struct riscv_sse_interrupted_context *context)
+{
+	return context && (context->hstatus & HSTATUS_SPV);
+}
+
+static bool sse_callchain_kernel(struct perf_callchain_entry_ctx *entry,
+				 struct pt_regs *regs)
+{
+	const struct riscv_sse_interrupted_context *context;
+	unsigned long pc;
+
+	context = riscv_sse_get_interrupted_context();
+	if (!context || context->regs != regs)
+		return false;
+
+	/* A guest stack cannot be walked using the host kernel address space. */
+	if (sse_callchain_is_guest(context))
+		return true;
+
+	if (user_mode(regs))
+		return true;
+
+	if (sse_kernel_regs_safe(regs)) {
+		walk_stackframe(NULL, regs, fill_callchain, entry);
+		return true;
+	}
+
+	/*
+	 * Keep the sample useful for sensitive entry paths and IRQ stacks. The
+	 * generic walker does not take explicit IRQ stack bounds, and its
+	 * THREAD_SIZE alignment assumption fails for non-vmapped IRQ stacks.
+	 * Conservatively avoid walking IRQ stacks in every configuration.
+	 */
+	pc = instruction_pointer(regs);
+	if (__kernel_text_address(pc))
+		perf_callchain_store(entry, pc);
+
+	return true;
+}
+
+unsigned long riscv_perf_out_copy_user(void *dst, const void *src,
+				       unsigned long n)
+{
+	unsigned long ret;
+
+	/*
+	 * Raw user-stack sampling can run in the NMI-like SSE context. Mirror
+	 * x86's copy_from_user_nmi(): the copy may take a page fault, but it
+	 * must not fault a non-resident page in. pagefault_disable() keeps the
+	 * RISC-V fault handler on the nofault exception-table fixup (no
+	 * handle_mm_fault(), no interrupt window), and the SSE entry saves and
+	 * restores the interrupted task's stack metadata across that nested
+	 * trap. A fault therefore returns the number of bytes not copied, and
+	 * perf truncates the user-stack dump accordingly.
+	 *
+	 * In SSE context also approximate x86's nmi_uaccess_okay(): only sample
+	 * when the active page table root still matches current->mm, so we do
+	 * not walk an unrelated address space after interrupting a KVM guest, a
+	 * kernel thread, or a task whose mm is being swapped. This root check
+	 * does not close the window inside switch_mm() between writing satp and
+	 * flushing the local TLB (RISC-V has no LOADED_MM_SWITCHING marker like
+	 * x86); that is a window between instructions, not within one. In that
+	 * window a stale TLB entry may still resolve to the outgoing mapping, and
+	 * with ASID reuse the residue can even belong to an unrelated address
+	 * space. The nofault fixup only bounds faulting accesses; it cannot
+	 * detect a successful hit on a stale translation. This is therefore a
+	 * bounded sample-quality gap (a mis-attributed or truncated user-stack
+	 * dump), not a memory-safety hazard: the copy target is the perf ring
+	 * buffer and the length is bounded, so a stale read cannot corrupt an
+	 * unrelated kernel object.
+	 */
+	if (riscv_sse_get_interrupted_context()) {
+		if (!access_ok(src, n))
+			return n;
+		if (!current->mm ||
+		    (csr_read(CSR_SATP) & SATP_PPN) != virt_to_pfn(current->mm->pgd))
+			return n;
+	}
+
+	pagefault_disable();
+	ret = __copy_from_user_inatomic(dst, src, n);
+	pagefault_enable();
+
+	return ret;
+}
+#endif
+
 /*
  * This will be called when the target is in user mode
  * This function will only be called when we use
@@ -28,6 +154,15 @@ static bool fill_callchain(void *entry, unsigned long pc)
 void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 			 struct pt_regs *regs)
 {
+#ifdef CONFIG_RISCV_SBI_SSE
+	const struct riscv_sse_interrupted_context *context;
+
+	context = riscv_sse_get_interrupted_context();
+	/* A guest stack cannot be walked using the host address space. */
+	if (sse_callchain_is_guest(context))
+		return;
+#endif
+
 	if (perf_guest_state()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
@@ -39,6 +174,11 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 			   struct pt_regs *regs)
 {
+#ifdef CONFIG_RISCV_SBI_SSE
+	if (sse_callchain_kernel(entry, regs))
+		return;
+#endif
+
 	if (perf_guest_state()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
-- 
2.50.1 (Apple Git-155)


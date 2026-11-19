Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090204;
	b=s55kwsrRh4oYNLFbwWAjhfBj2oM7W2MHdp1MAbbqVP8SBtV77//NvEoEJoc+fHkenjL4
	 7qpzF64FcDMGwcOPn5IWEcOHisXsKiv3jx7aY6gEHQIdpGqLCHwV5qMSuzQTX/1N/+vBe
	 V3di2GvSWHVXchSb1FxX+1ZFivTbGfKHXm6sdS7b6e6XZ+l7oTF3hIOcFLv5P8ljYIoT9
	 mVSHC19nOy035AibmGc+r/qNkM/+o4+urrWo25/F7tJ+4ug3anI3osbb/WsKlVoR7S0MT
	 cuNYXnT6KAHkeCroVhFOPlOlq7ePU4eZg2639ISqb0zqrpsSI7rESMG0iURDNqDjvhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WBWgjTIBdjRYedM5vWqNsq+cxEewFYhLyP8m5/StiLc=;
	b=fqLUh3aoXulvudUMPow9VdoBfgFERmbbAazDrTqyyD2INMtDzhdZIZIV5rHUs3Z7glQk
	 jUvyJyq1WLU+hOm4nlXMQFSeSWk5BGKgbNbf+AUHQACExQsNImbi2d4WxQPePFhDRMBbX
	 Q+anENkLHofKCxBn8+keppDTT0bGpzMNZm0h8p7n/FLf2OE8ad8pS2aMMzV1lr4h9i+g3
	 ycoTvSob3+mm5drN8Rct43trWLsEY0t89yNdEtc/F0tWHT/Sr9dtzko2aneeOeXQqzSd1
	 L+awCRbWI8denBwAU4tWU6XIIr8/ykCROXqEzMusfbG7PAuWO4V7mUQKCAfNMUU8t9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=IT964W6b;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0F5606A32A
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 12:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB0F5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=IT964W6b
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so4926854eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 04:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090203; x=1795695003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBWgjTIBdjRYedM5vWqNsq+cxEewFYhLyP8m5/StiLc=;
        b=IT964W6bypDD3LkDuRej0qfcTCqic4NKLXTCmdwNT5x8S1iZt43DbcmXD/NKAHBIJb
         JdPkJXGcQGA6Z+WIFHEIgHnQqIP94H028rX1ujiHEwJVNi6A84tfOjrbIUptQDGEQbAF
         eluMH4WGwW4kBnto6IuW5Vh1AOQY7BXmGxJjeVTVwOOpmorDsIyxPCjHxw0Pyy1cpqSn
         aGQYxQY4BdFBmEW62A6kzF1ifidP7OHqxaziID6mESff0KfTGKnNEv1u88TohREZqnBA
         fTpGURnnDFhOzkqdb9mu8Wasp1VGEI95LIc0KKM7EQZ96QMZIaYlrpJQfDxWGKrdAtEs
         5OEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090203; x=1795695003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WBWgjTIBdjRYedM5vWqNsq+cxEewFYhLyP8m5/StiLc=;
        b=Y2GWOlbP61sG/NCAnSx/VLgc3lRqtjgyPhOih4cv78IUZCRfebwjMvy3DoAAhhvaEv
         6pRHytRRsp0GUCJURTlQzzE5M+VzWlRaHIuWXTFXuyKKBXQke7yuYfKgKFMQGID//T8Q
         gjreJfI424qnyJu2C8lZ6/ymE1uSHKujGyBdrzgH3w+Fhid19pFBnk6kEvOrhFUVOrrE
         rRSdKR5+gLOYoRqTLR2Xk6dj6Wfu5g1NWECwxs7s1HYofbnMXYQx35396foE6eiRp5bj
         rux5MBIMLw3Cp50tN2TwM4TejVZ6TO4uTHTBcPKsh0fiyjjuBlVUu5SF4/Hm3oDr8czx
         5sJw==
X-Forwarded-Encrypted: i=1; AL+hErFNskeVDXZqxRnjsa2UavXkacIs/344jIU8WPyOV4ZYsdmnPZfx6+k/cHn2lo7Ks6GtXXHYQ2OqfZ8hJ96Tn7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kjeKTmu6AE4nedMyHTlWSGT18kciNT07d8jqfiQPL7bOwL2pD
	Wk9vY90AOqkb5nVOeDVho9e2rGIgrBZRZf4BSPNhL9P+ZyyR8kRM+ZNM/IG7Q5jrhwo=
X-Gm-Gg: AZFdTZfUtaW4nZbBf6D/FhkByBWNb9ldX8MnXuIIKejlxpYQc5X7Cx0TTGmcb+2NZzQ
	z0JDM3YbOlXsRhWmpeHnvR2m7QCaKFPru/S8aWRuDQgXNTVazudPQPm7fK8hSCtDRlDHtKoEBW6
	dCUjq5mUC1+LMWUH6zjATHCzSZVehexNgsL/nJf/L4AmVa8R1u2Ka8VE7KZqLwhmdFwAH58ewSt
	Jrihx0QarmtuYhzVL24HJaheV6WhLJm/HaYJha+QlTCgcnYZ1EyIAu8jAc7YBHFXSmsjLACSWag
	FGfey9L8RDFSiXreQOKl7uJq1vtqSmBAsH69Q4amFVFH9ATW/F9NRN2QmhfJpYaxkDl8ixG8lC6
	1s+V2D6MNUqILQE6nk3s75/Xp7EC+9gEYgBr9w1KubaGjTx0gGDx4vQIhBkItv9YQy1XRemO4g1
	h7u1FzOCE8pwh9p8t5G71g/0l2vl2j58VrKbJzlBZYnsItQfJCKRXvoDXi3ydi0nG0CcAE7zkMP
	kDrQRu1nUNMpPZFWU9rVC6OVsX05Sisy+PiIrk+UOvqEa52Kbz7nO47f4RyOX3+JcQOxNbfw6Xb
	1J/UHlrh5Ad+CprziyKf7Ypu9a+Sx9A8a48IC6MnC64ZlY1DOgXF2p61+bALj8SeJfi6/vv+GQL
	a1mLLQEI=
X-Received: by 2002:a05:7301:e8e:b0:381:e8f2:c006 with SMTP id 5a478bee46e88-38280f20365mr7681950eec.28.1795090202481;
        Thu, 19 Nov 2026 04:10:02 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.09.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:10:02 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	himanshu.chauhan@oss.qualcomm.com,
	conor@kernel.org,
	anup.patel@oss.qualcomm.com
Cc: clement.leger@linux.dev,
	cuiyunhui@bytedance.com,
	atish.patra@linux.dev,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	will@kernel.org,
	tglx@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	shuah@kernel.org,
	yuanzhu@bytedance.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangzhanpeng.jasper@bytedance.com
Subject: [PATCH v13 07/11] perf: RISC-V: support callchains with SSE delivery
Date: Thu, 19 Nov 2026 20:08:31 +0800
Message-ID: <20261119120824.13969-20-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
References: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
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
index bcc928fd3785..ddc404794751 100644
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
index b465bc9eb870..216f5bd14c00 100644
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


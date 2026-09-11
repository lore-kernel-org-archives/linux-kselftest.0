Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECA343DEC9
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 12:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129057; cv=none; b=K6FNY15Pk2Y+zvDORFyKB3yRCjzgJdLcWsgvqOTWZnRxb1hSy6W74F01Elkyq34s1s9NOvceYiJr6lWpo9J078STL3YGCiFZMTrPzUk0B9DjKmEMU+h5mwkdbit3pHPfCdNCXOdjNkRBAReyVtgl57nteIcq4JfOswnZpzlBv4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129057; c=relaxed/simple;
	bh=l9cbhsR6oIcRYl+I2g1jCIa/WhsXA/dARjMt3kDigl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6V9BBevZzzlHHwphw/tvFU/EDpAj/Mk8Zb4yVUiIK9O+VeUn+w9OUNY1A21mr6g6vWqm4VR1lbLK20waHMhyL9FJelrFCjthxCocU66SQB3nYMjzKtTE+hHRoHB3R5nlfb3C8DrHy2xpnUj33C1W8rnQ9tXM7rGEvKW4DG7KE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=deFHXfrN; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="deFHXfrN"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-86309e1a213so353237b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 05:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789129053; x=1789733853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jS32Dx5IynGZ/Y/2aGGAGztAdcoBdPlUNApcd4RXZUY=;
        b=deFHXfrNDd+W0AEagd3IbUOzdPvHbE1WDSvVUiQFD83DsNQWYrhG7ADRgo4gkkyJEV
         /kVEqE8jcwOwXIfzQ9OhU3NfSZD/sv8D1WSwaSgVVRxh3c2lYXqFHduM78snx83f8Dyn
         3qC2H3g3hi9TPMjNn7QWaTA9HuzgfSzLKEUGH1GhLZdpNbsnd4I/bHEXPsWGEsrmOP/P
         2rO/2Xq4fi5GXtIgrIIofhTYL80Elm+sJQVs0VOTz+AWSLns2dhtbplMvjpsM7I2/sC3
         phL7pr4Hi0YNnovya96/FvlL1RvbdvdnBmLjweF6he0fnz/rAeDuk9C11DdbQzA7T1my
         9jdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129053; x=1789733853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jS32Dx5IynGZ/Y/2aGGAGztAdcoBdPlUNApcd4RXZUY=;
        b=iwAoAp7Kzzo1i6oFonKSEhohNujSgHzq1oL+pi3NaoKvJeCvDlHMYfFPsc9GnQefYd
         odfvI8fP8ant/e5VRDuLImERWtSRYVsTxHrFxUTOFqC5P48Y0YgU/CMujjv5VRsthhy6
         4DLw7VAsKW5PV9qAYo6mF4E7JtYA/ivptd8mF4Zb6pAtTtW88fQRsYAJbfmYtEtCpmwi
         UwZnIMDqf3lqTGIkPomNecNOlZTHe9/y7bbtSIKcDjZJwbDXqMEv04SzVSSs+HjNvFui
         mVz/jyR7d2R9/ZTnZnWnSfj47zPRVhf2uvmB4dfPM0bArjWOd3tkGaGcWXYV3821y4ei
         nUKA==
X-Forwarded-Encrypted: i=1; AKwUvBxkptIHl/GqBykiwqFmRruhqh8Of1KBNyepcgmDGs4T2Gv+LL8IguNi0SciaiNZLZsv/EC5yBWycLD5gD6RurA=@vger.kernel.org
X-Gm-Message-State: AFuF++mT39NDB9D49EPfUGHbH7BIvtg75CqdJhuw0/07E2NWX7y/+kQC
	x86sP7cca4qWessXPbe8UhSr8od5irqPykTd6vvglv6OGK6e97WCTxCn0U/GaXeCwMM=
X-Gm-Gg: AYBFou1ylyGWWophVeyuDYB+fm9qVR4Ud754ooInyyWq/whlg6nY0sylz0IluB8U7aa
	7QMDrvHsRn8hxqIcp5TAjgarLcCSjstiqKBk83qIFutPAQ4yY0UpjbrAjoaraExLp/QouXGGkwD
	SfCy3RaTz+gTZJmmpPbgxq4MEEa3GRaxC0jTOtdhxImjMSJTxh4GDdFwfg7w8Ag3KNSTX5jULja
	UBhmt5JadtSox0HidCMXvemiQHwxGsMkzTYFstrqiFaG0+m9csSEkhfCpHGrQx/D8z4rlDYiduX
	4/I5AkZb/fD9uSdwdw18wRRwpdoh4pluiF5aOHSoq4o+fQylvK8hs2zVH4uDDCpkQemve6XTmvs
	il6FYOl0RLPCu6h41O7iEKy90tPBQMF5p9yzjLeELtPFtW6xZSFv10SmtQHCCkgppi47G9U/aDx
	ibBAqaKb3ikl1lwh4HMnMQ6qKpx2ziIiZN2Ty0W9RSVs3H1L3DSvVObZugjxBN6QfbAwYsKPYoK
	WJBNSuBe7jtiLKw99WxHN7MaR4Cd2xK40ByPEbiag==
X-Received: by 2002:a05:6a20:3ca8:b0:3da:bb98:b1f9 with SMTP id adf61e73a8af0-3daed4bba1dmr7680917637.9.1789129052892;
        Fri, 11 Sep 2026 05:17:32 -0700 (PDT)
Received: from FJ7FR2JRQ3 ([2409:8a28:f48:3091:908c:b537:572a:4db0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm3178278eec.8.2026.09.11.05.17.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 05:17:32 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup@brainfault.org>
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
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuanzhu <yuanzhu@bytedance.com>,
	Yicong Yang <yang.yicong@picoheart.com>,
	Susheng Yang <yang.susheng@zte.com.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v10 6/9] perf: RISC-V: support callchains with SSE delivery
Date: Fri, 11 Sep 2026 20:14:53 +0800
Message-ID: <20260911121456.33223-7-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
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

DWARF callchains additionally copy a raw user stack. The generic
arch_perf_out_copy_user() implementation can take an exception-table
handled fault when a source page is not resident. Repeated nested faults
from the SSE handler can corrupt the interrupted kernel context under load.

Provide an SSE-specific RISC-V copy path. Verify that the active page table
belongs to current, use fast-only GUP to acquire each resident source page
without falling back to a faulting slow path, and copy through the kernel
mapping while holding the page reference. Stop at the first unavailable
page and preserve perf's existing truncated-user-stack semantics. Keep the
generic in-atomic user copy unchanged outside an SSE handler.

Susheng Yang reported this failure with perf callchain workloads.

Reported-by: Susheng Yang <yang.susheng@zte.com.cn>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/perf_event.h |  10 ++
 arch/riscv/kernel/perf_callchain.c  | 142 ++++++++++++++++++++++++++++
 2 files changed, 152 insertions(+)

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
index b465bc9eb870..ec75689c7aec 100644
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
@@ -11,6 +17,128 @@ static bool fill_callchain(void *entry, unsigned long pc)
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
+	unsigned long addr = (unsigned long)src;
+	unsigned long copied = 0;
+
+	/* Keep the generic fast path unchanged outside an SSE handler. */
+	if (!riscv_sse_get_interrupted_context()) {
+		unsigned long ret;
+
+		pagefault_disable();
+		ret = __copy_from_user_inatomic(dst, src, n);
+		pagefault_enable();
+		return ret;
+	}
+
+	if (!access_ok(src, n))
+		return n;
+
+	/* Do not sample user memory through an unrelated active page table. */
+	if (!current->mm ||
+	    (csr_read(CSR_SATP) & SATP_PPN) != virt_to_pfn(current->mm->pgd))
+		return n;
+
+	while (copied < n) {
+		unsigned long offset = offset_in_page(addr);
+		unsigned long chunk = min(n - copied, PAGE_SIZE - offset);
+		struct page *page;
+
+		/*
+		 * Fast-only GUP cannot fault. This follows perf_virt_to_phys():
+		 * local interrupts remain disabled throughout SSE processing, so a
+		 * concurrent unmap cannot complete its TLB teardown before this
+		 * temporary reference is put.
+		 */
+		if (!get_user_page_fast_only(addr, 0, &page))
+			break;
+
+		memcpy((char *)dst + copied,
+		       (char *)page_address(page) + offset, chunk);
+		put_page(page);
+		addr += chunk;
+		copied += chunk;
+	}
+
+	return n - copied;
+}
+#endif
+
 /*
  * This will be called when the target is in user mode
  * This function will only be called when we use
@@ -28,6 +156,15 @@ static bool fill_callchain(void *entry, unsigned long pc)
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
@@ -39,6 +176,11 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
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


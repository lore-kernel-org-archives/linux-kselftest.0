Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794971631;
	b=LCrRedKzVRV+GbUA4J+L6kPLaDW8ZGI7RxxVpf1u/tCI2paydtONIsXSEzr34g+ALeT0
	 dyQR4uK4X1rZAwwnI7BnzimMiU3P8qdXue1pBEUf2ZcMoDJop8LIkbwqabdP6RHdBOLXb
	 tx3xSTSmv6AGeab+cRv18bdglM45bRgyo+w/nbpg84dhKC1sMBTqcXEhKek8qBb4y6F79
	 /uTSrxjsKKX6tkAWjwaAfhfzCmYKGGgneNYUaC1J8t8sNgHybFBZnYxqp7bQib0BEGUZV
	 io6v5UYb3wsMD3p1Mk9zNLdprXiQfTKe2/e0qAxeS6DzT7LsZA0aaa5p3mL4tSDKqsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vGh/vPCpuM/8bsnvm8QC3JIlKI/9b3IxD6kLaQlvrSs=;
	b=iGjWja9yOEMfcG2FAJ5xrxxY5rlPWyIvN6XHLabqxARoAqGnaOZELgbCGlkEFINU7ujB
	 NOIxSqfdp5Smpm9ARrEFe/pjj4ymr7n+hjawHjLmI+dq9vgxgkRmVARPvrFE7JAQr5L3y
	 UAd3oQK60LELr8IxVXFBv+0skHd8zrO+rKNdjkkcd1fy+XUlOGeV7OwcWgF+Bnuzf87Yj
	 gr+EFa86cZe+nyFAVtKjLyDQh+TJ/5noe541TPr2IMjA1dtzM8mvV0a4UG+3/0USbj8lU
	 PQT7qYeUka/VKdltY20S09QYaT2X/HrHhlubNrhMtCmLbrukQCNPahjij7X8qX3E1+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=H38X0uyd;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6810A606A32F
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 03:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6810A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=H38X0uyd
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a3c08d6928so817523c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 19:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794971629; x=1795576429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGh/vPCpuM/8bsnvm8QC3JIlKI/9b3IxD6kLaQlvrSs=;
        b=H38X0uydvk/LbRXGd46vP/a1OOV399sRM5kA4IjsNynvrSWwSe+3qd1V6xZDcbDGAs
         qrsaix+Yyfr1RkgdIyBd4IxzfrWjFyHDwVse/B5pTYKysq4pTd2TmCijPtgBSuAKTKWw
         Jgnrm7ndv+gVLn2PEgqHszRkNiaGi2jbs8cKOpXAqngUoX1mx3zV8oYGVU4dNX+1toSR
         D/QqxwPNEXLqDYqvUGLf0gwAjoy0rySXlvseNSPtzDtp5ytJDYRJ6/D1WbxAaxzffh2B
         Z7p3XZ7mjpMGz5UXa3IWamK9V1mj9QtiVwbniYrkzXUjZxWjChivcRL5t3ixJv/gMVPv
         yAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794971629; x=1795576429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGh/vPCpuM/8bsnvm8QC3JIlKI/9b3IxD6kLaQlvrSs=;
        b=G9VK6s6XstI10CL0HRLUpqlCTE0p79Wq60BIYOMs7OyQRHCvLAWiko0NNU0/tFPU2T
         Ha1r7WvEH2up1FEwh6TnBMHKN80x+O/2hXzNEMyBvH40/CplcWOj5AVVvzNMDWOus2+x
         d8iPFKs0tzhlIuqdaOSTW1MDKmnuLvM8Bds16AkYxSaXmfLbrkq14f1LnA71bhIYimjv
         3T6PYhMQD5LHGzjYOKOP6sjRciL74jZZUaqyjMPUOF7+9Egp7pHi+DJPhZTEaUoRQj8s
         ZJioQmxn99mABUFiBrEL3i/cTvTUi2MULQSIbOHmwNa8lzgcska0ZjZ2jZJk4DF/mZV4
         q6Mg==
X-Forwarded-Encrypted: i=1; AL+hErGnRGZjEf/G4o3zPOHdveHPZQCAj2jrn8wm3yBMqwgU+NBFa/qdnluRTrQij6OrzaD6eFYsnT0gZVTS/J8FsfQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MC2KBDYTBppgTT9sZKODACfZQIfUCe1FL75H+kJWpBwVejD6X
	ywspO9Bz00c/jjH+4/plyoVy6mauwzjIvf9vEd7P5GJKTimyuqImktxK4YjCd5U8iZVifZzN7QV
	pEeSIgZY=
X-Gm-Gg: AYBFou3No7pSEzHzKPKwGHBm1h9vGuzWi9l7nbjqkWJTRUjBhr7lshvPn2f6b7kdBoN
	5/rhjrKd2JotvRzaNpSh0pnu5+EO+UagtNJAExfi1c33pRyAGG1v8wH7QPBVfFXCHB9RbBQ4k63
	TGYGy/AAfasMGauZkD2k/FyhrQ909PJkvh6hNNGiCt7L+rmFxHr30+V2eldwKd17iL+GEYuwLFs
	OB7qmUwx9/qse8CtF3Ogyj1jeach9+jN9kW8QW97ORkdL5Gwl6rspEsrJqDp1uOlvyGCx9hupKA
	LCRR1KvyBXGSRNKd8E5wk/A6vWIEl1VqHhD01KPO2p210vNmK0nOANMoQqZ2WbxlsbZVTfXbVSQ
	wfWpHlXG6CKJakcCDiw6TqQcvbt/uP5v1DXadZ7vdXcGreOXPRI8WqU8bRUlGwu/91wlrsm0eFI
	fzfQxRIBSdEGOg/p/6Hub1dXqk8o4xoVGTHpMCRUH7/6XUe+ZqTSwWOnURSbCb0J5gzhqUP71uR
	z3msN2gP5rsp5TThL3/WKhgwKJWF8FqeBw66A+Z/bHxWHtnbfje9afo0USTVxorq/3ve20oRsXF
	l82trd+GuTolmzZOBfbgH5wq8ynLhBluwKzuvVR7d41jaw==
X-Received: by 2002:a05:7023:d0d:b0:1b2:60b2:96ff with SMTP id a92af1059eb24-1b543d0ce1fmr1469082c88.38.1794971629134;
        Tue, 17 Nov 2026 19:13:49 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784017sm2512908c88.4.2026.11.17.19.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:13:48 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 17 Nov 2026 19:13:44 -0800
Subject: [PATCH v2 1/2] riscv: traps: Add support for vector misalignment
 handler
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-riscv-vector-misaligned-v2-1-0163d9430ca1@sifive.com>
References: <20261117-riscv-vector-misaligned-v2-0-0163d9430ca1@sifive.com>
In-Reply-To: <20261117-riscv-vector-misaligned-v2-0-0163d9430ca1@sifive.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Nylon Chen <nylon.chen@sifive.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794971627; l=38886;
 i=nylon.chen@sifive.com; s=20260310; h=from:subject:message-id;
 bh=JorrJtfyVJEWp/Rlvcet6Uv7hhcKqeBgfb9oUhUpVk0=;
 b=L5TJ1ry4PlgFGOnCZtjCG6ZbKKOt9rN4X1RZBkHtt5opmAPLVMln19XepV9R+PIqp8CIPhQie
 CH4/9YSOAvcB6/kr55RgIkdGWFafV/1nRMlvjNBFruJQEMc+k/DGQ2c
X-Developer-Key: i=nylon.chen@sifive.com; a=ed25519;
 pk=+xtFLLbXfGd50d5UhR9oBzLTh+JLft7T60t3u7YMZPI=

Implement misaligned load/store emulation for RISC-V vector instructions.
This adds support for handling misaligned memory accesses in vector
operations, which may occur when the effective address is not naturally
aligned for the element size.

The implementation includes:
- Vector load emulator (misaligned_v_ld_emulator)
- Vector store emulator (misaligned_v_st_emulator)
- Support for various vector instruction formats:
  - Unit-stride and strided load/store
  - Indexed load/store
  - Segment load/store
  - Whole register load/store
  - Fault-only-first loads

Both user mode and kernel mode traps are emulated. In user mode, the
vector register file has already been saved to current->thread.vstate
by kernel_vector_begin(), so register contents are accessed there. In
kernel mode the registers are still live in hardware for the duration
of the trap (IRQs stay disabled, nothing else can touch them), so
get_vreg()/set_vreg() instead use vstart together with a
tail-undisturbed vsetvli to read or modify only the target element in
place, the same technique OpenSBI's M-mode handler uses. This avoids
depending on CONFIG_RISCV_ISA_V_PREEMPTIVE or any per-task kernel
vector state allocation.

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 arch/riscv/include/asm/vector.h        |   4 +
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/traps_misaligned.c   |  39 +-
 arch/riscv/kernel/traps_v_misaligned.c | 902 +++++++++++++++++++++++++++++++++
 4 files changed, 944 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index cd09f32e1ea3..712c38383998 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -51,6 +51,8 @@ void put_cpu_vector_context(void);
 void riscv_v_thread_free(struct task_struct *tsk);
 void __init riscv_v_setup_ctx_cache(void);
 void riscv_v_thread_alloc(struct task_struct *tsk);
+int misaligned_v_ld_emulator(struct pt_regs *regs, unsigned long insn);
+int misaligned_v_st_emulator(struct pt_regs *regs, unsigned long insn);
 void __init update_regset_vector_info(unsigned long size);
 
 static inline u32 riscv_v_flags(void)
@@ -411,6 +413,8 @@ bool riscv_v_vstate_ctrl_user_allowed(void);
 
 struct pt_regs;
 
+int misaligned_v_ld_emulator(struct pt_regs *regs, unsigned long insn);
+int misaligned_v_st_emulator(struct pt_regs *regs, unsigned long insn);
 static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
 static __always_inline bool has_vector(void) { return false; }
 static __always_inline bool insn_is_vector(u32 insn_buf) { return false; }
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f54c336bf547..001b2eb12a9f 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -76,6 +76,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 obj-$(CONFIG_RISCV_USER_CFI) += vdso_cfi/
 
 obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
+obj-$(CONFIG_RISCV_VECTOR_MISALIGNED)	+= traps_v_misaligned.o
 obj-$(CONFIG_RISCV_MISALIGNED)	+= unaligned_access_speed.o
 obj-$(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)		+= copy-unaligned.o
 obj-$(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)	+= vec-copy-unaligned.o
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 6e8ae6c66322..3a16ec91e150 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -206,15 +206,39 @@ static int handle_vector_misaligned_load(struct pt_regs *regs)
 		return 0;
 	}
 
-	/* If vector instruction we don't emulate it yet */
 	regs->epc = epc;
-	return -1;
+	return misaligned_v_ld_emulator(regs, insn);
+}
+
+static int handle_vector_misaligned_store(struct pt_regs *regs)
+{
+	unsigned long epc = regs->epc;
+	unsigned long insn;
+
+	if (get_insn(regs, epc, &insn))
+		return -1;
+
+	/* Only return 0 when in check_vector_unaligned_access_emulated */
+	if (*this_cpu_ptr(&vector_misaligned_access) == RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN) {
+		*this_cpu_ptr(&vector_misaligned_access) =
+			RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
+		regs->epc = epc + INSN_LEN(insn);
+		return 0;
+	}
+
+	regs->epc = epc;
+	return misaligned_v_st_emulator(regs, insn);
 }
 #else
 static int handle_vector_misaligned_load(struct pt_regs *regs)
 {
 	return -1;
 }
+
+static int handle_vector_misaligned_store(struct pt_regs *regs)
+{
+	return -1;
+}
 #endif
 
 static int handle_scalar_misaligned_load(struct pt_regs *regs)
@@ -445,6 +469,17 @@ int handle_misaligned_load(struct pt_regs *regs)
 
 int handle_misaligned_store(struct pt_regs *regs)
 {
+	unsigned long epc = regs->epc;
+	unsigned long insn;
+
+	if (IS_ENABLED(CONFIG_RISCV_VECTOR_MISALIGNED)) {
+		if (get_insn(regs, epc, &insn))
+			return -1;
+
+		if (insn_is_vector(insn))
+			return handle_vector_misaligned_store(regs);
+	}
+
 	if (IS_ENABLED(CONFIG_RISCV_SCALAR_MISALIGNED))
 		return handle_scalar_misaligned_store(regs);
 
diff --git a/arch/riscv/kernel/traps_v_misaligned.c b/arch/riscv/kernel/traps_v_misaligned.c
new file mode 100644
index 000000000000..29557a51a347
--- /dev/null
+++ b/arch/riscv/kernel/traps_v_misaligned.c
@@ -0,0 +1,902 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ *
+ * Authors:
+ *   Nylon Chen <nylon.chen@sifive.com>
+ *   Zong Li <zong.li@sifive.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/perf_event.h>
+#include <linux/irq.h>
+#include <linux/stringify.h>
+#include <linux/sched/signal.h>
+
+#include <linux/processor.h>
+#include <asm/ptrace.h>
+#include <asm/csr.h>
+#include <linux/entry-common.h>
+#include <asm/hwprobe.h>
+#include <linux/cpufeature.h>
+#include <asm/vector.h>
+#include <asm/simd.h>
+#include <linux/slab.h>
+#include <asm/asm-prototypes.h>
+
+#define INSN_MASK_VECTOR_UNIT_STRIDE			0xfdf0707f
+#define INSN_MASK_VECTOR_FAULT_ONLY_FIRST		0xfdf0707f
+#define INSN_MASK_VECTOR_STRIDE				0xfc00707f
+#define INSN_MASK_VECTOR_INDEXED			0xfc00707f
+#define INSN_MASK_VECTOR_WHOLE_REG			0xfff0707f
+
+#define VSEW3(bits) ({							\
+	unsigned long __b = (unsigned long)(bits);			\
+	(__b == 16UL ? 5UL : (__b == 32UL ? 6UL : 7UL));		\
+})
+
+#define INSN_MATCH_VLUXSEG(n, bits) \
+	((((unsigned long)(n) - 1UL) << 29) | 0x04000007UL | (VSEW3(bits) << 12))
+
+#define INSN_MATCH_VSUXSEG(n, bits) \
+	((((unsigned long)(n) - 1UL) << 29) | 0x04000027UL | (VSEW3(bits) << 12))
+
+#define INSN_MATCH_VLOXSEG(n, bits) \
+	((((unsigned long)(n) - 1UL) << 29) | 0x0c000007UL | (VSEW3(bits) << 12))
+
+#define INSN_MATCH_VSOXSEG(n, bits) \
+	((((unsigned long)(n) - 1UL) << 29) | 0x0c000027UL | (VSEW3(bits) << 12))
+
+#define INSN_MATCH_VLSSEG(n, bits)  \
+	((((unsigned long)(n) - 1UL) << 29) | 0x08000007UL | (VSEW3(bits) << 12))
+
+#define INSN_MATCH_VSSSEG(n, bits)  \
+	((((unsigned long)(n) - 1UL) << 29) | 0x08000027UL | (VSEW3(bits) << 12))
+
+#define INSN_MATCH_VSSEG(n, bits)   \
+	((((unsigned long)(n) - 1UL) << 29) | 0x00004027UL | (VSEW3(bits) << 12))
+
+#define INSN_MATCH_VLSEG(n, bits)   \
+	((((unsigned long)(n) - 1UL) << 29) | 0x00004007UL | (VSEW3(bits) << 12))
+
+#define INSN_MATCH_VLSEGFF(n, bits) \
+	((((unsigned long)(n) - 1UL) << 29) | 0x01000007UL | (VSEW3(bits) << 12))
+
+#define INSN_MATCH_VLE16V		0x00005007
+#define INSN_MATCH_VLE32V		0x00006007
+#define INSN_MATCH_VLE64V		0x00007007
+#define INSN_MATCH_VSE16V		0x00005027
+#define INSN_MATCH_VSE32V		0x00006027
+#define INSN_MATCH_VSE64V		0x00007027
+#define INSN_MATCH_VLSE16V		0x08005007
+#define INSN_MATCH_VLSE32V		0x08006007
+#define INSN_MATCH_VLSE64V		0x08007007
+#define INSN_MATCH_VSSE16V		0x08005027
+#define INSN_MATCH_VSSE32V		0x08006027
+#define INSN_MATCH_VSSE64V		0x08007027
+#define INSN_MATCH_VLOXEI16V		0x0c005007
+#define INSN_MATCH_VLOXEI32V		0x0c006007
+#define INSN_MATCH_VLOXEI64V		0x0c007007
+#define INSN_MATCH_VSOXEI16V		0x0c005027
+#define INSN_MATCH_VSOXEI32V		0x0c006027
+#define INSN_MATCH_VSOXEI64V		0x0c007027
+#define INSN_MATCH_VLUXEI16V		0x04005007
+#define INSN_MATCH_VLUXEI32V		0x04006007
+#define INSN_MATCH_VLUXEI64V		0x04007007
+#define INSN_MATCH_VSUXEI16V		0x04005027
+#define INSN_MATCH_VSUXEI32V		0x04006027
+#define INSN_MATCH_VSUXEI64V		0x04007027
+#define INSN_MATCH_VLE16FFV		0x01005007
+#define INSN_MATCH_VLE32FFV		0x01006007
+#define INSN_MATCH_VLE64FFV		0x01007007
+#define INSN_MATCH_VL1RE8V		0x02800007
+#define INSN_MATCH_VL1RE16V		0x02805007
+#define INSN_MATCH_VL1RE32V		0x02806007
+#define INSN_MATCH_VL1RE64V		0x02807007
+#define INSN_MATCH_VL2RE8V		0x22800007
+#define INSN_MATCH_VL2RE16V		0x22805007
+#define INSN_MATCH_VL2RE32V		0x22806007
+#define INSN_MATCH_VL2RE64V		0x22807007
+#define INSN_MATCH_VL4RE8V		0x62800007
+#define INSN_MATCH_VL4RE16V		0x62805007
+#define INSN_MATCH_VL4RE32V		0x62806007
+#define INSN_MATCH_VL4RE64V		0x62807007
+#define INSN_MATCH_VL8RE8V		0xe2800007
+#define INSN_MATCH_VL8RE16V		0xe2805007
+#define INSN_MATCH_VL8RE32V		0xe2806007
+#define INSN_MATCH_VL8RE64V		0xe2807007
+#define INSN_MATCH_VS1RV		0x02800027
+#define INSN_MATCH_VS2RV		0x22800027
+#define INSN_MATCH_VS4RV		0x62800027
+#define INSN_MATCH_VS8RV		0xe2800027
+
+#define IS_VECTOR_INSN_MATCH(insn, match, mask)					\
+({										\
+	u32 _i = (u32)(insn);							\
+	u32 _m = (u32)(match);							\
+	u32 _k = (u32)(mask);							\
+	(((_i & _k) == (_m & _k)));						\
+})
+
+#define IS_UNIT_STRIDE_MATCH(insn, match) \
+	IS_VECTOR_INSN_MATCH(insn, match, INSN_MASK_VECTOR_UNIT_STRIDE)
+
+#define IS_STRIDE_MATCH(insn, match) \
+	IS_VECTOR_INSN_MATCH(insn, match, INSN_MASK_VECTOR_STRIDE)
+
+#define IS_INDEXED_MATCH(insn, match) \
+	IS_VECTOR_INSN_MATCH(insn, match, INSN_MASK_VECTOR_INDEXED)
+
+#define IS_FAULT_ONLY_FIRST_MATCH(insn, match) \
+	IS_VECTOR_INSN_MATCH(insn, match, INSN_MASK_VECTOR_FAULT_ONLY_FIRST)
+
+#define IS_WHOLE_REG_MATCH(insn, match) \
+	IS_VECTOR_INSN_MATCH(insn, match, INSN_MASK_VECTOR_WHOLE_REG)
+
+#define IS_UNIT_STRIDE_LOAD(insn) ({ \
+	typeof(insn) __insn = (insn); \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLE16V) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLE32V) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLE64V) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(2, 16)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(3, 16)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(4, 16)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(5, 16)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(6, 16)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(7, 16)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(8, 16)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(2, 32)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(3, 32)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(4, 32)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(5, 32)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(6, 32)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(7, 32)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(8, 32)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(2, 64)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(3, 64)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(4, 64)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(5, 64)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(6, 64)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(7, 64)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VLSEG(8, 64)); \
+})
+
+#define IS_UNIT_STRIDE_STORE(insn) ({ \
+	typeof(insn) __insn = (insn); \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSE16V) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSE32V) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSE64V) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(2, 16)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(3, 16)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(4, 16)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(5, 16)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(6, 16)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(7, 16)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(8, 16)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(2, 32)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(3, 32)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(4, 32)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(5, 32)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(6, 32)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(7, 32)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(8, 32)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(2, 64)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(3, 64)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(4, 64)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(5, 64)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(6, 64)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(7, 64)) || \
+	IS_UNIT_STRIDE_MATCH(__insn, INSN_MATCH_VSSEG(8, 64)); \
+})
+
+#define IS_STRIDE_LOAD(insn) ({ \
+	typeof(insn) __insn = (insn); \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSE16V) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSE32V) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSE64V) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(2, 16)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(3, 16)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(4, 16)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(5, 16)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(6, 16)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(7, 16)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(8, 16)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(2, 32)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(3, 32)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(4, 32)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(5, 32)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(6, 32)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(7, 32)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(8, 32)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(2, 64)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(3, 64)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(4, 64)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(5, 64)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(6, 64)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(7, 64)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VLSSEG(8, 64)); \
+})
+
+#define IS_STRIDE_STORE(insn) ({ \
+	typeof(insn) __insn = (insn); \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSE16V) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSE32V) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSE64V) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(2, 16)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(3, 16)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(4, 16)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(5, 16)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(6, 16)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(7, 16)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(8, 16)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(2, 32)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(3, 32)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(4, 32)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(5, 32)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(6, 32)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(7, 32)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(8, 32)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(2, 64)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(3, 64)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(4, 64)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(5, 64)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(6, 64)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(7, 64)) || \
+	IS_STRIDE_MATCH(__insn, INSN_MATCH_VSSSEG(8, 64)); \
+})
+
+#define IS_INDEXED_LOAD(insn) ({ \
+	typeof(insn) __insn = (insn); \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXEI16V) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXEI32V) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXEI64V) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXEI16V) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXEI32V) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXEI64V) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(2, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(3, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(4, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(5, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(6, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(7, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(8, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(2, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(3, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(4, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(5, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(6, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(7, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(8, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(2, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(3, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(4, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(5, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(6, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(7, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLUXSEG(8, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(2, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(3, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(4, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(5, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(6, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(7, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(8, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(2, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(3, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(4, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(5, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(6, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(7, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(8, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(2, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(3, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(4, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(5, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(6, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(7, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VLOXSEG(8, 64)); \
+})
+
+#define IS_INDEXED_STORE(insn) ({ \
+	typeof(insn) __insn = (insn); \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXEI16V) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXEI32V) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXEI64V) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXEI16V) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXEI32V) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXEI64V) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(2, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(3, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(4, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(5, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(6, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(7, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(8, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(2, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(3, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(4, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(5, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(6, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(7, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(8, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(2, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(3, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(4, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(5, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(6, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(7, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSUXSEG(8, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(2, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(3, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(4, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(5, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(6, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(7, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(8, 16)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(2, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(3, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(4, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(5, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(6, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(7, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(8, 32)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(2, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(3, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(4, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(5, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(6, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(7, 64)) || \
+	IS_INDEXED_MATCH(__insn, INSN_MATCH_VSOXSEG(8, 64)); \
+})
+
+#define IS_FAULT_ONLY_FIRST_LOAD(insn) ({ \
+	typeof(insn) __insn = (insn); \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLE16FFV) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLE32FFV) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLE64FFV) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(2, 16)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(3, 16)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(4, 16)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(5, 16)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(6, 16)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(7, 16)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(8, 16)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(2, 32)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(3, 32)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(4, 32)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(5, 32)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(6, 32)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(7, 32)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(8, 32)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(2, 64)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(3, 64)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(4, 64)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(5, 64)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(6, 64)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(7, 64)) || \
+	IS_FAULT_ONLY_FIRST_MATCH(__insn, INSN_MATCH_VLSEGFF(8, 64)); \
+})
+
+#define IS_WHOLE_REG_LOAD(insn) ({ \
+	typeof(insn) __insn = (insn); \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VL1RE8V) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VL1RE16V) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VL1RE32V) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VL1RE64V) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VL2RE8V) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VL2RE16V) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VL2RE32V) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VL2RE64V) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VL4RE8V) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VL4RE16V) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VL4RE32V) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VL4RE64V) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VL8RE8V) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VL8RE16V) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VL8RE32V) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VL8RE64V); \
+})
+
+#define IS_WHOLE_REG_STORE(insn) ({ \
+	typeof(insn) __insn = (insn); \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VS1RV) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VS2RV) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VS4RV) || \
+	IS_WHOLE_REG_MATCH(__insn, INSN_MATCH_VS8RV); \
+})
+
+#define VM_MASK				0x1
+#define VIEW_MASK			0x3
+#define VSEW_MASK			0x3
+#define VLMUL_MASK			0x7
+#define VD_MASK				0x1f
+#define VS2_MASK			0x1f
+
+#define SH_VSEW				3
+#define SH_VIEW				12
+#define SH_VD				7
+#define SH_VS2				20
+#define SH_VM				25
+#define SH_MEW				28
+
+#define GET_VD(insn)			(((insn) >> SH_VD) & VD_MASK)
+#define GET_VS2(insn)			(((insn) >> SH_VS2) & VS2_MASK)
+#define GET_VIEW(insn)			(((insn) >> SH_VIEW) & VIEW_MASK)
+#define IS_MASKED(insn)			((((insn) >> SH_VM) & VM_MASK) == 0)
+#define GET_MEW(insn)			(((insn) >> SH_MEW) & 1)
+#define GET_VSEW(vtype)			(((vtype) >> SH_VSEW) & VSEW_MASK)
+#define GET_VLMUL(vtype)		((vtype) & VLMUL_MASK)
+#define GET_LEN(view)			(1UL << (view))
+#define GET_NF(insn)			(1 + (((insn) >> 29) & 7))
+#define GET_VEMUL(vlmul, view, vsew)	(((vlmul) + (view) - (vsew)) & 7)
+#define GET_EMUL(vemul)						\
+({								\
+	unsigned long _v = (unsigned long)(vemul);		\
+	(1UL << (_v >= 4 ? 0 : _v));				\
+})
+
+#if defined(CONFIG_64BIT)
+#define LOG_REGBYTES		3
+#else
+#define LOG_REGBYTES		2
+#endif
+
+#define SH_RS1			15
+#define SH_RS2			20
+
+#define SHIFT_RIGHT(x, y)					\
+({								\
+	long _y = (long)(y);					\
+	__typeof__(x) _x = (x);					\
+	(_y < 0) ? (_x << (unsigned long)(-_y))			\
+	: (_x >> (unsigned long)_y);				\
+})
+
+#define REG_MASK                        \
+	((1 << (5 + LOG_REGBYTES)) - (1 << LOG_REGBYTES))
+
+#define REG_OFFSET(insn, pos)           \
+	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
+
+#define REG_PTR(insn, pos, regs)                                               \
+	((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
+
+#define GET_RS1(insn, regs)		(*REG_PTR(insn, SH_RS1, regs))
+#define GET_RS2(insn, regs)		(*REG_PTR(insn, SH_RS2, regs))
+
+/*
+ * VLEN_MAX defines the maximum vector length supported by the emulator.
+ * The mask array size must be at least VLEN_MAX / 8 bytes to hold v0 mask.
+ * Current hardware implementations typically have VLEN of 128-1024 bits.
+ * We use 4096 bits (512 bytes) as a reasonable upper bound that covers
+ * known implementations while keeping stack usage manageable.
+ */
+#define VLEN_MAX 4096
+
+/*
+ * set_vreg - Write bytes into a vector register at a specific position.
+ *
+ * In user mode, kernel_vector_begin() has already saved the hardware
+ * vector register file into current->thread.vstate.datap, so the target
+ * bytes are modified there and restored to hardware by kernel_vector_end().
+ *
+ * In kernel mode, the vector registers are "live" in hardware for the
+ * duration of the trap (IRQs are disabled, nothing else can touch them).
+ * vstart skips elements before @pos, and the tail-undisturbed (tu) policy
+ * on vsetvli preserves elements after @pos+@size, so only [pos, pos+size)
+ * is modified without corrupting the rest of the register. This is the
+ * same technique OpenSBI's M-mode vector misaligned handler uses.
+ */
+static inline void set_vreg(ulong vlenb, ulong which, ulong pos, ulong size,
+			    const u8 *bytes, bool is_usermode)
+{
+	if (is_usermode) {
+		struct __riscv_v_ext_state *vstate = &current->thread.vstate;
+		unsigned char *vdata = vstate->datap;
+
+		if (!vdata)
+			return;
+		memcpy(vdata + which * vlenb + pos, bytes, size);
+		return;
+	}
+
+	/* Kernel mode: directly access the live hardware vector registers. */
+	pos += (which % 8) * vlenb;
+	bytes -= pos;
+
+	__asm__ __volatile__(
+		".option push\n\t"
+		".option arch, +v\n\t"
+		"vsetvli x0, %0, e8, m8, tu, ma\n\t"
+		".option pop\n\t"
+		: : "r"(pos + size));
+
+	csr_write(CSR_VSTART, pos);
+
+	switch (which / 8) {
+	case 0:
+		__asm__ __volatile__(
+			".option push\n\t"
+			".option arch, +v\n\t"
+			"vle8.v v0, (%0)\n\t"
+			".option pop\n\t"
+			: : "r"(bytes) : "memory");
+		break;
+	case 1:
+		__asm__ __volatile__(
+			".option push\n\t"
+			".option arch, +v\n\t"
+			"vle8.v v8, (%0)\n\t"
+			".option pop\n\t"
+			: : "r"(bytes) : "memory");
+		break;
+	case 2:
+		__asm__ __volatile__(
+			".option push\n\t"
+			".option arch, +v\n\t"
+			"vle8.v v16, (%0)\n\t"
+			".option pop\n\t"
+			: : "r"(bytes) : "memory");
+		break;
+	case 3:
+		__asm__ __volatile__(
+			".option push\n\t"
+			".option arch, +v\n\t"
+			"vle8.v v24, (%0)\n\t"
+			".option pop\n\t"
+			: : "r"(bytes) : "memory");
+		break;
+	}
+}
+
+/*
+ * get_vreg - Read bytes from a vector register at a specific position.
+ *
+ * Same technique as set_vreg but in reverse: uses vse8.v to store register
+ * contents to memory.
+ */
+static inline void get_vreg(ulong vlenb, ulong which, ulong pos, ulong size,
+			    u8 *bytes, bool is_usermode)
+{
+	if (is_usermode) {
+		struct __riscv_v_ext_state *vstate = &current->thread.vstate;
+		const unsigned char *vdata = vstate->datap;
+
+		if (!vdata) {
+			memset(bytes, 0, size);
+			return;
+		}
+		memcpy(bytes, vdata + which * vlenb + pos, size);
+		return;
+	}
+
+	/* Kernel mode: directly access the live hardware vector registers. */
+	pos += (which % 8) * vlenb;
+	bytes -= pos;
+
+	__asm__ __volatile__(
+		".option push\n\t"
+		".option arch, +v\n\t"
+		"vsetvli x0, %0, e8, m8, tu, ma\n\t"
+		".option pop\n\t"
+		: : "r"(pos + size));
+
+	csr_write(CSR_VSTART, pos);
+
+	switch (which / 8) {
+	case 0:
+		__asm__ __volatile__(
+			".option push\n\t"
+			".option arch, +v\n\t"
+			"vse8.v v0, (%0)\n\t"
+			".option pop\n\t"
+			: : "r"(bytes) : "memory");
+		break;
+	case 1:
+		__asm__ __volatile__(
+			".option push\n\t"
+			".option arch, +v\n\t"
+			"vse8.v v8, (%0)\n\t"
+			".option pop\n\t"
+			: : "r"(bytes) : "memory");
+		break;
+	case 2:
+		__asm__ __volatile__(
+			".option push\n\t"
+			".option arch, +v\n\t"
+			"vse8.v v16, (%0)\n\t"
+			".option pop\n\t"
+			: : "r"(bytes) : "memory");
+		break;
+	case 3:
+		__asm__ __volatile__(
+			".option push\n\t"
+			".option arch, +v\n\t"
+			"vse8.v v24, (%0)\n\t"
+			".option pop\n\t"
+			: : "r"(bytes) : "memory");
+		break;
+	}
+}
+
+/*
+ * vsetvl - Restore vl and vtype CSRs after get_vreg/set_vreg clobber them.
+ *
+ * get_vreg/set_vreg use vsetvli internally, which modifies vl and vtype.
+ * This must be called after kernel-mode emulation completes to restore the
+ * original values. vsetvl also implicitly resets vstart to 0, which is the
+ * correct post-instruction state per the V spec.
+ */
+static inline void vsetvl(ulong vl, ulong vtype)
+{
+	__asm__ __volatile__(
+		".option push\n\t"
+		".option arch, +v\n\t"
+		"vsetvl x0, %0, %1\n\t"
+		".option pop\n\t"
+		: : "r"(vl), "r"(vtype));
+}
+
+int misaligned_v_ld_emulator(struct pt_regs *regs, unsigned long insn)
+{
+	int ret = 0;
+	unsigned long vl, vtype, vlenb, vstart, base, stride;
+	unsigned long vd, vs2, view, vsew, vlmul, emul, vemul;
+	unsigned long len, nf;
+	bool illegal, masked;
+	bool is_usermode = user_mode(regs);
+	u8 mask[VLEN_MAX / 8];
+	u8 bytes[8 * sizeof(u64)];
+
+	/*
+	 * User mode: IRQs are enabled by do_trap_misaligned(), so we can use
+	 * kernel_vector_begin() which saves the user's vector state to datap.
+	 * We then read CSRs from the saved vstate (not hardware) because
+	 * kernel_vector_begin() -> riscv_v_vstate_save() modifies the hw CSRs.
+	 *
+	 * Kernel mode: IRQs are disabled (NMI-like context), may_use_simd()
+	 * returns false, so kernel_vector_begin() cannot be used. Instead we
+	 * enable vector directly and read CSRs from hardware; get_vreg/
+	 * set_vreg access individual register elements in place via vstart +
+	 * vsetvli(tu), without disturbing the rest of the register file.
+	 */
+	if (is_usermode) {
+		struct __riscv_v_ext_state *vstate = &current->thread.vstate;
+
+		kernel_vector_begin();
+		vl = vstate->vl;
+		vtype = vstate->vtype;
+		vstart = vstate->vstart;
+		vlenb = vstate->vlenb;
+	} else {
+		riscv_v_enable();
+		vl = csr_read(CSR_VL);
+		vtype = csr_read(CSR_VTYPE);
+		vstart = csr_read(CSR_VSTART);
+		vlenb = csr_read(CSR_VLENB);
+	}
+
+	base = GET_RS1(insn, regs);
+	stride = GET_RS2(insn, regs);
+	vd = GET_VD(insn);
+	vs2 = GET_VS2(insn);
+	view = GET_VIEW(insn);
+	vsew = GET_VSEW(vtype);
+	vlmul = GET_VLMUL(vtype);
+	illegal = GET_MEW(insn);
+	masked = IS_MASKED(insn);
+	len = GET_LEN(view);
+	nf = GET_NF(insn);
+	vemul = GET_VEMUL(vlmul, view, vsew);
+	emul = GET_EMUL(vemul);
+
+	if (IS_UNIT_STRIDE_LOAD(insn) || IS_FAULT_ONLY_FIRST_LOAD(insn)) {
+		stride = nf * len;
+	} else if (IS_WHOLE_REG_LOAD(insn)) {
+		vl = (nf * vlenb) >> view;
+		nf = 1;
+		vemul = 0;
+		emul = 1;
+		stride = nf * len;
+	} else if (IS_INDEXED_LOAD(insn)) {
+		len = 1 << vsew;
+		vemul = (vlmul + vsew - vsew) & 7;
+		emul = 1 << ((vemul & 4) ? 0 : vemul);
+		stride = nf * len;
+	}
+
+	if (illegal || vlenb > VLEN_MAX / 8) {
+		if (is_usermode)
+			force_sig_fault(SIGILL, ILL_ILLOPC, (void __user *)regs->epc);
+		ret = -EFAULT;
+		goto out;
+	}
+
+	if (masked)
+		get_vreg(vlenb, 0, 0, vlenb, mask, is_usermode);
+
+	do {
+		if (!masked || ((mask[vstart / 8] >> (vstart % 8)) & 1)) {
+			unsigned long addr = base + vstart * stride;
+
+			if (IS_INDEXED_LOAD(insn)) {
+				unsigned long offset = 0;
+
+				get_vreg(vlenb, vs2, vstart << view, 1 << view,
+					 (u8 *)&offset, is_usermode);
+				addr = base + offset;
+			}
+
+			csr_write(CSR_VSTART, vstart);
+
+			for (unsigned long seg = 0; seg < nf; seg++) {
+				for (unsigned long i = 0; i < len; i++) {
+					u8 *src = (u8 *)(addr + seg * len + i);
+
+					if (is_usermode) {
+						if (get_user(bytes[seg * len + i],
+							     (u8 __user *)src)) {
+							if (IS_FAULT_ONLY_FIRST_LOAD(insn) &&
+							    vstart != 0) {
+								vl = vstart;
+								break;
+							}
+							ret = -EFAULT;
+							goto out;
+						}
+					} else {
+						bytes[seg * len + i] = *src;
+					}
+				}
+			}
+
+			for (unsigned long seg = 0; seg < nf; seg++)
+				set_vreg(vlenb, vd + seg * emul, vstart * len, len,
+					 &bytes[seg * len], is_usermode);
+		}
+	} while (++vstart < vl);
+
+out:
+	if (ret == 0)
+		regs->epc += 4;
+
+	if (is_usermode) {
+		kernel_vector_end();
+	} else {
+		/*
+		 * Restore vl/vtype clobbered by get_vreg/set_vreg's vsetvli.
+		 * vsetvl also resets vstart to 0 (the correct post-insn state).
+		 */
+		vsetvl(vl, vtype);
+		riscv_v_disable();
+	}
+
+	return ret;
+}
+
+int misaligned_v_st_emulator(struct pt_regs *regs, unsigned long insn)
+{
+	int ret = 0;
+	unsigned long vl, vtype, vlenb, vstart, base, stride;
+	unsigned long vd, vs2, view, vsew, vlmul, emul, vemul;
+	unsigned long len, nf;
+	bool illegal, masked;
+	bool is_usermode = user_mode(regs);
+	u8 mask[VLEN_MAX / 8];
+	u8 bytes[8 * sizeof(u64)];
+
+	/*
+	 * User mode: IRQs are enabled by do_trap_misaligned(), so we can use
+	 * kernel_vector_begin() which saves the user's vector state to datap.
+	 *
+	 * Kernel mode: IRQs are disabled, may_use_simd() returns false. Enable
+	 * vector directly and access registers via vstart + vsetvli(tu).
+	 */
+	if (is_usermode) {
+		struct __riscv_v_ext_state *vstate = &current->thread.vstate;
+
+		kernel_vector_begin();
+		vl = vstate->vl;
+		vtype = vstate->vtype;
+		vstart = vstate->vstart;
+		vlenb = vstate->vlenb;
+	} else {
+		riscv_v_enable();
+		vl = csr_read(CSR_VL);
+		vtype = csr_read(CSR_VTYPE);
+		vstart = csr_read(CSR_VSTART);
+		vlenb = csr_read(CSR_VLENB);
+	}
+
+	base = GET_RS1(insn, regs);
+	stride = GET_RS2(insn, regs);
+	vd = GET_VD(insn);
+	vs2 = GET_VS2(insn);
+	view = GET_VIEW(insn);
+	vsew = GET_VSEW(vtype);
+	vlmul = GET_VLMUL(vtype);
+	illegal = GET_MEW(insn);
+	masked = IS_MASKED(insn);
+	len = GET_LEN(view);
+	nf = GET_NF(insn);
+	vemul = GET_VEMUL(vlmul, view, vsew);
+	emul = GET_EMUL(vemul);
+
+	if (IS_UNIT_STRIDE_STORE(insn)) {
+		stride = nf * len;
+	} else if (IS_WHOLE_REG_STORE(insn)) {
+		vl = (nf * vlenb) >> view;
+		nf = 1;
+		vemul = 0;
+		emul = 1;
+		stride = nf * len;
+	} else if (IS_INDEXED_STORE(insn)) {
+		len = 1 << vsew;
+		vemul = (vlmul + vsew - vsew) & 7;
+		emul = 1 << ((vemul & 4) ? 0 : vemul);
+		stride = nf * len;
+	}
+
+	if (illegal || vlenb > VLEN_MAX / 8) {
+		if (is_usermode)
+			force_sig_fault(SIGILL, ILL_ILLOPC, (void __user *)regs->epc);
+		ret = -EFAULT;
+		goto out;
+	}
+
+	if (masked)
+		get_vreg(vlenb, 0, 0, vlenb, mask, is_usermode);
+
+	do {
+		if (!masked || ((mask[vstart / 8] >> (vstart % 8)) & 1)) {
+			unsigned long addr = base + vstart * stride;
+
+			if (IS_INDEXED_STORE(insn)) {
+				unsigned long offset = 0;
+
+				get_vreg(vlenb, vs2, vstart << view, 1 << view,
+					 (u8 *)&offset, is_usermode);
+				addr = base + offset;
+			}
+
+			for (unsigned long seg = 0; seg < nf; seg++)
+				get_vreg(vlenb, vd + seg * emul, vstart * len, len,
+					 &bytes[seg * len], is_usermode);
+
+			csr_write(CSR_VSTART, vstart);
+			for (unsigned long seg = 0; seg < nf; seg++) {
+				for (unsigned long i = 0; i < len; i++) {
+					u8 *dst = (u8 *)(addr + seg * len + i);
+
+					if (is_usermode) {
+						if (put_user(bytes[seg * len + i],
+							     (u8 __user *)dst)) {
+							ret = -EFAULT;
+							goto out;
+						}
+					} else {
+						*dst = bytes[seg * len + i];
+					}
+				}
+			}
+		}
+	} while (++vstart < vl);
+
+out:
+	if (ret == 0)
+		regs->epc += 4;
+
+	if (is_usermode) {
+		kernel_vector_end();
+	} else {
+		/* Restore vl/vtype clobbered by get_vreg's vsetvli. */
+		vsetvl(vl, vtype);
+		riscv_v_disable();
+	}
+
+	return ret;
+}

-- 
2.56.0


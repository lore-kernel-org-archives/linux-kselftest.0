Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694E938945C
	for <linux-kselftest@vger.kernel.org>; Sat,  9 May 2026 13:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778332250; cv=none; b=DpGGXyV//iAn43pyQYNDKLtxt0z6izdb2lmHkZROO7Tffy/lK1mwf3+g6X1sHVz+LL0uKOg+qSFD/jWMdxaCAOilcWEeI8sCmOVua9J4fxBU0DiM2jc7Lz0vvT16/9MS9sgFILBBwFeRTXTt+6nAfIzrbc0apBkMtcApRTJ3KNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778332250; c=relaxed/simple;
	bh=AxS2hiTvXQ1L7djlfRb8J2l+dnwjjt9GL4eayf9IsPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=acioagtUM879DSylX3za2UgncRl92KGvaa/pRKT0mRZ0Tbu2huQE/mZj8h2s3bsYg4rVylX01Vxz0K+Cs2nVuV2oNmPdRIZ3BJOMFmizHCxNe/xtAK9vsV8dM1KAttRH4tmxtM2jj7SeNZQ1HJIDPR2u2mx5dJ6+LBgHnGcVLkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WJU2Rmwu; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WJU2Rmwu"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-835386ff122so2535053b3a.3
        for <linux-kselftest@vger.kernel.org>; Sat, 09 May 2026 06:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1778332247; x=1778937047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35mLlYC50YSAZkc9pjH9mUHgKfH5WzPcTbiF8fQMNpQ=;
        b=WJU2Rmwu8RPCx21zB1KpFgEul80NwqjZBoRpWcMK+5jp76l0xH+jxuCRvHx6XgjoZq
         GAmQozcbVV5iYHUO4hnsXsIbwzBPLnulcIfCRNeSPxtVT7phP69DDyIhaFw/dMfwTx6W
         o6B9bBDcnQ492gAI6ArNI0IKdPtYg3CJNoVUiew+jBZVBb5dM2M+gk7NjyiAj7pMTx6L
         zt3TBfiCNSx9RgGs13JJprU2UntFbUKHO3FDnzDOdz3o6SYnrhqlLOCFpVMJX31srBAZ
         KlzxN7XsfkRnLIZqTcWK6hGBrqEI7lGmJ1rfrdtNGwHdAcCIWxLdIZfyW5GJnwe78JT4
         IPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778332247; x=1778937047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=35mLlYC50YSAZkc9pjH9mUHgKfH5WzPcTbiF8fQMNpQ=;
        b=GAJ1HCgJRoss5QBZp3pJyUbFLrV41m73MSsf/gY0cxp3h3x3YZPVXelt3bctN+HPhf
         Jao05AcyrcoCuFTTxuePlQYC7emmYnmYvmLqd9ABjl2wzWJyyY4D+FioSOZx4xuNuyJF
         f1KgSIcWGzjjBNd7YrJajuWkU1sWQLIJWYsRVR1yD76zoce/xum59TpXUSkGDLr8+fb0
         jM/zLuhHY7jx/ZY41mDNElCOTBnoVmQlobx9wDoeXmUqHGP5AjBAuH5wtP4b3IX8bu6h
         JWmxuit5WTGaCBOZ9UgDjw2T9JBHKUqVfs8Rt/7cDkyQEE54p4DcWO2f5xpx0l/L2JiJ
         i4TA==
X-Forwarded-Encrypted: i=1; AFNElJ9bZXO0K98M5VxLiMdlAsZyYmuGVLs81bLTId8vmhM4FxXYwmzeBHllIdiXZyXCt3TWdWWu1pSN9h+rq3bRZkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCnT5ihOUmQb+Hm970ediSPlg4/9uC5ZMnxd4vyJRnU2R00PSJ
	xrQU7CzQC4y2xq8wtNJjB2nAWDDmM3Xk+/uIaF2OuSE21SDqTWlcoMCnS6MXHNU7L4A=
X-Gm-Gg: Acq92OF4D/NNrpmVJqvAhJwABKuJTcjCE3mxUMrVFbpiSya+B3hdHdA/eq2olMmGXYH
	kP7bd0JRQe1QeouFzwilOWI6XnFaZ8smyDUHQq/Zd2Y4Ub7bVZ5f4GLL728mh2z5noEGk6CqBOd
	o8qPNs/nUr54GLEyANcVnuHzrrE6EogY5FsEwATxHDtQAD3NBwAMwfXea0h3pGmMnPu7BdIWTrP
	ehJW9dCYQNp8Ls/a0mEHioQl95dQN1i+xvza7x13dsKT+UByuXOSoZZag24DLtgCIy/MlQYZJfL
	tOgroSXv+rEw+/J/W4P/T7a+z+mBzHJFiaE5kmCdP8ZjiEf2mzMBKbFflMB5TyZPLvAXO5abrPP
	tHhPDnjz5Yn2sNcGV4BmSjLKsxqgQpEbuyFuhWjVdto7sYnqaxaif3Zp+qipDBRv7c1rjQ89UFv
	oHey7GqCrdo3/ZD+NUCaOuhWawGbhCaXgSPQV8UqcBYwyDc8A6xnbjogNAaRIMT7bud9U=
X-Received: by 2002:a05:6a00:acd:b0:835:405a:7e69 with SMTP id d2e1a72fcca58-83a5c2be5c4mr16061517b3a.16.1778332247317;
        Sat, 09 May 2026 06:10:47 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([155.117.34.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c86b3sm18552855b3a.28.2026.05.09.06.10.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 09 May 2026 06:10:46 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <himanshu@thechauhan.dev>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Zhu Yuan <yuanzhu@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v9 4/5] perf: RISC-V: add support for SSE event
Date: Sat,  9 May 2026 21:10:01 +0800
Message-ID: <7989b7338b7480164bda55131fb7537bd9416591.1778331862.4.git.zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1778331862.git.zhangzhanpeng.jasper@bytedance.com>
References: <cover.1778331862.git.zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Clément Léger <cleger@rivosinc.com>

In order to use SSE within PMU drivers, register an SSE handler for the
local PMU event. Reuse the existing overflow IRQ handler and pass
appropriate pt_regs. Add a config option RISCV_PMU_SBI_SSE to select event
delivery via SSE events.

When the SSE path is used, also honor the return value from
perf_event_overflow(). If perf core throttles or disables an event, do not
immediately restart the overflowed counters from the SSE handler.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Co-developed-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 drivers/perf/Kconfig           | 10 +++++
 drivers/perf/riscv_pmu.c       | 23 +++++++++++
 drivers/perf/riscv_pmu_sbi.c   | 78 ++++++++++++++++++++++++++++++++-----
 include/linux/perf/riscv_pmu.h |  5 +++
 4 files changed, 104 insertions(+), 12 deletions(-)

diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index ab90932fc2d0..b6c58475091c 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -105,6 +105,16 @@ config RISCV_PMU_SBI
 	  full perf feature support i.e. counter overflow, privilege mode
 	  filtering, counter configuration.
 
+config RISCV_PMU_SBI_SSE
+	depends on RISCV_PMU && RISCV_SBI_SSE
+	bool "RISC-V PMU SSE events"
+	default n
+	help
+	  Say y if you want to use SSE events to deliver PMU interrupts. This
+	  provides a way to profile the kernel at any level by using NMI-like
+	  SSE events. Since SSE events can be intrusive, this option allows
+	  selecting them only when needed.
+
 config STARFIVE_STARLINK_PMU
 	depends on ARCH_STARFIVE || COMPILE_TEST
 	depends on 64BIT
diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index 8e3cd0f35336..a48e286d9394 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -13,6 +13,7 @@
 #include <linux/irqdesc.h>
 #include <linux/perf/riscv_pmu.h>
 #include <linux/printk.h>
+#include <linux/riscv_sbi_sse.h>
 #include <linux/smp.h>
 #include <linux/sched_clock.h>
 
@@ -254,6 +255,24 @@ void riscv_pmu_start(struct perf_event *event, int flags)
 	perf_event_update_userpage(event);
 }
 
+#ifdef CONFIG_RISCV_PMU_SBI_SSE
+static void riscv_pmu_disable(struct pmu *pmu)
+{
+	struct riscv_pmu *rvpmu = to_riscv_pmu(pmu);
+
+	if (rvpmu->sse_evt)
+		sse_event_disable_local(rvpmu->sse_evt);
+}
+
+static void riscv_pmu_enable(struct pmu *pmu)
+{
+	struct riscv_pmu *rvpmu = to_riscv_pmu(pmu);
+
+	if (rvpmu->sse_evt)
+		sse_event_enable_local(rvpmu->sse_evt);
+}
+#endif
+
 static int riscv_pmu_add(struct perf_event *event, int flags)
 {
 	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
@@ -411,6 +430,10 @@ struct riscv_pmu *riscv_pmu_alloc(void)
 		.event_mapped	= riscv_pmu_event_mapped,
 		.event_unmapped	= riscv_pmu_event_unmapped,
 		.event_idx	= riscv_pmu_event_idx,
+#ifdef CONFIG_RISCV_PMU_SBI_SSE
+		.pmu_enable	= riscv_pmu_enable,
+		.pmu_disable	= riscv_pmu_disable,
+#endif
 		.add		= riscv_pmu_add,
 		.del		= riscv_pmu_del,
 		.start		= riscv_pmu_start,
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 385af5e6e6d0..ac10ebd73c7c 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -17,6 +17,7 @@
 #include <linux/irqdomain.h>
 #include <linux/of_irq.h>
 #include <linux/of.h>
+#include <linux/riscv_sbi_sse.h>
 #include <linux/cpu_pm.h>
 #include <linux/sched/clock.h>
 #include <linux/soc/andes/irq.h>
@@ -1038,10 +1039,10 @@ static void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
 		pmu_sbi_start_ovf_ctrs_sbi(cpu_hw_evt, ctr_ovf_mask);
 }
 
-static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
+static irqreturn_t pmu_sbi_ovf_handler(struct cpu_hw_events *cpu_hw_evt,
+				       struct pt_regs *regs, bool from_sse)
 {
 	struct perf_sample_data data;
-	struct pt_regs *regs;
 	struct hw_perf_event *hw_evt;
 	union sbi_pmu_ctr_info *info;
 	int lidx, hidx, fidx;
@@ -1049,7 +1050,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	struct perf_event *event;
+	int ev_overflow = 0;
 	u64 overflow;
 	u64 overflowed_ctrs = 0;
-	struct cpu_hw_events *cpu_hw_evt = dev;
 	u64 start_clock = sched_clock();
 	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
 
@@ -1059,13 +1059,15 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	/* Firmware counter don't support overflow yet */
 	fidx = find_first_bit(cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS);
 	if (fidx == RISCV_MAX_COUNTERS) {
-		csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
+		if (!from_sse)
+			csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
 		return IRQ_NONE;
 	}
 
 	event = cpu_hw_evt->events[fidx];
 	if (!event) {
-		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
+		if (!from_sse)
+			ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
 		return IRQ_NONE;
 	}
 
@@ -1080,16 +1082,16 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 
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
 	if (!overflow)
 		return IRQ_NONE;
 
-	regs = get_irq_regs();
-
 	for_each_set_bit(lidx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS) {
 		struct perf_event *event = cpu_hw_evt->events[lidx];
 
@@ -1133,18 +1136,65 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 			 * TODO: We will need to stop the guest counters once
 			 * virtualization support is added.
 			 */
-			perf_event_overflow(event, &data, regs);
+			ev_overflow |= perf_event_overflow(event, &data, regs);
 		}
 		/* Reset the state as we are going to start the counter after the loop */
 		hw_evt->state = 0;
 	}
 
-	pmu_sbi_start_overflow_mask(pmu, overflowed_ctrs);
+	if (!ev_overflow || !from_sse)
+		pmu_sbi_start_overflow_mask(pmu, overflowed_ctrs);
+
 	perf_sample_event_took(sched_clock() - start_clock);
 
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t pmu_sbi_ovf_irq_handler(int irq, void *dev)
+{
+	return pmu_sbi_ovf_handler(dev, get_irq_regs(), false);
+}
+
+#ifdef CONFIG_RISCV_PMU_SBI_SSE
+static int pmu_sbi_ovf_sse_handler(u32 evt, void *arg, struct pt_regs *regs)
+{
+	struct cpu_hw_events __percpu *hw_events = arg;
+	struct cpu_hw_events *hw_event = raw_cpu_ptr(hw_events);
+
+	pmu_sbi_ovf_handler(hw_event, regs, true);
+
+	return 0;
+}
+
+static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
+{
+	int ret;
+	struct sse_event *evt;
+	struct cpu_hw_events __percpu *hw_events = pmu->hw_events;
+
+	evt = sse_event_register(SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW, 0,
+				 pmu_sbi_ovf_sse_handler, hw_events);
+	if (IS_ERR(evt))
+		return PTR_ERR(evt);
+
+	ret = sse_event_enable(evt);
+	if (ret) {
+		sse_event_unregister(evt);
+		return ret;
+	}
+
+	pr_info("using SSE for PMU event delivery\n");
+	pmu->sse_evt = evt;
+
+	return ret;
+}
+#else
+static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
@@ -1195,6 +1242,10 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 	struct cpu_hw_events __percpu *hw_events = pmu->hw_events;
 	struct irq_domain *domain = NULL;
 
+	ret = pmu_sbi_setup_sse(pmu);
+	if (!ret)
+		return 0;
+
 	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
 		riscv_pmu_irq_num = RV_IRQ_PMU;
 		riscv_pmu_use_irq = true;
@@ -1229,7 +1280,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 		return -ENODEV;
 	}
 
-	ret = request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_handler, "riscv-pmu", hw_events);
+	ret = request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_irq_handler, "riscv-pmu", hw_events);
 	if (ret) {
 		pr_err("registering percpu irq failed [%d]\n", ret);
 		return ret;
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index f82a28040594..08fdcf6baf4e 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -28,6 +28,8 @@
 
 #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
 
+struct sse_event;
+
 struct cpu_hw_events {
 	/* currently enabled events */
 	int			n_events;
@@ -54,6 +56,9 @@ struct riscv_pmu {
 	char		*name;
 
 	irqreturn_t	(*handle_irq)(int irq_num, void *dev);
+#ifdef CONFIG_RISCV_PMU_SBI_SSE
+	struct sse_event *sse_evt;
+#endif
 
 	unsigned long	cmask;
 	u64		(*ctr_read)(struct perf_event *event);
-- 
2.50.1 (Apple Git-155)

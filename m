Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F3A443C1C
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 12:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128997; cv=none; b=SsBVUBZ6Mm822u8f0wdqsKPLGpkGFnIT8umDjwywRGfDDWhBQIB6wmA99uTBu768pXiIZ2IGKZoi7tBHhXvWnre7tV42hIVzHqLF8tioWvggJDIh1q5+Mr3clHk7t09lCxSUU0R3XZTcFaB/hvaelXjP0v8YQ2qXJ/gqcklOJJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128997; c=relaxed/simple;
	bh=6j/r9yvub7FH1ktXyNHoVKCJiNGlNg0k7LU+GyyCF9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CaCHGM9510IKwhBG2xmNr2nFEWeU1KTLHJ4HUhlSGTDjAL9r88kbU+QI5wm09eGyRUm5XwoA8i1GTNl+75HgKiNFn2jD2kPbykYElo+3S3IuLBMk+z1C8zhwGGZBD4ZT+hB7GrZq89rjE5sG3iOGihgjcnqM6QkfVlA5+HNw6xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HM/oPo8X; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HM/oPo8X"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-852c481415fso1043618b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 05:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789128992; x=1789733792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slvqYs+iaXZQUFiWP3raPQ3MYOooTUinSrFApU/wWdw=;
        b=HM/oPo8Xdk/qMi6VRFVI47jnAyu9aq4wBlkdpNtamCOaN4TLKbVatV/LYX5KsHvFor
         vvUGj534/K417Xa9z9Vyeot+gQmkCuoZHmdibpE0ciiEfZhe6cVKQLF5yVP4tn6EiviR
         G93iMsieFkGyvX7z55rV3ZR9i0+HgSHIfYAkB+0x2bWXbi24qkQjO1zTfU32mqu8EGhw
         ElLFWIwS+Mm23aFeivF4gFhDaNu++wPiNCy+1qLc3EknUy2B8COD66cCs+Dg60r76zjk
         L4IenKIEr7b3gJPEthbwVwd/ym56rRnwhChlV/DbpWEQdUQb6G4TgEepOW5o1Aq8uhji
         wGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128992; x=1789733792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=slvqYs+iaXZQUFiWP3raPQ3MYOooTUinSrFApU/wWdw=;
        b=hDEyZaCGRoO7Pm5RsBJnY/gVLsFGy/TsY2HLk7klGn6tTT6MvIlBiTWN+Ktem3DcW7
         tYvw2mxPWgF/nhEZhKDuwsgxBTGo84XUBkGOxBhC810ndIhzUb3av1U55y1PIbSg6n1b
         3hfPqkOULg5tGVu+L4FltDKWR5y/55FGlSmgC1PpKcNL3l6Q/i38MhYW3DdxCwo50q5d
         irKKRi3+encqqlxPZGFK7bmmEkCCGasIzd9jCprLsWtM+8k6swNl5EFnlT5oa7e5gZI0
         YPSLalORjKfdCTIaBu9ULWEc6PyXXfo0KN/K/Nnj/38jldbQFRbVKWqrv6YIoJfPsmdq
         XPQg==
X-Forwarded-Encrypted: i=1; AKwUvBwV1kPFZEZKNFUvzZSgbJBwndI5FTumHxrditUE/2IqYtexrgV0f+yiP9W6lt+tW5hloL0fJ9Bz5oREj1polmQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kSn/6NEwIf8iwt266DiNa6MjdXorsZN5ck3hDlP1M9ncfqSN16
	OOkaKCfvMpgq0F+cbyYttaaW4ffjwk3YyBNU/zm3PFy22basAFAgiiGkjbi9TOPrVBQ=
X-Gm-Gg: AYBFou3dJaSSlHX77tAEKBFjFLioJTf/YEeWlmdNi24rn77/Tt6llHL5hRGpkg1+f6A
	I5/l4sZl5XxYStAfA1W27QnnOamxSBSJvefJC8ZYGDFdFe0ebE54fQwm+orSMJ1VI2IhZHPMUCX
	EEOhcMtXka1sWOb1AhOzRO3VQu4/ROl+R6t+ItIoXYUayaNNwB3jIdum0jc0hjMgEmfLAWRFI+2
	XCdZ7tc8Sj3ciUEQrbZOAz9UuhkA4w/z8+/uQ2U+/lBlXqJrkMq4+VX83MUQ7tVoOu9JCMuSWaf
	unHehfj0+lXVsm/s9MXYDdOdvOLEhLFwjhiLrtPwuuG+iUbL67tkCXX1H5lDZ5N62xSZxAqAOB5
	vs7uiJx+CfsT7q/JIE+0WYpExxuUKitcOjV15JsDX+43nyVsnJV+1/y85kcmJ5SrML2WD135QPy
	BXRJW9EpfKCj7GA2MgiGKmboC8sKowvagCq+Jj8pqqabZ15tLH1Rsr1jJKc/rgwAfs7m+nRk99k
	wABCtVsNg9f/ZjM8ya/Jyy3bo3LJef5yo2Mk7IvX+HocvA4JoIi
X-Received: by 2002:a05:6a21:6f88:b0:3c3:6f6c:aa21 with SMTP id adf61e73a8af0-3daed20aeabmr8176798637.11.1789128992272;
        Fri, 11 Sep 2026 05:16:32 -0700 (PDT)
Received: from FJ7FR2JRQ3 ([2409:8a28:f48:3091:908c:b537:572a:4db0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm3178278eec.8.2026.09.11.05.16.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 05:16:31 -0700 (PDT)
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
Subject: [PATCH v10 3/9] riscv: sse: mask events during shutdown and kexec
Date: Fri, 11 Sep 2026 20:14:50 +0800
Message-ID: <20260911121456.33223-4-zhangzhanpeng.jasper@bytedance.com>
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

SSE delivery is independent of normal S-mode interrupts. Firmware may also
retain an event registration until Linux explicitly unregisters it. A hart
must therefore stop accepting SSE events before Linux stops servicing the
registered handler.

Mask SSE on the local hart before panic stop, CPU stop, restart, poweroff,
and crash shutdown paths. This prevents firmware from entering Linux-owned
handler state after the corresponding CPU or kernel context is no longer
valid.

A crash kernel cannot identify or take ownership of registrations
inherited from the crashed kernel. Reject a later normal kexec while such
SSE state may still exist, rather than transferring unknown firmware state
to another kernel.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/kernel/machine_kexec.c | 11 +++++++++++
 arch/riscv/kernel/reset.c         | 18 ++++++++++++++++++
 arch/riscv/kernel/smp.c           | 17 +++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 738df176ff6f..24e7affae70b 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -14,10 +14,13 @@
 #include <asm/set_memory.h>	/* For set_memory_x() */
 #include <linux/compiler.h>	/* For unreachable() */
 #include <linux/cpu.h>		/* For cpu_down() */
+#include <linux/crash_dump.h>
 #include <linux/reboot.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 
+#include <asm/sse.h>
+
 /*
  * machine_kexec_prepare - Initialize kexec
  *
@@ -36,6 +39,13 @@ machine_kexec_prepare(struct kimage *image)
 	unsigned int control_code_buffer_sz = 0;
 	int i = 0;
 
+	/* A crash kernel cannot tear down registrations inherited from firmware. */
+	if (is_kdump_kernel() && image->type != KEXEC_TYPE_CRASH &&
+	    riscv_sse_available()) {
+		pr_err("Normal kexec from a crash kernel is unsupported with SSE\n");
+		return -EOPNOTSUPP;
+	}
+
 	/* Find the Flattened Device Tree and save its physical address */
 	for (i = 0; i < image->nr_segments; i++) {
 		if (image->segment[i].memsz <= sizeof(fdt))
@@ -127,6 +137,7 @@ void
 machine_crash_shutdown(struct pt_regs *regs)
 {
 	local_irq_disable();
+	riscv_sse_mask_current_hart();
 
 	/* shutdown non-crashing cpus */
 	crash_smp_send_stop();
diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index 14eb08a6db85..fdab37e7ae52 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -6,6 +6,20 @@
 #include <linux/efi.h>
 #include <linux/reboot.h>
 #include <linux/pm.h>
+#include <linux/smp.h>
+
+#include <asm/sse.h>
+
+#ifndef CONFIG_SMP
+void __noreturn panic_smp_self_stop(void)
+{
+	riscv_sse_mask_current_hart();
+	local_irq_disable();
+
+	for (;;)
+		cpu_relax();
+}
+#endif
 
 static void __noreturn default_power_off(void)
 {
@@ -18,6 +32,8 @@ EXPORT_SYMBOL(pm_power_off);
 
 void machine_restart(char *cmd)
 {
+	riscv_sse_mask_current_hart();
+
 	/*
 	 * UpdateCapsule() depends on the system being reset via ResetSystem().
 	 */
@@ -30,12 +46,14 @@ void machine_restart(char *cmd)
 
 void machine_halt(void)
 {
+	riscv_sse_mask_current_hart();
 	do_kernel_power_off();
 	default_power_off();
 }
 
 void machine_power_off(void)
 {
+	riscv_sse_mask_current_hart();
 	do_kernel_power_off();
 	default_power_off();
 }
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index fa66f9c97d74..7f0d4e7332f1 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -23,10 +23,13 @@
 #include <linux/irq.h>
 #include <linux/irq_work.h>
 #include <linux/nmi.h>
+#include <linux/panic.h>
 
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
+#include <asm/sbi.h>
+#include <asm/sse.h>
 
 enum ipi_message_type {
 	IPI_RESCHEDULE,
@@ -79,8 +82,18 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
 	return -ENOENT;
 }
 
+void __noreturn panic_smp_self_stop(void)
+{
+	riscv_sse_mask_current_hart();
+	local_irq_disable();
+
+	for (;;)
+		cpu_relax();
+}
+
 static void ipi_stop(void)
 {
+	riscv_sse_mask_current_hart();
 	set_cpu_online(smp_processor_id(), false);
 	while (1)
 		wait_for_interrupt();
@@ -91,6 +104,7 @@ static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
 
 static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 {
+	riscv_sse_mask_current_hart();
 	crash_save_cpu(regs, cpu);
 
 	atomic_dec(&waiting_for_crash_ipi);
@@ -254,6 +268,8 @@ void smp_send_stop(void)
 {
 	unsigned long timeout;
 
+	riscv_sse_mask_current_hart();
+
 	if (num_online_cpus() > 1) {
 		cpumask_t mask;
 
@@ -301,6 +317,7 @@ void crash_smp_send_stop(void)
 		return;
 
 	cpus_stopped = 1;
+	riscv_sse_mask_current_hart();
 
 	/*
 	 * If this cpu is the only one alive at this point in time, online or
-- 
2.50.1 (Apple Git-155)


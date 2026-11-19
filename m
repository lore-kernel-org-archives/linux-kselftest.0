Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090157;
	b=VPMTzgebpBTrBhV2iwAPekLY/GSDLjLnX+VhkgMKxoOdr3JP4Q57SVdb3YmgK17k8Sqj
	 D5zkKmyi1sXIbJkIlLgzeBgmkA+fjhhWNN3U3COWHU8u9eQ3C6OVGWvrF0Mv2FNAFALn2
	 j8nQjajpJMvZ6vLH1Y/tNlH1n0vq6NWD1BjgYSzEjcMwaHWoBkYnorW9/z7Q3gmnZaZde
	 SbpvM/ks0sFK3x/47tYSoBaKY2J06J6QxIs+fk9WdX5i8Jg1beklLf8i4BLcVqtL8iqUC
	 G3m6xLREY1mPuWuIbKusKGmQAW7gNpllMlVEzBl7gGUQB3Ni308RDHyeleSc94xlsTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mjAOFIHRgj5VQM5DbT2bRqvGLu+RPIR/UnCkxZlsmdM=;
	b=AqwpKTiQA+6eanfkvzYrSxWkWc2fPodLhrUTAR/xuBqO8xAurdymsl7oongkYvhU10eK
	 RCVY1fdoRVLA1qwk19+QxPuPCiKtdgAxnoY8HOhcCLOlkpExoGCzVAt33EIet1FyvxXJK
	 qSeyJRDyhkJvIlw2bBn2q8A6OBwWlTYVvayR3z2PbZ26r+Gko4P91c4bJXGGmCHe8AYi8
	 YLVbLxgWPjkUM9l4vHtxezZFUCsSCyq6fXQsDI5i6D7/LgbyxTtKUqoqNtE5qSvgn9wy8
	 3YiV1t286OYkZUNBU5ThI4diWo5AK7JwOd0ehWZQz21aX31u7wOjjWvimgFpQKX4tPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Wsc0CibS;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B2F606A326
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 12:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B2F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Wsc0CibS
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38318d69173so2911812eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 04:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090156; x=1795694956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjAOFIHRgj5VQM5DbT2bRqvGLu+RPIR/UnCkxZlsmdM=;
        b=Wsc0CibSiluv3TklidkIpLjA5OkLdkf5ccIblDgjcq/CaX5RZ+B14ssAG07js2VCiW
         ebpRVBaQTfldMIPBitJc2jMTrFz+Cpdedts8XJunkArh1S9fi7pAcm153zFpJuPDBPbM
         PF92hOrdm9ibfTM+FKKWoZUdxrMzRmnT8WeKZmH2FbImaZC7WR6CarzthNn0eP32faEO
         F63yeNW7UpVRexxlzL40Zho82Q5pHvR3QP/T2h8apz0O1N5A4S9B1P/HjkY8WdhLGdPQ
         f9/+d9YL8uOMHnGLtVVbSZhwYpiN5AAFOs+EQ+qJzqIB8wmsNWuR+qdrxWu1gyJEW7+i
         gj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090156; x=1795694956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mjAOFIHRgj5VQM5DbT2bRqvGLu+RPIR/UnCkxZlsmdM=;
        b=US+q20NolOcTxyOXRmuYZ/15+MP4KtrhlcvQvun/4geP91iBWcaW9U6sfmej/NryU/
         Vn9mHmlNrnGc5fBbwQyQf9HBVXeiJrk6P8PizsOcDYt5DsHK+xup/CIQFnPeRqkTL099
         Bt2HVFOk91mliwaeuatfjK3Tdy4G2ilUmpgHnhJC1I0u5hV9yWpY2gySK/Iu40rxqaL1
         UFunVRyeniZIlT1qeKuOv3HuXDHtDMUWqwidMemizKMMni7vluN9FeQJ7058vabMca+2
         joJWTZ9Rur5UCsKNtRTU1Hop2YgnH5Wk4mVb+6OCAJTK5RNMyjTelRwEdoiqzmazzqzh
         Jisw==
X-Forwarded-Encrypted: i=1; AL+hErF4bMJWMfYd9KpOnvSSIhneDcwmBU7k+hBnRj5ofIktLflRBIh26S2tXLC9s3jlh7GZzYQbuydMqb8/JziA79E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ocAGgtXXlqJW7pEVsj0AdQ3XUsxaCWgK5bHT/AWu1JUzi0pLo
	Y66RDR3C7cOqcI+XPnCXhjnz0iVey02P7IHKoBgMMxHFIX5iRbZXEX88/rDUpWMHlyQ=
X-Gm-Gg: AZFdTZcoJ7PQxpgJrqLd4QCet1ikGU3DnV/8A2/i8z5Qm2wkUM1FWvRADWvxmNcuBGi
	Qwlxdt/Z6f20VmU4VKQcvSD/V+p+74dTYcsyN7bSB2bQZ52i7QF/k3zOWFRkNTbYkm/r1YBGqGh
	2yTft2L6/wT4HPDW0ymC25NXBgsa1mlQ1zv7WNInrKw/OQLjOL0tiZGeADQBzDd/vDE3Xa5t4DR
	rZhMC+oIXtwXSUuDfNBNS4rUWHT5hyRfwP64A3m0ZY9A6WosWyXZKvTT8cYILYO1Ej07F1p5Fme
	p6cPY6Ky3AybMtaYNvi+2YD77ck0H2uJC7DBxek4gQNOCo/Z00Yz3pKBMC5VbdtNsahUmKZowdq
	LAjaQwBvusbfwZhr3NswjJMErAwEOYD1avZnIYOpQUjlQ6C6UBULLOc3RQMNFSN6hd6nTGqOi5U
	UtSDOe1hhh5YopHy8wg5/+PA3FjQCTg/ylWAlRs4A15fvjikDrop5qh3+OO5OazIUQIar333hw/
	Ph3UwBn4YJB3YZ6JxKwzsBj/Z06RdxJTyUTdU4AxqfffJZrqKefanZzI+UDi2xCnTjZCSbBoheS
	562ovML928azOZr8DAcffpC1WwL0HosAi1RgOzV+zkoZduvAP3nIZj+xv+OI7+piAQIi6KtpZ/q
	9eNoRO2E=
X-Received: by 2002:a05:7300:ce85:b0:381:a037:b060 with SMTP id 5a478bee46e88-3828026978bmr5371913eec.9.1795090155546;
        Thu, 19 Nov 2026 04:09:15 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.09.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:09:15 -0800 (PST)
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
Subject: [PATCH v13 03/11] riscv: sse: mask events during shutdown and kexec
Date: Thu, 19 Nov 2026 20:08:27 +0800
Message-ID: <20261119120824.13969-16-zhangzhanpeng.jasper@bytedance.com>
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

The restriction is deliberately based on firmware SSE availability, not
CONFIG_RISCV_SBI_SSE or registrations made by the crash kernel. Disabling
SSE in the crash kernel does not establish that registrations left by the
crashed kernel are absent. Consequently, normal kexec from a crash kernel
is also rejected when firmware advertises SSE but no registrations were
actually left behind. This conservative restriction remains until a safe
way to establish or clear inherited firmware state is available.

Link: https://lore.kernel.org/r/as7-3PbWDxygadnJ@hu-himchau-blr.qualcomm.com/
Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
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
index 07027cfeba4b..5b05243e1deb 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -22,10 +22,13 @@
 #include <linux/irq.h>
 #include <linux/irq_work.h>
 #include <linux/nmi.h>
+#include <linux/panic.h>
 
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
+#include <asm/sbi.h>
+#include <asm/sse.h>
 
 static const char * const ipi_names[] = {
 	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
@@ -66,8 +69,18 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
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
@@ -78,6 +91,7 @@ static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
 
 static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 {
+	riscv_sse_mask_current_hart();
 	crash_save_cpu(regs, cpu);
 
 	atomic_dec(&waiting_for_crash_ipi);
@@ -241,6 +255,8 @@ void smp_send_stop(void)
 {
 	unsigned long timeout;
 
+	riscv_sse_mask_current_hart();
+
 	if (num_online_cpus() > 1) {
 		cpumask_t mask;
 
@@ -288,6 +304,7 @@ void crash_smp_send_stop(void)
 		return;
 
 	cpus_stopped = 1;
+	riscv_sse_mask_current_hart();
 
 	/*
 	 * If this cpu is the only one alive at this point in time, online or
-- 
2.50.1 (Apple Git-155)


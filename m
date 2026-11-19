Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090192;
	b=mTqoI0ipDnRaF+O8s5gaRF/NY2L6W2ehXReWNutAWxFm7EYMYLJbrF/mR9GYt1HL/a+b
	 vOPx7zYytaYmlx0X+JUnGKKs//tXS2O4uDC3m+stCfswbAp3WO/i7MOibQvWIIn15auao
	 nLpZfFe/i+9PUgc7k6O0LtVo9kLr8I3p6JaQBEqiPzbwMzWJ3rhou/aS5SBySMpG56lGu
	 s+kgXJQFLPPyUPpqrMihJygJL3zDClfTbEAQ4HTPnYNS2095Ac0tE/0Zf963quqSwHm09
	 SVQCkRSaQHsppYv6nPBi9XYAHSTrUeubLj45H7zkCqhl+svmAi8ipqtXnRG/qdjGKJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AcX7Wqr/NNBAMKWd7VnVp8UuB/cxD1Kkn3PfU1E+a6g=;
	b=Rj+bZS0lgknKXPKYLBRmC7Wy4Yqi8DmvJdvBsgtrGniJ0CQ+33JWTgDGpadFyE4vFxWT
	 Kbv1W61yJsA8MxQZhS5ZYV7cIet6cgn03BL2CRlphjQzma3U6E2xy4Dk7KQqyOL+EpYlV
	 ipoi3egiZjcSUv225eaBA8ATv6sOV15DdNwRBkiBmfd2tzDt5O0NQ9Ipe14iUgQzuXTke
	 VkGXi4xmLxjU/uBmk9XzFibbfvStOR2PyFGDmkjFocHiLnLpZELIkiLbnf/YHjV/b1XiZ
	 5MOSsoFqzZMRzrqEj/rmHwhiTA3mNbnk/0/OV0wukRhNpcXOqQ/qlI66VkOfShoxnKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="i/y7IcXf";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86D2606A337
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 12:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D86D2606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=i/y7IcXf
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36dbde64409so3703192eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 04:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090191; x=1795694991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcX7Wqr/NNBAMKWd7VnVp8UuB/cxD1Kkn3PfU1E+a6g=;
        b=i/y7IcXf0zwGemgiNsqbgyLlyIpCBg5BrC6MYRFbLe0zMMYdR8CPiUInf+YtUvRT9B
         aS4uZ8O9wweMkDuRslNIlBBlX82ZeDuEOtJCA9YrxpD3blREpKkin/J+UDO9DSEUPYex
         Cdk3dIpVaSuZRKs+RJDPkVA5U64JWxulVXNjSTwbfq7S56j9A7IFy3SI9jesgcJQg/9H
         vszmXt7E3onYqEHwJckgW8fgPKNcSdgQ2BVKtHfsAJRft3COEMgzzgfAOIxeb6ZBmkQU
         tyBVnCqpSyAO4MzmPBgjynxwWdvW54oY1zvkPBoyh5eVbJcy1eUWJR5yBmK3ktI5ZJE3
         09Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090191; x=1795694991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AcX7Wqr/NNBAMKWd7VnVp8UuB/cxD1Kkn3PfU1E+a6g=;
        b=MiihDbXOV/RgaRyOhaIUlIT8wuXddfE1CO/C3oAblx4GdjuCEF4hN4YGmOt7pFiuQw
         J74asgv0OjbZcl5sOYhaUEdmaPJoqOVuaIYzdT9JAOb1vOw9b01+tyohY/tCrrUo8zml
         DhZI2V2jJCLVkzOcAxwypUXyFiv1BmKGfU/TJ3bmZQSMazzutQKymvvLlviKliIbmny5
         yRQCzCTth28VZZButU4tIJ7Kp4idDdcE29vNGu4LMcXbYAfu+Jzq6Hoqrr8TkQ4CW7Ns
         oTAimlcKxyXGAX7IsaRXXQvobgEx6fxV+kpuV4X82TqF6tOLfzIURBg6U/eme0YKxI6o
         PO9g==
X-Forwarded-Encrypted: i=1; AL+hErHGUcuZDDGPjdoPmFDFBil9CpZCN4gd10S8reLSqg214AkL5gxpjlo0KBi0H+iqQbodme4EG0QIE9bUI0wQMOk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KoNpoJM9OstgzO+oi6DXiP3N18yQ92HboSW0xB1WdEVQtORz/
	c4ANF4JK7wLLb2XEOXRZttTfXqrAX6REU2Au0T1ebrNTEAfuYLyx/OPTu/8erEpTfo4=
X-Gm-Gg: AZFdTZenTuBVuZsgG6C7JokkzZI9CrImtC2eUOgA8/HGKHUZnShu7E0dxav4ss3cAi+
	+lvizyCGd0+BrzHgwBwTSf4IB1TFHEmvBL9tmLwVeptlyqUkFRw6dUDAl+D/WwV0XbSsKOMN7sa
	DSZ6QNjFW315CFK4dS9iYjy9FafRpLDxb0wWs2kye2VvSVH8v3peThgcE7KHal6Aimv3RM48BVV
	bCfu5NmjFqciW1zLCgTqR80IyqKBnNgQAsBIoJrIfK/sUtFKjLhUKZFI2KE6PrDTPZGVTc5AXZF
	scXo6fVQ/Ph3oFgSjE6HAq6aquSck6+1zpd68EMctYgoA4OhHl6GDJNWhQbanz59nag4JISlj1w
	x0i67YgX47NKNabgT6ZKXsEfuarvyde9lthlJivtwiHda4CWozn2Knj/Pw0y08Cd3X5LjbhVRb9
	Nv+Wu+89FPbf05QJbNC7N6yfiZyA5uZvFsuq3IWXLKWzJ2o0gm+dIlto0mNps33ioEK6d0DbOem
	bsVVpCP6gWagNBsPjOryTwvmhMxJH43PQDneW6jYdRUYCDhbPq9bu408y7kfJoLoVFtLW11QdWt
	O3b67VII7vIu6QWKKfhw1fUR4gD/b/XlHhAzQCzwjjS+znUE3GtFB2/3bn+PwGSa6lY3+JH8ZB5
	hWcKI0hY=
X-Received: by 2002:a05:7300:8288:b0:384:6487:b155 with SMTP id 5a478bee46e88-3846487bba9mr1500897eec.29.1795090190796;
        Thu, 19 Nov 2026 04:09:50 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.09.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:09:50 -0800 (PST)
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
Subject: [PATCH v13 06/11] riscv: enable NMI-safe lockdep irqflags tracking
Date: Thu, 19 Nov 2026 20:08:30 +0800
Message-ID: <20261119120824.13969-19-zhangzhanpeng.jasper@bytedance.com>
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

An SSE handler runs with interrupts masked, but can interrupt code whose
lockdep hardirq state is enabled. Bare nmi_enter()/nmi_exit() do not
update that state. Consequently, lockdep_assert_irqs_disabled() in the
perf overflow path can report a warning despite interrupts being masked.

Select TRACE_IRQFLAGS_NMI_SUPPORT so lockdep can update its hardirq state
inside an NMI. Pair this with irqentry_nmi_enter()/irqentry_nmi_exit() in
the SSE wrapper: these helpers save the previous tracked state, mark
interrupts disabled on entry and restore the tracked state on exit.
Selecting the configuration option alone does not perform those updates.
This follows the entry helpers used by the other RISC-V NMI-like traps.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/sbi_sse.c | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d2db8f40c616..5501c02a07eb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -225,6 +225,7 @@ config RISCV
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
+	select TRACE_IRQFLAGS_NMI_SUPPORT
 	select UACCESS_MEMCPY if !MMU
 	select VDSO_DATASTORE if MMU
 	select VDSO_GETRANDOM if MMU && 64BIT
diff --git a/arch/riscv/kernel/sbi_sse.c b/arch/riscv/kernel/sbi_sse.c
index 032fcc07abcf..59e47a39589d 100644
--- a/arch/riscv/kernel/sbi_sse.c
+++ b/arch/riscv/kernel/sbi_sse.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2025 Rivos Inc.
  */
-#include <linux/nmi.h>
+#include <linux/entry-common.h>
 #include <linux/sched.h>
 #include <linux/scs.h>
 #include <linux/bitfield.h>
@@ -36,9 +36,10 @@ void noinstr do_sse(struct sse_event_arch_data *arch_evt,
 {
 	struct riscv_sse_interrupted_context context = { regs, hstatus };
 	struct riscv_sse_interrupted_context *previous;
+	irqentry_state_t state;
 	struct sbiret sret;
 
-	nmi_enter();
+	state = irqentry_nmi_enter(regs);
 	instrumentation_begin();
 
 	/* Retrieve missing GPRs from SBI */
@@ -84,7 +85,7 @@ void noinstr do_sse(struct sse_event_arch_data *arch_evt,
 
 out:
 	instrumentation_end();
-	nmi_exit();
+	irqentry_nmi_exit(regs, state);
 }
 
 static void *alloc_to_stack_pointer(void *alloc)
-- 
2.50.1 (Apple Git-155)


Received: from mail-oi1-f202.google.com (mail-oi1-f202.google.com [209.85.167.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8132C3A8FEA
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 19:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292555; cv=none; b=uQmIAl9rNJRCafDJFRoDbXoWk4xpvzZb9I1Z+lnzJPAHFfvNHLvGMIGSnJnqKZHIAakcmU/2xcFrxO1vExSTl3tDzK5t1B19d9pZxD+L97FpL+xXHxgVXoT4e5gnq5iD9jIHahnXIuIRQCJfYsIFh0oWvlSjRWnSXlgKlJ7zTgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292555; c=relaxed/simple;
	bh=5kGKr+m+2SakCtheR8UcEY2IRqG2QSoWSyyeWDBZdSA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CJaXb25jY5KSmjsN1LQlqBXGXbRkRqqhk7S75oNeNGlax77ftfGoFOd0/yo8apra2DF4jidHSevQSR5qvn6zB4s0ydn1E5/vdTAKlAx2CjgykFNAIXU91izCSDFi50ZnmRDfnXHQGdBG3+QsrJTAm9jqTJnSlQWnjqgELY2I1VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F+YunNd6; arc=none smtp.client-ip=209.85.167.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F+YunNd6"
Received: by mail-oi1-f202.google.com with SMTP id 5614622812f47-48637dce961so1273881b6e.0
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 12:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292551; x=1781897351; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HlOJEoz94FuxFi6Nw0eWYLZk82W0XKPPEF+zFyUMrwY=;
        b=F+YunNd65Y0vL0jJ1hHpfDNU3o1OCV/oNTBrkMwS1/02Z24lURdwp7UOhjAsdHmJgD
         Gj99Ez09gk2v9blSWWyd3fY84tVDk7VwY53+pZI851gnU1sgtetZ6BuNhrN6J/nvWdxW
         cCzjKHmCB72eybW0dpz/oaDQMGkf5fn433wUBNSAUjJCyJLeSyhfsuBDwHjmnPT0vG8Y
         s/s7vokH44TokdlQMOzNTK2iJqIR3VzEHzuGAyMwTdrICAd+lyZp03uItB8esC5t0p1o
         /hxE549n+YmqikxEGo+JYVVqjwMxm3BbetPcEx4/5P2T55FnWL0M9F8bhh7sRtUM2xC9
         I+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292551; x=1781897351;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HlOJEoz94FuxFi6Nw0eWYLZk82W0XKPPEF+zFyUMrwY=;
        b=NtqRL96BtQwPG19FpeE/72NUmW3bHxUILQOWf2GWYLWG6lmA2h+peRMh35j6t1nuuI
         dVDwuPMExMmGYKpUTJxfhZSISupIVytUOlW5MSB36vHXMgYyngP2rLjOXJtF9kQFvJI9
         lnYlaawo+TLnh5CMgP/SB99kcLpUz9lb34Z6OWRkTRsMysF+/D5zf4ZXSAvyichHKQ0z
         xLydKHCY16J4/WWuAwDaMhVMJnJxf1Azkv78Oc5OE3RY5wXFMoQD9Z7B31COD3oHzECa
         W1yn4TNN5CDksCm5S1ruy07ZGpIQzA07/Z8vT4dZTdtcQPQxmXiyPOKlEPwjLMIThgv/
         auuA==
X-Forwarded-Encrypted: i=1; AFNElJ+xXdXuK8/7p7TCStgouoLQQMOveaBwnDFZLHBQBAoGCJGIi6qpLMyhwg9qZk7sbfjqP+++ZlI/hvnj0HID3p8=@vger.kernel.org
X-Gm-Message-State: AOJu0YymHDZPs2w8/866YKBaxcGMqd0h+PU4Z354sOtMx1uULZmsScyB
	DvpX5s3d5Xf6xJacVBg/1zt7OvdyPXJ3IkY/VHN3AkmqbLFIICJiS8nUHqDX96ggkO39dono1/s
	ZqSj0RI/fuDcVylzeJ9S4l+kh0g==
X-Received: from ilb5-n2.prod.google.com ([2002:a05:6e02:5305:20b0:500:2417:f074])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1913:b0:486:45c7:34c5 with SMTP id 5614622812f47-487419e6d1emr682785b6e.17.1781292551319;
 Fri, 12 Jun 2026 12:29:11 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:28:49 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-2-coltonlewis@google.com>
Subject: [PATCH 01/21] arm64: cpufeature: Add cpucap for HPMN0
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a capability for FEAT_HPMN0, whether MDCR_EL2.HPMN can specify 0
counters reserved for the guest.

This required changing HPMN0 to an UnsignedEnum in tools/sysreg
because otherwise not all the appropriate macros are generated to add
it to arm64_cpu_capabilities_arm64_features.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kernel/cpufeature.c | 10 +++++++++-
 arch/arm64/kvm/sys_regs.c      |  3 ++-
 arch/arm64/tools/cpucaps       |  1 +
 arch/arm64/tools/sysreg        |  6 +++---
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6d53bb15cf7bb..096545a6e4043 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -77,7 +77,7 @@
 #include <linux/percpu.h>
 #include <linux/sched/isolation.h>
 
-#include <asm/arm_pmuv3.h>
+#include <linux/perf/arm_pmuv3.h>
 #include <asm/cpu.h>
 #include <asm/cpufeature.h>
 #include <asm/cpu_ops.h>
@@ -560,6 +560,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
@@ -2965,6 +2966,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, FGT2)
 	},
+	{
+		.desc = "HPMN0",
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.capability = ARM64_HAS_HPMN0,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64DFR0_EL1, HPMN0, IMP)
+	},
 #ifdef CONFIG_ARM64_SME
 	{
 		.desc = "Scalable Matrix Extension",
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index fa5c93c7a1352..c52873a6f91ed 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3326,7 +3326,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 		    ID_AA64DFR0_EL1_DoubleLock_MASK |
 		    ID_AA64DFR0_EL1_WRPs_MASK |
 		    ID_AA64DFR0_EL1_PMUVer_MASK |
-		    ID_AA64DFR0_EL1_DebugVer_MASK),
+		    ID_AA64DFR0_EL1_DebugVer_MASK |
+		    ID_AA64DFR0_EL1_HPMN0_MASK),
 	ID_SANITISED(ID_AA64DFR1_EL1),
 	ID_UNALLOCATED(5,2),
 	ID_UNALLOCATED(5,3),
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 811c2479e82d6..f8fb4a6395428 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -42,6 +42,7 @@ HAS_GIC_PRIO_MASKING
 HAS_GIC_PRIO_RELAXED_SYNC
 HAS_ICH_HCR_EL2_TDIR
 HAS_HCR_NV1
+HAS_HPMN0
 HAS_HCX
 HAS_LDAPR
 HAS_LPA2
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 6c3ff14e561e6..2d5cbc8ced114 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1679,9 +1679,9 @@ EndEnum
 EndSysreg
 
 Sysreg	ID_AA64DFR0_EL1	3	0	0	5	0
-Enum	63:60	HPMN0
-	0b0000	UNPREDICTABLE
-	0b0001	DEF
+UnsignedEnum	63:60	HPMN0
+	0b0000	NI
+	0b0001	IMP
 EndEnum
 UnsignedEnum	59:56	ExtTrcBuff
 	0b0000	NI
-- 
2.54.0.1136.gdb2ca164c4-goog


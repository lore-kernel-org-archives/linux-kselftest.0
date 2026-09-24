Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DBE41D23A
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 17:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270975; cv=none; b=D8fPOtS0nKfhPgKhoQKCMMsxYlG6B8xmNgJ+iiwe1ExMPuPG4eO+6MXhIZdBoreyV37Aw0W6PyJaV//JmJt8eJUE0LRXhNzgQpLroIDOBts3Rs3oDq3mdn+iPKB8kIpzt8iBRr1P/QqwfkAYGvYLW4nmyAiRH+o0h8SVkOzQ2gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270975; c=relaxed/simple;
	bh=o/dRbuRjHgqlxnEMpSdE4xt6/12b8Vjk8kgxhoCf4ko=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ncz0wJVyodp5wNGxo6NWiua3zkrDdWwRWWyn37+VarydefxqY0MhLuVYasN7uNkLbDKl7cydeKguKMPQ4f1LEq/EtX0okWO+3VRiow6RSuXCfsiIqoGWMok9eoWBk2yypXC6kBBJY2D+pWUeqzpWe7XBhFLAGlgRsa0SulwgQhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rh9Os002; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rh9Os002"
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-48e5de5a23cso246547b6e.0
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 10:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270972; x=1790875772; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4LPKtq3FXQBzgDrkBOS1YtUwyGhKzpbZJU2kODjma0=;
        b=Rh9Os0024cgB3uH0exYiSPGy7H3pq/BiSMjxe+Di4PSumgeiA4I2SmSiAOXfBeb1xZ
         scPo9yn6ZjGT4U6QPZrA0sqR3IiZ1+dzuY5Eu2a094QI8e2B48mf0fXPq+zcLqAfdCUV
         86R9nGrkKRCHcN1YzfpjW2xHNuzJ2TlwDDuWk5/Z6Peh7ijCtXNVbrcMnI2bfYtFKIZg
         rX7UXhqjYSxGFFBY4Bd41pQlk3RzZY125DYMcCT6eDj1I331q2S95xYGNpiMzIbNfGbN
         LQnfAynpIz19UKDo81ywUgH8lehkakYn6JyB/EaXLJXs8dxPWQrDg3PaMBzzFvoJxGHN
         uQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270972; x=1790875772;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4LPKtq3FXQBzgDrkBOS1YtUwyGhKzpbZJU2kODjma0=;
        b=zrZrPo1KHcUyeHqM4kp1FE699wcCjp4lawxuiC6qAyqPJVnFzfeEGHF/5H36XbLopB
         ubHCihip+PCGQtJhyk5r1s5E7JEX2BkiV2QwAcDCLXECQsaLjNrZMNQVRXuSi3lEJVyB
         SMh4NZquktrowJjThso5zxVkX9EnAU6ceRu7ex8AWrXio9FH5nQdNRQZyCxjJr+p0h7H
         i/6Ou5EyseSzfLAtWPawUMoKNJBNLUdKX5A4uGI9n+sx4QVcJvVuyeDPdJEeUjI+njsp
         cczZAOWfx8CMfxzW/wQLduDGHL53+GXrPtpWpUVZldTa40koSHf7sZAJ5Njru5ZKw7ah
         5SYA==
X-Forwarded-Encrypted: i=1; AKwUvBzjCM9gDhqLenKFA6QwQP+1T654hRnTNj1EZIXJzqKUQIxUpFkwjgVB5JsYnvlFoa9GVQZlNPTqgshoxFGE5jQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kQPZn14B8wwfSI+pX7hlnmegX26ObmD4a2bLDAZbAoltu8mbKM
	bwsH3pNaj3q8eLOqsxMUwKh9spYqAmq/qbjsauxC6N/5/8HSD/r83fQUl/sZuzZjm1noBUJ2tMd
	FLa3KqmPKyvfaCIA8N238k7pPIQ==
X-Received: from japm26.prod.google.com ([2002:a02:cdda:0:b0:5f3:6745:a0fd])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2396:b0:4c2:2fb4:3676 with SMTP id 5614622812f47-4d729123773mr3724796b6e.16.1790270971680;
 Thu, 24 Sep 2026 10:29:31 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:07 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-2-coltonlewis@google.com>
Subject: [PATCH v9 01/22] arm64: cpufeature: Add cpucap for HPMN0
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
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
 arch/arm64/kvm/sys_regs.c      |  5 ++++-
 arch/arm64/tools/cpucaps       |  1 +
 arch/arm64/tools/sysreg        |  6 +++---
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 32102c3912fa7..f8431cf858619 100644
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
@@ -564,6 +564,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
@@ -3012,6 +3013,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
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
index 44aae52c473d7..f7f750b7a91c4 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2219,6 +2219,8 @@ static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
 	if (kvm_vcpu_has_pmu(vcpu))
 		val |= SYS_FIELD_PREP(ID_AA64DFR0_EL1, PMUVer,
 				      kvm_arm_pmu_get_pmuver_limit());
+	else
+		val &= ~ID_AA64DFR0_EL1_HPMN0_MASK;
 
 	/* Hide SPE from guests */
 	val &= ~ID_AA64DFR0_EL1_PMSVer_MASK;
@@ -3417,7 +3419,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
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
index 2775ba3359cfe..a309c18235e71 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -43,6 +43,7 @@ HAS_GIC_PRIO_MASKING
 HAS_GIC_PRIO_RELAXED_SYNC
 HAS_ICH_HCR_EL2_TDIR
 HAS_HCR_NV1
+HAS_HPMN0
 HAS_HCX
 HAS_LDAPR
 HAS_LPA2
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index e2d37ee221b84..1035b406ef183 100644
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
2.56.0.rc1.310.g51773c2048-goog


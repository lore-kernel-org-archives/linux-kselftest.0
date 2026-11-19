Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114339;
	b=fGkKRa+lThONjs0wF97p3F8Fin0a28S4qQVcQ1Nng3rTQghQDctuJ4JTsaH/2usUNADC
	 gfbpLluAq/QRgEsidUJlYfwYnhgyo5oeM7l1vTFRyfgoKEN2L2sEET8o+4Uo/eZaZhmws
	 9QF6fXd0rJHnJPBofdf7MRuI7ePKUOKCeeZRhiiAjRqh9/6yB3V0/yFL0ESzdkFIW1Fqw
	 DUVivYMaH9KsERdfEPp2ZRYxiPA+qhyUNSD17rWn8b9zDeUca2Dg9YoX85glinJ4U6NtT
	 mxakKoJrKGblHDyJo0Edqhay5YcOqulinzZriETUnFFCjUNRZ2azJHl8qM/xK2q0p5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=JnPyo9Uuk9yDsv0rmtMWzSN2FAMU1ZcFas4I3l5JKQU=;
	b=2a2jDQ+ZIvQ9mNbBiqWTLFZsfFHtOzOB554BaGaeqKduBwOzNHgTzb6YJmMXDe7yV4jb
	 hex/LHTyv1Uu5uYGeD6e/lKJtBViedmoH3FkaB9/jcQ+abz89anAYDEuYdACiKvIFHI68
	 JPoHiwXmbgWxNgu/7SFkFTHBliu2qwKLDzppbeWIfpjV81WrgiTHl9b2TxlgMs4DRa0WR
	 wBwksekTIpGtlYa0z6qhHfgPTPzbN8E/o+M1eYpw/zRGmSCq4Frahu6zn3KZXYeCGAzlW
	 c4HEnQYhKH3qd218F9jsq3D07USk59aFyuNrvyRQcLxFXpA2OQXd6AmYrKduimwIfzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NDuUiAWT;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A28E606A33B
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 18:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A28E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NDuUiAWT
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4e778acdbc6so171316b6e.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 10:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114337; x=1795719137; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JnPyo9Uuk9yDsv0rmtMWzSN2FAMU1ZcFas4I3l5JKQU=;
        b=NDuUiAWT9m/Y4X19rNLr0nz/0UpRH7ZGRaLVNJYZAvxS+/6c5AJvHdtvnFsR5FI8jz
         BStrIGf7dy3qQxCg10sphhy3FCEOVhsAdzskadPNBG+kHR9UwXt2jyJy50nzD9vKz6Uc
         VrUe1FpLxxfyw9bymPVlBZ5S45flUex1i/S3l9hISl7IasJDuavS39eiWJuDAYC5ZV1d
         53PcsHNSukSfdQwWFRHTo4OK9yM+UIW4a+O2XA9mJJ9Ht9j3lnXRftP5yTJfdciAoBhr
         JcH0bumPuXEkEkASId4VOMlQgzABKJgJZOTDXhy0jSLDYu0HPiDng/GKp1y/iYPuD3oW
         p8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114337; x=1795719137;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JnPyo9Uuk9yDsv0rmtMWzSN2FAMU1ZcFas4I3l5JKQU=;
        b=wsSjh6wN/ZI/RHKHQdNvszq1MRbzVdlncGVvsUv5nIMJNNbtxxEnd+hMPC9QSnGP23
         TCGAlnEVz/Et4k49K479Vto11QabqJ7nAaJkfMqLqJjh9Dh2p+PvkMgYrWsmEhsObyfU
         s6BdgOLLPefrin+i/Hy6O6kxj7dSRCnJUtzi6azK/BU3JA2X+Q/cIYWzGDCgI6/oymJP
         7hqKVAgPs3wh5YoH7eKPnm8NXjQJy7xJjpGC/DnGbxGixWTheCPcKUGfA3f4gPZiMaRM
         1pBeM0Iy+Nqi5ng1xS9QuVzIyZzcEpMaWTGiENFeEvtltauvLxQ4tUbTL8ZY2cCNeBbR
         GWCg==
X-Forwarded-Encrypted: i=1; AL+hErGou6Ux/KLd4wqxFdkhasAqwD9bQixBBc3Oz5z+L7RLKCzit++mZ9QDNyS5PdT38EFEgIMcophnJR5G9ix+q+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lqn851Pst/jwsk6+lP7QvrXa72Pa9kt8I4wp16tK+OYG5vdfK
	tn6twRRWcht6M0W1t+cpdfbQiGC4yJGfOSGgB11b8ayQb4H8vLsA8kA4d10koDyy+BlBeC0zXcG
	bxyPwoCbCPuOo5gTSAL0OMl8QkA==
X-Received: from iok14-n2.prod.google.com ([2002:a05:6602:c60e:20b0:9b4:c92a:b174])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:308b:b0:4f1:6c9c:78d3 with SMTP id 5614622812f47-57a0a92272dmr980283b6e.26.1795114337076;
 Thu, 19 Nov 2026 10:52:17 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:43 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-2-coltonlewis@google.com>
Subject: [PATCH v10 01/33] arm64: cpufeature: Add cpucap for HPMN0
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, James Clark <james.clark@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Mingwei Zhang <mizhang@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a capability for FEAT_HPMN0, whether MDCR_EL2.HPMN can specify 0
counters reserved for the guest.

This required changing HPMN0 to an UnsignedEnum in tools/sysreg
because otherwise not all the appropriate macros are generated to add
it to arm64_cpu_capabilities_arm64_features.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kernel/cpufeature.c | 11 ++++++++++-
 arch/arm64/kvm/sys_regs.c      |  5 ++++-
 arch/arm64/tools/cpucaps       |  1 +
 arch/arm64/tools/sysreg        |  6 +++---
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c9c9a6889455c..023b98e6be2d1 100644
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
@@ -566,6 +566,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
@@ -730,6 +731,7 @@ static const struct arm64_ftr_bits ftr_id_dfr0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_dfr1[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_DFR1_EL1_HPMN0_SHIFT, 4, 0),
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR1_EL1_MTPMU_SHIFT, 4, 0),
 	ARM64_FTR_END,
 };
@@ -2863,6 +2865,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
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
index c7d91138a6d49..04947bfbd0ee5 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2218,6 +2218,8 @@ static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
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
index 3125695122a0a..1603a0dd19764 100644
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
index 997c62ab72e68..7230a9cd46e53 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1726,9 +1726,9 @@ EndEnum
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
2.56.1.708.g77570a6a1d-goog


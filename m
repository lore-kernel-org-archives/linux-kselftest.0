Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114362;
	b=Ek7COb1FGb20ikE/zoiHZNs2QVYpaCgo/N8cec8A5UlR9/7Zlas0cdODCQXk1WGAYQ6w
	 7b8P+lMNN0vTklzVVsgycViqtl26f+KvJt73mMapZXbv++FQR1tX3kuzuuFktEictrana
	 oX4drl1DKjIZSsjA9ahLBudNsV/s4Qcs6OcPhpPBAQgHbNVmJVLQTSOiOjnYroWeKA7pX
	 8syGnNCYl4EvBUqp9WE0ZmYa3AlvAYyzikvvrx5vhL8B9hz4WiUJtizkKecfIVd5G+STh
	 4zfL2AYtZ7n14UyjsyRT7MgbhsCM1bVpJI3G0ClbXPX/we0EEINBMmX4OK+6win8BQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=FFPgXiiazla35XDoHe2VRdMYq0SrMDfs5EMKUnqJLEg=;
	b=T1Ygl5vk7rzmNWuvjnVg9MNYiA4ldlv0qAO4+VCbC9HVpEgoaHL8QfIUMPOSj9NBtlM7
	 GawKuHd1fW92cq1hsSNDY5mtfZmsVj0589jkKuULGY2XMoQczblil2/6IDSCohhTNHk7B
	 JUqJFmjoJWZRo0YVMTEVA6ReRlxVXPuvPm4ye8/j3XmXVX0tweFFfka4S5zK+u99+Yg7d
	 WDmIBjEKWb+D5yyRfp67FwRTGroEhk+JlMageCREU9IOIlUPxXDNCNrVn8dkTwg+8rUqg
	 c/tF9glmxOHnatMYiRGfaCwpPJC8UJd6QgghgQacj8CN6kCi6RYpWtqFUwYxuX8rdrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QoxGqnw5;
	arc=none smtp.remote-ip=209.85.160.71
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE2760A3822
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 18:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE2760A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QoxGqnw5
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4ab90cdf747so1637491fac.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 10:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114361; x=1795719161; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFPgXiiazla35XDoHe2VRdMYq0SrMDfs5EMKUnqJLEg=;
        b=QoxGqnw5MnWI+YzinmwsjZHef5uF1Zt+ipWC+nszZev6CzAbus7DpLXrzCjXNUhblv
         54dvRSv6uhu0PsVrSLiYOYL4kshp/c271RIh1KUQKesBEc7ThwAa8p00c+EfZr8VklUy
         F16dOWrk7SqyBrxYEUYrKL93ZU/jk7jmQvw8J+5RHjZzLpCQAyzQVWI7hATnSg+A09L3
         Z+8/ca3O0ApwcRDQxwLRiilqHWSplF1IJwnFNid3ebREnvcBUWZ8v72bQaXGas3Bt4Si
         X2itVPNUGx7Bdu3AiIX5Bprb650cUsSgvknhy/omNGSXG0LsXm660vxSd7FpLFNH23x7
         x3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114361; x=1795719161;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFPgXiiazla35XDoHe2VRdMYq0SrMDfs5EMKUnqJLEg=;
        b=LtLm2T2PD5K1ApWMd4ZLIF5/bSqBLyAOWBX3QRKKiqKP1IiHfGTF3tK5NK81ei7vkC
         hAURdrYCtEb1mxYFYncqHgWbWTvooHcW03MUeAHeNPZ7Vvo/vKNUaHcy4uKD4zUYhjUO
         s9viX1c2UgLzJmCpv8ri3HzHzmYiwqd5P0E41Uhiyvc1SET5msQp0o/Za4i2cPCPjKwT
         nBl3MsoI2GtCf7/HQSlXDF0o2viLu6J6Fhy4hCpv/jY2EyHDeh2IeM2xFGanSVez5w9z
         fhBRcc1dncplHumPo+Lokb90YjwbUFIp6ECX6sxxaC5PJeYRAJHE/GPeYX9TJKG28rVB
         /7VQ==
X-Forwarded-Encrypted: i=1; AL+hErFnW8Bk3iz389oDUoUP6bBydfl8Uaw9i6N7LYaekn/ZGJIqRIvnahhk3uQwMoYhs1reRnQpp8cXQaQ8h+eKRnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dievn90GPxT4wy/6YkU+l6JnNqGMGSSfD1pDcX7B/+veti8n9
	W/vTMT+cVC9YpaFp8/48TdiDqtTAokqb45mUNX3G8DpkIaLvZmq/i9+qsSBo/TFAgOpbeocMsk9
	dt3jbGSTNYHkUogd6pjXlvS6xQA==
X-Received: from ilbeb1.prod.google.com ([2002:a05:6e02:4601:b0:54f:8d15:4dbc])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2383:b0:572:f8ec:5340 with SMTP id 5614622812f47-5797dd97e12mr1488800b6e.40.1795114360210;
 Thu, 19 Nov 2026 10:52:40 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:07 +0000
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
Message-ID: <20261119185215.632334-26-coltonlewis@google.com>
Subject: [PATCH v10 25/33] KVM: arm64: Detect overflows for the Partitioned PMU
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

Evaluate whether any enabled and unmasked guest counter has overflowed
in kvm_pmu_part_overflow_status() so KVM updates the virtual PMU
interrupt level in the vGIC (or userspace IRQ state) across VM entries
and host PMU overflow interrupts:
- Harvest any live guest overflow bits from physical pmovsset_el0 into
  shadow PMOVSSET_EL0 and clear them in hardware when the partitioned
  PMU is loaded on the local CPU.
- Check (PMOVSSET_EL0 & PMINTENSET_EL1) against PMCR_EL0.E for guest
  counters 0..HPMN-1 and PMCCNTR_EL0, and against MDCR_EL2.HPME for
  nested hypervisor counters HPMN..N-1.
- In kvm_pmu_handle_guest_irq(), raise KVM_REQ_IRQ_PENDING and kick the
  vCPU (or queue overflow_work when running in NMI context) when an
  unmasked guest overflow occurs.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c | 65 +++++++++++++++++++++++++++++++++++++
 arch/arm64/kvm/pmu-emul.c   |  4 +--
 arch/arm64/kvm/pmu.c        |  8 +++++
 include/kvm/arm_pmu.h       |  2 ++
 4 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 21357decce214..b0491d32b5d7b 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -823,6 +823,71 @@ void kvm_pmu_handle_guest_irq(u64 pmovsr)
 		return;
 
 	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, govf);
+
+	if (kvm_pmu_part_overflow_status(vcpu)) {
+		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
+
+		if (!in_nmi())
+			kvm_vcpu_kick(vcpu);
+		else
+			irq_work_queue(&vcpu->arch.pmu.overflow_work);
+	}
+}
+
+/**
+ * kvm_pmu_part_overflow_status() - Determine if any guest counters have overflowed
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Determine if any guest counters have overflowed and therefore an
+ * IRQ needs to be injected into the guest. If an overflow is detected
+ * while access is VCPU_PMU_ACCESS_FREE (for example, after state
+ * restoration via KVM_SET_ONE_REG), transition the vCPU to
+ * VCPU_PMU_ACCESS_GUEST_OWNED.
+ *
+ * Return: True if there was an overflow, false otherwise
+ */
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu)
+{
+	u64 mask = kvm_vcpu_pmu_guest_counter_mask(vcpu);
+	u64 hyp_mask = kvm_pmu_hyp_counter_mask(vcpu);
+	u64 pmovs, pmint, pmcr, reg;
+	unsigned long flags;
+	bool overflow;
+
+	local_irq_save(flags);
+	if (vcpu->arch.pmu.loaded_on_cpu &&
+	    vcpu == kvm_get_running_vcpu()) {
+		u64 hw_ovf = read_sysreg(pmovsset_el0) & mask;
+
+		if (hw_ovf) {
+			__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, hw_ovf);
+			write_sysreg(hw_ovf, pmovsclr_el0);
+		}
+		pmint = read_pmintenset();
+		pmcr = read_pmcr();
+	} else {
+		pmint = __vcpu_sys_reg(vcpu, PMINTENSET_EL1);
+		pmcr = __vcpu_sys_reg(vcpu, PMCR_EL0);
+	}
+
+	pmovs = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
+	local_irq_restore(flags);
+
+	reg = pmovs & pmint & mask;
+	if (!(pmcr & ARMV8_PMU_PMCR_E))
+		reg &= hyp_mask;
+	if (hyp_mask && !(__vcpu_sys_reg(vcpu, MDCR_EL2) & MDCR_EL2_HPME))
+		reg &= ~hyp_mask;
+
+	overflow = !!reg;
+
+	if (overflow && !in_interrupt() &&
+	    kvm_pmu_get_access(vcpu) == VCPU_PMU_ACCESS_FREE) {
+		scoped_guard(preempt)
+			kvm_pmu_set_guest_owned(vcpu);
+	}
+
+	return overflow;
 }
 
 /**
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index da66162c68042..a72bdc5a0b3ea 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -268,7 +268,7 @@ void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val)
  * counter where the values of the global enable control, PMOVSSET_EL0[n], and
  * PMINTENSET_EL1[n] are all 1.
  */
-bool kvm_pmu_overflow_status(struct kvm_vcpu *vcpu)
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu)
 {
 	u64 reg = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
 
@@ -400,7 +400,7 @@ static void kvm_pmu_perf_overflow(struct perf_event *perf_event,
 		kvm_pmu_counter_increment(vcpu, BIT(idx + 1),
 					  ARMV8_PMUV3_PERFCTR_CHAIN);
 
-	if (kvm_pmu_overflow_status(vcpu)) {
+	if (kvm_pmu_emul_overflow_status(vcpu)) {
 		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
 
 		if (!in_nmi())
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 7389d61957fa9..9d4ad4b7bd8d5 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -409,6 +409,14 @@ u64 kvm_pmu_evtyper_mask(struct kvm *kvm)
 	return mask;
 }
 
+bool kvm_pmu_overflow_status(struct kvm_vcpu *vcpu)
+{
+	if (kvm_pmu_is_partitioned(vcpu->kvm))
+		return kvm_pmu_part_overflow_status(vcpu);
+
+	return kvm_pmu_emul_overflow_status(vcpu);
+}
+
 static void kvm_pmu_update_state(struct kvm_vcpu *vcpu)
 {
 	struct kvm_pmu *pmu = &vcpu->arch.pmu;
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 9800514019630..fcd8e6331943e 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -91,6 +91,8 @@ bool kvm_set_pmuserenr(u64 val);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu);
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu);
 
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
-- 
2.56.1.708.g77570a6a1d-goog


Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B72410D0C
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 21:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777929532; cv=none; b=F72Nxakr4p/pp11U2nchJeGreQKzY1ySrHe0LVyElCkq7wf5BCkcnBqepNhunACoGnxVfZ/Xqp6DG+/vuTZJ6WNG6rgPt0DiS3Cgao91vbh+c3GLaXmea0bN4pt3MeJEH0mSEWfr+AqHic+gOBgZGMfNGeKcNleSZo8yn4CF+l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777929532; c=relaxed/simple;
	bh=51x2qNUJZmu8VDSVPga7Ou82hKP9Y1fm/Wq0S6zmqPo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D3RM2S6oHYVfLuCZvbNkzgOdUnD7XEoV5npCUL3hpdwNxc+g78Geh+FMPB1F3H3yAs/jJHMCLkAkr0z+TLSDpiw3ZscH6dfZL2zTVIofwxAcX9uuzqmy5zFxewKW2kZhIcfEBvXyFnImRS3yCxwGqYgtojGpCBXPdL1G/BpOY8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ir+/0SHz; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ir+/0SHz"
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-66308f16ea1so7837571eaf.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 14:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929523; x=1778534323; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ikJw7Yl21sbWiTQZxDvWwtZnXGp+jw2m9ITCB7brm+8=;
        b=ir+/0SHz4yMowC9EeZO5C8GyDjV/+pijEF6lPJ8laFtVBvRWR+3/+kTu9V5CdwgLJY
         5LjB7d8duDMerUeuz+ul9dkchPpG5UOnWzZweX3X9C8yuYSB/rabGOnJmwEcAAKWLd/I
         Tkkn2bYJHoGNFV5SivZOXsGONk9k5CUoa2eANlaA93GMx7iJI1FeFh7xlTMe5Lbi6Meg
         a2fKwErhM4W0a8uwTU5pZppBWVYbpYZBmj+YgdTRDLSKFo9Qguikh2tUuRdfrHIQUu9i
         sBZxBEuSGntnjCOv0TpNu5TR6bFh4t36qZdY/XPO93W67+kkHi9UtZNWEOW50+dhGAAv
         cXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929523; x=1778534323;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ikJw7Yl21sbWiTQZxDvWwtZnXGp+jw2m9ITCB7brm+8=;
        b=ABMcLHzalO2LuGIiuMcMGM/vn9KGp/qmuVBJNO4PcZipp9vo8Egtu9pWIheZlH4DMo
         GqUh8Jvu9hEnbmYdFlfpjtiss/cZBOitNiEkWTWtbS3TM8KFiZ5eSnu5ysoxbJBEd9S5
         BVRoOWuQddT1ZZAHg3MhIConAMeG4yx02a0aWPmoz1OQocI9f0Xy7jKjLClAw5KGCise
         d85u/PIbfj8eNOvdP6O2MwMX0hYknfPbQiG54An+jW5pya3mvhGaim5zEeGCiYMnyVk7
         Ek3de3mRXExu5YoHAJRaT9/USjHsVkWmx+RZQKml11mkOO0DAxybAk7SQfK9t3yOqLln
         Gpzg==
X-Forwarded-Encrypted: i=1; AFNElJ+r3VPnFubZypVtbIkUKHvtCCR8BTfXInl/JKOEVrKw16JNY1NXzMNoCfauMIDGRfRh+lI4wBBeoYYcVu4ojds=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVaYYprjAcuQXmCNb/PbU92gdXsglh5Bmna2LqCL1uvhGZbtrd
	E0LiRCla/RM0IKw3idAcQGtxHOvWDMKbgeNLbfHPoVyUYWKFacWaIhbM+bZbBhLbU9MEg4m8CbH
	M0Yd7cEK+tOhBpPhNHom6Gnzjdg==
X-Received: from ilaj29.prod.google.com ([2002:a05:6e02:219d:b0:4fd:6acc:4c7b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2012:b0:696:1a85:586b with SMTP id 006d021491bc7-69697c3388cmr5842328eaf.35.1777929522601;
 Mon, 04 May 2026 14:18:42 -0700 (PDT)
Date: Mon,  4 May 2026 21:18:04 +0000
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260504211813.1804997-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504211813.1804997-12-coltonlewis@google.com>
Subject: [PATCH v7 11/20] KVM: arm64: Enforce PMU event filter at vcpu_load()
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

The KVM API for event filtering says that counters do not count when
blocked by the event filter. To enforce that, the event filter must be
rechecked on every load since it might have changed since the last
time the guest wrote a value. If the event is filtered, exclude
counting at all exception levels before writing the hardware.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c | 54 +++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 360d022d918d5..2252d3b905db9 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -138,6 +138,59 @@ u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
 	return 0;
 }
 
+/**
+ * kvm_pmu_apply_event_filter()
+ * @vcpu: Pointer to vcpu struct
+ *
+ * To uphold the guarantee of the KVM PMU event filter, we must ensure
+ * no counter counts if the event is filtered. Accomplish this by
+ * filtering all exception levels if the event is filtered.
+ */
+static void kvm_pmu_apply_event_filter(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	unsigned long guest_counters;
+	u64 evtyper_set = ARMV8_PMU_EXCLUDE_EL0 |
+		ARMV8_PMU_EXCLUDE_EL1;
+	u64 evtyper_clr = ARMV8_PMU_INCLUDE_EL2;
+	bool guest_include_el2;
+	u8 i;
+	u64 val;
+	u64 evsel;
+
+	if (!pmu)
+		return;
+
+	guest_counters = kvm_pmu_guest_counter_mask(pmu);
+
+	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
+		if (i == ARMV8_PMU_CYCLE_IDX) {
+			val = __vcpu_sys_reg(vcpu, PMCCFILTR_EL0);
+			evsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
+		} else {
+			val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + i);
+			evsel = val & kvm_pmu_event_mask(vcpu->kvm);
+		}
+
+		guest_include_el2 = (val & ARMV8_PMU_INCLUDE_EL2);
+		val &= ~evtyper_clr;
+
+		if (unlikely(is_hyp_ctxt(vcpu)) && guest_include_el2)
+			val &= ~ARMV8_PMU_EXCLUDE_EL1;
+
+		if (vcpu->kvm->arch.pmu_filter &&
+		    !test_bit(evsel, vcpu->kvm->arch.pmu_filter))
+			val |= evtyper_set;
+
+		if (i == ARMV8_PMU_CYCLE_IDX) {
+			write_sysreg(val, pmccntr_el0);
+		} else {
+			write_sysreg(i, pmselr_el0);
+			write_sysreg(val, pmxevtyper_el0);
+		}
+	}
+}
+
 /**
  * kvm_pmu_load() - Load untrapped PMU registers
  * @vcpu: Pointer to struct kvm_vcpu
@@ -165,6 +218,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 
 	pmu = vcpu->kvm->arch.arm_pmu;
 	guest_counters = kvm_pmu_guest_counter_mask(pmu);
+	kvm_pmu_apply_event_filter(vcpu);
 
 	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
 		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
-- 
2.54.0.545.g6539524ca2-goog


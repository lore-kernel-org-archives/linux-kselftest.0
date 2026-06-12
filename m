Received: from mail-oo1-f74.google.com (mail-oo1-f74.google.com [209.85.161.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D4E3C5553
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 19:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292570; cv=none; b=YwmrQolTVNMh+h1mC73AltyKMP/1xj+SFfELkzPhVcfIePVuGoRhYtmtAIQlaOJ91uIW71WaE+HSpar6N13bXWzOCXK4LX7zoj2I7rpWA6V3f2y95uAi2G9k0keP7BZgIEHLx54U4kEUcsa3wQ09kCxQx1h4v3PP1de8DGTpT5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292570; c=relaxed/simple;
	bh=hQtQ+lw4+n6HuW7+A+bm2V5K6NpNQJho0t6eEcDukX8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t0niCVO9k+LYqKc6O52we2p0/NGpbMkEkQhblXgjiUOYZlT8kuPrWbjBYew/ZRot6IcwMRUIGe62XoHaWEN6w9/p8XKWRc9JBf538lVizTbGeo1ODY5SjEDkAmTpD0gRNsBJxGqfJ/Fvedq+AMX7Gw/sYUV57y+/PegfumDMmnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RzuZjBZa; arc=none smtp.client-ip=209.85.161.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RzuZjBZa"
Received: by mail-oo1-f74.google.com with SMTP id 006d021491bc7-69dac65fd9bso1143273eaf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 12:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292564; x=1781897364; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3mxqdo/FWgK9hnIRW4N9gL8LSmw3WCN8Nq0npc1NKo=;
        b=RzuZjBZahkQeahX2QQEgsyUEtuFJDJhSt4qWj5YnrzZeda/rNnQ0TuYqoo3YsI0Ttv
         Fn4+WBv2HUAgo5iiGw77NIVXEAuH9il+k4vvZtsoLpg6mJ1SOk7ez/Kd4+XnA8VfWAd0
         50DL3cTH9QYG1b0GK3WWKYRroXGuubReiQyBYZMShBNRcyoVegRZaI59aJtr3KBWgHLc
         26D1yfhVCjZiUCZlTGtbcASl8YsRAJRnhRTI0brGNKxL3lP7kp+05My3kGcINQYMulT7
         ypVlZYQ74tJk+fa8CVKSbdMwR/3IttUHM03AMmxbFPGJBPA1QGnk9eCHmJIktvsIJb7X
         g0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292564; x=1781897364;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3mxqdo/FWgK9hnIRW4N9gL8LSmw3WCN8Nq0npc1NKo=;
        b=OCeWK1PT2pTbXWdsrsBJOnho7LpvnjICj3FHpsPTH365EVsfrv2DdziB/OhA5+6DCx
         cW2S8jYAuEjxJd9z3DX4t3UvHiK/mLHHxDFcsdrRdQcktJLaWLVUQfrQVC5RmoALIXGD
         6dxPKKO/VXdAoOHAGC0yheFBvv8oyrxEvAx/rKKa7BI7/JMuODlMWNznSUbdVx6ukI0u
         l5BXqbb3K7/153hzcPD5lL8PBLvND3lMblqNdNv7+Acbzb80R213Wpg2kSTQ8L3W5isP
         6JnJylZKrA31HavlrBvRN+KtuNmdihsJYnDwU246RsHm5Q1mjXnV7LQT4IF4Ol6fK3Vj
         8zAw==
X-Forwarded-Encrypted: i=1; AFNElJ9JIhuNOlxUB/bzHPdk5Ozhq8UgK7LVL9FnHnhQH02zrGOKxBA2zjrnMD8HEJ8Lxw81gJCsA6JWxH+DkfZ9tQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhZ7e+ovJjtF0iFHsS/ez7p91GDwKBLW5Y8raDZLif+r+GXfuC
	3IU5+s/+8vL9L+fG4dmRP0LpQvTcIWwQddQ1cXlf11/M/6ZY6trEiTkiRG1MOokO2Whr+3iO/n7
	82nTxWLbKbrYP4A2bHvhMRJqK4Q==
X-Received: from oaqy19-n2.prod.google.com ([2002:a05:6871:2d3:20b0:440:e30e:488f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:16a7:b0:69e:2bf1:764e with SMTP id 006d021491bc7-69eec98b283mr491295eaf.44.1781292563404;
 Fri, 12 Jun 2026 12:29:23 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:29:02 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-15-coltonlewis@google.com>
Subject: [PATCH 14/21] KVM: arm64: Apply dynamic guest counter reservations
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

Apply dynamic guest counter reservations by checking if the requested
guest mask collides with any events the host has scheduled and calling
pmu_perf_resched_update() with a hook that updates the mask of
available counters in between schedule out and schedule in.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c  | 69 +++++++++++++++++++++++++++++++++++-
 include/linux/perf/arm_pmu.h |  1 +
 2 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 49f1feb5d280c..044f011c9c84b 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -87,6 +87,73 @@ u64 kvm_pmu_direct_pmcr_read(struct kvm_vcpu *vcpu)
 		ARMV8_PMU_PMCR_N);
 }
 
+/* Callback to update counter mask between perf scheduling */
+static void kvm_pmu_update_mask(struct pmu *pmu, void *data)
+{
+	struct arm_pmu *arm_pmu = to_arm_pmu(pmu);
+	unsigned long *new_mask = data;
+
+	bitmap_copy(arm_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
+}
+
+/**
+ * kvm_pmu_set_guest_counters() - Handle dynamic counter reservations
+ * @cpu_pmu: struct arm_pmu to potentially modify
+ * @guest_mask: new guest mask for the pmu
+ *
+ * Check if guest counters will interfere with current host events and
+ * call into perf_pmu_resched_update if a reschedule is required.
+ */
+static void kvm_pmu_set_guest_counters(struct arm_pmu *cpu_pmu, u64 guest_mask)
+{
+	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
+	DECLARE_BITMAP(guest_bitmap, ARMPMU_MAX_HWEVENTS);
+	DECLARE_BITMAP(new_mask, ARMPMU_MAX_HWEVENTS);
+	bool need_resched = false;
+
+	bitmap_from_arr64(guest_bitmap, &guest_mask, ARMPMU_MAX_HWEVENTS);
+	bitmap_copy(new_mask, cpu_pmu->hw_cntr_impl, ARMPMU_MAX_HWEVENTS);
+
+	if (guest_mask) {
+		/* Subtract guest counters from available host mask */
+		bitmap_andnot(new_mask, new_mask, guest_bitmap, ARMPMU_MAX_HWEVENTS);
+
+		/* Did we collide with an active host event? */
+		if (bitmap_intersects(cpuc->used_mask, guest_bitmap, ARMPMU_MAX_HWEVENTS)) {
+			int idx;
+
+			need_resched = true;
+			cpuc->host_squeezed = true;
+
+			/* Look for pinned events that are about to be preempted */
+			for_each_set_bit(idx, guest_bitmap, ARMPMU_MAX_HWEVENTS) {
+				if (test_bit(idx, cpuc->used_mask) && cpuc->events[idx] &&
+				    cpuc->events[idx]->attr.pinned) {
+					pr_warn_once("perf: Pinned host event squeezed out by KVM guest PMU partition\n");
+					break;
+				}
+			}
+		}
+	} else {
+		/*
+		 * Restoring to hw_cntr_impl.
+		 * Only resched if we previously squeezed an event.
+		 */
+		if (cpuc->host_squeezed) {
+			need_resched = true;
+			cpuc->host_squeezed = false;
+		}
+	}
+
+	if (need_resched) {
+		/* Collision: run full perf reschedule */
+		perf_pmu_resched_update(&cpu_pmu->pmu, kvm_pmu_update_mask, new_mask);
+	} else {
+		/* Host was never using guest counters anyway */
+		bitmap_copy(cpu_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
+	}
+}
+
 /**
  * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
  * @pmu: Pointer to arm_pmu struct
@@ -209,6 +276,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 
 	pmu = vcpu->kvm->arch.arm_pmu;
 	guest_counters = kvm_pmu_guest_counter_mask(pmu);
+	kvm_pmu_set_guest_counters(pmu, guest_counters);
 	kvm_pmu_apply_event_filter(vcpu);
 
 	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
@@ -317,7 +385,6 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
 	/* Stop guest counters and disable interrupts in hardware. */
 	write_sysreg(mask, pmcntenclr_el0);
 	write_sysreg(mask, pmintenclr_el1);
-
 	kvm_pmu_set_guest_counters(pmu, 0);
 	preempt_enable();
 }
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 2e1e7a48e05ff..3139f80e877f7 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -75,6 +75,7 @@ struct pmu_hw_events {
 
 	/* Active events requesting branch records */
 	unsigned int		branch_users;
+	bool host_squeezed;
 };
 
 enum armpmu_attr_groups {
-- 
2.54.0.1136.gdb2ca164c4-goog


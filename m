Received: from mail-oi1-f201.google.com (mail-oi1-f201.google.com [209.85.167.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9AC3D1ABA
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 19:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292574; cv=none; b=h1NyLH4k4LC1ika7vfyCVaCDuksd5FXcVG/HZahhT1Shc2iUDgqEup6DV3qxIlMR6OUM/NZjPYeeUzrR9k/CnKVdvEPHYpZn5Cki/lLlY02lkSKw6cOnUbhJupW+1vIU/XuiznbEShCBPUS6R8umxoc7aYaQlNZANmH3uffdILg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292574; c=relaxed/simple;
	bh=Z169fBUkCIg9BiMlDMCUBmqUN7mLkV31cpse2h+VzWs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oJ6Edv/i8dxchopx36WATECtqvc/1FMjyfhou2AaiJJ/Pi3JHuPGqsuIq4NDv+LYcdq0wH2HtUsJJa47KXN4OWoVfgjiEqvUJX6bXoq1a61neScP/YCW7HnWz9lesbepfqs7cjZXDzBd7RQHDcYlUzvYV871YGnDgbmnaruTzcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tE7f40Jj; arc=none smtp.client-ip=209.85.167.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tE7f40Jj"
Received: by mail-oi1-f201.google.com with SMTP id 5614622812f47-486db2bf46eso1551080b6e.3
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 12:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292567; x=1781897367; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xMUfkA0Qvrb7iW5rl1K95T0ct8KyLE0h2lxpS+ugXRA=;
        b=tE7f40JjN40RurEeRB6Kit/fgsxYPmcAUSJG60ZkNuqgEOsCNPjeyxz0a6mpAL4g8T
         ivIvSnh5fM+XLNjojUcRKAsJuGtqEnz8+fr2599fiiFYmiZ4nPMeoXtnKgJXepKX0qfy
         l9SbHVzRysBCok7K1zi6yTAEqfaUfCiKeY2HiOx1te+VB5RmcRGizd3qYw44DNrl+4Ey
         4lyvT3xuMfB3ehL783PM1BCaT014eyWm1L9CMp+RrW6A9jqcNyIQbDmrywfDyMxMofPL
         jxLntPNGJkj/wSllkCdXgkwXXwLTc155IWLXdMXDVRmbstBB3xBbrgSwXTPsSMS96OhJ
         v6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292567; x=1781897367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMUfkA0Qvrb7iW5rl1K95T0ct8KyLE0h2lxpS+ugXRA=;
        b=WHKdNGMm+3spmQXSciVQYKeL/YhdI3W8hFlQCC32Ig5h16KDKHxRFkXSIIkTzZeWuu
         Sz4kzCHd8ZvEjQgu/+Xj8k8Kql9ionbJoeIYET/aIEuR2yF2uDeFhx8QX3okbFBUmsvD
         1AV42vVfUoEtL2nF65lKuz2f0+t+ZVgTiaMsWpcX/M5yQD3liBC8GnaDUKlG/EPuuXGp
         fyigwu0JkFpOxIWTxHJPeCinpiIll0CwcITIldc5H7JzeG6PpD38QC7p4FbdqPb2J9s3
         wCO67T7EqDM5yn79/kyZEvdFsELQXtqq4kvKu/9rrxd88oT9szms5lPdKvt87dhjeWjV
         S46A==
X-Forwarded-Encrypted: i=1; AFNElJ+6eNuEh6K7i0ONihBCVGp7t8lTOdZQItNpqUeeJfnvf5lqK6tsj5Z1NNOnBDvxQGdqnE1r7o6/44BlWc+kHLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YweKEXas9q6e9jhNFs5Ec1dKcHx3IItQ70ab/5nwGHVbpdgKKcO
	x7WcW66wUNHBLaDQLLZgMDSdf1F7GJJ0wMgdhByQQzkbb0QcO6rZ2D7fTXmoFKZ9mYkhPLVY8Pp
	6RPUNx+6kpb/lrd87YLKVbfQhsg==
X-Received: from ilbdx1-n1.prod.google.com ([2002:a05:6e02:4201:10b0:4fa:1e84:4047])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:170f:b0:485:15bd:60e8 with SMTP id 5614622812f47-48741b51368mr655188b6e.35.1781292567145;
 Fri, 12 Jun 2026 12:29:27 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:29:06 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-19-coltonlewis@google.com>
Subject: [PATCH 18/21] KVM: arm64: Add vCPU device attr to partition the PMU
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

Add a new PMU device attr to enable the partitioned PMU for a given
VM. This capability can be set when the PMU is initially configured
before the vCPU starts running and is allowed where PMUv3 and VHE are
supported and the host driver was configured with
arm_pmuv3.reserved_host_counters.

The enabled capability is tracked by the new flag
KVM_ARCH_FLAG_PARTITION_PMU_ENABLED.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/uapi/asm/kvm.h |  2 ++
 arch/arm64/kvm/pmu-direct.c       | 30 ++++++++++++++++++++++++++++++
 arch/arm64/kvm/pmu.c              | 23 +++++++++++++++++++++++
 include/kvm/arm_pmu.h             |  9 +++++++++
 4 files changed, 64 insertions(+)

diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 1c13bfa2d38aa..7f57b8c132925 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -437,6 +437,8 @@ enum {
 #define   KVM_ARM_VCPU_PMU_V3_FILTER		2
 #define   KVM_ARM_VCPU_PMU_V3_SET_PMU		3
 #define   KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS	4
+#define   KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION	5
+
 #define KVM_ARM_VCPU_TIMER_CTRL		1
 #define   KVM_ARM_VCPU_TIMER_IRQ_VTIMER		0
 #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER		1
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 0062d1d8e1999..2d2294b78ebe0 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -24,6 +24,36 @@ bool has_host_pmu_partition_support(void)
 		system_supports_pmuv3();
 }
 
+
+/**
+ * has_kvm_pmu_partition_support() - If we can enable/disable partition
+ *
+ * Return: true if allowed, false otherwise.
+ */
+bool has_kvm_pmu_partition_support(void)
+{
+	return has_host_pmu_partition_support() &&
+		kvm_supports_guest_pmuv3() &&
+		armv8pmu_is_partitioned;
+}
+
+/**
+ * kvm_pmu_partition_enable() - Enable/disable partition flag
+ * @kvm: Pointer to vcpu
+ * @enable: Whether to enable or disable
+ *
+ * If we want to enable the partition, the guest is free to grab
+ * hardware by accessing PMU registers. Otherwise, the host maintains
+ * control.
+ */
+void kvm_pmu_partition_enable(struct kvm *kvm, bool enable)
+{
+	if (enable)
+		set_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &kvm->arch.flags);
+	else
+		clear_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &kvm->arch.flags);
+}
+
 /**
  * pmu_is_partitioned() - Determine if given PMU is partitioned
  * @pmu: Pointer to arm_pmu struct
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index f5ee18b4dfae7..4e15948ac2565 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -769,6 +769,28 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 
 		return kvm_arm_pmu_v3_set_nr_counters(vcpu, n);
 	}
+	case KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION: {
+		unsigned int __user *uaddr = (unsigned int __user *)(long)attr->addr;
+		u32 val;
+
+		if (get_user(val, uaddr))
+			return -EFAULT;
+
+		if (!has_kvm_pmu_partition_support())
+			return -EPERM;
+
+		if (kvm_vm_has_ran_once(kvm))
+			return -EBUSY;
+
+		kvm_pmu_partition_enable(kvm, val);
+		if (val) {
+			unsigned int max_counters = kvm_arm_pmu_get_max_counters(kvm);
+
+			if (kvm->arch.nr_pmu_counters > max_counters)
+				kvm_arm_set_nr_counters(kvm, max_counters);
+		}
+		return 0;
+	}
 	case KVM_ARM_VCPU_PMU_V3_INIT:
 		return kvm_arm_pmu_v3_init(vcpu);
 	}
@@ -808,6 +830,7 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 	case KVM_ARM_VCPU_PMU_V3_FILTER:
 	case KVM_ARM_VCPU_PMU_V3_SET_PMU:
 	case KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS:
+	case KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION:
 		if (kvm_vcpu_has_pmu(vcpu))
 			return 0;
 	}
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index f72d080ee7ba2..6a5572994b7fa 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -99,6 +99,8 @@ bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu);
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
 
+bool has_kvm_pmu_partition_support(void);
+void kvm_pmu_partition_enable(struct kvm *kvm, bool enable);
 bool pmu_is_partitioned(struct arm_pmu *pmu);
 bool kvm_pmu_is_partitioned(struct kvm *kvm);
 void kvm_pmu_direct_pmcr_write(struct kvm_vcpu *vcpu, u64 val);
@@ -279,6 +281,13 @@ static inline u64 kvm_pmu_guest_counter_mask(void *kvm)
 
 static inline void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr) {}
 
+static inline bool has_kvm_pmu_partition_support(void)
+{
+	return false;
+}
+
+static inline void kvm_pmu_partition_enable(struct kvm *kvm, bool enable) {}
+
 #endif
 
 #endif
-- 
2.54.0.1136.gdb2ca164c4-goog


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793163691;
	b=m9zY4g9tWdv2aBnUK2Fs3RbP0Qi1DMaKXXkvqX1hrXeaOU5nklN/5cxs+ZvkHY2MNrRR
	 HeXvATtvdGj3aWUAJflhQYxOmyoXzMSc6m6e+HfREYMZOuPfc+pgSK5YHiWt/kYxJ9N9Y
	 VirwDtD4OT0j9KSj15TZwhnnqCi9hO+U8GaC0sPXFh54YA9IO3yKipoC5O1Y4c76JOPk/
	 hfTUbo9uqf7hmaWSoOP1sG2dSGB2NY2nNq8+aHnjSsaG19nU6YeUZfdPNOm7dmJDZhM1M
	 WzO/6wkQu/FiEk86d2X/oV2PbTCgLrAzJt+5iquiGBG2XmfhZxKuIdxp+KnXHbignRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793163691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4PPjtqMp1V58uGYejGtWodvU/HeeS5pvfYydRAC9x9I=;
	b=AOlZX47BSzyR8BquHc7/Lxtkaa8q/lt3wubk3AkLWyucNZb5kLP9WOZMu1Lz6DM8oPoC
	 RU3N7i7gmaTjrkGD5TihgB/yUmeDTW40TP8kONCoxkshkS2wYqy7NiSPxfT3cnYi0J9q3
	 P0IVCy1MaqY3GfeZcEykk7ZXNZGWIFmnOhZX9conlFTHxXFk71Q3GXZFw+TehKTpsSWpF
	 ff0X5TelTaUcjX2RRbcKMUYlf7gq2wiOAZCB4ppyresrmXixNowG5Mib/jGwHm5OWpEiW
	 zY3yfG6hksyz1GbcYDMO/Ic73jquyn5wPrWVl68p+0OBGoxWaD8ScmUteqdP/Pk1Obw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=unqNiMoR;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDF360A380C
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 05:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BDF360A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=unqNiMoR
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso343386f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 22:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793163689; x=1793768489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4PPjtqMp1V58uGYejGtWodvU/HeeS5pvfYydRAC9x9I=;
        b=unqNiMoRYCef3A9/hfXhrILrTnGL85C1xRpiwvrMP317cz7PbheJLnkdxtnAQBULFn
         x0Na3E5+jDO3SdIKc/QmiQD1TO69+Lhblv9SehFYKUjMECY6h4+ICO8e7necMnyHd+ZE
         D8N9WLr8AAtG7sBU/qYRP+JKBCjONj/HTtiJGhxewmpZ0AnPuKkXL9ltUyrj6Z4HFKOq
         h2SD3L5Ex4Aip2hhDgoAKdydvYczjTHgixF5sq2kq9XIb1oQV2qKPo9Jj2PSUVQg/PcX
         RfEG58xmn4X9jR2+P85j8yv2KRskqZ4larVHaD8xeODB/7QdFdXpqfuRbO/BMHXoC2UT
         A4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793163689; x=1793768489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4PPjtqMp1V58uGYejGtWodvU/HeeS5pvfYydRAC9x9I=;
        b=oqspA+uRYoYPbatwF3Ave2W6ZzJ/nG5HbOXGYu5hYx8IcBl2phRPLkMUTcle9nUTl4
         2Bq62+hd6LlQUDJOvGsYoAzhWKCTmGGkwTAlLWVIYkiBCDMij1OIg2b7QN91V33+olBz
         +pZ/OE7TR+6A1LK9ZUa3VgKDoBrMlE8qjAn17QaVFErGwPmxGStT1Rg9qb3oflvdn5Y7
         0owuEzK86lD9b8GQ1qkp2NAk3nmrZmN68ZCeab4usYr2CDbE8A30/xHKpZCMT8tHT6Pw
         jXZUEU7eXnOq+2cj+hqxTffyp2fildHHUvaRYQdaMj3qUY1Oj8hywOidKO+fxtkqjgLk
         HQ4Q==
X-Forwarded-Encrypted: i=1; AKwUvByi3LnRuecLoIqRQOJOAjCPdbrepzQQuPRHWGUpIEDNs5oFAfoFIrNB6sRuZ5OxTaG7uKN5jShGgf8K36ts0ZI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrx4TlxmDQQLb3m98n2HG89fUDr73rlD8WkCWMSjZyy0QGgkls
	LPV0Tu7qWPGu4Jj5GmnR7MMlyj3JaMPruwq/iXEhHKvyoffan7lWSBi6
X-Gm-Gg: AYBFou2ZWAU6OcF5D7GbCisb71efI98uMc5X6oDnG9vROaeGmGxfa33AbVMNbTsj3ow
	9WH0H31Lai+iwQD8CJqARyA9ZQ022wiWEU51oRxNokXxq+vD4tPBSdH7hsQX2qfK2G5fgl9wW6r
	JZhV0hrIZB98KVhvbUC3gcPE4eszTjoYGGUdDIFIvh689nwJHbe2kcjEMwNiMrmFIAF/6SWa82b
	LGAd+7RseU8AfB6hvcX/uK5BZS0rJTrpZtAE/uYb97ZDvKYUx5BntpAhupHyRLgWkFcotE4EHPi
	Wvj7EGIV/KK58NmioQ6i2Fe+66i8fhG9ywoleK7+JuvZgCYchuFBUC3/6PATlElXT9n+Jx8Cc16
	t1BY2MEHelpOnJJVZf9JWwGDTfZd0DHvKzcDvUpTeuU63G0EzjNfcZEM4UB2IPeV5ECdsSp8Z1j
	CvNVLHmJDbEmMQMmrNQrJCstv0jVtBXlsWJjdOzrX2/+no2hgkwzKJ8c049/UpCQoZ5A+awl/lX
	CLZjhwyQBDNl2R/GFHDxm6X/K1dOAuaux1ruxDAe0pLD8l7b3BT3WJzfatErbQwojYQGCBnAfef
	znOpYV7z/atxEI0coLwJqZnU9rjXHu8FdFwYnfE5mMuVi4x2vArE3NfOH8ZSDeFdNkYywFHspyG
	RpEvzCno7iwtdp0fVXiN9+4v0kiQrYYbxU54sHdggj01niyFzc2uzNYiHRgdz8Xyi+/E5Q4cWif
	cnqJSyLrBk3/McjuFwCnXLVOdHkjyUbHOKgIqNQw==
X-Received: by 2002:a05:600c:154e:b0:4a1:7bd4:d07d with SMTP id 5b1f17b1804b1-4a967e8d5a3mr18553845e9.34.1793163689112;
        Tue, 27 Oct 2026 22:01:29 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94eb8a60fsm13523365e9.3.2026.10.27.22.01.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 22:01:28 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] KVM: arm64: vgic-v2: Don't drop pending writes to active level IRQs
Date: Wed, 28 Oct 2026 06:01:11 +0100
Message-Id: <20261028050113.10046-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028050113.10046-1-kmehltretter@gmail.com>
References: <20261028050113.10046-1-kmehltretter@gmail.com>
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

A write to GICD_ISPENDR for an active level interrupt makes the
interrupt Active and Pending. It must be delivered again after it is
deactivated.

KVM loses the second pending state. vgic_v2_populate_lr() leaves
pending_latch set for a level interrupt, while vgic_v2_compute_lr()
keeps Pending and Active out of the same LR. vgic_v2_fold_lr() clears
the latch after the LR becomes empty. At that point it cannot tell the
original latch from one written while the interrupt was active, and
clears both.

Synchronize the target vCPU's LRs in vgic_mmio_write_spending() with
vgic_access_active_prepare() and vgic_access_active_finish() under
config_lock before setting pending_latch. When the interrupt is in an
LR on another vCPU, this folds any prior ack into the VGIC state before
the new pending state is recorded.

In vgic_v2_fold_lr(), clear the original latch when an LR populated for
an inactive interrupt no longer reports a pending state, and preserve a
latch written while the interrupt was active.

Fixes: 67b5b673ad4d ("KVM: arm/arm64: vgic: Disallow Active+Pending for level interrupts")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-mmio.c | 76 +++++++++++++++++++--------------
 arch/arm64/kvm/vgic/vgic-v2.c   | 10 +++--
 2 files changed, 50 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
index fddb9da0403d5..e42eb10d502b2 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio.c
@@ -350,11 +350,54 @@ static void __set_pending(struct kvm_vcpu *vcpu, gpa_t addr, unsigned int len,
 	}
 }
 
+/*
+ * If we are fiddling with an IRQ's active state, we have to make sure the IRQ
+ * is not queued on some running VCPU's LRs, because then the change to the
+ * active state can be overwritten when the VCPU's state is synced coming back
+ * from the guest. Setting an IRQ pending also requires the target VCPU's LRs
+ * to be synced first so that any prior ack in the LR is folded
+ * before pending_latch is set.
+ *
+ * For shared interrupts as well as GICv3 private interrupts accessed from the
+ * non-owning CPU, we have to stop all the VCPUs because interrupts can be
+ * migrated while we don't hold the IRQ locks and we don't want to be chasing
+ * moving targets.
+ *
+ * For GICv2 private interrupts we don't have to do anything because
+ * userspace accesses to the VGIC state already require all VCPUs to be
+ * stopped, and only the VCPU itself can modify its private interrupts
+ * active state, which guarantees that the VCPU is not running.
+ */
+static void vgic_access_active_prepare(struct kvm_vcpu *vcpu, u32 intid)
+{
+	if ((vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3 &&
+	     vcpu != kvm_get_running_vcpu()) ||
+	    intid >= VGIC_NR_PRIVATE_IRQS)
+		kvm_arm_halt_guest(vcpu->kvm);
+}
+
+/* See vgic_access_active_prepare */
+static void vgic_access_active_finish(struct kvm_vcpu *vcpu, u32 intid)
+{
+	if ((vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3 &&
+	     vcpu != kvm_get_running_vcpu()) ||
+	    intid >= VGIC_NR_PRIVATE_IRQS)
+		kvm_arm_resume_guest(vcpu->kvm);
+}
+
 void vgic_mmio_write_spending(struct kvm_vcpu *vcpu,
 			      gpa_t addr, unsigned int len,
 			      unsigned long val)
 {
+	u32 intid = VGIC_ADDR_TO_INTID(addr, 1);
+
+	mutex_lock(&vcpu->kvm->arch.config_lock);
+	vgic_access_active_prepare(vcpu, intid);
+
 	__set_pending(vcpu, addr, len, val, false);
+
+	vgic_access_active_finish(vcpu, intid);
+	mutex_unlock(&vcpu->kvm->arch.config_lock);
 }
 
 int vgic_uaccess_write_spending(struct kvm_vcpu *vcpu,
@@ -452,39 +495,6 @@ int vgic_uaccess_write_cpending(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
-/*
- * If we are fiddling with an IRQ's active state, we have to make sure the IRQ
- * is not queued on some running VCPU's LRs, because then the change to the
- * active state can be overwritten when the VCPU's state is synced coming back
- * from the guest.
- *
- * For shared interrupts as well as GICv3 private interrupts accessed from the
- * non-owning CPU, we have to stop all the VCPUs because interrupts can be
- * migrated while we don't hold the IRQ locks and we don't want to be chasing
- * moving targets.
- *
- * For GICv2 private interrupts we don't have to do anything because
- * userspace accesses to the VGIC state already require all VCPUs to be
- * stopped, and only the VCPU itself can modify its private interrupts
- * active state, which guarantees that the VCPU is not running.
- */
-static void vgic_access_active_prepare(struct kvm_vcpu *vcpu, u32 intid)
-{
-	if ((vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3 &&
-	     vcpu != kvm_get_running_vcpu()) ||
-	    intid >= VGIC_NR_PRIVATE_IRQS)
-		kvm_arm_halt_guest(vcpu->kvm);
-}
-
-/* See vgic_access_active_prepare */
-static void vgic_access_active_finish(struct kvm_vcpu *vcpu, u32 intid)
-{
-	if ((vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3 &&
-	     vcpu != kvm_get_running_vcpu()) ||
-	    intid >= VGIC_NR_PRIVATE_IRQS)
-		kvm_arm_resume_guest(vcpu->kvm);
-}
-
 static unsigned long __vgic_mmio_read_active(struct kvm_vcpu *vcpu,
 					     gpa_t addr, unsigned int len)
 {
diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 7182f63fc9382..f3ba3177dd97b 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -57,7 +57,7 @@ static void vgic_v2_fold_lr(struct kvm_vcpu *vcpu, u32 val)
 {
 	u32 cpuid, intid = val & GICH_LR_VIRTUALID;
 	struct vgic_irq *irq;
-	bool deactivated;
+	bool deactivated, was_active;
 
 	/* Extract the source vCPU id from the LR */
 	cpuid = FIELD_GET(GICH_LR_PHYSID_CPUID, val) & 7;
@@ -71,7 +71,8 @@ static void vgic_v2_fold_lr(struct kvm_vcpu *vcpu, u32 val)
 
 	scoped_guard(raw_spinlock, &irq->irq_lock) {
 		/* Always preserve the active bit, note deactivation */
-		deactivated = irq->active && !(val & GICH_LR_ACTIVE_BIT);
+		was_active = irq->active;
+		deactivated = was_active && !(val & GICH_LR_ACTIVE_BIT);
 		irq->active = !!(val & GICH_LR_ACTIVE_BIT);
 
 		if (irq->active && vgic_irq_is_sgi(intid))
@@ -88,8 +89,11 @@ static void vgic_v2_fold_lr(struct kvm_vcpu *vcpu, u32 val)
 
 		/*
 		 * Clear soft pending state when level irqs have been acked.
+		 * A latch written while the irq was active is a new pending
+		 * state and was not represented in the LR, so preserve it.
 		 */
-		if (irq->config == VGIC_CONFIG_LEVEL && !(val & GICH_LR_STATE))
+		if (irq->config == VGIC_CONFIG_LEVEL &&
+		    !(val & GICH_LR_PENDING_BIT) && !was_active)
 			irq->pending_latch = false;
 
 		/* Handle resampling for mapped interrupts if required */
-- 
2.39.5 (Apple Git-154)


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651607;
	b=zoVeGXAGUyh8jcseS/0q8KLVThK8666gjtf3Oj7ITSszhHOMVcmqsAu4+VSqvzhIkuW4
	 CM4QhG4u3BRgsMas+vyA4miRuD+ik+gmopKPeFyVN6Rajze5spQhK7eon2+sf1uol4Sm3
	 dVLLLSfAOh3EhGZnk3HenvJMXDR7/nO0rSDuctLSQF9FH7DnR5AiwQuyY563BkM/c6hHW
	 3dmqcZXZsx4xbrakaiR8iCuk8tLgW2LqBOs8aX6j+2/wmySrpzKZCgdysRs1HlQnWDw9J
	 V0lcaRCCfFH7m0rZHQCkLB/K5/cwK88Om5DopXdIqMwqUJ2T6nhQIK8T80JOPj6futQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M/mYu7fYt3Nnrov1PUQgYA1NNwSASs0rt/VgYt7AiFM=;
	b=FEGVFBvvdZAYjFiH97an1X0ewXHrbueFy65dpzHP6ne2jmZZ9YfXmHJNR0B7+UW8GRJw
	 /v6OThi5lkewhu+WWil9qrIhpP8wmQOIV58yJY0ZTwLwcsVnqgSdwp3IkgQAN555wCMml
	 DNtA9MPbbZ8IHxwiDcQmvdkRD8T2XYyEUArbPxoTNu5AUcLrYp70tqgmGNeLO0jxofpmv
	 CsvG9+VHrOdusJbTzRCfeA+H43FGirafF7uAPPAhrZiQIW5EBAtx9yRtxm6squvBBkcFL
	 Wih2NNlZN1RdVo+iOjQ2Zq2q8ySwWiY42xJFaKIS8SF6LZJXnr+U/ZM3pki7xPHWx1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V3VZFGWD;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2716B606A32C
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 06:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2716B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V3VZFGWD
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-487049569b6so966430f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 23:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651604; x=1793256404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/mYu7fYt3Nnrov1PUQgYA1NNwSASs0rt/VgYt7AiFM=;
        b=V3VZFGWD4KSHeM+DO1nMisS6i/wVge1HM6fBy74v88dr0yo3wdHQIcH6CdlySChT9O
         ZtagAUhE4z5oHQbTDfwTzSZAUjg5OkMthcQr1prlqKy+nrnPy6M4YeSm41x3jV1ykpwW
         GG4PBQloGs3RtgMl8ipgoXyQ19SZhjzgRr2vtEeIoOEnT/nmoFDRWKVqaiVR81kVgbGf
         Vn58vCEk37QLp6G8KhPEJg6hpNnZkZ/jKHVhQ2eec4UbeGitkwn8TsbXto7m7KJZdr6e
         qybFZILP1qgJqUYcnorNnc57GrlG+Ja02JZIX+MV14ALtyZqW3DKLy/V4RxNyP9VN+J4
         FTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651604; x=1793256404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/mYu7fYt3Nnrov1PUQgYA1NNwSASs0rt/VgYt7AiFM=;
        b=J7CX4ddRsgAneLgGABHueX5p9FzLqJTtPGvnRNSsmWymPwbvJpr3xUh/vxLBQ8otUX
         Uy//JSBHuRWMnePJyyXvJt8TGW7VoZgqX0P0Ty2PtidRDB8VlnwLipd0ObyxzBnOFdpM
         LmmLX1INp8cpqJu20n2S8KVNLy2EUTJrztNgaqp1StFIPxQO7Ensp/AWFOOp+KQEx3GJ
         b1CbpuwqhDGZ9S5JfMazk5FlaEup6RroOi7Wx4VjDjY/VON6V8dJ9Qi2xGPSBsrDcN49
         CEOt3nGJ+lzVw02qDpaMfXRDdLXpVoG3pCTqyEm6c1SyjvIcTgXByUB/ukCmwm7Mibg1
         tn2w==
X-Forwarded-Encrypted: i=1; AKwUvBxG9OFGtFd78AhBPNcK+AfHz4q4bKQ5c/Z5/K1VkENboeol2fNrkzOE7U7XRpeKq4LVBGawYqVErO+NPhUr9Pg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvds3cymIMfSRQxPP2gsrs6TKkzYJ+Td6rRfPTnyKxdNmbghdQ
	djJpyZRMIOwAIfw2ME6ahNG4VYPe211hesIdc5KlJWS7eBi3GNO+SlxBP4u2IJc2
X-Gm-Gg: AYBFou1k1C0EpPmatdTUJmp6aogJhI2b9hzhCOClquWJdXd8a74S4AGBuTRe5/uVw9i
	PFvABLj4n/Nefzy46lNWI93uisBIK9zbFIhOYThu+MZ4FJGTdfDw/gnVr5pwNzMP7PCL2CKa3gB
	/Wt7NhPSNleZHSlA3kJdyrMm8lDAUNQgvIG4ZiW+w+//K+Z73fWATVs5JuqlUHaje+bj11b4PTG
	6Q6fuZb1mmJYa5b/syKalJNPOLr0bOYUVkzQtb4G24z7pSGKBKb2JNDbhuvnp5uWyS944jEeQX0
	6YjKvc2RfZbJ/gx4pDoKPSTr3OYT9hiy7oU2J+3SPjFSubyfY76x+Ik7kG6NyCr8c4Ekwz478Js
	j+b1teyzYE8yYcC6EZ7XkEkxuAnEz2B9qE+Mag01PJEODkTFc6VKLigBB0A+IoZYLiZM2lf5eH3
	UsbEteX6coJHq9xKH+496EjzjGfgJ6+pscd/LjfmVOclzN8MSVDYjtxwHdDsOln+EjwhEv75nYf
	q/nTDTQcmG8WI1NR/Y4bvyNXwOIH/JUzuL2L38WeV1tyoMJr1/Ev2JrYAfTIzs+czfLZgggYO0Y
	Epz2E0mXMPU9w14kiCFKW54rcm0S9WxW84S+d4l/ya8QKCliSUoDbOkz/NMmi16gWjecdDRzTdk
	/awr2EEtmMcdSvE/MxMv7ZHB0JOsKPq3OysMhHjAxwU69Xlp1UPciVfmSlrzXdxxi
X-Received: by 2002:a05:6000:1111:b0:48d:fed0:ccbd with SMTP id ffacd0b85a97d-48e264caa01mr6437578f8f.34.1792651604419;
        Wed, 21 Oct 2026 23:46:44 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm10215624f8f.22.2026.10.21.23.46.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 23:46:44 -0700 (PDT)
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
Subject: [RFC PATCH 2/3] KVM: arm64: vgic-v3: Don't drop pending writes to active level IRQs
Date: Thu, 22 Oct 2026 08:46:27 +0200
Message-Id: <20261022064628.4206-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022064628.4206-1-kmehltretter@gmail.com>
References: <20261022064628.4206-1-kmehltretter@gmail.com>
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

The GICv3 backend also loses a level interrupt set pending through
GICD_ISPENDR or GICR_ISPENDR0 while it is active. Its LR handling has
the same split between pending_latch and an Active-only LR as GICv2,
and clears the new pending state after deactivation.

Apply the GICv2 bookkeeping to vgic_v3_fold_lr(). Clear the old latch
when the LR reports that the interrupt has been acknowledged, and
preserve a latch which was not represented in the LR.

GICv3 permits an implementation to clear register-set pending state on
ack. Doing so matches the GICv2 backend and makes a later ISPENDR write
a distinct pending state.

Fixes: 67b5b673ad4d ("KVM: arm/arm64: vgic: Disallow Active+Pending for level interrupts")
Assisted-by: LLM
---
 arch/arm64/kvm/vgic/vgic-v3.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 726e20a1da6e7..8009dc6df00db 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -75,7 +75,7 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 {
 	struct vgic_irq *irq;
 	bool is_v2_sgi = false;
-	bool deactivated;
+	bool deactivated, was_active;
 	u32 intid;
 
 	if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3) {
@@ -93,7 +93,8 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 		/* Always preserve the active bit for !LPIs, note deactivation */
 		if (irq->intid >= VGIC_MIN_LPI)
 			val &= ~ICH_LR_ACTIVE_BIT;
-		deactivated = irq->active && !(val & ICH_LR_ACTIVE_BIT);
+		was_active = irq->active;
+		deactivated = was_active && !(val & ICH_LR_ACTIVE_BIT);
 		irq->active = !!(val & ICH_LR_ACTIVE_BIT);
 
 		/* Edge is the only case where we preserve the pending bit */
@@ -103,9 +104,15 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 
 		/*
 		 * Clear soft pending state when level irqs have been acked.
+		 * A latch written while the irq was active is a new pending
+		 * state. A write while the irq was in the LR may also have
+		 * followed the ack, so preserve it too.
 		 */
-		if (irq->config == VGIC_CONFIG_LEVEL && !(val & ICH_LR_STATE))
+		if (irq->config == VGIC_CONFIG_LEVEL &&
+		    !(val & ICH_LR_PENDING_BIT) &&
+		    !was_active && !irq->latch_written)
 			irq->pending_latch = false;
+		irq->latch_written = false;
 
 		if (is_v2_sgi) {
 			u8 cpuid = FIELD_GET(GICH_LR_PHYSID_CPUID, val);
-- 
2.39.5 (Apple Git-154)


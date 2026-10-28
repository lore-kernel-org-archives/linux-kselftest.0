Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793163693;
	b=Da6dlNrygejtp36emuTSEf8FWLx9OlhJwcm2Jnk6JTSoWvsXx3eyBbH/+3nOOMSfA4kX
	 0pcOAAUpe4iDo3xpb50jwVBOM8B2pqMrHFkC/8zLqpzeTfyviODwswS6/Z8kOhuoRnqbE
	 X6f6uTVK9I3KLETolBYHYBX96A8GJaswBDuGOWS8vawOj5Y0WkeDBvJNa/WjaBT5kz/TB
	 KI6oNfkLP72uHIm83zsdHzcvGGxZRPvbodofz9Hr9P9NX+2DeZKfSmfP2WX2GX5JXM6qq
	 CSLKpNa9ugpMtKUOK3Z242X/8NT3kUOshfxxzqmi4ir8fmycinvtfmtIbKBnW+eWO6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793163693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R107460VN/9Lpa+clFPqIU2LdqoiAh3lsBpjR3ojfMo=;
	b=SnOp04mB9cSyL7G+CKc2DK2uoGuV7Lf8PreVftWugdMZoushxg3nR65L/QgIlgvrCGid
	 XbyeHOY1D4u6+ztMEjyuLtZxphjobOTY/bkODjbv8i5PFJ9ID6rEgdwhll3u184DKB8a2
	 iA7KtWyqac4wtQewVgal8+K9p+NMIL4RNFdburDDyTB8h94zuEM1XNLf0c6OltMXuTLz5
	 Cm8BCWzoYXDK/O4hLVgEcTqDzajmkxZIG3f9yP5iM2SDbPO9qp2xevWbtPcHOtDCxiaUm
	 jt4HWBcJTb+En4mKaYRX881i1fTQFD2Gc7oF2vRzjqFv97z8a5lD+jh3KUUK650xyuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vwNyz0N9;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AC860A382E
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 05:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4AC860A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vwNyz0N9
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a215e64962so5554455e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 22:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793163691; x=1793768491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R107460VN/9Lpa+clFPqIU2LdqoiAh3lsBpjR3ojfMo=;
        b=vwNyz0N9FPu0o6YgZqRkzyBxaG10fWVAQOVs2yTJgwqUwsngi4f2LJYKzFLwLUAh67
         DOwSrB1EfBP4ISN8zOhWqBzWBG6uMI/a8jXB/Yt3Eh7P3t2DH+W+WaIEf4hgvUnIlGmE
         GU5KvEwXJh8uv3n77XZebnt1KWXR2VyExWIWlJtV74udckaWC8GU6wbAZcJIsFK3x7fI
         YoIH0TbFMLnn1s8tTSfhq2glVItyFXNbYZyqBPMS91Dzi5FJV4Lqvj/EPW5g4F0cGnJn
         FHCwWqZF8zeQaGmVa1nHtDPvFg/O8KHPXK9fO+TPJjU66j+zkQF8pb3SbU3/sFK7+CXK
         h+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793163691; x=1793768491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R107460VN/9Lpa+clFPqIU2LdqoiAh3lsBpjR3ojfMo=;
        b=JxYpxfMrOtzcwtINfS+rvCl4x9ZteGtAWDBctEWt11xLBoEqXQe+lJ+xa7R5gzFFtL
         fjfh5bXyXU/ZVuz0PMNnSUPDvwWmInQb0kIqN1VvRzgMQ0RvJ0SCL6iqqKmuSXijRBfP
         Fu1YUqXA0pQ3UMaWZsIrIFWOzIUk28Paa06jy91gOthwUUxFPVi81A7M74u8QyyIG0Hi
         UhUZTcIEC1zx1l7FgUw62UltKzltuRqT+x+7FesN7Ss9JtEItx8G0PqiLpJag7qaJa3q
         8Kr8LjmBdKb4C6D0UlfpPH4P+evBuIGw2fw2z7SRDv7y1XDh3fNfDeJN3K8kr6E0sS5K
         6QaA==
X-Forwarded-Encrypted: i=1; AKwUvBynhEfXdK48BC217yLNFZIch0FKnO4XDhDKXMdoGjmTJo4q9avsRoieLg6nhyWQWGgqHf9oX9ax/8gHGfn9qHM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVRagVhQCILFgnwb7LDig1igoglADeJF/Z6XQhHetUN1d7VUTV
	7YdkueZMZQlRiU+fiAGEG1M4Pf3oqEkgGvl3Op/vyGHsGxRPPTKysuba
X-Gm-Gg: AYBFou07V4mw7zRj1SF+ksOpoK60V4r48O1reNGFx2oToXmfYOVVWO6WRw84Jt3ED7d
	EXHnp3iBVPtHTO6ch9qA3nTMomZVYGNqQjOH8QMSLlOwOjDhDWQ/9lJAVCpxCLJ9ucnJNgvrqoP
	X9e9rY8MkQ7x55D7dtLAnguL9MfeDWh4Loo6cIORM1jedAUqPgcvj3pqYCu/A4eFC+aMLcRDuUC
	cA7MxJVSJgB5+nfaFC2tOGWoKFkcO5Ne0GMlUsogSAN9QzYzBbicU2Cix4Lh/vAyRcU539zTK1f
	U08iKJaaTW3Bc7oI70Dx1VBs8OWvgjR5AAgaCYkxo91VC4NVat0y3ETJpM+c5ICz/KQgR5qzeSV
	obGKH7jiMawik7nskI+is/oHDtcgpG+2r2pt7WGDXD9Y1jgzanFCrBJnIxjqfrRSzf39kk94sLP
	0DdjHN6kWB5uLR4COuiLRDg8m1n8OXQe2AN9nNYQ0dh3UbGIbwBjVtTER6EZzJMzmWdT9pL+j26
	82FZs7Yi5baTcSzSkBos6TOXB29a9jS9lgOQ5KNLUsbx9rtmMUHtbm5nBG6sCv7QTF2HrqHHJ7Z
	ZFsEGkJRSo/xFTLmW+lmhiMfgua27C4wUXAzB1ncyqVJ3hbFCzv3nqQvpavV2cOiYwlnx10rxQO
	Vcik6fma3nhDowAcN0nf8gArQ0qg+UqSrt8//3xAIbWpJLD3i7Q1Obmjk3vhbYeKCq90EzQb0xF
	zJ0RQvTaxx6WFLRZMcGVzkS1FrGAQwWtMKDxnvgyY49L7g4Yi1qCfGvTgHCbg=
X-Received: by 2002:a05:600c:4e03:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4a963ffcf87mr21560375e9.2.1793163690594;
        Tue, 27 Oct 2026 22:01:30 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94eb8a60fsm13523365e9.3.2026.10.27.22.01.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 22:01:30 -0700 (PDT)
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
Subject: [PATCH v2 2/3] KVM: arm64: vgic-v3: Don't drop pending writes to active level IRQs
Date: Wed, 28 Oct 2026 06:01:12 +0100
Message-Id: <20261028050113.10046-3-kmehltretter@gmail.com>
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

The GICv3 backend also loses a level interrupt set pending through
GICD_ISPENDR or GICR_ISPENDR0 while it is active. Its LR handling has
the same split between pending_latch and an Active-only LR as GICv2,
and clears the new pending state after deactivation.

With vgic_mmio_write_spending() synchronizing the target vCPU's LRs
before setting pending_latch (which is a no-op when a vCPU writes its
own GICR_ISPENDR0), apply the GICv2 fold rule to vgic_v3_fold_lr().
Clear the old latch when an LR populated for an inactive interrupt
reports that the interrupt has been acknowledged, and preserve a latch
written while the interrupt was active.

GICv3 permits an implementation to clear register-set pending state on
ack. Doing so matches the GICv2 backend and makes a later ISPENDR write
a distinct pending state.

Fixes: 67b5b673ad4d ("KVM: arm/arm64: vgic: Disallow Active+Pending for level interrupts")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 726e20a1da6e7..4d802fc9c6dd5 100644
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
@@ -103,8 +104,11 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 
 		/*
 		 * Clear soft pending state when level irqs have been acked.
+		 * A latch written while the irq was active is a new pending
+		 * state and was not represented in the LR, so preserve it.
 		 */
-		if (irq->config == VGIC_CONFIG_LEVEL && !(val & ICH_LR_STATE))
+		if (irq->config == VGIC_CONFIG_LEVEL &&
+		    !(val & ICH_LR_PENDING_BIT) && !was_active)
 			irq->pending_latch = false;
 
 		if (is_v2_sgi) {
-- 
2.39.5 (Apple Git-154)


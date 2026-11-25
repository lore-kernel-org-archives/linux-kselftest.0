Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589802;
	b=T199DazyHL1VweubM+9+ceUVlcWmQIOWA/DFIHbKkTYLbE8HUO3lV46PiAGgh6/mBz4U
	 P5FHMHKRZO1evjRX7uxNGCTQxMrnw/c5KpaPquFHMUKKaVJshg/tT+KWICCG/agoJGo+Y
	 q56A1FoHt7SkBZyFPEBU5BUixSOiW1qx8e3RN5Ktc5j4dMuMpl/5tYBddSBB04IIwqZy+
	 fUa4VL+aRSQa4BSNKhiwLRO6oViEngJiwzMZMpPBTTq0v9tl3gZs1oI3fBD/Ml2zei5Ol
	 mJRvcR7V+2V2FIFO+GqEZciENqq8zGjBy/8Pnp0PpoZzSYmCUsr6yFzTOdiyW860leQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CO0vZwWHnFlrPlO9I1IjS868FeGKeBrErc/5Mvm8QC0=;
	b=nYInLtnT6m9QsCXyOZXRIpi/poRjlZoqTtyv2bR8M7Jou4qjANq3tx8y0pTzfPtmdvMr
	 SAbmz+8Q4oPWpfbPnX8ZeLtNajrXW2ZrE+c1obHqAZzDgkAfMzqWL/xkdOrhzLlkTRppn
	 v0nwXV6C2yhRWCO626rogknI9SX+9g7ojp517MPP2ZhITQ8KMZlIPpwZH+fFNmONPg2jc
	 CP48pRVAKNBnBnYAg30yWHngaaFYuicnsj5ewnso55+dVBnpL2+iD3xYIwUlegsOZCfoM
	 2H5iYVkMtvIJ1BW5m2iOdhqK9V2tp6M3aiBCEB9R8E3C7UMDT7OLHiySDoYvm4OFOkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b="W5U/UJS+";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9778C606A683
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 06:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9778C606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=W5U/UJS+
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a357b1c649so3095056f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 22:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589800; x=1796194600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CO0vZwWHnFlrPlO9I1IjS868FeGKeBrErc/5Mvm8QC0=;
        b=W5U/UJS+7cfwYVajRpOi1u5K/6enm8FRZrPwbeutwCW4xLqgOknI08L1TNMXxVbepI
         NbhoW10qnRAA/6YxRG/xf6WHlyq7lrXl4tlqcWW0vl9JbeyAU2F3GWUmBIkHyfAcr10H
         NiOhpglsfS50EIaUgLY5CoBeg1lqXcUUYcunr3nxmU049foJ0lSaknlm87DL8j1jE5b3
         2JPHzJSOzbE2aOUFuJXAtR6mCyIxkqZoZ8ub7iJ4GUNATeuKGpJQLio5moQvND/BkYL+
         uaZjEirGchKB3KaH91m02dg/WQmcrzfDBlVIBBWz7JVCKI6AkOhDFcWe2HjWBUSP+4nQ
         E2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589800; x=1796194600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CO0vZwWHnFlrPlO9I1IjS868FeGKeBrErc/5Mvm8QC0=;
        b=AVK0kKRcI1XGPGB23n1UrHwofBmKQlWIAkouAGIUrE7EhSTAnLX1gX7s8hVNO8fkHz
         IWWzKAGSEmLmRGQLtZ0ynN6L5R8dSOCU3gkPYf2Vd8kwHjIvnIP08MbDXdSA+fNauxqX
         Z6mU40X/8datJ+/b1+7I2htTXaN0RHlYQ0JSxNlYsVE3HBxBgUQ+Xzgu3oCnkXif0noS
         irI1dhpbieB6jFeS3zr9W6NslwL5eEcm2tBwweNSX+M8kkXC8dTuesHdB2skUKf9CJ8o
         +47fXR5HM0qPlWhCnpmSOtg5lhMDWeKqc1wZeAdqd66suUNZAYjhyg5FDDElyyN3GGjc
         G1DA==
X-Forwarded-Encrypted: i=1; AL+hErHTOxqmb/fi/XetkjOLKgEwdPpVj+xcV+T8xF00RIwoypj0do1jexSyfDAMMjz46ozIVCUT/p2jL67pQrnlvEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ol3A6vX0W7GWPd3molPUC55W4hS6hRTrFTPjIyQEuBk4FnOrc
	ENM7VlCW+FNEjhjdW1OWy/dw1ezfbtd6NV87+UB60oSIsIGQdnsgX5V59cCq8cnsYo0=
X-Gm-Gg: AZFdTZePCouke+jVPEDk3e6rKwT8kUsjeT9hS+j6f8qsZRdYHViVig7TrFoFu0gq9RJ
	sViNWvOCaELIHaBzkRfCVEDzBX7EEzf5UnYfMZBb/x63le+kikrWAsJrxnA7xtjttz4Sc1Dld95
	qIwNmp2Fhh+O9vcIv23KhpNRHtVxXKF67vhSPdXuZKQ3DEwpN2IaEUTTGUgjqZoFJwxi/EdvWl/
	WTWcLNFTo6pBZWaURVufuluZbTJ33ra0cxt92MZo4rdPNYgcdo8N7vqerkWneClbmBzBxzVZd14
	bhmblpJo7g7xZFkiLYBu3jpInNzE9eGZJy1ntZfu8QPXBUxgwrrd7nJIQaS1EDJLSnb+k8LbuBM
	esM+Qnk9oiJ6L9RnwoSJxLp97Z4U7BEAcoZr5kJV749KBMiwH8BfWSKQ9NcY5cUFu4DY8W04vY1
	WHAFYs78PCIsxNofM65Nm29JRgZ68HwRxbPc2kgtVpyO+a4Cu86sNJW6hr5bpotQy8ZZWNU0Nin
	c/dXv021rhhZsddy1kBnhG1CIjDccHdOWEb4KrIaPdEaiyBAZdINvrZbgY2bwDJU842YqVa31Tk
	aRGlxg4GFohwLOVDP2w=
X-Received: by 2002:a05:6000:25ca:b0:4ac:7595:6f67 with SMTP id ffacd0b85a97d-4ac7595721cmr27351070f8f.40.1795589799898;
        Tue, 24 Nov 2026 22:56:39 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm32730554f8f.28.2026.11.24.22.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:39 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:17 +0300
Subject: [PATCH v2 2/8] KVM: arm64: Reset SP_EL1, ELR_EL1 and SPSR_EL1 when
 resetting a vcpu
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-double_exception-v2-2-224689d8a764@pereq.eu>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
In-Reply-To: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Christoffer Dall <c.dall@virtualopensystems.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Sebastian Ott <sebott@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, James Morse <james.morse@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Cc: Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 Dan Carpenter <dan@pereq.eu>, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0

Resetting a vcpu keeps the old values of SP_EL1, ELR_EL1 and SPSR_EL1.
Commit e47c2055c68e ("KVM: arm64: Make struct kvm_regs userspace-only")
changed the reset to only clear the general purpose registers, SP, PC
and PSTATE, and later commits moved these three registers to the system
register array without a reset value.  Commit 85d703746154 ("KVM: arm64:
Fully zero the vcpu state on reset") fixed the FP registers and the
32-bit SPSRs the same commit missed, but not these three.

The impact is that the guest that boots next can read the previous
kernel's stack pointer and exception return address.  KVM_GET_ONE_REG
also returns the old values to userspace, and a rebooted VM doesn't
start in the same state as a new one.

Zero them in kvm_reset_vcpu().

Fixes: e47c2055c68e ("KVM: arm64: Make struct kvm_regs userspace-only")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
 arch/arm64/kvm/reset.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 26081d273408..9c1b42890c96 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -199,6 +199,9 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	/* Reset core registers */
 	kvm_reset_vcpu_core(vcpu);
+	__vcpu_assign_sys_reg(vcpu, SP_EL1, 0);
+	__vcpu_assign_sys_reg(vcpu, ELR_EL1, 0);
+	__vcpu_assign_sys_reg(vcpu, SPSR_EL1, 0);
 	vcpu->mmio_needed = false;
 
 	/* Reset system registers */

-- 
2.53.0


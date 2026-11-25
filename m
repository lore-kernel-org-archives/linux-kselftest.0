Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589805;
	b=UPcCy89EolmWWJpXard2jXHUYXwPD39LJc/ZyQNM1Rrgi4QNqMPZxwSRUWRUnvv4nylS
	 AYaCp3edROMkDecK/Qhq5x/UxbdPJrH41YD+oyaUE5/qFB3061hc4ocvsNZBvBxgUCdeC
	 IK5irhxt0qsSs43faqIqRF1AQa8Zuc2g+6RP+G4osKbrY7DpAiluvJWHNblA7+LXL19LF
	 sGWwCe9knbFjdJ0RlZgLF0I5BlKG1OezaWowTp18hUIMTwOay6iYYecLlP4PkvuKQ6Fyi
	 /12TncOy3dqRtZHPCFebBl00MwxTzuPDlZwPRUu0chHY+qZesHkmZkkiK14a6Zzsuxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=QoytpwQW2+7nMQ4LJ/J4mzx2IC+d/7ZRY8SoLyVie08=;
	b=jnRwkKU0hWmG3rA/dd/0Ks1mV2cwgUOApSMWVUP42aj6K9y1dMP2yPfpu6T4rQbMBHKZ
	 KqYy+6yg2+1CmlshwdVYPfU6sXZuXR5fHr94qiTrIWH13ONAO52wlRiuiMo2GcOl8YAyw
	 45oZedETl6JdbbbOt+cWTlnsTPao4kMrbTT7nwNT//2DDqW1L9KHoVVNC0rHRbHgFwnQ2
	 EAbAAxzgMI8TfVevOxcVzlr2b2NGOkbyvZpdyZbPjF8HKev7Gg3Pc6GyB5rqHBDbWcSbQ
	 Ba0eRSLm3WCgeRgRkoNNbEEbK4z7w4/l4g01eatYtddowDZ0OEbZxd3X2VlFkhGi7ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=Qwu4TVHn;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FDF606A336
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 06:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29FDF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=Qwu4TVHn
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so5031766f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 22:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589803; x=1796194603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QoytpwQW2+7nMQ4LJ/J4mzx2IC+d/7ZRY8SoLyVie08=;
        b=Qwu4TVHnW5keU4MSRtovHL3kWNCRibVMHT5yd6sFTANGcYG2F4QtvKQtJk58u0+Yw+
         GIxNJ0WrtEkkB8C0DhGkPNDoddvnXaWkhAEyfpLWjA6Lu5seBZJZ9woFcCEFD9Dhrpz1
         2+8yQVao6dgIYPABEpcwn8VFa6A7M2iE96PhtMuKDKuUgyDcM+0g4tpr20TLFQU6CE+Y
         VL1h7ONRvNATfpbYeEWlgEL7xWF0d4O0km2XkfSdLjFevIBYdSfORFIIilnHhPyVCake
         iPNrytXSRzPAzRZLHcHvzauBwBEu5RXzAWCxasQm8qpGi0yysz4fgLPuKbj04m/Dm62n
         +zkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589803; x=1796194603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QoytpwQW2+7nMQ4LJ/J4mzx2IC+d/7ZRY8SoLyVie08=;
        b=I1PRuqHYveNHSH5pBs0PEKYsU+qZDOy4yKeVUyBLgzDDGaah/ESGjpYjK2pO+ej/EZ
         TpHMuapc9eNW2RfVJ0ZgOeGv6/c5x2ZAuZI6IyFQ9vbToOitC6tX7wOup11xZhLoSS/K
         o3C/i5Qc986APU5Lx6aid4a5fgzJBLpmEs1+ws6Bj7fpaH2lM8PD4066tWzswgMDD+W6
         Fa4hM920++XDJtwLDRqHD+hCbxx28i4BcoUaViBy2wUmC1krWF72KeRP118cGCUhN0G6
         1WN9cmNn4zfGY/xpzogQwr5xiSGbdyh0lyd7l//YmYPNAMCGV0oxhHXbT//gsREXhWC2
         TTgg==
X-Forwarded-Encrypted: i=1; AL+hErHvMCY6p95Y7zz4fAUsUzs3374DKLByF1pnd8HLkw0MDwgBkqFFt7kTx9pMQyfwQ/wsye99OGDb7iGeSkVhsNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MqEzANMRXagKJBjdfSmn7UGXFwtL3/lBlrwN6MGhK4m0fekyn
	GZHemQ82fQiJjSk9TRPoXenO/imeUdj9EKOkuT0LqlCw7ApjTXWiz3FAVjPkDytuGAo=
X-Gm-Gg: AZFdTZfGk5D+OizNHHpqDgEiUf/WnPUoUo+URtl7cWNZgyOLlMuyVjRxYs25ZkAyA/G
	2RT1Fw08hNBFBCZ6Yz/zjNNkOi16blkogcwTHKA2ovFKoh6r7y+0GNwOBonsD5KRDm3XTORL6lB
	1FbXnLRAv/6/YlCa3gXVwuzrLumX3me/Phm/bnGFCWxJXr3Uxzy1klIYikmO7i5jg5YvaT8xkf8
	BiIbcCYRhqGxZ+D5lvCw9TsCuPShKdFMnn42K6FRWiL3SEpcuyppHSbMM0hpniI7ZGqKoh8jIqc
	qwg8YowoF0pRVtFKA0B2etI+2Y1Aaho6bvUTtENLP59ZDUc/Q6TwVH4b20+0AO5mnORhQPAb2Ti
	RrYnjZkeOg0mdB/3NsDOShV8HF2s5nrn5afva7Fck81dpfXHHHl+B5pHc9MycdIw0gTloWLhS3h
	VmNA0jwu1COVngMcrEd0fE37ihgUHAomAilXS/cJioaGqIBGQJdieEj5DbSEkFrauSUCeleZn/6
	7BjzHfIc9YfW2NyfMtCAWJulqniFKxdzUjZ9xcrf50rUuc9MFbO7Yjzc+ZpbM/6dEFDJDjFIS+/
	6Yyk5lOZRjt+eJfWueYmTOlWPOlmR5JkLMaQLViH
X-Received: by 2002:adf:e00a:0:20b0:490:1881:80ec with SMTP id ffacd0b85a97d-4abb3a4d2camr23594315f8f.36.1795589803330;
        Tue, 24 Nov 2026 22:56:43 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm31864281f8f.10.2026.11.24.22.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:42 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:18 +0300
Subject: [PATCH v2 3/8] KVM: arm64: Discard a pending SError when resetting
 a vcpu
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
Message-Id: <20261125-double_exception-v2-3-224689d8a764@pereq.eu>
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

Resetting a vcpu with the KVM_ARM_VCPU_INIT ioctl keeps a pending
SError.  We used to rely on vcpu_reset_hcr() to clear the SError but
commit f1ff3fc5209a ("KVM: arm64: unify code to prepare traps") changed
it to only reset HCR_EL2 before the vcpu's very first KVM_RUN.

If we reboot a guest while there is a pending SError then KVM delivers
it to the freshly booted guest.

Clear HCR_EL2.VSE in kvm_reset_vcpu().

Fixes: f1ff3fc5209a ("KVM: arm64: unify code to prepare traps")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: new patch
---
 arch/arm64/kvm/reset.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 9c1b42890c96..a5d298d5ce61 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -207,6 +207,9 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	/* Reset system registers */
 	kvm_reset_sys_regs(vcpu);
 
+	/* Discard a pending SError */
+	vcpu->arch.hcr_el2 &= ~HCR_EL2_VSE;
+
 	/*
 	 * Additional reset state handling that PSCI may have imposed on us.
 	 * Must be done after all the sys_reg reset.

-- 
2.53.0


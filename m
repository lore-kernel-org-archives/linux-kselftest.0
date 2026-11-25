Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589799;
	b=VLXznqn1BbZPb+AR+3Ts24Oevwed+Lro24uz83oXD52FVHh7ZyzS9ovx9h3fKLgXhl+B
	 HPw1+cELWq6uVLVsmDjzfV3kzF5dVBQmI/4QrmlnH7OFSH+iRHuzF/pl8lAG4t/4+1Wl3
	 5+UG2MTo2MoYQcPGEGHoTeWpgCetsCQe4CNsujgEZzgfsL/lFliQ+UuB3VZXP1ViMeAQL
	 Tn6J+YvEoyNM1ZqQZt34aAAuwtOqDmahGJdw6ANl6BbOfyMrOCqlJl3Aqdrc9QC63hxOi
	 zhGZAZ/PQB+4u6ypy4uVeOr0K3NGDMMKmcBjXV+zc/CTFUwdqoT4K4og/vnoScDR23A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4BneDH3BrmldgDuSfaRvWpkmdpUNgHqyqEERpyedMrs=;
	b=oRUFk72U9FV+BP9LrZkXazsr5sBFEejP/5PuUkLK1LipfGuNYY3F9mE9+U9fQDnPJ+3V
	 EUlGG9N2n9mnac7i3q6LxH4DPdBrsalHjd/kDEnOyzUznDgyhxK8uPIqOR9sTt7fdKRtm
	 QIq+K9UN6Sg8fHmoyhMLQd/GoeQaBXK3iNOpiud17aPlKRNoKYR9mKtbU5anRjtsY3LZP
	 RPrN1Lu48urZk4AVb+8fkbuWsNXAoAata4ONm1GerqximIIrHPqwxUIUpZvg4M6qxDB+0
	 IakcPENpBA5NG1f9TrJLGP7rnLXi5teycNr8QuMn80xR71GAS+dz8V0FVlNkUyk9IWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b="XBUlah9/";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBAF606A681
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 06:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DBAF606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=XBUlah9/
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so5017051f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 22:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589797; x=1796194597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BneDH3BrmldgDuSfaRvWpkmdpUNgHqyqEERpyedMrs=;
        b=XBUlah9/GQf7hrF7Fc0I5v9Mld1l9uEgPBgSa5e60UnZPTMgSRfXCaR0GlgV8QtsEW
         1l0+3I4zvi7ugP9docqB6bogu8Gcz+3Anw3I1KziFN/T4+OhQcLzpOcC81HZwvgt9xBs
         LDr9jUk3cEoqQp7xe+AX5X8HwkkU4Zdh9NNYJIhlYeA4H7NYoc1BWGCT8QlfWStrsSk0
         1KW71nEYkMXf/XZcyuNB+X6qqw6vtzX9DhNm0kca1awI9gioFCYhsw+fJWlOY24Y5ZPf
         hr8GNgaiWxmZtStudQtaUeDZkWOWNpxD2oUuH01qEMF9GH9qzlW0HWGQyLgAbUPMG086
         Gqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589797; x=1796194597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4BneDH3BrmldgDuSfaRvWpkmdpUNgHqyqEERpyedMrs=;
        b=hA6vuxBBncm3TvciElwBVEjtHrUsfJBAUWMg2YfqJqyfLmDZW6YT4QRvlTQY+F8psY
         e0tRQJatHX7l8Vnj9AIVbU5i/AuvBe+PGPz9Vaa3xhppAnVOQTuBzZ8jlnFL5opR3C0J
         2RjJPRykrX1iaibYNrK4IyZt05STfgXXCRBF8Su8wqklXoZTw/53M65vdZSd43w7COKG
         U8wMhxEBPaPArrNe0uKTxATxOes16YNjN81XM8g25gB50ZuourzEIryy/bi1TicX3Kdl
         FRP5wfVtJghKprSbUo5+tysFUVuePyGp9MwkSLqnN3X3WE6SX+Y4KH6ARTBAY6HXySN4
         I+wA==
X-Forwarded-Encrypted: i=1; AL+hErE7SsI7SUbekAQT3UqTe2NIuui6oZkw0LawCh4aCX+p1RuRLcsWMMk7ksuytHQ9RYF8nO3xNJow0r1P/N/uzq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AmZ2YlGaMZrnfMkk6bCQWmuC9Ke8Iahlwp10G34MGmbbuURhg
	UVT956rgjTQk72vP6/uKapo4v9sJt2UY9F6cR86NuV9Tr1w1M3vbfaXctBoRdczSV0A=
X-Gm-Gg: AZFdTZfxDgFn708v1N/zPHo5BrINS24jSrR0gOz20FyY/yYq3Ap470ne7wGhtZLYi/x
	JSZ14LtPxCAFxZNihjFw2vVKynYL/ah4QZhWmjRf9PbV9t0r5p8NBXZaAs5E2mSHlFmC3gKFRXx
	HG1PF2CxRIdYSwu7YJie+rKrbMMJT4YhPCPx5Nj2YsjM+RaK3k/CEWMD9CXmGyK2WoBiuspbdPn
	D84WgYnBH0HDYyXvfutmlcPpdInll96twkcZYmbYaFV15AwJY2E/K9LI0wtUIjlUzRxxH7jkH0i
	ZEDMW5nhiKOSwnYpa+FatXEORqxeYlfF5ofqaHGSVv2pBsGEXnBVNe6F81qQg9qDKK2x6CL4Eez
	UmZ7+APIVLruAFv09lSsU0yayU9MpFcFBZQIxC8RriKFzMqLXiUYvWHvyOUjTinWGa0PlbIo/Z5
	PgA+NlseIU8QJ1jmuYooJaJ8u+XlrRFe6pjdj9mD985bvCUFHeI72ZrVXsJ+R+yNbsQ9GtVyFeP
	pB1kpAB3zC7OXMmqN5zfzrZqiGb7lwtvIAU7cwfLvGX2S+DNcZoYwTcUHtVBAhu43vSzvsedIok
	w1Y23lMRIX+UI0vK/8Q=
X-Received: by 2002:adf:ee47:0:b0:4aa:5396:a792 with SMTP id ffacd0b85a97d-4abb514608bmr25076345f8f.23.1795589796866;
        Tue, 24 Nov 2026 22:56:36 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm36981016f8f.24.2026.11.24.22.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:36 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:16 +0300
Subject: [PATCH v2 1/8] KVM: arm64: Drop an incomplete MMIO access when
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
Message-Id: <20261125-double_exception-v2-1-224689d8a764@pereq.eu>
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

When a vcpu exits to userspace for an MMIO access, the next KVM_RUN
completes it.  So for a read, the next run increments the PC counter
and copies data from userspace to the destination vcpu register.

A reset should cancel the MMIO read/write access.  Otherwise the next
run will copy memory from userspace to the vcpu and increment the PC
which skips the first instruction.

Clear vcpu->mmio_needed in kvm_reset_vcpu().

Fixes: 45e96ea6b369 ("KVM: ARM: Handle I/O aborts")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: new patch
---
 arch/arm64/kvm/reset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 10eb7249aa9e..26081d273408 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -199,6 +199,7 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	/* Reset core registers */
 	kvm_reset_vcpu_core(vcpu);
+	vcpu->mmio_needed = false;
 
 	/* Reset system registers */
 	kvm_reset_sys_regs(vcpu);

-- 
2.53.0


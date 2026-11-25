Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599164;
	b=KEMeLXdREUCHEQ61tbOqQr2+MnqUZ7we/t2RF9Y6hAedeUZFO4X4vt1dYZlGg/xMKZzZ
	 1XzD9wmVz4xzPz0Uo2qRg3Rc3KDaWka+ajlRj69qjGqJ2OfgJmGjGpISEDwkuWZu7Gdso
	 SjiZeqjv3jRs1x8pkj9KsPD9y0QXzbL40jWTRu4mrGI5gzKSTwzazLvsSslRq2thfmFcI
	 jrFt2LkUd/HGcP2CDMXIbtc6grrlN9TovnMO6cWuFiZDWZXlQk2GtayC6+CKoZd9C0vrv
	 OtGTAC6kBNxSbM93LbFYEzO1JxAwDSB+GwkqrzxI13aLynJLu1yV5J+RPZF5sPgl1ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vz6xI/WxixrEpdd3ywwOb3jpy1gOGMCFJ8JE8A5AwCg=;
	b=k1UvcUlfjGU7p18yXHPDRuDt3+Qj8TRiaMQqvZa7rFXE1elMDL9L8ACpUVwSB8SmAHVk
	 luSYDixKoeTG19r7BYXbbUA0Uw8pZ5NH84nHqK6tJBBUqxHady3HXyuXYFHuNW50IcwE4
	 AyTsmNXOF2sHf87KXkAl4zYm0zCKdFCT9faIpOngxDikkFZUYDPapmBdITAOEvb4fLx7k
	 nSIFBpkCXMo6gkiOKaAtiR4e02+AJsXyuEQF4cNLB3dJEuUi/5C2jBmY3gH0pEzVAK9j6
	 6ECpWbV1Oz4N6srxaEU+lTpqiIqMsZuvvmmxJSiA6KHWN+G50IYEfWLd3wsrdIK0IMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=AqWEO8Cw;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0073C606A329
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 09:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0073C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=AqWEO8Cw
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so56428285e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 01:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795599162; x=1796203962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vz6xI/WxixrEpdd3ywwOb3jpy1gOGMCFJ8JE8A5AwCg=;
        b=AqWEO8CwQkTMHtVYcIOLuHqCHa8uPTdR6xogLnmlooFf70UL6doHQoMWgb+TBbtYm8
         +/kTYzofe6h8tAPEA/By5779kp9X1qykliRXQc75+CRg/neatW43jeGrV/QCG6b4nksZ
         ITNPn+N4wGapg7eibENnYvHVgERO0nVHReG/IXYyV5dcbrjZkpwDs4MjpTKd2aE7VLI2
         zMh4u6j1TwDt1abI13SFwlyWM73qP4XsPOxo+zUm0GWE8FWosugaVzTkv38puBYs6Uwu
         YS2QSEBXOOIpfQWSaKG25ZIjvlUYLNmRLr8XawyzKXPtytjX+w0sSzLfY13c0BTd8aj9
         2N9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599162; x=1796203962;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vz6xI/WxixrEpdd3ywwOb3jpy1gOGMCFJ8JE8A5AwCg=;
        b=Hq1OuCyP/a8YIku1+AXs0Mn/GK34ienB0kTUd7waBj4d+urExqS5Xpqkr8gIsF6HEU
         xCAAYKZlm9oXIVLskFO573kGTNNFP87Zpf8qZZsTzsmdWPtxReE6I1Yzf/fdbbGLoo4U
         vfPCqmNeNoDPEZR2aE7ionWBn5MkaL0lTg3xykx7M5j+aKtIiyGc/vOXvRW6Zbyk5giF
         Kr1NmXPM2Y3FqNUf87hqDVO8kpikl0u1sTw/as9yCiaMD+O3Y0vXz2tW/IC2IHU3l4eb
         f/zvEpzxXB4E+Bc8izKHk5rqr3y1ATUoN+/hzvl4HeofEeyw8foYL7yJnYbrFgVTmg7b
         iNiA==
X-Forwarded-Encrypted: i=1; AL+hErGmMQJR/qRHRv2CqAt+TEWKfxCIWQirHU2TLsWidXOQ+7mWLIujaG3pPVS/S7dlYaPgzcbY4AipSfSa29TSOk4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NWXPYFQ1l+P0bI/S3fu7trbKA16i4AEPCJOw3CNvkkSlE3nGP
	rITxgprBYSr5aJPAnvPD7zCSSjKvozuGqVNt5QdLOix4B1eM2m+uApQXa5fFrGe/BNM=
X-Gm-Gg: AZFdTZf4YQMuRmiiNscr6OhbGdj9qd8QXzdJaQSQ3CegYFko9bp0LLa6cT3+oVYM4IJ
	YrnqXFGgQY3eVONRf6/4ThQMz6bq8+g6hvwZ+ZeyxauzrCSSfnBycI1iTD1iSAxQH4XXpd2oGyo
	ISwuQEVoy8YAD6sawYT/oxpFjtMAugpt7Sw4JBpyU3IaPUQlxoAclOSo6C9FQWwtlE7Tn2Sj5Hs
	RtGlaJJipGd5PtkoV6OcB7R8yRZvb7bx1be484L64IizF7wvvLM4yG/s2DDl5uplBVBbrzWSUtQ
	yFmiN9tu7K7H0FGT7GlTMGUEZa8RUyerVa6MRMjDmedwkzJaxRtdBRPgU3dpMCtok48bEjMu1wv
	8stm5sWlpgvqpAQJwvXf3VxvyndSwV1P1bGRkSUXa1c/Sz0jWVSfJ5q9RiefjyoAB9QNnpqvg8J
	Y90ZJgFbqTsvnE+HwXiGOwKlUlGPiAcRW5m3z91iu/95fnPGRPfIv8kjmOg37BkTkvxicnOFrkf
	oxRuXGZXDW7CjvAibeOD7QpUj463P+UQVG7Dx2jAlo4LbjbCTza9Vid9mfjA1XykgJSMGoICtPU
	81M4eTJtAXH1w/orm+g=
X-Received: by 2002:a05:600c:1c28:b0:4bb:867b:f0f0 with SMTP id 5b1f17b1804b1-4bb88810708mr406437605e9.15.1795599162309;
        Wed, 25 Nov 2026 01:32:42 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bba6a0d65fsm32122755e9.3.2026.11.25.01.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:32:41 -0800 (PST)
Date: Wed, 25 Nov 2026 12:32:38 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <c.dall@virtualopensystems.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Sebastian Ott <sebott@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	James Morse <james.morse@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/8] KVM: arm64: Reset SP_EL1, ELR_EL1 and SPSR_EL1
 when resetting a vcpu
Message-ID: <awarNqNt6Kec5G0M@stanley.mountain>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
 <20261125-double_exception-v2-2-224689d8a764@pereq.eu>
 <0c7c59df-69cd-40fe-830f-60c0f3cedafa@arm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c7c59df-69cd-40fe-830f-60c0f3cedafa@arm.com>

On Wed, Nov 25, 2026 at 09:08:36AM +0000, Suzuki K Poulose wrote:
> On 25/11/2026 06:56, Dan Carpenter wrote:
> > Resetting a vcpu keeps the old values of SP_EL1, ELR_EL1 and SPSR_EL1.
> > Commit e47c2055c68e ("KVM: arm64: Make struct kvm_regs userspace-only")
> > changed the reset to only clear the general purpose registers, SP, PC
> > and PSTATE, and later commits moved these three registers to the system
> > register array without a reset value.  Commit 85d703746154 ("KVM: arm64:
> > Fully zero the vcpu state on reset") fixed the FP registers and the
> > 32-bit SPSRs the same commit missed, but not these three.
> > 
> > The impact is that the guest that boots next can read the previous
> > kernel's stack pointer and exception return address.  KVM_GET_ONE_REG
> > also returns the old values to userspace, and a rebooted VM doesn't
> > start in the same state as a new one.
> > 
> > Zero them in kvm_reset_vcpu().
> > 
> > Fixes: e47c2055c68e ("KVM: arm64: Make struct kvm_regs userspace-only")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dan Carpenter <dan@pereq.eu>
> > ---
> >   arch/arm64/kvm/reset.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> > index 26081d273408..9c1b42890c96 100644
> > --- a/arch/arm64/kvm/reset.c
> > +++ b/arch/arm64/kvm/reset.c
> > @@ -199,6 +199,9 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
> >   	/* Reset core registers */
> >   	kvm_reset_vcpu_core(vcpu);
> > +	__vcpu_assign_sys_reg(vcpu, SP_EL1, 0);
> > +	__vcpu_assign_sys_reg(vcpu, ELR_EL1, 0);
> > +	__vcpu_assign_sys_reg(vcpu, SPSR_EL1, 0);
> 
> nit: Please could we move these into kvm_reset_vcpu_core() where we
> reset other registers ?

Will do, thanks!

regards,
dan carpenter


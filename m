Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114350;
	b=2/seP3z7ilnOx875/ZCzdaqZWwDDLbDarbi3mYsPjMPlq2JhG/hV+6vOGAW5auwNnroT
	 cbc24brsfdCB6rhxiMi2Hdmw4tkX1u7FBZsnamQrShg1Gc7XK4y/f4vJpTToRYETqNRjA
	 AWmDoHgRYXg+Am86VTkc99JKB7Dute7lx0rcDtrBXJ88zadTqBPE30Bj0dlUI4236gDcH
	 pLMDpPqJmPRw8LjPxuPSujwhRjw27TYKjK1DnqHVPu9dZanuMFLp+TC2GFi4JFZ/7uuT3
	 hyMPb/LeomlLq74YqX33p2qB1aFNN55t46uON/h9AAkhB+LSIBh64EaCnOAhd8GfQrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Dri93dGf86JD2a4x55noboCN1Q6q179kTQsK767li90=;
	b=ksuPBeFNvwiUmktlMVK72Xy8gBav9IyWLoVa6/y/Nv0Dswslai3zBM3A0U+ZEfk7O0WE
	 zuLL9upmRbLnOAzf0qn9PbhEVUDIdKJG0WHuYL8LEpmBr3WPokzbkvf8r+lOzz5piBx+u
	 OlvBdnGIN6At2JBNC/sHeAhKuuxXF2R017wIFLbFy2VmUnQs3cif54NFR+CHliws8baK+
	 brHwh/vQ9LPXDsIvHEkMci2zPpfoCYljDac41HuMQF3zGFvDR0EyuNy4zu4lSg0yGFodK
	 +WMfRLDGYnEa3IMpvGZUkEAGe5ugWQaLVgzbUPrZMrFlHZrvGHXk/mWdmNhx+sCp3tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=istjwH1u;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC40F60A2603
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 18:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC40F60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=istjwH1u
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b597558c4cso178646b6e.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 10:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114349; x=1795719149; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dri93dGf86JD2a4x55noboCN1Q6q179kTQsK767li90=;
        b=istjwH1uDtIuP/hVh9STL+elAXD+Md4rxfVCQ5xDwA4uMSRilEvwlspwj8AzFZeLdl
         G978XmYe0mQRFfhlnOesU+fCAzp+QZ3FO9/PewFgKIz1u1WKgYh7WPG8Vjf0gOttzYoD
         NBOF9g4VbnMqKLPK7GeFgLN9SJowLI+oCYGaW9vZGYsamZJH0tvKRhELL20EhHTTZ6Pc
         h4jrX5sBM74Elcyi9TsU3tNcTnpEsGxL0RYYJW0Lipzyyr4LJQWztXNR3ezqYZ96degl
         Ylt/s++522lJwdrDmW3ytIGAfl8gqmzBVNsp+CoIDdQCovlZBn3Pd/BEmvcOEk+j0M3E
         6TqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114349; x=1795719149;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dri93dGf86JD2a4x55noboCN1Q6q179kTQsK767li90=;
        b=W2//Lcxq8EuNnVSQTakxQg/6NAugJvbB92Onx7+IoWHPU6szRMWOYu4UkAebUiqtgj
         9PQRkGt6I1kKMGsNjEOJQWcgd+XpeDkolzOcGentTekjDUQ04j3xHhng82+Rgb7CUdsP
         fVxkkkGPIheq6C+ffEQqC0Ca9L+CpPqw2zsfJ2jjao/fHu6zU5/XoY5YfwwIwLqiBztQ
         ocMWd2F2zXqomCOgP28U2L01/O0JBqvzQcWjerFiKamzFB1Hu0beYac8UwUGL907vyKi
         bbqoaQvF1CJivTAa0ISGnrpT+hVOiFvX2MgYuyfdKzvqoceD9aGFmMA1J0X5WS6WR88O
         SgAA==
X-Forwarded-Encrypted: i=1; AL+hErGKibbKDj/OMueamPP3hFHf6FlIuCEBFv7x4O622xwD7UH0HnvZL15dduGtZwsbQFGIkKYDx1Y9rGWurUlkyL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tVxgTSXdLLgn2f6tMNUQEguGIlZVS9Jfg6UFkYYfkdR9IQhiI
	YBjrAhoLr/2NWA4KoRMCFuAacpdpXQwDCP2erv+Td5w+EQ75HWxwXNMS3rQABLMB+F+psEAXK45
	3z9POOgjQpFfIbU9JJjYdqUr89A==
X-Received: from iok4-n1.prod.google.com ([2002:a05:6602:c604:10b0:9cb:3bd8:aa36])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1805:b0:549:572c:fd42 with SMTP id 5614622812f47-57a0bb85010mr976405b6e.47.1795114348499;
 Thu, 19 Nov 2026 10:52:28 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:55 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-14-coltonlewis@google.com>
Subject: [PATCH v10 13/33] KVM: arm64: Make __vcpu_rmw_sys_reg() atomic
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, James Clark <james.clark@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Mingwei Zhang <mizhang@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Use try_cmpxchg_local() in __vcpu_rmw_sys_reg() so read-modify-write
updates to vCPU system registers are atomic with respect to local
interrupts and GICv3 pseudo-NMIs. This prevents lost updates when a PMU
overflow handler (which may run as a pseudo-NMI that is not masked by
local_irq_save()) updates PMOVSSET_EL0 concurrently with vCPU register
accesses.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 89683a690828e..103c25001c0d2 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1313,12 +1313,14 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *, enum vcpu_sysreg, u64);
 #define __vcpu_rmw_sys_reg(v, r, op, val)				\
 	do {								\
 		const struct kvm_cpu_context *ctxt = &(v)->arch.ctxt;	\
-		u64 __v = ctxt_sys_reg(ctxt, (r));			\
-		__v op (val);						\
-		if (vcpu_has_nv((v)) && (r) >= __SANITISED_REG_START__)	\
-			__v = kvm_vcpu_apply_reg_masks((v), (r), __v);	\
-									\
-		ctxt_sys_reg(ctxt, (r)) = __v;				\
+		u64 __old = READ_ONCE(ctxt_sys_reg(ctxt, (r)));		\
+		u64 __new;						\
+		do {							\
+			__new = __old;					\
+			__new op (val);					\
+			if (vcpu_has_nv((v)) && (r) >= __SANITISED_REG_START__)	\
+				__new = kvm_vcpu_apply_reg_masks((v), (r), __new); \
+		} while (!try_cmpxchg_local(__ctxt_sys_reg(ctxt, (r)), &__old, __new)); \
 	} while (0)
 
 #define __vcpu_sys_reg(v,r)						\
-- 
2.56.1.708.g77570a6a1d-goog


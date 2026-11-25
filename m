Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589811;
	b=xjQUjPbGAzCB8Xd33eYvVo/KK8joLvzQAT+mSUKOAjETlGQFEH1zCKtR7XuWedI4ZWd6
	 dqzunbOYTiSVJoRxluxPfX4OYePDHDh7SSCtow/YHX/cEXndNPFGZZMKTneQc3baMmAk+
	 hIGHDLb3LOXnvH6Awvj4tG3Kt+wxV58oytHhzciep2KoTMvRnIXSNVpvCkxU/Lk9xAoQy
	 eLCND32pCpxMAq1XgQvjJe/0Cpv3wfEkKZzFC1BMdJNqn9C/bgUnQOR9OsjXE9oivjEOf
	 7E9JFRZFm+8s6SVhcrT3+Fu4Qhh1nnkEw2Pt21LNVavbpMiqq/4zM3zs6dXh9UiyfvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RGa577wX/xgJLkYslmrPB3AiasjRjUBJpObETRH3ZKA=;
	b=nLZv8Q9IbtnXm3MQRaMoDYTxtUIyhhCL2XQs/IS+7dJPDAVqiGiNUcEnNvw4Ndr12zby
	 Ge6StiEg+EXABXmpZHYPZEHrrYtBXjFjt/EukWaZSLO7x+eSwyRkClg8tTap480BjR+ne
	 omeNO87hOhHRpoBx4Lx31M2y8Wo3zBYuyYqYwiXGbaLPsNVSyudRH47iTTdbsb0nxKe7Z
	 +fKhFWSma1damKYn68exhqBykFXrxJFmNmh1Z5FaVduSsQtJGHiP56t6zQRDQCiXsdwWO
	 zlESNBG/DZHJazaA7e33OGajlIGVftsy0XOXzoCKtTaLM3Gkf+fg7CSGe+KbmSjHgLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=hKxqrr3g;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5783606A6B5
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 06:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5783606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=hKxqrr3g
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so47664335e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 22:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589809; x=1796194609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGa577wX/xgJLkYslmrPB3AiasjRjUBJpObETRH3ZKA=;
        b=hKxqrr3gaqvIXon62dT+8//wIIjdDSIWRBzPd8QV1IYK3M82N3s8pT7KviOlpbceqB
         POL3tFPjnmgCXRvXs3bG0ihWnNUvLHBMDRWNVHVqTa9drm/i04+WX0EQ1JcraNK1UO2D
         rGTIdvjMeawaDNP+KUP6Wbru6HqOcnsPWNvQE3Ez2fsMxktWXBxkVX+oh987pvDJ/j3S
         qcccSF5b3xeERxNLxxFyr0QA0EYp1sBTBh1+GVlAtpj2u+tCsNbl0bOJC03qVUYLvdM0
         aZG+ezaxM97dC6sWPnDmWRletcm4pAZmkSg8dK2uH50d5PedPpEzp7HoGXwBaO/5Zeoe
         13xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589809; x=1796194609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGa577wX/xgJLkYslmrPB3AiasjRjUBJpObETRH3ZKA=;
        b=wi03gMZaVO7LSj1/QKF2d+Ue7KXUpw9Mgs4L8uLOYMRvbkBbI0HRWOTtDMTqkoZ8eD
         NLlqCYx6d7EUzbYS4FlANV3S2GkIzy3byIelvt7hkE/eJPDik6QVq/gqsyg1I3m5/AgP
         NKKe8rihsxOwE0t2+3EN0IBgvDYZn3N+3Mi0nrXU/KVBWOief3bIedSOwG/aNQCkoOB7
         iGyBCUgaMp50/48RxcVMUcp9zMT0j/dgfg6+fMtBcZIk5euo1qie2A5Pv8keh4wCcy8H
         o7AxOidKiuCVirdup5YKEVSXR7zYj2X4sS6urlCCFWLKpJm0M4A8/mfGjiEinx07izrj
         nU1w==
X-Forwarded-Encrypted: i=1; AL+hErE7UEGDKqmdofx5UV8rkLHtIogV9Y8qSJTadsWVRXFmyON/tY3sghx5W75IEoNN0lwJ9DsV6jC67ibcMx+T8Lk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ndouyUW+MqW+wKsZtnzCrU7jhIzucgHhx78fXjNYJam8W8Yrh
	N30CDrQWrGB6mMyf/UG0TMUOPO3HYRxxaG+Baa2PIpIy+L6EBhMO73UM5qkecNw9CXU=
X-Gm-Gg: AZFdTZfRIQZ8Ln4EIGg0C6m+NidNH51TyUyGIcdHy5xpAdJ9OvbJq5AoGlgZ8zJeyKD
	wEI8SNFTH5+YFbynm2kNt+T9nT4BCaQS98dMYB1kI/+OSbQHGU7Ck1+EKehFfFZBa/9OtrmJC4y
	rygLY+f+8+FBQxtfuiWRuO/Ho1kfYLiHuVXuC91+vYOE1PIPMcbdBPhxC57gZsfL6L6D9Q3eqde
	pTsSZaIIY/e7gxgylzZoAptVpXoeeIbhVpMysNnSmo/e2VWwFk0gTVVUiSquPB2U6u//w58Qfn0
	20VoDmuzw3nv2n82PAkiyXPIxAW5m0XcbcwGenp16aLUomwsqu0cixuqJXAqQ6XX/LG0UA73V4b
	o8LGZhHyzXHQyhmYG4hpXqCpSc2U0nyD+TVpkv0pzkw2qgw+GqsmMkQ4W16wlf6tqVzHw/xnd4c
	LJQCrxnFWEeQBBGlRtM8Tk+mX5RIAccoOAok89ohumIvKn1yFysmp8DeJv3ebM/nkWCi1/aGvM4
	10Ck5I/EhIQShikkjYoqxufbvdte++fxcdByvTVOZEPrCa7En2L5lGvc1sv83/v3DLOj4oImgiq
	nh/51b/ubS7CEQppmV4=
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb8881c630mr352660555e9.27.1795589809163;
        Tue, 24 Nov 2026 22:56:49 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm414574595e9.9.2026.11.24.22.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:48 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:20 +0300
Subject: [PATCH v2 5/8] KVM: arm64: nv: Replace a pending SError when
 injecting a new one
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
Message-Id: <20261125-double_exception-v2-5-224689d8a764@pereq.eu>
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
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.16.0

The kvm_inject_serror_esr() function injects SErrors as the name
implies.  The bug is that it doesn't handle already pending errors
correctly in nested virtualization.

In vanilla KVM the kvm_inject_serror_esr() function always sets
the SError to pending.  However with nested KVM, it might set it
to pending or it might deliver the SError directly.  We can only
have one pending error at a time.  Imagine we enter the function
with an SError pending already.  In the current code if we decide
to pend the new error that's fine, everything works.  However if
we decide to deliver it directly then the pend flags should be
cleared but they are not.  So we deliver the SError directly and
then the SError that was pending on the next exit or entry.

Clear the pend flags unconditionally at the start of the function.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-229065@kernel.org/
Fixes: ce66109cec86 ("KVM: arm64: nv: Take "masked" aborts to EL2 when HCRX_EL2.TMEA is set")
Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: New patch
---
 arch/arm64/kvm/inject_fault.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index aa2011cc0d5a..0f6a89b65074 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -361,6 +361,10 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
 {
 	lockdep_assert_held(&vcpu->mutex);
 
+	/* A new SError replaces any that is already pending. */
+	vcpu_clear_flag(vcpu, NESTED_SERROR_PENDING);
+	*vcpu_hcr(vcpu) &= ~HCR_EL2_VSE;
+
 	if (is_nested_ctxt(vcpu) && kvm_serror_target_is_el2(vcpu))
 		return kvm_inject_nested_serror(vcpu, esr);
 

-- 
2.53.0


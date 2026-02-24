Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D2F3A9DB9
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 17:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771955014; cv=none; b=aqEGmUAfdO/MTm4Pc8UlzhTKYneJkLdy19Mfj67+sDtcyH+ipABciB4MsQ7oVEfn9AiZpzJ6Vjztbu8vdIEFgs/wajivZL9iZiovJ1Hg9OUEdC9cZOosg7z6ptOh6kN1L7ul/4MDqaweOgUec5YM3Tca+DRNofwIYAqoPibdU8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771955014; c=relaxed/simple;
	bh=CzXhE6NIlz4EonhiaZ5X2vjm+voehRbxgQYJDKg7pfY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F5EtVpgE1hgb0oA59ryeUDN+kKajp5SAFqGEFIjN02eurYenLsyrNxVMOqdQ1S6MOfIcBPmGx+Gy0sTPJbYOogGOc3HTb32dxanMkso9Gd0DtYZ9zwzH02xdoyRGvKgX04XiJWiYX1uBcuxWGedFF8OmybuwJtbaIERcwtD3760=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xylueOVz; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xylueOVz"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3562370038dso5148573a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 09:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771955012; x=1772559812; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7EJ6jDZkcc54+WfMFP83ReJ+Vv39B7Cq+a8KWyoH30M=;
        b=xylueOVzD3NHwth8hX+kofCnh4QGm1w6LBpFpTOTc0f2m8Mh77Kct3OBXyWoj2zN0X
         A4d6d8HzHwoFT/4gxQ3Ky1HBcjaBgXwwzTMzuX+mrj9ZFRFBTC0JMKH3ZKj86pF35ssP
         fWoTzA7qkTwTf3QsxNAjiVKjwfgVq4ijw2bXdtupgzUq0oabjhgJDG5xlPXSrEqfvHBQ
         S4KwfzQ0mUvAzpxIeqz48Df9pugb36b47rhhaWjLTR769eDpUuMTTRcgGIfg0viyavlp
         +r8iRa0plO7YpdcAHbsmm1GAb9+Ia4drPeZAlUSZ1H9L4+3Y4GKuIL9CpILxY6HkZh0x
         b5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771955012; x=1772559812;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7EJ6jDZkcc54+WfMFP83ReJ+Vv39B7Cq+a8KWyoH30M=;
        b=mCqkX5hvkgVwsMbOjwDSepIQNbFcLoLKEfdOrXAnkdj9xbV2fpcfuZ7w9YVIN7mP8F
         NP4+FbA3SBvqDOVzbT8pi2Fo1vk8GPqc8qOX/bQCmrhumuhsAwOkTeoG1N88rYz1Lg3F
         sOx1qMXlwW9eNp6tTSBDOUEvE0Mi+dXtBqNQvmLo6qDjJueZO/G0DxC2/agDPTlb4r7S
         jcG33QdRsMdbAh0darfYj3QvG0MmpK5kFn65C5ezFEM1Yzqh66pYquSTlOS0ihcxXdG4
         CdV6vRfkGBzqRybgv2QtCyfy5YBy32VqK1St2/PdDXR3x8Brw/Hpg3QUPKPEiunoRMTy
         khJg==
X-Forwarded-Encrypted: i=1; AJvYcCUg8jSwnhFkkbukWwZIR0V2raJKh4q811+1gNeixERoADQ2ot+/oLndpyndeOAxV2TT+68eS5piT3D6QDQ2qUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDf3Ci5PTjXDBy7Evh+KFraBUI5vo8KgBQ+NcoceiIcS3W2DDZ
	xTHUqYnSq7+gGoJTPqvx66eJa5X9dzPO/ASmjywhH9fe9bmQI3AxIGRjB/mWw1iAHTCsB9v1v0M
	vLVKfOQ==
X-Received: from pjqs3.prod.google.com ([2002:a17:90a:ad83:b0:358:eb53:2d1a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b10:b0:356:2db3:1206
 with SMTP id 98e67ed59e1d1-358ae80a6a3mr10275503a91.13.1771955012397; Tue, 24
 Feb 2026 09:43:32 -0800 (PST)
Date: Tue, 24 Feb 2026 09:43:31 -0800
In-Reply-To: <20260224005500.1471972-6-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224005500.1471972-1-jmattson@google.com> <20260224005500.1471972-6-jmattson@google.com>
Message-ID: <aZ3jQ1prL4dgG0-H@google.com>
Subject: Re: [PATCH v5 05/10] KVM: x86: nSVM: Redirect IA32_PAT accesses to
 either hPAT or gPAT
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Mon, Feb 23, 2026, Jim Mattson wrote:
> +static void svm_set_pat(struct kvm_vcpu *vcpu, bool from_host, u64 data)
> +{
> +	struct vcpu_svm *svm = to_svm(vcpu);
> +
> +	if (svm_pat_accesses_gpat(vcpu, from_host)) {
> +		vmcb_set_gpat(svm->vmcb, data);
> +	} else {
> +		svm->vcpu.arch.pat = data;
> +		if (npt_enabled) {
> +			vmcb_set_gpat(svm->vmcb01.ptr, data);
> +			if (is_guest_mode(&svm->vcpu) &&
> +			    !nested_npt_enabled(svm))
> +				vmcb_set_gpat(svm->vmcb, data);
> +		}
> +	}

Overall, this LGTM.  For this particular code, any objection to using early
returns to reduce indentation?  The else branch above is a bit gnarly, especially
when legacy_gpat_semantics comes along.

I.e. end up with this

  static void svm_set_pat(struct kvm_vcpu *vcpu, bool from_host, u64 data)
  {
	struct vcpu_svm *svm = to_svm(vcpu);

	if (svm_pat_accesses_gpat(vcpu, from_host)) {
		vmcb_set_gpat(svm->vmcb, data);
		return;
	}

	svm->vcpu.arch.pat = data;

	if (!npt_enabled)
		return;

	vmcb_set_gpat(svm->vmcb01.ptr, data);
	if (is_guest_mode(&svm->vcpu) &&
	    (svm->nested.legacy_gpat_semantics || !nested_npt_enabled(svm)))
		vmcb_set_gpat(svm->vmcb, data);
  }

I can fixup when applying (unless you and/or Yosry object).

Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41A33A0B36
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 23:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775519283; cv=none; b=mGKQ8OkNWuxtNMFbF4C0oJSsnC2eRzmmvGEHQWAJQ86uJpaxRG+5o0aMe1ykfrvekxPQkPyukakXJEXzD8sDS4pLkSuB2RU5YxbWO6hUZkqYUlEZdVzVQ2/eIioQky31tQZr58ywPnMOPq5jYYtO27jzuW9ytKllteWCVdaF43I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775519283; c=relaxed/simple;
	bh=x8NG4mfnBIGaHvidp37eSv1frVOu1FSrxdYuqYUhhkE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FyUXDumBL37mhHP5zfh5/80Vzrf9zsXafyPnuEe+20ip3aHOCRblf9nYzBxzO2Z59v2uJNQ1inT6m+9V+tutqG0Eo/EtnAwzqDOTGzkwTHTzqDRsFpTwJZsM77yUzN9BLWDfv1QrZjKLFQWwuqVau4Vjo2YYc4hXe3nkxSMDHqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RlOdkhg5; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RlOdkhg5"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b0c92ff4ebso58610345ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 16:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775519278; x=1776124078; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hwcEAbY2bOvu6u/DfZ78E/6y5JAOUHxIU/exu8Slvng=;
        b=RlOdkhg588nOfN1W1XRJAe5zNNUXAoHDM6cS8/vGfCvFRq0opVtIvHkJyGKhsG09Mg
         8XCYEMBmroxFu4LD3sEZjH5V5yjxBFofjpRehY6CKFmr8w9/I88RMcFRQbf2Z8y33gUs
         7tn+RIX/GJXDB+a8J7a05mbV7Gh+vq+JWNCF2aWPSHmeEG6uMBF52RuvkGUWyOGF7hu8
         tAVF9gC2QuOCLJ2BH+HI57DaOH8kFZWxeBLNoXwSDuhw56r9L8GGHdAA6bFzvzXcFIol
         t5aTC8j4Q6M5sJIGvvxnEEgNre3KAHLoiP8AfDECQYnuV9eyyidhbk0NN3fGvQiRZBBX
         sWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775519278; x=1776124078;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hwcEAbY2bOvu6u/DfZ78E/6y5JAOUHxIU/exu8Slvng=;
        b=XaMGUEGVyOiWmEahVfybVw+ZOZCmLltBPCNhaZ3LAwi+cTAZ/O2e3mYlXryYXhgC/I
         OyxvsJglLHaZmjoFj+DMVDXFyndyfEwJYeJjmopkAHS0UHaxsTlbAs7B4ac+Kws5r1yH
         TXcvhELKfIquGtJBj4VMMwgRCN/oupC/g9JRqFifTub3EbGNhZpFLJAg56sBzCd3Y211
         WKv0H9e3MZqWOi38Zxze7kQgFVZT8At7QaB3YqNPMr+9zZxdoAlwG4XMvC3uYps0tkNq
         LA9KnUevyT4gIiwNuV4rldfX/atUfe36/zl9kFNj/YjRVNlEDxp9zVk7d909J10LZumn
         zgjw==
X-Forwarded-Encrypted: i=1; AJvYcCU0Yx5ssCAYrBBv6KXN8n5bNNcazD2T3sj7BPHBHTOb4q44P6AnhnG7lKFjC/KADjg9NSKvwWv0Qkn+T6KY1V0=@vger.kernel.org
X-Gm-Message-State: AOJu0YySC2PZcfKpyxBpC29n4ITab83NpmO5FhgGZqhaZ8rRpxci4N8I
	0s3phDyQBuoe8+KjHJdYDmvwufaKBN+i3PFsXF1+aTzSL1kua0QgHc7k7xWPaykwHQxALIDvvmt
	R38os4A==
X-Received: from pgh3.prod.google.com ([2002:a05:6a02:4e03:b0:c73:8e3c:d0d9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9389:b0:398:7d6e:27f1
 with SMTP id adf61e73a8af0-39f2ee005c5mr14221162637.9.1775519277748; Mon, 06
 Apr 2026 16:47:57 -0700 (PDT)
Date: Mon, 6 Apr 2026 16:47:56 -0700
In-Reply-To: <20260327234023.2659476-9-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260327234023.2659476-1-jmattson@google.com> <20260327234023.2659476-9-jmattson@google.com>
Message-ID: <adRGLPrmBpX-3DdX@google.com>
Subject: Re: [PATCH v7 8/9] KVM: x86: nSVM: Save/restore gPAT with KVM_{GET,SET}_NESTED_STATE
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Mar 27, 2026, Jim Mattson wrote:
> @@ -1918,6 +1921,7 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
>  	struct vmcb_save_area_cached save_cached;
>  	struct vmcb_ctrl_area_cached ctl_cached;
>  	unsigned long cr0;
> +	bool use_separate_l2_pat;

Land this above "cr0" to preserve the inverted fir tree.

>  	int ret;
>  
>  	BUILD_BUG_ON(sizeof(struct vmcb_control_area) + sizeof(struct vmcb_save_area) >
> @@ -1993,6 +1997,18 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
>  	    !nested_vmcb_check_save(vcpu, &save_cached, false))
>  		goto out_free;
>  
> +	/*
> +	 * Validate gPAT when the shared PAT quirk is disabled (i.e. L2
> +	 * has its own gPAT). This is done separately from the
> +	 * vmcb_save_area_cached validation above, because gPAT is L2
> +	 * state, but the vmcb_save_area_cached is populated with L1 state.
> +	 */
> +	use_separate_l2_pat =
> +		(ctl_cached.misc_ctl & SVM_MISC_ENABLE_NP) &&
> +		!kvm_check_has_quirk(vcpu->kvm,
> +				     KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT);

I vote for either:

	use_separate_l2_pat = (ctl_cached.misc_ctl & SVM_MISC_ENABLE_NP) &&
			      !kvm_check_has_quirk(vcpu->kvm,
						   KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT);

or

	use_separate_l2_pat = (ctl_cached.misc_ctl & SVM_MISC_ENABLE_NP);
	if (kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT))
		use_separate_l2_pat = false;


> +	if (use_separate_l2_pat && !kvm_pat_valid(kvm_state->hdr.svm.gpat))
> +		goto out_free;
>  
>  	/*
>  	 * All checks done, we can enter guest mode. Userspace provides
> @@ -2017,6 +2033,10 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
>  	nested_copy_vmcb_control_to_cache(svm, ctl);
>  
>  	svm_switch_vmcb(svm, &svm->nested.vmcb02);
> +
> +	if (use_separate_l2_pat)
> +		vmcb_set_gpat(svm->vmcb, kvm_state->hdr.svm.gpat);
> +
>  	nested_vmcb02_prepare_control(svm);
>  
>  	/*
> -- 
> 2.53.0.1018.g2bb0e51243-goog
> 

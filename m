Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBCB3DBD51
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 21:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784927968; cv=none; b=JX7+tHE8QYnHr86j9MoKLeF5SxE/YO2AcLVglKYno0U6oZoC77wDzPpRoWuA9YIxc+tIEZHBHyk7C3YlIP7HBr9YL9BWQ8XsqYQ98THp+w+IZBT/sI3D05hmvl0SDF867XETrAmfakdf4zhLUpDblk3mVyRjey1gcphFc3woBSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784927968; c=relaxed/simple;
	bh=WXSYejeR0VIG/9UGkj4OAcz8AzDp1h9wj77h/FvfddM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GXGnG1HIh14skg31giTx23GX+RMWmVajSPkRQPwr45oqIFifLMrqm+Y4raD+d1A0MkFW1KJ9umKdCCAdYX5ZEWaNB1dvmLsGrDgQrwB/Z7jmUbeOLMwMYhkh/NFas1on5IftY4nrY2Wgbq13TDY2pA/+Pfn01BsavkaFI5gGy9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RxFPQ1jy; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RxFPQ1jy"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484f26852dso864593b3a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 14:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784927964; x=1785532764; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=676jeBy0EAQIqzdr2xZT677bczXPwQb8CdOlVs2oUJg=;
        b=RxFPQ1jykx93mSdJgFhrbb8fCipbriJMA131WUmjhSEpem9Cu9M7eSqX2CNdCtXgiI
         /mo+R6CvOWq9ema87ASHwBrgd/03bG8f2/WpqY7LiGbdHfPFYNr8A9nQOWWAZMRx7yyi
         DKbHdRORpQgo9JrBiCY3h1y9Lb8MUWOoEmIk401yilEI1ncGfSdl7lBO8GT6kasJBvmw
         HU2hu9I/PqbqrV6vPPXXq4uTvhRo8u+j00v6kJQxmvEHA6KhEZeKWJbrNozTc9aCbIAI
         t1fpTqbwi8Hu2fLPCQMxVtAL+sfF2aRAn0QvFvDVrAKcpl00KIP+QG64BHEnoX5acMAB
         n4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784927964; x=1785532764;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=676jeBy0EAQIqzdr2xZT677bczXPwQb8CdOlVs2oUJg=;
        b=kYAztdSVmCTOCV7gtA6CZn2PZBaIPFyXo0Xq0XOqhZr77VNgy3vTUeXQKFdYP7Oi7O
         nYeYWSkvU0wCw36gVfOo95rSqLYw7ZGuK86TrOyQauiyn6KmXLgUc+l16AItYyHKVonR
         pGcqYLI2o028oRxsmt7HzTiU8eEa1PHBpVZwqIAaKnTwTJTz+/Lgj9Tyel6gaDCQjGFf
         Y2enNtNdARSAeDBEQkD1uFtDPpgmptUDMLHjUxozisZv4Tbiyq8zAbYmRembZr7GS4bq
         7u9YQIa19k45ulib3otg4GUl9QhuhNo6NCvU/9HYLYJ2YbZKg7GODByatUDZkIIzJala
         uHMA==
X-Forwarded-Encrypted: i=1; AHgh+RrP0I7xO0WVY0oIxuqx5rh8TipyKwN+M26DJMUVGFEnpKzoK7OBmZFnEu5VvnU2JxQljrLSVdOkoHdKSzDTOv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb0wrbRFeRWhNaRyGjGnXvN6w+Wg1bhOe2j7x+nhO6jtPTqX3k
	xOJW/e3IyuNqk0Lim+4ODGU8bAUEWnyekfZGbQ0fHPyUdLvQvCc5gbCvfyqf1eebGhhWKpQHHdH
	07urQcQ==
X-Received: from pgbf36.prod.google.com ([2002:a63:5124:0:b0:c99:aff5:708e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a8e:b0:3c0:9c19:b275
 with SMTP id adf61e73a8af0-3c67e027041mr22595637.67.1784927958810; Fri, 24
 Jul 2026 14:19:18 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:19:17 -0700
In-Reply-To: <20260703212145.343527-9-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org> <20260703212145.343527-9-dwmw2@infradead.org>
Message-ID: <amPW1eAPpUuxLoj_@google.com>
Subject: Re: [PATCH v6 08/36] KVM: x86: Activate master clock immediately on
 vCPU creation
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 03, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Previously, the master clock was only activated when the first vCPU
> processed KVM_REQ_MASTERCLOCK_UPDATE during KVM_RUN. This meant that
> KVM_GET_CLOCK could not return the host_tsc field until after the
> first KVM_RUN, making it impossible for userspace to follow the
> documented TSC migration procedure without a dummy vCPU run.
> 
> Fix this by calling kvm_update_masterclock() directly from
> kvm_arch_vcpu_postcreate(), after kvm_synchronize_tsc() has already
> set all_vcpus_matched_freq. This ensures the master clock is active
> immediately, and KVM_GET_CLOCK returns a valid {host_tsc, realtime}
> pair as soon as a vCPU exists.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/x86/kvm/x86.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index ff45577ed90c..2039bd8518fb 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -13110,6 +13110,8 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
>  		return;
>  	vcpu_load(vcpu);
>  	kvm_synchronize_tsc(vcpu, NULL);
> +	if (!vcpu->kvm->arch.use_master_clock)

Any reason this can't be?

	if (kvm_check_request(KVM_REQ_MASTERCLOCK_UPDATE, vcpu))
		kvm_update_masterclock(vcpu->kvm);

> +		kvm_update_masterclock(vcpu->kvm);

I don't love doing work outside of KVM_RUN that is typically handled by KVM_RUN,
but this seems fine?

>  	vcpu_put(vcpu);
>  
>  	/* poll control enabled by default */
> -- 
> 2.54.0
> 

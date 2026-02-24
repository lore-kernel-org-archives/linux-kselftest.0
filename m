Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087C23B5306
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 18:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956152; cv=none; b=TS4lHUxKOj6m4UAaza70INjtEIoXs0k84pIw4nN2RoNxbHrUdZDyqdWvkSCbLSohP2BwSvUeYY2JIODnaDvKpJO/cX2UlJKO29SHs1TvzReOajJoEue3du6HmL01aVlShV2Zv2yT6OQlBrEIa7IOYMSnAzv//eRcVq94t6n8u8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956152; c=relaxed/simple;
	bh=cCmatAE9dThylWxm+FWpAkIZdUndNZOrMNW0BobX/EE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QDgERMuGpqS/0+wCFc25RtrP+I3KIbmMigB+VEtTfiri9RqWe/yaXQ+306NBfCa4TGwAOb+r7dbiNCTHN+YAYUxsbjP++JFF+c9mb4t+4611FxUe+M47Su8qUBD9Q3EEXFpZkkb7Y+KYfyrGz2sTlEHrCbPOfZCgD+ljo6URQm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gu2tTGLi; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gu2tTGLi"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2aad60525deso390813115ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 10:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771956150; x=1772560950; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G7uW3OCRL1RH7IpRvV4IyaNZ2noM/GHDdO5OSGNsoX8=;
        b=Gu2tTGLiRJrkCCRMvZkD771kLK3+Qdqn8+L56zhdUw9bluI5GFYVxFiMUtBRaL1Gnz
         h2tgPelyJ6Kb3l8XIlPFqDTIkEzdcCzURtAQwi837H3TxMQGOJ2gSfhkDwV6xBbV02+9
         AUzXBEQwwfp50F2amcuk/lsVKJAEbXfFouXJikODaZ3mDogdhEvXKkrK11Fs53RzZKGD
         TErksayemppBpzW4vCOiuHql/6p4NjYFBO9P3cq+dDVtlWXB75esJl+rSbmgQDg3Wqp1
         INQ1kT1Qy3J4AHgm9H5JVTl8a+iGOsmn7L210uycLPGdF4hodvHKX0YmZLLLHOu3e23t
         2YaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956150; x=1772560950;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7uW3OCRL1RH7IpRvV4IyaNZ2noM/GHDdO5OSGNsoX8=;
        b=UMjJGHMrjHM+fYxf33dJkKmJI44wBlCBHUq8j1wNxT7l1EvYJZ6WNU4ruPJOiQIwT7
         ihsO88hYgV7qmF+Qs4+a6MJcVjaj6zn/Qhg4bRfOxKWFCKPU4cOH/PyvjRXLSOKlmN+R
         RJIhPce0SaUCVRpBOcsk2EMDbNb/gH/vkIkx8cOty6J38dI1dTGHyuD0qmIpm3E3t9+Y
         IOG8zE5GR6sHgCPkmfemaLS3qjMVgBxJqY+qYuZOtzqukGHJPg/Fk7wopHEYz18pTSop
         +6fDIc6RLlM9qMumoYEzYMIxt3WLNov7hhTZ9i5h5LO9e08sZt0oK+Mm6A9oZ0VzJpHH
         bSWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhwCx/ex2X3sdnrdv3Qh49hmP3tYiY+zsElr1ytHugNi127nhI7hEQsUJTvVFht/12uVxxRcEoHZqIMNsRUEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHo7miRY947kx7swcmnuBVRvRkZOuwOU8Dqq+RlqHLLdFe+L28
	B+QfDQF2YOVkjazgHsECGvYQI1WDew0rS1e8tIMDuu9FjUETIXGreUU9uY/8NKOVyxjmraAsR7s
	1lR7ARw==
X-Received: from plev10.prod.google.com ([2002:a17:903:31ca:b0:2aa:d604:fb13])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b4d:b0:29f:2f40:76c4
 with SMTP id d9443c01a7336-2ad744e05demr125271185ad.34.1771956150186; Tue, 24
 Feb 2026 10:02:30 -0800 (PST)
Date: Tue, 24 Feb 2026 10:02:28 -0800
In-Reply-To: <aZzQy7c8VqCaZ_fE@tycho.pizza>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260223162900.772669-1-tycho@kernel.org> <20260223162900.772669-3-tycho@kernel.org>
 <aZyCEBo07EHw2Prk@google.com> <aZyE4zvPtujZ4-6X@tycho.pizza>
 <aZyLIWtffvEnmtYh@google.com> <aZzQy7c8VqCaZ_fE@tycho.pizza>
Message-ID: <aZ3ntHUPXNTNoyx2@google.com>
Subject: Re: [PATCH 2/4] selftests/kvm: check that SEV-ES VMs are allowed in
 SEV-SNP mode
From: Sean Christopherson <seanjc@google.com>
To: Tycho Andersen <tycho@kernel.org>
Cc: Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Feb 23, 2026, Tycho Andersen wrote:
> On Mon, Feb 23, 2026 at 09:15:13AM -0800, Sean Christopherson wrote:
> > On Mon, Feb 23, 2026, Tycho Andersen wrote:
> > > > > +	/*
> > > > > +	 * In some cases when SEV-SNP is enabled, firmware disallows starting
> > > > > +	 * an SEV-ES VM. When SEV-SNP is enabled try to launch an SEV-ES, and
> > > > > +	 * check the underlying firmware error for this case.
> > > > > +	 */
> > > > > +	vm = vm_sev_create_with_one_vcpu(KVM_X86_SEV_ES_VM, guest_sev_es_code,
> > > > > +					 &vcpu);
> > > > 
> > > > If there's a legimate reason why an SEV-ES VM can't be created, then that needs
> > > > to be explicitly enumerated in some way by the kernel.  E.g. is this due to lack
> > > > of ASIDs due to CipherTextHiding or something?
> > > 
> > > Newer firmware that fixes CVE-2025-48514 won't allow SEV-ES VMs to be
> > > started with SNP enabled, there is a footnote (2) about it here:
> > > 
> > > https://www.amd.com/en/resources/product-security/bulletin/amd-sb-3023.html
> > > 
> > > Probably should have included this in the patch, sorry.
> > > 
> > > > Throwing a noodle to see if it sticks is not an option.
> > > 
> > > Sure, we could do some firmware version test to see if it's fixed
> > > instead? Or do this same test in the kernel and export that as an
> > > ioctl?
> > 
> > Uh, no idea what would be ideal, but there absolutely needs to be some way to
> > communicate lack of effective SEV-ES support to userspace, and in a way that
> > doesn't break userspace.
> 
> Just to clarify, by "doesn't break userspace" here you mean that we
> shouldn't revoke the SEV_ES bit from the list of supported VM types
> once we've exposed it? Or you mean preserving the current behavior of
> CPU supports it => bit is set?

I didn't have concrete concerns, I just want to make sure we don't do something
that would confuse userspace and e.g. prevent using KVM for SNP or something.

Hmm, I like the idea of clearing supported_vm_types.  The wrinkle is that "legacy"
deployments that use KVM_SEV_INIT instead of KVM_SEV_INIT2 will use
KVM_X86_DEFAULT_VM, and probably won't check for SEV and SEV_ES VM types.

Alternatively, or in addition to, we could clear X86_FEATURE_SEV_ES.  But clearing
SEV_ES while leaving X86_FEATURE_SEV_SNP makes me nervous.  KVM doesn't *currently*
check for any of those in kvm_cpu_caps, but that could change in the future.  And
it's somewhat misleading, e.g. because sev_snp_guest() expects sev_es_guest() to
be true.

Given that it doesn't make sense for KVM to actively prevent the admin from upgrading
the firmware, I think it's ok if KVM can't "gracefully" handle *every* case.  E.g.
even if KVM clears X86_FEATURE_SEV_ES, userspace could have cached that information
at system boot. 

> > Hrm, I think we also neglected to communicate when SEV and SEV-ES are effectively
> > unusable, e.g. due to CipherTextHiding, so maybe we can kill two birds with one
> > stone?  IIRC, we didn't bother enumerating the limitation with CipherTextHiding
> > because making SEV-ES unusable would require a deliberate act from the admin.
> 
> We know these parameters at module load time so we could unset the
> supported bit, but...
> 
> > "Update firmware" is also an deliberate act, but the side effect of SEV-ES being
> > disabled, not so much.
> 
> since this could be a runtime thing via DOWNLOAD_FIRMWARE_EX at some
> point, I guess we need a new RUNTIME_STATUS ioctl or similar. Then the
> question is: does it live in /dev/sev, or /dev/kvm?

Ugh.  Yeah, updating supported_vm_types definitely seems like the least-awful
option.

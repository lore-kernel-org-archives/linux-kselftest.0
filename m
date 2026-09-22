Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5B948FF67
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 18:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102790; cv=none; b=dsb8A4iU/Eq31aatEwezw8cu3XdqNZDLUgC4Ni3yRqNqoObsRmOdD/irx8DarjI5zXsfhzUx/Gv/azdO3co3+wJZVur5gD/7Bgtmdj7O+5QKT2+6QVCZO7rXMufI5TuMLGl1yiVEwUFxlhc0gaXhhneRDRYWOBLUiQB8Y2UqndA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102790; c=relaxed/simple;
	bh=P2oNbUgzNKbPC97q99tgXWb/Iok5vLJAaFSYPNe8o2w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nqiNBCSrKbIVbI238R6sReWAbqsmCEv0cIaq/aMqFeHfp+KbIZoyq7wO/2BgHxaXY2MpKsNGwmpe8ICWeMDR5DVnkkbAZagpOJgyCfHDAYxiuAKt1AudWyGvNDCiQTipH6KJvhlBu8LzkCnRpbLvXxtb7rDsmajtx+HB4Ui4QY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ekHOAbi+; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ekHOAbi+"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so288232a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 11:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790102779; x=1790707579; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wsMfNykkK/cvGUxGrrzkLoJGO5iJ1c5hJgEqfch5614=;
        b=ekHOAbi+hrIDGP5HnGxwI2etEUQxYRj0wGvz6jB4CC1kT9eH9vNNf8T2qgXOkEoqoR
         IEzRBccGesk15NkIaZcYmOqA6D3c3Z73qd8t9i139KEdv+3/OHGNL9x75IeoIuqBwN15
         c2/ERCpg7DdDHfFNMo+MH8e/a73y5IfdB5xNHJY5sZqb7u5Ntn46Ts0sMS0xMbaa7noN
         R/1E66trjXajolmZ2k6gm3Ytlhwuh5mM7nJ0ggNaOTx3erTglnC96+ZX3Sh2iGrRvVtn
         h4nUdAkhIP8zbc2pzKbcMhVTInevuAv1zutv+pyUW1D5TYUeq0vdXOhpFMNR7uxKk6Kr
         WQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102779; x=1790707579;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wsMfNykkK/cvGUxGrrzkLoJGO5iJ1c5hJgEqfch5614=;
        b=U2miXxSHGs4CUnicTkLv5t168apRGQru3z9TddKJCqmNCwT57Hqui15gv/WBi2A+UQ
         +9x9HWguZ0E0qH9vXNrBrQ9CchJU5i4kTpvGsnxlL1H9VNj0uad5p9Z4Xw6fuHKTvyBb
         rL3H/zJashJsnZ6gaKFJJr//fJEBW8Kg4IoLZggm1htnhwT5RogLD6BOOEzEzS8YxIaM
         8Koybus/wyM8Fy5guN1Gl9qg43Ov5meGVuZr1r0lMG77y73Eg4glzn0HpCyAinLk/V6C
         +aMJeL26iRlN08M721doTbdVNlm6blatSQtLH8wTSKe9FX3rKdXwgA9abCC6gVFzapyl
         3Ikg==
X-Forwarded-Encrypted: i=1; AKwUvBwza1fnlvC0EfDQrR6uMlZObhh01ZB/JDEajAM71+mCZ6yc//CtuENGRFSxmpNMM91bqt4mKqdFlnbpo/MI9Hs=@vger.kernel.org
X-Gm-Message-State: AFuF++m02RQWhlGmX3q2EHM4jHkECIUCWlqPlvrKYbUU9OoY+OtYSWPB
	12nh6Qe3gU86FMRCj2E28upEvlumIFkWIdfzenmaq3Ag8thy8g7Y3vmsE79OU9iijQPIslO8Fq3
	14lpk4Q==
X-Received: from pgdh8.prod.google.com ([2002:a05:6a02:5188:b0:cc5:1d7c:ddeb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1bc3:b0:3dd:a197:cf2a
 with SMTP id adf61e73a8af0-3ddf82c4849mr289558637.78.1790102779162; Tue, 22
 Sep 2026 11:46:19 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:46:18 -0700
In-Reply-To: <arLJ4AbNN9Y_IUna@gremlin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org> <arKxjsxuO1F5ExrY@kernel.org>
 <arK5n9HrbZMCOHOt@google.com> <arK5ynpRi7VbY7Ek@gremlin> <arK8seJVT9wYgVCP@google.com>
 <arLD-eZ6dRvfZ52q@kernel.org> <arLJ4AbNN9Y_IUna@gremlin>
Message-ID: <arLM-vJDoO7gQJXM@google.com>
Subject: Re: [PATCH v3 01/14] KVM: Allow architectures to disallow pre-fault
From: Sean Christopherson <seanjc@google.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 22, 2026, Lorenzo Stoakes (ARM) wrote:
> On Tue, Sep 22, 2026 at 11:07:53AM -0700, Oliver Upton wrote:
> > On Tue, Sep 22, 2026 at 10:36:49AM -0700, Sean Christopherson wrote:
> > > On Tue, Sep 22, 2026, Lorenzo Stoakes (ARM) wrote:
> > > > On Tue, Sep 22, 2026 at 10:23:43AM -0700, Sean Christopherson wrote:
> > > > > Rather than have kvm_arch_vcpu_allow_pre_fault_memory(), what if we add a more
> > > > > generic kvm_is_vcpu_loadable()?  That way we don't need to worry as much about
> > > > > the return value, the connection to vcpu_load() is obvious, and we don't need to
> > > > > add another pre-check if future (or cleaned-up existing?) ioctls want to do
> > > > > vcpu_load() in common code.
> > > >
> > > > ...this is exactly what I started out with.
> > > >
> > > > But then you are in a pickle, because _really_ you need to do that check in
> > > > vcpu_load(). Which is a void function. Which is called by every single
> > > > architecture all over the place.
> > > >
> > > > So you'd have actually no way of signalling the error back.
> > > >
> > > > Of course those places are arch code and you could say 'arches should know
> > > > better and if they call it it's fine not to call the arch 'can you load'
> > > > function.
> > >
> > > Yes, that's my vote.  It'd be easy enough to clarify that "rule" with a comment
> > > in linux/kvm_host.h.
> >
> > I feel like trying to make this generic will wind up under-documenting
> > the single example we have with the pre fault ioctl. Putting the comment
> > into a header practically guarantees that nobody will read it either.
> >
> > I'd favor doing something like below and sticking the comment inline in
> > the ioctl handler. Unless I'm missing something blatantly obvious, I
> > don't see why the x86 or s390 pre-conditions can't be tested early too.

Oh, they definitely can.  I'm a-ok with using kvm_arch_pre_fault_allowed() on
s390 and x86, the only option I am against is adding kvm_arch_pre_fault_allowed()
but then not using it on architectures that obviously perform that exact check.

> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -3961,6 +3961,11 @@ bool __weak kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu)
> >  	return false;
> >  }
> >
> > +int __weak kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
> > +{
> > +	return 0;
> > +}

There should be no need for a __weak placeholder since this code is guarded by
CONFIG_KVM_GENERIC_PRE_FAULT_MEMORY=y.  I.e. force architectures to define the
API.  I don't think it's a coincidence that all of arm64, s390, and x86 ended up
with restrictions; pre-faulting is far from a simple operation.

Actually, that's an argument for a dedicated kvm_arch_pre_fault_allowed() versus
a generic kvm_is_vcpu_loadable(): it helps force future architectures to actually
think about when exactly pre-faulting is safe.

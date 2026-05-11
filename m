Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740C8296BDC
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 20:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778531126; cv=none; b=ZfFU8r5FhWA47gUx9AbYa49l0HJurfukluXI+El2gJZyZ6osjDI+WuaO6P7o7ztZFfZaUXshMpHbsLstJ4D++APa/b5riUWYsEfgR/3Fv9hC447efKxz2+JRQEeLA8jwU03Reg9MohOg7R9WF4QUwchvqnQoG+vuMWIOkrV0oII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778531126; c=relaxed/simple;
	bh=521gsLNZI0xfO2hjPJqLM5mszW96I4o8u1KGULWbsik=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h8gQtz3JY/NON9xpETOhz0ryMdt3AzcAM6zL1adRduCv/hnltE3ZiH8twOmvciSmdctr1alMwA8WUz4IwW7UK8D4JUpnfnu7wYNiKeiqIGBE6FEjzSBifxz7a4GyTXzC1YeYDgC9FNQ3RSewtLBfYFfnRMhtfDIkf3h/zir7TLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LF4Pjgxs; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LF4Pjgxs"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-83cecc22d5fso2066626b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 13:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778531125; x=1779135925; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QLnZXwKW2Zx/GnqxpPz3sv+qj2y6viXFGtk3ScJJhFM=;
        b=LF4Pjgxssh5+36UflX45Q3uuZUPT3q/pNr5Z4vNRAtN0TxZofNbioD/zNjEUWsmrfA
         6TBCcxfbEorg+gPe5QOrEQdgYVp0ceyoXJOlBk09ABeege6ufrRjXfUUwJ1NU3bc/EYU
         9VEUK8k9c31ReN+t6SrcPiHMfXXx93l8nWmMs1hN1Irgpy7PZJYkgnrWVFd2io9MNJNk
         UQFkLfwzCnPeo5ZgI5QpYIuEG4Vsl6ilarCRzcxTJk6NM2FIDz9H5iBvYBoWA57bhdO/
         8OxhLmpTK/5sNH/u+3vVPGvlPgAhc91hMzy7vSm37DxgTCKMu2/zDV8G9FKDXFIzlpQC
         sR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778531125; x=1779135925;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QLnZXwKW2Zx/GnqxpPz3sv+qj2y6viXFGtk3ScJJhFM=;
        b=tGLNzE8UzfBGm6KDfNNwuy6i5biSlibW/DaGydh+h7i/lTLGD3+fo4ZL2oQoTanXOE
         BwIImqIcKKbWIBr4YOShEF4eLIf5zQybuw3ObIBqD1gytxoccuR01ByfNERVMSrNjUhk
         MWvzjJVxaGB9P+KS7c3jBfaBtM9HBhkykeH1aly7rRzNFevuIAuv67A4sHtZRDwfZ6E8
         y6yk2jwnp3tV38HjFU9lV0T1BpNvguEOYG9rPuPHu9SbSkektzWy5oDsdFzonsld/tIm
         gaUv2+Wpx0m5KW3YSgGJTZ6gtJrno1lnkrAoENsSq1g/Tm88poxpRbD5LZ7ktN8S98tF
         oI2w==
X-Forwarded-Encrypted: i=1; AFNElJ8zyajIyeGQkS9KZlGJf6Q5A2u10g0B3qqAitPe1ai/q/pmxx2LbsL5+GCViMXALjU8Qt0h+lnRHq3h45DrEoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYRBIGAAXUkUip2KRIoIWQToVRY0g04sEcFNjIECpd94vD1ACL
	Wr1ybttseaH+Won8nx/xDeD002TQZDqlzO/rg2lJKZTNBMOWhVZv8uR+6/b3gqb6aXi9t31ERWw
	1UhFqzQ==
X-Received: from pfbg13.prod.google.com ([2002:a05:6a00:ae0d:b0:838:f05:69ac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:124d:b0:82f:5d4f:7355
 with SMTP id d2e1a72fcca58-83a5d96c238mr24170546b3a.33.1778531124515; Mon, 11
 May 2026 13:25:24 -0700 (PDT)
Date: Mon, 11 May 2026 13:25:23 -0700
In-Reply-To: <CA+EHjTw1z7ROF7u0fKqxDGao7S1kELxNWtyWhLoPQx5uwVfuWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260511113759.610924-1-tabba@google.com> <20260511113759.610924-3-tabba@google.com>
 <agHugdIrptaXZW-2@google.com> <CA+EHjTw1z7ROF7u0fKqxDGao7S1kELxNWtyWhLoPQx5uwVfuWQ@mail.gmail.com>
Message-ID: <agI7M7rZ_NZJyjhj@google.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Fix FD double-close in kvm_vm_release()
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, May 11, 2026, Fuad Tabba wrote:
> On Mon, 11 May 2026 at 15:58, Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Mon, May 11, 2026, Fuad Tabba wrote:
> > > kvm_vm_release() closes vmp->fd and vmp->kvm_fd unconditionally, and
> > > kvm_vm_free() calls kvm_vm_release() at teardown.  A test that calls
> > > kvm_vm_release() and then kvm_vm_free() without a
> > > vm_recreate_with_one_vcpu() in between double-closes both FDs.
> >
> > That's a test bug, no?
> 
> Fair point.  Let me describe the actual use case and then I'd like
> your guidance on which way to fix it.
> 
> The pKVM selftests I'm preparing need to verify that protected guest
> memory is zeroed when the VM is destroyed before the host regains
> visibility of those pages.  The test pattern is:
> 
>   vm_userspace_mem_region_add(vm, ..., GPA_BASE, 1, GPA_PAGES, 0);
>   /* run protected guest, which writes/shares/unshares its memory */
>   ...
>   TEST_ASSERT(get_proc_locked_vm_size() > GPA_SIZE);   /* still pinned */
> 
>   kvm_vm_release(vm);                                  /* trigger destroy */
> 
>   /* host_mem is still mmap'd in the test process; pKVM should have
>    * zeroed it before unpinning */
>   TEST_ASSERT(is_zero(region->host_mem, GPA_PAGES * PAGE_SIZE));
> 
>   kvm_vm_free(vm);                                     /* tidy up */
>   TEST_ASSERT(get_proc_locked_vm_size() == 0);
> 
> I used kvm_vm_release() because it's the only public API that closes
> vm->fd to trigger kernel-side destruction.  But the existing callers
> follow it with vm_recreate_with_one_vcpu(), so the "release + later
> kvm_vm_free()" path isn't exercised today.
> 
> I see three ways to make this clean:
>   a) This patch: kvm_vm_release() becomes idempotent for its three
>      FDs, matching the kvm_stats_release() idiom it already invokes.
>   b) Leave kvm_vm_release() as-is and add a dedicated helper, e.g.
>      kvm_vm_destroy_kernel(), that closes vm->fd to trigger kernel
>      destruction while leaving the kvm_vm struct intact for
>      post-destruction inspection.  kvm_vm_free() learns to handle the
>      half-released state.
>   c) Something else entirely, e.g., the test should manage vm->fd
>      directly and not rely on library helpers for this pattern.

    d) Fully kill the VM; validate the semantics with an explict mmap().

The entire point of the test you are writing is to verfiy that a guest_memfd VMA
doesn't somehow cause KVM to leak state.  So, make that obvious instead of abusing
APIs that kinda sorta do what you want, but not really.

	mem = kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE, MAP_SHARED,
		       region->guest_memfd);

	...

	kvm_vm_free(vm);

	TEST_ASSERT(is_zero(mem, ...));

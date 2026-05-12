Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCF2379C20
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 08:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573212; cv=pass; b=UeXHJO8+1AngCFNZc81+LkGIqt9v2lIDPNfSBNMlbWXzprlwKhSmV2oxmRDxJpDKGt9VyBdErWLmEV5jY8uAAZmj/4Bv/MfcmY6Vw9D3Ep/HujdZZSXwTMgKRQqzf2T6dtncwvFXRVlHvAq60pnnQpIqApzaukrvPJuP5GGjMfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573212; c=relaxed/simple;
	bh=CEPI/IQy+YJsaCiP6F0+ttkRfE9DuAoAzIjprwjhmd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXeX8NKh4bKHwaJ7Bizi0gUxcVGDvVGpEWZjWd2elms+CFkHF24SrrIBaemOMEUsb5/NE/mfU7DUTZg4R6sj2GCyTM+TWeHls5pyHCQrt7mCLC5uVQMJaZUCXu19g70oiITM1MzTgtFK2SKrZmtmYHvwTHI+rP+/AjCMUCyHnt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q/OiResI; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q/OiResI"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50d836552daso2351cf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 01:06:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778573210; cv=none;
        d=google.com; s=arc-20240605;
        b=CVnNVCpNTZT5Kd50pdVx/wI65oTdhzeUEgSS0e0VVnXOE9IHJaCL3t7xegrukLYxBd
         RSPwiPccmnAe+ThElmv2ib7yl90aN2q1upmP/16ZcatckKNcq6NaAI9oY8dKr0bbv07l
         Ib9nC0ZzwuK5DcqWLeCCd71e0K1OWjd36rO01wH8lC/P002GGP/39iun6uO/QoKjN0IC
         JXUFj/2bo0K+Rp6lDYo7oo65Var9MPwME0lLsSgkZsef61Be4vSPtJzHmYkPZOZLloBq
         FJOxZ0j9d7s6DdnHsnfrQsSdkPHaRkxHvwVRx5gY0RcSnrZCUT/uV4aIZvwfftMlnjNd
         mK4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UcX628tp7zp2ETdFQrXxdl3RL6TmG7KIBWzuiytzzfA=;
        fh=6nb3qQ3fVxzgE3OjljdSBcr7DB+jnRIaEa6cB6unoD4=;
        b=YpbB1v0Qs2UOgCXWv9hxCHTa6ZTi+hbWOLo3r3YycogYSe36oMnTZ9UCUfk/MkiXww
         fmby5eSDsvQf8N57eI3LyoeucgdajmpNtWEnW/Nzl0Zh8WK0rnRncyQIM2Er0G0qUgj8
         U5pSgWkmPMq1/ofew2EBxZaiP5MIebasluJh/RnxAbjI/nB1YCUCu8A8K05+OBw270mQ
         sZpOYhxIkcDIF6/rBPuRoUg9XUGyJf/zO8BENadpArKZYN3EyOBeIRkSshbjoZTsLp2z
         msq/fpb0sWqPUQqlQt0fSErQ5iQm9AfCrGXhKiLIdagjIx72qu1GcUib4E91EHIXk1Xh
         kNZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778573210; x=1779178010; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UcX628tp7zp2ETdFQrXxdl3RL6TmG7KIBWzuiytzzfA=;
        b=q/OiResIaDUq5Dt2h59sPjwruHV3s24oa4TChS6rP4f9Oqz1k+/ATPP9i+cf4Hxmoa
         uMFqNpWxRv3HAQNuY0hYBcLrtdid6U9Z/gpeJvzkCxY3Jf2/l49fpodUk4PC6ire32Dp
         DBhoKn5plMFGCCk7adii53eKN9T/6RXJmvAGca7EtKotNUAmvpVVB8q7kWR6ghis5uVd
         mJOlbcqTMk8lK/TM2OmDQA/EY8htueCJyVep2YjZCFqYWprVmrRWeGjmmu3L2vQ/CVig
         NKqgKgMdM5lk4ix5DubPHe0v1NF8+mgHJLDmAKZ6XbAZwqIbIZs3FyEavKGfKFYCULD7
         a9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778573210; x=1779178010;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcX628tp7zp2ETdFQrXxdl3RL6TmG7KIBWzuiytzzfA=;
        b=sPPFVARBPNEFkvotRlNTyuJZaNuQ03N2tCkI2UWyXqIA7L8+SpUhbIvKABVdeyF7YQ
         UAxAmLBEcjONG3h2FUVYC4eCWPQdJQjmzypcfNRT8p+ws3FjMNBiHG8Na1M8UQDBG6Ae
         f503eAC6zn3UhYTDPMxMg7xfTuzcdMy7bziAo481968VgYTjYsQSf8odXGh3cQOBR/jA
         eRUFZ4uY9i1y9GYVY6Us5Bb5vxiyn6Wih4BxPsT2P4HPv6X0b2X0IGR+2hP3/IlpBJnA
         AUUVQdhZWlaSgenNx+FNBIdM7hmEHnHLSF3Jpi8Tb9nOG4oU7cHhE7/H5bW4oi5ptYgM
         a2yg==
X-Forwarded-Encrypted: i=1; AFNElJ9YaxoncJxxI39VClPfFBT4Qz118nzgW1hH5KWPthbM1Rk4lcu365nvNa44PJV2+zGxTIoCYZswIOsrvKWXgAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyepNTTYPyOIeQVt05kGYUlCCFaqlPDEjo6nHhif8vCg31jH63e
	9wecL2Yh6TPZKVVPOuZHC9AvqdNGISQ6E78DQXx7heDUKZ5ctT+IWU6r+cj7sR/haPhVdkTNlcR
	4EK7AUa0vM6HZ+cqHzLo/A7nnEH3Cp0co+MhUxQjC
X-Gm-Gg: Acq92OEw+AVxfappPbDjVtopiVwIjzodjb612u1BUb8768Vnqd8sWUO3gsmsKGMoSfF
	wiimzlqZb9txXu3YNdBvyPE6RMOnW+/cHRcRkQgyBn22/kgyrqvs8i053msH+hlzgaOdZI2xnds
	aeD5UeHkYMq4aaj99oWZRKNtdc7fLc37ux3WcwruT3zCu09ehiwYsT7ofHWNSPhFNf3OhUkESOe
	1Dvrq9DEStJYluKPvP2852op9PT6Ic7Lgn2ObllhtQuwmoxQkcANSUNpa2mEqrhaXYUbLtNCZuu
	QktW9FUbpQSlvuYY1Nj4LA4fYuloIg9YrjdTTR4HmSXKRKTu
X-Received: by 2002:a05:622a:4c85:b0:50e:5eba:cadd with SMTP id
 d75a77b69052e-514d44cc15amr7418571cf.2.1778573209581; Tue, 12 May 2026
 01:06:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511113759.610924-1-tabba@google.com> <20260511113759.610924-3-tabba@google.com>
 <agHugdIrptaXZW-2@google.com> <CA+EHjTw1z7ROF7u0fKqxDGao7S1kELxNWtyWhLoPQx5uwVfuWQ@mail.gmail.com>
 <agI7M7rZ_NZJyjhj@google.com>
In-Reply-To: <agI7M7rZ_NZJyjhj@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 12 May 2026 09:06:12 +0100
X-Gm-Features: AVHnY4KIFSvZuGyoufiD2HkBfoHCrSG6pWS-dmqt_3tBMtmR-2r50gULg7YpqJU
Message-ID: <CA+EHjTxDvkDGyd-uyAqW7ErVxcKnUBpCYAgmnYfCdh+CCSq=3g@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Fix FD double-close in kvm_vm_release()
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 21:25, Sean Christopherson <seanjc@google.com> wrote:
>
> On Mon, May 11, 2026, Fuad Tabba wrote:
> > On Mon, 11 May 2026 at 15:58, Sean Christopherson <seanjc@google.com> wrote:
> > >
> > > On Mon, May 11, 2026, Fuad Tabba wrote:
> > > > kvm_vm_release() closes vmp->fd and vmp->kvm_fd unconditionally, and
> > > > kvm_vm_free() calls kvm_vm_release() at teardown.  A test that calls
> > > > kvm_vm_release() and then kvm_vm_free() without a
> > > > vm_recreate_with_one_vcpu() in between double-closes both FDs.
> > >
> > > That's a test bug, no?
> >
> > Fair point.  Let me describe the actual use case and then I'd like
> > your guidance on which way to fix it.
> >
> > The pKVM selftests I'm preparing need to verify that protected guest
> > memory is zeroed when the VM is destroyed before the host regains
> > visibility of those pages.  The test pattern is:
> >
> >   vm_userspace_mem_region_add(vm, ..., GPA_BASE, 1, GPA_PAGES, 0);
> >   /* run protected guest, which writes/shares/unshares its memory */
> >   ...
> >   TEST_ASSERT(get_proc_locked_vm_size() > GPA_SIZE);   /* still pinned */
> >
> >   kvm_vm_release(vm);                                  /* trigger destroy */
> >
> >   /* host_mem is still mmap'd in the test process; pKVM should have
> >    * zeroed it before unpinning */
> >   TEST_ASSERT(is_zero(region->host_mem, GPA_PAGES * PAGE_SIZE));
> >
> >   kvm_vm_free(vm);                                     /* tidy up */
> >   TEST_ASSERT(get_proc_locked_vm_size() == 0);
> >
> > I used kvm_vm_release() because it's the only public API that closes
> > vm->fd to trigger kernel-side destruction.  But the existing callers
> > follow it with vm_recreate_with_one_vcpu(), so the "release + later
> > kvm_vm_free()" path isn't exercised today.
> >
> > I see three ways to make this clean:
> >   a) This patch: kvm_vm_release() becomes idempotent for its three
> >      FDs, matching the kvm_stats_release() idiom it already invokes.
> >   b) Leave kvm_vm_release() as-is and add a dedicated helper, e.g.
> >      kvm_vm_destroy_kernel(), that closes vm->fd to trigger kernel
> >      destruction while leaving the kvm_vm struct intact for
> >      post-destruction inspection.  kvm_vm_free() learns to handle the
> >      half-released state.
> >   c) Something else entirely, e.g., the test should manage vm->fd
> >      directly and not rely on library helpers for this pattern.
>
>     d) Fully kill the VM; validate the semantics with an explict mmap().
>
> The entire point of the test you are writing is to verfiy that a guest_memfd VMA
> doesn't somehow cause KVM to leak state.  So, make that obvious instead of abusing
> APIs that kinda sorta do what you want, but not really.
>
>         mem = kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE, MAP_SHARED,
>                        region->guest_memfd);
>
>         ...
>
>         kvm_vm_free(vm);
>
>         TEST_ASSERT(is_zero(mem, ...));

The test isn't about guest_memfd.  The pKVM support that just landed
via Will's series [1] is built on anonymous host memory, and that's
the only backing this selftest exercises (VM_MEM_SRC_ANONYMOUS and
VM_MEM_SRC_ANONYMOUS_THP).  The property under test is the one
documented by the same series in Documentation/virt/kvm/arm/pkvm.rst:

  Status: Isolation of anonymous memory and metadata pages.
  ...
  Reclaimed memory is zeroed by the hypervisor ...

The test mirrors that contract: assert VmLck > donated size before
teardown (pages pinned), trigger kernel-side destruction, assert the
host VMA reads as zero (hypervisor scrubbed on reclaim), then assert
VmLck == 0 (pages unpinned).

kvm_mmap() + kvm_vm_free() + is_zero() doesn't translate here.  The only
host view of the donated pages is the memslot mmap, and kvm_vm_free()
munmaps it on the way out, so inspection has to happen between
kernel-side destruction and userspace free.  kvm_vm_release() is the
only library primitive that does that today.

What do you suggest?

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260105154939.11041-1-will@kernel.org/

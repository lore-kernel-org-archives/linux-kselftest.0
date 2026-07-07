Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A008542A158
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 14:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435287; cv=none; b=QeW+CuQGf5H1rjdNj25wwgTsZj2fxzi8XZxwbWQcGnll/01pjWB/LugMf1fAfdcJH9FtF/kal6PPUAdNr5XXbkaF1efRX34Pe+6/apyuNYTf52fguyOxPdgfbZJJrMNVRdMHabBunAA3+LpFql9Kj+Koho4aiP5LkRZjM918wDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435287; c=relaxed/simple;
	bh=qQMEdtTXz171I2WTbhzn4FopszL/mXnqaNRzJolC+1k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PTFItnRQ2eWEa23ryIUf3fnO8x+8n6/nTOFfJKmJ2dtyHz3/FmY8rcv6kOhJm1IpwO1X9nNlvCzJrbDpoimQ8jjZUbsErppGsmSsBjyh/gquYfD/j9BxPmSD9bxzExWAf+LhsaMInP1NW6lRqqx0vl9KAYVWws+inYWMrespX50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pyYhN6zL; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pyYhN6zL"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ccb6823efcso16360565ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 07:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783435284; x=1784040084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNGkGjbaNilzZHQiJqPUU/gSkzxHznR2T+Wqp2o4/zI=;
        b=pyYhN6zL2voML2m9uRhDUELW72AQjZaOIPSDMXfvooCSYh58leTrlG2Gbv7WMN/1jY
         M9t+no7FA4/qNoai6D7wuWQCmSrf0ReQH3uXpbMnL5w13+tPEk6xu/NuUfgd15ZVEQ+b
         oFiRjYxvt6lNUh5cEe6XCIeUmiyv5IcYTDokmthY9DBROkWubBdhpFNRQ1o3ZhqCyqig
         cuugkqJIIsoqOoPX6rEQklrhhDH0Ik4kbcrKxzPOFXRtzHCTe7CYh37cSn5R3Y+ElqwS
         ULV2xwnVcBBcnF9jlg7rrLS+CS5DXs6wzvvKQDyDGm0yh2rUroJ//sd7OoneTl7O2zjq
         c+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435284; x=1784040084;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bNGkGjbaNilzZHQiJqPUU/gSkzxHznR2T+Wqp2o4/zI=;
        b=a9z1RaY0+UmOSc5MI+WgmncUDEl2vlmPI0GIslt4tb3PdoV6qLQ8PVasYmzYr2DaYW
         HtmcvOofsqgK3UJ6ZqFf25qsliGHbUa+Ko0ndcDnUlDOPdJrQiuvj9cn8Qd1fFXizMGF
         NkMt+Db2CcwSX4kdvEP5GvffG7HmhWk53Q18AbVBO27rZrxlfcGtTeIGcNwtBQd8FRz6
         GbUAa2k8cuqSVerUf9o5IsN8wNS9E58f+A6lq/dtYs/KL+6Sf384+95MC2MfBv/qHmqP
         GYKMCvA2OsgNNFOICe2UEoumqrvFas2n8YngcxCB4SHZ4c10ckZnhr1D2ZA6KSixuYGG
         f52w==
X-Forwarded-Encrypted: i=1; AHgh+RpFC6tospD3Sm0Q9Mb4q66qOWqfDL+Y/Kbj3IQR+NaUUyaT2/Pb0Xv8wtBdxPcZz3ZHIiliD4oIlUmGL31r31g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa7HiqHZEETUo31jhVvC73fJa2HfSNIh77ELJm6TxdjyYKqSA1
	7suSz9bRr4DY6QeiYyApbwDwVxsZGZ0QbJmKmH1poTHwRuKW2iLctnLf7aWLgiMTSHg9UpekxR4
	4esn2qg==
X-Received: from plbkf14.prod.google.com ([2002:a17:903:5ce:b0:2ca:5dc9:51d3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3550:b0:2c9:d539:61e7
 with SMTP id d9443c01a7336-2ccbe6267f4mr52774855ad.19.1783435283848; Tue, 07
 Jul 2026 07:41:23 -0700 (PDT)
Date: Tue, 7 Jul 2026 07:41:23 -0700
In-Reply-To: <CALMp9eTr0iJ5QgbZJ0YtOZg89XVFSesbyoGGdtkz+f8c60DcDA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260629125205.52394-1-zhang_wei@open-hieco.net>
 <CALMp9eSLH7pT7X22es+AotxhRMQ1VyziWWELQu6_ZRsyuQ=xzw@mail.gmail.com>
 <0e576fd8d8cd2ed1739cee36eba393fea7745506.camel@redhat.com>
 <f70b4a3b-1ac1-4269-ab7c-0ed1fb42c357@open-hieco.net> <CALMp9eR5jVLGeQck89kro1ocEX5aZcovdGMK+fuzXjqK1NR7kQ@mail.gmail.com>
 <d5645a47-c346-4e63-a5c6-c88bb39a3ee1@open-hieco.net> <akxwt1mX6blSnkxI@google.com>
 <CALMp9eTr0iJ5QgbZJ0YtOZg89XVFSesbyoGGdtkz+f8c60DcDA@mail.gmail.com>
Message-ID: <ak0QE7mP_TeZmzeS@google.com>
Subject: Re: [PATCH 0/2] KVM: nSVM: Expose DecodeAssists to L1
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Tina Zhang <zhang_wei@open-hieco.net>, mlevitsk@redhat.com, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	zhouyanjing@hygon.cn, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2026, Jim Mattson wrote:
> On Mon, Jul 6, 2026 at 8:21=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> > > For KVM-synthesized/emulated #PF/#NPF nested VM-Exits there is no fre=
sh
> > > hardware GuestInstrBytes state to propagate to VMCB12. So I agree tha=
t it
> > > should be simpler to avoid plumbing instruction bytes from the emulat=
or, and
> > > instead fetch the bytes late when constructing the nested VM-Exit for=
 L1.
> > >
> > > I'll try this direction first.
> >
> > I'd rather not, at least not as the primary way.  It's going to raise a=
 different
> > set of issues, e.g. how to behave if reading guest memory fails.  That'=
s probably
> > unavoidable, e.g. if reading the INVPCID descriptor fails, then KVM doe=
sn't even
> > have a pre-decoded instruction to work with, but it should ideally be a=
 last
> > resort.
> >
> > E.g. where the NULL case triggers an on-demand read of guest memory.
> >
> > diff --git arch/x86/kvm/svm/nested.c arch/x86/kvm/svm/nested.c
> > index ba985a02208a..812af3a8d8b9 100644
> > --- arch/x86/kvm/svm/nested.c
> > +++ arch/x86/kvm/svm/nested.c
> > @@ -42,6 +42,7 @@ static void nested_svm_inject_npf_exit(struct kvm_vcp=
u *vcpu,
> >         struct vcpu_svm *svm =3D to_svm(vcpu);
> >         struct vmcb *vmcb =3D svm->vmcb;
> >         u64 fault_stage;
> > +       u8 *insn_bytes;
> >
> >         /*
> >          * For hardware NPF exits, the GUEST_FAULT_STAGE bits are only
> > @@ -68,7 +69,14 @@ static void nested_svm_inject_npf_exit(struct kvm_vc=
pu *vcpu,
> >                                     (fault->error_code & ~PFERR_GUEST_F=
AULT_STAGE_MASK);
> >         vmcb->control.exit_info_2 =3D fault->address;
> >
> > -       nested_svm_vmexit(svm);
> > +       if (from_hardware)
> > +               insn_bytes =3D svm->nested.vmcb02.ptr->control.insn_byt=
es;
> > +       else if (vcpu->arch.emulate_ctxt->eip =3D=3D kvm_rip_read(vcpu)=
)
> > +               insn_bytes =3D vcpu->arch.emulate_ctxt->fetch.data
>=20
> Won't this be shy of the architected 15 bytes if RIP is within 15
> bytes of a page crossing and the instruction ends before the page
> crossing?

Ugh, x86 is so annoying.  Though we need to plumb the number of bytes even =
when
when pulling from vmcb02.

Expose kvm_fetch_guest_virt() and wire up a wrapper for the emulator, then =
this?

	int insn_len =3D 0, len;
	u8 *insn =3D NULL;
	u64 fault_stage;
=09

	/*
	 * For hardware NPF exits, the GUEST_FAULT_STAGE bits are only
	 * available in the hardware exit_info_1, since the guest_mmu
	 * walker doesn't know whether the faulting GPA was a page table
	 * page or final page from L2's perspective.
	 */
	if (from_hardware)
		fault_stage =3D vmcb->control.exit_info_1 &
			      PFERR_GUEST_FAULT_STAGE_MASK;
	else
		fault_stage =3D fault->error_code & PFERR_GUEST_FAULT_STAGE_MASK;

	/*
	 * All nested page faults should be annotated as occurring on the
	 * final translation *or* the page walk. Arbitrarily choose "final"
	 * if KVM is buggy and enumerated both or neither.
	 */
	if (WARN_ON_ONCE(hweight64(fault_stage) !=3D 1))
		fault_stage =3D PFERR_GUEST_FINAL_MASK;

	vmcb->control.exit_code =3D SVM_EXIT_NPF;
	vmcb->control.exit_info_1 =3D fault_stage |
				    (fault->error_code & ~PFERR_GUEST_FAULT_STAGE_MASK);
	vmcb->control.exit_info_2 =3D fault->address;

	if (fault->error_code & PFERR_FETCH_MASK)
		goto synthesize_vmexit;

	if (from_hardware) {
		insn =3D svm->nested.vmcb02.ptr->control.insn_bytes;
		insn_len =3D svm->nested.vmcb02.ptr->control.insn_len;
		goto synthesize_vmexit;
	}
=09
	if (WARN_ON_ONCE(!ctxt))
		goto synthesize_vmexit;

	insn =3D ctxt->fetch.data;
	if (ctxt->eip =3D=3D kvm_rip_read(vcpu))
		insn_len =3D ctxt->fetch.end - ctxt->fetch.ptr;

	for (len =3D X86_MAX_INSTRUCTION_LENGTH - insn_len; len >=3D 0; len--) {
		if (!kvm_fetch_guest_virt(vcpu, kvm_rip_read(vcpu) + insn_len,
					  &insn[insn_len], len, NULL))
			break;
	}

synthesize_vmexit:
	nested_svm_vmexit(svm, insn, insn_len);

> > +       else
> > +               insn_bytes =3D NULL;
> > +
> > +       nested_svm_vmexit(svm, insn_bytes);
> >  }
> >
> >  static u64 nested_svm_get_tdp_pdptr(struct kvm_vcpu *vcpu, int index)

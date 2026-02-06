Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8CB1A9F82
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 23:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770419223; cv=none; b=tXRx6FGB0bAdQFqpFh2hY0SCHnVMaiP1nubipIr/kBTY6c2q9ZNaqqbwDn6cZpvsGIyzXD1l3LzEfse6EnV+MazTKv9sU8rjJl1j76Ml81NjJsZwpz4FdTiERXl73jPB0pnYKADe02l/+ZjixwflS3xIcKYZ9714f9ygq2HhdJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770419223; c=relaxed/simple;
	bh=FcYDzvYt6qRCfMBuYQg/fNZI/Ov7o7ltbY9lGgUO2kM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tV2+oy+dztuXdUfkUN2Y9a+eCLSc8j+rxOG9l69eAKPcbsi0DrfYTNqnaMue2oB4IGYb7GehQqxPEHiWtscWltJPbw/wA81L6EMOJGGlATpFhqSehjP34AP88hzV5g9FvVOcU3gV/v/ilttXFme2IseErCPprkC/WED9DXNc1u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IKsXX8G9; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IKsXX8G9"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-81f48cec0ccso2316241b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 15:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770419222; x=1771024022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZYAv7PTE+yvvy/ZSJd8rfyOzgaRiZuGA2UK+o3e2Dc=;
        b=IKsXX8G93tbTYFPP3ASBcU66NWVIpzE/0Cgtvu7rXa+gc80NfMLcyCV/RD8VcvYdxl
         ouY4zvKjE5h1x2T55o/nU2dDw+KCgMS/RJKVjIlDUJ7dRZjOS23MIq5THawr5GhYtdny
         DV7NqzLAvypH0eRFhuMoD/aLZ1e9xxq1j2+kDBoO5IyoyEQyzWwa2hZgM/2MPpi2RIx5
         8N2cngOFJansRlSfWNEcfxuDLGSMiWWkS21jr6VORg0bb0gLR1ZQ8zrVEqgoM52fH+la
         zkfP3Jqwbx1vn1LexD8pvLCTveQwNjA5jh3OYu//psTam2q1SrREtoN9Z/vR+DJJBxPT
         oaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770419222; x=1771024022;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KZYAv7PTE+yvvy/ZSJd8rfyOzgaRiZuGA2UK+o3e2Dc=;
        b=OveWoUf3mlX1XNX0a9U3Lf5CBpsqIoIeXoAi2HOQH2o1vzus56fW/0KJ8MAWWnJdoj
         gTTL6A7ORyxm7uaTJ9Jr5cPbta1giBBLPWMN1MylcEiysyBoBClo21s/wqkLBboOrHp/
         Na8FrrWGD9xUVM94gOZ5NVkOD3w8cuFSaxARCqDKC26leLKQd5WpuLOhpc8cllL4ZTPb
         WfzNAZ4I4Oez9m6fWj2iAIZ7TlAPej+E1Bv9i0YR+2/HB3ESnzHQPK5hIlOlDNViRU0N
         PYXvxfyFOt0OZ6A/7v+45svG7izrN1VjHf0IaOC8PlCWpV0qx0onoP8jiQH62mVPzm1l
         ffQA==
X-Forwarded-Encrypted: i=1; AJvYcCUsi6NrQgJB0tKj2WdItc6A2AMoApHs3TyQYnQzt+3EQToHQPiKOdTyHTvYsIjC1vQNBh/5ZB8Tnuk8F0BayGU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnfzc1ORQYtrA2WmXHHw7aCG809lWIXmOLb9O/AnYBYP4JcNWM
	u/OVZzOd08V6G9phoLavqH2DupbETc8868V5fKbnpee3FMdr84qVaiSPHO4CqvC6HdObbTAq+3V
	FJjmxPQ==
X-Received: from pfbkq17.prod.google.com ([2002:a05:6a00:4b11:b0:823:6d9:cee8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:e0a:b0:81f:852b:a934
 with SMTP id d2e1a72fcca58-82441623946mr3395482b3a.24.1770419222227; Fri, 06
 Feb 2026 15:07:02 -0800 (PST)
Date: Fri, 6 Feb 2026 15:07:00 -0800
In-Reply-To: <CALMp9eSRj=aykY7FbnPm1OgSwFSkJ=uVVmwsnGjV-A_-AQjxMQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205214326.1029278-1-jmattson@google.com> <20260205214326.1029278-3-jmattson@google.com>
 <aYYwwWjMDJQh6uDd@google.com> <fb750b1bb21bd47f85eb133d69b2c059188f4c05@linux.dev>
 <CALMp9eTJAD4Dc88egovSjV-N2YHd8G80ZP-dL5wXFDAC+WR6fA@mail.gmail.com>
 <aYY9JOMDBPDY48lA@google.com> <CALMp9eSRj=aykY7FbnPm1OgSwFSkJ=uVVmwsnGjV-A_-AQjxMQ@mail.gmail.com>
Message-ID: <aYZ0FMl6E6P1MRf0@google.com>
Subject: Re: [PATCH v3 2/8] KVM: x86: nSVM: Cache and validate vmcb12 g_pat
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 06, 2026, Jim Mattson wrote:
> On Fri, Feb 6, 2026 at 11:12=E2=80=AFAM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Fri, Feb 06, 2026, Jim Mattson wrote:
> > > On Fri, Feb 6, 2026 at 10:23=E2=80=AFAM Yosry Ahmed <yosry.ahmed@linu=
x.dev> wrote:
> > > >
> > > > February 6, 2026 at 10:19 AM, "Sean Christopherson" <seanjc@google.=
com> wrote:
> > AFAICT, the only "problem" is that g_pat in the serialization payload w=
ill be
> > garbage when restoring state from an older KVM.  But that's totally fin=
e, precisely
> > because L1's PAT isn't restored from vmcb01 on nested #VMEXIT, it's alw=
ays resident
> > in vcpu->arch.pat.  So can't we just do this to avoid a spurious -EINVA=
L?
> >
> >         /*
> >          * Validate host state saved from before VMRUN (see
> >          * nested_svm_check_permissions).
> >          */
> >         __nested_copy_vmcb_save_to_cache(&save_cached, save);
> >
> >         /*
> >          * Stuff gPAT in L1's save state, as older KVM may not have sav=
ed L1's
> >          * gPAT.  L1's PAT, i.e. hPAT for the vCPU, is *always* tracked=
 in
> >          * vcpu->arch.pat, i.e. gPAT is a reflection of vcpu->arch.pat,=
 not the
> >          * other way around.
> >          */
> >         save_cached.g_pat =3D vcpu->arch.pat;
>=20
> Your comment is a bit optimistic. Qemu, for instance, hasn't restored
> MSRs yet, so vcpu->arch.pat will actually be the current vCPU's PAT
> (in the case of snapshot restore, some future PAT).

Yeah, FWIW, I was _trying_ account for that by not explicitly saying that a=
rch.pat
is the "new" L1 state, but it's difficult to dance around :-/

> But, in any case, it should be a valid PAT.
>
> >         if (!(save->cr0 & X86_CR0_PG) ||
> >             !(save->cr0 & X86_CR0_PE) ||
> >             (save->rflags & X86_EFLAGS_VM) ||
> >             !nested_vmcb_check_save(vcpu, &ctl_cached, &save_cached))
>=20
> Wrong ctl_cached. Those are the vmcb02 controls, but we are checking
> the vmcb01 save state.

*sigh*

> I think it would be better to add a boolean argument, "check_gpat,"
> which will be false at this call site and nested_npt_enabled(vcpu) at
> the other call site.

Yeah, agreed.  Because even though arch.pat should be valid, IIUC there isn=
't a
consistent check on hPAT because it's never reloaded.

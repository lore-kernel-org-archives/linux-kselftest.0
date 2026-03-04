Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0523DA5DD
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 19:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772651480; cv=none; b=aAuRfw9RoiYD8wgCKbHVFLH+FwyLpVUaJi+1l9kN9ggT2/AZKAZifdRmAQBwEfCoPK1ML6R+CQYr6Uem38b0PCZBc2IXPcvvN9wwAOZIr/ycZxF0UuclFSFi7+PVdgKH30e4X5hApJoNzhEvvX1uZJ11x3+srj9+8+Sc20605+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772651480; c=relaxed/simple;
	bh=dRdL2NEwVuHOVBc3bIuWCDPU1wF737rdFjwwockVEVo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lI+rOxPjTAq9ZGG/3Wc1/1N53tk+s9PcpBpz9IDg0T/rI9Eu8BhjLIwWMmQ3hRbqUFwgVhbZcainJA780VuZzxPzYNoD69uBrLUGvtI6FR5d5d8hkLsca4z5wJG+U1zd45Xz99VbgfoWYNT5POpv4vGQLv0y6L0Gp/SYe1kQw38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OJ7AMNJe; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OJ7AMNJe"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ae49120e74so36226575ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 11:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772651477; x=1773256277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9OtHjmtJSBf+k0JgdOZ0/RBQj404Jf3L0+cEK8R2TI=;
        b=OJ7AMNJeSh4UrJpm6zobjfmI55ImekcITqpepEmU2M7BisYtKHuJwUb1x7ZHmArShg
         buGm0s6xY2A1IvbpB9L08SMZQeq8CA/N19j/79ySMTphbr4lsGCmz0kfn1hmWjQY4L9x
         ZzgNWvoZUu8gUqjgMKAontbONCGQ5xIcF5sigDzaVBH7strLLbsT9FN6BR4Q+56hyns2
         VlCqeU/yRhDdyAOO5kuELOKWbcgnhafo61j2rH0ksUHh24FNshPrZNf/jMgMGmc10WfL
         TTLPhlaeJepw+uJee4lkaMnGH5nljAejPOYyzVy7S/sWjZjcGv99Jvco9LulHzoAK6+T
         FESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772651477; x=1773256277;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q9OtHjmtJSBf+k0JgdOZ0/RBQj404Jf3L0+cEK8R2TI=;
        b=Z9erjRxrj4N9O1euJT/Sx4vcRYDDDWCzY36Q0xoPNGRWgDEbgV06E8PrG+G8Asn3i5
         csgX0bKqtz01bGh3MPJhSYuo8tqW7b8thDMkxGH6YwcMbCfpnevmfsAOaRKPGoIU1CrX
         SBx4cuZ+abcb17w0gR4wukFMx2eXeHepNkyomLMvEFNKjNmYww6M8XwVflJbWXkKt7/+
         vMFrT6LxdyP674pDWmEicRWxJxxKvM4qj3JzU8y+1+5X1gazeuL1bBUMMSYXxitYxq0N
         Aa4Wwt169vmcoCQq7gFTU8qSIOsPQ94hw8gXRiJK3U+Nukio9Kguy0ElTw2oho4M/Y8D
         avCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDc/aWFHLx2LUExXms14vxDTDHtsDJcB2DJ/LgMJPRmwtJZKlFRYLUiYxP08hLJ99tRftrY5R86HnLn2B+TUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaTJ0vnZlhh7YCm3eQ2rrGLzNUAO71nrfk27ckzOyGKOjSscCc
	DpZc9l9VySGfec2nHg9rDXS7Odd2+w0tmIcvx3zNyibYF7cQcnrpMl8v5+V4lBpJdASpgmdA3U7
	hGg0ayQ==
X-Received: from plim9.prod.google.com ([2002:a17:903:3b49:b0:2a0:e956:8aed])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e790:b0:2ae:6457:309a
 with SMTP id d9443c01a7336-2ae6aaf3d37mr28999085ad.37.1772651476339; Wed, 04
 Mar 2026 11:11:16 -0800 (PST)
Date: Wed, 4 Mar 2026 11:11:14 -0800
In-Reply-To: <CALMp9eR7gKWp8M2Q8Q7vA5hGx5bc12KCh1NZMK33A1dpiKNt+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224005500.1471972-1-jmattson@google.com> <20260224005500.1471972-9-jmattson@google.com>
 <aahn2ZfDAJTj-Afn@google.com> <CALMp9eR7gKWp8M2Q8Q7vA5hGx5bc12KCh1NZMK33A1dpiKNt+Q@mail.gmail.com>
Message-ID: <aaiD0k-BE4RZJPfv@google.com>
Subject: Re: [PATCH v5 08/10] KVM: x86: nSVM: Save/restore gPAT with KVM_{GET,SET}_NESTED_STATE
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2026, Jim Mattson wrote:
> On Wed, Mar 4, 2026 at 9:11=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
> > diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> > index 991ee4c03363..099bf8ac10ee 100644
> > --- a/arch/x86/kvm/svm/nested.c
> > +++ b/arch/x86/kvm/svm/nested.c
> > @@ -1848,7 +1848,7 @@ static int svm_get_nested_state(struct kvm_vcpu *=
vcpu,
> >         if (is_guest_mode(vcpu)) {
> >                 kvm_state.hdr.svm.vmcb_pa =3D svm->nested.vmcb12_gpa;
> >                 if (nested_npt_enabled(svm)) {
> > -                       kvm_state.hdr.svm.flags |=3D KVM_STATE_SVM_VALI=
D_GPAT;
> > +                       kvm_state->flags |=3D KVM_STATE_NESTED_GPAT_VAL=
ID;
> >                         kvm_state.hdr.svm.gpat =3D svm->vmcb->save.g_pa=
t;
> >                 }
> >                 kvm_state.size +=3D KVM_STATE_NESTED_SVM_VMCB_SIZE;
> > @@ -1914,7 +1914,8 @@ static int svm_set_nested_state(struct kvm_vcpu *=
vcpu,
> >
> >         if (kvm_state->flags & ~(KVM_STATE_NESTED_GUEST_MODE |
> >                                  KVM_STATE_NESTED_RUN_PENDING |
> > -                                KVM_STATE_NESTED_GIF_SET))
> > +                                KVM_STATE_NESTED_GIF_SET |
> > +                                KVM_STATE_NESTED_GPAT_VALID))
> >                 return -EINVAL;
>=20
> Unless I'm missing something, this breaks forward compatibility
> completely. An older kernel will refuse to accept a nested state blob
> with GPAT_VALID set.

Argh, so we've painted ourselves into an impossible situation by restrictin=
g the
set of valid flags.  I.e. VMX's omission of checks on unknown flags is a fe=
ature,
not a bug.

Chatted with Jim offlist, and he pointed out that KVM's standard way to dea=
l with
this is to make setting the flag opt-in, e.g. KVM_CAP_X86_TRIPLE_FAULT_EVEN=
T and
KVM_CAP_EXCEPTION_PAYLOAD.

As much as I want to retroactively change KVM's documentation to state doin=
g
KVM_SET_NESTED_STATE with data that didn't come from KVM_GET_NESTED_STATE i=
s
unsupported, that feels too restrictive and could really bite us in the fut=
ure.
And it doesn't help if there's already userspace that's putting garbage int=
o the
header.

So yeah, I don't see a better option than adding yet another capability.

Can you send a new version based on `kvm-x86 next`?  (give me ~hour to drop=
 these
and push).  This has snowballed beyond what I'm comfortable doing as fixup.=
 :-(

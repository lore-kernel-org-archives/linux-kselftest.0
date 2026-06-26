Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A63C3F6C28
	for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 13:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782481228; cv=none; b=QLKAyMKgnM4kYkwUHjbsHzl9A3ecUdXA3qRgiJC2IkZ8w/6sFb8wYp+UQmAN0m7BKmGOE8yHe1J+zEnlNexpGgzg3zelhIpIEVopInG1/HWwhHNPeC2/dyB+hr1p+r6PVNiUJIe846ybyHQHviPZQfQk3HVuai7MQeUNzICn8nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782481228; c=relaxed/simple;
	bh=ZTYwDObvNITM63AQAcIL9oQn4r7n//7GEnMzPgbQTlQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Jicawn6ouACmY3K+vjazMzYWwWyGmFc3FFFN292hl3VXtl68pXvZiaBekNTOruyZhMObIDe3nx2Na/fSnk6LiT8gsbckoLSIE1jDLNe4671Auaf6uTGBBtTaoZ2VSm4ZTVK7kXe6GqLt1CnQevzfIe6viMotJMEW4qsrXVKrvV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EqDIJTKT; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EqDIJTKT"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c88fc985a65so606257a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 06:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782481225; x=1783086025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlObcbngD1D37h11uAaHsV+lydVMU0QoTJkAdzqpBkQ=;
        b=EqDIJTKT7BHiWsQC5Q1OnG23UHMY307OZA1VRbAU4X9t9CUkPGnK0maae4QqfJe85N
         eGRTOukJzv1wriqPB/wg0iLU6lmmD5ZQLSeJATCX6d/nvbqR4cvC+n+CqEQnx9i3J3pj
         WfdT4rWbpxojl00vWCTZu7PoB0pMW35d355O1Cy/cIdbTsi3VJIHx2u/fDjRKMMaEu7h
         DRE2VUlK+gzJo0AzRggY6iPkxUrVAo/Jm3Xj2lpSmkKE5MtEWFSOb8qRfo2kZpFLJq35
         e3yXsQbtJoZ4ju8/R+/ClGTYjG58i4b9jxGYaZIPN1bipl4yzTOaQA69m0xIb5V1sgCB
         PsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782481225; x=1783086025;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MlObcbngD1D37h11uAaHsV+lydVMU0QoTJkAdzqpBkQ=;
        b=srpBzpax8nO6wDvm2InIDwUJpCT0Nwsj8EOSQiwCFlWIwNsjLN1H0QsvWPYwpC0BHU
         +axR4+t9T07lc0izxBFE09Khtgbu2f+K4ZrsroNEtw8cveD7+GBbrxiA3vpDbOR0QCIV
         K9JG9i3HzK0RST1oxqmu/f7OztiWEJO+RR+WWYwf+mejR5X44s2ud36blZFBkdHtDKc6
         3jCBNMFl+tdN5pVQOR7Q9WVc27Ydw6SkOPawYaJd4VoISZknHyOq2M+DktCEOCBAeVbO
         wiVeSpNIuM5LAB0qWXIJEZveWB0aUuh5PyDiLnqMiHed+pBjA61p9i5rbklREWaF1z4h
         PEqg==
X-Forwarded-Encrypted: i=1; AFNElJ91BFEtUGChJbh6Gvs3tSargh860iwVV9WwZkwr1nLVA7AuEheHZkvccNCFymvM6xLlFLGxP2UW/uuovhcsNkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLuLsHJU9pBMgZ87xQUCp5vcPJJ4lg08pLhbox5UXtdmbHBW/j
	laVZQ8Ik5K8LDqsXVjQKIBboy3w//6RdvooqpCpscQ/z+Twl47Bj/j1BpmRzSGfhgpv4g5qQuk/
	Sac4chQ==
X-Received: from pgbcl7.prod.google.com ([2002:a05:6a02:987:b0:c93:e04b:d9ad])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7487:b0:3bf:6c08:fb80
 with SMTP id adf61e73a8af0-3bf6c0912edmr420142637.48.1782481224936; Fri, 26
 Jun 2026 06:40:24 -0700 (PDT)
Date: Fri, 26 Jun 2026 06:40:24 -0700
In-Reply-To: <8edfdca645f691cb856e80ade830d78925fdc19d.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <c855535b4262ecd41f67734d19e8f48a7f014c2a.camel@infradead.org>
 <aj21KctIXuf7b_5G@google.com> <8edfdca645f691cb856e80ade830d78925fdc19d.camel@infradead.org>
Message-ID: <aj6BSMT2LOd4JRpu@google.com>
Subject: Re: [PATCH] KVM: x86/xen: Add KVM_XEN_VCPU_ATTR_TYPE_WRITE_HYPERCALL_PAGE
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Durrant <paul@xen.org>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026, David Woodhouse wrote:
> On Thu, 2026-06-25 at 16:09 -0700, Sean Christopherson wrote:
> > > diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> > > index 91fd3673c09a..c16b4560c9e7 100644
> > > --- a/arch/x86/kvm/xen.c
> > > +++ b/arch/x86/kvm/xen.c
> > > @@ -907,6 +907,13 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu,=
 struct kvm_xen_vcpu_attr *data)
> > > =C2=A0{
> > > =C2=A0	int idx, r =3D -ENOENT;
> > > =C2=A0
> > > +	/*
> > > +	 * kvm_xen_write_hypercall_page() manages its own locking.
> > > +	 * Handle it before taking xen_lock to avoid a deadlock.
> >=20
> > Do we actually want the side effects that necessitate taking xen.xen_lo=
ck?=C2=A0 From
> > a uAPI perspective, it's odd to effectively bundle KVM_XEN_ATTR_TYPE_LO=
NG_MODE
> > into KVM_XEN_VCPU_ATTR_TYPE_WRITE_HYPERCALL_PAGE.
>=20
> That's *guest* ABI, and it's derived from Xen behaviour. Xen will
> 'latch' its idea of whether a guest VM is 32-bit or 64-bit, for the
> purpose of shared data structures (shared_info page, vcpu_info,
> runstate).
>=20
> Xen latches this from the current mode of the running vCPU in *two*
> places:
>  =E2=80=A2 When the hypercall MSR is invoked
>  =E2=80=A2 When the guest sets the event channel GSI (HVM_PARAM_CALLBACK_=
IRQ).
>=20
> Thus far, the former has been handled in the kernel (in the code you're
> looking at), while the latter is why we have the ioctl to explicitly
> latch the guest's long_mode from userspace too, as userspace handles
> the HVMOP_set_param calls.

Right, and I'm pointing out that from a KVM uAPI perspective, bundling the =
first
one in a "write hypercall page" call is rather odd, especially since there'=
s
already uAPI to handle the latching.

> > The other question is, why does kvm_xen_write_hypercall_page() drop xen=
_lock
> > when writing guest memory?=C2=A0 That seems odd and unnecessary.
>=20
> Huh? It takes the lock to do the thing that needs the lock, then drops
> it. That is not "odd and unnecessary" at all.
>
> You've been spending too long with these scope-guarded locks.

No, I'm asking why KVM doesn't serialize the writes to guest memory.  Usual=
ly
when KVM writes to guest memory, KVM is emulating something that is very mu=
ch
vCPU-specific, and so if there are races it's the guest's problem to deal w=
ith.

The Xen MSR here is clearly VM-scoped though, which is why it feels odd to =
take
a per-VM lock, and then deliberately drop the lock before completing the op=
eration,
In practice it shouldn't matter, since it sounds like the same repeating 16=
 byte
pattern will be written every time, but it was a bit head-scratching when r=
eading
the code.

> > > +	if (data->type =3D=3D KVM_XEN_VCPU_ATTR_TYPE_WRITE_HYPERCALL_PAGE)
> > > +		return kvm_xen_write_hypercall_page(vcpu, data->u.gpa) ? -EIO : 0;
> >=20
> > -EIO is rather weird, wouldn't -EINVAL be more appropriate?=C2=A0 Ah, a=
nd both are
> > wrong if copying the blob fails.
>=20
> -EINVAL is more for "you asked me to do something that doesn't make sense=
".
> -EIO is for "something went wrong when I tried".

Sure, but KVM returns EINVAL for pretty much every ioctl (or ioctl-like thi=
ng)
if userspace provides bad input, e.g. for the @data param.
=20
> Arguably, the thing that's most likely to go wrong is the
> kvm_vcpu_write_guest() where it writes instructions[] to the guest, and
> maybe that ought to be -EFAULT?

Heh, ya, I just say that too when looking at the code again.

> But I'm not sure that's quite the right semantic to return from the ioctl=
?

We can/should return whatever kvm_vcpu_write_guest() returns, i.e. literall=
y
return its result directly.  Which of course is only ever going to be -EFAU=
LT,
but in the extremely unlikely case that ever changes, we won't have to worr=
y
about creating misleading behavior in the Xen code.

> > > =C2=A0	mutex_lock(&vcpu->kvm->arch.xen.xen_lock);
> > > =C2=A0	idx =3D srcu_read_lock(&vcpu->kvm->srcu);
> >=20
> > Speaking of writing memory, kvm_xen_write_hypercall_page() expects the =
caller
> > to be in a read-side SRCU critical section (I didn't actually run this =
with
> > PROVE_LOCKING=3Dy, but I don't think I'm missing anything?)
>=20
> Yes, good catch. Thanks.
>=20
> > So, if this uAPI is unavoidable seems like we want something like the b=
elow.
> > Either that or guard all of kvm_xen_write_hypercall_page() with a lock,=
 and put
> > the entire thing in a helper so that KVM_XEN_VCPU_ATTR_TYPE_WRITE_HYPER=
CALL_PAGE
> > can be handled in a case-statement and doesn't need to grab SRCU on its=
 own.
>=20
> Makes sense (with the test, of course). Want me to put them together
> and resend?

Yes please.

Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252483803E3
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 18:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786473701; cv=none; b=Y5QGl8bt5mdbPHGqZVeZ860CKqriJjfn/HQaEuqtbkrUo5dr2w5TmpVM2rvggMv/zPpMne3UygCndZ7IHgAUKqOTm1/rspEGeTY7RVgUNEtGABEIzXcYyOA3G2iTDvWRZ6zrRSWszhFh+XAhZVCDkNVVKre63iHKf6v0zeIONJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786473701; c=relaxed/simple;
	bh=94Lt8TmaqiNs5FtCiFHbzvvHftTmibgvQkuT4qx1sEQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QKrb4dBYGlU9QgO52cvCMPoV+boPnBLAZcWhc9OaPtaKJA909KpIczofBKFQMaV+yy6XlN5Zpa6W9QSyeqHnDJaCX+eApalUaf244ak2uYZ56tVH0yMeQ8qyFlbKrxddcjeXMv1v6xRJHImwUsP405Th+nukuqXneh1ZjSN3rPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jdib0Te2; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jdib0Te2"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84eccf9d899so217018b3a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 11:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786473699; x=1787078499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fJOzqFK/vfJSw1ado9uoaagkeuADN2fLa/8s2FkuGPk=;
        b=jdib0Te2Cm3baCHT5yBcxvk0rx7m+lSp0Gemjd24HzyFGYX/y2vtTteCsbsT6yqrZ/
         gM5hZgaDgWBgXpvT+LIOOLxPza63VZa7YBt5RC7chDqhyvmjYh7ixTJtSWGg285tBNHC
         pqj5MDGvbnpnwJZ+qDNodKm+P9WGUB8yWU2cK2jY5o80B3bmFc1ZndE4ZwKBpoPp1Dv1
         eItYviMa07/cvxn9kn3pC5nJaksLQEo+aoe98Z8j7jmouTVP3Uuf29C+2gVpQg6azIXn
         PFx0gkGRmAvTbAzh9QioDf3wUJKLLsSSGb/QqcfAgcfo1qJgmPqonMgE6onMAVNDjWes
         2Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786473699; x=1787078499;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fJOzqFK/vfJSw1ado9uoaagkeuADN2fLa/8s2FkuGPk=;
        b=KWkushUSudwy1pMUF/1KLsifmerAN+UEmMIHGw3LhRJD/LqWsrBzoWK2ZgTXiwdCgu
         3G2oVbNkISlIXCOsj4yTBgNHmxJOdEtAG/vqR7vvc7j0D3BTvfwe+ztkkpqaOsD3L/t9
         u1vgFjgWeTVsiJJBUAwdBzy3r0e26FP88UHZY1jlIpXqHBX8pfHniP6RZjLhbbec8hq5
         iRmu5H0dVkqWTbuqSnIaG13TwCF18ybAAtgvc3BhxkEpO0OfnLB7RTl6+WyIxGG+imx0
         GZp+IxShqV+VsoWCl/aSynIKO3Fx+SqUSxVhLxD6milmYlfaHWo0xpQ54UyvjB/hzDGS
         FTQw==
X-Forwarded-Encrypted: i=1; AHgh+RoUbayG213VIyh2Gddvpu4Q72yclHQjE1lLVV5xtsygfSJvtnKkoTLahc/QWNwi1DosjJJ76eD91OVPXP0skZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxviSmPl/jjYZNrYWnrmVH/gZ7gPfQRBk7cMNMJlzSaYyNLQRaO
	q0r48HUaWgECu+zHgdbdBl+VYinOgab+5SY1ua0yHPbGq7/vpFuOfuA84d0X7xjTrwFwXnsx/YD
	hjOVDFQ==
X-Received: from pfbih2.prod.google.com ([2002:a05:6a00:8c02:b0:84e:530a:923a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2355:b0:848:2c6c:dfe3
 with SMTP id d2e1a72fcca58-84fa86c28d9mr5596667b3a.17.1786473699196; Tue, 11
 Aug 2026 11:41:39 -0700 (PDT)
Date: Tue, 11 Aug 2026 11:41:37 -0700
In-Reply-To: <6ab49538675d97f1f4bf01574b1b066aae0bc05c.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <acd9b32617f75d188c370a464a922af0d650d4f5.camel@infradead.org>
 <ano6-gIZtqMfipiD@google.com> <bb9a12cc663130eb2caa8e839d0f6ca53d722d1c.camel@infradead.org>
 <ansuqrD2KwFuLWbV@google.com> <ansywxh0VX5rtfWc@google.com>
 <e256fa4af96e916ba30019cbba501fa896025fb0.camel@infradead.org>
 <antQYJvRxJxOjtut@google.com> <f5dc701cf3319a7b3c8fd1497f26d051aa9fa3ba.camel@infradead.org>
 <antb01WqOrs-tztm@google.com> <6ab49538675d97f1f4bf01574b1b066aae0bc05c.camel@infradead.org>
Message-ID: <ants4VjfAiblaWsl@google.com>
Subject: Re: [PATCH v7 17/36] KVM: x86: Allow KVM master clock mode when TSCs
 are offset from each other
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026, David Woodhouse wrote:
> On Tue, 2026-08-11 at 10:28 -0700, Sean Christopherson wrote:
> > On Tue, Aug 11, 2026, David Woodhouse wrote:
> > > On Tue, 2026-08-11 at 09:40 -0700, Sean Christopherson wrote:
> > > >=20
> > > > >=20
> > > > > FWIW in my local tree I've just extended the pvclock_migration_te=
st to
> > > > > test precisely the thing you were concerned about: three vCPUs wi=
th
> > > > > divergent TSC offsets, migrated by setting each vCPU's TSC and th=
en
> > > > > invoking KVM_SET_CLOCK_GUEST once, through vCPU0.=20
> > > >=20
> > > > I wasn't actually concerned about migration, I was concerned about =
time going
> > > > backwards from the guest's perspective.
> > >=20
> > > But KVM_[SG]ET_CLOCK_GUEST is *purely* for migration.=20
> >=20
> > Huh?=C2=A0 I raised my concern in the context of "Allow KVM master cloc=
k mode when
> > TSCs are offset from each other", and AFAICT, nothing ensures that won'=
t cause
> > problems.
> >=20
> > Aaah, it clears PVCLOCK_TSC_STABLE_BIT and relies on the guest to clean=
 up the
> > mess.=C2=A0 So the guest won't see time go backwards, but it could see =
time stop for
> > an extended duration, or jump forward.
>=20
> It shouldn't. Each vCPU gets its *own* pvclock structure, tailored to
> *its* offset. They should all see *identical* results.

OMG, I hate this code.  After literally hours of staring at this, and even =
typing
up a lengthy example of why guest time would go off the rails, I finally sp=
otted
that l1_tsc_offset is accounted for by the call to kvm_read_l1_tsc().  FML.

Thanks for being patient and not flaming me too much :-)

> But yeah, if the guest does that then we can't set the
> PVCLOCK_TSC_STABLE_BIT.
> >=20
> > > And your variant just added a dependency on wallclock time back into =
it
> >=20
> > Can you elaborate?=C2=A0 I'm guessing I don't entirely understand what =
you mean by
> > wallclock time.
>=20
> The system_time field? The unspecified might-be-UTC-might-have-leap-secon=
ds one :)

Ok, I think I finally understand the goal.  I got turned around by the comb=
ination
of the name SET_CLOCK_GUEST and the full pvclock structure being passed to =
the
guest.  I was expecting SET_CLOCK_GUEST to literally set the entire clock, =
e.g.
mul+shift, timestamp, etc.

But all of that metadata is just a means to an end: the one and only goal i=
s to
calculate the per-VM kvmclock_offset for the "new" host's TSC+time snapshot=
, by
computing the nanoseconds delta for the new snapshot as if it the guest obs=
erved
the TSC while running on the old host.

And that is done in the kernel instead of in userspace to minimize the amou=
nt of
slop introduced due to delay between taking the snapshot and computing the =
offset.
And for similar reasons, it's undesirable for userspace to redo the GET on =
the
target to compute the explicit offset, because there would be a massive TOC=
TOU
issue, e.g. if KVM took a new masterclock snapshot between GET and SET.

After working through that, I feel quite strongly that we should have asymm=
etric
names for the GET vs. SET flows, because the actually functionality is also=
 very
asymmetric.  And setting a field, and only that field, that's doesn't have =
a
direct association in the userspace payload is very surprising when the nam=
e of
the ioctl suggests a restoration of the entire payload.

E.g. KVM_GET_REFERENCE_PVCLOCK and then KVM_SET_REFERENCE_PVCLOCK_OFFSET?  =
Or
maybe UPDATE, CALCULATE, REFRESH, or COMPUTE instead of SET?  I think I'd v=
ote
for SET even though it's convoluted, because pretty much everyone associate=
s SET
with the restore side of save/restore.

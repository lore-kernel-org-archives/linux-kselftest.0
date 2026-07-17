Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F3937CD59
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 18:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311678; cv=pass; b=KiJfLaPE1NgLgeMqmRbgH3F/9hALVlYdkT+J5+3hA5uNGulj3xv/PzHcNKE92nNBXKo9iiEpP9ioXNgO4ty+edqrnHok7MWjQQR0RZ45/r7zDuRkyMBFU5OtAYvw73zFb7+4nk1oIWG4RkL6WVTJPb6OI8FkAKBcDQo/9NOAYMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311678; c=relaxed/simple;
	bh=XNN0JpTZt4JS4XA+k0s5ZjKLsam3WypcC0ebaleTyjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GmJtJP/NnEh0fEAQKd27DtO4fAR60Es3iAX5Yf61NuO8ymvswmcdvSD0DLPEHMGAMduTf4KTIA+7JgS/Jp7JtBRat7M2+bAlkgIHEL+/Acz4IBhwYrVG4S6bqIyn3m8Y8oeH2sQKcXT6i7+zyWQMz78pQ1Kmbv42BlPXT6LLwHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G/S+npVt; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G/S+npVt"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38759bcd877so7099613a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 11:07:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784311675; cv=none;
        d=google.com; s=arc-20260327;
        b=hzdE70srkLzII6TN38mEPma5rly84hWYIcsqoFnGPC8xQ/iMAbI11JGgiubXc1/5E8
         O1r2qzOxcT/VIL3vDTPiIFmZKK0Su1lNXYCSIhQnR17MrOcBsDvTsRVMvUZVgUEgPQB7
         2qedB/V7GTLrW1CGXIn4xk9C4ijWkJJmBDyKwtlHM+tR8SQWOyrdbF8MZ/UfIeixEz+Z
         cxuVY/taGc3Z3Ke0ibsnx2ej7FKGR5y8qdecvzELFjpUE0iSSEYoFYUkiUXSfIqgPkis
         9R3ogijZPMCA2KvT4q9ktxBf9PurEDwrV7wacLJJSKDkvhzbFBkNba/9XQUsQs5Lt8vI
         A/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oHggWXBEHwEkm7E6ec3wMUq0bi8f7fhVcVQVAKiXHao=;
        fh=knGMsHxwatnV9sHDoEssna0TVdDE9hwpGeLWUrOthHQ=;
        b=WUUmX0qRt/gW0b3s5XJDVSJFLtYtJJylD6KQR5EaPWXBJm9gu4WjDTPP9bYiOhdqKF
         7+4PxRF8toY6UOIGHOcdBSFypufbcViGXkZlrukniCZPdhxU9MDcE46134owsemVqs0m
         T2jEFIYHs+3ej+/jENiVD4+pese+MBvcY4RSMFGrol43V2pRfGJHQm7NW//wKjEzthxb
         SXIxD08qHD+pMmyP3CSmSIyX/PJrqCpw2o7Vkd/Fcgx72JMSSW6gW9UWJ/9nj43I0UmF
         jB8+Djtp7OHfFVj5By9JTpYTE5gnWlAFmCfgYVHMXX+OAf7tHMy7ezdjhPMvyc7rmXbT
         Dxdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784311675; x=1784916475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oHggWXBEHwEkm7E6ec3wMUq0bi8f7fhVcVQVAKiXHao=;
        b=G/S+npVtkG1DqE3Qrv12SDfeqj2k048H+KVSZa3Mrej9tPxqjEe3bmQgP3uOYiJHJo
         qNy2hCDAi4Qye5q/rUZQgwgLi2ALqB/U2AB/CEiwPZq1Dymslx2c9D9b8UHE5ZqwRj3o
         JpNRXbMCsSfU/b54jcdGitA0NXWo1tNexaxpKV2NCZnT26oUDYywj338uoeIJjDcYwTd
         63XHz+i4lLbJpUwDYtCGFvBaK3L5vsOWjpIxOfKXtx+dgl/fkBVniG54mU6vWnEDViIK
         U4DPWqduuvzi+b8bRT7Tpu1M/vkqFxlfBNc7nCl7mLSOWTdRvZYWn4klXwoUuMkMrKZl
         SXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784311675; x=1784916475;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHggWXBEHwEkm7E6ec3wMUq0bi8f7fhVcVQVAKiXHao=;
        b=TL1BWNkWHsEzXtw9yuqmD3vOVUx7ZFgB+JNMrHvhS//mmSTra7ju/ZgSFbq64tY7DC
         dGGXUQvR3jnt1WBHceCR3aJb6VWjdkfNWcuO9/9288VCMYFthJV0r7WlkG/WQe5SIaPG
         7ukzq5liPkulsjnXFjO9+pP094rniI1TqPNsU/g4eqaJ1T5sBImmhkO8uFmySJ+jUXdC
         H0lmNF/GaLbKsyTEVm5g/G3lfmuP0+9DFB4BXRo5VbJue/QtLWjDTZ6llrtrPeEqTWbx
         FefCWkXNs70Z2P8ChWnI3UAqJXQ6rznZz8hbw3Bf819pbEc2wRCXdizSiVWA6e3IQJIm
         rdtg==
X-Forwarded-Encrypted: i=1; AHgh+RozyeM46DKFgV0GUQ2SaxHfo0c5cVJiNzP5iTsWYwuUClvdRyoPUGU0/qAmZErjmixrPOx9dyhlV+O243sYHHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuiZRvnBzphJDtbOKKj811S/bo4Ttet/IcThKFvI9NPYsAnSfz
	zvUdh3eHyrO154iUo9uoLKo+uejJJEc9SEnrWnoO4/zZPEjuSCIwceFkAhqXp37e9M5oDBlWPCM
	ciiZSnjzFCe3PEJoXblLs3x4y0uoUHOoPwpOusGQe
X-Gm-Gg: AfdE7cm70vWZpO7BnoR3qhe6G1fOTGSkhPlORQLaa87GViIch79cPKyN5iZKapqp4dR
	mRUMDVa8lvCP+4rfTOXv/BTh07H8veumU5FsRtNtWKF+6Hy4HKIUEC0TLd99UGIwigOZak7Apqu
	oOiET4qpyoDQeTe5k5/y6t9t5HvgcUN7biATKcaEP1+0uHOt14SZaHK7pALbiHrmNc4LNchRqdR
	KnWucVp875ENFM95VPBe52+OGUSD7gVzJIh+Mu7oini7ZTlYqRqsxFFXKQ5hQ==
X-Received: by 2002:a17:90b:1e44:b0:38e:584f:2515 with SMTP id
 98e67ed59e1d1-38e584f25c6mr761804a91.37.1784311674411; Fri, 17 Jul 2026
 11:07:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714190356.190328-1-dmatlack@google.com> <2vxzy0fcicpi.fsf@kernel.org>
 <20260715172336.GC3775915@nvidia.com> <aljtXsr6xvI6FAmA@google.com>
 <2vxzh5lzhrgk.fsf@kernel.org> <alphOhGU2c90l_3m@google.com>
In-Reply-To: <alphOhGU2c90l_3m@google.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 17 Jul 2026 11:07:27 -0700
X-Gm-Features: AUfX_mzfx9OYJHTdyoObAAgLGZ66H2glYXt1USO9ylzsx0cIDR5QQ0HWu7nHJrA
Message-ID: <CALzav=eKcJiCoR+w0krwtFOFeBXXYPK7YsDEhk+v3ZqzAgp=WQ@mail.gmail.com>
Subject: Re: [RFC PATCH] liveupdate: Allow multiple openers for /dev/liveupdate
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Mike Rapoport <rppt@kernel.org>, Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	uca.boccassi@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 10:07=E2=80=AFAM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On 07-16 17:41, Pratyush Yadav wrote:
> > On Thu, Jul 16 2026, Pasha Tatashin wrote:
> >
> > > On 07-15 14:23, Jason Gunthorpe wrote:
> > >> On Wed, Jul 15, 2026 at 03:50:33PM +0200, Pratyush Yadav wrote:
> > >> > Hi David,
> > >> >
> > >> > On Tue, Jul 14 2026, David Matlack wrote:
> > >> >
> > >> > > Remove the single-opener restriction for /dev/liveupdate by remo=
ving the
> > >> > > atomic in_use tracking and the exclusive open check in luo_open(=
) that
> > >> > > returned -EBUSY. Protect luo_session_deserialize() with a mutex =
guard so
> > >> > > that concurrent open attempts by multiple processes safely execu=
tes
> > >> > > deserialization only once. Update liveupdate selftest to verify =
that
> > >> > > multiple concurrent openers succeed.
> > >> > >
> > >> > > LUO does not inherently require a single opener. There is some
> > >> > > documentation about it simplifying state management, but the onl=
y thing
> > >> > > it actually protects is the session deserialization during first=
 open,
> > >> > > which can be easily handled with a mutex.
> > >> > >
> > >> > > Relaxing the single-opener requirement avoids the kernel forcing=
 a
> > >> > > design pattern on userspace that it itself does not require, e.g=
.
> > >> > > allowing multiple userspace processes to create and manage sessi=
ons.
> > >> >
> > >> > Agreed. When the kernel had a global state machine in the early ve=
rsions
> > >> > of LUO, this might have been more relevant. With sessions, even if=
 we
> > >> > later add a state machine, it likely will be per-session instead o=
f
> > >> > being global. So I think letting userspace open /dev/liveupdate mu=
ltiple
> > >> > times makes a lot of sense.
> > >> >
> > >> > Also, today's systemd only supports preserving individual files, a=
nd
> > >> > does not hand out sessions. To get sessions, userspace must open
> > >
> > > It should in the future, because of permissions issue, see below.
> > >
> > >> > /dev/liveupdate and create a session. This opens up room for one b=
ad
> > >> > process to block every other process from creating sessions. It al=
so
> > >> > imposes a need for userspace to add a polling/retry logic for gett=
ing
> > >> > sessions and serializes their execution around this point.
> > >>
> > >> Shouldn't systemd open and own /dev/liveupdate? That was at least wh=
at
> > >> I originally expected here, you'd talk to it and get a session FD
> > >> through dbus.
> > >>
> > >> Moving to multi-opening /dev/liveupdate and removing visibility of
> > >> what sessions are open from systemd is a different model
> > >>
> > >> Not saying this patch is wrong or anything, but that I don't really
> > >> understand what kind of model you are going for now.
> > >
> > > CC ca for systemd's take.
> > >
> > > /dev/liveupdate should only be accessed by a privileged process, and
> > > sessions should be accessed by whoever originally created them. While
> > > this patch does not change the permissions, it paves the road for us =
to
> > > move in the wrong direction: instead of having a privileged userspace
> > > manager that distributes the sessions to their rightful owners, it
> > > encourages userspace to work around the permissions so that VMMs acce=
ss
> > > /dev/liveupdate to retrieve or store their sessions directly. This wo=
uld
> > > also allow them to access sessions belonging to any other participant=
 of
> > > the live update.
> >
> > But you can still do all this. In fact, systemd's release notes suggest
> > doing so [0]:
> >
> >     Units can also create their own LUO Sessions by talking to the
> >     kernel directly, and store them in their FD Stores, and those will
> >     also be preserved and passed down to the unit after kexec
>
> They should not. Ideally, systemd should be the sole entity
> communicating directly with /dev/liveupdate.
>
> >
> > Having a single opener does not in practice prevent userspace from
> > creating sessions directly. All it does is to force them to turn the
> > open into a polling loop. So I don't think single open achieves the goa=
l
>
> That is a fragile design, and they should avoid it. To be clear, I do
> not see any functional bugs in this patch, but I still do not understand
> the underlying use case.
>
> LUO should rely on a single manager agent that interacts with clients to
> create, preserve across reboots, and restore session IDs on their behalf.
>
> In fact, systemd is the only userspace process that AFAIK survives
> across the reboot() boundary; all other processes are terminated before
> reboot() is invoked. Relying on multiple independent LUO managers is
> therefore architecturally, wrong as they will close sessionfds.
>
> While the kernel can technically allow multiple openers for
> /dev/liveupdate, I do not see what problem this actually solves.
> Instead, it seems to encourage bad architectural decisions in userspace.

> > you think it should. Userspace already works around this restriction.
> >
> > So as long as we keep access to /dev/liveupdate restricted to privilege=
d
> > processes, I don't see why single open is any better.
>
> What is the concrete use case for this patch, once we live in the world
> where systemd is fully capable of creating, storing, and retrieving
> sessions?

I guess I would flip the question around: What problem does the kernel
requiring a single opener of /dev/liveupdate solve?

If systemd wants to have a single opener model it can certainly
enforce that itself without the kernel's help.

I'm not sure why the kernel needs to impose a restriction on userspace
that it doesn't require itself.

>
> >
> > [0] https://github.com/systemd/systemd/releases#release-v261
> >
> > >
> > > Instead, sessions should be created and retrieved by a privileged
> > > process that knows to send them back to their rightful owner after
> > > retrieval.
> > >
> > > Also, as a minor concern, each userspace LUO manager needs its own
> > > session to maintain state. This means that by allowing multiple
> > > managers, they may run into naming conflicts for those state sessions=
.
> >
> > --
> > Regards,
> > Pratyush Yadav

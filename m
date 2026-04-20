Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276F13AB26E
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776695497; cv=pass; b=mBNYTKh8heQyQco8CwjUp3FxjLThgwL65VUIURaGrWo8+WKJToq2xGqLfWY6bF4oUCHwZH3W0boY9Nw5YmlGQs4JxXQxBnWGvaffIyJCODTZ1/DeTuLwTxMvgpIbHDIEDhkX19DHYcAuSclf4qkgDtt3r3xgc3l95wG3yUTBeT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776695497; c=relaxed/simple;
	bh=kqPRzU1r8Upp5TYgefpiWZ9RVnkrVKI+N7GY819VmUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B8i1xGHOebwQrYeqmw70WBZPPJkLICnCBMAqQbytu7uSj7Z/yPfr7nqdGrqEZ5Dl7/boYC0WaEddAm+pwphr8+8mdpJmHV9F64ki41uwWIzNmdL7gKp1InKPALQvcPurpRZJ7C5Qv8qFEqXw3MkvYT9c6oMQD6GFltr4Z+yeq60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhQanICp; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhQanICp"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5675d609621so2390906e0c.2
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 07:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776695494; cv=none;
        d=google.com; s=arc-20240605;
        b=Hi0hjoFnerI8K5rhGr1jj+2CvsH/1zL+uYxWQH3tC8ckh/cR2FDV/5ylHDoT4sR40b
         /KO3jjn0rCf6J4iGKVqPPH0wG3ao3JzZ04TEQDtS35ioAWWxy6YTmVkjDf5n9yu8vmfN
         kGk8KH46RDxuBb03fw/yvLguu7ti+aOPVI2RmGeWyvgFGTf9GGmmNexANlvB9uESPS5T
         A6RdWcftVCpd0fF56q5H3luH2vbV7eAChrBlhPJ0F9WY76DUp5n/Ni+W3ie67YnThpy/
         st6HnscwFEs0DsHkFqPmBNNG08ubQ1oYl7+b3MLFcgMDDB2yhRKq2+bkKZHK7RYJsVRc
         OE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4O8Xd8WCONGvKBMRsNl+HFLA/9jUjeJYvKk/a3SZv7Q=;
        fh=bJWW7pZBN9rfbOBvfRiH5TMgLQkPc55zBcKOc0QbFr8=;
        b=h7ZMzWRhJxIvQhxyD/nsD7qLplDi5J9z1MTczTkwba7u9MPc0TAXXw3vt+rOUrNghy
         s02vcsXDClbbnyjm9fn9GYd6lcJowhxRMF7p6WBOq8yhXdL/e3kVTSq4S0V1RTlpWp7H
         QBGoCydbamSi5vil/coqIepJgJFR/JxXF8VvMbliU56WWrpqL3JicUhYpW++JFHIWf5e
         SOoj2Xue25a2V5PsJXixTbMBAjfReX4/sXw/0Zd4e9UqZTPWa0MzDNSFpiP9ei0ZA7hx
         6+U99dEH4IIbb2liD6W+CgNB3hCt037M+XgJ6+NU5ZOv3UlqvDPAXlXUOwG5gx6DORHO
         uQdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776695494; x=1777300294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4O8Xd8WCONGvKBMRsNl+HFLA/9jUjeJYvKk/a3SZv7Q=;
        b=EhQanICpPv6wEMAT2QVDm8MgxITvcGEAYHe1m42iLSyMQj1Y0WareKAEFrCkR4fDyS
         SPGbqqTXwePHWW8p/f+2UlF/X2ihrUtbg8fbhtFxe6Qkqi2/QsyMkbJOzqro8eqXQAMl
         WcTOuWJXsUbOkZXsn0mFPAAJhM+mIGkIVvCxhoXQub2kbpvG2XE+6iWz+07ORoIJhtIs
         ClD0K9/EMLGHnjeD7QhTdYd1UAPBisbBisjidOI06FRByUtkXvWoSYx8MVyVgkzYR17D
         5S+1XoMelyZ02D7ZT3mCabthO4VIPjJuimT5uUTlee+2Q1h9TgB0nS+/3YwCJhdIarG8
         Pp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776695494; x=1777300294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4O8Xd8WCONGvKBMRsNl+HFLA/9jUjeJYvKk/a3SZv7Q=;
        b=RFBgAGXymnzPbKCK7MOfMV8333HftH2AtaJLyJ6ZCyoTjG4RRikfWJgKWoGVfcMlol
         j5Mf4soAT3SjPK3hcOn58WNQS3rFpkHUXoD2tDvBKmBsYzXKQJhV2clKpF6T/OVJp7tb
         yN9f+DAA6r3r2+BiCjIqEU8AaJMNGxaxhRcSAw1boMIwMbSeNGN5EsVwbC9rgo8kuOmP
         eVZ+3/pkbl3DHkx9Tm+EdGfLpzB9V0XaNc8X6BkYKeqxviGayu1yubIWBZ6iAH5UvVxA
         rIkwrWQ0OdZVuSNERrc+tN5ttSzE0x4CXGNEzo8PUzhyeEjLPJZ7fxj/8SWHm3r5zfMc
         ct8g==
X-Forwarded-Encrypted: i=1; AFNElJ8UhawQP09C1C89G8L/6EZy23lb6eSyjGkJoOKl/jPP0i3fSx2Td4ZL1VOmQ/KQUoms64TjymUn7STEPHCyfGE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk31AC4tLuB9pgH9Ij9XQF0Dk0LyjD+8k/LaQP7xPxkG1jXw0c
	/UQnXfw6xRyopEmdk1aKiYetAirNY7duDZP+xiOauA278dbvj2hEorLLAtANatwoZTioFGtK6u2
	bK3z6mBoLTrinrjKHHj6c0jXb+jSJj+Q=
X-Gm-Gg: AeBDiesEjBSNxwIzqds2fVqFdyCcdeJpDY0DgeRYv8SDeY4mvQsgwr+c5AE/9pE2z+9
	HSCGgnUKxBqfCdRr8PAs9NYEGwKm1Vc2wCGp0axF69KZTbz8T1JsesYUcZNt6hM2+SapuxWurq1
	sAJkri4OdR0ckF3UFVh1jnPRJhYm0dIn7cX4JbN6Z08xQyCYfwygu6S+iNAq8ZH2VEfKtjLer2U
	zOlxuxH8wV+w5qDUCM6K58BdQIplLFEqKzp/eMEKEQM9WU7t7qO/ZTADxkPn3ggdNfNBQFmj7D3
	zLrx3iKC5ao2kM5RJTvXbepzH9vMi+EHr6WQ4/RF0bLl8BScuqxT
X-Received: by 2002:a05:6122:4d12:b0:56f:9512:145 with SMTP id
 71dfb90a1353d-56fa5a39aa7mr6593038e0c.13.1776695494119; Mon, 20 Apr 2026
 07:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328172314.45807-1-dorjoychy111@gmail.com>
 <20260416-abgraben-seeweg-a44ce660957f@brauner> <CAFfO_h5mORm0OuK-d4thzBWWySmyvLSVeVa7phZc4Df-8D=1Cg@mail.gmail.com>
 <20260420-laufen-einzeln-4cf4bb364a5d@brauner>
In-Reply-To: <20260420-laufen-einzeln-4cf4bb364a5d@brauner>
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Date: Mon, 20 Apr 2026 20:31:23 +0600
X-Gm-Features: AQROBzDP8Lx2bqkiL-O80tZkD0rFOUG8sjvNKKIkhcPgFqdc6FHkIJDo6D1Xn7k
Message-ID: <CAFfO_h5FH36eqYuuoYy2eVRXGytmQHLfz5p7fLi+3wHmQN9MnA@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] OPENAT2_REGULAR flag support for openat2
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, ceph-devel@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, v9fs@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz, 
	jlayton@kernel.org, chuck.lever@oracle.com, alex.aring@gmail.com, 
	arnd@arndb.de, adilger@dilger.ca, mjguzik@gmail.com, smfrench@gmail.com, 
	richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	deller@gmx.de, davem@davemloft.net, andreas@gaisler.com, idryomov@gmail.com, 
	amarkuze@redhat.com, slava@dubeyko.com, agruenba@redhat.com, 
	trondmy@kernel.org, anna@kernel.org, sfrench@samba.org, pc@manguebit.org, 
	ronniesahlberg@gmail.com, sprasad@microsoft.com, tom@talpey.com, 
	bharathsm@microsoft.com, shuah@kernel.org, miklos@szeredi.hu, 
	hansg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 7:20=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Thu, Apr 16, 2026 at 09:22:03PM +0600, Dorjoy Chowdhury wrote:
> > On Thu, Apr 16, 2026 at 7:07=E2=80=AFPM Christian Brauner <brauner@kern=
el.org> wrote:
> > >
> > > On Sat, 28 Mar 2026 23:22:21 +0600, Dorjoy Chowdhury wrote:
> > > > I came upon this "Ability to only open regular files" uapi feature =
suggestion
> > > > from https://uapi-group.org/kernel-features/#ability-to-only-open-r=
egular-files
> > > > and thought it would be something I could do as a first patch and g=
et to
> > > > know the kernel code a bit better.
> > > >
> > > > The following filesystems have been tested by building and booting =
the kernel
> > > > x86 bzImage in a Fedora 43 VM in QEMU. I have tested with OPENAT2_R=
EGULAR that
> > > > regular files can be successfully opened and non-regular files (dir=
ectory, fifo etc)
> > > > return -EFTYPE.
> > > > - btrfs
> > > > - NFS (loopback)
> > > > - SMB (loopback)
> > > >
> > > > [...]
> > >
> > > - I've added an explanation why OPENAT2_REGULAR is only needed for so=
me
> > >   ->atomic_open() implementers but not others. What I don't like is t=
hat
> > >   we need all that custom handling in there but it's managable.
> > >
> > > - I dropped the topmost style conversions. They really don't belong
> > >   there and if we switch to something better we should use (1 << <nr>=
).
> > >
> > > - I split the EFTYPE errno introduction into a separate patch.
> > >
> > > ---
> >
> > Thanks for fixing up and picking this one up!
> >
> > >
> > > Applied to the vfs-7.2.openat.regular branch of the vfs/vfs.git tree.
> > > Patches in the vfs-7.2.openat.regular branch should appear in linux-n=
ext soon.
> > >
> >
> > I don't see a vfs-7.2.openat.regular branch in vfs/vfs.git tree in
> > git.kernel.org.  Maybe this hasn't been pushed yet?
>
> Nothing will get pushed prior to -rc1 which is due this Sunday.

Understood. Thanks!

Regards,
Dorjoy

Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D45A3B841C
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563202; cv=pass; b=DxVaKubpYw+ZMYE/rkDhdtrUIS+/vt+Hw1vyiSKdiE6TBXJZ9pT+LUMMeRjMVLxtAMSz6ApbDCs3iqtO797updd5hbBkXOQ4Srbet8cgrQGe4hMDkkfIbTU8x00DdA2knqCBXS0R39o3uapSbVFiptk9gPYkSCawyoNXCjkV8Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563202; c=relaxed/simple;
	bh=RVyo+qnFAxyrd5qNzhnLDMX8CpCVWpxbN2Byb7GTkak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xsn9XlzQ6ksvMy7OTPCoWbWfN7FqPKr2AyQOsNDiiNdKBmW7fUue9gRIM+YtenQ4rCWC4gZjne09nWEcC/KtpSHi2puRXVlEessXcTn1gSeYg52BZOuInMbwxDgXEgV6Ho1wEa2cUOqC0zvHO1dKBoJnNpK87CzWHuHNDiVP1h4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qHz2ymwt; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qHz2ymwt"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso8052762a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 09:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784563200; cv=none;
        d=google.com; s=arc-20260327;
        b=bhUqTu6rd5DdCx7OGPe6EyFAD8Ht/pBmqGGnYNSAO0B04dmHojjBa96i086BuaPoDg
         EK2Vjmc2soMCLtpZsbSl0X+X5OAdQ6TQiC9Qfndtyz/j9DfY3RRZ5Q8pf+ROY8RpQ+QA
         ohONVu0I4MsFz5eB12OX04arBoudjZOysi6MmO2jb37uptXj+Tyy+/Qw7V0s03zCIHD2
         WKx7HiwsJEBtuzjOOEvl3NGgCx8Kq6Slgm5U0CS8FyOGhXhqpGLFc3rGA6Ck3CG4ZUef
         rQ1DpMPK6f0NLZ78idHrtW+M63fm+Hc+stVrOQKnvv0UaDUEjhLYr3lSkxe5+p5pn7BZ
         paWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P87ycojfEV8HoQxWRUMV9y0/pRLCBbuPJRqYvb1+Ggw=;
        fh=hvaeNV9v/RFkgtarwgBuMNkYzkWI44P07Zkksv8aey0=;
        b=XrTFE1pZFgxnIBbV3YFdLIKwZYPxvlXmODFMihAgFS6BvfgmXrfJnTml/60d6QPXt2
         ylPYlwzjnB2O74j+MJe2p3P74gOvvuJ9OU/LJSc1HbyZxs7S01GrijuiBEykXSrZJi7Q
         V0owLve8K4NFhpkaXkYMSMZ9NINMX+pLvblFgjpeKFjnXz/6mPLsbEgTnHi3yJTI2Des
         a3Nh/u7/lqgw5gJVJGOSioxM8HBZVKrAo1+tku9ziynF0C4dGCrJOEsUjD/ijKmtmJSY
         VnlauMCiFsTEJ4QKT5C+Phas6VMJaX4I25+QRxyYHAnYUMy03U4D2BPysStDXBl+argk
         ZsRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784563200; x=1785168000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P87ycojfEV8HoQxWRUMV9y0/pRLCBbuPJRqYvb1+Ggw=;
        b=qHz2ymwtDlqdv3c0Ifb797WnAPxNbNcHTKGrpy73gEVvI8ozYnPHfSvcJfAR6/bh+y
         FFAvnkj4HqktQbL7TzylkBRcWtg2Ye9bw2G/1RbPr0zQCEAZA+bkjB/s0XV1hph43QkM
         TLkzA231u1Mbtm1sLWmo5Ht0tmSSo4dZhUKzvR9GNSZC+UXOVFnHD3KKyb9V5o3JC26R
         6LPblTXyaONnownHpx4uv0tdE3l53lunp0XJcpDBZvatDbMIaD4BrSEURaayqUQUJQkl
         T4PxKO+WJBaOxC0QLKI0Yv3xUBK8DY8148fpoADnMnSGBKqEesLLOlftujClg3pgtzE8
         sKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563200; x=1785168000;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P87ycojfEV8HoQxWRUMV9y0/pRLCBbuPJRqYvb1+Ggw=;
        b=I0uLEOh/gXkiMLjKMN905F9HflJNFnkrF2ihUsknSqnvndMRuletYBIXp2hmGrZtVu
         u5W1q1iHV0mDhEgjmxkqJqa+OpU8crjtK5q9nNaFZMALU9YiYcl4va5zwXOPqb6h8G8/
         8PNi261kvMLSD9hQPG8nSjPobzuyi6nstQEWPTEmfFn8nnLV1Zm0N7FXWkef/5QaQT6T
         +/gvlZrqJYIYXHRDtYWEelOXNvJLxKZGIPJ7tq2Ey6rtl/yTezL3xQDi2dNnbO+c/vuK
         zOnPFjx/eq0Ot2kagjNFgjcNoKrZ1tHUSpB7Y0S/iKounEHbqV0mqXyl2DmeE/mSr85g
         vyFA==
X-Forwarded-Encrypted: i=1; AHgh+RoK+RJKw8ZB6BPvcGjaKmZMrLET9VhC/zqw/QcWu0oce+j171M+AGOklhukjg1uqmqTVLHo6/j5gEgW7haJu+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAM4Kdvalg/0TNarXNjRn6JPsJ8EaqxEb4IibmGEm5Ij8+l4xx
	8shTNRiN2rrC/cyxCzbXNx+WYA2BCsfU3HxkE3+oiH7n+AQbXHReJcd77+DZbVlFlCxcOZ6n28V
	/JKsgyuip3p1Na0Jp2nYy+4zO3jwKT1e9zesc+v8F
X-Gm-Gg: AR+sD10nnOF1g/94LJeNrT+DV8EBz4bRmkZ/XDIiXNFD4ZehlLpg6MLoxLpkJ4Cbd8o
	nYNug6iWzwyu4hMf8K/iSa54AH1pL7BOLJRBk2I44ghgoYTzDNz4l2gy4piTrv+GVWN/nPO1fCE
	miyCq7za6HcyNqnc1LjVCI9gg2dPbSb0rDCXx78PPkTU135dI8GKTxSVjrtdJ6Fcuya6NdS8839
	njBfu0Z9fWkukYdWqY+WOAdph9r4BHmZD67wO4GXN2nimHbOsTP44mSS9m3YQ==
X-Received: by 2002:a17:90b:2dc1:b0:37f:fdc8:71b4 with SMTP id
 98e67ed59e1d1-38e4b3e1424mr14861878a91.2.1784563199709; Mon, 20 Jul 2026
 08:59:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714190356.190328-1-dmatlack@google.com> <2vxzy0fcicpi.fsf@kernel.org>
 <20260715172336.GC3775915@nvidia.com> <aljtXsr6xvI6FAmA@google.com>
 <2vxzh5lzhrgk.fsf@kernel.org> <alphOhGU2c90l_3m@google.com>
 <CALzav=eKcJiCoR+w0krwtFOFeBXXYPK7YsDEhk+v3ZqzAgp=WQ@mail.gmail.com> <alpzJlpwBI8ou4UN@plex>
In-Reply-To: <alpzJlpwBI8ou4UN@plex>
From: David Matlack <dmatlack@google.com>
Date: Mon, 20 Jul 2026 08:59:31 -0700
X-Gm-Features: AUfX_mxw-SD40qAv9zGI1JtjIzLiRnzBLl6URA6ig4QtctIHN2ZOaaM-MXL0Ibg
Message-ID: <CALzav=f+jNEb1g1fPfwdKh+r-MEek5KE2GzWm1wyqXA4L94mFg@mail.gmail.com>
Subject: Re: [RFC PATCH] liveupdate: Allow multiple openers for /dev/liveupdate
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Mike Rapoport <rppt@kernel.org>, Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	uca.boccassi@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 11:33=E2=80=AFAM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On 07-17 11:07, David Matlack wrote:
> > On Fri, Jul 17, 2026 at 10:07=E2=80=AFAM Pasha Tatashin
> > <pasha.tatashin@soleen.com> wrote:
> > >
> > > On 07-16 17:41, Pratyush Yadav wrote:
> > > > On Thu, Jul 16 2026, Pasha Tatashin wrote:
> > > >
> > > > > On 07-15 14:23, Jason Gunthorpe wrote:
> > > > >> On Wed, Jul 15, 2026 at 03:50:33PM +0200, Pratyush Yadav wrote:
> > > > >> > Hi David,
> > > > >> >
> > > > >> > On Tue, Jul 14 2026, David Matlack wrote:
> > > > >> >
> > > > >> > > Remove the single-opener restriction for /dev/liveupdate by =
removing the
> > > > >> > > atomic in_use tracking and the exclusive open check in luo_o=
pen() that
> > > > >> > > returned -EBUSY. Protect luo_session_deserialize() with a mu=
tex guard so
> > > > >> > > that concurrent open attempts by multiple processes safely e=
xecutes
> > > > >> > > deserialization only once. Update liveupdate selftest to ver=
ify that
> > > > >> > > multiple concurrent openers succeed.
> > > > >> > >
> > > > >> > > LUO does not inherently require a single opener. There is so=
me
> > > > >> > > documentation about it simplifying state management, but the=
 only thing
> > > > >> > > it actually protects is the session deserialization during f=
irst open,
> > > > >> > > which can be easily handled with a mutex.
> > > > >> > >
> > > > >> > > Relaxing the single-opener requirement avoids the kernel for=
cing a
> > > > >> > > design pattern on userspace that it itself does not require,=
 e.g.
> > > > >> > > allowing multiple userspace processes to create and manage s=
essions.
> > > > >> >
> > > > >> > Agreed. When the kernel had a global state machine in the earl=
y versions
> > > > >> > of LUO, this might have been more relevant. With sessions, eve=
n if we
> > > > >> > later add a state machine, it likely will be per-session inste=
ad of
> > > > >> > being global. So I think letting userspace open /dev/liveupdat=
e multiple
> > > > >> > times makes a lot of sense.
> > > > >> >
> > > > >> > Also, today's systemd only supports preserving individual file=
s, and
> > > > >> > does not hand out sessions. To get sessions, userspace must op=
en
> > > > >
> > > > > It should in the future, because of permissions issue, see below.
> > > > >
> > > > >> > /dev/liveupdate and create a session. This opens up room for o=
ne bad
> > > > >> > process to block every other process from creating sessions. I=
t also
> > > > >> > imposes a need for userspace to add a polling/retry logic for =
getting
> > > > >> > sessions and serializes their execution around this point.
> > > > >>
> > > > >> Shouldn't systemd open and own /dev/liveupdate? That was at leas=
t what
> > > > >> I originally expected here, you'd talk to it and get a session F=
D
> > > > >> through dbus.
> > > > >>
> > > > >> Moving to multi-opening /dev/liveupdate and removing visibility =
of
> > > > >> what sessions are open from systemd is a different model
> > > > >>
> > > > >> Not saying this patch is wrong or anything, but that I don't rea=
lly
> > > > >> understand what kind of model you are going for now.
> > > > >
> > > > > CC ca for systemd's take.
> > > > >
> > > > > /dev/liveupdate should only be accessed by a privileged process, =
and
> > > > > sessions should be accessed by whoever originally created them. W=
hile
> > > > > this patch does not change the permissions, it paves the road for=
 us to
> > > > > move in the wrong direction: instead of having a privileged users=
pace
> > > > > manager that distributes the sessions to their rightful owners, i=
t
> > > > > encourages userspace to work around the permissions so that VMMs =
access
> > > > > /dev/liveupdate to retrieve or store their sessions directly. Thi=
s would
> > > > > also allow them to access sessions belonging to any other partici=
pant of
> > > > > the live update.
> > > >
> > > > But you can still do all this. In fact, systemd's release notes sug=
gest
> > > > doing so [0]:
> > > >
> > > >     Units can also create their own LUO Sessions by talking to the
> > > >     kernel directly, and store them in their FD Stores, and those w=
ill
> > > >     also be preserved and passed down to the unit after kexec
> > >
> > > They should not. Ideally, systemd should be the sole entity
> > > communicating directly with /dev/liveupdate.
> > >
> > > >
> > > > Having a single opener does not in practice prevent userspace from
> > > > creating sessions directly. All it does is to force them to turn th=
e
> > > > open into a polling loop. So I don't think single open achieves the=
 goal
> > >
> > > That is a fragile design, and they should avoid it. To be clear, I do
> > > not see any functional bugs in this patch, but I still do not underst=
and
> > > the underlying use case.
> > >
> > > LUO should rely on a single manager agent that interacts with clients=
 to
> > > create, preserve across reboots, and restore session IDs on their beh=
alf.
> > >
> > > In fact, systemd is the only userspace process that AFAIK survives
> > > across the reboot() boundary; all other processes are terminated befo=
re
> > > reboot() is invoked. Relying on multiple independent LUO managers is
> > > therefore architecturally, wrong as they will close sessionfds.
> > >
> > > While the kernel can technically allow multiple openers for
> > > /dev/liveupdate, I do not see what problem this actually solves.
> > > Instead, it seems to encourage bad architectural decisions in userspa=
ce.
> >
> > > > you think it should. Userspace already works around this restrictio=
n.
> > > >
> > > > So as long as we keep access to /dev/liveupdate restricted to privi=
leged
> > > > processes, I don't see why single open is any better.
> > >
> > > What is the concrete use case for this patch, once we live in the wor=
ld
> > > where systemd is fully capable of creating, storing, and retrieving
> > > sessions?
> >
> > I guess I would flip the question around: What problem does the kernel
> > requiring a single opener of /dev/liveupdate solve?
>
> It establishes a secure baseline by forcing userspace to adopt a
> centralized management model.
>
> If the kernel allows multiple openers, any process with sufficient
> privileges can open /dev/liveupdate and potentially access sessions
> belonging to other entities.
>
> By enforcing a single opener, the kernel ensures that one trusted
> manager (like systemd) must take exclusive ownership of the device and
> securely distribute session FDs to their rightful owners, and also
> preserve them into the reboot syscall.

I agree it forces this on userspace. But there's no reason to force
this on userspace. The kernel does not depend on or care in any way if
one process or multiple processes create sessions.

> > If systemd wants to have a single opener model it can certainly
> > enforce that itself without the kernel's help.
>
> How is that possible? Once the kernel allows multiple processes to open
> /dev/liveupdate, luod/systemd loses the ability to guarantee exclusivity
> and prevent direct access by other privileged daemons.

Why are file permissions not sufficient? I don't see what is so
special about /dev/liveupdate.

> > I'm not sure why the kernel needs to impose a restriction on userspace
> > that it doesn't require itself.
>
> To enforce a tighter security model. Preventing multiple daemons from
> independently managing /dev/liveupdate minimizes the risk of leaking
> preserved data to the wrong process.
>
> Before we remove a constraint that encourages a secure, centralized
> design, I'm still hoping to understand the concrete use case.

Yeah I understand. Unfortunately, IMO, it would have been better to
merge LUO without this restriction, and only introduce it when
necessary (i.e. when someone proves that standard techniques like file
permissions are insufficient). But I understand that relaxing this
requirement now without a concrete use case (which I do not have)
doesn't seem like a good idea.

>
> Pasha
>
> >
> > >
> > > >
> > > > [0] https://github.com/systemd/systemd/releases#release-v261
> > > >
> > > > >
> > > > > Instead, sessions should be created and retrieved by a privileged
> > > > > process that knows to send them back to their rightful owner afte=
r
> > > > > retrieval.
> > > > >
> > > > > Also, as a minor concern, each userspace LUO manager needs its ow=
n
> > > > > session to maintain state. This means that by allowing multiple
> > > > > managers, they may run into naming conflicts for those state sess=
ions.
> > > >
> > > > --
> > > > Regards,
> > > > Pratyush Yadav

Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3747E37AA7D
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 18:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784313237; cv=none; b=Ro+Mh4lYyP4Exqk41CDpgS/RZjiJwI8WOMJervtthZfX8ZiP3fS+FQTCVgtsacG7oJO85ZjMqw9K8jGGAtCYdY3fL9spVrx0XMGYlxjiDdhM8JyGBAGxReF7bg4XVuxhTE+5fRLwAtCDSmm20ZgiV9Bsnp3uEZP6qvgic5Ka4Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784313237; c=relaxed/simple;
	bh=VoWitDZ7ggn86RbfuSJlMdN1irAeONuxK5j4T8TwI64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pts7hahgNNNKKp57ScZtIen4kpjYACIAdMetMEMhwJXm/9KjhKTwZv8dpVKgot7TdMYbsGk/u+48OrpM6gmHPHodvKST2XbAqXnh7gSqx2T4e9v0vb2zXDqyjqQzJR9Zx0iSeoEQVfe0rO5Ub83unMffnu4WMUydYEmsOxbAlqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=aqhp6+qF; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="aqhp6+qF"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8f29ec73064so76808856d6.1
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 11:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1784313235; x=1784918035; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/NQPDl+iUOtIp6BF6be8WuthAyrwkk8o5a4ZrIHXBb4=;
        b=aqhp6+qFOs/PJ8J+JDaGJACI1YtM8gx9w205bQfna56qaXCmTe8xouGnc6g2ggYzEb
         bl8Y/tDDNYst/V7/efqIhE6KRJzxNLlRXINv3E3wAa9L9KEH7ZlGdxia4QON6CZHJvuk
         HwoxtDWu7jm/oaD0l+cDvsjfjnouCigIwvAgO2ArVmqPzsAG7r7x203NLRtHhyTmwtLi
         ihSQGBy0yhY/Z/sQ0km7tOF1Joc5aHYQzaXQr5t6F7hXwn15IVancL8p7rNSZe4imYxa
         pyn37xtaMOP77+owDscuIfySdNplokmml/Mbb0pwVnZSI/UPgjEWCss+f513aptWhLVH
         nbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784313235; x=1784918035;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/NQPDl+iUOtIp6BF6be8WuthAyrwkk8o5a4ZrIHXBb4=;
        b=CGqtPovwvWYaq71zJrwfNRXnTkOSJOzz2GvWqfxDQtdYk7AYPGUfb2aYM8p7QRYeVX
         YCwuR+ZUILJobYvWYnqcLZTDAPc96byuVgATmSW86tZV1+MgHvF9eT/DU6pKKh4o4KY3
         uTR8jItp4zg+v+0GJBtlcfIXn0bN82S6aeSet3tx+QbMFx8GBvhrKrSHVZptfYKoKCcE
         xbm2peZg1MP2GwmChXPjsxPp5oxUN5nNSR4oJoGlKX85+GeLG7cC7DA5LmjPJ7+BsTOU
         MOHNKkGkQMMFGLr8uFXKUzpRbao0MVlNOA0EHhbbazdWaRAbqjzUCHS2a/taJdJdb9Pc
         cnjg==
X-Forwarded-Encrypted: i=1; AHgh+RoTNmyx1hylA1bSOnvfBForOZROyvSA0viE+P7p+8Yaelj9K3AN0Wdis7uUysGqKRbgELvy0H0Ybsw0AlhLWHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFYF7l5CHQDpxLQuqmLKbaKC0IO/ReVNbTwWD40fXEnbMwvfwZ
	7QIGqAvCvOMC8FFwZIFs5eikTdilM2vNvfDycdCf4ErxYlJltNrcFkDF2jqu/v8gBL4=
X-Gm-Gg: AfdE7cm60hJENCDPY9T3+7bMS7oNYpCaYtG2KPYDgf9bFK/+1ECbWb6T0hYnJcroxy6
	Vno7aN8OE+wwRLVP6zEqFU6j9AFpOKZ+PvPveFLVLUyYDph34eULjr07qw6PLYGA+pDN2PNFb/a
	Bxin6jeDcCP5cVuHewEBcOMnubG0zfGL66T1bQKVivTOc7BRK/UHuLvSTFT4gtqJgM7UL+vL1MF
	zjPbYOyraYPeZ4M7HABlGlizPCt69l/92wjWllffurlfNogz/gQOvSoQHiPvv+XbEyl+JpKzbOC
	AkJQYNu4CjuXCssBV4WOGzI6hY4WX1Isu3WZrlPva1tQcSXaIAKdM96F2Uf2ZQ4W13ZDKcUOa+y
	ZZ4WN3CTrZBAKeUfQyCTdj46s1v++nqrxnAjDzM9rcPDkHsGirBTNDMx2zCcyo6QoTKsB5y8OFl
	Jw8VOZGth54l68lghvEpXh3oQ8ZCu/42+M3cXmUxho
X-Received: by 2002:a05:6214:54c8:b0:8f0:8029:592c with SMTP id 6a1803df08f44-9077853fc7bmr42588146d6.50.1784313234646;
        Fri, 17 Jul 2026 11:33:54 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778585048sm23392636d6.19.2026.07.17.11.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:33:54 -0700 (PDT)
Date: Fri, 17 Jul 2026 18:33:53 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Mike Rapoport <rppt@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, uca.boccassi@gmail.com
Subject: Re: [RFC PATCH] liveupdate: Allow multiple openers for
 /dev/liveupdate
Message-ID: <alpzJlpwBI8ou4UN@plex>
References: <20260714190356.190328-1-dmatlack@google.com>
 <2vxzy0fcicpi.fsf@kernel.org>
 <20260715172336.GC3775915@nvidia.com>
 <aljtXsr6xvI6FAmA@google.com>
 <2vxzh5lzhrgk.fsf@kernel.org>
 <alphOhGU2c90l_3m@google.com>
 <CALzav=eKcJiCoR+w0krwtFOFeBXXYPK7YsDEhk+v3ZqzAgp=WQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzav=eKcJiCoR+w0krwtFOFeBXXYPK7YsDEhk+v3ZqzAgp=WQ@mail.gmail.com>

On 07-17 11:07, David Matlack wrote:
> On Fri, Jul 17, 2026 at 10:07 AM Pasha Tatashin
> <pasha.tatashin@soleen.com> wrote:
> >
> > On 07-16 17:41, Pratyush Yadav wrote:
> > > On Thu, Jul 16 2026, Pasha Tatashin wrote:
> > >
> > > > On 07-15 14:23, Jason Gunthorpe wrote:
> > > >> On Wed, Jul 15, 2026 at 03:50:33PM +0200, Pratyush Yadav wrote:
> > > >> > Hi David,
> > > >> >
> > > >> > On Tue, Jul 14 2026, David Matlack wrote:
> > > >> >
> > > >> > > Remove the single-opener restriction for /dev/liveupdate by removing the
> > > >> > > atomic in_use tracking and the exclusive open check in luo_open() that
> > > >> > > returned -EBUSY. Protect luo_session_deserialize() with a mutex guard so
> > > >> > > that concurrent open attempts by multiple processes safely executes
> > > >> > > deserialization only once. Update liveupdate selftest to verify that
> > > >> > > multiple concurrent openers succeed.
> > > >> > >
> > > >> > > LUO does not inherently require a single opener. There is some
> > > >> > > documentation about it simplifying state management, but the only thing
> > > >> > > it actually protects is the session deserialization during first open,
> > > >> > > which can be easily handled with a mutex.
> > > >> > >
> > > >> > > Relaxing the single-opener requirement avoids the kernel forcing a
> > > >> > > design pattern on userspace that it itself does not require, e.g.
> > > >> > > allowing multiple userspace processes to create and manage sessions.
> > > >> >
> > > >> > Agreed. When the kernel had a global state machine in the early versions
> > > >> > of LUO, this might have been more relevant. With sessions, even if we
> > > >> > later add a state machine, it likely will be per-session instead of
> > > >> > being global. So I think letting userspace open /dev/liveupdate multiple
> > > >> > times makes a lot of sense.
> > > >> >
> > > >> > Also, today's systemd only supports preserving individual files, and
> > > >> > does not hand out sessions. To get sessions, userspace must open
> > > >
> > > > It should in the future, because of permissions issue, see below.
> > > >
> > > >> > /dev/liveupdate and create a session. This opens up room for one bad
> > > >> > process to block every other process from creating sessions. It also
> > > >> > imposes a need for userspace to add a polling/retry logic for getting
> > > >> > sessions and serializes their execution around this point.
> > > >>
> > > >> Shouldn't systemd open and own /dev/liveupdate? That was at least what
> > > >> I originally expected here, you'd talk to it and get a session FD
> > > >> through dbus.
> > > >>
> > > >> Moving to multi-opening /dev/liveupdate and removing visibility of
> > > >> what sessions are open from systemd is a different model
> > > >>
> > > >> Not saying this patch is wrong or anything, but that I don't really
> > > >> understand what kind of model you are going for now.
> > > >
> > > > CC ca for systemd's take.
> > > >
> > > > /dev/liveupdate should only be accessed by a privileged process, and
> > > > sessions should be accessed by whoever originally created them. While
> > > > this patch does not change the permissions, it paves the road for us to
> > > > move in the wrong direction: instead of having a privileged userspace
> > > > manager that distributes the sessions to their rightful owners, it
> > > > encourages userspace to work around the permissions so that VMMs access
> > > > /dev/liveupdate to retrieve or store their sessions directly. This would
> > > > also allow them to access sessions belonging to any other participant of
> > > > the live update.
> > >
> > > But you can still do all this. In fact, systemd's release notes suggest
> > > doing so [0]:
> > >
> > >     Units can also create their own LUO Sessions by talking to the
> > >     kernel directly, and store them in their FD Stores, and those will
> > >     also be preserved and passed down to the unit after kexec
> >
> > They should not. Ideally, systemd should be the sole entity
> > communicating directly with /dev/liveupdate.
> >
> > >
> > > Having a single opener does not in practice prevent userspace from
> > > creating sessions directly. All it does is to force them to turn the
> > > open into a polling loop. So I don't think single open achieves the goal
> >
> > That is a fragile design, and they should avoid it. To be clear, I do
> > not see any functional bugs in this patch, but I still do not understand
> > the underlying use case.
> >
> > LUO should rely on a single manager agent that interacts with clients to
> > create, preserve across reboots, and restore session IDs on their behalf.
> >
> > In fact, systemd is the only userspace process that AFAIK survives
> > across the reboot() boundary; all other processes are terminated before
> > reboot() is invoked. Relying on multiple independent LUO managers is
> > therefore architecturally, wrong as they will close sessionfds.
> >
> > While the kernel can technically allow multiple openers for
> > /dev/liveupdate, I do not see what problem this actually solves.
> > Instead, it seems to encourage bad architectural decisions in userspace.
> 
> > > you think it should. Userspace already works around this restriction.
> > >
> > > So as long as we keep access to /dev/liveupdate restricted to privileged
> > > processes, I don't see why single open is any better.
> >
> > What is the concrete use case for this patch, once we live in the world
> > where systemd is fully capable of creating, storing, and retrieving
> > sessions?
> 
> I guess I would flip the question around: What problem does the kernel
> requiring a single opener of /dev/liveupdate solve?

It establishes a secure baseline by forcing userspace to adopt a 
centralized management model.

If the kernel allows multiple openers, any process with sufficient 
privileges can open /dev/liveupdate and potentially access sessions 
belonging to other entities.

By enforcing a single opener, the kernel ensures that one trusted 
manager (like systemd) must take exclusive ownership of the device and 
securely distribute session FDs to their rightful owners, and also 
preserve them into the reboot syscall.

> If systemd wants to have a single opener model it can certainly
> enforce that itself without the kernel's help.

How is that possible? Once the kernel allows multiple processes to open 
/dev/liveupdate, luod/systemd loses the ability to guarantee exclusivity 
and prevent direct access by other privileged daemons.

> I'm not sure why the kernel needs to impose a restriction on userspace
> that it doesn't require itself.

To enforce a tighter security model. Preventing multiple daemons from 
independently managing /dev/liveupdate minimizes the risk of leaking 
preserved data to the wrong process.

Before we remove a constraint that encourages a secure, centralized 
design, I'm still hoping to understand the concrete use case.

Pasha

> 
> >
> > >
> > > [0] https://github.com/systemd/systemd/releases#release-v261
> > >
> > > >
> > > > Instead, sessions should be created and retrieved by a privileged
> > > > process that knows to send them back to their rightful owner after
> > > > retrieval.
> > > >
> > > > Also, as a minor concern, each userspace LUO manager needs its own
> > > > session to maintain state. This means that by allowing multiple
> > > > managers, they may run into naming conflicts for those state sessions.
> > >
> > > --
> > > Regards,
> > > Pratyush Yadav

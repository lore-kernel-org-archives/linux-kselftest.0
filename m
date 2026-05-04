Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E1A3CB2C5
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777896044; cv=none; b=iv6OFSURO+4sWaGAcO6aZGIZZadhc09RjJGiO+PIav5E0rec/Ryb5gkOplJwJSD9Yh0i+PINsXHK7B4PC3hX+lUrc50GRBrUPEh/mr5Cu+chtWjVglSG/uQvfm/NuG6QP24t2MK1NDx32dGSdp74h4SeSCQHkIHgpVqNjjzmv1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777896044; c=relaxed/simple;
	bh=Hl3CwSSKFL604+Bs52WMEy2/aMMaTyXNZKZlz0sf9iA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=roR6dC7fqCsIqWB+ZoU4bwXZ95tNTN8Ro0VMx2kAv9uykYLZzxF8466nb+BNa1Fnxehs1ybe7zs4lz3YVwHaC7Bd9LFGSHyBmT+F51Ki1b7oJiP7Feq4uc5fKWDjFymUzDYqAP82E9OwD3vE7PSX/ddz9WGKEKf6IvIJ5fuwNXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRJ6xEPm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRJ6xEPm"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so53047465e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 05:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777896037; x=1778500837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beppBlc4z/k/6sDHwfuJF7187wKyaJgaXtM+Bj5I6v4=;
        b=kRJ6xEPm4QqWIMTF0bieG4cV+jLdCh3jcgxRsQruyr1P/UJXX5oimOoVJnPGlfMDGS
         jSoCtkxnz5MpdfcRRzOFPqLdIgcozOHYp8zStoih7mKIk5xOKYG4KGHryHx5/fWpt9pK
         3j9hXR0lXPV9BqMYF1vP0Zn97pHeydG8rf4tOT8oFAF/mb/pmewLu3CACu63IRcle3uS
         nR3AtuOn2ck344rTwuQinDkzgHz4lZwQKt0BnGIWJR0+uOMS+u/x39oeM+TsAZaSg3wt
         wmJCwdu6D7D1t/Nn089kDRInzIguNSm3uHCDlvFVJDgbV5uUYWXfy6OHwbsx2ag1qm7G
         vSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777896037; x=1778500837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=beppBlc4z/k/6sDHwfuJF7187wKyaJgaXtM+Bj5I6v4=;
        b=fw9Z44U8unI4/1ULQ0rOxW+ZRYsjCHb9CdsRQfhCqrSQa4HzeFI51axUXYpjCeWlGo
         Wo3EVUiVo5NU8VCzigYe7Tu4TGAzpsRnpHnwRvZe+0dyqXzNsHSDVWciVGzF6PH2k2m+
         spCmwad/3vDk3k5Ac5xRQ6FQBLw2p8uwtXi6ugwOo9VC4KzvuaIsDF6EVZ4vyUU4L/Dg
         xdnsaUH5H2IFSPE7pZ/X8nMxRB2fNgNv5ilyVmiP+0+/4uWsWGY9ZFY68zKRpg29ujUV
         NFQ6G7wrxTekw1ZHbKPplTjAtWZFgi/GkJGLau7X7nM6JmIcmchQd2J87+1WaiTRPUIw
         4diw==
X-Forwarded-Encrypted: i=1; AFNElJ/pXztuzrBNfqWt4B9hu5rcAEk4eSJFQpHkwJhLojr3VtzfJtQevpxFm04uDOA6/bla4gCotOAruw4w/J1LD2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH/DdiLNSiOYPRY/FS0jxJgXN+us6WhSUNOtm7+zIxmpZg3Hxn
	qsQ0RE0i54ttR3cGzZsH6g4HOY7TmRTIPa2NW/EbpTlV1AjTHGRD/hjU
X-Gm-Gg: AeBDieuU9TjRJ7vpg14kCTuZepmi018/qDcbdd+1hDuj9biW00XkdgTcm+VWACAX/Zk
	zg99N9WyHcxGv0u7IHsl91SIhCRgAR1JcTIL+MmSb1bnj2Tn91RW7LsmcidEE4nU6dpnvMY6CYs
	jGjmJzRkOsyDshxp8uINWB5uNTSTeOTWytV6WWgW1+OJrvwFSiEttg/EjYa0RHe5FrVqacVweRW
	WsbS1SRN1Av9Qsus5V3pyl2D4gVHVutkSt9QVKazb8OMnm3SMczRwkck1Rb4PjjYgFtPyfoRCBM
	Ar4NRqkgz9Xh2egVbNKnByYzBxpL70q05LX2josX9BbK2A4EseugZSAJr11YMebQuJRHI94Ge1R
	/b+KIVDc5Dpdu1HWqTL0cHmKn7rHd+FoIUMWsFQNanj/E9zQbGGRuarmQ3T7/lAeEwNVclL1V0H
	tDd71RaTQ85wQWOeO3xf4MeG5frIcTCSd/qm4qG1iCl26YaZGoJY4dWVf8hvoeWDRiNJA6gGz7c
	DaU/YcWeR/zzQ==
X-Received: by 2002:a05:600c:8b04:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-48a9852f332mr148382325e9.3.1777896032816;
        Mon, 04 May 2026 05:00:32 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8ebb2fa5sm230452445e9.12.2026.05.04.05.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:00:31 -0700 (PDT)
Date: Mon, 4 May 2026 13:00:27 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Nam Cao <namcao@linutronix.de>, Soheil Hassas Yeganeh
 <soheil@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara
 <jack@suse.cz>, Shuah Khan <shuah@kernel.org>, Davidlohr Bueso
 <dave@stgolabs.net>, Khazhismel Kumykov <khazhy@google.com>, Willem de
 Bruijn <willemb@google.com>, Eric Dumazet <edumazet@google.com>, Jens Axboe
 <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 2/2] eventpoll: Fix epoll_wait() report false negative
Message-ID: <20260504130027.50040ce6@pumpkin>
In-Reply-To: <20260429-november-speisen-3084d769d316@brauner>
References: <cover.1752824628.git.namcao@linutronix.de>
	<43d64ad765e2c47e958f01246320359b11379466.1752824628.git.namcao@linutronix.de>
	<CACSApvZT5F4F36jLWEc5v_AbqZVQpmH1W7UK21tB9nPu=OtmBA@mail.gmail.com>
	<20250718085948.3xXGcxeQ@linutronix.de>
	<20260429-november-speisen-3084d769d316@brauner>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 29 Apr 2026 08:54:06 +0200
Christian Brauner <brauner@kernel.org> wrote:

> On Fri, Jul 18, 2025 at 10:59:48AM +0200, Nam Cao wrote:
> > On Fri, Jul 18, 2025 at 09:38:27AM +0100, Soheil Hassas Yeganeh wrote: =
=20
> > > On Fri, Jul 18, 2025 at 8:52=E2=80=AFAM Nam Cao <namcao@linutronix.de=
> wrote: =20
> > > >
> > > > ep_events_available() checks for available events by looking at ep-=
>rdllist
> > > > and ep->ovflist. However, this is done without a lock, therefore the
> > > > returned value is not reliable. Because it is possible that both ch=
ecks on
> > > > ep->rdllist and ep->ovflist are false while ep_start_scan() or
> > > > ep_done_scan() is being executed on other CPUs, despite events are
> > > > available.
> > > >
> > > > This bug can be observed by:
> > > >
> > > >   1. Create an eventpoll with at least one ready level-triggered ev=
ent
> > > >
> > > >   2. Create multiple threads who do epoll_wait() with zero timeout.=
 The
> > > >      threads do not consume the events, therefore all epoll_wait() =
should
> > > >      return at least one event.
> > > >
> > > > If one thread is executing ep_events_available() while another thre=
ad is
> > > > executing ep_start_scan() or ep_done_scan(), epoll_wait() may wrong=
ly
> > > > return no event for the former thread. =20
> > >=20
> > > That is the whole point of epoll_wait with a zero timeout. We would w=
ant to
> > > opportunistically poll without much overhead, which will have more
> > > false positives.
> > > A caller that calls with a zero timeout should retry later, and will
> > > at some point observe the event. =20
> >=20
> > Is this a documented behavior that users expect? I do not see this in t=
he
> > man page. =20
>=20
> The selftests rely on this behavior that timeout=3D0 sees events from a
> concurrently running producer. They would fail at a very higher rate
> after this change - believe me I had a similar patch that changed
> something in this area. I would explore the seqcount that Mateusz
> suggested tbh.
>=20

Does this scenario really affect any real programs?
It doesn't make sense to have multiple threads looking for level-triggered
events on a single epoll fd.
When epoll returns an event you really need to do a (usually) read on
the associated file descriptor before calling epoll again.

To split the epoll processing between multiple threads you need lots of
epoll fd with the underlying fd distributed between them and get the
threads to process the epoll fd sequentially (eg by putting the fd in an
array and using an atomic increment of a global array index to get the
next epoll fd to process).

-- David

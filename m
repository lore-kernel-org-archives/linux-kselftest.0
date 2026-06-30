Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5BC31E834
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 23:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782862921; cv=pass; b=QFnkQWzZP2WrNcqwlqT3nOkXxlfQuZ+CmvvqfprUcqipxlZg5+Zi2mtOoCUEFPxO9MvR4X3wyomZf5woJQh8IXq3ujNZPze/1gfuf1qG+quIPcV2n/98JcADJMd9N9wx5z4klAEfdX4XwqH8NFOhBHLltbVQi7v0O/pNyaWOJ3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782862921; c=relaxed/simple;
	bh=vlJ9P6Yf0TzbOdLo22fAK014xrjqys16n3eCVcXt3jE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qScGCVW0n7y22z7iA+peRRdt8Kq+KwygumyykrzB0CAzwm6OmywlxTXG5dF/EedwTcSQC+lE3FFQ058chRneeOt3gdV6moHvi7OLShz4p/PaLQ7vr/Wt6Lh52pkErNsPQtUMwbGuW9qI6VeQrlqAbPPDbfAEN2hEkQ7Bl3P2d14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=prSaK7ni; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="prSaK7ni"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-133362c30cfso4284c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 16:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782862919; cv=none;
        d=google.com; s=arc-20260327;
        b=FpPy0FfvDQWmPlKAbNCInEA0HB0SDYTjm78qAs+HsOVCSuO9HDSsMBzeyhVYnKbkL9
         d6eyQJ2SF7WDUDZK4EBs4qhvV2xxW0GSMcKso3H7OuoVYQbF860wL/4mVdin3ts1ex6h
         fPa3iUtH/7WMFOhx0LpnfpwptgkjMkKiP7syttrHDMYZH0akqQzoYHEFSmdKB/1XIh7h
         eaf4g86buMiXPWYdWyZkeZHyBEuTlgkbFRRgiOu34FoifEvSrrWR/JpUzonDXjqM/brZ
         ABsIDRIGe8TMMRUU4050wriQZBOv+phjbk93GX97GYJvVz2xGUTZ++XmVi1dKovz6nvp
         Jlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vlJ9P6Yf0TzbOdLo22fAK014xrjqys16n3eCVcXt3jE=;
        fh=5ZZF3I6FBtaQPLg2r3Rg/KQ0irUusT/U5GxzIkL5Vio=;
        b=m4rPYgMqZD048wlipzGOylEWFBN6U3v/iCFC0xXJzEjSeJkaVF2RrndTH+jhBBRL23
         O7Ai1FJFHAbn6q2ZVRudS1jQha3aNYhwY/BIrYLBU1h799PayTj4pasZCt2xeQjQL7W7
         dOZFITMS3px5czkVVxBxM0JuXY805iHQiRnzAidzGJGPYdYpkp3DfB6pCt5UhV0+EXZ7
         mW1C0oowQZ8yC2UNU0FNvWNqICIqrk2rR1xGoZ1HEVsLn/bvSShXsXtKOoHD4N6WJ6yB
         qy3qQWU2vM9GVB4Fliidiw2/rByB1I4jw+O/M4KoylK78TIJ5xbNBhBXeIbtZPk3Hnyr
         hsGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782862919; x=1783467719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vlJ9P6Yf0TzbOdLo22fAK014xrjqys16n3eCVcXt3jE=;
        b=prSaK7nipRBa+aCXGeW/rei8RuG1WqbtjDqwI4K3tspChm40n8lFXdhS6FJX7TOVuh
         0TmW2c9JQu3lHKyAnRviB74iGzM8j4Wnt+TD5sB6fQPTCopzkTR3QSTJMkZm8UvjqWRV
         8bimQ6mRhJXVWA5VOxggFpsJngTjZuBLFxM90Rw1bE1+SrLVQPqDviEWIkArDfGA+a+X
         5hbMGJxGOqgpV5hDlTHm/s/27+M9PEGEkpj6hHGzhfsrC5Ht4SXxkWfIah6AvUrv+3z2
         DgE7BBc2X3b0MxMofLJnzZImU3BzSE2e2MNcXYbF4ercjvSz7JshE76JHx7FckCx1MTl
         tHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782862919; x=1783467719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vlJ9P6Yf0TzbOdLo22fAK014xrjqys16n3eCVcXt3jE=;
        b=a1d+Aax4zkzujabTSXSeCfrYx4oG4FoAgjF4ux4c88cMgnsEktdLakXPsDYSLHSG9g
         lomkuIes4GawND0grnHGB2/xYWPbHmQQPTUfOwWRcXx933FrXyQFWvfwVmyxDIaEEHuI
         kXVE6lqQA61yKrxWsTfrXTNbwEPgFlnkvpuqRiGIMAHcVGuayBZM4NmJf9NUWQNHPhcG
         fuU25lSkbrjaCtukw/4ClmzKHf1csrnGL/dM39jWSbxAZga8waQsWLtQ3K1byr8NFUvA
         d0o7MDy7V6N1n1fHPq2e9aOqe3vvJyK5n1GPzp3u8R0+h+KlrPBc6qAnYfoN0aLyRspg
         gjhg==
X-Forwarded-Encrypted: i=1; AFNElJ/Lz0Buj9P8aaUbgHXB6rVkuiRswc8luE8vVk2ve+hNg3Z3VESXPGavakQUcY8Q2iEqlESfD4iZaX4IG9Cu5/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ9HHXvJ3psrp9ZwmwnzWaF+Wuo8Bsx28bBNnXUfxU/4sEoE8N
	dLTNRyspzHDMyHnIQQdcwaBxR1rflX9w8uV2Q5U+RY24w8R7WWeLM5TrSAQgT+cNAbnyvGLxO6L
	/I0Aka/e0f0m3nYWQavODx4huxJmj4XSPUFbDOXSt
X-Gm-Gg: AfdE7cm4UWPORZEycQjfIU0bwBU1fi4eLMg7C1oefr51SIn5GnDQ/+rajyLxHbr3zQG
	AttXrgZtY/hj+sgW/bK63100Jx8FI+gQ3TQzsaa0/FJhgMDVZo0wOpa62FQIgIJ+foAcGtvGQFw
	2t7Up5xVLcqbeM7W9JJ0vh9Uga4O1MMsVmx86gcJ6zjcAKpbUxT5QqH/2SvGueL7FkGSXidWJHy
	bzZ+JbwY9F5bHf+eRzNYWCUBFRob4hYfbglGG9Mk4uGbEVtXqdUNZ4BY5akMrcnU6Ge7LAL
X-Received: by 2002:a05:7022:6198:b0:138:2d13:e32f with SMTP id
 a92af1059eb24-13b343eb79fmr69628c88.8.1782862918097; Tue, 30 Jun 2026
 16:41:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629192029.4013794-1-tanshuhao@google.com>
 <20260629162619.55297244@kernel.org> <CAABY+HEcNnh+ATyA_JMg4LnVpP=egprTTi4UXxV9CfW2+71z+g@mail.gmail.com>
 <20260629181955.00e63b61@kernel.org> <CAHS8izNeoJiLyoyiPgzmX5CGcyivYqBpVxOcFnoxeOX_zzFd4Q@mail.gmail.com>
 <20260630160555.3736f900@kernel.org>
In-Reply-To: <20260630160555.3736f900@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 30 Jun 2026 16:41:44 -0700
X-Gm-Features: AVVi8CfnFtYhKpxegXLc5RW0mc09RJliOI2LMhKi1X1iPmW5YTsm6Mudb1KYxmU
Message-ID: <CAHS8izOc7OPrspPfo-6eAwPscQzk6ZzHQd10MFrRvzuPXU9WjA@mail.gmail.com>
Subject: Re: [PATCH net-next v1 0/2] Reuse threaded NAPI kthread across napi_del()/napi_add().
To: Jakub Kicinski <kuba@kernel.org>
Cc: Harshitha Ramamurthy <hramamurthy@google.com>, Jordan Rhee <jordanrhee@google.com>, 
	Shuhao Tan <tanshuhao@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 4:06=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 30 Jun 2026 10:38:01 -0700 Mina Almasry wrote:
> > > > It feels surprising that the userspace needs to reconfigure thread
> > > > properties when changing NIC configurations unrelated to threading.
> > > > Another downside is that when userspace configures NIC configuratio=
ns
> > > > in quick succession, re-application becomes messy because a previou=
s
> > > > re-application might still be in progress when the thread is gone.
> > >
> > > Can you explain more about your deployment and system configuration
> > > flow? We may be adding micro optimizations when the problem is that
> > > we recreate the NAPIs in the first place.
> >
> > We have an AF_XDP application with extremely low latency and jitter
> > requirements running on our servers. Sami developed busypolling
> > threaded napi for them. Since it's an AF_XDP application, they attach
> > their umem to specific RX queues, and then configure threaded NAPI
> > busypolling to achieve low latency. That involves using the Netlink
> > API to set the threaded/busypolling property, grabbing the kthread
> > PID, and setting some properties on the kthread.
>
> What I don't understand is how you have an "application with extremely
> low latency and jitter requirements" and at the same time "user runs
> an unrelated ethtool command" reallocating NAPIs and disrupting that
> application.
>

It is unlikely. However, if someone intentionally or accidentally
triggers a NAPI reallocation, it should only be disruptive while it is
happening, not leave the application running in a degraded state for
the rest of the workload run. Right now it feels like the user must be
very careful. There are also link down/up events outside the user's
control, which should not happen, but if they do, minimizing their
impact would be nice.

> Honestly, the last two times y'all were touching NAPI it was a major
> effort to get the code into acceptable shape. I don't have the cycles
> right now to help another unknown-upstream (intern?) get their patches
> into shape.
>

My sincere apologies. I also did not do a good job of not taxing your
time with the devmem stuff. FWIW I reviewed this before it was sent,
but I didn't think my Reviewed-by would move the needle much. We can
block future iterations until we get reviewed-bys from Willem or
Kuniyuki.

> Can y'all not open a pidfs fd for the NAPI thread? You'll get a
> notification when the existing kthread dies?

Let me take a look, but I think we need a notification when the
kthread is back up to reconfigure it. I guess if we're trying very
hard not to touch the current code we can always monitor the running
napi kthreads and their affinity and work around it like that.

--=20
Thanks,
Mina

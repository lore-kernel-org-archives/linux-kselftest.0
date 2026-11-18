Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795038587;
	b=i2JmctYi4O/EKhn/Hk+OTmyv3PwYb530VyrdPd2tVUUXnpTY3VVAGGYqxWY++QlFlgD7
	 O14Glie9b5jToLr9cuzj0P57i8hWAQH9r+MlLeTwZSQMCpp17hEctyytjdd/EIJfAxne8
	 EhD1cZCfCjssHSPVbwGmr2FFxS1GTRClApxygPv34WrQiOzvp8oeslkofObaTpzHaflj+
	 ojERUSf0cei/bsI7pcT7q0n6lMBntvWN27G5JvOWxoReKPBXYDZLVTF3bEEvjgdtbCkFK
	 3OhI14dSAqtigbPUkJ2A38BgW3fHrujAvW4xdbv8WBLJdgoGBDcj2h3YIgkA1bydxtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CZPHqjEKi2vg5bpASOGDI+kJVhoG5JNXko8FEV4Oxfg=;
	b=vlxvj6BQm+yo6VwbeQWpDKgVVSA/IUUhqyc+465HCZ+Ul2Pi5//L2RFA0WDO1vB07RRB
	 DSorol0wMYjn/aozw82WAvQ1jNYyuUYLOEJcCxzF1srNbO+cviqKPruTWrDGmbT3ZYwFe
	 H7QZcwirmbWL8XP685Uoz1jhSEp0wz5UrWL/AVPjNZpwgiuzh6xlXbZ8U+LE4khfhvwA7
	 0aOlv/22Ttc/rvMgeOd2KS4LgF8TEKgWC2AJKu7gzQX7+GTnuX+aiuQq2QrvY3V7uAHIA
	 UHZudgukQmQNbdc/EBVDC85clBUxV80LNMoIQz5yalsy48yQufpjCtW9KAF7w9y3kLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KaciEEIF;
	arc=fail smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1E9606A330
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 21:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A1E9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KaciEEIF
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso300463e87.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 13:49:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795038585; cv=none;
        d=google.com; s=arc-20260327;
        b=jzib8MsWkzvDpfB79HQmxGP6WQ77pukZDbOBecYs6rBxuqMC4Z4lzahpZIn0GPv1Qt
         0ZOf6sFTzjvvDFhg/VvPyXvtyQU/eS6CbccBWHlYxji9A9KGxo7cqhMT/+4SzY3jfbcN
         3sf2K3v8PSJlDTvM5STDGBVgUwOvHd6/k/RUhpgwU94qvyiDkPx8n2FoxMO32Ci4o40C
         f/yTgF4pb6pZilJZKyKgV+F92X9x6ZRfuJtmVuXuOURFFppaGy/0FuIV6KXcQUTVV8rP
         /TuIzA5afcHeYwkoJWnHgLpSegkYA5735btZ1jljK1TRDNxSyOtBQNPF6X68BhY5kULc
         UkIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CZPHqjEKi2vg5bpASOGDI+kJVhoG5JNXko8FEV4Oxfg=;
        fh=19lLi3m3LY/IOKWL/NMWpSqF2buKqmB0IB4DpVG99fo=;
        b=SIfP+ixS0dZ6AHU4GahbCGsfCwct+h07HatGo0fPDUDna6yJ0ZNvLKn/xOmv6RSc8/
         VUSjlJWTaf2iCReKTAOXi+BB2nzX85HXlppC3HYDnVIIa9j5NWXxgW5sLu4mU4oQCIAN
         JHEgOzEO8oDr2ePT7EiQUl5iyNYHtIwkJOBxT2q3/d13cR9fHTS+dZfSJQNklLKWjTSn
         q5+v0Mcuu+5l3IYudIwNCkQAVRLg+Ki0qbX8HcuQMfM0KstHk37kkYZke+AS0usvVmEs
         ChEqqiAkFvzYJTzlifK/t0HikFy69WnIeB00OMfUe1QC+4PIZxMdu30HTNoQ0oqJFGsB
         3j7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1795038585; x=1795643385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZPHqjEKi2vg5bpASOGDI+kJVhoG5JNXko8FEV4Oxfg=;
        b=KaciEEIFbL/YwiIDScNJOJE/ZISkK9Hm5quErzyii+lNT1WfC7kXZg/3FpRZhArF36
         Ad6xuGX4OWHMMcj6Uv+Z0P3xjYKr4xdoCcBZYBSZ40V+hyh+sFba/6f/Byhy6/IHBYV0
         /krtJ2/zrzEeNc29BPoEzTEoutLnweqJEraHWGz4Xdqq1myp231uUNQJfdNikDffJxU0
         OhrtcSpB956rNGC7WaELPyoRadGtF0ROnUwsxD71d4jKhm42p47rbfwAaCyy31Ekzp8c
         eLl8tZDuFmJ51rjZGikkRD11SztUd+7xg3bdsx6y/sDvmlwM86hcs70DaEGgQFzFJe8W
         wh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795038585; x=1795643385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZPHqjEKi2vg5bpASOGDI+kJVhoG5JNXko8FEV4Oxfg=;
        b=0h2eR5gUjU0XayVDhMIAbEvzBv6ZmrbE1FFW76klddKOqxizZAZAnc0BGQfeJmY8LA
         +y5tqcF8EesZGK0PNrrEGE/06oHe+QIw9LYed0KlBre3gtx/z2nQYa3haCoyeIKDcac2
         ECjiM7rwzptMPw/B9ht6CdhAdnBXOUSJ5a9uURql2Qp4CARaxGN+/ZUeqU+Ma03fd0LG
         G5vJn3nUAaJIVge9/d0fPbvzFzP2TxPaxYEmPFg0HGvdukoHitjFsWAvrrJ9wZEjd99C
         ItE5i4LLshzkWkgeKUTZ4tCbgXSx6xxDqINR8Z5cYwOX8ow7EgOIRPucQ+9yKY3+do/V
         4MQw==
X-Forwarded-Encrypted: i=1; AL+hErHs1rDOH6m1IGle8aZfGSZNLIsxFc0imnqgfEtar8MNV721gPKiHJWohUbcVev2BVHEJRWl6Wp59AFO2Su2zfI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZR478vwLaeGXJCTiwSCmVBdNstCzHO5OUTeOfWr630fBLP4Ov
	iN1gX0feb/lJGKBOocYSbUgYlhShL1WOWg1pClUjoClshY6vuoYy4GxYdZEJgxyA9WJ/3GqDDSk
	1Sdgwa4XSc2EmX6EjpVDoNo/xRTZVTIsw85Y9EnGn030fyWVz4Ic=
X-Gm-Gg: AYBFou0MYP5ExkCQCJC4BXtWO1l2BHMIe5GXna/Q/GfPEk8uSAs2YgG3HabzIT6R7qc
	+9vffwRqHgOwOmy4XFsH2IfebiBmSCtX34XiOAob8JSEq89q14YyEwIjlXWkVMcdpSrOQggebJv
	w+A9i6lwsTGoyQKJxVRuhVWF8fgzcpZJxXlFREdpNtj2AUCvaE1n4WN1xN6H5R4h5uCpa54R9JS
	KPABu7pjFYZGiVuHIXdEf4MMiSDSDSzGDEStz7tGU9E/r3zsKUPo6ZHFPvfYeCIwW+HqgUzBRfJ
	JYc0+aXJWPaGIa+dvubr6G6yl7ObtGR+PnZhrVlcmpDYnGi+9r456bLQKI2ThaCx9GWSH+GEmID
	qZhFV/9zDB/duzD0IOemF33OHMNQKJrxDKA==
X-Received: by 2002:a05:6512:3c8e:b0:5c1:ac5f:e596 with SMTP id
 2adb3069b0e04-5c1b40e9b72mr9362e87.23.1795038584801; Wed, 18 Nov 2026
 13:49:44 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-befreien-addieren-eislauf-e09212803534@brauner>
 <CALCETrWa1SBLcb5oWjqjgzZvKvCoHjmYFk=Lf5ytEM9uqm5jYA@mail.gmail.com>
 <avM41a80aig2de-R@google.com> <20261111-behagen-faktisch-entgegen-e2e714373895@brauner>
 <CALCETrUjW=kXxyggDUvEN+Pxc-pE98eVbdW8XBU8JzfqXj_voA@mail.gmail.com>
 <20261117-rational-ohnehin-unbeugsam-e5c04759a156@brauner>
 <CALCETrWhuOnBy0N0KznmczD4S2XEK0fbr0C=1KFQqTnoTJbQbg@mail.gmail.com>
 <20261118-stapeln-eckpunkte-lesbar-ee73537f474d@brauner> <20261118-zufahrt-baubeginn-gutsbetrieb-c09004227e8f@brauner>
 <CALCETrUMNr=32ENT6VBKPzoyJDfaX6nzZsjMVxuz9O3z+6LRhw@mail.gmail.com> <20261118-professionell-kondition-kerzen-5dd23c1ee490@brauner>
In-Reply-To: <20261118-professionell-kondition-kerzen-5dd23c1ee490@brauner>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 18 Nov 2026 13:49:32 -0800
X-Gm-Features: Aa3M54rEY9J5hVHcO1DPxjhsi7Vv-UveBjN-XrYjaJlUs9gt6QOZEnzJ-89YhLo
Message-ID: <CALCETrXAGpb=OZyGQ2=VfKmA6xeizAsusGZ_HmRtp_s99RpRJA@mail.gmail.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
To: Christian Brauner <brauner@kernel.org>
Cc: lennart@poettering.net, Jann Horn <jannh@google.com>, 
	"Hallgrimur H. Gunnarsson" <halg@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	KP Singh <kpsingh@kernel.org>, Jonathan Calmels <jcalmels@3xx0.net>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 1:37=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Wed, Nov 18, 2026 at 01:12:45PM -0800, Andy Lutomirski wrote:

> > > > * deny privilege gain on exec in the initial user namespace and all=
ow it
> > > >   in nested ones. I mused about this in
> > > >   https://github.com/uapi-group/kernel-features/pull/38
> > > >
> > > > Also, since v7.1 there's CLONE_NNP to spawn a child without no_new_=
privs
> > > > set.
> > >
> > > Forgot:
> > >
> > > https://www.thkukuk.de/blog/no_new_privs/
> > >
> > > has an overview of where we're currently at.
> >
> > Nice!
> >
> > I commented in the uapi-group issue:
> >
> > I think there may be a rather more direct solution to this problem. I
> > seem to recall advocating for clearing no_new_privs when entering a
> > userns way back when, and IIRC I dropped this as part of the extensive
> > negotiation to get NNP into the kernel in the first place. (I think
> > dropping it was probably the right decision to keep the final patch
> > simple.)
> >
> > But I think I would still advocate for an option to let clone, unshare
> > and setns callers turn no_new_privs off. The logic is that, if you own
> > a userns, you already have all capabilities in it. If you enter it,
> > you get to keep those by having them raised in cap_permitted. Being
> > able to clear NNP and thus drop and subsequently regain them does not
> > let you do anything you couldn=E2=80=99t already do.
> >
> > An LSM hook for this would be needed because this argument does not
> > apply to non-namespace-scoped LSM-based privileges. But the LSM hook
> > would just be a "may this caller enter this userns and clear
> > no_new_privs while doing so" query. In the absence of LSMs, the
> > operation would be allowed.
> >
> > This would allow a fully no_new_privs host to run an ordinary
> > container that runs, in the ordinary way, without no_new_privs, and
> > without hitting any new LSM calls after it's started.
> >
> > The API could be as simple as a CLONE_CLEAR_NNP bit.
>
> I think that sounds ok. I worry a little it since it would somewhat
> alter the promise that NNP gives. What model do you envision?
> It seems that CLONE_CLEAR_NNP would only be allowed with CLONE_NEWUSER.
> I _think_ this safe even for privileged users that create a user
> namespace and map uid 0 to uid 0. So I think this could work.

Whoops.  I thought that and didn't type that.  Yes, I think you should
only be able to clear NNP with CLONE_NEWUSER.

(And if something like cells ever lands, presumably a task with NNP
set should be allowed to create a cell without NNP in the init task as
long as the same LSM hook says it's okay.)

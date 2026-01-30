Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EAD367F42
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 11:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772472; cv=none; b=lDJDaljlzF3/jMl8VIP/YMrXHP+jmbT3lJAPmQzQ+ERID3UzNmJ/Oq2xexlIWUDTsNcThpbfYyFggeL+0ZnW34u2MYvpigcHDfZkVns6ANhrzPvNpt/+ltpwsbPnB4EP8ddFKnUoGmpOIrPTLx+1SoupwyA0EdXWseZ4398MumQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772472; c=relaxed/simple;
	bh=dOBb1/hX56xTU6QrC2APTZYbHhHs006flWmrSPNARLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YiUOmpxwE3ENVHBvbQFmgPMKu4C1vC7SK75b8O41gObphcldJV3ded0oJG3mAf+XV9J1uqQJyip4AIgRyicMDuZHocwk6vFdnmpthDsX/n/mZ95YmpAYccvekWPSuJRHsVKri9rShP4ShWY2CTFOLUO0HrtOw9atx5j7+TyOtq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNoywkeW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNoywkeW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FE8C2BCB2
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 11:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769772471;
	bh=dOBb1/hX56xTU6QrC2APTZYbHhHs006flWmrSPNARLk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fNoywkeWnjnHsueVxeZazQepbLaiS+aE+DimVIvw0oGYwhdyuh/HGFphMl2ZZU559
	 pPk0i8oFHZ3ytAvyvITRPKxEVeXL9fCFJxm52GJZoTG/HYQC7poXjTHZHTNLJxL+wV
	 4mmbFWuWEBg78o/+e5uBiRDmoYElHDPQmSv4i6C67K8k7vMK4b1WpP7be7MyRYzHh2
	 73FeGbktAhgJdsNxAawIg1UIY8QE0JsX08V6ABOi4E5lVOPS+BqvfNKVcjTNt7vk+6
	 OZzY0bbpl5uzGQlbw1GwOck/TQXysLnt3Mj6WL4kYL92ML1gY51hB+b1XSYAQtdMFw
	 1QZP5asPLVK+w==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-385b6a15affso29674121fa.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 03:27:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQkTOWmXrMdW4tL3gPLvdbCkkNZ0q//UGSpsLRos5l6MAB/W123rqxt9fQFI3Iw+OcZtv30pJ/rsq2WOCyASQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqfFzJtWT29NT1mtzsJ9bCi1++YoUx7HndzGxlZWzhkaoCuaL9
	0Nfiql8uchaMT3JuaaA8cjY8kQ6GLo1iD4i+Oa6VDeWCJ6KSbJHMS//YzRIwx3rTiDA1YmyunDa
	EEoQo9ndXJAVl300DncAfK9LYIT2eCZqbUJzzXjRIDQ==
X-Received: by 2002:a05:651c:304d:b0:382:4f57:e8d1 with SMTP id
 38308e7fff4ca-386466437d1mr10011641fa.18.1769772470520; Fri, 30 Jan 2026
 03:27:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124170535.11756-1-johan@kernel.org> <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh> <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com> <CAMRc=MfP1_fH91AVjerbnwVfhA0oqBKV+CTX0_1n32g1t-Pvuw@mail.gmail.com>
 <aXneX-aZofvuk8gl@ninjato> <20260128150538.GA1134360@nvidia.com>
 <CAMRc=McE5yTQ2hcLiR6asQWEi=Y1rhHzqq7G6FR58LCFZi6BAA@mail.gmail.com> <20260128160127.GC1134360@nvidia.com>
In-Reply-To: <20260128160127.GC1134360@nvidia.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 30 Jan 2026 12:27:36 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdiSyCPm=X20Va-18ow7dZ1d+ZnXu0uBD1cL2MfppZQqg@mail.gmail.com>
X-Gm-Features: AZwV_Qi2AjrACCeKnrRuZpJKb17VRq4mA_5DtAP65bEfHZ2Ak5o3zod9-ZDyCfM
Message-ID: <CAMRc=MdiSyCPm=X20Va-18ow7dZ1d+ZnXu0uBD1cL2MfppZQqg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Johan Hovold <johan@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 5:01=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Wed, Jan 28, 2026 at 04:20:02PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Jan 28, 2026 at 4:05=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com=
> wrote:
> > >
> > > On Wed, Jan 28, 2026 at 11:01:03AM +0100, Wolfram Sang wrote:
> > > >
> > > > > One exception is I2C where the logic is so broken we need to firs=
t
> > > > > rework a lot of drivers.
> > > >
> > > > Let's say "bitrotten" instead of broken. People used what was avail=
able
> > > > at that time and they prevented the kernel from crashing, at least.=
 And
> > > > up to now, nobody had the bandwidth to improve that part in I2C.
> > > >
> > > > > Wolfram is on board with that though.
> > > >
> > > > Ack. I want to emphasize here that for I2C the SRCU part goes into =
the
> > > > subsystem, not into the drivers.
> > >
> > > I would just gently advise again that SRCU is not a pancea and should
> > > only be used if the read side sections are super performance
> > > critical. I'm not sure that describes I2C. rwsem is often a simpler
> > > and better choice.
> > >
> >
> > Sure. We're not there yet so that's TBD. The reason for using SRCU in
> > GPIO was the fact that we have consumers that may call into GPIOLIB
> > from atomic context - so we must not sleep - but we also have sleeping
> > controllers - so we must not take a spinlock before entering driver
> > code. SRCU was about the only synchronization mechanism that worked in
> > all cases as the locking at the subsystem level needs to be
> > centralized.
>
> Oh, I didn't know you could safely use SRCU within atomic
> sections. That's a pretty good reason to use it in some places.
>
> > struct subsys_data {
> >   struct driver_data __rcu *priv;
> >   struct device dev;
> > }
>
> IMHO this is not a good pattern.
>
> The thing to RCU protect is the *driver ops* pointer, not the driver
> data. It is what I was saying before, the goal is to not call ops if
> the driver is revoked so that the ops can assume they are in a
> Device<Bound> context.
>
> It should not be normal for the core code to be touching priv at all,
> it has no natural reason to ever load it. It does have to fetch ops!
>

This is just an example and priv can hold whatever. Ideally this would
be ops but it's not always the case with existing code where ops and
driver data are often mixed into a single structure.

Bart

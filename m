Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5203367F28
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 11:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772016; cv=none; b=TflE5QMFj2irwLFYBtBu5u74kJLLbiKGOHA9i3q21XWncztC0GUhcQMre9G1kR9c/zlIPai1P2OQOzw/DjEJUw2m8X3cPLCf6ozg6CEz3iRldx+Tn9KsNLUf5Jm+bYxirNKvAEB3vE5QtpSk15aR9EIByKbN3qOyNHX+H93BVY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772016; c=relaxed/simple;
	bh=TbpwvIB/ykZIuzImUFLin/BO6kcdCaNFZ+AaICv33Kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpeWqwFPUwqu4flSK6F3GaAWGuaxDQfww18qBjzkWL2Ouyq9SQBWUojkN95PdqBxdOXnFm8kMozfl1nFxcxfYkHn1VMHbRulrjqER1EhnCb0IgXdSqQCGE0xO7ieAGasvAUk9Cup9nIjMSU6ViRewoy8XEmJsFbh439v8MAVtTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MECPX5la; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MECPX5la"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B55FC2BC86
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 11:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769772016;
	bh=TbpwvIB/ykZIuzImUFLin/BO6kcdCaNFZ+AaICv33Kw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MECPX5la6uFxXK73oFvEt7Y6JP8vJ62q3eJTx+wotVm82a6PqBy42MGvO7JLkACce
	 qUDwFbOk6USs0TUK5tru77l4t8Z0zkT0NlHcJlNCPByj9Ku13eBaOWVJUQihrTd07Q
	 wNau1KslFqPbsNCVaNLeFGBEVHwnnMAQLoL/it72iPg/cMBUAfakMidb+pbuNBpjpV
	 W1/DS+/0funLHo9ahOAvCAhzmDR9/G2jijtRnSuXfeQEEhWx4AsdopjLPlfVlaLoEl
	 pSAnbG4qM2/Vc6s2wljphxJvjnJy8qaQEfvZsFOhB0xryUkExJ1wC9cZr5AheVUVoO
	 YzQdrMk/tOvCw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-382fe06aa94so17380171fa.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 03:20:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXxOJD/KESthMA6j2vqgyU8Hn7rfYaeP8ooTHVbLC0LtTXNDHIF3fRskPua+Y1C66766jx6lEA1gyEHc+8w+ZU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjs8KBc3gl3F1Jv7K6qzkqzCRcYo2j/XDONH2t1d8Nf4YTBRfF
	pIhoE8GQ72Xwwv1AXDd5xg19ZbsgF4MsDCFgeboXSfOB3RAdTc4xvCOezFRt2cwlM1esho+IZD/
	TqTQAPJKrweI2GcnFw8aXjAJozVSaHCx+xXbIn2ShTQ==
X-Received: by 2002:a2e:be9e:0:b0:37b:a30e:fe1e with SMTP id
 38308e7fff4ca-38646594a39mr10350221fa.18.1769772014175; Fri, 30 Jan 2026
 03:20:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124170535.11756-1-johan@kernel.org> <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh> <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <aXovtrAM1r1UyWxA@hovoldconsulting.com> <CAMRc=MeMW4g5em_b9qGBR9OmQZNzyQp-S=zKDCPFu506ixy-cQ@mail.gmail.com>
 <20260129105634.GC3317328@killaraus> <CAMRc=MfzByLPJ0FKySmG7b79Ah63Mtk1hs1N=6kv8pTDydrcGg@mail.gmail.com>
 <20260129144906.GE3327197@killaraus>
In-Reply-To: <20260129144906.GE3327197@killaraus>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 30 Jan 2026 12:19:59 +0100
X-Gmail-Original-Message-ID: <CAMRc=McXfSOt4b3AHRcOZoKhkQQsYDt=yWGgS_doO7HC69R2rg@mail.gmail.com>
X-Gm-Features: AZwV_Qj5xfuk3GOKjPkJG1J_aiopbJnwKIOtc32rNHZAgV4bR-fuRe1_A0LU5o0
Message-ID: <CAMRc=McXfSOt4b3AHRcOZoKhkQQsYDt=yWGgS_doO7HC69R2rg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Johan Hovold <johan@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 3:49=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Jan 29, 2026 at 08:50:30AM -0500, Bartosz Golaszewski wrote:
> > On Thu, 29 Jan 2026 11:56:34 +0100, Laurent Pinchart said:
> > > On Thu, Jan 29, 2026 at 10:11:46AM +0100, Bartosz Golaszewski wrote:
> > >>
> > >> For I2C both the problem is different (subsystem waiting forever for
> > >> consumers to release all references) and the culprit: memory used to
> > >> hold the reference-counted struct device is released the supplier
> > >> unbind unconditionally. Unfortunately there's no way around it other
> > >> than to first move it into a separate chunk managed by i2c core.
> > >
> > > Isn't there ? Can't the driver-specific data structure be
> > > reference-counted instead of unconditionally freed at unbind time ?
> >
> > Oh, for sure, if we did from the start. But we did not and there are no=
w
> > hundreds of i2c drivers that do:
> >
> > struct my_i2c_drv_data {
> >       struct i2c_adapter adap;
> >       int my_other_drv_data;
> > };
> >
> > and in probe:
> >
> > struct my_i2c_drv_data *data =3D devm_kzalloc(dev, sizeof(*data), GFP_K=
ERNEL);
> >
> > (or just kzalloc() with kfree() in remove, it doesn't matter)
> >
> > and the ownership of that data belongs to the driver. There's no way we=
 could
> > address it now so the next best thing is to work towards moving the own=
ership
> > of struct i2c_adapter to the i2c core and make it reference counted usi=
ng the
> > internal kobject of the associated struct device.
>
> What I'm reading here is essentially that we rolled out devm_kzalloc()
> too quickly without understanding the consequences, and it has spread so
> much that it can't be fixed properly now, so we need to find a
> workaround. And now we're trying to work around the problem by rolling
> out a revocable API that has barely seen any testing, and is known to
> have design issues. Does any one else see the irony ? :-)
>

No, this has nothing to do with devm_anything(). It's resource
ownership. What driver creates at probe(), the driver should destroy
at remove(). I really hate with a passion the pattern where a driver
creates something in probe() and then tosses it over to the subsystem
for management. If an entity registers the struct device, it should
also be the one who allocates and manages the memory for it. Devres
just made it a bit easier to commit this kind of errors but they would
exist nevertheless.

Bartosz

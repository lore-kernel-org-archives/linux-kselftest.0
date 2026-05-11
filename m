Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255533290C9
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778484797; cv=none; b=L1b6dshicdUvEHLO/GtJ3kuGbJNyllXrczXX0Mr0jmC3jCVtpwtqR08bug67kcgouzJSeKOgfwWhkaIgZ1FZsD0pOaRgxVa4Krd12WLmdE5BTwImcvrc4+YI5ub3ThePxVwP6hNAMVRg57/UXgWKUGFgHLKH8czPL7AW/4gg83E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778484797; c=relaxed/simple;
	bh=HQS2ppIEMm/ytX7M+mkm/4UNTPgXCLuoXkHKknJtoPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLxBdoQpwDSK0UVGK9gKLzxF5Sg9jrm6zNNVm4zpLM6b+jxhL2OR7e1jDBE/wztcQEhOZeNA3ERqkB39CtYML8OoVpB2LGOEkIZPvNUdCzLoSWpxJiPeRBf/qUr60BkEfEltN62eGGr6H1stfmbgmpyFHWppNbejRX7yqoe1ybk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGZMdB+i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGZMdB+i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F1DC4AF0B
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 07:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778484797;
	bh=HQS2ppIEMm/ytX7M+mkm/4UNTPgXCLuoXkHKknJtoPM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MGZMdB+ibGI9D9YKHyLyP+WzEUlR+GC54j2KgrWuJBC28xcBLzN75f7+QREIizdP+
	 i76Q/f2rspqWBsv0ZC2PJF5Co5aRxJkMWfRE3wWb0+PF9RAaY0yHUVSQlBQPQXjaeD
	 1sH6QPyBTuDr9Uc0uOycVU6Reg06b2GEL94YUpsb2rGiwERb5rkgN/lksB4j9QOMAv
	 J3tmD92Ui0mqzI/Hur3hMhIYDS9CVcMBwzsQdBWzc7nEoMVnuEHWQdjJS3iO/z0wyd
	 G3Lbd71JasV7ynQY7BIpexLkYz8AlrfjfEjF6rdzJxarrGEcf7zOCYtfpREz8X5/RP
	 deHU7NN2oj5Ow==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3939d2bd739so34894831fa.0
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 00:33:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/DA88X3NlO5QQft9jv9Qd4vsbZjh/SYDQW7kc+IjdMd7aNc+RJSBiEFqxm5CuQ8jgr+I78Vu17DBeOg1s5zAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxemBRtE2S2yB1lUYemmWbGkBTYgpgsK16ykOMTaD+wn/nECKfI
	+kpcT6Aeu9WR4YBlWG6OHoHutUg2OUM8IiPNGzjlqDP/pDGMVouVmNEK3RkP+NzEKE4vj5ZWAOM
	bnzmYPinpUpnSww2SIDH6ARWEgM6iQ/vT0NIL8GPMhw==
X-Received: by 2002:a2e:7206:0:b0:38e:d3ec:4f87 with SMTP id
 38308e7fff4ca-393c41eee9amr60388351fa.21.1778484795560; Mon, 11 May 2026
 00:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com>
 <20260430-swnode-remove-on-dev-unreg-v4-1-01574da0aed3@oss.qualcomm.com>
 <afNEwrHLNTA4ywrN@ashevche-desk.local> <CAMRc=McH0zKz87z0TwPFrzZHMW6psytMaLZybM3pUk6OvUfo9Q@mail.gmail.com>
In-Reply-To: <CAMRc=McH0zKz87z0TwPFrzZHMW6psytMaLZybM3pUk6OvUfo9Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 11 May 2026 09:33:02 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mc_huU0HxHpD+RMNWeX2Sg84-LEg8y96BcF_qdtPr31eA@mail.gmail.com>
X-Gm-Features: AVHnY4J0d-A96IYDDzy5DWGJF8BSGrw5y9RgRW8ZPbRguG-zsrJb-Dc_nW2ma4M
Message-ID: <CAMRc=Mc_huU0HxHpD+RMNWeX2Sg84-LEg8y96BcF_qdtPr31eA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] driver core: platform: remove software node on release()
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Thu, Apr 30, 2026 at 2:02=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > On Thu, Apr 30, 2026 at 09:46:04AM +0200, Bartosz Golaszewski wrote:
> > > If we pass a software node to a newly created device using struct
> > > platform_device_info, it will not be removed when the device is
> > > released. This may happen when a module creating the device is remove=
d
> > > or on failure in platform_device_add().
> > >
> > > When we try to reuse that software node in a subsequent call to
> > > platform_device_register_full(), it will fails with -EBUSY. Add the
> > > missing call to device_remove_software_node() in release path.
> > >
> > > In addition to the above change, make sure that we still function
> > > correctly if a software node is used as the primary firmware node as
> > > well as disallow using two software nodes for platform devices as
> > > device_add_software_node() does not handle this case correctly (in fa=
ct
> > > a comment inside it states that only one software node per device is
> > > allowed but it will not bail out if two are used so we need to handle=
 it
> > > here).
> >
> > ...
> >
> > > -     if (pdevinfo->swnode && pdevinfo->properties)
> > > +     /*
> > > +      * Only one software node per device is allowed. Make sure we d=
on't
> > > +      * accept or create two.
> > > +      */
> > > +     if ((pdevinfo->swnode && pdevinfo->properties) ||
> > > +         (pdevinfo->swnode && is_software_node(pdevinfo->fwnode)) ||
> > > +         (pdevinfo->properties && is_software_node(pdevinfo->fwnode)=
))
> > >               return ERR_PTR(-EINVAL);
> >
> > This makes me think of why we have these many ways of doing things...
> > Perhaps we should kill pdevinfo::properties completely?
> >
>
> Good luck with that, I'm pretty sure a lot of users are still out
> there. :) It's also relatively convenient and skips one more struct
> definition.
>
> > Second thought is what about actually refusing this on the level of
> > device_add_software_node()? And looking at it, we have that check
> > there, why do we need it here then? Did we miss to check error code fro=
m
> > device_add_software_node() somewhere?
> >
>
> device_create_managed_software_node() doesn't seem to have that check
> unlike device_add_software_node() so we'd hit an issue with properties
> !=3D NULL && swnode supplied. I think failing earlier here makes for
> more readable code and less error-prone unwinding on failure.
>
> Also: device_add_software_node() return -EBUSY while I think it makes
> more sense to return -EINVAL. I prefer to keep this check locally
> unless driver core maintainers object.
>
> Bart

Danilo: if there are no further comments, can you pick it up for v7.1?

Thanks,
Bartosz

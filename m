Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13492402BB3
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 12:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777552712; cv=none; b=Z//ffQfZSDr9ZIMgE9jyN8gogAVKyWLc3y73VkrIqe/71pVpOZAtPG3MAPtp+phqU/N3zWEpiJSqSbDIr/6wMD7F5Gt3RvoJ53togz+rlh52bo/tLC8F4O4PDoLGBZaaHs99IA8p6MHbJPsJqykd4hZnZGxH91hTzI1PUzwVrIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777552712; c=relaxed/simple;
	bh=R9EllPnSfLGDbqIBQFH3hKWnn5nl7Y6RVmjcP2Kjwko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RmthLvNtnktVE+Y87OvXg3BYTo1SkMGIZPMO6ddvmpyWC2eF96PaByfQhzYijLaT2ZXyOmU4JbVm4zst0emY6BkzMniYq1kfD2vafntPzOHxlsMEY35vmqSpJZFEA4icYtZgKOlOWC7FpchGZFsHzKy/BImMOI6pBjUp8JHP4mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFLUH/QJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFLUH/QJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CE5C2BCB9
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 12:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777552711;
	bh=R9EllPnSfLGDbqIBQFH3hKWnn5nl7Y6RVmjcP2Kjwko=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oFLUH/QJWv1zKJt6LJV4H/uDHLUX9C4aVCgQVaiaBh+XCKQHqAaatil8rAsmF8s1x
	 4Ziwwsrjv4EbMQssuLgPXUb0EJJuFeANtiAnnUjbmXcx90EDXPvlhJ2UH3ivUiOhPO
	 Dw6nUyC+Ev2AC5rFbxiYy7jurUiBx5tu0KguSWeXFuyXhljOwBmHzWjZ+Fs7kmY3w8
	 O8vlT4w2kw8z3JvXh5wQWM7Rm3uODHfijopNyTeDHwjw9Nml0MSXF/BPORv3mGQvY/
	 CqPm+Hmmdzcl4kBUz71UfBzsLrdk9YyvS4bcOiqCiZgT3NX63BdUCVPiEsW2hcaGcn
	 VLvmHN6VoNmeg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38dfb789d7fso7840661fa.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 05:38:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/n4jfuRIRLOeuE/wCwWMvI4pfPwpfd8gsVVvKjiod+y3HLOame/NpLB1a2YODF2+E8LCNz1UvrtZ9WzSnCG7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEeu3hzj2dI7TXlA8WDIvR6wqXPhoG0ngrQnkJx4wx6ZgPuqx/
	kU9xuZVTgWH2OyDzyl2S8Spr4Gb/V901Cpr36FkGENaHaFlxwXRYA9copmlIYUvSSJ6eMaqmFbv
	P+O9eqr90pENx5C4BaRWDeUZV2TYFk7ti3pcIaYAkJQ==
X-Received: by 2002:a05:651c:1101:b0:38b:e464:f047 with SMTP id
 38308e7fff4ca-3934e18cf4fmr10214661fa.12.1777552710367; Thu, 30 Apr 2026
 05:38:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com>
 <20260430-swnode-remove-on-dev-unreg-v4-1-01574da0aed3@oss.qualcomm.com> <afNEwrHLNTA4ywrN@ashevche-desk.local>
In-Reply-To: <afNEwrHLNTA4ywrN@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 30 Apr 2026 14:38:17 +0200
X-Gmail-Original-Message-ID: <CAMRc=McH0zKz87z0TwPFrzZHMW6psytMaLZybM3pUk6OvUfo9Q@mail.gmail.com>
X-Gm-Features: AVHnY4LbPmEDdDHJLshHzxLvBbhFx-kkBSGfgSxHm9nJThbWqvGXf8W8buCcC5o
Message-ID: <CAMRc=McH0zKz87z0TwPFrzZHMW6psytMaLZybM3pUk6OvUfo9Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] driver core: platform: remove software node on release()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Andy Shevchenko <andy@kernel.org>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 2:02=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Apr 30, 2026 at 09:46:04AM +0200, Bartosz Golaszewski wrote:
> > If we pass a software node to a newly created device using struct
> > platform_device_info, it will not be removed when the device is
> > released. This may happen when a module creating the device is removed
> > or on failure in platform_device_add().
> >
> > When we try to reuse that software node in a subsequent call to
> > platform_device_register_full(), it will fails with -EBUSY. Add the
> > missing call to device_remove_software_node() in release path.
> >
> > In addition to the above change, make sure that we still function
> > correctly if a software node is used as the primary firmware node as
> > well as disallow using two software nodes for platform devices as
> > device_add_software_node() does not handle this case correctly (in fact
> > a comment inside it states that only one software node per device is
> > allowed but it will not bail out if two are used so we need to handle i=
t
> > here).
>
> ...
>
> > -     if (pdevinfo->swnode && pdevinfo->properties)
> > +     /*
> > +      * Only one software node per device is allowed. Make sure we don=
't
> > +      * accept or create two.
> > +      */
> > +     if ((pdevinfo->swnode && pdevinfo->properties) ||
> > +         (pdevinfo->swnode && is_software_node(pdevinfo->fwnode)) ||
> > +         (pdevinfo->properties && is_software_node(pdevinfo->fwnode)))
> >               return ERR_PTR(-EINVAL);
>
> This makes me think of why we have these many ways of doing things...
> Perhaps we should kill pdevinfo::properties completely?
>

Good luck with that, I'm pretty sure a lot of users are still out
there. :) It's also relatively convenient and skips one more struct
definition.

> Second thought is what about actually refusing this on the level of
> device_add_software_node()? And looking at it, we have that check
> there, why do we need it here then? Did we miss to check error code from
> device_add_software_node() somewhere?
>

device_create_managed_software_node() doesn't seem to have that check
unlike device_add_software_node() so we'd hit an issue with properties
!=3D NULL && swnode supplied. I think failing earlier here makes for
more readable code and less error-prone unwinding on failure.

Also: device_add_software_node() return -EBUSY while I think it makes
more sense to return -EINVAL. I prefer to keep this check locally
unless driver core maintainers object.

Bart

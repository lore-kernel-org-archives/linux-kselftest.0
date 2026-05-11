Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6913FF889
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511064; cv=none; b=mfBIqLlBJnTlw5wsMcR/5ThknT/rqqL91EHmsfsa8pcCFwdizsQecEAgrgKK7EqBusYVPWhRdH3gwr1rI7u8TLCSkDtMFqa6JhX1WPQkWdBnlVALnXEvchKPS9jt7qIsowVOg6bnEy7uDDxJuOePa/4oigPnj6uPAgKEpj+26hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511064; c=relaxed/simple;
	bh=3b5Gy4LOWv3PDMN5ZONadC6shz2zFT3ZNBZe+VDO9iY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VMXneUEr32if7MK8tEUgwXOiTZJqakotq6gSv6PgO61MvxTbegWpjmUf+UPLtR4ggQiluT5X4VR3xElwOhBh/m6Uhc//SPphTqCx25UmYHcrJr5wvli6aEjkVfFQqAZRxT8NOgQncKBiHfU0lSyoQ6M78YH2E2yNny9Dsa5Cs+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYU67d9c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYU67d9c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D54C2BCF7
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778511064;
	bh=3b5Gy4LOWv3PDMN5ZONadC6shz2zFT3ZNBZe+VDO9iY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fYU67d9clwaTqnSxMk9ZbjtQoVcpGY/lS3dx4a5LeB63lPz/oK5uFhArwm4YLgZBQ
	 5lMO3HAQWc8ZhhgZjkkM75C7FcEt7s1UT+1kTVptqVCva6UM38ig9raEX7BGK5GXDV
	 2+/rD+HP1Wi881e1cWf3muPq7mJCVSpIjcv78bXOb6iiGXY44QvUJtSAqqzc2PakAs
	 5qf4qIODjlz2lNxEoAEhJChmY87AUbxCNBRISoKLIqD9frRMsMNH4XW10qMwjnUQ+o
	 syqpOaotvo+9XW+D1/Ghjd5HkHLSX+Ae23nybB7IG6+zpwe7Zv/8jL7/c+GZj2J5/6
	 1TgQjNNwbtFlQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3939d2bd739so38807531fa.0
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 07:51:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8MMY/BZP6XLaL4dc5R3Gp/w/rOGAxsh+5B57QljI0IfEMYHorqGEFMivdCdHsSVh3zyiMls/5vfsb9u9ckhBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdZqp89fP9RGGG/aaIil0lAZaRfRiS2jLDUF1+2IAZEidYy50s
	sNSH1vmYbjv4f6TjqjjKcxHjN+Gbeo5xWoHb7xmxNrRBFzIyIxWhs2IojRZ+zEtuAfCoO4O1VpE
	PY0JUXjnKiebEygof8CgX5+3DN5KLcJBflmLU/C5aTQ==
X-Received: by 2002:a05:651c:982:b0:38a:4401:d2ac with SMTP id
 38308e7fff4ca-393c41c97d2mr82572171fa.17.1778511062837; Mon, 11 May 2026
 07:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com>
 <20260430-swnode-remove-on-dev-unreg-v4-1-01574da0aed3@oss.qualcomm.com>
 <afNEwrHLNTA4ywrN@ashevche-desk.local> <CAMRc=McH0zKz87z0TwPFrzZHMW6psytMaLZybM3pUk6OvUfo9Q@mail.gmail.com>
 <CAMRc=Mc_huU0HxHpD+RMNWeX2Sg84-LEg8y96BcF_qdtPr31eA@mail.gmail.com>
 <DIFWH6TWTOOT.37CW17JHKWBQR@kernel.org> <CAMRc=MeiL+MeFsiPrWja2qJx=zU3RXKLL7CDccX1epXWgNtvdA@mail.gmail.com>
 <DIFX59JPJI9U.1Y41563GD6YJL@kernel.org>
In-Reply-To: <DIFX59JPJI9U.1Y41563GD6YJL@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 11 May 2026 16:50:50 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfBnbSUxwjVjf81K-W8uQ8ecXmK=8=FkRqVvK+6AipQuw@mail.gmail.com>
X-Gm-Features: AVHnY4JWbeYWH-pjUxRjbO7pS6F8QxJJ_85GfwjN4Tyy1zumbbQq0kZQFKAa_mE
Message-ID: <CAMRc=MfBnbSUxwjVjf81K-W8uQ8ecXmK=8=FkRqVvK+6AipQuw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] driver core: platform: remove software node on release()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 4:31=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon May 11, 2026 at 4:17 PM CEST, Bartosz Golaszewski wrote:
> > On Mon, 11 May 2026 16:00:23 +0200, Danilo Krummrich <dakr@kernel.org> =
said:
> >> On Mon May 11, 2026 at 9:33 AM CEST, Bartosz Golaszewski wrote:
> >>> Danilo: if there are no further comments, can you pick it up for v7.1=
?
> >>
> >> It seems that sashiko has a valid concern in [1]; can you confirm?
> >>
> >> [1] https://sashiko.dev/#/patchset/20260430-swnode-remove-on-dev-unreg=
-v4-0-01574da0aed3%40oss.qualcomm.com
> >>
> >
> > Yes, I explained it here[1]. Basically it's similar to how we need to c=
all
> > platform_device_add_data() for devices created with platform_device_all=
oc().
> >
> > We can consider adding platform_device_add_software_node() once there's
> > a potential user but for now I'd just leave it like this.
>
> But there are users that already need this, no? There is Xe [1] and Surfa=
ce GPE
> [2], or am I missing something?
>
> [1] https://elixir.bootlin.com/linux/v7.1-rc2/source/drivers/gpu/drm/xe/x=
e_i2c.c#L99
> [2] https://elixir.bootlin.com/linux/v7.1-rc2/source/drivers/platform/sur=
face/surface_gpe.c#L308

Right, I was not aware of these. That could indeed cause a regression.
I'd like to fix the problem in v7.1 but also keep it minimal so adding
platform_device_add_software_node() and updating drivers to using it
may be the next step but for now: how about adding
platform_device_release_full() which would call
device_remove_software_node() and then the existing
platform_device_release()? We'd replace the .release callback of
struct device in platform_device_register_full() but if the user just
uses platform_device_alloc(), they would keep the regular .release()
that doesn't remove the software node?

That would go into v7.1 and then I'd provide
platform_device_add_software_node(), use it in all drivers that need
it, and then we'd remove platform_device_release_full() and go back to
a single, unified release callback?

Does it make sense?

Bart

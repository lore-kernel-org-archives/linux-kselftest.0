Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A79243CECD
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 16:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515738; cv=none; b=c64WC9sbuLaxkNpqR6xHFuaKvij4+Rpsg6uzt5PPsBvAWNYCTpAvl5wFQZmhTjDmnu6rpmFakUxVi9H+s4NKFA1ZYeQ6BOdZXB4nvXVSTTzgQmTG3eE2MGNPJMyugpOgCz7508Hi2UZrfUhFsKUzsbU0C/SHD72+ZARYW0MZE8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515738; c=relaxed/simple;
	bh=HI/UnGrm/4SRY0s10k1WXENBF1WjaceEuaVjGrogGMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u+/QWwh8DhV1oS5BJg9rVgQl4KRpgrQLqMY1q6iAiK/ASqbP08HTCtzhz9TxLyMVSpw1WVqZWRb7BYFJNKQbqZzXwNW8RgSRZEN1nEj8AWprgzxFMDKtK49kbOjnPXKeyYit8ex4LS72BFtFsG+35p3su/bVia+T/ch+3WI/200=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g073bAtm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g073bAtm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4048EC2BD00
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 16:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778515738;
	bh=HI/UnGrm/4SRY0s10k1WXENBF1WjaceEuaVjGrogGMM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g073bAtmUOFfqV7MjCB3Arwyc1vq4f/UUofTReGtmMvhZRK2tE+JacTePTjGJD8v9
	 ZgSiQzDNnD7MN6x1q0VsmuVf0+usOfuy3FPw63bqfBKcv/OhOLWncpr3DVq5z/PJXh
	 KCHpodpbwR7ckfJTz8OHmm5XwWUoFzvF+5Os7KbEveImBTj852KpTX5lkXmRO8JB5Y
	 p8zgt8RyERCtdjprOmGLs5UbH8y8YPWrYYdZBdmdNjg1KWG0xhurr184V2vMt4Aay1
	 wPVI6AOkDlOIYE1pj1a2nHpRPjN9hQrEhG06bqnZylPUm+guVX0ztXmzODbYs3qCDT
	 s7o47OVxF7EAQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so1466383e87.3
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 09:08:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ//nucW1Uqt5/mEF+Ke6BMqrSBHzI5bODox+cPFhpv/C2qNT63Y1l4Q4oqdLGuNCrNjGzE9irIsBeep5Sl8o+I=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo0xOnx+EDRSKmfLJcs1+XLkBmFbC/7FbZIEptkKtqsxHb3gzY
	Z2ETwz6PRAUB4FgOkQm6T0anXd4pK4Z5PNf+WiUGcXqxpGmt7RSwaqrdCOCQ+ahVMp1JNJwk2k0
	fVTNCo+x71nX5/7DNDcdDAD8+gQd241cIl+BFl5/1Kw==
X-Received: by 2002:a05:6512:6d6:b0:5a4:6dd:87 with SMTP id
 2adb3069b0e04-5a887ad9a16mr8022760e87.2.1778515736764; Mon, 11 May 2026
 09:08:56 -0700 (PDT)
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
 <DIFX59JPJI9U.1Y41563GD6YJL@kernel.org> <CAMRc=MfBnbSUxwjVjf81K-W8uQ8ecXmK=8=FkRqVvK+6AipQuw@mail.gmail.com>
 <DIFXTWSAEDHD.RMJBLY7XXEXU@kernel.org>
In-Reply-To: <DIFXTWSAEDHD.RMJBLY7XXEXU@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 11 May 2026 18:08:44 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeLa_pMy5cMwTBCr+TLhg2HyxrYBXEHXC2emm04iVnfGg@mail.gmail.com>
X-Gm-Features: AVHnY4JawaaCEnkyiNFpPNw6Fw0HbGkCHbjjTC9tMBcTdovwkdrWnmhHpgsuskE
Message-ID: <CAMRc=MeLa_pMy5cMwTBCr+TLhg2HyxrYBXEHXC2emm04iVnfGg@mail.gmail.com>
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

On Mon, May 11, 2026 at 5:04=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon May 11, 2026 at 4:50 PM CEST, Bartosz Golaszewski wrote:
> > On Mon, May 11, 2026 at 4:31=E2=80=AFPM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> >>
> >> On Mon May 11, 2026 at 4:17 PM CEST, Bartosz Golaszewski wrote:
> >> > On Mon, 11 May 2026 16:00:23 +0200, Danilo Krummrich <dakr@kernel.or=
g> said:
> >> >> On Mon May 11, 2026 at 9:33 AM CEST, Bartosz Golaszewski wrote:
> >> >>> Danilo: if there are no further comments, can you pick it up for v=
7.1?
> >> >>
> >> >> It seems that sashiko has a valid concern in [1]; can you confirm?
> >> >>
> >> >> [1] https://sashiko.dev/#/patchset/20260430-swnode-remove-on-dev-un=
reg-v4-0-01574da0aed3%40oss.qualcomm.com
> >> >>
> >> >
> >> > Yes, I explained it here[1]. Basically it's similar to how we need t=
o call
> >> > platform_device_add_data() for devices created with platform_device_=
alloc().
> >> >
> >> > We can consider adding platform_device_add_software_node() once ther=
e's
> >> > a potential user but for now I'd just leave it like this.
> >>
> >> But there are users that already need this, no? There is Xe [1] and Su=
rface GPE
> >> [2], or am I missing something?
> >>
> >> [1] https://elixir.bootlin.com/linux/v7.1-rc2/source/drivers/gpu/drm/x=
e/xe_i2c.c#L99
> >> [2] https://elixir.bootlin.com/linux/v7.1-rc2/source/drivers/platform/=
surface/surface_gpe.c#L308
> >
> > Right, I was not aware of these. That could indeed cause a regression.
> > I'd like to fix the problem in v7.1 but also keep it minimal so adding
> > platform_device_add_software_node() and updating drivers to using it
> > may be the next step but for now: how about adding
> > platform_device_release_full() which would call
> > device_remove_software_node() and then the existing
> > platform_device_release()? We'd replace the .release callback of
> > struct device in platform_device_register_full() but if the user just
> > uses platform_device_alloc(), they would keep the regular .release()
> > that doesn't remove the software node?
> >
> > That would go into v7.1 and then I'd provide
> > platform_device_add_software_node(), use it in all drivers that need
> > it, and then we'd remove platform_device_release_full() and go back to
> > a single, unified release callback?
> >
> > Does it make sense?
>
> If it is just those two (and at least I did not find any other drivers) i=
t might
> be easier to just add platform_device_add_software_node(), use it within =
those
> two drivers and still land it for v7.1.
>
> I feel like this change turns out simpler and less error prone than the a=
bove
> workaround to keep changes local to the driver core.

Sounds good, I'll do this then.

Bart

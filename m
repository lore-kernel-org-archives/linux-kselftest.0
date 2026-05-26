Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E4D331214
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 09:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787168; cv=none; b=n9xFE3Ifr9sWP+HdOP7G1xuN0zjvybwAEct++vgaoOaN6bTx+qlQ0gYn0td6h3Oky0r9glHDd3SPeIBVev8M0eXZKwgDgsDgi0xopCqUhMhhGjvOxxQnaUJIKvbkN95ySg9HxDjy7tDpWmXQZ6viTJn779l6Xa/mgD31XQinyWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787168; c=relaxed/simple;
	bh=oviD7lteyN/gFf79gUn8I/HMmUljfbH6Qyuu10Ki0Ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BpGN0CFAJenLdUWnHeQgnh+cyOIVf7JVZjtyRxinXUlfRiXHgV/QG8jbpkTLAveQ1QH+WnAk7XjftiZjnHd7SIZUcRyjl9PAsg4ZMPYBZwcrDHZf0FeZJGDiyvQw8rsC8nkN4ME4YdfhZjjfzqoiXNqENxe+SIP0aUoWBTBosu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlDXXenB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlDXXenB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EFC1F00A3E
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 09:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779787166;
	bh=ni6jIrunOswHt88fgTZ+iXmbe77CAGPwZXG2zBni7TA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UlDXXenBU7GpRC+gmRvP8UAHDa2LZ3ukmNusNV6Co16dqTczj0UU1xMIFWzDXWkeu
	 AVmtYxZwhVUuT+6geI835mSkvt4Air4LQzKNiWzCgQH5MKTKxMdTCeLHhFc6SP0rnF
	 Og70aj8sk8auYbyFauZFCcQttJXDWFcmRTjcgCQMRVAirZH7vmgyE7YBO7RVkz0QYk
	 lg0SANdjcoFV/Jg+p4zX7iS/Oy+oaCPQ06TRGxbkbKKdspb5sArZYyecLM/yxs94z4
	 /qJPZR5Ui8wd/wf+2L80uAPbnIOSDN6e1n/KLn6IKYUJpVqgxUj0BR7x9yig7244Th
	 1Ln2NNrpvaQcg==
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1363e78746eso5505592c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 02:19:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9aqxTe3iLP3HgsO7/kAo0uWZQxJJpKQEHUTQsvU08XCqdBY9aLUzmXtZOJeiP9aWOsoWjwD0tALnsrJUOtJOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA4rmuSwBE4PPQTs4VtgxioY3/g+W6XQ95NCeA6zyU7Z6ng5qi
	YSYaMEQ+xYyf0WlJpBcOPmVRbOYmypX0lhFn+Iy//X+0VwiHcqFQ7enx14p6ES3qOusdrg1qOAm
	rczSztJ/usU7VD+/eNdIburT+/8d7OkQD+/itRGHFzg==
X-Received: by 2002:a05:7022:41aa:b0:12c:2cf8:2f30 with SMTP id
 a92af1059eb24-1365f811393mr6015928c88.15.1779787165853; Tue, 26 May 2026
 02:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
 <20260522-gpiolib-kunit-v3-3-b15fe6987430@oss.qualcomm.com> <d580b8fe-2f22-48c2-86ae-5037ef13a9db@davidgow.net>
In-Reply-To: <d580b8fe-2f22-48c2-86ae-5037ef13a9db@davidgow.net>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 26 May 2026 11:19:09 +0200
X-Gmail-Original-Message-ID: <CAMRc=McLAgTMOXWOXq4_6qR9tBpH6Z_7L3-Tw6K2T5rtM5cmVQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ksh-aU6HD72aBn-k6WmimdFPyfHwPzKE-pc-LGmMlvFtjEwrjPejcQ1nU
Message-ID: <CAMRc=McLAgTMOXWOXq4_6qR9tBpH6Z_7L3-Tw6K2T5rtM5cmVQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] gpio: add kunit test cases for the GPIO subsystem
To: David Gow <david@davidgow.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 11:07=E2=80=AFAM David Gow <david@davidgow.net> wro=
te:
>
> Le 22/05/2026 =C3=A0 9:42 PM, Bartosz Golaszewski a =C3=A9crit :
> > Add a module containing kunit test cases for GPIO core. The idea is to
> > use it to test functionalities that can't easily be tested from
> > user-space with kernel selftests or GPIO character device test suites
> > provided by the libgpiod package.
> >
> > For now add test cases that verify software node based lookup and ensur=
e
> > that a GPIO provider unbinding with active consumers does not cause a
> > crash.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
>
> This is a nice looking test, thanks.
>
> Reviewed-by: David Gow <david@davidgow.net>
>
> Happy for this (and the previous two patches) to go in via gpio, but if
> you'd rather them go in via the KUnit tree, let me know.
>

I'll take it through the GPIO tree, thanks.

> Cheers,
> -- David
>
> >  drivers/gpio/Kconfig         |   8 +
> >  drivers/gpio/Makefile        |   1 +
> >  drivers/gpio/gpiolib-kunit.c | 358 +++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 367 insertions(+)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 00fcab5d09a4294ed778cea78af5867a0f6e481b..0306005fb7d65ae85905e96=
7b9065fd74db753db 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -102,6 +102,14 @@ config GPIO_CDEV_V1
> >         This ABI version is deprecated.
> >         Please use the latest ABI for new developments.
> >
> > +config GPIO_KUNIT
> > +     tristate "Build GPIO Kunit test cases"
> > +     depends on KUNIT
> > +     default KUNIT_ALL_TESTS
> > +     help
> > +       Say Y here to build the module containing Kunit test cases veri=
fying
> > +       the functionality of the GPIO subsystem.
> > +
>
>
> FYI: If you want to add CONFIG_GPIOLIB=3Dy to
> tools/testing/kunit/configs/all_tests.config, we can enable these tests
> when the --alltests flag is passed to kunit.py.
>

Sure, I'll send a separate patch for this.

Bart

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7763806A7
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 11:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673326; cv=none; b=lmC13MmQ0iDaAR7/7XOKxp8yTPYweiDTebWqUy4fG4vY59v/Tnk2n9WfaALdAdiGnEwiZR8JRWh6FkAYvKoKN5B5RFWUNycvjVKPJc3pUe4kzTfIg+Ff4jkzJ5ncO0Rqc5mhXa7+IXUiTS3N9p2Fmqz+7Lm0QJohSoyvQRAZl2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673326; c=relaxed/simple;
	bh=C3ROoSAwEcHmpVj4q2nXE9Zx2ZOZUZAfV3pe+l9yKtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AgFPNz3/TyoKfqznw+7xpDGhPTgqivx25j3//84zaPl+7L0AhOlCjM5R3l45IXeFAe2YZuwqiQ5CIiouJodur09O1hPwfecY6tnadDbsxoGoDLj71YUdxRszOhL/k/muUapMLFQwJoT17u4VHsST7YmV9EkGE0nOuUkdAmhfRIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bh0TgWy+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bh0TgWy+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8121EC2BCFD
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778673326;
	bh=C3ROoSAwEcHmpVj4q2nXE9Zx2ZOZUZAfV3pe+l9yKtQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bh0TgWy+eepwj2qnbn9Rc3qYpCqJLPwMWlEQbiwSrKH5tnYeUUxAyM+acmatna/d0
	 bT+bKrITNGzPCW7k/nmRZFlOqsOwK8hE73H/w62ib0yp1843+uP6BxNttJwaMKvExP
	 N1yvsRysJsvMOJvCF07i4kCwa8710Bf7vSOmvABfpxMurufWzXS1Wow/dqJJ5ybMdP
	 dT7G/QMOcYEGUGyCcrrP5C9TGD/MGKFrOnoXNydAdFCCYKgsH5hiBcU7p48blC/lpy
	 pVHuh+PGbdSN0o3cwqyC82SUJY/j0Bqp61k8JN/YjLFwO298TbChViZHTjcsEbVrGD
	 Rc4Y5M8iAMRmA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38e800deae4so55112071fa.0
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 04:55:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+LTQ3x3lFn5B+Y3k/bp8i8ZWXZgqjAZZa+ncducVn7LDToS09KwiWC8metNRGl80skkcvWd+zv162XqGvTxLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmrJRekG4AcJX8vs98H91mMu8bX+pGyjG8yaCmMk0oiqRXA9KY
	ftiqGiUwNDt9ufSu7fJAed5IjtSCj/WNXgYpVvhjwgEMsjdcnjGEgcFhVEFa7PUUKtAglsZEsjn
	twkT69an6QZFfIg9QC2pek8ATgWYzHSwuC14Esrr6Dw==
X-Received: by 2002:a05:6512:68a:b0:5a8:9b6a:5749 with SMTP id
 2adb3069b0e04-5a8ef9af8a5mr1068752e87.28.1778673324966; Wed, 13 May 2026
 04:55:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
 <20260512-swnode-remove-on-dev-unreg-v5-3-0035eff63812@oss.qualcomm.com> <DIGUBLZXZXPJ.8CX0K5EL6255@kernel.org>
In-Reply-To: <DIGUBLZXZXPJ.8CX0K5EL6255@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 13 May 2026 13:55:11 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdnKgkxsiw7UtpXaSYf+5WHMWZidy4YukPhndZY2Uft9w@mail.gmail.com>
X-Gm-Features: AVHnY4IuEQ8uACIYu2CQFY2xUnaqBV75CJzYWeWWso-yewElWdvH5VZ2Hb43cmI
Message-ID: <CAMRc=MdnKgkxsiw7UtpXaSYf+5WHMWZidy4YukPhndZY2Uft9w@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] driver core: platform: provide platform_device_add_software_node()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 6:31=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue May 12, 2026 at 1:59 PM CEST, Bartosz Golaszewski wrote:
> > +int platform_device_add_software_node(struct platform_device *pdev,
> > +                                   const struct software_node *swnode)
> > +{
> > +     return device_add_software_node(&pdev->dev, swnode);
>
> I think this should be device_create_managed_software_node(), see also [1=
].
>
> That said, now that I see the resulting code and the corresponding sublet=
ies, I
> think we should reconsider your (well predicted) "temporary
> platform_device_release_full()" idea for -fixes, while iterating this for=
 -next.
>

Agreed, I think it's much safer this way.

Bart

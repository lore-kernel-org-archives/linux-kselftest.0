Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CF436AB5A
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210171; cv=none; b=F96U7OAFbidatApprXq1ui8oj4wy2NGDaXJFQ3MJ1LEsSydP5EtvZjAB9UOB5ZJFvsqDVPnADSF3ZJoqtW0b51dZ/ggjME5MPPlfc8WsRKJ67ogS99h+iXjk/USsC46/XBw0yiVkDUyH9470ggrDlsNiYJgynxV267aYDmzWtjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210171; c=relaxed/simple;
	bh=K8i0Khwm0EQfKN/XYyHrc34Q1WtXNlYAyOl8vOEKAhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBb2DBm1UKiTC38cDMkBVrs31EKWog1xprw7QnZAiSm8n7aVli3j2qtw85WMH3LCJiDAaqTqyPxNw4n4dDcQeRU1ed+zzZr1N1kiXP4qGxTEBh6lp4ewlxOap7zi1uVTOqwzrH2BWTPVuGsSEMew62XiLnGdRAGYEhDNUsXTd1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTX+KxCL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTX+KxCL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AFFC2BC9E
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 13:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770210171;
	bh=K8i0Khwm0EQfKN/XYyHrc34Q1WtXNlYAyOl8vOEKAhQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kTX+KxCLJ/iL4gJlJkupexnUvsfvSEa/TiO3V36oXn/d+Kl3Kh1x/ykiR2U18GciD
	 /AJ8PgyyMAX/c9lbKVQB3X/GRmVE87yrVop9SRun+VXbH2Ef4+aQFCTUYN53+cIw5m
	 AriQi7wH1G0eSiheDexEixdj0mm9YG872E0UVe36UP1Bbh8ito/GdZ998k6PqrWFMF
	 HFLl3df1JyCSfR2Dtbbwpc1UkXzqHETgydyR7HOmcnZhECWk1RZGeT7HSmA0RuVHP+
	 4EDCKUpCx4g7ghYTJEOj+UpRPaM7Tgbg6Aqcr8LKgWkUC3aV7JcTakptkLBZfwA0fQ
	 9j1TTEGH2L/zA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-382fea4a160so60164011fa.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 05:02:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBsrDGMm+Oe+9v5t4Ull9r5a0gmPrse1s15dShjnm7UKagbdHk56VDwpUmkX44EcEa6q9okLuPQMmCDS34PkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6uKTRKD/4udzcMwMFiZsFCmoClF5Fdo4mcIT07AMpmh9MB3hL
	yO8LTIjW4AVj2RwJ4IMTBYUFeLx/eERnpbkVOy+MpLSOKqGUnwTA5yw7ZeWwkPMx7zRM+LyjJWV
	JQjbkO22EMZnBHLk9haYCk3Adi4klE9NwAC72uLXsuQ==
X-Received: by 2002:a05:651c:220f:b0:37b:970f:d33f with SMTP id
 38308e7fff4ca-38691d78ef7mr12606781fa.21.1770210170157; Wed, 04 Feb 2026
 05:02:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203061059.975605-1-tzungbi@kernel.org> <20260203061059.975605-9-tzungbi@kernel.org>
In-Reply-To: <20260203061059.975605-9-tzungbi@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 4 Feb 2026 14:02:37 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf_SvTzYZ23OJy-dTU4XCDTcUfsCAqJw2TxtrOXJvbUvA@mail.gmail.com>
X-Gm-Features: AZwV_Qgxz_gUDuN_t7oGIq3ngoEatPBIOO5KMk-EB-AMA6fD9wAbAQvCpgxHHKE
Message-ID: <CAMRc=Mf_SvTzYZ23OJy-dTU4XCDTcUfsCAqJw2TxtrOXJvbUvA@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] gpio: cdev: Leverage revocable for accessing
 struct gpio_chip
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 7:12=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> Struct gpio_device now provides a revocable provider to the underlying
> struct gpio_chip.  Leverage revocable for accessing the struct
> gpio_chip.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---

[snip]

> @@ -1432,10 +1433,10 @@ static long linereq_ioctl(struct file *file, unsi=
gned int cmd,
>  {
>         struct linereq *lr =3D file->private_data;
>         void __user *ip =3D (void __user *)arg;
> +       struct gpio_chip *gc;
>
> -       guard(srcu)(&lr->gdev->srcu);
> -
> -       if (!rcu_access_pointer(lr->gdev->chip))
> +       REVOCABLE_TRY_ACCESS_WITH(lr->gdev->chip_rp, gc);
> +       if (!gc)
>                 return -ENODEV;
>

If we're doing this, then I'd love to see something that actually
makes the code smaller like:

REVOCABLE_TRY_ACCESS_WITH_OR_RETURN(lr->gdev->chip_rp, gc, -ENODEV);

which would allow dropping the repeated checks.

Bart

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227A8156F45
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770209927; cv=none; b=usRGOXl1sg3vW1fQNaYaTMJuaJwJ0NXdSAWFILb+q60jeh4TapAXM+TlMbwxLVpYhdQ+896hIm5L8qpSxaY/rScpDRC2bx3/D9fmCxvtJV5TCi9whjB0MmR1LJQZgQ9Jr6rwBLR2byAK6bz1x/BHfLjCUkUYQoigi/ggo/0xH+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770209927; c=relaxed/simple;
	bh=ELhpneqwUCDgZ6KdocffVj0r0JmPKjyIsDF6WR0/XTo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDuv26+s4Dks7gS/j0GI2v55kRHTvs7QuQC+5jWAqO/iCd/ZzMrI+vJtYE8ZpPpB0IZPJUPpM1s7dV42jYcScoPQUdHBSDC8tjX8kdkMF7vIhAatidKeQeqyHUC76m7UTXH0VhW/XSQ+hUHI3/gqVv1J5h5UZpzjXO9Dp8aNtQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kExNOxF7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kExNOxF7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB77C2BCB5
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 12:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770209926;
	bh=ELhpneqwUCDgZ6KdocffVj0r0JmPKjyIsDF6WR0/XTo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=kExNOxF7zq+JrMtYFmtYDQMOKqtxfxU12BcC4UoQDhGs5aFxUTAL6oYBW5i0HUWLj
	 y8TMASe59IVA6VEGfpsGGEQPd3aJIUlB5S8VFaMPDYs4lZsRIC6UtNRNA7yNl+rhmB
	 OI8pnvu3d/iK85Qz1WkXRgiNAP90cN9Zw+B9JexFDeoCnCmaKKNwyCy/+iRhp4I58R
	 g25bBS3RPdT63znJj2Is+BA80/SgEh/wgFkpl539rCudXuC7u9/tmUstoXzYLN2/em
	 Ewv/5pyo0XTmefckI4UgVuelrR+hc67WZi6oCougMMpZ5i7Gy/0toGRhrO0JWSUMxD
	 BH++5rO0orwJw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-382fe06a9c4so51743051fa.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 04:58:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrgw9u3dc9EcquZAGXF0R+c5SNLfQ8B0ol91mhXE2xwE9RX9frlSfNfYwRRpuIsmfaxzL5PuCVs2ViAfWt1ac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Xw54ccrQq4GzUGUyR3HWcUVZ+dovcEDdmNYzqS4EbaGYL0/S
	+KtfldtHeQxO46HptMXsBADCJRa2YN0V/XjP27ivXnbYdWYfRhd8qNEPp/KnRfDpjsr4wkX/a+z
	V8hkwVbq1lTjg5CiLpnRPfPAZTcUJU2JlJXw2iRh1fw==
X-Received: by 2002:a2e:bd04:0:b0:386:1ce2:1194 with SMTP id
 38308e7fff4ca-38691d86a23mr8919481fa.31.1770209925273; Wed, 04 Feb 2026
 04:58:45 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 07:58:44 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 07:58:44 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260203061059.975605-8-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203061059.975605-1-tzungbi@kernel.org> <20260203061059.975605-8-tzungbi@kernel.org>
Date: Wed, 4 Feb 2026 07:58:44 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdYeoMxNFYeX_9S-M286aUjnsxLyy9_apmfPR4NeqVouw@mail.gmail.com>
X-Gm-Features: AZwV_Qh6Gi1pfyomIVbIDTzDh-vaqoE7doDZ1XfTeCeir74PnHIOe8829DAgfdg
Message-ID: <CAMRc=MdYeoMxNFYeX_9S-M286aUjnsxLyy9_apmfPR4NeqVouw@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] gpio: Add revocable provider handle for struct gpio_chip
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Feb 2026 07:10:54 +0100, Tzung-Bi Shih <tzungbi@kernel.org> said:
> The underlying chip can be removed asynchronously.  `gdev->srcu` is used
> to ensure the synchronization before accessing `gdev->chip`.
>
> Revocable encapsulates the details.  Add revocable provider handle for
> the corresponding struct gpio_chip in struct gpio_device so that it can
> start to hide the synchronization details.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---

[snip]

> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index 3abb90385829..cd136d5b52e9 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -52,6 +52,7 @@
>   * @device_notifier: used to notify character device wait queues about the GPIO
>   *                   device being unregistered
>   * @srcu: protects the pointer to the underlying GPIO chip
> + * @chip_rp: revocable provider handle for the corresponding struct gpio_chip.
>   * @pin_ranges: range of pins served by the GPIO driver
>   *
>   * This state container holds most of the runtime variable data
> @@ -79,6 +80,7 @@ struct gpio_device {
>  	struct workqueue_struct	*line_state_wq;
>  	struct blocking_notifier_head device_notifier;
>  	struct srcu_struct	srcu;
> +	struct revocable_provider __rcu *chip_rp;
>

Why __rcu? This doesn't live in a different address space, only the internal
resource it protects does. If anything - this could be __attribute__((noderef))
but even that is questionable as this is an opaque structure.

Bart

>  #ifdef CONFIG_PINCTRL
>  	/*
> --
> 2.53.0.rc2.204.g2597b5adb4-goog
>
>

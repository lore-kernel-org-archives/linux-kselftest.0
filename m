Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922013BE654
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239816; cv=none; b=gJZGN0HQ9vFgDRRG+PDd9kBzCbovNkW76C9GSDwX2vP25bTnnl0OOaRltd2+uioGy+vNRoXlJmKue1aQTGsIXJdWOPn75D+n5MRtAN/G4QlGOHX06cN31Wnznq3aayuigiialKHHp3hUWIuBP1mTqu946MDDkpiH8VWosxattTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239816; c=relaxed/simple;
	bh=MBr5BunAn3ZXoYBSlqDMj1jR3jbP1rLEfxBdY12hfcA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XdMU3K5iQPS6mbYlqwU2W6JpNqSRiIdmcZBntaeARZPcGtiYKxWZ9LYzkHXfqJc0n2a2nlVyrxPyp0tBga6IKBrz8s9eVwMejuOxx5z8GVY0jNLWZgYJNCg3MTODxRWHfcrlwhkzwK+9QgLnpE/WQ4aNElMx53qbRq6FYXiXjvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rviWlpiO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rviWlpiO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D84C2BCB1
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773239816;
	bh=MBr5BunAn3ZXoYBSlqDMj1jR3jbP1rLEfxBdY12hfcA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=rviWlpiOlDE78EpxkqeUZ3wSn5TkoY57yetFtZLs0Ix1iE9L1z2BfIn17BD8UIWtm
	 dtTzJh4IQz0LWDMlkwJbyvSD2+bvNoHVrGGMRfcIxwZyOR7FHNoY/V/F8sMaeY6RUI
	 ptxq5yJAXjoUoHwwrVYDWYgiCAhsZOGCf/jYVGZJgepMA1HW/WZUe2POCBKjZ2XJNU
	 ar5tGL5PzdiNLVZs89d0UJS3KBP8CFMuH9aQXWcAwUn7+gyyUFL3KpIbE6OMPM+rFi
	 17noxuU/FGeeVBGgkcQwqye5aUgunXtMWsLcKjPbP1pfnQHUaDHniBYtXl8VagvyGo
	 sxeSxyua6xg9w==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38a38ccc217so1591fa.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 07:36:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUnp7jUb5z8xbJl3KYOMKx3iJwQlPC/jJxd0OgtCkxA4vpTwjy3V7LdsY6v+OjSUUirrHOam0uLXAAC5qArHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNV9EiWoxIEbuTTz5WSoXA44iP1YYTRAea2XSVS/V3SmDKH0nQ
	FGgtaSPhvBJcUN6wj+QwLbydfQjDyS2EcnZdGeVwVgjjNaEOeG+KTWk2fjUAoadvInanFaY8FPt
	wMey/ELTR13hwn2MmjfZNLZrkyNoka9EfdAae/oZOcg==
X-Received: by 2002:a2e:bf02:0:b0:38a:3feb:d2ee with SMTP id
 38308e7fff4ca-38a67e68170mr10068421fa.32.1773239814928; Wed, 11 Mar 2026
 07:36:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 07:36:51 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 07:36:51 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMuHMdU0Xb=Moca5LUex+VxyHQa2-uYJgYf4hzHiSEjDCQQT=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223061726.82161-1-tzungbi@kernel.org> <20260223061726.82161-2-tzungbi@kernel.org>
 <CAMuHMdU0Xb=Moca5LUex+VxyHQa2-uYJgYf4hzHiSEjDCQQT=Q@mail.gmail.com>
Date: Wed, 11 Mar 2026 07:36:51 -0700
X-Gmail-Original-Message-ID: <CAMRc=McmrJLWGoXjKaqGuCWpLZU4mmcrgs9ESAaL8kG=_R89cw@mail.gmail.com>
X-Gm-Features: AaiRm506EOHf7dy_hA4ZaTp1VM_fbnHazOEtdGepT2lucGBsuxm6_fe44b4oDCs
Message-ID: <CAMRc=McmrJLWGoXjKaqGuCWpLZU4mmcrgs9ESAaL8kG=_R89cw@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] gpio: Access `gpio_bus_type` in gpiochip_setup_dev()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Mar 2026 12:44:31 +0100, Geert Uytterhoeven
<geert@linux-m68k.org> said:
> Hi Tzung-Bi,
>
> On Mon, 23 Feb 2026 at 07:17, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>> To make the intent clear, access `gpio_bus_type` only when it's ready in
>> gpiochip_setup_dev().
>>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
>
> Thanks for your patch, which is now commit cc11f4ef666fbca0 ("gpio:
> Access `gpio_bus_type` in gpiochip_setup_dev()") in gpio/gpio/for-next.
>
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -901,6 +901,8 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
>>         struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
>>         int ret;
>>
>> +       gdev->dev.bus = &gpio_bus_type;
>> +
>>         /*
>>          * If fwnode doesn't belong to another device, it's safe to clear its
>>          * initialized flag.
>> @@ -1082,7 +1084,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>>          * then make sure they get free():ed there.
>>          */
>>         gdev->dev.type = &gpio_dev_type;
>> -       gdev->dev.bus = &gpio_bus_type;
>>         gdev->dev.parent = gc->parent;
>>         device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
>>
>
> Postponing this assignment does have an impact on early
> messages. E.g. on RBTX4927:
>
>     -gpio gpiochip0: Static allocation of GPIO base is deprecated, use
> dynamic allocation.
>     + gpiochip0: Static allocation of GPIO base is deprecated, use
> dynamic allocation.
>
> Or with CONFIG_DEBUG_GPIO=y, e.g. on BeagleBone black:
>
>     -gpio gpiochip0: (gpio-0-31): created GPIO range 0->7 ==>
> 44e10800.pinmux PIN 0->7
>     -gpio gpiochip0: (gpio-0-31): created GPIO range 8->11 ==>
> 44e10800.pinmux PIN 90->93
>     -gpio gpiochip0: (gpio-0-31): created GPIO range 12->27 ==>
> 44e10800.pinmux PIN 12->27
>     -gpio gpiochip0: (gpio-0-31): created GPIO range 28->31 ==>
> 44e10800.pinmux PIN 30->33
>     + gpiochip0: (gpio-0-31): created GPIO range 0->7 ==>
> 44e10800.pinmux PIN 0->7
>     + gpiochip0: (gpio-0-31): created GPIO range 8->11 ==>
> 44e10800.pinmux PIN 90->93
>     + gpiochip0: (gpio-0-31): created GPIO range 12->27 ==>
> 44e10800.pinmux PIN 12->27
>     + gpiochip0: (gpio-0-31): created GPIO range 28->31 ==>
> 44e10800.pinmux PIN 30->33
>      [...]
>
> Note the spaces at the beginning of the printed lines.
> Reverting the commit re-adds the "gpio" prefix.
>

As per the comment in gpiochip_add_data_with_key(): we may end up with
a functional chip before gpiochip_setup_dev() is called and so before we
assign the bus type.

dev_printk() helpers only read the name field of the bus type so it should
be safe, I don't see anyone else accessing it before we register it.

I think it makes sense to revert this commit. Tzung-Bi: what do you think?

Bart

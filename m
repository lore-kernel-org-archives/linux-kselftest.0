Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7F53DCDB4
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 11:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229487; cv=none; b=iIPcCgsbLjMjCeoJKsc7lScH6IAF4pAHv9z1XPx6KakpSTjlmWsWJArZ3erYWphhDnRfIfzLrTsZetMgz/zvjJWenCSfmqmgQANRctRTfgexhd8xvot+4eHUoLVaZgxTO4k+pmqbxIsGcZVFdpHyo4Im8TL725PDRcQeBgyute4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229487; c=relaxed/simple;
	bh=91YPfEButMB4Dd2zOu5KgfkAt2bAzw+tFr6ttZBOtAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwyJCHzeAcMFMZmzoVhEvtG7s0lgO/phj9EICB8VAEc/04kkVhcaRidpCf2XgayC3V3ZpmlmGNBKaVTInz8UqCiPmK3aIm767WWfuw3ICgJCERu2+gIZK7amJh0PiKa+Y5DR9G5AcjihAwIarjdeKEnnN5rJcfPoB8A5Vz3q3jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56afafef7aeso5399832e0c.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 04:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229485; x=1773834285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7KfcYBgSfUu6P1T8nEVd1qT43qw4ZZIvyTvKKhSf7M=;
        b=aDbX3UGF6LoRSEFIBXNEkqQRjwTZ3su7aqkzTlGlUNamZs/WATRGP2Sb/ie7eDKOk4
         yb/NjD7jizvGLzvSaDOoxKoxdEaQF0UlKgAoitIVya93xYf3gbKerKZXX9uch/2J2YjN
         1wFJbMj690+tbRH6H6va2drv6d2Yudpt6AGI3lb2n6CctIg4d8jSDLRfAkMbqUy3RWYJ
         AeaT1XesK473hyps7B1a6bslFpJLOqpDn3avJ5/G69vOgPvfzZtxK7JUwKTbE715DIxK
         F3JKijtd9PzxMIxjUrQpqGoV7dzNxNFkkpjO1uO7wr5aBmPb33aJUQ7N36krxeXlYgLS
         K5cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf3M9rZPH2OBGb8wDdCmuL3MJKpI6X77ujsqx47myssfzSJa/hqTkFlZ/Z0vc0ppRbqr5e1d3BhkzfvSSzpaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi15UyTs/FdMLGt6NvLXe6phWXwwfekgoXEeDhmA2nBUCSTgb0
	RpoyYcCRPjiV5gmoh/afFLbRNLENywwGudsqZCMIfEENVkulflhMaRlZHtrPShu3
X-Gm-Gg: ATEYQzyw+xuhJHKtBuu0RrOqk7XDOHVQ15B8CRHpp3vWIIUqv76PQ/6YM+bFe2Xh25C
	Fogwrlis26kDkJDcQcmxYrH553ZspI1XtQx9ukJ6/2P7pWGuk5jqqW7FfTjWXdwzSgv580SPigU
	BJFZX2mVeIGu4Tsc6dWgrtuluBnRuxwZehdK0ZsrH7Uid+K84Me7rEsBJgmVeQ+Q2WdoPc9U6Ej
	0NlMFLDj30RKXjrOEZrh6LwsDfvcQ9ZGFW+eAu6I+lqtXtcgzLlA4Dr7l5DDcRH7JIMwG84J86k
	a2aodlwM/RlhZWr/U5lW3CVo05PT5wvagX0zhmxj6mUC7/lDapObV+4qx/vWctvgG1nWAtYYB9n
	o3XnPSOgZsO/YCDD7u4Bj+8/j3sEOlj+GNaY137mUodcglpNR40kul8oaVHO5diedPpemFT+83d
	yTIHzK+ITy8UD3y1e9DkXnM4+eSbWzqZMqzmQvAxJeVdWL+93E7KP+C652ZybgqLUf
X-Received: by 2002:a05:6122:8c23:b0:566:963a:1648 with SMTP id 71dfb90a1353d-56b4754084bmr822288e0c.16.1773229485083;
        Wed, 11 Mar 2026 04:44:45 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b461c905fsm962617e0c.0.2026.03.11.04.44.44
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:44:44 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56afafef7aeso5399811e0c.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 04:44:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFiaGtg/UQxI1MBPlTpdfQR+NNW4nMyhSp1HvgmMGacmDFcs90SyKz5S4sNKHMqHGVaGoQ/ybZ120CQb7Rb1k=@vger.kernel.org
X-Received: by 2002:a05:6102:2aca:b0:600:20:74f8 with SMTP id
 ada2fe7eead31-601deb937d1mr897288137.13.1773229483828; Wed, 11 Mar 2026
 04:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223061726.82161-1-tzungbi@kernel.org> <20260223061726.82161-2-tzungbi@kernel.org>
In-Reply-To: <20260223061726.82161-2-tzungbi@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 12:44:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU0Xb=Moca5LUex+VxyHQa2-uYJgYf4hzHiSEjDCQQT=Q@mail.gmail.com>
X-Gm-Features: AaiRm526CPdI3xsQIkHSFIKuUm3bmXqbgoDrLhuyzTn4LwLbPOLadWtxPY6y_FQ
Message-ID: <CAMuHMdU0Xb=Moca5LUex+VxyHQa2-uYJgYf4hzHiSEjDCQQT=Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] gpio: Access `gpio_bus_type` in gpiochip_setup_dev()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tzung-Bi,

On Mon, 23 Feb 2026 at 07:17, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> To make the intent clear, access `gpio_bus_type` only when it's ready in
> gpiochip_setup_dev().
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Thanks for your patch, which is now commit cc11f4ef666fbca0 ("gpio:
Access `gpio_bus_type` in gpiochip_setup_dev()") in gpio/gpio/for-next.

> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -901,6 +901,8 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
>         struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
>         int ret;
>
> +       gdev->dev.bus = &gpio_bus_type;
> +
>         /*
>          * If fwnode doesn't belong to another device, it's safe to clear its
>          * initialized flag.
> @@ -1082,7 +1084,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>          * then make sure they get free():ed there.
>          */
>         gdev->dev.type = &gpio_dev_type;
> -       gdev->dev.bus = &gpio_bus_type;
>         gdev->dev.parent = gc->parent;
>         device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
>

Postponing this assignment does have an impact on early
messages. E.g. on RBTX4927:

    -gpio gpiochip0: Static allocation of GPIO base is deprecated, use
dynamic allocation.
    + gpiochip0: Static allocation of GPIO base is deprecated, use
dynamic allocation.

Or with CONFIG_DEBUG_GPIO=y, e.g. on BeagleBone black:

    -gpio gpiochip0: (gpio-0-31): created GPIO range 0->7 ==>
44e10800.pinmux PIN 0->7
    -gpio gpiochip0: (gpio-0-31): created GPIO range 8->11 ==>
44e10800.pinmux PIN 90->93
    -gpio gpiochip0: (gpio-0-31): created GPIO range 12->27 ==>
44e10800.pinmux PIN 12->27
    -gpio gpiochip0: (gpio-0-31): created GPIO range 28->31 ==>
44e10800.pinmux PIN 30->33
    + gpiochip0: (gpio-0-31): created GPIO range 0->7 ==>
44e10800.pinmux PIN 0->7
    + gpiochip0: (gpio-0-31): created GPIO range 8->11 ==>
44e10800.pinmux PIN 90->93
    + gpiochip0: (gpio-0-31): created GPIO range 12->27 ==>
44e10800.pinmux PIN 12->27
    + gpiochip0: (gpio-0-31): created GPIO range 28->31 ==>
44e10800.pinmux PIN 30->33
     [...]

Note the spaces at the beginning of the printed lines.
Reverting the commit re-adds the "gpio" prefix.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

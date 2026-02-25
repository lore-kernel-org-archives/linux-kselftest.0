Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E619392812
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 10:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772015181; cv=none; b=noBJAtg/2Su4nmCAaZcJMf1mv0xcf8WnB6bBLo5w1gSuPx5p58G6k3DYHKsURGx5P9B1Gnv1Nd6OuA/6/EP286g/95h6kJnYqJrsL2PjEBH+n5l+vQdZR+Yq63dRJqpmflcPDlWPhs5uoR0zi99kHwEHPKv6GYcOg8OcKxa0m60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772015181; c=relaxed/simple;
	bh=CMcZhRDb5VOnXy66PGfmdCcOS/a9q8FuFZftmaW7Kuk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+JV97k2EM5lfqZUudmSNBCCzrVswho3fveWDmRP9IY9AmnoVIS9hAyTTbi63ZjB0guOoil6lqPicqsHTAONrNrHtuX5pzjn81VKwRy9OYGdVX/Ix7GIRGYbUWVfFRIul/xxBgy/EWCYhTIbIOqtggKgjsLafT8Q8MbDr0dxUfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvgGPHN5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvgGPHN5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721AFC4AF09
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 10:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772015181;
	bh=CMcZhRDb5VOnXy66PGfmdCcOS/a9q8FuFZftmaW7Kuk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=DvgGPHN5iDR79u63/ax1vj1osvgCUVe86KgjxTQmdhtWt0modtNhheCLWyTKHpbDV
	 ksY70m9H3y6p2f14YIinKBWUeFJm4aeKAzycCu7Mnj8foyrG8ToUIJoFr1NFHAPEEF
	 /ITYPbkIZT809P6HLTyK+36gxO/AEZMN+o3VcCxRnS1bEuXfE3VjIxZ5Tl2FpIDXg3
	 HpUJma+rG6BNY3PcmBtUj5MZuqpvmRmFGh5Yn31ox3i+2ZufZrsthM9kKNOcCZEqlp
	 OPZlAgyGtA+ASONsTLus596FfqytcN6MZ/B72ZN58IBqyhE0VIdYEjBrq2adHpIzMg
	 UmtpwSmOG9kFA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-389e2950f54so4666241fa.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 02:26:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJjkCarLi1BfyQKrYFmWSpWqPZsluZSSus4PqcEg8yXQscqxKQfrbmMD4WYmxJOdBp6pOact5qFOQP45iRxyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfv6Ff35DzIqDGpx6qSsFGgrJRKLmESYf6Pn6L46i4+4hls6Yn
	eLyV6YuM3zT+/jqUybqHvcvRQZ6jr3yDLV/dY05HZkR3yx+g/TZ+qfP0QkGDicPQmn47VTe2OoZ
	tKWj8eEDKfB6qUercAvfLetBxWygpdjIZOVxT1XvP4A==
X-Received: by 2002:a2e:b88c:0:b0:385:f547:183f with SMTP id
 38308e7fff4ca-389ddc502dfmr10752701fa.3.1772015180076; Wed, 25 Feb 2026
 02:26:20 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 02:26:19 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 02:26:19 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260223061726.82161-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223061726.82161-1-tzungbi@kernel.org>
Date: Wed, 25 Feb 2026 02:26:19 -0800
X-Gmail-Original-Message-ID: <CAMRc=MdU_1WW82imNHPFVktn0HVSdY7kkGScEXmi+JaKRNTMuQ@mail.gmail.com>
X-Gm-Features: AaiRm50JAWvgk0sFbwLWuBgEoDZ8qh5nlozP1AB4khnBwkCkwQM3s7Ik9ULJO-I
Message-ID: <CAMRc=MdU_1WW82imNHPFVktn0HVSdY7kkGScEXmi+JaKRNTMuQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] gpio: Refactor and add selftest
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Feb 2026 07:17:20 +0100, Tzung-Bi Shih <tzungbi@kernel.org> said:
> The series is separated from v3 to lessen the burden on the subsequent
> revocable work per suggestion in
> https://lore.kernel.org/all/CAMRc=MfQumD1ULx7yU4W2sx=35wyQf7-v4tSf44OqEu3JDBUAg@mail.gmail.com/.
>
> The series is based on v7.0-rc1 and applies after
> https://lore.kernel.org/all/20260205092840.2574840-1-tzungbi@kernel.org.
>
> ---
> v4:
> - Separate the first 6 patches from v3.
>
> v3: https://lore.kernel.org/all/20260213092958.864411-1-tzungbi@kernel.org
>
> Tzung-Bi Shih (6):
>   gpio: Access `gpio_bus_type` in gpiochip_setup_dev()
>   gpio: Remove redundant check for struct gpio_chip
>   gpio: sysfs: Remove redundant check for struct gpio_chip
>   gpio: Ensure struct gpio_chip for gpiochip_setup_dev()
>   gpio: cdev: Don't check struct gpio_chip in gpio_chrdev_open()
>   selftests: gpio: Add gpio-cdev-uaf tests
>
>  drivers/gpio/gpiolib-cdev.c                   |  20 +-
>  drivers/gpio/gpiolib-cdev.h                   |   2 +-
>  drivers/gpio/gpiolib-sysfs.c                  |  32 +-
>  drivers/gpio/gpiolib-sysfs.h                  |   8 +-
>  drivers/gpio/gpiolib.c                        |  46 +--
>  tools/testing/selftests/gpio/Makefile         |   5 +-
>  tools/testing/selftests/gpio/gpio-cdev-uaf.c  | 292 ++++++++++++++++++
>  tools/testing/selftests/gpio/gpio-cdev-uaf.sh |  63 ++++
>  8 files changed, 402 insertions(+), 66 deletions(-)
>  create mode 100644 tools/testing/selftests/gpio/gpio-cdev-uaf.c
>  create mode 100755 tools/testing/selftests/gpio/gpio-cdev-uaf.sh
>
> --
> 2.51.0
>
>

Hi Tzung-Bi!

This no longer applies on top of current linux-next. Could you please rabase
and resend?

Thanks!
Bart

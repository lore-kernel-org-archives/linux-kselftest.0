Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4F73F0754
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772119340; cv=none; b=YHwiGtHpRxcTegr2nB7LIVntzpfDa/+I1Y6sC/YlQn8I2n+jYj3ZcM87uKty5u7mYh/wZLKneO8Ar+KRVRLg49l6wkXYXRvcWpI1qn15is49kS/T0abfnz0oHHXGFNW1rOpsxbgaxg/teN4IOvgyhfZ7oVvrDPCE5CocNH9F9ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772119340; c=relaxed/simple;
	bh=sNTeNXb0XfUb+HMFHcNwV1x7mN0bxpTI+7ku1DBJKwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JAj/AYCrcwP3jlgCG8LjQKDn8gxxQ4Evnmi5ltWxRYhbivXqR8aRZeuQs2z/HmzGeNUSHsoTmdU8jFKP8jzshucbj+f8FZa6Hkdf9q0kYBZHtYlYmxNJGoRHVayw1FRpNlDvVNM7sjE+uZY9oIz1gRfYB+C2gfTM7JG12Cv6Cs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a84f2bf7bso1141778e0c.2
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 07:22:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772119338; x=1772724138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0ezGVOcarv9ScNAFNBu6P5NdLNkz1RoEz4XxD5dNpA=;
        b=gpNKoM4hlTcDS7ZkX2U8zPB9ZcTpTPm9iyiz2cWcvwWzQ3z3d0BVNiGpUHlSjKSZV4
         0JVVsPh2RkG6GKWjlYPPm1IBBOPpykWAxLIl7pnTN/GX9P9yQA1c8eq6RkWdo88YjFZx
         HeiDiVyTb++xmCe1QBwIXHjfYh1YrvojAM2fyamfFdU0M/H8ZE9daRvrBB4m09060Xdi
         5uBrk1hfKdicKPm1OGSjI+vATj+PKrvVu+aOVEScw0NmG0fqGJ84FCSy3Fv/0+JGioAN
         XLHGyl1a3ot4wC8hepKeFeuS7itDI9FjHKfhiZHlPCHodlcWrDYnB7JrKCQYRbrl5Uya
         Zv1A==
X-Forwarded-Encrypted: i=1; AJvYcCV624lpypiAnzFD8hbg/iblaRF4/cbHDOCBqcQo8nTFYxforgg2UOjROrjpIJwRBjJI5LVPrDBK5GsyoFbBI7w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/VWgBDo8SpeYXQ/ZuaUbrBroyXLkLslqPSWnKTkXt3y/MBCkh
	+W41taijaVWkPguFQH1vN6oboHghF5/+tcpST4xS83XzrDrwxL17HSe4kunNnzYc
X-Gm-Gg: ATEYQzyBd6Urchu6fg62WwPQ3paZFoqk8bUVSSa7+aaPwLvKOJLJcIZ4P7iDRFH1WDu
	878JbPrUjVfS8bWhmlesxr9rgi1vtvluctHwF8xKu7Bu4KL3KX58v9WIg/Vosjp+s3fm0yqvfP8
	xTGwQEaY0TBZqoXFr3Pjb2Z/0/CZT/h9sm1hB7zSXF/1etLZPaGxnlEIdFVdf5xv551ZVIiDAx8
	Kwr6BgcMY0G0k+lZyvjcHy8SU4Wp5IOTn+D7sTUh83PhBY5pUejOhUlJf9aW2XGRgre91285z6y
	HBc/08LwYYZguu96AEGpFs6CY8SSGFf9nTo9yojTu3+P9CqiL9JHD8VJItCy+08rXndy1PF3r+z
	mCD194+PEoeRNwOMJlko2a+lIPdykkpWrpbb+L1ZMXV6yfXcxVcL5Xw3zXf/a7MBL9Cpat1aLRr
	WLDy+iscxnUef8CbkFRV93+bgdoVpVqPq5INHq7uN4lQA0901Sp/XWiXOeSKZE
X-Received: by 2002:a05:6122:2a44:b0:568:e716:5faa with SMTP id 71dfb90a1353d-56a93182cabmr1457268e0c.13.1772119338246;
        Thu, 26 Feb 2026 07:22:18 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bb4fbesm2888348e0c.5.2026.02.26.07.22.18
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 07:22:18 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ff10630b75so593811137.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 07:22:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+A0dPxOZGIXn0GtuMH30Yy6+SFdYF6KWQwv4Ylm7yQeF5jh4YkmgwYtxTKlchk8jbyehftOlI3CromeuEN9c=@vger.kernel.org
X-Received: by 2002:a05:6102:3a09:b0:5ef:6550:e9f0 with SMTP id
 ada2fe7eead31-5ff20c71950mr1513822137.36.1772118850413; Thu, 26 Feb 2026
 07:14:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260111093940.975359-1-vladimir.oltean@nxp.com>
 <20260111093940.975359-6-vladimir.oltean@nxp.com> <CAMuHMdUBaoYKNj52gn8DQeZFZ42Cvm6xT6fvo0-_twNv1k3Jhg@mail.gmail.com>
 <20260226151036.x4z4bdlxwgsqlkhs@skbuf>
In-Reply-To: <20260226151036.x4z4bdlxwgsqlkhs@skbuf>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 16:13:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXKbiKUkP=+FDA_-Kd_qx1X6vzSuyPU+Tdd9MgR=Q5WMw@mail.gmail.com>
X-Gm-Features: AaiRm50hl5iFqVfPGnJ3OyUGaG2ytMnVkvc4q6N2_1XHwxz7HIPlFh5Oi8AcHkM
Message-ID: <CAMuHMdXKbiKUkP=+FDA_-Kd_qx1X6vzSuyPU+Tdd9MgR=Q5WMw@mail.gmail.com>
Subject: Re: [PATCH v3 net-next 05/10] phy: add phy_get_rx_polarity() and phy_get_tx_polarity()
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Daniel Golle <daniel@makrotopia.org>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	=?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Eric Woudstra <ericwouds@gmail.com>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Lee Jones <lee@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	KUnit Development <kunit-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

Hi Vladimir,

On Thu, 26 Feb 2026 at 16:10, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> On Thu, Feb 26, 2026 at 02:22:29PM +0100, Geert Uytterhoeven wrote:
> > > +config PHY_COMMON_PROPS
> > > +       bool
> > > +       help
> > > +         This parses properties common between generic PHYs and Ethernet PHYs.
> > > +
> > > +         Select this from consumer drivers to gain access to helpers for
> > > +         parsing properties from the
> > > +         Documentation/devicetree/bindings/phy/phy-common-props.yaml schema.
> > > +
> > > +config PHY_COMMON_PROPS_TEST
> > > +       tristate "KUnit tests for PHY common props" if !KUNIT_ALL_TESTS
> > > +       select PHY_COMMON_PROPS
> >
> > This select means that enabling KUNIT_ALL_TESTS also enables extra
> > functionality, which may not be desirable in a production system.
> > As PHY_COMMON_PROPS is bool, this extra functionality is even part of
> > the base kernel if KUNIT_ALL_TESTS=m.  Unfortunately PHY_COMMON_PROPS is
> > invisible, so this cannot just be changed from "select" to "depends on".
> > But perhaps PHY_COMMON_PROPS can be made visible if KUNIT_ALL_TESTS,
> > so the select can be turned into a dependency?
>
> Is this what you're asking for?
>
> -- >8 --
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 02467dfd4fb0..1875d5b784f6 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -6,7 +6,7 @@
>  menu "PHY Subsystem"
>
>  config PHY_COMMON_PROPS
> -       bool
> +       bool "PHY common properties" if KUNIT_ALL_TESTS
>         help
>           This parses properties common between generic PHYs and Ethernet PHYs.
>
> @@ -16,8 +16,7 @@ config PHY_COMMON_PROPS
>
>  config PHY_COMMON_PROPS_TEST
>         tristate "KUnit tests for PHY common props" if !KUNIT_ALL_TESTS
> -       select PHY_COMMON_PROPS
> -       depends on KUNIT
> +       depends on KUNIT && PHY_COMMON_PROPS
>         default KUNIT_ALL_TESTS
>         help
>           This builds KUnit tests for the PHY common property API.
> -- >8 --

Yes, that would work.  Do you think it is acceptable?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E1932E122
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 13:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772112524; cv=none; b=HMGV/lZVY1C7aPcG0ExFdB7TziG4GqyygxeHXrGA1lyWpUQ/ZBM+gJcBm9Vswp6BU4Pjrv1fJ947ufjT0LmB/33SaEPRIjRTUW4TWtFA7TcnYy1x8d70YYZljEL4QO3yZnTaaJ3VvUgfAFYA9c6wrtaz+NPwaGJQxAbI14tEMjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772112524; c=relaxed/simple;
	bh=4R7hF+71pg82oS066LoRVZURzYUxKCGCri0Dd7HK3lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IOA6jhVbgpIVIVVrrh6gsam8vVYBBh/CLD1hPH8qy+8w4XUgy1a4siKvpIrP2Lx9drjd3PBx7AWKMby+rhCL3sgFpJEcT1LyEMkT+312JSYCAjAAwjbjD5Ufru6OEE1XYzDMNxOicjtAdAbo7q+aEx52QNcd0j5KuXTxOdejeSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cb38e6d164so104434085a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 05:28:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772112520; x=1772717320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5twdPm6qtk6BxBBh6eqwsmb5sfIcorWjwwVPoxGI8zc=;
        b=TfEBx0CXAikOHssZZipopCZPOWCoOrajhAvZq8Nasly3XS2uyGmz6IgxRZ0TBQGg67
         lFdBRDT0H177coF+JBMeJHd7kPnZA2WdCDHqyYamlhJEJ+4WdbWZ7om+z75o22+YZpvy
         +HlH40bMVe5XEejGwbdz+3q+6wDUH8+yJ97tx6yS2qnHcx8IHs9RKMSCrZCqXVhHKlIf
         j+kan57MHsjMMrnWKBcpMACYRYfRELa2cERQLvmi9zVYdWo32WWgWv06G+fz1BiqD5uH
         fdDX/LWCeVg6REP8L6p6eVK+y60TEwWAu6EPJRO1LoVAzmlzs13INoA48B91HK7IQtQg
         aATg==
X-Forwarded-Encrypted: i=1; AJvYcCU3TzQSizxWr9mJtVzMq3gLUv/Q52DK2Qn+bam73vmMi4x16u7mi+k/8JToOxDQVV7q8SA5pdYFccnZWelTUYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJVUJUaXPQw8UohzZw3jsMDz6XFfmH0Nc3yI9nJq2HIvrFvpM1
	EBsbHxvAqvqWVQPggshB/8Ew3XAi1YbDxbRSIqD/E5j/BFW/OqmYQWMwEhG0fw63
X-Gm-Gg: ATEYQzzXB+1+3lREFl4f/peI1XjEz5IVEc2jORtbrKOSysX5zjytU+NuSdT17UERcmo
	eM3XZxByptWJmQOBxYyhKekxZVc04/AvKMlnsSSwvKtO0Z0TFgJWMyrULYqF7ZHRKHlgUvD42ME
	zW1/5B6l0LQ/Cg2qr50xMVGKYEv6jFQObgKAZ6hlvj03RSWVJlzeJMhcIgqnN75FpPXM9bpEHy2
	8IHsZdz8lDMo0WlxpdnZ1Y3CjCivmWVvVBmGXqUgPx0WvgCaA1u/r8+ycg8pdhjZjkWmhvSWvEV
	t3UYd1KYh44kWxpqpTSXXoIyX3IHtoUojK89jtXWDPJmi0CcR7JQISfRnUjxqYfeayvw+BgyHoC
	OGHC+rAnUH1ys3iR9GY4a+ONXOxacrERe4/xf7JSRbWJsJSSpU1sbLdDYbsAjbTmOmvbRu/MqhA
	RyHgmH1ZDtwe56s0SwsSoou0YLDyWSRVdR/BiDYduMd2fTmvR4I2pIFIkAgAWMxsImNCn1XHbo8
	oc=
X-Received: by 2002:a05:620a:1a1c:b0:8ca:3fb7:2570 with SMTP id af79cd13be357-8cbbd01048fmr504271085a.42.1772112520453;
        Thu, 26 Feb 2026 05:28:40 -0800 (PST)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf658f70sm198969385a.7.2026.02.26.05.28.40
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 05:28:40 -0800 (PST)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c9f6b78ca4so102904285a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 05:28:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/jZzl/MoOhKAusyusqETGTuQBtqsJZS/mToT0mqvpvXKAGnZMcydEhvaTkMHhW3hFjFG31hvuBacmGqOv0T4=@vger.kernel.org
X-Received: by 2002:a05:6102:ccf:b0:5fd:ed98:cf0f with SMTP id
 ada2fe7eead31-5ff14157fafmr2006779137.34.1772112160689; Thu, 26 Feb 2026
 05:22:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260111093940.975359-1-vladimir.oltean@nxp.com> <20260111093940.975359-6-vladimir.oltean@nxp.com>
In-Reply-To: <20260111093940.975359-6-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 14:22:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBaoYKNj52gn8DQeZFZ42Cvm6xT6fvo0-_twNv1k3Jhg@mail.gmail.com>
X-Gm-Features: AaiRm523jRWdOCfOPJhqksDewbEoHD_GTMJ0xjyZsvboq3n-XWtXIhj4iGm1B4M
Message-ID: <CAMuHMdUBaoYKNj52gn8DQeZFZ42Cvm6xT6fvo0-_twNv1k3Jhg@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

Hi Vladimir,

CC kunit

On Sun, 11 Jan 2026 at 10:44, Vladimir Oltean <vladimir.oltean@nxp.com> wro=
te:
> Add helpers in the generic PHY folder which can be used using 'select
> GENERIC_PHY_COMMON_PROPS' from Kconfig, without otherwise needing to
> enable GENERIC_PHY.
>
> These helpers need to deal with the slight messiness of the fact that
> the polarity properties are arrays per protocol, and with the fact that
> there is no default value mandated by the standard properties, all
> default values depend on driver and protocol (PHY_POL_NORMAL may be a
> good default for SGMII, whereas PHY_POL_AUTO may be a good default for
> PCIe).
>
> Push the supported mask of polarities to these helpers, to simplify
> drivers such that they don't need to validate what's in the device tree
> (or other firmware description).
>
> Add a KUnit test suite to make sure that the API produces the expected
> results. The fact that we use fwnode structures means we can validate
> with software nodes, and as opposed to the device_property API, we can
> bypass the need to have a device structure.
>
> Co-developed-by: Bj=C3=B8rn Mork <bjorn@mork.no>
> Signed-off-by: Bj=C3=B8rn Mork <bjorn@mork.no>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch, which is now commit e7556b59ba651796
("phy: add phy_get_rx_polarity() and phy_get_tx_polarity()") in
v7.0-rc1.

> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -5,6 +5,28 @@
>
>  menu "PHY Subsystem"
>
> +config PHY_COMMON_PROPS
> +       bool
> +       help
> +         This parses properties common between generic PHYs and Ethernet=
 PHYs.
> +
> +         Select this from consumer drivers to gain access to helpers for
> +         parsing properties from the
> +         Documentation/devicetree/bindings/phy/phy-common-props.yaml sch=
ema.
> +
> +config PHY_COMMON_PROPS_TEST
> +       tristate "KUnit tests for PHY common props" if !KUNIT_ALL_TESTS
> +       select PHY_COMMON_PROPS

This select means that enabling KUNIT_ALL_TESTS also enables extra
functionality, which may not be desirable in a production system.
As PHY_COMMON_PROPS is bool, this extra functionality is even part of
the base kernel if KUNIT_ALL_TESTS=3Dm.  Unfortunately PHY_COMMON_PROPS is
invisible, so this cannot just be changed from "select" to "depends on".
But perhaps PHY_COMMON_PROPS can be made visible if KUNIT_ALL_TESTS,
so the select can be turned into a dependency?

> +       depends on KUNIT
> +       default KUNIT_ALL_TESTS
> +       help
> +         This builds KUnit tests for the PHY common property API.
> +
> +         For more information on KUnit and unit tests in general,
> +         please refer to the KUnit documentation in Documentation/dev-to=
ols/kunit/.
> +
> +         When in doubt, say N.
> +
>  config GENERIC_PHY
>         bool "PHY Core"
>         help

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

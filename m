Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796157;
	b=KTA/ivTj0Lvud6Uw/Zdl6WINDh5OKeM0G006brJdX6QN0bvLLoqEjSnbIvHk1Mnwk0eJ
	 E70uq3Md2tzyB2wuVZL8DCITUxCtGRzOB83j8PK6eY8stZ/IW2VZb+V/QUafDML8zFQ8Q
	 vQ3QFqkzUI/gJGEwyqKQNpzFnEtMBGKcgJfWZT0HSnc6tFJjHCgci2TvxggzI+wOvSvKC
	 eXyfOz/T971Tq8PW/tCTOF7fL+75g9ST/8y/rxYIHtWuEVsOJ5VQONue31QQKsRIaEVLS
	 SsZYD+osJhw3/vQgSt+vlza8Z9o7NCXT+J+M2yWCLN9LR48kFI2CxOOg74j3REInfag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796157;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=DUcD8vl8HJh/JpVsy72nyWgwRsLf5KHqOvznMCLHkbo=;
	b=5YSjb8YXtx1LcDU47YfZRvxjKQMW7Ljxh/oioX2R9r5/XcJyCJ4P9LZcbI3ebdCgunvk
	 +5pqPgdwS1Om309WOLzrC37FwleDf/CuQ4SvhdrU6TOmZ1LJF87z45dUoU9CqKUZnVyJd
	 LCrzuXvc0Tim3BYBZ+3JqBRJIDfABAFzbsWB/Kz5Q4EJmwMe09kwInntfhQxSVydExGkb
	 ZZy44oapuTCoAxGZOv8xayjjfL0LviC4eZ/rblMmDUQLzlX7T+EIeFmwo2F6dpEGbaxCD
	 2ZmKwTztRYiDRYyb15gNfm5vFfC6jVf0mKvCIPzaEUNvRPerey+yWXmdvh2TjDmVtdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CGQE70jY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C44606A32C;
	Mon, 16 Nov 2026 02:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CGQE70jY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BDB1F000C4;
	Mon, 16 Nov 2026 02:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794796157;
	bh=DUcD8vl8HJh/JpVsy72nyWgwRsLf5KHqOvznMCLHkbo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CGQE70jYz8fjdE/cFvriX5z6/uWMvyUvJGtXnkbgM20npQlubgINYdOFrJ8OSlIDs
	 U6ei5dv9Vpr1aNM8ii3IqkavHSC2jrxCDVUi/4b92zEbkre1WNL+SME2VaN6g/yrKb
	 R3UjoUY1vifohs/cp6qQC2FLHZiORJMBXpU5KSHoOlprWvNtelU/4qfcywVg0U+Nlp
	 rNOdA8awv/pFV6tuqwGeNFd8hioM887NP1THMMOK9vvqKggzAUA6yCcmi8EPff/UtN
	 bxz1rcZ956SHecirQjt7U0L5L5QdkbJ4BguVA3EQq1sqstNGT63EZOuHXKza7uZHhF
	 DF69im/CyjMzw==
Subject: Re: [PATCH net v3] selftests: drv-net: pause: Avoid cleanup failures
 for unsupported link settings
From: netdev-bot+sashiko@kernel.org
To: mohsin.bashr@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 maxime.chevallier@bootlin.com, linux-kselftest@vger.kernel.org,
 hmohsin@meta.com
Date: Mon, 16 Nov 2026 02:29:16 +0000
Message-ID: <179479615614.3136.17810537023382462405@kernel.org>
In-Reply-To: <20261113022717.1914724-1-mohsin.bashr@gmail.com>
References: <20261113022717.1914724-1-mohsin.bashr@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch removes the unconditional restore of the pre-test
  link state from pause_setup(), and pause_test_support() does not…

--

selftests: drv-net: pause: Avoid cleanup failures for unsupported link settings

This patch changes pause.py so that link-setting restores are queued only
after a link-setting request has succeeded. Devices that cannot change link
settings therefore no longer fail during cleanup. If no link configuration
change is accepted, pause_test_support() falls back to checking forced MAC
pause on the current link, and pause_autoneg_link_autoneg() now queues its
own autoneg-on restores.

> diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
> index ca4a55e59c30f..c3398c7452e01 100755
> --- a/tools/testing/selftests/drivers/net/hw/pause.py
> +++ b/tools/testing/selftests/drivers/net/hw/pause.py
> @@ -402,16 +402,13 @@ def pause_setup(cfg):
>      if "auto-negotiation" not in link:
>          raise KsftSkipEx(f"{cfg.ifname} doesn't report its link modes")
>  
> -    if link["auto-negotiation"]:
> -        defer(cmd, f"ethtool -s {cfg.ifname} autoneg on")
> -    elif "speed" in link and "duplex" in link:
> -        defer(cmd, f"ethtool -s {cfg.ifname} autoneg off speed {link['speed']} "
> -                   f"duplex {link['duplex'].lower()}")
> -
>      # Local interface admin up, link aneg on
>      ip(f"link set {cfg.ifname} up")
>      if link["supports-auto-negotiation"] and not link["auto-negotiation"]:
>          ethtool(f"-s {cfg.ifname} autoneg on")
> +        if "speed" in link and "duplex" in link:
> +            defer(cmd, f"ethtool -s {cfg.ifname} autoneg off speed {link['speed']} "
> +                       f"duplex {link['duplex'].lower()}")

[ ... ]

> @@ -470,9 +463,12 @@ def pause_test_support(cfg, pauseparams):
>  
>      forced = forced_link_settings(cfg)
>      _, supported = get_local_pause_supported(cfg)
> +    link_config_tested = False
>  
>      # We check that what we can configure in the pause params matches what we
> -    # support under various contditions : Link aneg on/off, pause aneg on/off
> +    # support under various conditions: link aneg on/off, and pause aneg
> +    # on/off. If no link configuration change is supported, fall back to
> +    # checking forced MAC pause on the current link.
>      ret, _ = ethtool_ret(f"-s {cfg.ifname} autoneg on", is_get = False)
>      if ret != 0:
>          ksft_pr("link autoneg on refused, not tested")
> @@ -481,18 +477,23 @@ def pause_test_support(cfg, pauseparams):
>                                 "link autoneg on")
>          expect_pauseparams_set(cfg, pauseparams, True, supported,
>                                 "link autoneg on")
> +        link_config_tested = True
>  
>      if not forced:
>          ksft_pr("link speed unknown, the forced link is not tested")
> -        return
> -
> -    ret, _ = ethtool_ret(f"-s {cfg.ifname} autoneg off {forced}", is_get = False)
> -    if ret != 0:
> -        ksft_pr(f"link autoneg off {forced} refused, not tested")
> -        return
> -
> -    expect_pauseparams_set(cfg, pauseparams, False, supported, "link autoneg off")
> -    expect_pauseparams_set(cfg, pauseparams, True, supported, "link autoneg off")
> +    else:
> +        ret, _ = ethtool_ret(f"-s {cfg.ifname} autoneg off {forced}", is_get = False)
> +        if ret != 0:
> +            ksft_pr(f"link autoneg off {forced} refused, not tested")
> +        else:
> +            if link_config_tested:
> +                defer(cmd, f"ethtool -s {cfg.ifname} autoneg on")

[Severity: Medium]
Could this leave the local interface autonegotiating when it started with
a forced link?

pause_setup() now queues a restore only when it enables autoneg itself,
which happens when supports-auto-negotiation is true and auto-negotiation
is false. If the port starts forced and reports
supports-auto-negotiation: false, pause_setup() queues nothing.

pause_test_support() then sends:

    ret, _ = ethtool_ret(f"-s {cfg.ifname} autoneg on", is_get = False)

If that succeeds, no restore is queued for it. The ethtool netlink core
does not check the Autoneg supported bit. In net/ethtool/linkmodes.c,
ethnl_update_linkmodes() only does:

    ethnl_update_u8(&lsettings->autoneg, tb[ETHTOOL_A_LINKMODES_AUTONEG], mod);

The change is then passed to ->set_link_ksettings(), so the driver alone
decides whether to accept it.

If the driver accepts it and the later autoneg off {forced} request also
succeeds, the only restore queued is the hardcoded autoneg on above.
Cleanup then leaves the link in autoneg mode.

Before this patch, pause_setup() queued "autoneg off speed X duplex Y"
first. That restore ran last and put back the original forced settings.

The commit message says:

  Fix this by queuing link-setting restores only after a link-setting
  request has succeeded.

The first autoneg on request in pause_test_support() can succeed and
change the link, but no restore is queued for it. This only happens with a
driver that accepts enabling autoneg without advertising Autoneg support.

Should pause_test_support() restore the link state it saw before the test
instead of a fixed autoneg on?

> +            expect_pauseparams_set(cfg, pauseparams, False, supported, "link autoneg off")
> +            expect_pauseparams_set(cfg, pauseparams, True, supported, "link autoneg off")
> +            link_config_tested = True
> +
> +    if not link_config_tested:
> +        expect_pauseparams_set(cfg, pauseparams, False, supported, "current link")

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113022717.1914724-1-mohsin.bashr%40gmail.com

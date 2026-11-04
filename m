Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789884;
	b=xZXBzTBIDIKtjVFmYDKXjOvDQIg7hWdNMVrNSoupEzhlBNhC/iiAw+YrbwuKSwpo4KKt
	 L0nOIZljtrMDGO9OYPhKhNMEQO/mHP97J8eYvgMKwrbqMPiXkIj+1h1uj3z32J1CJ9zdm
	 MIvrv3ES7cHUgI3MVeO+MSn6+wKTey1yWoBsDZMYeFNrE5rkcTKG0Y+RFQyyEOAvfE3XU
	 oXbPZJDRBiEqcvloqmUwdi1ruM36P1BRndyEokNYs2Vd5PtJ9dlKS1bSWBzrcA5ZbB0+/
	 YjpVu+IAQnRS9Vb4THEPxUfTtG+uLU5iAQ+gN75Q/rp6pktGCXkFvP/afoIbv8KEgbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789884;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=tlh7smLTj2XLazLcq0xResbpXj4b1ZAUzr/0lOmTKLk=;
	b=mwaC57ioNCOdaiNdJ1UZgYPJpp+h7fqLY8fLhkDo3rKK5Q1/Nx90cXExlJbZdgtEMCJ3
	 kxXW7TKwfmw97eGiZaYtEJD/X6WziIJVgn4WgIofl+AZCrdkvoMbvVF+KCeBKU0TANv6b
	 Lt21G3dyvtqK6rZYrQ/I853cEwGWzSVdS1FYWdu5SfpLdDO+pD5yyfqMGLyS7IgRO1phD
	 IYt6eiePoPD9S3VLU9hqU41+CNX6fGdB9VknYETnxf0knP9kcZCynoOUtB7L7/Jwv/ay/
	 qKA20bY9O7h5vh+YRqt+14Y1jjWDabbGt9tA1npe3vrlNdwatVslxXCcYFN/4oegkgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aDkra9DG;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46860606A326;
	Wed,  4 Nov 2026 10:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46860606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aDkra9DG
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 963C64E413F7;
	Wed,  4 Nov 2026 10:58:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6316460770;
	Wed,  4 Nov 2026 10:58:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A13CE103291D2;
	Wed,  4 Nov 2026 11:57:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793789880; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tlh7smLTj2XLazLcq0xResbpXj4b1ZAUzr/0lOmTKLk=;
	b=aDkra9DGoFBO7g3eEfaFzJrcP1KCVRRWmvm+qHRR0gxjUaLwJc9hntUxHL3YmMBh1Wmoil
	i3Q7gzfbWJpr3cXdD9OKHAW/17OnE8LsODNWJZJ/shPobzDDCGwgU8iWgUTTOQoV5XErkT
	yQpub/sKDYiaQkhn+r+K9BF+vg7YJkFcDye4cQGeERu3ayRTNXLLTt3qZ5ml1Ph4GfpAbi
	/vro7GFFzspmlfQkfeKTVvDY3k5HQRJYmnaRfYsWXLtGVRrSVDIxvZYnj19AH3uQsJouk7
	06aZXObrtpBh/pSCazPouXeiMoY2TOdQuUU1dnEH5rcv4ZyF0JoHYwpkAzxFSQ==
Message-ID: <4f90c4b1-98d3-4e98-bcfc-d9f2d17b4391@bootlin.com>
Date: Wed, 4 Nov 2026 11:57:54 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] selftests: drv-net: pause: Avoid cleanup failures
 for unsupported link settings
To: Mohsin Bashir <mohsin.bashr@gmail.com>, netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org
References: <20261103190622.3981970-1-mohsin.bashr@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261103190622.3981970-1-mohsin.bashr@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/3/26 20:06, Mohsin Bashir wrote:
> From: Mohsin Bashir <hmohsin@meta.com>
> 
> pause_setup() saves the initial link settings and queues a deferred
> restore. For devices that report forced link settings but do not support
> changing link settings, this can queue a restore even when setup never
> changes the link. On fbnic, the deferred restore returns EOPNOTSUPP and
> turns pause tests that use pause_setup() into cleanup failures.
> 
> Fix this by queuing the forced-link restore only after setup successfully
> enables link autonegotiation. Keep pause_test_support coverage for devices
> that cannot change link settings by falling back to forced MAC pause on the
> current link. Run the extra link autoneg on/off checks only when those link
> setting requests are accepted.
> 
> Results on fbnic:
> 
>   Before: # Totals: pass:0 fail:4 xfail:0 xpass:0 skip:24 error:0
>   After:  # Totals: pass:4 fail:0 xfail:0 xpass:0 skip:24 error:0
> 
> Fixes: cbd8a536cd6d ("selftests: drv-net: Introduce a selftest for ethtool flow control")
> Signed-off-by: Mohsin Bashir <hmohsin@meta.com>

That looks better, this patch ran on the netdev CI and no regressions on
stmmac,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
> v2:
> - Drop the require_link_autoneg() approach from v1.
> - Move the cleanup fix into pause_setup() so all pause tests avoid
>   restoring unchanged forced-link settings.
> - Keep pause_test_support() coverage on devices without link setting
>   support by falling back to forced MAC pause on the current link.
> 
> v1: https://lore.kernel.org/netdev/20261030173516.1002250-1-mohsin.bashr@gmail.com
> ---
>  .../testing/selftests/drivers/net/hw/pause.py | 40 +++++++++++--------
>  1 file changed, 23 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
> index ca4a55e59c30..99ce6a59dfcd 100755
> --- a/tools/testing/selftests/drivers/net/hw/pause.py
> +++ b/tools/testing/selftests/drivers/net/hw/pause.py
> @@ -404,14 +404,14 @@ def pause_setup(cfg):
>  
>      if link["auto-negotiation"]:
>          defer(cmd, f"ethtool -s {cfg.ifname} autoneg on")
> -    elif "speed" in link and "duplex" in link:
> -        defer(cmd, f"ethtool -s {cfg.ifname} autoneg off speed {link['speed']} "
> -                   f"duplex {link['duplex'].lower()}")
>  
>      # Local interface admin up, link aneg on
>      ip(f"link set {cfg.ifname} up")
>      if link["supports-auto-negotiation"] and not link["auto-negotiation"]:
>          ethtool(f"-s {cfg.ifname} autoneg on")
> +        if "speed" in link and "duplex" in link:
> +            defer(cmd, f"ethtool -s {cfg.ifname} autoneg off speed {link['speed']} "
> +                       f"duplex {link['duplex'].lower()}")
>  
>      # Get remote pause params
>      ret, params = ethtool_ret(f"-a {cfg.remote_ifname}", host=cfg.remote)
> @@ -429,15 +429,15 @@ def pause_setup(cfg):
>      if link["auto-negotiation"]:
>          defer(cmd, f"ethtool -s {cfg.remote_ifname} autoneg on",
>                host=cfg.remote)
> -    elif "speed" in link and "duplex" in link:
> -        defer(cmd, f"ethtool -s {cfg.remote_ifname} autoneg off "
> -                   f"speed {link['speed']} duplex {link['duplex'].lower()}",
> -                   host=cfg.remote)
>  
>      # Remote interface admin up, link aneg on
>      ip(f"link set {cfg.remote_ifname} up", host=cfg.remote)
>      if link["supports-auto-negotiation"] and not link["auto-negotiation"]:
>          ethtool(f"-s {cfg.remote_ifname} autoneg on", host=cfg.remote)
> +        if "speed" in link and "duplex" in link:
> +            defer(cmd, f"ethtool -s {cfg.remote_ifname} autoneg off "
> +                       f"speed {link['speed']} duplex {link['duplex'].lower()}",
> +                       host=cfg.remote)
>  
>      wait_for_link(cfg)
>  
> @@ -470,9 +470,12 @@ def pause_test_support(cfg, pauseparams):
>  
>      forced = forced_link_settings(cfg)
>      _, supported = get_local_pause_supported(cfg)
> +    tested = False
>  
>      # We check that what we can configure in the pause params matches what we
> -    # support under various contditions : Link aneg on/off, pause aneg on/off
> +    # support under various conditions: link aneg on/off, and pause aneg
> +    # on/off. If no link configuration change is supported, fall back to
> +    # checking forced MAC pause on the current link.
>      ret, _ = ethtool_ret(f"-s {cfg.ifname} autoneg on", is_get = False)
>      if ret != 0:
>          ksft_pr("link autoneg on refused, not tested")
> @@ -481,18 +484,21 @@ def pause_test_support(cfg, pauseparams):
>                                 "link autoneg on")
>          expect_pauseparams_set(cfg, pauseparams, True, supported,
>                                 "link autoneg on")
> +        tested = True
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
> +            expect_pauseparams_set(cfg, pauseparams, False, supported, "link autoneg off")
> +            expect_pauseparams_set(cfg, pauseparams, True, supported, "link autoneg off")
> +            tested = True
> +
> +    if not tested:
> +        expect_pauseparams_set(cfg, pauseparams, False, supported, "current link")
>  
>  @ksft_variants(pauseparams_variants)
>  @ksft_disruptive


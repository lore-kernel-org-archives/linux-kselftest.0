Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793684250;
	b=S0gvpgun81W4HHGg/6a8QGhlOp5WH5iQ/6Cma7xJfVZQj+7sn6cLLNNxeTcpidIA704W
	 fUiNpCGNl2UVMR38JMa6Gupq+MZfS9sEOhNLg0O6xKif/J0Dca/okxUQybUvMS+WSLidg
	 3kaalcO0tHKJnelicyP0uPkvaMAvT8N7aHSWlo3rEs3Sho9KXSICQNLS8WSQmFjmZk3EE
	 n1qAuk9zA9pSQgmXWsHhxztrAMwQk0qWkeu4Rt/X8umXlL7SClpP83wKfoWDvYIOjwiEp
	 BnpDEPyY0exFXyxwXEucn7/UCLy3BbAc9A3zLd9LnrioID93QMJWNrZ/n+k7ic5SVTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793684250;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Z9N045PGX72xkHaVesJTSxEo5HdRSWDD+P7HKyru9AE=;
	b=asIT0HdK/gqbk21eWuMGYHkrIXi2LdTVe8w9h+uxvMdoeYt0l9iln5PLsPhkJSb6LYG/
	 vNy7FRQyIg2Ryox2B8fa9ZfYEq3MHWmnIQpEdrqAGwM3TYTYLMGrdY7ThyDE4GZ27lgjM
	 kubuzfoQ6o9DdsZr01Zo688Ls3UiqKRnRswj90ogaObfwmNpzxu+jo9zCjqh7ts+729t4
	 BhgcbQ/dzUcC4dW/WMGgSakK/hVc4vcl3RVmi1btSJ4cIwle3fQAcmAnM1gn66NQNBARE
	 uZ4rusRferV6h1+aWSjTwrSohysRCgMnLvqTISvb83TKOGosce97EXpddENY6dm/Y5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fxZDhmJD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68B2606A32E;
	Tue,  3 Nov 2026 05:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fxZDhmJD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FBB1F000C1;
	Tue,  3 Nov 2026 05:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793684249;
	bh=Z9N045PGX72xkHaVesJTSxEo5HdRSWDD+P7HKyru9AE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fxZDhmJDNgRkKuV+/q/ETsgBgdTezFC5dL54nTcUZSNJKF6wHleyKFQaecX6MqT4g
	 LZJ7vMFd5AkEs3KbKy6gn+VDH2Kg5eB2BbRQ77CPUBP7i5ODD4e9IXCkRCAtcplFje
	 1oTMxLOhFWjODDYq2T6vKjTyl+MOVd6stGmArTngl1MbvbHTZZwaZhCAp8b1U255lj
	 RH/3k7cHlawE8jiZvVwytCbAvro6g4rsn5dnrg5+Z5StuMvuIbmhMZsHQqmVSGodCA
	 OXh356L09rVispOj/3PTtcobSipo8ZO0fFwtLyfInvL60/CeXPHykHJXA+gzNESIBu
	 q/wmq6i/rlUfw==
Subject: Re: [PATCH net] selftests: drv-net: pause: Skip support tests without
 link autonegotiation
From: netdev-bot+sashiko@kernel.org
To: mohsin.bashr@gmail.com
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 maxime.chevallier@bootlin.com
Date: Tue, 03 Nov 2026 05:37:28 +0000
Message-ID: <179368424817.488856.1260070865221347541@kernel.org>
In-Reply-To: <20261030173516.1002250-1-mohsin.bashr@gmail.com>
References: <20261030173516.1002250-1-mohsin.bashr@gmail.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.
- [Medium] The new require_link_autoneg(cfg) call in pause_test_support()
  (pause.py:469) now runs before pause_setup()'s guard for devices that…

--

selftests: drv-net: pause: Skip support tests without link autonegotiation

This commit calls require_link_autoneg() before pause_setup() in
pause_test_support(), so the test is skipped when either interface lacks
link autonegotiation. The goal is to stop cleanup failures on fbnic, where
the deferred restore of unchanged link settings returns EOPNOTSUPP.

> diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
> index ca4a55e59c30f..1537f88e0e77e 100755
> --- a/tools/testing/selftests/drivers/net/hw/pause.py
> +++ b/tools/testing/selftests/drivers/net/hw/pause.py
> @@ -466,6 +466,7 @@ def pause_test_support(cfg, pauseparams):
>      supported fields.
>      """
>  
> +    require_link_autoneg(cfg)

[Severity: Medium]
Can this turn a SKIP into a failure on devices that don't report link
modes?

require_link_autoneg() reads the JSON key directly for both interfaces,
without checking that it exists:

def require_link_autoneg(cfg):
    ...
    if not ethtool(f"{cfg.ifname}", json=True)[0]["supports-auto-negotiation"]:
    ...
    if not ethtool(f"{cfg.remote_ifname}",
                   json=True, host=cfg.remote)[0]["supports-auto-negotiation"]:

ethtool fills both "auto-negotiation" and "supports-auto-negotiation" from
the same LINKMODES_GET reply. If the driver has no get_link_ksettings,
ethtool still exits 0, but the JSON has neither key.

Before this patch, pause_test_support() reached this guard in pause_setup()
and skipped:

    link = ethtool(f"{cfg.ifname}", json=True)[0]
    if "auto-negotiation" not in link:
        raise KsftSkipEx(f"{cfg.ifname} doesn't report its link modes")

With this patch, require_link_autoneg() runs first and raises KeyError.
ksft_run() catches that and reports a failure for all four variants.

The other callers of require_link_autoneg() first go through the
require_pause_supported helpers. Those check "supported-pause-frame-use"
from the same reply. pause_test_support() is the only caller that has no
earlier guard.

Would using .get("supports-auto-negotiation") avoid this? Checking for the
key and skipping would also work.

>      pause_setup(cfg)

[Severity: High]
Does this fully fix the fbnic CI failure described in the commit message?

pause_setup() always defers a restore of the current link settings. It
does this for both the local and the remote interface, even when nothing
will change those settings:

    if link["auto-negotiation"]:
        defer(cmd, f"ethtool -s {cfg.ifname} autoneg on")
    elif "speed" in link and "duplex" in link:
        defer(cmd, f"ethtool -s {cfg.ifname} autoneg off speed {link['speed']} "
                   f"duplex {link['duplex'].lower()}")

pause_advertising_test() and pause_aneg_resolution() still call
pause_setup() without a require_link_autoneg() check:

pause_advertising_test():
    require_pause_supported_allof(cfg, pauseparams["linkmodes"])
    pause_setup(cfg)
    lp = controllable_lp(cfg)

pause_aneg_resolution():
    require_pause_supported_allof(cfg, required_local_linkmodes)
    require_peer_pause_supported_allof(cfg, required_remote_linkmodes)
    pause_setup(cfg)
    require_controllable_lp(cfg)

fbnic has .get_link_ksettings, but it has no .set_link_ksettings and no
.nway_reset.

Take the "RX off TX off" variant of pause_advertising_test(). Its linkmodes
list is empty, so the support check passes, and then:

pause_advertising_test()
  pause_setup()
    defer(cmd, "ethtool -s ... autoneg off speed X duplex Y")
  controllable_lp()
    ethtool -r -> EOPNOTSUPP
    raise KsftSkipEx(...)
ksft_flush_defer()
  ethtool -s -> EOPNOTSUPP
  KSFT_RESULT = False

The result is "not ok ... # SKIP", and ksft_exit() returns 1.

pause_aneg_resolution() takes the same path through
require_controllable_lp(), for example in the all-off/all-off variant.

controllable_lp() also does not cache a result when it skips. Every later
test runs ethtool -r again and fails the same way.

Would it be better to add require_link_autoneg() to these two tests? The
other option is for pause_setup() to defer the link-settings restore only
when it actually changes the link settings.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261030173516.1002250-1-mohsin.bashr%40gmail.com

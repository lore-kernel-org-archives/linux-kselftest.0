Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551394;
	b=Z57f83MeUobcrnKUK+avXaR4pxhsEz+FuUe3Q3hylNDL5uj9V0CtXDQR7vGcJkRyYOYm
	 Kr4dqeyap3UUOOOwfjf7HjwUnmFdK62AN5eFEet+F3qMjk8zYT0+F2V2wPdI8o+edGkiK
	 i58HKu/49uA5gQpvGf4Ukxi2ozHDkUU4SkN7xE16Yr2u5lOG79RDDC2wuiBYpr1wFmo3X
	 uci6rXbEXdgfeet5HJGyjy18bEq56SPDS9Qg4ou7db1oHeMScbzZN093niUP8+Xoz46jb
	 /dYVcZb6kG3kTeY0OTPAhh4i7A7D2WwmP0ShGw/BuOWxk6Tu1WDyQp/wi8wgYS9EuJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551394;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=SP1wbcINzSUJyNuETmkM+dOjtDQCPAxHCIc0cwhm72Q=;
	b=ywDAqxZx2NzTXeGg8lO5jOKt6eUnaJUxRHM5dv4026HSYkBvqZ3AtaMILq8IyrPxZZkR
	 BKH4FZxAiSs16GkndVILdjOgU6kgBZqocZb3vwi+50fnFSg+cyUe0flGUp8GcEkwpM7tm
	 wXveSfiTMdvgYheXPXlrG7QN7NWJZ9OUT1rA5B1CROH0wyQahkyc+ftNyLH9tfPXXGBjK
	 V4ERgR/Ol7ixBB02eGPZW/Ym87bOOzyKRBkYpxtTGRiB5nzIbAVVVM+Xtu6ML9jedRPvC
	 H6XMSzRgl4VOn+duMlLl7T8jYMZdVCfpZ5HnvAACLl40dLlB7T+iA1/jMRxV/v8cnow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aK9UEqY+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C738C606A33F;
	Tue, 24 Nov 2026 20:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aK9UEqY+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E911F000D2;
	Tue, 24 Nov 2026 20:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795551394;
	bh=SP1wbcINzSUJyNuETmkM+dOjtDQCPAxHCIc0cwhm72Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aK9UEqY+mBz44I1gh/UJ7vwYJYr2FVX7fMnR8pJGpMDajsMAWvwfgmq01W+kLPPjC
	 /BqMx5jh5TRnM2ZXcHWW4AyrzKQVxqWXBNk266tIJxKaXbFo2T+shXc0Z4Dq0jQqtD
	 ImYwGasCdXxCUN9tSU2w5BskS/z0W99IeZQsRwsdszj3Mp0Z1biEEhzSLu5QeWCdXw
	 KxuwakZTgoTfpmNDVdVfUXgJHn0pVtO9S3e3PW7WgfWgrsMSzKPcn5n6Ta5S4cZmGF
	 kBTg4EvmMvBdgaQHvZrWLXCCvPxfiOHhOiNde2/GyCkTlFot6s46A+qxJyAN3drMnS
	 1gRbS1g57Bq3w==
Subject: Re: [PATCH net] selftests: drv-net: pause: detect the link partner
 from the remote side
From: netdev-bot+sashiko@kernel.org
To: maxime.chevallier@bootlin.com
Cc: andrew@lunn.ch, kuba@kernel.org, davem@davemloft.net, edumazet@kernel.org,
 willemb@google.com, pabeni@redhat.com, horms@kernel.org,
 linux@armlinux.org.uk, skhan@linuxfoundation.org, bobbyeshleman@meta.com,
 sdf@fomichev.me, leitao@debian.org, matttbe@kernel.org,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 24 Nov 2026 20:16:33 +0000
Message-ID: <179555139301.3135.11150049621951436064@kernel.org>
In-Reply-To: <20261123201406.479904-1-maxime.chevallier@bootlin.com>
References: <20261123201406.479904-1-maxime.chevallier@bootlin.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In controllable_lp()
  (tools/testing/selftests/drivers/net/hw/pause.py, lines 107-111), the…
- [Medium] Before this patch, controllable_lp() ran `ethtool -r
  {cfg.ifname}` on the local device and turned any failure into…
- [Medium] The new detection in controllable_lp() can still return a
  false 'not directly connected', the same failure the commit claims to…
- [Medium] The new controllable_lp() decides the remote is the link
  partner if it sees any local carrier drop followed by link-up within…
- [Low] controllable_lp() now runs `ethtool -r` on the remote instead of
  the local device (lines 102-105).

--

selftests: drv-net: pause: detect the link partner from the remote side

This commit reverses the direct-link detection in controllable_lp(). The
old code renegotiated locally and then checked the remote's
carrier_changes counter. The new code runs ethtool -r on the remote and
waits for the local carrier to drop and come back up. A TimeoutError from
wait_for_aneg() is now taken to mean the remote is not the link partner.

> diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
> index ca4a55e59c30f..31518b7ec53ba 100755
> --- a/tools/testing/selftests/drivers/net/hw/pause.py
> +++ b/tools/testing/selftests/drivers/net/hw/pause.py

[ ... ]

> @@ -99,17 +99,17 @@ def controllable_lp(cfg):
>      if controllable is not None:
>          return controllable
>  
> -    before = int(cmd(f"cat /sys/class/net/{cfg.remote_ifname}/carrier_changes",
> -                     host=cfg.remote).stdout)
> -
> -    ret, _ = ethtool_ret(f"-r {cfg.ifname}", is_get=False)
> +    ret, _ = ethtool_ret(f"-r {cfg.remote_ifname}", is_get=False,
> +                         host=cfg.remote)
>      if ret != 0:
> -        raise KsftSkipEx(f"ethtool -r {cfg.ifname} failed: {errno.errorcode.get(ret, ret)}")
> +        raise KsftSkipEx(f"ethtool -r {cfg.remote_ifname} failed: {errno.errorcode.get(ret, ret)}")

[Severity: Medium]

Before this change, the local ethtool -r also checked that the local
device supports renegotiation. If it failed, every
require_controllable_lp() user was skipped. Now that the probe runs on
the remote, is that guarantee gone?

pause_autoneg_off_while_link_autoneg_on() still depends on it:

    require_link_autoneg(cfg)
    pause_setup(cfg)
    require_controllable_lp(cfg)
    ...
    ethtool(f"-r {cfg.ifname}")
    wait_for_aneg(cfg, link_drop=True)

This ethtool() call runs with fail=True. require_link_autoneg() only
checks supports-auto-negotiation. If the local driver has no .nway_reset
(for example gianfar, mlx5 or enetc), ethtool_nway_reset() returns
-EOPNOTSUPP:

net/ethtool/ioctl.c:ethtool_nway_reset() {
    ...
	if (!dev->ethtool_ops->nway_reset)
		return -EOPNOTSUPP;
    ...
}

Take such a DUT paired with a remote that does support ethtool -r. Would
this test now fail with CmdExitFailure where it used to skip?

[Severity: Low]

The skip condition here also moves from the local device to the remote
one, and the commit message doesn't mention it.

pause_advertising_test() only uses the result to decide whether to also
check the peer's lp_advertising:

    pause_setup(cfg)
    lp = controllable_lp(cfg)

controllable_lp() raises KsftSkipEx instead of returning False. So when
the remote driver has no .nway_reset, every variant of
pause_advertising_test() is now skipped, even though the local
advertising checks don't need the peer. Is that intended?

In a switched setup, the old code saw the local flap within a few
seconds. The new code only flaps the remote's switch port. It then waits
the full 15 second deadline in wait_for_aneg() for a local drop that
never comes.

Could the commit message mention these trade-offs? Right now it only
says:

    it doens't really matter which side of the link flaps first here.

>  
> -    wait_for_aneg(cfg, link_drop=True)
> +    try:
> +        wait_for_aneg(cfg, link_drop=True)
> +        cfg.lp_controllable = True

[Severity: Medium]

Can a flap that only happened on the local side be taken for the
remote's renegotiation? Any local carrier drop followed by link-up inside
this window gives lp_controllable = True. Nothing shows where the drop
came from.

The first call to controllable_lp(), whose result is cached, is in
pause_advertising_test(). That test runs right after
pause_test_support(), which only reconfigures the local port: link
autoneg on and off, forced speed, and repeated ethtool -A. Its deferred
cleanup restores ethtool -s <ifname> autoneg on and the original pause
settings, and either of these can restart local aneg.

pause_setup() then ends with:

    wait_for_link(cfg)

This only checks that carrier reads 1. It does not wait for a pending
renegotiation to settle.

Some drivers report link-down asynchronously: polled C45 PHYs, phylink
resolve work, firmware or watchdog link handling. With those, the late
local drop can land inside this polling window.

In a switched topology, would that cache lp_controllable = True? The
LP-dependent tests would then treat the switch port as the link partner,
and their lp_advertising and pause resolution checks would fail.

The old approach read the remote's carrier_changes, which a local-only
flap behind a switch cannot change.

> +    except TimeoutError:
> +        cfg.lp_controllable = False

[Severity: Medium]

Does this except clause catch more than the "not directly connected"
case? wait_for_aneg() can raise TimeoutError in two places, and both come
from wait_file():

def wait_for_aneg(cfg, link_drop=False, timeout=15):
    ...
    try:
        wait_file(f"/sys/class/net/{cfg.ifname}/carrier",
                  lambda x: x.strip() == "0",
                  deadline=timeout if link_drop else 2)
    except TimeoutError:
        if link_drop:
            raise

    wait_for_link(cfg, timeout)

Only the first one means the remote isn't the link partner.

Suppose the local carrier does drop after the remote ethtool -r, but the
link doesn't come back within 15 seconds. The TimeoutError from
wait_for_link() also lands here, and lp_controllable = False is cached.

Every later require_controllable_lp() caller would then skip with
"... is not directly connected to ...". pause_advertising_test() would
carry on with lp=False.

Before this patch, that timeout propagated and the test reported an
error. Should the link-up wait stay outside the try block?

[Severity: Medium]

Can this still give a false "not directly connected" result, which is
the problem this patch sets out to fix?

The remote renegotiation goes through Remote.cmd(), which starts a new
ssh process for each command. nway_reset implementations usually just set
ANRESTART and return. Local polling only begins after the ssh process
exits.

wait_for_aneg(link_drop=True) then polls the carrier level through
wait_file(), sleeping 5ms between reads. The local link might go down and
come back up before the first read, or between two reads. Then carrier
never reads "0", the 15 second deadline expires, and
lp_controllable = False is cached.

The commit message says:

    The current
    wait_for_aneg() already waits for a full "up - down - up" cycle, so
    it doens't really matter which side of the link flaps first here.

That only seems to hold if the link is still down when polling starts.
On 1000BASE-T copper, aneg takes more than a second, so the setup
described in the commit message probably won't hit this. Faster links
might.

Would it help to read the local /sys/class/net/<ifname>/carrier_changes
before the remote ethtool -r, and then wait for it to increase and for
carrier to read 1? That way the test doesn't depend on catching the down
state as it happens.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123201406.479904-1-maxime.chevallier%40bootlin.com

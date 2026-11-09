Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248055;
	b=Dfwwl2yZ+1Fww1yfQQz6mf1kZiKx9Lw/xV1r2v8tvzOlId1l6oIymPDQaQprptp9hfbf
	 Igm5WwINFT1mE6h1T+k3tksVzoSKu1PiNB3ZUPVIQGrD2knQIP2eMDJT8lMJFh0CRSKez
	 jMt2rkrjUjw3HgE3vnqQZ8r7cpaPiTeYuc3v2GsaJGTc7ZvXKbkCh769J4rfyCgVh/bkM
	 xf9iXo4XZApcTp47PWJrPbWSgmXGP5klX8CJLa197q3jd7Rpe5ey3u4q7QrVaJrEyLytq
	 T4gYtRsc5yuyrsLAIR31u4u7r0qp2RE7k3Zycg+PqCvyJb7eQmC6aYf4gQR32B/288w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248055;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=q0MU/i8tHwiM3gpQOp/NrbmNfoXZgmpbodb2O/Vu/ig=;
	b=0dAFWyGaHjU87jDHGw/NU9lQK/h0ljA5LhJCR1afeQ7troH3vfZV2NVB2cq5PqOpET07
	 +OW+q84FP7wZSq1oySwIdv8DyeesjMQsxKfrSu/l95gbbntIRdzsSHl7xHbV3twK9y1kP
	 qkDr4w/PJxA2U0/z+33FL+mXzmrI6dmk9naHtp/8rVCg7j7Gqm9FdgCL7yjUFQd5kylMh
	 GLR/wQ3bJapDHass9UeFQKzt88z2Bv4qlNHW4S/yptaDRXxnlX/A2Un1EcWEocJ3K59lg
	 qfpnAqEgdOyrkRbztFKBGTZmqUyWaZjwItDWGNUcjasAGUTFNNql2HkByu0AtrgmrQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L1HCDSQd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4D3606A330;
	Mon,  9 Nov 2026 18:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L1HCDSQd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFF91F008A2;
	Mon,  9 Nov 2026 18:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794248055;
	bh=q0MU/i8tHwiM3gpQOp/NrbmNfoXZgmpbodb2O/Vu/ig=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=L1HCDSQdGhj2Bf1cPDdRsDoRgjGXD6ys5mcmp86e7pZxPId+nzY7DSi4GTtF9yFTS
	 vy8oNWFYfWcXmAjHshX3fdmBFimqcq1v3C+ZECutpUwCU38gbi2iQQ3hG1WnTCmcK0
	 Styfv0rex6Y2rATyDQT9tpSXAPV9VAwhInyeENbDjexV9VofSX020Vhy6MxAnuBw61
	 S8D46C8X5To/wnpwI/9ABDnV9Etod8wS73QxPtWgZkBPq/ZY9duLzBk4Z4gY4FybGy
	 rVxBtQ7zCTPOym9J0UgS13LCrMMeEse2hUgEju+vUZQOryVdP7f2oJyHrGOvZGKKzE
	 6WJPNbOLtA1Gw==
Subject: Re: [PATCH net-next 3/3] selftests: drv-net: hds: restore HDS
 settings in ioctl_set_xdp
From: netdev-bot+sashiko@kernel.org
To: dimitri.daskalakis1@gmail.com
Cc: davem@davemloft.net, andrew+netdev@lunn.ch, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Mon, 09 Nov 2026 18:14:14 +0000
Message-ID: <179424805404.994134.17832090759573772957@kernel.org>
In-Reply-To: <20261106031208.465456-4-dimitri.daskalakis1@gmail.com>
References: <20261106031208.465456-4-dimitri.daskalakis1@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The fix is incomplete: two sibling tests in
  tools/testing/selftests/drivers/net/hds.py still change tcp-data-split…
- [Low] The patch has no Fixes: tag.

--

selftests: drv-net: hds: restore HDS settings in ioctl_set_xdp

This patch makes ioctl_set_xdp() in the drv-net hds.py selftest call
_defer_reset_hds() before it sets tcp-data-split to "unknown". The
original HDS configuration is then restored when the test finishes, the
same way set_xdp() already does it.

> diff --git a/tools/testing/selftests/drivers/net/hds.py b/tools/testing/selftests/drivers/net/hds.py
> index 7f052c3196039..a1ea195743b56 100755
> --- a/tools/testing/selftests/drivers/net/hds.py
> +++ b/tools/testing/selftests/drivers/net/hds.py
> @@ -254,6 +254,7 @@ def ioctl_set_xdp(cfg, netnl) -> None:
>      """
>      mode = _get_hds_mode(cfg, netnl)
>      if mode == 'enabled':
> +        _defer_reset_hds(cfg, netnl)
>          netnl.rings_set({'header': {'dev-index': cfg.ifindex},
>                           'tcp-data-split': 'unknown'})

[Severity: Medium]
Is this fix complete? Two sibling tests in hds.py still change
tcp-data-split, and they defer only a fixed reset to "unknown" instead of
going through _defer_reset_hds():

tools/testing/selftests/drivers/net/hds.py:enabled_set_xdp() {
    ...
    netnl.rings_set({'header': {'dev-index': cfg.ifindex},
                     'tcp-data-split': 'enabled'})

    defer(netnl.rings_set, {'header': {'dev-index': cfg.ifindex},
                            'tcp-data-split': 'unknown'})
    ...
}

ioctl_enabled_set_xdp() uses the same pattern.

When "unknown" does not bring back the saved value, _hds_reset() falls
back to setting that value explicitly:

        if cur.get('tcp-data-split') == rings['tcp-data-split']:
            del arg['tcp-data-split']
        else:
            # Try the explicit setting
            arg['tcp-data-split'] = rings['tcp-data-split']

The fixed resets have no such fallback. If the operator set "enabled" or
"disabled" explicitly, and the driver reports a different value under
"unknown", that setting is lost.

Here is the test order in main():

                  set_xdp,
                  enabled_set_xdp,
                  ioctl,
                  ioctl_set_xdp,
                  ioctl_enabled_set_xdp],

In a default full run, enabled_set_xdp() has already left the device at
"unknown" before ioctl_set_xdp() starts. The new _defer_reset_hds() call
therefore only saves that already-reset state. ioctl_enabled_set_xdp()
runs last and leaves the device at "unknown" again.

Doesn't that mean this change only has a visible effect when
ioctl_set_xdp is run by itself with -t?

The previous patch in this series, "selftests: drv-net: hds: perturb
settings via ioctl in ioctl_enabled_set_xdp", edited
ioctl_enabled_set_xdp() but kept its fixed "unknown" reset.

Could enabled_set_xdp() and ioctl_enabled_set_xdp() also call
_defer_reset_hds(cfg, netnl) before they set 'enabled'?

[Severity: Low]
Should this patch carry a Fixes: tag? Commit ee3ae27721fb
("selftests: drv-net: hds: restore hds settings") added _defer_reset_hds()
to set_xdp() and the set_hds_* tests, but not to ioctl_set_xdp().
Something like:

Fixes: ee3ae27721fb ("selftests: drv-net: hds: restore hds settings")

The test itself was added by 29b036be1b0b ("selftests: drv-net: test XDP,
HDS auto and the ioctl path"), which would also be a reasonable target.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106031208.465456-1-dimitri.daskalakis1%40gmail.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873308;
	b=WeMachhU0kYT8d/Iq3Px5D+nJOx1Pt1aGcH/hwiG8z6OqJH2rnKcDs0+B20Zsdymhns2
	 9mYE/21ybGlmcJrDgnqrVSn0kX5pjlvfnBsUi6VmkTxddMDP+46glSIwdZK1aD4L8cKe+
	 6p3+laFVxEf/gnGdOFF8qLm74uwbZTNZtV3JuGCm5JsptiF3EKuYXNBFrPGvcAHr6/+PG
	 XzUu/QiZqkQd8WZu1BAztrHOPgz0jnxWzCO4rNwCmjvYYnzZEzYhXn047M+olpa+Ubnd4
	 tobV60oFhiVZkrmpZ3BCbxKIIIm0Mk75Gp/BURXUFwYlPTwXkUrWlveHHYkNTN5l+Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873308;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=0+bSVnye4AoypsNrx6qUnH37BwoJnOF78GglImy6ss8=;
	b=d8N3PTneSYVKxh7N/Cxacck+8zon1AZETvmsxwhn3JStQTKuYyHl2J71gcaOX7MzyDOP
	 P5ANEw0xaa1YmbvZNz/7WTkvM78S9Tr2AfQvURgRbD9i/ji4w+azD0VGFvdvRqafG0PS5
	 tA0sGZkal+qeV16Ou132LpMpxbg6LvBfHhtmqjnqRAjilSsWePCZ7NbqhpdU7gNzxWwIy
	 RqL/pTKu9SBD+oZ7Gj1ulWHZ1o1b2JrfBVZLHvTFJ9W8A0SABlHAiqx3q708SCdp9ssKQ
	 Z+oWE5ooQiEGwdw7VnCP6ETtOm/COox+tWmzbfzyscqjsJXdCbnak/0k49hNQpBMZ8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqUuHBUC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD85C606EE83;
	Thu,  5 Nov 2026 10:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqUuHBUC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CAE01F00A27;
	Thu,  5 Nov 2026 10:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793873307;
	bh=0+bSVnye4AoypsNrx6qUnH37BwoJnOF78GglImy6ss8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MqUuHBUCKTlByTkVzwsdawugv0c+T9VpornOia5XgXH2VvTdw749N5AKsfzIZ3Iw1
	 vAuBZvNNNBJlTtYxDQ039bhj90K4Z0tsZiwom+26ivKnLoe989eMw6952vLxqhnIxB
	 XLE6aKRonh0i1iUi4ilyMbOHlPTIvEOOyKvRLzZ+NST7QUFSFIEE5s6+1CUb2I95Ke
	 lmkedZT4DyqLJfsuCx41jfnHkXgUHsEyA551iEf2cHZd3dFP9DdFNUZgreAw5FCdtC
	 dvuRP2NNZdv/Pz0xGlrEGzoYRD91aaI0YUrNdf6Zsy/zuxfoF6an+hBHPFNvGsHeR7
	 mADhTr2KN32WA==
Subject: Re: [PATCH net v2] selftests: drv-net: pause: Avoid cleanup failures
 for unsupported link settings
From: netdev-bot+sashiko@kernel.org
To: mohsin.bashr@gmail.com
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 maxime.chevallier@bootlin.com
Date: Thu, 05 Nov 2026 10:08:26 +0000
Message-ID: <179387330655.488856.2246156256257342362@kernel.org>
In-Reply-To: <20261103190622.3981970-1-mohsin.bashr@gmail.com>
References: <20261103190622.3981970-1-mohsin.bashr@gmail.com>
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

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete: the same cleanup failure still happens on
  the link-autoneg-on branch of pause_setup() in…
- [Low] In pause_setup()
  (tools/testing/selftests/drivers/net/hw/pause.py, local lines 410-414,…

--

selftests: drv-net: pause: Avoid cleanup failures for unsupported link settings

This patch changes pause_setup() so that the forced-link restore is queued
only after setup has successfully enabled link autonegotiation. The goal is
to avoid EOPNOTSUPP cleanup failures on devices such as fbnic. It also makes
pause_test_support() fall back to checking forced MAC pause on the current
link when no link configuration change is accepted.

> diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
> index ca4a55e59c30f..99ce6a59dfcd6 100755
> --- a/tools/testing/selftests/drivers/net/hw/pause.py
> +++ b/tools/testing/selftests/drivers/net/hw/pause.py
> @@ -404,14 +404,14 @@ def pause_setup(cfg):
>  
>      if link["auto-negotiation"]:
>          defer(cmd, f"ethtool -s {cfg.ifname} autoneg on")

[Severity: High]
Can the same cleanup failure still happen on this branch?

This restore is still queued whenever the device reports link autoneg on,
even when setup never changes the link. The remote interface has the same
unconditional defer further down in pause_setup().

When the driver has no set_link_ksettings, ethnl_set_linkmodes_validate()
rejects every LINKMODES_SET before it checks for a no-op:

net/ethtool/linkmodes.c:ethnl_set_linkmodes_validate() {
    ...
	if (!ops->get_link_ksettings || !ops->set_link_ksettings)
		return -EOPNOTSUPP;
    ...
}

That means a restore to the same autoneg on value also fails with
EOPNOTSUPP.

Some in-tree drivers report autoneg on and provide only get_link_ksettings.
nicvf_get_link_ksettings() sets cmd->base.autoneg = AUTONEG_ENABLE.
be_get_link_ksettings() does the same when auto speeds are supported.
fbnic also has get_link_ksettings and no set_link_ksettings.

On these devices pause_test_support() takes the new "current link"
fallback. The deferred "ethtool -s <if> autoneg on" then fails in
ksft_flush_defer() and the test ends in a cleanup failure. The subject
line says the patch avoids exactly this.

Every other test that calls pause_setup() would hit it too, because the
defer is flushed even when the test skips.

Dropping the autoneg on restore isn't an option, since pause_test_support()
and pause_autoneg_link_autoneg() force the link and rely on it. Would it
work to queue the restore only where a link change is accepted? One place
is after a successful "autoneg off {forced}" in pause_test_support().
Another option is to let the restore tolerate EOPNOTSUPP.

>  
>      # Local interface admin up, link aneg on
>      ip(f"link set {cfg.ifname} up")
>      if link["supports-auto-negotiation"] and not link["auto-negotiation"]:
>          ethtool(f"-s {cfg.ifname} autoneg on")
> +        if "speed" in link and "duplex" in link:
> +            defer(cmd, f"ethtool -s {cfg.ifname} autoneg off speed {link['speed']} "
> +                       f"duplex {link['duplex'].lower()}")

[Severity: Low]
Could this leave a forced link in autoneg state if the ethtool call fails
partway through?

ethtool() raises on a non-zero exit. With the defer now registered after
the call, nothing restores the original forced speed/duplex if the driver
commits part of the change and then returns an error.

bnxt_set_link_ksettings() is one example. It sets
link_info->autoneg |= BNXT_AUTONEG_SPEED before calling
bnxt_hwrm_set_link_setting(), and returns that call's error without
rolling back.

This branch only runs when the device supports autoneg. Would queuing the
restore just before the ethtool call still avoid the fbnic cleanup
failure? The same ordering applies to the remote interface later in
pause_setup().

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261103190622.3981970-1-mohsin.bashr%40gmail.com

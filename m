Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248054;
	b=PidUpEdFANV1bWOoIkCCJnIT8L2OJlA8+pN5lZajSrSp8fMDbuRfXca20dp9FETsG4bD
	 D+S7fR0b9dKBAXilJyAInxygWv2ZRJdGi2iDEqWPrwyti7wJZS6mA94N66AJyIxkLGMSP
	 KbPURfcsN27NibsEPVRJZJkYb8pwA7JlpB+ZvL9t9e7itAajwJk3b2j/rgpVlWDEGxxNC
	 5U94BsEDSqWzFCLe3rHCP7iSM42pikU9PSlcX6w2KvuVEejIP4EndbTS2NmOP79oT2gn3
	 YnPb7Za/0HUxEgJEvfNgywDWJ1gSC29qxsY6frpaaKSp/SW28v5/v5O4B1PULzJWQGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248054;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=xwy+2r8bTpWrthlernlSPIRC66s07j9xT0nzJWOV+4w=;
	b=I39h0ErItX8BeB/eLC254RO5xaaizt+hJ+W8QEEmPWI3hc5gyDx9/ArTB5vvTQrIf4sJ
	 OlgdghfxnewkbWi1T1KBGdh6TGJ3PFxuM/EJboIplVtBcCDxfEXj/iJ/jDkYtM4N1X//f
	 F1WmDF/4lHTHic2EPyU7uSSE2GhozZ/twO3CbjBS6Scg1jq5pf7LikfHZ8zvdeDIEvHNn
	 8KniQj70X+X1L6naf7nq9bumJY/QtSYkDvQCXckBUwUkQskgS253IS1BBhCjz0Xeo1RM/
	 4uTxnglqI2AW6pmuU3CpmaXpAnKwjF7J0llVX7ptlPpboPPtTZw7TeN9T+jsBvrnH4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="meFjm7/P";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43567606A31C;
	Mon,  9 Nov 2026 18:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=meFjm7/P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1AF1F0089F;
	Mon,  9 Nov 2026 18:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794248053;
	bh=xwy+2r8bTpWrthlernlSPIRC66s07j9xT0nzJWOV+4w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=meFjm7/PP0eMsP1X0sOtR5ZRlCnkjoLiSIgfIACW4O+IAbY7acgeDWgn7C06GgeRu
	 MtoK0ENnGL2UXCVZ3+1dZEF3osj869XiO4fDIbGeAnYwl23rZuHMw+3IMtgyr5/8DF
	 MBN7l+sEN2+tE4QW5yaFOd1YMvcFshCEyYWE00he8Nc4/htkGP17w67ZHYc88pz/Qf
	 4S3jXmYPoaFGPoAC/54SsGLTQIpn5s+DzIwOwrQxxrp0SKwgd1wu8b0F0xNlDwWmMN
	 9ORB3QkUwCwU+qDKYwWKZyHkjo1FNzVLxxeiOY46kTybx5XAisq3oo+3Ejt37D4yxP
	 cYvKAV7Skd2QA==
Subject: Re: [PATCH net-next 1/3] selftests: drv-net: hds: always restore
 tcp-data-split to auto
From: netdev-bot+sashiko@kernel.org
To: dimitri.daskalakis1@gmail.com
Cc: davem@davemloft.net, andrew+netdev@lunn.ch, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Mon, 09 Nov 2026 18:14:12 +0000
Message-ID: <179424805285.994134.5389999211002090081@kernel.org>
In-Reply-To: <20261106031208.465456-2-dimitri.daskalakis1@gmail.com>
References: <20261106031208.465456-2-dimitri.daskalakis1@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new guard in _hds_reset()
  (tools/testing/selftests/drivers/net/hds.py:68) is `if 'tcp-data-…
- [Medium] _hds_reset() now writes tcp-data-split='unknown' whenever the
  attribute was in the baseline snapshot.
- [Low] The commit message does not match the code or the tree: (1) The
  subject says 'always restore tcp-data-split to auto', but _hds_reset()…

--

selftests: drv-net: hds: always restore tcp-data-split to auto

This changes _hds_reset() in the hds.py selftest so that tcp-data-split is
reset to "unknown" whenever the attribute was in the saved ring snapshot.
Before, the reset only happened when the reported value had changed. The
reason given is that bnxt and mlx5 report the current HDS state rather than
the configured value.

> selftests: drv-net: hds: always restore tcp-data-split to auto

[Severity: Low]
The subject says "always", but the reset only runs when the baseline
snapshot contained the attribute:

    if 'tcp-data-split' in rings:

The body's "when it was reported" qualifier is the case that leaves mlx5
unrestored in this tree (see the _hds_reset() comment below).

> mlx5 will report enabled or disabled based on whether
> SHAMPO is active, and an explicit "disabled" keeps HW-GRO off.

Is this describing a pending mlx5 change? In this tree
mlx5e_ethtool_get_ringparam() never sets kernel_param->tcp_data_split. That
means this selftest change seems to depend on a driver patch that isn't
named.

Could the dependency be stated, so the patches get ordered correctly?

Should this also have a Fixes: tag? The conditional reset came in with:

Fixes: ee3ae27721fb ("selftests: drv-net: hds: restore hds settings")

and the leak already happens without the mlx5 change. On netdevsim,
nsim_get_ringparam() reports ENABLED when hds_config is UNKNOWN:

drivers/net/netdevsim/ethtool.c:nsim_get_ringparam() {
    ...
	if (dev->cfg->hds_config == ETHTOOL_TCP_DATA_SPLIT_UNKNOWN)
		kernel_ring->tcp_data_split = ETHTOOL_TCP_DATA_SPLIT_ENABLED;
    ...
}

So after set_hds_enable, the old code sees cur == rings and skips the
reset, which leaves hds_config at ENABLED. bnxt_get_ringparam() reports the
BNXT_FLAG_AGG_RINGS state, so the same leak happens there whenever TPA keeps
the agg rings on.

> diff --git a/tools/testing/selftests/drivers/net/hds.py b/tools/testing/selftests/drivers/net/hds.py
> index 606e26d75951f..af34dc9ce7499 100755
> --- a/tools/testing/selftests/drivers/net/hds.py
> +++ b/tools/testing/selftests/drivers/net/hds.py
> @@ -65,13 +65,13 @@ def _hds_reset(cfg, netnl, rings) -> None:
>      cur = netnl.rings_get({'header': {'dev-index': cfg.ifindex}})
>  
>      arg = {'header': {'dev-index': cfg.ifindex}}
> -    if cur.get('tcp-data-split') != rings.get('tcp-data-split'):
> +    if 'tcp-data-split' in rings:

[Severity: High]
Does this new check skip the restore in the exact mlx5 case the commit
message describes?

In this tree mlx5e_ethtool_get_ringparam() never sets
kernel_param->tcp_data_split. So rings_prepare_data() reports
dev->cfg->hds_config, which defaults to ETHTOOL_TCP_DATA_SPLIT_UNKNOWN (0).
rings_fill_reply() only emits the attribute when the value is non-zero:

net/ethtool/rings.c:rings_fill_reply() {
    ...
	    (kr->tcp_data_split &&
	     (nla_put_u8(skb, ETHTOOL_A_RINGS_TCP_DATA_SPLIT,
    ...
}

That leaves the snapshot taken in _defer_reset_hds() without a
'tcp-data-split' key. mlx5 does report 'hds-thresh', so _defer_reset_hds()
still registers _hds_reset().

After set_hds_disable, hds_config is DISABLED. In the cleanup the new check
is false and hds-thresh is unchanged. len(arg) is 1, so rings_set is never
called and the device stays explicitly "disabled".

After set_hds_enable it stays "enabled", and mlx5e_fix_features() then
forces HW-GRO on:

	if (cfg && cfg->hds_config == ETHTOOL_TCP_DATA_SPLIT_ENABLED &&
	    !(features & NETIF_F_GRO_HW)) {

The old condition did send "unknown" in this case, since cur 'disabled'
differs from rings None. It then hit a KeyError on cur['tcp-data-split'].
With this patch the restore is silently skipped instead.

The fix only works if mlx5 always reports tcp-data-split, and that driver
change isn't in this tree. Would something like this cover both cases?

    if 'tcp-data-split' in rings or 'tcp-data-split' in cur:

The later comparison would also use .get() on both sides, so that a
missing attribute means "unknown".

>          # Try to reset to "unknown" first, we don't know if the setting
>          # was the default or user chose it. Default seems more likely.
>          arg['tcp-data-split'] = "unknown"
>          netnl.rings_set(arg)
>          cur = netnl.rings_get({'header': {'dev-index': cfg.ifindex}})
> -        if cur['tcp-data-split'] == rings['tcp-data-split']:
> +        if cur.get('tcp-data-split') == rings['tcp-data-split']:
>              del arg['tcp-data-split']

[Severity: Medium]
Can this replace an explicit tcp-data-split=enabled, set before the test
ran, with UNKNOWN?

With the new check, "unknown" is written for every test that calls
_defer_reset_hds(). That includes the tests that only touch hds-thresh
(set_hds_thresh_random, set_hds_thresh_zero, set_hds_thresh_max,
set_hds_thresh_gt) and tests that skip early. Whether to keep "unknown" is
then decided by comparing reported values, which can match even when the
configured values differ.

On netdevsim, nsim_get_ringparam() reports ENABLED for both UNKNOWN and an
explicit ENABLED. Say hds_config was ENABLED before the test:

  - ethnl_set_rings() commits hds_config = UNKNOWN
  - the re-read returns 'enabled', which matches the snapshot
  - the del runs, and the device is left at UNKNOWN

On bnxt, writing UNKNOWN clears the flag in bnxt_set_ringparam():

		else if (tcp_data_split == ETHTOOL_TCP_DATA_SPLIT_UNKNOWN)
			bp->flags &= ~BNXT_FLAG_HDS;

If TPA keeps the agg rings active, bnxt_get_ringparam() still reports
ENABLED, so the explicit HDS setting is dropped.

Before this patch, cur == rings in those tests, so tcp-data-split was never
written. Memory-provider binding requires an explicit ENABLED:

net/core/netdev_rx_queue.c:
	if (dev->cfg->hds_config != ETHTOOL_TCP_DATA_SPLIT_ENABLED) {
		NL_SET_ERR_MSG(extack, "tcp-data-split is disabled");
		return -EINVAL;

After running hds.py, a devmem or io_uring zcrx setup that had explicitly
enabled HDS would no longer be able to bind.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106031208.465456-1-dimitri.daskalakis1%40gmail.com

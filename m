Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E574E0B63;
	Tue, 22 Sep 2026 12:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078512; cv=none; b=XeIfqE3YHnvo6XxlomWQWG7Zit+rJAMXExrn7/2zR5FCNXPQFE9u03hoPD297B+e3LkfKL9LOB17Zk3XGOcupU8ZAY44ZDs16SxFq8tKPtWApFCQ9EDjm+LU5HA2VHJvuLJHmjfiNhaqikMtR3xHO6Bc6vNaNGl8ZxLZsxEtogc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078512; c=relaxed/simple;
	bh=95S3V5+vI0rbCT6+PAtnrR4unwZRVWia0i/Kr5LSaQ0=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eok0aO7s6GgqQx4f58nBw8JW45E8Pukws67nMAfuw5p1EeRw68KnzzJ+sSIZRzhZXKaxoRA+A1ElOQv9I5jDFNSHV720gmaGqSu0uw8mgmLGrl3dIku1jzGCu/8mZqpEwVJBLwMkeEi2m6Aj6NRAn5lgsfQz/unCQH+9tQ1zZ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dk6F/vEV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dk6F/vEV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 603071F00898;
	Tue, 22 Sep 2026 12:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790078511;
	bh=Kds8JbMZPWooK0BCcIhbxnKHotJjxiX6A56WabKUx5g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dk6F/vEVdxQAf2/Rje3VhT6eOMWMsGD4i7E4Hlk2ms0P229iCw+DvW6jrGxENlbf/
	 984+YRPN5JG4LLKVfUwgNZWk7LLcMOKD7k7vrwYtPNoU616EzEYEv96zPMTuGMZUlz
	 LLPUPKF7B7murPMu+W4mXMY2A4PBf/Sttz413CMca6hl9dSqJ50OSEc15VK09I6pZu
	 mk4xjNQuYX8A1pYt8fYSOTGp6W2d5G6Gd3GZJgc2IH+hEWro9m1cbtX3pIXYuVodqw
	 RxGrw3K/k7tk8HpcHm4v/C5T2l4mV3nZWUeLUvGNSIuWlZQmyZEacHbz/bxR1Dcb1C
	 zdjuo+PinagMQ==
Subject: Re: [PATCH net-next v2 2/3] selftests: drv-net: Check the features
 set by set_ethtool_feat()
From: netdev-bot+sashiko@kernel.org
To: ovidiu.panait.rb@renesas.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, nb@tipi-net.de,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Tue, 22 Sep 2026 12:01:49 +0000
Message-ID: <179007850985.2160803.6821263866052929617@kernel.org>
In-Reply-To: <20260918112529.96039-3-ovidiu.panait.rb@renesas.com>
References: <20260918112529.96039-3-ovidiu.panait.rb@renesas.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In gro_lib._setup() the "hw" mode passes check=False to
  set_ethtool_feat(), which disables the newly added read-back for the…
- [Medium] The read-back verification added to the shared helper
  set_ethtool_feat() (drivers/net/lib/py/feat.py:40-43) is not mirrored…

--

selftests: drv-net: Check the features set by set_ethtool_feat()

This adds a read-back of the device features after running ethtool -K in
set_ethtool_feat(), raising KsftXfailEx when the requested state was not
applied.  A new check parameter allows callers to skip the verification, and
the GRO "hw" setup mode in gro_lib.py uses it.

> diff --git a/tools/testing/selftests/drivers/net/gro_lib.py b/tools/testing/selftests/drivers/net/gro_lib.py
> index 7856ebdd49d3..875a715b2ae1 100644
> --- a/tools/testing/selftests/drivers/net/gro_lib.py
> +++ b/tools/testing/selftests/drivers/net/gro_lib.py
> @@ -263,7 +263,8 @@ def _setup(cfg, mode, test_name):
>          set_ethtool_feat(cfg.ifname, cfg.feat,
>                           {"generic-receive-offload": False,
>                            "rx-gro-hw": True,
> -                          "large-receive-offload": False})
> +                          "large-receive-offload": False},
> +                          check=False)

[Severity: Medium]
The commit message justifies skipping the check only for rx-gro-hw ("the
GRO "hw" mode handles the case where HW GRO is cleared by the driver"), but
check=False disables verification for all three features in this request.

The follow-up read-back in _setup() only looks at rx-gro-hw:

        feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
        if not feat["rx-gro-hw"]["active"]:
            ksft_pr("Driver clears HW GRO and SW GRO is cleared, using generic XDP workaround")

so generic-receive-offload is never verified in this path.  If a driver
accepts rx-gro-hw but leaves SW GRO active, the XDP generic workaround
branch is not taken (it only runs when rx-gro-hw is inactive) and the
gro_hw.py tests then run with SW GRO enabled, which can coalesce in
software and pass even when the hardware offload does nothing.  Isn't that
the same "test could run with a different configuration than the requested
one" case the patch is meant to catch?

Note that for the third feature the kernel does enforce the requested
state, netdev_fix_features() drops LRO when HW GRO is requested:

	if ((features & NETIF_F_GRO_HW) && (features & NETIF_F_LRO)) {
		netdev_dbg(dev, "Dropping LRO feature since HW-GRO is requested.\n");
		features &= ~NETIF_F_LRO;

but there is no equivalent rule tying generic GRO to HW GRO.  Would a
per-feature exemption (skip verification of rx-gro-hw only) instead of the
all-or-nothing boolean work here?

> diff --git a/tools/testing/selftests/drivers/net/lib/py/feat.py b/tools/testing/selftests/drivers/net/lib/py/feat.py
> index b94a24214e59..f0630844f023 100644
> --- a/tools/testing/selftests/drivers/net/lib/py/feat.py
> +++ b/tools/testing/selftests/drivers/net/lib/py/feat.py
> @@ -33,3 +33,11 @@ def set_ethtool_feat(dev, current, feats, host=None):
>      # If ethtool printed something kernel must have modified some features
>      if eth_cmd.stdout:
>          ksft_pr(eth_cmd)
> +
> +    if not check:
> +        return
> +
> +    current = ethtool(f"-k {dev}", json=True, host=host)[0]
> +    for name, state in feats.items():
> +        if current[name]["active"] != state:
> +            raise KsftXfailEx(f"{name} was not set to {s2n[state]}")

[Severity: Medium]
Should the private copy of this helper in
tools/testing/selftests/drivers/net/hw/gro_stats.py be converted as well?

After this series the tree carries two copies of the same ethtool -K helper
with different semantics.  _set_ethtool_feat() in gro_stats.py still ends
with no read-back:

    eth_cmd = ethtool(" ".join(new))
    defer(ethtool, " ".join(old))

    # If ethtool printed something kernel must have modified some features
    if eth_cmd.stdout:
        ksft_pr(eth_cmd)

and it raises KsftSkipEx for fixed features where the shared helper raises
KsftXfailEx.

_setup_hw_gro() in gro_stats.py repeats the gro_lib.py "hw" logic including
the XDP generic workaround, and its final request is unverified:

        _set_ethtool_feat(cfg, feat,
                          {"generic-receive-offload": True,
                           "rx-gro-hw": True,
                           "large-receive-offload": False})

so the HW GRO qstats assertions that follow can run with rx-gro-hw
inactive, and the resulting delta mismatch gives no hint about the real
cause.  drivers/net/hw/lib/py/__init__.py already imports and re-exports
the shared set_ethtool_feat, so is there a reason the consolidation done in
the earlier "selftests: drv-net: Move _set_ethtool_feat() into lib" patch
stops short of this file?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260918112529.96039-1-ovidiu.panait.rb%40renesas.com

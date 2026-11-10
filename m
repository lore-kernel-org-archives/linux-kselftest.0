Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324446;
	b=k+VdSIFp0KWLwyVOMd8mw3JnsUUW1zo3zO+1Icit3qoXDhzpuc+AjVG/8n2Klm4lDSKS
	 VPxOW7HeaSrcsnQAu45Qt9Y0mybVFvttJgc0w8Cb8yC+mHbWsTE3weSW6zzsSP0Uwnmh6
	 gXZESi8sVW1mphENVDTvXwK41k9Yy7rSCAlsIkXKhxakinPRJ06yWUwJKYbXzIYfe58MH
	 bJQAs4cvIeyQDrYvQ99D0ebj4PlVcVmoVyP9t3AoW1fvrvrJNcYnHuCL2St6rtKcjIYEx
	 F/oJYbCsdnOwKr/fgFjTmO+bFjI4n/1uOLqs/tfgkMBKknK6njwG65jv9ZNtttFL4Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324446;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+3CeEODRSsaJx7luOoBPEtT+sSv1koHnkpRv0Or9SAM=;
	b=zf5TlDV8YAS+JiTbzX/lZKg3r1FH/e7V65UMd8MlUERF36sKUNQ/yv03LIKxlnY+J6Ay
	 pWcH20edyYd91R39RVC3ETUpd/dY1EKlge2AlZ6y213cstBeYkkORUvlRtvKUDV3X4fIO
	 4b2EDC6fo6KDtN3JEwB9wpOZzebmgmTZme5bIw15ZhhgLLAaBpzAmXIcDlJUZ1PJTm3/H
	 lpaSb7P+giLZBWhoI7UxkKWwt/qVRFaLFU/vYwVB3iUFLcoCfkIdkwBBrhqYnR8F0yS2s
	 3dHSEwOyrwdAe61dEQiz3Q8nRkYU2rQ4xGB1JinIMMJcoGHrqAfG0mGtSyQg97S9ogA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QCpbr/1o";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEF9606A31C;
	Tue, 10 Nov 2026 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QCpbr/1o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3527A1F0089F;
	Tue, 10 Nov 2026 15:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794324445;
	bh=+3CeEODRSsaJx7luOoBPEtT+sSv1koHnkpRv0Or9SAM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QCpbr/1oJmrwVEJ7mJUL4nFx5020OqvYhJt+S58+ZW/ETK7mgr/DOiOmv0psrUcyt
	 FZ5E8DrTXxV4T1f7nv4ag1GkFop96paMw60tyAtq1Obvy9i1dVdg8Oh+7OVBhX/IR0
	 C7ssP4f1lome6ED4Cea4cJdPnl8YtqBBcTeMOxBMQcrcuMd/7WArV62DwG+9jtvWWu
	 yPHrnLajX4+owN4OJru65OiD198ELUaB/j1kXuWtLz7pK8zhyOigMCCS6491T4+BeZ
	 2AKsoI6CMg5+t85RhULeGVmetw/8LIXUaZ5HK2vjA+a2gi88orclXIygDxg3G8QcWd
	 /yKotc/Y0F6DQ==
Subject: Re: [PATCH net 1/2] selftests: drv-net: ring_reconfig: handle devices
 without channel config
From: netdev-bot+sashiko@kernel.org
To: ahmetbilalyazicioglu@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 hmohsin@meta.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 15:27:24 +0000
Message-ID: <179432444472.994134.2763803571159924115@kernel.org>
In-Reply-To: <20261106150509.30458-2-ahmetbilalyazicioglu@gmail.com>
References: <20261106150509.30458-2-ahmetbilalyazicioglu@gmail.com>
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

- [Medium] _configure_min_ring_cnt() in
  tools/testing/selftests/drivers/net/ring_reconfig.py now catches…

--

selftests: drv-net: ring_reconfig: handle devices without channel config

This patch handles drivers that don't implement get_channels (e.g. e1000e)
in ring_reconfig.py. When channels_get returns EOPNOTSUPP, channels() is
now skipped and _configure_min_ring_cnt() returns early. Other netlink
errors are still reported as failures.

> diff --git a/tools/testing/selftests/drivers/net/ring_reconfig.py b/tools/testing/selftests/drivers/net/ring_reconfig.py
> index 6682d4badfbfc..baac20e8d3eba 100755
> --- a/tools/testing/selftests/drivers/net/ring_reconfig.py
> +++ b/tools/testing/selftests/drivers/net/ring_reconfig.py

[ ... ]

> @@ -88,7 +99,14 @@ def channels(cfg) -> None:
>  def _configure_min_ring_cnt(cfg) -> None:
>      """ Try to configure a single Rx/Tx ring. """
>      ehdr = {'header':{'dev-index': cfg.ifindex}}
> -    chans = cfg.eth.channels_get(ehdr)
> +    try:
> +        chans = cfg.eth.channels_get(ehdr)
> +    except NlError as e:
> +        # Reducing the channel count is only an optimization
> +        if e.error == errno.EOPNOTSUPP:
> +            ksft_pr("Channel configuration unsupported; continuing ring test")
> +            return
> +        raise

[Severity: Medium]
This catches EOPNOTSUPP from channels_get, but what about drivers that
implement get_channels but not set_channels? Further down in
_configure_min_ring_cnt() the set call is still unguarded:

    if chans.get('combined-count', 0) > 1:
        config['combined-count'] = 1
    elif chans.get('rx-count', 0) > 1 and chans.get('tx-count', 0) > 1:
        ...

    cfg.eth.channels_set(ehdr | config)
    defer(cfg.eth.channels_set, ehdr | restore)

On the kernel side, CHANNELS_SET is rejected unless both ops are present:

net/ethtool/channels.c:ethnl_set_channels_validate() {
    ...
	return ops->get_channels && ops->set_channels ? 1 : -EOPNOTSUPP;
}

vmxnet3 is one in-tree example. Its ethtool ops set only
.get_channels = vmxnet3_get_channels, and in MSI-X buddy-share mode
vmxnet3_get_channels() reports combined_count = num_tx_queues, which can
be greater than 1.

On such a device channels_get succeeds, so the new early return never
runs. channels_set then raises NlError(95), which propagates out of
_configure_min_ring_cnt() and ringparam(). That means ringparam() fails
before any ring size is tested, which is the symptom the commit message
says this patch fixes.

The comment here says reducing the channel count is only an optimization.
Wouldn't that reasoning also apply to a failed channels_set? Could the
channels_set call get the same handling, i.e. log with ksft_pr() and
return on EOPNOTSUPP before registering the defer?

The later patch in this series ("selftests: drv-net: ring_reconfig: skip
tx stall test without channel config") only changes reconfig_tx_stall(),
so this case still fails after the full series is applied.

>  
>      all_keys = ["rx-count", "tx-count", "combined-count"]
>      restore = {}

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106150509.30458-1-ahmetbilalyazicioglu%40gmail.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409967;
	b=I7AFhN/swDwUYhg3M/SYA+Mo/tQ2hefezi3tSxNbMNleXxitnzkdB5JVSH/3g9G/1Dj0
	 ZfXj0ficBUowbkRKRK1l/aIKZmPO7OOj7Mgb8YKPlc4iJoLGwdWRCwsJwD4oACV5NkV2H
	 Vkb9wGyXn8s1umFR8kn8xCMWFEsZHl+NCpQ+x+2A5KNG8vF20uW+IxOe4jbSLPT52Oh+A
	 dPYvprtk7O/ZEt4pT3O/sK+HkWACx5MKe+CYsv1mGvrZYUCojQLPWrIxxwA5E9PksnKyR
	 iQ+awpJI40OGTlVNZNGCbjIuW8YqeZFRKG3OMWnWum/LB1m2dqxndtiaggMpNoTXs0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409967;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=12/V21cRgqLkRyvE62vUvJkuMaP2PVaU1/FHz0gk7mU=;
	b=SFt4V2UCYpgKQwTK4uWDy2jtmkEZCAopEDmASsCzPtZGQ17nzpeFQgz4CJxLflb+pvSm
	 CF+J2K3+qQwO39MAzu/5/2y8djCHbTpjySnCpL9Ar/fqPrpzdrGYZ2LAMFMWqrLQcCjU6
	 Hsj2YPUuvVKRoTezu/huoUBuKTkKlKyOAliKeUPmuiHMR5hV/2arKi4N2SuJNc9XC75FX
	 USlwkIocJQ4BByB/xX60S6ootnpg/XrikM530Q5QHqIFRy/tZT7wutOFCqo7y5t1FsEoz
	 owmHarPUh7XzNfchTDvREJl1w0ATITkL07992Z+dkMR1rp0FjcwnnSSECvwLUwNTesw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQOHo91I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C807606A33F;
	Mon, 23 Nov 2026 04:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQOHo91I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973061F000D8;
	Mon, 23 Nov 2026 04:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795409967;
	bh=12/V21cRgqLkRyvE62vUvJkuMaP2PVaU1/FHz0gk7mU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eQOHo91IO12lXHpL3bwQxj81Q5SoG1XDdFpHZDWrRMzOebNFFdu+h2Np8158KqtmJ
	 l31bJsGK0uh0FbJnAH5toJi/mXc3F/qoPAbsHTdWkZbEDqcCJm52P105Html0dqgzl
	 ypSjl5IVdBiB+XTrk+CmTWSbpGett5HXYu5m1mnJIM4y2Drl3DGFgJlp+IUfXdJrHq
	 TItfRoej6Ry7rNe+m0RZXUNawUVCUKkkY0CdRMSZlDSwF6wrjHhxh14NJe0Hg/rPRH
	 sQ1Pl0HCWfXaPNH0H72AwL7WR3jAiW+mNV04sr5i2/OoBeaXZXDPd+lhP2N9zJcCRz
	 Xn25QpAZOQCAQ==
Subject: Re: [PATCH net-next v4 5/7] net: devmem: always populate bind_dev and
 detach both devices on unregister
From: netdev-bot+sashiko@kernel.org
To: almasrymina@google.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, bestswngs@gmail.com, daniel@iogearbox.net,
 razor@blackwall.org, dw@davidwei.uk, sdf.kernel@gmail.com,
 bobbyeshleman@meta.com, dtatulea@nvidia.com
Date: Mon, 23 Nov 2026 04:59:26 +0000
Message-ID: <179540996620.3135.3612533688050456273@kernel.org>
In-Reply-To: <20261120045918.1239746-6-almasrymina@google.com>
References: <20261120045918.1239746-6-almasrymina@google.com>
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

- [Medium] Undisclosed user-visible behaviour change for leased TX
  bindings.
- [Low] The commit message presents this patch as fixing 'issues' found
  by AI review of the earlier devmem unregister series, 'confirmed by…

--

net: devmem: always populate bind_dev and detach both devices on unregister

This patch always sets binding->bind_dev to the device that bind-rx or
bind-tx was called on. Socket teardown, queue close and queue uninstall
now use bind_dev, and net_devmem_dev_unregister() handles bind_dev and
map_dev separately, calling synchronize_net() before unmapping when
map_dev unregisters. net_devmem_get_binding() also now requires map_dev
to be non-NULL.

> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 6f85b90950f8b..80c3e149cd762 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c

[ ... ]

> @@ -252,20 +255,33 @@ void net_devmem_dev_unregister(struct net_device *dev)
>  
>  	xa_lock(&net_devmem_dmabuf_bindings);
>  	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
> -		if (binding->direction == DMA_FROM_DEVICE) {
> -			if (READ_ONCE(binding->map_dev) != dev ||
> -			    xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
> -					NET_DEVMEM_BINDING_LIVE))
> -				continue;
> -		} else {
> -			if (READ_ONCE(binding->bind_dev) == dev)
> +		if (READ_ONCE(binding->bind_dev) == dev) {
> +			__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
> +					NET_DEVMEM_BINDING_LIVE);
> +			if (xa_empty(&binding->bound_rxqs) ||
> +			    !netif_is_queue_leasee(dev))
>  				WRITE_ONCE(binding->bind_dev, NULL);
> -			if (READ_ONCE(binding->map_dev) != dev)
> -				continue;
> -			WRITE_ONCE(binding->bind_dev, NULL);
> +		}

[Severity: Medium]
Does this change what happens to leased TX bindings when only the virtual
device goes away?

If bind-tx is called on a netkit device, netdev_find_netmem_tx_dev()
picks the physical NIC as map_dev, and bind_dev is now the netkit device.
When the netkit device is deleted and the physical NIC stays registered,
this first walk matches bind_dev == dev and clears
NET_DEVMEM_BINDING_LIVE.

After that, net_devmem_get_binding() fails here:

	binding = xa_find(&net_devmem_dmabuf_bindings, &xa_idx, dmabuf_id,
			  NET_DEVMEM_BINDING_LIVE);

So every later devmem sendmsg with that dmabuf id returns -EINVAL, even
when dst_dev == map_dev.

Before this patch, the code from ede1618064a9 ("net: devmem: detach TX
bindings on NETDEV_UNREGISTER") only cleared the virtual device pointer in
this case and left the binding live. That commit gave its reason as "only
clear binding->vdev so no new TX sends match the virtual device while
allowing in-flight TX packets on binding->dev to finish DMA safely".

TX bindings have an empty bound_rxqs, so bind_dev is cleared here anyway.
net_devmem_get_binding() would then only match map_dev. Does correctness
need the LIVE mark to be cleared in this case?

If the change is intended, could the commit message say that it reverses
the earlier design, and why? Right now it only says "first walk the
bindings to clear NET_DEVMEM_BINDING_LIVE to stop new lookups".

The same goes for the synchronize_net() added further down for the
map_dev case. ede1618064a9 said a grace period was not needed there.

This behaviour is still the same at the end of the series. The selftest
added later in the series (devmem_lease_bind_tx_unregister_check with
remove_virt_first) only checks the dmabuf attach count. It does not check
whether sends through the physical device still work.

[ ... ]

> @@ -568,9 +584,10 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
>  	 * net_device.
>  	 */
>  	dst_dev = dst_dev_rcu(dst);
> -	if (unlikely(!dst_dev) ||
> -	    unlikely(dst_dev != READ_ONCE(binding->map_dev) &&
> -		     dst_dev != READ_ONCE(binding->bind_dev))) {
> +	map_dev = READ_ONCE(binding->map_dev);
> +	if (unlikely(!dst_dev || !map_dev ||
> +		     (dst_dev != map_dev &&
> +		      dst_dev != READ_ONCE(binding->bind_dev)))) {
>  		err = -ENODEV;
>  		goto out_unlock;
>  	}

[Severity: Low]
The commit message describes this check as:

    - Require binding->map_dev to remain non-NULL in
      net_devmem_get_binding() so TX lookups fail once map_dev unregisters
      even if bind_dev is still registered.

Is that different from the baseline behaviour? Before this patch,
net_devmem_dev_unregister() already cleared NET_DEVMEM_BINDING_LIVE for
TX bindings when the physical device unregistered. Lookups already failed
at xa_find().

With this patch, map_dev is only cleared in net_devmem_dev_unregister(),
and only after LIVE is cleared and synchronize_net() returns. So the
!map_dev test looks like defence in depth rather than a fix.

The message also says "These issues were discovered during AI code review
(Sashiko) ... and confirmed by code inspection". It does not name a
concrete failure at baseline.

At this commit, netdev_nl_bind_rx_doit() still passes netdev as both
map_dev and bind_dev. The rework seems to mostly prepare for the next
patch, "net: devmem: resolve physical map_dev for leased RX bindings",
which fixes the actual use-after-free.

This patch rewrites logic from c4466d2c3e77 ("net: devmem: unmap dma_buf
synchronously on queue uninstall") and ede1618064a9 ("net: devmem: detach
TX bindings on NETDEV_UNREGISTER"). Both of those carry Fixes: tags.
Should this patch carry Fixes: tags too, so stable backporters know
whether it has to go with them?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120045918.1239746-1-almasrymina%40google.com

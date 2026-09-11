Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EA226ED37;
	Fri, 11 Sep 2026 18:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150620; cv=none; b=eIiFT9A/4IoBExmZlOMQa/Gv6jAd0Pl/UGt96wZXciN+9QpwuPkeUZck5iEJr4hXLumrmX44ogr+q3+XXoVlAxy0smN2Dr3MPhX7a2HAjXyHVeH9Fg2faB0mAl3hl/Ii22ngZnVb5G10Luk8y8cVttCQbf3b03FWh+E5a5TeL2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150620; c=relaxed/simple;
	bh=2mgFDUjbye0G2nwmkqeDpV3WGKw9k9KtH58MFw3YXJA=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CCWVPRP9B/hhvEPVxmLPWD610QPF79J1hj4e5w6wlXZqC1ekbogUvuS2mfwkUigWHbq5JEPwHkLJrHEcDh+Np43S4Ky8J1PJf+i1tjt/RMUBvYRXyQRvashTW6MhPaxJQxBqPZvvJvX4zkX4ptvsa3KONP7fsY2vjg4OWRejWMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsG+tP8j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsG+tP8j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72ABC1F000FF;
	Fri, 11 Sep 2026 18:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789150609;
	bh=Oy5ht02V67SMsL6ObO61SuJ2VWq3uiBqYswZKW/6MdM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PsG+tP8jNb+ZiU7q3DorE6RsuOIY53mTT5aYJ0BAI5bJIsp/ETpzC8AoDw7AwpGKi
	 FEKO4NLe4/mMoa7EWBnZH40FDYGkaFprOprnlrEPXHv846ElBiWcPvI2oukqDqdenj
	 A8gLDpB0lEYwvY8qEUbb1DhkhEfkXSfHVvUWtUKYc/cNB5aOSnB1EcWdk5VnQyK3uL
	 mqwvYSlpWcM8Qo8oN6kNvWfBWhPIyyy+75M+xwy3p4WggSR+gdpXXd0162FTM5EOI/
	 6QQHUmky6IXoXHLTZeNL7dlxMjs9mbs6AL504drMSPrgt7KwGGxV9FJXS+P9i2OTxf
	 i1WMDqYmsYM5g==
Subject: Re: [PATCH net-next v2 3/5] net: Revalidate queue config for
 ringparam changes
From: netdev-bot+sashiko@kernel.org
To: bjorn@kernel.org
Cc: alexanderduyck@fb.com, kuba@kernel.org, kernel-team@meta.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 daniel@iogearbox.net, mike.marciniszyn@gmail.com, mohsin.bashr@gmail.com,
 sdf@fomichev.me, bobbyeshleman@meta.com, daskald@meta.com,
 bestswngs@gmail.com, maxime.chevallier@bootlin.com, jacob.e.keller@intel.com,
 leitao@debian.org, cuitao@kylinos.cn, asml.silence@gmail.com, dw@davidwei.uk
Date: Fri, 11 Sep 2026 18:16:47 +0000
Message-ID: <178915060796.219967.9039776741140153103@kernel.org>
In-Reply-To: <20260910180908.1506533-4-bjorn@kernel.org>
References: <20260910180908.1506533-4-bjorn@kernel.org>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 4

- [Low] struct netdev_config.rings is zero-allocated by
  netdev_alloc_config() and netdev_qcfg_apply_dev() unconditionally…
- [Low] The commit message is framed as closing a live misconfiguration
  hole (naming fbnic's PPQ-entries-per-page behaviour), but in this…
- [Low] The values stored into dev->cfg->rings after ->set_ringparam()
  returns are the requested values, not necessarily the ones the…
- [Low] Both set paths validate the staged ring depths before calling
  ->set_ringparam(), then re-copy the driver-adjusted depths into…

--

net: Revalidate queue config for ringparam changes

This adds accepted RX/TX ring depths to struct netdev_config, stages
proposed values in dev->cfg_pending, and revalidates every RX queue
through ndo_validate_qcfg() before calling the driver's set_ringparam().
The ioctl and netlink ring-set paths are converted to the same
reconfiguration transaction.

Link: https://lore.kernel.org/all/20250421222827.283737-14-kuba@kernel.org/

A few questions below.

>     Memory-provider queue configuration is validated when the provider is
>     bound. A later ethtool ring change may invalidate it because drivers
>     can size queue memory from both ring depth and RX page size. For
>     example, fbnic uses multiple PPQ entries for each RX page larger than
>     PAGE_SIZE, which reduces the usable software ring depth.
[ ... ]
>     Use the same transaction for ioctl and netlink. Drivers without
>     ndo_validate_qcfg skip the new validation.

[Severity: Low]
The message reads as if it closes a live misconfiguration hole, but at this
commit no in-tree driver implements a ring-depth-aware ndo_validate_qcfg and
no driver reads qcfg->rx_ring_size, so netdev_queue_config_revalidate()
cannot change any validation outcome yet.

The two current ndo_validate_qcfg implementations, bnxt_validate_qcfg() and
mlx5e_queue_validate_qcfg(), only inspect qcfg->rx_page_size. The fbnic
consumer named in the message, fbnic_validate_qcfg() reading
qcfg->rx_jumbo_ring_size, arrives in the following patch of the series.

The last paragraph does disclose the limitation, so this is only about
framing: could the message state that this is core plumbing and that the
fbnic consumer lands in the next patch?

> diff --git a/include/net/netdev_queues.h b/include/net/netdev_queues.h
> index 70c9fe9e83cc4..31121900aac88 100644
> --- a/include/net/netdev_queues.h
> +++ b/include/net/netdev_queues.h
> @@ -4,18 +4,59 @@
>  
>  #include <linux/netdevice.h>
>  
> +/**
> + * struct netdev_ring_config - accepted RX/TX ring depth configuration
[ ... ]
> + * Note: these values are only used for queue-configuration validation
> + * today. Some drivers update their ring sizes without reflecting the change
> + * in @cfg. Before using the stored values for anything else, those cases
> + * need to be audited, and the core likely needs a driver notification API
> + * similar to ethtool_rxfh_context_lost().
> + */
> +struct netdev_ring_config {
> +	u32	rx_pending;
> +	u32	rx_mini_pending;
> +	u32	rx_jumbo_pending;
> +	u32	tx_pending;
> +};
> +
>  /**
>   * struct netdev_config - queue-related configuration for a netdev
>   * @hds_thresh:		HDS Threshold value.
>   * @hds_config:		HDS value from userspace.
> + * @rings:		Accepted RX/TX ring depths.
> + *
> + * Direct values, such as @hds_thresh and @rings, hold the current
> + * accepted configuration. Drivers which use them for queue rendering
> + * must initialize them with their defaults.
>   */
>  struct netdev_config {
>  	u32	hds_thresh;
>  	u8	hds_config;
> +
> +	struct netdev_ring_config rings;
>  };
>  
[ ... ]

> diff --git a/net/core/netdev_config.c b/net/core/netdev_config.c
> index b101341e32513..1975de42a60d9 100644
> --- a/net/core/netdev_config.c
> +++ b/net/core/netdev_config.c
> @@ -50,6 +50,15 @@ static int netdev_nop_validate_qcfg(struct net_device *dev,
>  	return 0;
>  }
>  
> +static void netdev_qcfg_apply_dev(struct netdev_queue_config *qcfg,
> +				  const struct netdev_config *cfg)
> +{
> +	/* Device config overrides callback-provided fallbacks. */
> +	qcfg->rx_ring_size = cfg->rings.rx_pending;
> +	qcfg->rx_mini_ring_size = cfg->rings.rx_mini_pending;
> +	qcfg->rx_jumbo_ring_size = cfg->rings.rx_jumbo_pending;
> +}
> +

[Severity: Low]
Can these three assignments hand a rendered config full of zeroes to
ndo_validate_qcfg()?

cfg->rings starts out all-zero and the core never seeds it from the driver's
current ring depths:

net/core/netdev_config.c:netdev_alloc_config() {
	cfg = kzalloc_obj(*dev->cfg, GFP_KERNEL_ACCOUNT);
	...
}

The only writer is ethtool_ringparam_set_cfg(), so on a device whose ring
depths were never touched through ethtool, rx_ring_size,
rx_mini_ring_size and rx_jumbo_ring_size all render as 0.

The assignment is also unconditional, unlike the memory-provider override a
few lines below:

	mpp = &__netif_get_rx_queue(dev, rxq_idx)->mp_params;
	if (mpp->rx_page_size)
		qcfg->rx_page_size = mpp->rx_page_size;

so a driver cannot supply ring-depth fallbacks from ndo_default_qcfg() at
all - they are always overwritten. The comment says that is intended, but
should the copy be guarded the same way as rx_page_size, or should
ndo_default_qcfg() not be documented as providing fallbacks for these
fields?

For the record, nothing appears broken in-tree: the only consumer of the new
fields, fbnic, seeds netdev->cfg->rings.{rx,rx_mini,rx_jumbo,tx}_pending in
fbnic_netdev_alloc() in the following patch of the series, and the
"driver initializes dev->cfg" convention already exists there for
hds_thresh. bnxt and mlx5e read only rx_page_size.

>  static int __netdev_queue_config(struct net_device *dev, int rxq_idx,
>  				 struct netdev_queue_config *qcfg,
>  				 struct netlink_ext_ack *extack,
> @@ -70,6 +79,7 @@ static int __netdev_queue_config(struct net_device *dev, int rxq_idx,
>  	/* Get defaults from the driver, in case user config not set */
>  	if (dev->queue_mgmt_ops->ndo_default_qcfg)
>  		dev->queue_mgmt_ops->ndo_default_qcfg(dev, qcfg);
> +	netdev_qcfg_apply_dev(qcfg, dev->cfg_pending);
>  	err = validate_cb(dev, qcfg, extack);
>  	if (err)
>  		return err;
[ ... ]
> @@ -113,3 +125,23 @@ int netdev_queue_config_validate(struct net_device *dev, int rxq_idx,
>  {
>  	return __netdev_queue_config(dev, rxq_idx, qcfg, extack, true);
>  }
> +
> +int netdev_queue_config_revalidate(struct net_device *dev,
> +				   struct netlink_ext_ack *extack)
> +{
> +	const struct netdev_queue_mgmt_ops *qops = dev->queue_mgmt_ops;
> +	struct netdev_queue_config qcfg;
> +	unsigned int i;
> +	int err;
> +
> +	if (!qops || !qops->ndo_validate_qcfg)
> +		return 0;
> +
> +	for (i = 0; i < dev->real_num_rx_queues; i++) {
> +		err = netdev_queue_config_validate(dev, i, &qcfg, extack);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}

> diff --git a/net/ethtool/common.c b/net/ethtool/common.c
> index 23db40618fed1..05ed22fd1f906 100644
> --- a/net/ethtool/common.c
> +++ b/net/ethtool/common.c
> @@ -956,6 +956,15 @@ void ethtool_ringparam_get_cfg(struct net_device *dev,
>  	kparam->hds_thresh = dev->cfg->hds_thresh;
>  }
>  
> +void ethtool_ringparam_set_cfg(struct netdev_config *cfg,
> +			       const struct ethtool_ringparam *param)
> +{
> +	cfg->rings.rx_pending = param->rx_pending;
> +	cfg->rings.rx_mini_pending = param->rx_mini_pending;
> +	cfg->rings.rx_jumbo_pending = param->rx_jumbo_pending;
> +	cfg->rings.tx_pending = param->tx_pending;
> +}
> +
[ ... ]

> diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
> index 4b0bc503f9307..1320289025b25 100644
> --- a/net/ethtool/ioctl.c
> +++ b/net/ethtool/ioctl.c
[ ... ]
> @@ -2239,10 +2240,29 @@ static int ethtool_set_ringparam(struct net_device *dev, void __user *useraddr)
>  	    ringparam.tx_pending > max.tx_max_pending)
>  		return -EINVAL;
>  
> +	ret = netdev_reconfig_start(dev);
> +	if (ret)
> +		return ret;
> +
> +	ethtool_ringparam_set_cfg(dev->cfg_pending, &ringparam);
> +
> +	ret = netdev_queue_config_revalidate(dev, NULL);
> +	if (ret)
> +		goto out_free_cfg;
> +
>  	ret = dev->ethtool_ops->set_ringparam(dev, &ringparam,
>  					      &kernel_ringparam, NULL);
> -	if (!ret)
> -		ethtool_notify(dev, ETHTOOL_MSG_RINGS_NTF);
> +	if (ret)
> +		goto out_free_cfg;
> +
> +	/* The driver may adjust the accepted ring depths. */
> +	ethtool_ringparam_set_cfg(dev->cfg_pending, &ringparam);
> +	swap(dev->cfg, dev->cfg_pending);
> +	ethtool_notify(dev, ETHTOOL_MSG_RINGS_NTF);

[Severity: Low]
Is the committed configuration guaranteed to be one that ndo_validate_qcfg()
actually saw?

The sequence here is:

	ethtool_ringparam_set_cfg(dev->cfg_pending, &ringparam);   /* requested */
	netdev_queue_config_revalidate(dev, NULL);                 /* validates */
	dev->ethtool_ops->set_ringparam(...);                      /* may rewrite */
	ethtool_ringparam_set_cfg(dev->cfg_pending, &ringparam);   /* adjusted */
	swap(dev->cfg, dev->cfg_pending);                          /* commits */

If the driver rewrites ringparam in place, the depths that get committed are
not the depths that were validated, and there is no second
netdev_queue_config_revalidate() pass. ethnl_set_rings() has the same
ordering, with the commit done by the framework swap in
ethnl_default_set_doit().

No in-tree case looks reachable today: the only ring-depth-aware validator,
fbnic_validate_qcfg(), runs the same fbnic_ring_size_pow2() helper that
fbnic_set_ringparam() applies, and its ppq_entries >= 4 constraint only gets
easier as the depth is rounded up. Drivers that do rewrite the caller's
ringparam, such as mvpp2_ethtool_set_ringparam() via
mvpp2_check_ringparam_valid(), have no ndo_validate_qcfg, so
netdev_queue_config_revalidate() returns 0 for them.

Would it be worth revalidating after the driver call, or documenting that
->set_ringparam() must not adjust depths in a direction its own
ndo_validate_qcfg() would reject?

> +
> +out_free_cfg:
> +	__netdev_free_config(dev->cfg_pending);
> +	dev->cfg_pending = dev->cfg;
>  	return ret;
>  }
>  

> diff --git a/net/ethtool/rings.c b/net/ethtool/rings.c
> index 9054c89c5d7bb..c04312fc0d061 100644
> --- a/net/ethtool/rings.c
> +++ b/net/ethtool/rings.c
[ ... ]
> @@ -299,10 +300,20 @@ ethnl_set_rings(struct ethnl_req_info *req_info, struct genl_info *info)
>  
>  	dev->cfg_pending->hds_config = kernel_ringparam.tcp_data_split;
>  	dev->cfg_pending->hds_thresh = kernel_ringparam.hds_thresh;
> +	ethtool_ringparam_set_cfg(dev->cfg_pending, &ringparam);
> +
> +	ret = netdev_queue_config_revalidate(dev, info->extack);
> +	if (ret)
> +		return ret;
>  
>  	ret = dev->ethtool_ops->set_ringparam(dev, &ringparam,
>  					      &kernel_ringparam, info->extack);
> -	return ret < 0 ? ret : 1;
> +	if (ret < 0)
> +		return ret;
> +
> +	/* The driver may adjust the accepted ring depths. */
> +	ethtool_ringparam_set_cfg(dev->cfg_pending, &ringparam);
> +	return 1;
>  }

[Severity: Low]
The comment says the driver may adjust the accepted ring depths, but does
this second copy store the depths the hardware ended up with, or just the
requested ones?

Drivers that normalize through locals never touch the caller's struct
ethtool_ringparam, for example mlx5e_ethtool_set_ringparam() computing
order_base_2() into its own variables, so dev->cfg->rings can end up
describing a depth the device is not running.

This is already acknowledged in the kernel-doc added by this patch ("Some
drivers update their ring sizes without reflecting the change in @cfg"), and
the only consumer of the stored depths, fbnic, does round in place, so
nothing reads a stale value today. Would it be clearer to say the stored
values are the requested depths, adjusted only by drivers that write back
into param?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260910180908.1506533-1-bjorn%40kernel.org

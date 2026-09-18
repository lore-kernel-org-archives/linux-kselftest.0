Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F193B0AE8;
	Fri, 18 Sep 2026 09:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723311; cv=none; b=dVeuYpwx0g6/kpd1tR/1nezZZ9LZHpoO8uCgNmnbeh1atTbKIaeoGrXw6f3cxlPKRqvr4Ic0UoFtkrd+sx2V5XPH3xlKH5RUFZvDkZh3+94WRMuHtOButjJxoVyJR7h4kHFRLreY99wb6re/jWpzv3XKUr43XyM1yAQtU3lHqQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723311; c=relaxed/simple;
	bh=OY6Jh9Q29Sy5pd4tIcGxABWXn/gC6dTo4Rs/F8qnUVc=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E7r/8Cz1GIUv0IAVU+PmACTwRHFnz2Onf9x5xniV9m1+XA6sZRmKiyPntHNk2Yfprc4OVRSzY31ErQz/FgK5GYX1fCsEXybVAbzgvB4yOye+JZrK1OgfOcLPAzx+0oPLUaXRuwlRZfDLlfKll/+fFYlqBFyCnS5XGUNdjI8seJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WjOvf89Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjOvf89Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413091F000FF;
	Fri, 18 Sep 2026 09:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789723309;
	bh=295Wvk59sbhsQmqs9ne1jysymlz6dNmKESaIVQc+dJE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WjOvf89YmajlrlPhhR4+YMc0NJCsrdvSYRcRY4J98bxV2lKMT7eNIfQNyptVrTErj
	 6AwWlYXwlKDO4GBzUKwPEO9TW9EGcitOB30vzBfb+hvmDJ4ZLmC3jJQwki4NFL5qD3
	 46jliRxICCEKu+qw0QibSPisaGkSsTrAAHFan/r0+Tht7dB7A6USC2cdlbBNFGRulM
	 7PLqODpk7IZ9D/FUuUT3/3O4H1cTjFqd9af2kTXV+kLuwS9QT6VO0E0GCH2ssqKYHZ
	 rGAGyHNQ1lz+Zbdi3KaAY6VsMq1t5KF72Rmu7fX+GeW9YMIh4p65G8EXv8Kfp//1TL
	 mgQOZHywU3ZKQ==
Subject: Re: [PATCH net-next v3 3/5] net: Revalidate queue config for
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
Date: Fri, 18 Sep 2026 09:21:47 +0000
Message-ID: <178972330781.22033.2530049115348913249@kernel.org>
In-Reply-To: <20260915182105.4162425-4-bjorn@kernel.org>
References: <20260915182105.4162425-4-bjorn@kernel.org>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 3

- [Low] netdev_qcfg_apply_dev() (net/core/netdev_config.c:53-60)
  unconditionally copies cfg->rings.{rx,rx_mini,rx_jumbo}_pending over…
- [Low] ethtool_ringparam_get_cfg() (net/ethtool/common.c:943-956)
  deliberately restores kparam->tcp_data_split / hds_thresh from…
- [Low] The struct netdev_ring_config kernel-doc
  (include/net/netdev_queues.h:18-21) says "These values are only used…

--

net: Revalidate queue config for ringparam changes

This adds accepted RX/TX ring depths to struct netdev_config, stages
proposed depths in cfg_pending, and revalidates every RX queue through
ndo_validate_qcfg before the driver applies a ringparam change. The same
transaction is used for both the ioctl and netlink ring-set paths.

Link: https://lore.kernel.org/all/20250421222827.283737-14-kuba@kernel.org/

> diff --git a/include/net/netdev_queues.h b/include/net/netdev_queues.h
> index 70c9fe9e83cc4..6f6f6d74de2e5 100644
> --- a/include/net/netdev_queues.h
> +++ b/include/net/netdev_queues.h
> @@ -4,18 +4,58 @@
>  
>  #include <linux/netdevice.h>
>  
> +/**
> + * struct netdev_ring_config - accepted RX/TX ring depth configuration
> + * @rx_pending:		Size of the regular RX ring.
> + * @rx_mini_pending:	Size of the RX mini ring.
> + * @rx_jumbo_pending:	Size of the RX jumbo ring.
> + * @tx_pending:		Size of the TX ring.
> + *
> + * This stores only persistent configuration values. Capability fields,
> + * such as max ring sizes, are reported by drivers but are not part of the
> + * accepted configuration.
> + *
> + * These values are only used for queue-configuration validation today.

[Severity: Low]
Is this sentence accurate for all four members?  netdev_qcfg_apply_dev() is
the only place that transfers netdev_config.rings into the struct
netdev_queue_config handed to ndo_validate_qcfg(), and it copies only the
three RX depths:

	qcfg->rx_ring_size = cfg->rings.rx_pending;
	qcfg->rx_mini_ring_size = cfg->rings.rx_mini_pending;
	qcfg->rx_jumbo_ring_size = cfg->rings.rx_jumbo_pending;

struct netdev_queue_config has no TX member, so rings.tx_pending, which
ethtool_ringparam_set_cfg() writes on both the ioctl and netlink paths, can
never reach a validation callback and is write-only state today.

Would it be worth rewording this to say the RX depths feed validation and
that tx_pending is recorded for completeness?

> + * Drivers may normalize ring sizes without reporting the result through
> + * struct ethtool_ringparam, so they are not necessarily the applied
> + * hardware depths.
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
> + * Direct values, such as @hds_thresh and @rings, hold the accepted
> + * configuration and always override callback-provided defaults, including
> + * when zero. Drivers which use them for queue rendering must initialize them.

[Severity: Low]
Is this "must initialize them" requirement stated anywhere a driver author
would find it?  It appears only here, and not in the commit message or in
the @ndo_default_qcfg documentation, which still reads that the queue config
struct is passed to the callback "before the user-requested settings are
applied".

netdev_alloc_config() only kzalloc()s the struct, and the only core writer of
cfg->rings is ethtool_ringparam_set_cfg() on the two ring-set paths.  So
until userspace performs a ring change, cfg->rings is all zeroes and
netdev_qcfg_apply_dev() copies those zeroes over whatever ndo_default_qcfg()
supplied.

Would an "unset" guard, similar to the memory-provider override just below
it, or a core-side seeding step from the driver's current ringparam be
preferable to the per-driver requirement?

For what it's worth, this does not misbehave in-tree at the end of the
series: no in-tree ndo_default_qcfg populates ring depths (bnxt, mlx5e and
fbnic only set qcfg->rx_page_size), the only reader of the new
rx_*_ring_size fields is fbnic_validate_qcfg(), and the following fbnic
patch seeds netdev->cfg->rings from fbn->{rcq,hpq,ppq,txq}_size in
fbnic_netdev_alloc() before registration.  The concern here is the doc
contradiction and the fragile contract rather than an observable failure.

>   */
>  struct netdev_config {
>  	u32	hds_thresh;
>  	u8	hds_config;
> +
> +	struct netdev_ring_config rings;
>  };
>  
> +/**
> + * struct netdev_queue_config - rendered configuration for an RX queue
> + * @rx_page_size:	Size of one RX page-pool allocation.
> + * @rx_ring_size:	Configured size of the regular RX ring.
> + * @rx_mini_ring_size:	Configured size of the RX mini ring.
> + * @rx_jumbo_ring_size:	Configured size of the RX jumbo ring.
> + */
>  struct netdev_queue_config {
>  	u32	rx_page_size;
> +	u32	rx_ring_size;
> +	u32	rx_mini_ring_size;
> +	u32	rx_jumbo_ring_size;
>  };
>  
>  /* See the netdev.yaml spec for definition of each statistic */

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
>  static int __netdev_queue_config(struct net_device *dev, int rxq_idx,
>  				 struct netdev_queue_config *qcfg,
>  				 struct netlink_ext_ack *extack,
> @@ -70,6 +79,7 @@ static int __netdev_queue_config(struct net_device *dev, int rxq_idx,
>  	/* Get defaults from the driver, in case user config not set */
>  	if (dev->queue_mgmt_ops->ndo_default_qcfg)
>  		dev->queue_mgmt_ops->ndo_default_qcfg(dev, qcfg);
> +	netdev_qcfg_apply_dev(qcfg, dev->cfg_pending);

[Severity: Low]
Does the existing comment still describe what happens here?  It says the
driver defaults are fetched "in case user config not set", but the new call
replaces the three ring fields unconditionally, whether or not the user ever
set them.

Compare with the memory-provider override a few lines further down, which is
guarded:

	mpp = &__netif_get_rx_queue(dev, rxq_idx)->mp_params;
	if (mpp->rx_page_size)
		qcfg->rx_page_size = mpp->rx_page_size;

Should netdev_qcfg_apply_dev() skip zero values in the same way, or should
the comment be updated to say the ring fields are always taken from
cfg_pending?

>  	err = validate_cb(dev, qcfg, extack);
>  	if (err)
>  		return err;

[ ... ]

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

[Severity: Low]
Should the get side be extended to match this?  ethtool_ringparam_get_cfg()
deliberately overrides two fields with the accepted config:

	/* Driver gives us current state, we want to return current config */
	kparam->tcp_data_split = dev->cfg->hds_config;
	kparam->hds_thresh = dev->cfg->hds_thresh;

but it leaves the four ring depths exactly as reported by
get_ringparam(), i.e. the driver's current hardware state.

ethnl_set_rings() seeds struct ethtool_ringparam from that helper and then
calls ethtool_ringparam_set_cfg() for all four fields, so a request carrying
only ETHTOOL_A_RINGS_TX re-stages and commits RX depths sourced from the
driver's reported state rather than from the previously accepted config.

Which side is meant to be authoritative for the ring depths?

For the record, this does not diverge for the only in-tree reader of
cfg->rings: fbnic_get_ringparam() reports fbn->{rcq,hpq,ppq,txq}_size, which
are the normalized values the core already recorded, and the bnxt and mlx5e
validation callbacks only look at rx_page_size.

>  
>  static void ethtool_init_tsinfo(struct kernel_ethtool_ts_info *info)
>  {
>  	memset(info, 0, sizeof(*info));

[ ... ]

> diff --git a/net/ethtool/rings.c b/net/ethtool/rings.c
> index 9054c89c5d7bb..e3810c0320e35 100644
> --- a/net/ethtool/rings.c
> +++ b/net/ethtool/rings.c
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
> +	/* Capture ring depth adjustments reported by the driver. */
> +	ethtool_ringparam_set_cfg(dev->cfg_pending, &ringparam);
> +	return 1;
>  }

Thanks for looking at these.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260915182105.4162425-1-bjorn%40kernel.org

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EF3426D03;
	Mon, 14 Sep 2026 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382701; cv=none; b=qa4+LKQjLMBFvBxw66FnseyPPS2xRLzR5FUeIXw7pgDwcYYJ7rCdifIY1To/X1plW0WcYEWzFyCMCfjc/ordE7wv+fgQT66zfKqDGCxk/+E6jR00ib/MNlm7bkTZiMXIXOwd+RJeFuLbvo3XzGG2pGjUeUhB+n2GMp43UJIQYec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382701; c=relaxed/simple;
	bh=xLHXZn3Puf64p2btSuTlnBlLyW9MWfIh73UeUba0Wus=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WhuQOD6Fiw9qLp3xkY4AsnLbYLWlSSoKSG85vXhhXp/wjZRimT3Oi8aEXivT3YbkNr3KZs6wXq/HiZDm6r3fkE7JhEjfCAtYr9+tPq3TL+QCfjKwCxnnCDTIOCZmSwoKMztVdWtC3if9LeJ3zqR+Q1PFd9C/GJFK+HAXRmYbC0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N278Zs7h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N278Zs7h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9411F000FF;
	Mon, 14 Sep 2026 10:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789382695;
	bh=Zgkv+k4iBESbCVXAtCuYGBCd++Hb/fOZYZ+TTVD4Isk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=N278Zs7hhbk6XLPGmhx3Bv1jpvaeK0H2PRXXY0V8DvNiH2eXWlE3TUJ/gTxLVtBzx
	 M+CP7h73E3tBpVshR0vxx4G3tGoY9Nzn/eobiETo2/Hb3KiJEDviQBEFs8ISVpN1ev
	 GSBT0a/+4Kq0zujQAv5IlKUUqL8GkMMU4jmuad/8DPgvClRAIT9FzSSOK3H26apQ5Z
	 CpAVSHSRqjd9tnxNusbF8k4p0ckHW3G+yFfN07cI7F7+Kc5jssaXYBMokVMYkq9HLk
	 dcf2fugbT488NPqHIW1pSjbBYm6EWI1Iz9AvwQ9TJ3xLyhFCLuFGmQTz+DX+xe9xQs
	 u7O6NpggZhPhQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: alexanderduyck@fb.com, kuba@kernel.org, kernel-team@meta.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, daniel@iogearbox.net,
 mike.marciniszyn@gmail.com, mohsin.bashr@gmail.com, sdf@fomichev.me,
 bobbyeshleman@meta.com, daskald@meta.com, bestswngs@gmail.com,
 maxime.chevallier@bootlin.com, jacob.e.keller@intel.com,
 leitao@debian.org, cuitao@kylinos.cn, asml.silence@gmail.com,
 dw@davidwei.uk
Subject: Re: [PATCH net-next v2 3/5] net: Revalidate queue config for
 ringparam changes
In-Reply-To: <178915060796.219967.9039776741140153103@kernel.org>
References: <20260910180908.1506533-4-bjorn@kernel.org>
 <178915060796.219967.9039776741140153103@kernel.org>
Date: Mon, 14 Sep 2026 12:44:51 +0200
Message-ID: <87pkygnmcc.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

netdev-bot+sashiko@kernel.org writes:

>>     Memory-provider queue configuration is validated when the provider is
>>     bound. A later ethtool ring change may invalidate it because drivers
>>     can size queue memory from both ring depth and RX page size. For
>>     example, fbnic uses multiple PPQ entries for each RX page larger than
>>     PAGE_SIZE, which reduces the usable software ring depth.
> [ ... ]
>>     Use the same transaction for ioctl and netlink. Drivers without
>>     ndo_validate_qcfg skip the new validation.
>
> [Severity: Low]
> The message reads as if it closes a live misconfiguration hole, but at th=
is
> commit no in-tree driver implements a ring-depth-aware ndo_validate_qcfg =
and
> no driver reads qcfg->rx_ring_size, so netdev_queue_config_revalidate()
> cannot change any validation outcome yet.
>
> The two current ndo_validate_qcfg implementations, bnxt_validate_qcfg() a=
nd
> mlx5e_queue_validate_qcfg(), only inspect qcfg->rx_page_size. The fbnic
> consumer named in the message, fbnic_validate_qcfg() reading
> qcfg->rx_jumbo_ring_size, arrives in the following patch of the series.
>
> The last paragraph does disclose the limitation, so this is only about
> framing: could the message state that this is core plumbing and that the
> fbnic consumer lands in the next patch?

Ok! I reworded the commit message to state that fbnic consumer followes
the next patch.

...

>> diff --git a/net/core/netdev_config.c b/net/core/netdev_config.c
>> index b101341e32513..1975de42a60d9 100644
>> --- a/net/core/netdev_config.c
>> +++ b/net/core/netdev_config.c
>> @@ -50,6 +50,15 @@ static int netdev_nop_validate_qcfg(struct net_device=
 *dev,
>>  	return 0;
>>  }
>>=20=20
>> +static void netdev_qcfg_apply_dev(struct netdev_queue_config *qcfg,
>> +				  const struct netdev_config *cfg)
>> +{
>> +	/* Device config overrides callback-provided fallbacks. */
>> +	qcfg->rx_ring_size =3D cfg->rings.rx_pending;
>> +	qcfg->rx_mini_ring_size =3D cfg->rings.rx_mini_pending;
>> +	qcfg->rx_jumbo_ring_size =3D cfg->rings.rx_jumbo_pending;
>> +}
>> +
>
> [Severity: Low]
> Can these three assignments hand a rendered config full of zeroes to
> ndo_validate_qcfg()?

Yes, unless thte driver initializes the fields. Device-wide config is
authoritative -- including zero! I've clarified the requirements in the
docs for next version.

>> diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
>> index 4b0bc503f9307..1320289025b25 100644
>> --- a/net/ethtool/ioctl.c
>> +++ b/net/ethtool/ioctl.c
> [ ... ]
>> @@ -2239,10 +2240,29 @@ static int ethtool_set_ringparam(struct net_devi=
ce *dev, void __user *useraddr)
>>  	    ringparam.tx_pending > max.tx_max_pending)
>>  		return -EINVAL;
>>=20=20
>> +	ret =3D netdev_reconfig_start(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ethtool_ringparam_set_cfg(dev->cfg_pending, &ringparam);
>> +
>> +	ret =3D netdev_queue_config_revalidate(dev, NULL);
>> +	if (ret)
>> +		goto out_free_cfg;
>> +
>>  	ret =3D dev->ethtool_ops->set_ringparam(dev, &ringparam,
>>  					      &kernel_ringparam, NULL);
>> -	if (!ret)
>> -		ethtool_notify(dev, ETHTOOL_MSG_RINGS_NTF);
>> +	if (ret)
>> +		goto out_free_cfg;
>> +
>> +	/* The driver may adjust the accepted ring depths. */
>> +	ethtool_ringparam_set_cfg(dev->cfg_pending, &ringparam);
>> +	swap(dev->cfg, dev->cfg_pending);
>> +	ethtool_notify(dev, ETHTOOL_MSG_RINGS_NTF);
>
> [Severity: Low]
> Is the committed configuration guaranteed to be one that ndo_validate_qcf=
g()
> actually saw?

A driver implementing ndo_validate_qcfg must use the same normalization.
I documented that requirement, fbnic uses the same rounding helper in
both paths.

>> diff --git a/net/ethtool/rings.c b/net/ethtool/rings.c
>> index 9054c89c5d7bb..c04312fc0d061 100644
>> --- a/net/ethtool/rings.c
>> +++ b/net/ethtool/rings.c
> [ ... ]
>> @@ -299,10 +300,20 @@ ethnl_set_rings(struct ethnl_req_info *req_info, s=
truct genl_info *info)
>>=20=20
>>  	dev->cfg_pending->hds_config =3D kernel_ringparam.tcp_data_split;
>>  	dev->cfg_pending->hds_thresh =3D kernel_ringparam.hds_thresh;
>> +	ethtool_ringparam_set_cfg(dev->cfg_pending, &ringparam);
>> +
>> +	ret =3D netdev_queue_config_revalidate(dev, info->extack);
>> +	if (ret)
>> +		return ret;
>>=20=20
>>  	ret =3D dev->ethtool_ops->set_ringparam(dev, &ringparam,
>>  					      &kernel_ringparam, info->extack);
>> -	return ret < 0 ? ret : 1;
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* The driver may adjust the accepted ring depths. */
>> +	ethtool_ringparam_set_cfg(dev->cfg_pending, &ringparam);
>> +	return 1;
>>  }
>
> [Severity: Low]
> The comment says the driver may adjust the accepted ring depths, but does
> this second copy store the depths the hardware ended up with, or just the
> requested ones?

It captures only adjustments that the driver reports through ringparam.
I updated the comments and docs.


Bj=C3=B6rn

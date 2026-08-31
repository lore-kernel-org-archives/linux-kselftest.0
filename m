Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA4C3EFFA9;
	Mon, 31 Aug 2026 12:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788178623; cv=none; b=dv4RW9TM0u0Fpc2WJ9MQZSmmLbyqHbZyXqCbUS9Voo/wGNuRknQa4RPMRdTy2JhE/LQH7vVk6MUnF3UMD1W8EGKd+gqlGMUKRjK6S+uVTT+cBPZysGAwnQiRpEXtXqYDhOMWIAVUR6Ck+LDbllSeLeairLfiH/vUfUqv5JLSFtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788178623; c=relaxed/simple;
	bh=XtrC0PjMnCdQNrdpLDgwn+NGWd9ShjHjnXXJCOmprhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/GO+OEQeq3lmsbIKqwk7POmvYjovbkZGXIjVHso10rHvE58lHu9DOUotR465dekS83QHE+2kHJu7z3CQZjdIU0EVrRTdKrgvIZnnIUPNN96O6tuZP9lUt+v5UftUn8NK+i4mwm2DNQbwnKFtmHKUVeD+F/EkRsdzqtCyJboZNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=z7v2H/5e; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="z7v2H/5e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IR/IEWF8ElRUZ1JWMpEMQTyXnhSnAoIKLz2J91tzkkY=; b=z7v2H/5eWFUVHuj9tqzAojGbwn
	u+z1InFsNfN9qbOBMqTB8j2vM7UdOM+AytTyXq+iYQ8m8lrtWLshcEHK7IvHc1iS3TIGNovnkkh8b
	epTJjd9swpSxJITMgX6PVIRKPMUbjQOg/brzPznA2qLsnxHXtW6auxBB2kJ043E4TjMI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x10wQ-002Afi-KQ; Mon, 31 Aug 2026 14:16:46 +0200
Date: Mon, 31 Aug 2026 14:16:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next 1/2] netdevsim: add link speed support
Message-ID: <53215678-05bb-4191-b5ff-aa236b16a96a@lunn.ch>
References: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
 <20260831-nsim_speed-v1-1-7a651ee65738@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-nsim_speed-v1-1-7a651ee65738@kylinos.cn>

>  static void nsim_ethtool_ring_init(struct netdevsim *ns)
> @@ -250,12 +276,16 @@ void nsim_ethtool_init(struct netdevsim *ns)
>  	ns->ethtool.fec.active_fec = ETHTOOL_FEC_NONE;
>  
>  	ns->ethtool.channels = ns->nsim_bus_dev->num_queues;
> +	ns->ethtool.duplex = DUPLEX_FULL;
> +	ns->ethtool.speed = SPEED_5000;
>  
>  	ethtool = debugfs_create_dir("ethtool", ns->nsim_dev_port->ddir);
>  	ns->ethtool_ddir = ethtool;
>  
>  	debugfs_create_u32("get_err", 0600, ethtool, &ns->ethtool.get_err);
>  	debugfs_create_u32("set_err", 0600, ethtool, &ns->ethtool.set_err);
> +	debugfs_create_u32("speed", 0600, ethtool, &ns->ethtool.speed);
> +	debugfs_create_u8("duplex", 0600, ethtool, &ns->ethtool.duplex);

debugfs_create_bool() ?

	Andrew

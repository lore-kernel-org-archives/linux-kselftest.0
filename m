Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6122F39E18E;
	Mon, 31 Aug 2026 12:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179104; cv=none; b=uVtfA6lXVYY3Ez+AvmyhIFBwSfKNbOww7WbovcTs4PYvYXfH99KF2chhvsJCpddwVPMepqSkWXxmjLWXhKbq+98P2BUDihSYb4S4tbpEHc4rzDS5556Js8260ptX4UwCr5jXPLZLF6ST1SuZGTBJVHe65zkFd9Z3ex6HLF8v8tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179104; c=relaxed/simple;
	bh=92Dktz3O1/NeWOrWpX3w2XgG/Kc78Uz1DWk1gtB3YMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5QHaLpWRsdkgP7GaobIQTeH6rVILq8L2ruo7uTocUgQjKqap5DgpRwOymf1PYwLZmTUczhulLu1BEk0r9wjBrTP7Skzxe7GNYSbA31koPBlpb9holJ3L7xrWR/cEHFQkVszONrv/9UeUCKb+9IMfrahMdXalAWjZBcybLdzL9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=0EHLdMX/; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="0EHLdMX/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=m2bADue0yCfwoX5RvqAmX+NEGjvFSd8DhdCtcGeF6sA=; b=0EHLdMX/X8ToTEy1qWkwgtxf7+
	3zRE66qSd93dnWDfJRNZjYo4zuD+/N7uoKEuvPkHBUI2sjXM2y+gX3qxQTZRnPbIgVzZPDvLFYHhi
	MNWmLlsqn9nJQma+sv1hQQplkEXRsGlquth48vQmahcgfi0Etifc/SGCYnmUJrMLVZOk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x114I-002AkG-KH; Mon, 31 Aug 2026 14:24:54 +0200
Date: Mon, 31 Aug 2026 14:24:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next 1/2] netdevsim: add link speed support
Message-ID: <043abd17-c896-40a7-901d-a3fc943151bc@lunn.ch>
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

> +static int nsim_get_link_ksettings(struct net_device *dev,
> +				   struct ethtool_link_ksettings *cmd)
> +{
> +	struct netdevsim *ns = netdev_priv(dev);
> +
> +	cmd->base.speed		= ns->ethtool.speed;
> +	cmd->base.duplex	= ns->ethtool.duplex;
> +	cmd->base.port		= PORT_OTHER;
> +	cmd->base.autoneg	= AUTONEG_DISABLE;

Here you hard code autoneg as disabled.

> +static int nsim_set_link_ksettings(struct net_device *dev,
> +				   const struct ethtool_link_ksettings *cmd)
> +{
> +	struct netdevsim *ns = netdev_priv(dev);
> +
> +	if (cmd->base.speed > NSIM_LINK_SPEED_MAX)
> +		return -EINVAL;
> +
> +	return ethtool_virtdev_set_link_ksettings(dev, cmd, &ns->ethtool.speed,
> +						  &ns->ethtool.duplex);

but here you don't appear to block enabling autoneg. I would expect a
test and EOPNOTSUPP.

     Andrew

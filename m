Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2473B48B368;
	Wed,  2 Sep 2026 12:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352716; cv=none; b=GX5sLKT2gx2Wuae94uMLs8PJDl0WUjZx8cWkC4r237YHdFI6dTTZSqOZvoTwl75xmHIe2vhPzgK4CY2ZPktt4Jv6itgG4vPeWa/uTKPTAiskAwPFWXX1lkx8lxVBBLSbkHRhjpiyP3Nqk0K/5moFx1CpMpDSfDGsB9IOu/T2QL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352716; c=relaxed/simple;
	bh=kCGseby/cvNqTQZnThWhwW7Zzz3wrVvCMPclZNwW0Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQh31p8KjmSy0ZLreM3Zcjj/vq1zo3a1rEJFRQwkwPsfel4rAQuLS6QrXesyeKNj3Px9iR2VNjOrrWI2KwfBAL8CoB2qJKkltiL7zc0AK6g+J2CrBlmZ1b4iUhaFyuv/2vCtHHrHJgBYnUdMBhRbtO68Yg6zLfZLzU49oUqZNDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=fL+eJOjc; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fL+eJOjc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zaRlwF56CM9F4rJ8UyK8kspioZcE1Mtz+dCysJmhYy4=; b=fL+eJOjctKWiFYasZP2IkkHM3U
	pUkNtDrvtFqmclvkwR7D3jfUjgpAwmS5ZHe5ym4sk1/AiIkrcIZPB8sB7g9sfDZxrXdQNWUZhHFV4
	QM2rbqaXw6xhZTiQU3ngK9H6j36WzW032/vhNzWlf+f00daA6DtUho/Vrh0KGxp0FWi8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1kEN-002WCu-Kt; Wed, 02 Sep 2026 14:38:19 +0200
Date: Wed, 2 Sep 2026 14:38:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next 1/2] netdevsim: add link speed support
Message-ID: <9d9bad3a-a43d-47ad-b0d8-ba0878197ffc@lunn.ch>
References: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
 <20260831-nsim_speed-v1-1-7a651ee65738@kylinos.cn>
 <53215678-05bb-4191-b5ff-aa236b16a96a@lunn.ch>
 <apZzJDVtENpAluhT@fedora>
 <18c7a000-97ad-459a-bb9c-5c821274e9f3@lunn.ch>
 <apeBoyP1G93wW_VZ@fedora>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apeBoyP1G93wW_VZ@fedora>

On Wed, Sep 02, 2026 at 09:53:39AM +0800, Hangbin Liu wrote:
> On Tue, Sep 01, 2026 at 02:43:39PM +0200, Andrew Lunn wrote:
> > On Tue, Sep 01, 2026 at 02:39:32PM +0800, Hangbin Liu wrote:
> > > On Mon, Aug 31, 2026 at 02:16:46PM +0200, Andrew Lunn wrote:
> > > > >  static void nsim_ethtool_ring_init(struct netdevsim *ns)
> > > > > @@ -250,12 +276,16 @@ void nsim_ethtool_init(struct netdevsim *ns)
> > > > >  	ns->ethtool.fec.active_fec = ETHTOOL_FEC_NONE;
> > > > >  
> > > > >  	ns->ethtool.channels = ns->nsim_bus_dev->num_queues;
> > > > > +	ns->ethtool.duplex = DUPLEX_FULL;
> > > > > +	ns->ethtool.speed = SPEED_5000;
> > > > >  
> > > > >  	ethtool = debugfs_create_dir("ethtool", ns->nsim_dev_port->ddir);
> > > > >  	ns->ethtool_ddir = ethtool;
> > > > >  
> > > > >  	debugfs_create_u32("get_err", 0600, ethtool, &ns->ethtool.get_err);
> > > > >  	debugfs_create_u32("set_err", 0600, ethtool, &ns->ethtool.set_err);
> > > > > +	debugfs_create_u32("speed", 0600, ethtool, &ns->ethtool.speed);
> > > > > +	debugfs_create_u8("duplex", 0600, ethtool, &ns->ethtool.duplex);
> > > > 
> > > > debugfs_create_bool() ?
> > > 
> > > I'm not sure if anyone want to set nsim duplex to unknown for testing.
> > > Do you think that we should disable this behavior?
> > 
> > Ah, i did not think of DUPLEX_UNKNOWN.
> > 
> > We need to consider Jakubs reply, what are you actually testing here,
> > do such tests make any sense?
> 
> I'm fixing a bug in bonding that need to test with different speed slaves.
> So I add this feature for netdevsim.

That would of been useful to put into the commit message, after the

---.

Better still, create a self test for the bonding bug you have found,
show that it fails. Then have the fix, and show that the self test
then passes. That makes it a lot clearer why this change is useful,
plus it gives us a regression test to ensure bonding does not break
again.

	Andrew

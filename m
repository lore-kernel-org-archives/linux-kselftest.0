Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0423242D8;
	Tue,  1 Sep 2026 12:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266630; cv=none; b=pGj6nwPSUFNlw2dMtIovvVQLRuB6mpLX/ZXZZyKghPbyhZhn36k2j3UBMuIoijcjUtNGpkNQl/79gMi4UY/bmCBCZ5lLA8sxld1ACaTfAtjung3OWoq+6tYGDBQsnxMe7zLpTLbxfUrPcchvh8SuQxyUZcIhEgTddRdz5kNLznI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266630; c=relaxed/simple;
	bh=RI2I8TVst60QA7Wwo891cXbfplKuOcbVlYL7hlT75r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDIPDHsmtgTjNlwJXIM4potzHMYeHfyV009Bi9nHUEFl4Oq2c1V4LE64cHX69Nik57ZZSOSBEfcO2DKaleabS0crCwkUs1BsU4ZEj5Dka2ikXtFmD5E4az7YxjURK+CFFFr/fHbeey+hbpnySP2q4kZ1V/+OF9C13Xt2N2F0VaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=jzYPc4wH; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jzYPc4wH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=e3VZOr6RNXuMNZ3GiRBt7EGvtd3df9zDyi/QD1KV4w0=; b=jzYPc4wHaWGYtW+8ajtkNP1w5u
	caRT+ejzr1+LNoTMrtimyR5bbdXR9tumAakmJ/WaJpxp/vNmDawecY3zGfsHnNU3nXUSZdOurMLUB
	3AKk6REdUU5WmzJZyBVX2d7sSyTnw8WQQeQBX0ZIdfBajcYRswd26CjJYJJtQOOj6bMM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1Npz-002M5N-Bd; Tue, 01 Sep 2026 14:43:39 +0200
Date: Tue, 1 Sep 2026 14:43:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next 1/2] netdevsim: add link speed support
Message-ID: <18c7a000-97ad-459a-bb9c-5c821274e9f3@lunn.ch>
References: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
 <20260831-nsim_speed-v1-1-7a651ee65738@kylinos.cn>
 <53215678-05bb-4191-b5ff-aa236b16a96a@lunn.ch>
 <apZzJDVtENpAluhT@fedora>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apZzJDVtENpAluhT@fedora>

On Tue, Sep 01, 2026 at 02:39:32PM +0800, Hangbin Liu wrote:
> On Mon, Aug 31, 2026 at 02:16:46PM +0200, Andrew Lunn wrote:
> > >  static void nsim_ethtool_ring_init(struct netdevsim *ns)
> > > @@ -250,12 +276,16 @@ void nsim_ethtool_init(struct netdevsim *ns)
> > >  	ns->ethtool.fec.active_fec = ETHTOOL_FEC_NONE;
> > >  
> > >  	ns->ethtool.channels = ns->nsim_bus_dev->num_queues;
> > > +	ns->ethtool.duplex = DUPLEX_FULL;
> > > +	ns->ethtool.speed = SPEED_5000;
> > >  
> > >  	ethtool = debugfs_create_dir("ethtool", ns->nsim_dev_port->ddir);
> > >  	ns->ethtool_ddir = ethtool;
> > >  
> > >  	debugfs_create_u32("get_err", 0600, ethtool, &ns->ethtool.get_err);
> > >  	debugfs_create_u32("set_err", 0600, ethtool, &ns->ethtool.set_err);
> > > +	debugfs_create_u32("speed", 0600, ethtool, &ns->ethtool.speed);
> > > +	debugfs_create_u8("duplex", 0600, ethtool, &ns->ethtool.duplex);
> > 
> > debugfs_create_bool() ?
> 
> I'm not sure if anyone want to set nsim duplex to unknown for testing.
> Do you think that we should disable this behavior?

Ah, i did not think of DUPLEX_UNKNOWN.

We need to consider Jakubs reply, what are you actually testing here,
do such tests make any sense?

If they do, i think some validation would be good here. We already
have:

static inline int ethtool_validate_duplex(__u8 duplex)
{
	switch (duplex) {
	case DUPLEX_HALF:
	case DUPLEX_FULL:
	case DUPLEX_UNKNOWN:
		return 1;
	}

	return 0;
}

We don't expect a driver to set duplex to 42, so why should the user
be allowed to do that?

Also, SPEED_UNKNOWN is -1, so you need debugfs_create_s32().

	Andrew

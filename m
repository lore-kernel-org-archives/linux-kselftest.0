Received: from mta1.migadu.com (out-206.mta1.migadu.com [95.215.58.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E801356748
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 01:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314034; cv=none; b=qmbnJi7YDvAM3X83wg0ypLoBpROWUdUMV8aC51jDBKJLAaCwmk7ZG3iOsJJgmD0Gv+/R/EVVmxvXi712a2mF4eZsvdyidiZYMiFmjW9mo0qjT7XKnemCMuMv3aavRD9wDpmnWEOyQFoEZCPfC/WErOHMuxHgG13p9mKzYy/QwKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314034; c=relaxed/simple;
	bh=sANjPEpEpLPepnknarqjCmElJF9xDw1LQMYHFsbseqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9zMPu9j/GR82Gp9EVeb1DTirNkhniUcQQqmFh2vk9ehV1PbZE3eQ4fXj35ScFn9rMS5fqy2dkfrg0bor7DmDGybk0Ap6VYzt4m+y3GzrIDy7BBaOaVg84R5yGpeb/ITazLfaG6uYSQnvdNkgTnEZy8DPbQK0Pgq2JS0K7sIBoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GQ+NdCPp; arc=none smtp.client-ip=95.215.58.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GQ+NdCPp"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sANjPEpEpLPepnknarqjCmElJF9xDw1LQMYHFsbseqc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788314027; v=1; x=1788918827;
 b=GQ+NdCPpapvnQSsuw6oVsJepHNPRUSkvpnHnWSBbB4u4k9Hue4vLBptLvK5GK18aA2t7NqhR
 H/V+fodYKDPdyDmzS0Op1rklgkBPyXZjDXklKfoQRKY+F2D2jnIYb4Bq+IYaZM7H4jkFkpaA5+H
 S4ljvkWKFekiy9cYJodpLH/0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a71c7360aea84011;
	Wed, 02 Sep 2026 01:53:47 +0000
X-Mizu-Trace-ID: a71c7360aea84011
X-Migadu-Flow: FLOW_OUT
Date: Wed, 2 Sep 2026 09:53:39 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next 1/2] netdevsim: add link speed support
Message-ID: <apeBoyP1G93wW_VZ@fedora>
References: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
 <20260831-nsim_speed-v1-1-7a651ee65738@kylinos.cn>
 <53215678-05bb-4191-b5ff-aa236b16a96a@lunn.ch>
 <apZzJDVtENpAluhT@fedora>
 <18c7a000-97ad-459a-bb9c-5c821274e9f3@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18c7a000-97ad-459a-bb9c-5c821274e9f3@lunn.ch>

On Tue, Sep 01, 2026 at 02:43:39PM +0200, Andrew Lunn wrote:
> On Tue, Sep 01, 2026 at 02:39:32PM +0800, Hangbin Liu wrote:
> > On Mon, Aug 31, 2026 at 02:16:46PM +0200, Andrew Lunn wrote:
> > > >  static void nsim_ethtool_ring_init(struct netdevsim *ns)
> > > > @@ -250,12 +276,16 @@ void nsim_ethtool_init(struct netdevsim *ns)
> > > >  	ns->ethtool.fec.active_fec = ETHTOOL_FEC_NONE;
> > > >  
> > > >  	ns->ethtool.channels = ns->nsim_bus_dev->num_queues;
> > > > +	ns->ethtool.duplex = DUPLEX_FULL;
> > > > +	ns->ethtool.speed = SPEED_5000;
> > > >  
> > > >  	ethtool = debugfs_create_dir("ethtool", ns->nsim_dev_port->ddir);
> > > >  	ns->ethtool_ddir = ethtool;
> > > >  
> > > >  	debugfs_create_u32("get_err", 0600, ethtool, &ns->ethtool.get_err);
> > > >  	debugfs_create_u32("set_err", 0600, ethtool, &ns->ethtool.set_err);
> > > > +	debugfs_create_u32("speed", 0600, ethtool, &ns->ethtool.speed);
> > > > +	debugfs_create_u8("duplex", 0600, ethtool, &ns->ethtool.duplex);
> > > 
> > > debugfs_create_bool() ?
> > 
> > I'm not sure if anyone want to set nsim duplex to unknown for testing.
> > Do you think that we should disable this behavior?
> 
> Ah, i did not think of DUPLEX_UNKNOWN.
> 
> We need to consider Jakubs reply, what are you actually testing here,
> do such tests make any sense?

I'm fixing a bug in bonding that need to test with different speed slaves.
So I add this feature for netdevsim.
> 
> If they do, i think some validation would be good here. We already
> have:
> 
> static inline int ethtool_validate_duplex(__u8 duplex)
> {
> 	switch (duplex) {
> 	case DUPLEX_HALF:
> 	case DUPLEX_FULL:
> 	case DUPLEX_UNKNOWN:
> 		return 1;
> 	}
> 
> 	return 0;
> }
> 
> We don't expect a driver to set duplex to 42, so why should the user
> be allowed to do that?

The user interface (ethtool) setting is already handled by
ethtool_virtdev_set_link_ksettings(). Here is the debugfs issue.
Since no one is asking for setting DUPLEX_UNKNOWN, I can use
debugfs_create_bool first.

> 
> Also, SPEED_UNKNOWN is -1, so you need debugfs_create_s32().

Ah, yes. Thanks

Hangbin

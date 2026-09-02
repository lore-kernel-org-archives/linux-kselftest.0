Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1454AEEF;
	Wed,  2 Sep 2026 12:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353396; cv=none; b=M8UJd0z9IFUbL41L6baX9PJWxxHfNZA3l8bEJ4GglhpIB++5rABicSTPZj2MOZ6kOse8YbN7PrFZyhneiuZGnXRgiLj4qBSf8qN+M9c6pYtzSTVUllSJLYfSS05YJEII/asFjV3lHqk2cC1cEztKPcatto0aLR32gZg0PVq4+xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353396; c=relaxed/simple;
	bh=QUzmOVQxxqtdVnvQB9HMHE2A4FuYP28210Lnj66Fq80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xflx9bM5Lx6szVY5qHKywW8RP2oiDWAAdCPiIms7D1Y6ukVTwGU0612SISJPXnu1exRR5w0L7iCZgrnkKOKJwsQpjleBHEYL5viJU7EjAnH0aJWaRg0Uv7E5sPMgS7gV40EdRCSL+tpHqHuUx8reKUIfVdck+lcG0gxym31RNks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=y8DPUWkY; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="y8DPUWkY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=v7x3tNMfYOZJ/vzNz/QZq6mfB71qAFnjtCenaOhQbqw=; b=y8
	DPUWkYJkoVIQbNlGdJhE6G2+D4crcDEM9ONnC7k08cn2DJFyQ7P1ZF9GnLrZ/6hm4zrLybCb77isv
	LdKFenBBbcbjRNY3Mp0b4UvVpypl4zhSo3WhO7CQZ2AGaOzdDlLoCRzGduC0n3prtquEdFvPZfvzp
	DKO+IDxykZsBOuk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1kPR-002WIA-QG; Wed, 02 Sep 2026 14:49:45 +0200
Date: Wed, 2 Sep 2026 14:49:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next 1/2] netdevsim: add link speed support
Message-ID: <a23b1446-d541-4f2d-ab3f-474285b5d7b4@lunn.ch>
References: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
 <20260831-nsim_speed-v1-1-7a651ee65738@kylinos.cn>
 <20260831150818.660de896@kernel.org>
 <apZ3f3vm5sUrcyrZ@fedora>
 <apaLl13Saka4Sw1J@fedora>
 <4892d03c-6493-4c1c-aaab-39d71ddf527b@lunn.ch>
 <apeDXBASpPvAaWcG@fedora>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apeDXBASpPvAaWcG@fedora>

On Wed, Sep 02, 2026 at 10:01:00AM +0800, Hangbin Liu wrote:
> On Tue, Sep 01, 2026 at 04:21:04PM +0200, Andrew Lunn wrote:
> > > OK, here is the reason. In taprio_set_picos_per_byte(), it init NIC speed to
> > > SPEED_10. If the NIC doesn't support get_link_ksettings, the final calculated
> > > picos_per_byte would be a extremely large number 800000. The later tc taprio
> > > testing `tc qdisc ... sched-entry S 02 300` will always failed in
> > > fill_sched_entry(), as min_duration is also a large number 48000.
> > > 
> > > After we supports get_link_ksettings for netdevsim, the speed is 5000 and
> > > picos_per_byte will be init to 1600. The later min_duration checking in
> > > fill_sched_entry() is 300 vs 96. So the tc qdisc command always return 0.
> > > 
> > > To fix the test, I think we should reduce the interval number. e.g.
> > 
> > Why not just set the initial speed to SPEED_10, so nothing changes?
> > 
> 
> `nsim_leaf_tx_share_set` and `nsim_leaf_tx_max_set` compare against
> `NSIM_LINK_SPEED_MAX` for TX‑rate setting. Using `SPEED_10` as the value
> appears too small. I am concerned this could break other existing tests.

Well, 10MBps has been around since 1983. I've not counted, but if you
look at all the devices which Linux supports, i expect it is the most
popular speed.

I suggest you give it a try, and run all the tests. See what
happens. But to me, it is a safe choice.

	 Andrew

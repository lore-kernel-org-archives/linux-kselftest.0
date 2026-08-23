Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04389625;
	Sun, 23 Aug 2026 00:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787443509; cv=none; b=EdniM5pXlejeUXJkABv9U1gNiwEHrof08A56b4z4XLZ/JMaFxIHBZjGYCyuZUlX4qtCZ8U4LCAtAdfcnM0VKr7f2+thCfeydwS85smpMh0hhaFCF3k00kM/VTg5JirX1zYRKt+ed/61txK2VBk8SS59MVP+y+6e02yqZqPxow98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787443509; c=relaxed/simple;
	bh=xWZqd2CPwADIUZrJ6OW5xZKTaqgHzc6OyJo1WLJ87G8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNAkQOuf8PYEYu8iw3BvXTDvlD/BKhPRR03iUKalpBG5nFmA4cGdFb+Id6+GbibImjTRXJrPJjW9VKVag9G6kgXT07v4/3zLoWhZmLmt0Lj6YLakZOy2INkQQuyHZN3gvM1ajFjJ8Nm8vbugmwlJWvcdAG05HkIGv/SLtjuqJjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=fafGSauA; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fafGSauA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=duQ86+wN0ZS4fzoMXgzUx9KzRhQyssWsDaclYlPUpRg=; b=fafGSauAonvof8yzK+PfRPxCN7
	YAoQpzFb2TPH/99SJVAYegTh8AciPFU7sQlkD5Hm/MazIZtYxT7sInNSJhBG3qqrsdSSiUetrxm7b
	hVN7DbboS7lqn3RHr2t1u9iZjgC5iEk8tFD/NHuqqSMoB7yogBXniYb3+tGifjUI11oc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wxvha-0015GQ-4A; Sun, 23 Aug 2026 02:04:42 +0200
Date: Sun, 23 Aug 2026 02:04:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, shuah@kernel.org,
	joabreu@synopsys.com, yi.fang.gan@intel.com, jun.ann.lai@intel.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 6/6] selftests: drv-net: Add VLAN test
Message-ID: <d614d8de-0da2-4673-bd11-02497d8a37e0@lunn.ch>
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
 <20260821170959.79708-7-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821170959.79708-7-ovidiu.panait.rb@renesas.com>

On Fri, Aug 21, 2026 at 05:09:59PM +0000, Ovidiu Panait wrote:
> Add a test that validates ping traffic over VLAN interfaces. It aims
> to catch drivers which mishandle hardware VLAN tag stripping, in
> particular QinQ.
> 
> Three VLAN configurations are covered, each with hardware VLAN stripping
> enabled and disabled:
> - a single 802.1q VLAN interface
> - a single 802.1ad VLAN interface
> - an 802.1q VLAN stacked on top of an 802.1ad interface
> 
> NETIF=end1 LOCAL_V4=172.16.0.2 REMOTE_V4=172.16.0.3 \
> REMOTE_TYPE=ssh REMOTE_ARGS=root@172.16.0.3 \
> run_kselftest.sh -t drivers/net:vlan.py
>   TAP version 13
>   1..1
>   # timeout set to 360
>   # selftests: drivers/net: vlan.py
>   # # Interface: end0, driver: st_gmac
>   # TAP version 13
>   # 1..6
>   # ok 1 vlan.test.8021q_hw
>   # ok 2 vlan.test.8021q_sw
>   # ok 3 vlan.test.8021ad_hw
>   # ok 4 vlan.test.8021ad_sw
>   # ok 5 vlan.test.qinq_hw
>   # ok 6 vlan.test.qinq_sw
>   # # Totals: pass:6 fail:0 xfail:0 xpass:0 skip:0 error:0

> +def _setup(cfg, outer_proto, inner_proto, hw_strip):
> +    """Configure VLAN stripping and create the VLAN interfaces."""
> +
> +    feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
> +    set_ethtool_feat(cfg.ifname, feat, {"rx-vlan-offload": hw_strip})


+        if current[name]["active"] != state:
+            no_change = False
+            if current[name]["fixed"]:
+                raise KsftXfailEx(f"Device does not support {name}")

I'm not too familiar with the self test framework, so i could have
this wrong.

It looks to me like you fail the text if it is fixed. But does not
fixed just mean the hardware does not support it? So i think it should
actually skip the test?

Now, if it does not say fixed, but ethtool -K reports EOPNOTSUPP, that
would be an error.

Having said that, thanks for spending the time to add a test. We need
more tests like this.

     Andrew

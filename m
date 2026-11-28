Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795885645;
	b=17myOgh3CyPCE00gkDo8BWIZASxUNhXzKfe6SHoe35hb+PJrN4DcSlXrVd5f8toXhbet
	 U/h6TnFzcS0I6i55vQxbTZ1RS5BRawGlX0aneVsZoV8l3WKi4860xn6SZv9P59PpHi9Nv
	 ftL6c1VQbQuhiX8s4rFn/xjYg8hlRNTsN0l8/K4871Ni84twXEGxplgE32gE08OjU0ju3
	 Rz4vgvX7QGGu2wl0G8kWIJwJxje7ESYZS8d7ZmCliXnV+0OD7bc4xfOttDQQNJpniWBrd
	 P3/crJ3huQge4yJsVzF5S01VNgUerUsbXG2ldHlwvkBb0ovvEe6ad2cdr3MgMBACljg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795885645;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=QCe2redy+XxR/or6UNphwy5IpNUEjHY5f4syZF+JSJc=;
	b=IZ2SIL9m8w8cmcgjrxie/untA/mESMYsExhe39VcR+iakHZJULzbHpCt8E9IAxvzsTvk
	 cORjQDdnwiZ4ZUCAgK0Q6EzZ46gjAWem5x8AYOvtbASra37QKpZ/NwLe59n19Fuqv2/Tf
	 iwh+VJx/wFZmib/VD3sPbwDrP26Hu6yWXJ3BMnzcuWzT8/9xOMu2w7xCE1LXOdYz5rUKq
	 l2aO4LsiiBzFQU2Q2y3QXgoXRSOHVbq/xcJ1juYSJlQYLRGd0inMJLJTCJgd/naswP+LU
	 vll5vLP/ddbC5ctjRZCV6/jjIQvTQ1YBNh03GQiTTgMMpNHIOss8iasdVa33rtDh++g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=IKwvi4NS;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FDE606A31C;
	Sat, 28 Nov 2026 17:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99FDE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=IKwvi4NS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QCe2redy+XxR/or6UNphwy5IpNUEjHY5f4syZF+JSJc=; b=IKwvi4NSAuEc1vnveUrvIra7jO
	w9YZAhRMwgXN4MWNq+aYouYY9K1a37Q+OQJW/iieCeThUq4pe/w25PhtNKhG/46V/TYyHOAm0U8tV
	OrYFDMG/AJY2gH1xbvadvFBk9XPsjMLBxRPtS9jMRJCdZ+tdGA+yXJM/fFFZnuIYXTwk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xXLtA-0020li-L3; Sat, 28 Nov 2026 18:07:04 +0100
Date: Sat, 28 Nov 2026 18:07:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Breno Leitao <leitao@debian.org>, matttbe@kernel.org,
	thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2] selftests: drv-net: pause: ensure the link
 partner sees the link when probed
Message-ID: <8c278a5e-588f-4b8e-a89b-2dfcafef2e64@lunn.ch>
References: <20261128101725.17398-1-maxime.chevallier@bootlin.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261128101725.17398-1-maxime.chevallier@bootlin.com>

> This has been found while running the stmmac kernel selftest suite
> between an imx8mp + ksz9131 PHY and a Intel i350-T4 card, the
> renegotiation happened too fast to reliably see it on the intel card
> side.

The logic of the patch makes sense. So i've no problems with the patch
itself.

I'm just curious about not being able to see it. Autoneg, at 1G, take
a little over 1 second. So if you can poll at 0.5s intervals, you
should see it. Is ssh to this machine really slow? Or is the Intel
i350-T4 driver doing something odd? Slow at reporting the down? Fast a
reporting the up?

	Andrew

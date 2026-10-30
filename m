Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391162;
	b=q+rzBSpFdp23PQ0YzV0NsnfuQ1kc5KH/1IEPWbawzqEuD8YLr3+EC5sPsb6xj83d8pzY
	 B3VMN7xzAsscGcAY0G8OO+MzqkYSbjfwVWKXdNisDQmEzK5WpYevB7qdYerRmrIhWwuS1
	 tnKYoTvKkDbTddY0qGfuKRrdhZISWanbWjP7aVKRCzMoKVOiFqYUd+iUhYwAkAbnbrhEB
	 uu2iK2NQ0mAs8xNXLGcfQXYc8VrxQ7Qpj537Tn/xD2lE5t98YjwrlQ9CmIGJWSNGYnxU7
	 FXF8y1FfchckGJ0NhAHhConjvURwQmovAdrybLYKu0Nb2qOktURWvzYXlDz1/cAb98Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391162;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=q99tJOfnx2o8DHVlW4CQw5kRWagm9RKTCtNKCSjriME=;
	b=D/9OV1/R47qHc2OgdJXcasnA25q65EnZatPAtY06LCdRA20LN3Z0POR8hX9VXBfQe7m6
	 gYzJHuJXU+59nOGRbU2ku48S9X7HY9mhwYS7/aJl9EVXeb5/bKojdbRZPxuhklZB1KFAU
	 YjISpwfISGVQ1Q9U8bATb+oESvWZx5UH3KX0jT0V8HLNYrQCtUI7nzVkCyDWU0RUu34Tf
	 9aBR7OOd2CjNo0oEDM2RryyiONZeY2xZmOSrKy1JBSbTBxt0Nk3U4vcQl8rlhOv/vmAhw
	 e79/RtRCJq3/pFyCwqTNvZWoJusMhVuiZeySYXMpRu1bumkPUHCvwSrPXp4qKZcgbjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Vs6whWER;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F592606A31A;
	Fri, 30 Oct 2026 20:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F592606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Vs6whWER
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=q99tJOfnx2o8DHVlW4CQw5kRWagm9RKTCtNKCSjriME=; b=Vs
	6whWERrd7s7aNhMb5XGQ01OW7aEewra+G/LNkiPh/Qzb990ac11i5ZJ9v90hVkiFLSSXKC6YzhNW5
	YZIkk2unh2lpgzzRc4BxifTmIaXs4i//JO8/1fveBjuPMOn5tHVvn917kHV9/l2SAyQgFB+Pk489J
	++lpcuT5vlaxqnU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xMsxq-00DQeX-PI; Fri, 30 Oct 2026 21:12:38 +0100
Date: Fri, 30 Oct 2026 21:12:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, shuah@kernel.org
Subject: Re: [PATCH net] selftests: drv-net: pause: Skip support tests
 without link autonegotiation
Message-ID: <2efe9f61-5a04-473e-bb57-12d2779ad829@lunn.ch>
References: <20261030173516.1002250-1-mohsin.bashr@gmail.com>
 <701c6f7e-e715-4647-bddf-48a1485afbe2@bootlin.com>
 <7cd99851-5bc0-4db8-a44c-a664c3f824b1@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cd99851-5bc0-4db8-a44c-a664c3f824b1@gmail.com>

> > Or maybe a bit more clever, have a quick check to see if the device accepts
> > an ethtool -s XXX command ? looks like fbnic will refuse all of'em as it
> > doesn't have a .set_link_ksettings.
> > 
> 
> Yes, checking whether the DUT accepts ethtool -s is one options. We could
> reuse the existing autonegotiated and forced-link attempts, and report SKIP
> if neither allows pause checks to run. Alternatively, we can add a remote
> arg to require_link_autoneg(), default to True, and pass False for this test
> so it checks only the DUT’s autonegotiation support.

There is a subset of pause configurations which don't require autoneg.

ethtool --pause eth42 autoneg off [rx on|off] [tx on|off]

These can be implemented by a device which does not support
autoneg. These setting go straight to the MAC. They are never
negotiated.

	 Andrew

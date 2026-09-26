Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD34B37BE6C;
	Sat, 26 Sep 2026 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790409215; cv=none; b=YrGBPugeT/7xHPMRZJ7U1Zq7usoy5jbFyERUERyr/BZwtNX4EfCuEVzobC2HERLsdJLkBpLVkh9yH0Nyd7iw0/n3o9x/YxDT92wlNqAQCzuHGg9At6+8PcaC/pZMnU98zOjzxTKq8IMw12XAk8ht1BDLYh0Dvy5e2iZDQhU5oXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790409215; c=relaxed/simple;
	bh=6jOziBGMvdjmexMKTM1VJWL/oqoFLfajuM7mGGX87ys=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SIyEram8y4Jm6/lyEQ0B4SxKp5y1US9M0w4jPDvxQBouS6v1gfT+1Uf+8dYawaEswdCTxCVau8vLZ3QYuHD8UfBiDqERZo3PRLEdh3THoJgsDR3A2ju2iEDWx3jF2J9OyFsp9oOUtlZizKeB0mJIImsxZ4QGi6XT/szw07tBj0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=iUaBkx8j; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="iUaBkx8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1790409209;
	bh=6jOziBGMvdjmexMKTM1VJWL/oqoFLfajuM7mGGX87ys=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iUaBkx8jdetc5Q+N6Aywmph/y41WVd2Ndj+psVZE/ZPRbe2/0Zwb1tWmmgpwv3HTf
	 y2wYSCbGYvqdm4MLAviAKqsSAMBb4bp725FVjlMmvfP+4MrJRFDQi+nhTfQ6qMR0AI
	 rcNyoVOHg5MLdA+LaK5gjxJK9DQF+eUMb52sPmi5eaRsSDAFvZ3BQtb73dLrjzSZ5F
	 tEPdFO5RN68SXE8cHSwX2pSZ/1ewSfmlM2CipO2HcmfjCKN6Snfe1P2nVvK3U60wY8
	 d/0R5X/Gee20E9n8zoWnTXl8W7/YYd9tiuG27FiVqviFgtgYh4/pgY0aTxQnT2Tv+m
	 HlRL/dPz+t8Dw==
Received: from squeak.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 52CFE6CE4F;
	Sat, 26 Sep 2026 15:53:27 +0800 (AWST)
Message-ID: <8edc4e71edceb124e2dca233cddb75e198b53a51.camel@codeconstruct.com.au>
Subject: Re: [PATCH net-next] net: mctp: Stop selecting flow support for
 KUnit tests
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Karl Mehltretter <kmehltretter@gmail.com>, Matt Johnston
	 <matt@codeconstruct.com.au>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski	 <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman	 <horms@kernel.org>,
 netdev@vger.kernel.org, Geert Uytterhoeven	 <geert@linux-m68k.org>, Brendan
 Higgins <brendan.higgins@linux.dev>, David Gow	 <david@davidgow.net>, Rae
 Moar <raemoar63@gmail.com>, 	linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, 	linux-kernel@vger.kernel.org
Date: Sat, 26 Sep 2026 15:53:28 +0800
In-Reply-To: <20260925192510.93840-1-kmehltretter@gmail.com>
References: <20260925192510.93840-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Karl,

> MCTP_TEST selects MCTP_FLOWS, which also enables SKB_EXTENSIONS when no
> transport requires them.

But we want to test the flows support, why disable this (and
consequently skip the flow tests in the vast majority of test runs)?

> Remove the selection to follow the dependency
> rule in Documentation/dev-tools/kunit/style.rst.

That suggests "depending on", rather than removing the coverage.

Cheers,


Jeremy

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793138413;
	b=V2n8jXw7ru8sXUCic6ZpCOo2MLBA0GFREHWn2g2RAESrr3tejRJyEQ8qi8l1NDbxLBcs
	 n2zlyoqgMB63DVadIzGQbaud2V8qDdwFd56+uwc9CoItehh89cB3MXSUktsLvNvLd2DbY
	 Ugv425rZf4Lt6+L5TsGDUnJgcof8OYyjZ4FHg3z2L+b3crwN1aFCyRk7aLa+kQMCkYIPU
	 yBXxCuQFOkMvYYWDYNoVsz6zEgrcXXBr+58fKATByxi2Pr/ZQ05skhZIvSgqrTmztgnV2
	 6R/KrdEgykV12uwVRL/hGA9NE1lrrDX333N3jRWZVadpNYKIhn3TwJSH0bkUqMJYBJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793138413;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jYw0mvLoIHaaNVzRppsG2yPAhT6RKw9V7bAWNQGe+fM=;
	b=GJ15sxWVHK9yuPPea3/ZmYHCvP9iJxwf2UjuHcQ8lKThW4uVNcUN3nunwvmx/+jMKT+J
	 9Hpxr4qDadS4K+Savc8uj14+ecM7X3ssWFRF25/GsGaqzXhNPn6hfnjUBLy6QZGHjeRqw
	 NYpfsesdE9gJoirF4uFh/y6pdtI1Gnbw36UEzRKXJZDqbyq68vDnsRWoXwBhIfnIi5gPQ
	 8zckuLjRuDMVlQDs1HG071Z+oF2pVvl/mKTRozjpIWH7oNMdU4sWUxac4AQGpFJ0zRWzy
	 aHIxGddyKIO9u9R+IL8TEnMiqbLVV/ZIRE5Ec7s2nlsUp73Zny5qPoXyb/R2a44P0pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FmCbooIB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0FF606A31F;
	Tue, 27 Oct 2026 22:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FmCbooIB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FD01F01825;
	Tue, 27 Oct 2026 22:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793138412;
	bh=jYw0mvLoIHaaNVzRppsG2yPAhT6RKw9V7bAWNQGe+fM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FmCbooIBIIiJybrIt/LgzHjnaI02bVaY9qPSrSIHXncGXvBrYsj8ayab/WnpWlO8A
	 HaqUW4SpVDAQZXhSbRgAa79f+mviP7FT2JnBMkA26RSCBZpE3axvGa/PYu3ZK0JNw8
	 xD3H6iAcl3TlwVvzNrnUAvg5M68Z3/KvoJktox7jJci+d3Ej2ishtMCilyd0ZdWrhX
	 QwAMcZiOyo0Nh7PCLuFwOI1ddRei4UNMEzu6YiawXUWKZZpzGGF6FnK2imq/t4FQJN
	 ovrbN8GD8mZQLNWpmwXiBFRoQgUqpl8EXoHpfBdYsypaMMgfsXQ/MCc+BFfaDZSzT0
	 rc7P6aXZ1ANcA==
Date: Tue, 27 Oct 2026 15:00:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Chuck Lever" <cel@kernel.org>
Cc: "John Fastabend" <john.fastabend@gmail.com>, "Sabrina Dubroca"
 <sd@queasysnail.net>, "David S. Miller" <davem@davemloft.net>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Dave
 Watson" <davejwatson@fb.com>, "Shuah Khan" <shuah@kernel.org>, "Qingfang
 Deng" <qingfang.deng@linux.dev>, "Eric Dumazet" <edumazet@kernel.org>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, sashiko-bot
 <sashiko-bot@kernel.org>, sashiko-bot <netdev-bot+sashiko@kernel.org>
Subject: Re: [PATCH net-next v6 0/9] net/tls: Receive-path fixes for
 zero-length data records
Message-ID: <20261027150011.627a5115@kernel.org>
In-Reply-To: <01a7e46d-033c-4a39-ae32-0b7bdde47ca6@app.fastmail.com>
References: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
	<20261026153748.29911bae@kernel.org>
	<01a7e46d-033c-4a39-ae32-0b7bdde47ca6@app.fastmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Oct 2026 09:01:35 -0400 Chuck Lever wrote:
> > The shape of this series is still quite confusing to me.
> > Let me take over a little bit so that we make some progress
> > (while retaining your authorship where possible).  
> 
> Fair enough, thanks! The first 2 patches look fine to me.
> I'm not sure whether I need to add an Ack -- they already
> carry my SoB.

Thanks, no need to comment on the first 2 they should be
uncontroversial. Please comment on the rest once posted
(I probably won't get to it today..)

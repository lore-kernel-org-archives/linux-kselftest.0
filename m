Received: from hal.phenome.org (hal.connected.by.freedominter.net [91.132.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500A3446853;
	Mon, 21 Sep 2026 20:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.132.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023047; cv=none; b=b/wQSNovDDxCMPDzI6v63UUQ8pYpM/AqMZgPCn/XkX3uKun58K4ecalO70dNOiph+IKhTiIvfOhVlhwHYBno2WPdorTGSSogAOgY63QdD4JRD3f28zbe29WJuM2O0BhnniwHlJPeilEVqNiXUd30zx5k7z60vwwpNc5mrzk5B0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023047; c=relaxed/simple;
	bh=CxkuXt6IPD4NF7cqoA7ABvTHnpiatRh+Gm0caYgsL+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBNUoq78XrVzpUjaYl/HTAFwTtMl0AVCBBbIe79bTvp69rZ12geHEIgwHxcwnauXUZ5L62TF0yXmDV0XjNEGk3rRj6qY/ASy6uieNud4UD4JDv5vNGCaMrkzDowhHR7vPwMKvJ+xtgDuAKbmvAbXp8MIR+OX7cnrNVrUpKHJpJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bern; spf=none smtp.mailfrom=hal.phenome.org; arc=none smtp.client-ip=91.132.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bern
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hal.phenome.org
Received: by hal.phenome.org (Postfix, from userid 0)
	id 6CE14100267; Mon, 21 Sep 2026 22:27:11 +0200 (CEST)
Date: Mon, 21 Sep 2026 22:27:11 +0200
From: root <root@bern>
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: Antony Antony <antony.antony@secunet.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
	Jamal Hadi Salim <hadi@cyberus.ca>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, Yan Yan <evitayan@google.com>,
	Tobias Brunner <tobias@strongswan.org>,
	Florian Westphal <fw@strlen.de>, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH ipsec v2 1/6] xfrm: state: exact mark/mask match for
 SPI-keyed control-plane SA lookups
Message-ID: <arGTH94PM_oswTpF@bern>
References: <migrate-state-fixes-v2-0-c3e2767f0d96@secunet.com>
 <migrate-state-fixes-v2-1-c3e2767f0d96@secunet.com>
 <arEw6qLcr_YEI8Wl@krikkit>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arEw6qLcr_YEI8Wl@krikkit>

On Mon, Sep 21, 2026 at 03:28:10PM +0200, Sabrina Dubroca wrote:
> 2026-09-08, 08:48:45 +0200, Antony Antony wrote:
> > Add __xfrm_state_lookup_exact(); wire it into DELSA/GETSA
> 
> On the "other proto" branch of xfrm_user_state_lookup(), we call
> xfrm_state_lookup_byaddr() -> __xfrm_state_lookup_byaddr(), which
> still does a "loose" mark match:
> 
> 		if ((mark & x->mark.m) != x->mark.v)
> 			continue;
> 
> Is that ok?

I think so. I felt byaddr is not used and aslo since there is no unique spi
if touch it dragons may wake up:) most used cases with SPI.


> That's the only thing I've noticed in the series.
> 
> 
> I guess someone could claim that this patch changes behavior, but if a
> user somewhere notices it, I think that would mean they were relying
> on insertion order to delete/etc the right SA.

yes that is a risk. I tried find use cases and got nowhere. 
And concluded it was an oversight. Also note the
cover letter, "policy" had similar change a while ago.
No one complained yet?

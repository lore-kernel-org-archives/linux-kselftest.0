Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6333A9622;
	Fri, 11 Sep 2026 22:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789166853; cv=none; b=unLgdKxtBHhMzc8PNU0n6q92zu47Gsb6I6bXQsg++m29bftatxpFo1vobMw7phFMzKS51X3Fskl5QO9Ahvre2hrmTQ5Vo4TXibJLO3otk1tm+UePei4dZjjWxzwettSvHWBKJC6bwVrODLtvDv5ivK6OJXEhI1GLo2sNdytylvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789166853; c=relaxed/simple;
	bh=NAw+HZLaSGi05f8Ch9oX0sWYilzR0uJPZ3tngf688yM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gyGSW3ziqSDgJubhCh+yOtAPXomEnNBS2Gnk5vrtezCRAFO6dcgNJvupTEi26ACsJzym1o0/i5hGXUVZjLa5QsBfx9062EkgiZzmym1Ton7bycVcAFqCAb1lT4WwM0DB2Hk2iV4xsWlN82xtTDNqBKmjwH1JyfiGjRtGSrS+gig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSYPxCN9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSYPxCN9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3031F00893;
	Fri, 11 Sep 2026 22:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789166851;
	bh=IQMxpZY4GRpOWmxOkQkfdE8RMYKEu8sXeTMBcFaeC3g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eSYPxCN9WG/DReET9gM3fOsz+5jxLq4W4NwxBzaXgfkx4suKeL240/136lKuhUNLp
	 Mgvvna69A+DdEQ+uJ1sG+gLk4gAsnBpr7CNmTiZPsQfCyAi73OHJ1ciJj8PkVGXOOP
	 6dkZKxwAwoihi2jmac4OXDLTIqv4zX/tjXK4L/7hXz0wA4Iju4Fwi5Eml9Hr53UjHv
	 Rk7sXMTqzSt54IENJhbNQWbM1dxi5q/9CMROYjTZMy8iQ43GNhhzOXo5lEfAwLsLdO
	 N7SS2In4z5+MyFveV1RpoJEfQzcS44/++8elPcMtcgQgTfS6nouXD443EFEQ3ZOYpz
	 4xyLlgvgmPjTA==
Date: Fri, 11 Sep 2026 15:47:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Alexander Duyck
 <alexanderduyck@fb.com>, kernel-team@meta.com, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
 "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Mohsin Bashir
 <mohsin.bashr@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Bobby
 Eshleman <bobbyeshleman@meta.com>, Dimitri Daskalakis <daskald@meta.com>,
 Weiming Shi <bestswngs@gmail.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Tao Cui <cuitao@kylinos.cn>, Pavel Begunkov <asml.silence@gmail.com>, David
 Wei <dw@davidwei.uk>
Subject: Re: [PATCH net-next v2 1/5] net: Add netdev_config helpers
Message-ID: <20260911154729.583325d6@kernel.org>
In-Reply-To: <aqPHdSYLDWhnRSQ_@gmail.com>
References: <20260910180908.1506533-1-bjorn@kernel.org>
	<20260910180908.1506533-2-bjorn@kernel.org>
	<aqPHdSYLDWhnRSQ_@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 02:20:35 -0700 Breno Leitao wrote:
> > +void __netdev_free_config(struct netdev_config *cfg)
> > +{
> > +	kfree(cfg);
> > +}  
> 
> When I read this one, I was expecting __netdev_free_config() to "become
> more complicated", but, it continues to alway be a single kfree(). How
> is this helper useful?

It was taken out of a series which had per-queue config so there was
also an allocation of a variable size array. I asked Bjorn to add this
patch, anyway, otherwise we'd need to open code netdev_reconfig_start()
in a second place. The per-queue config will come sooner or later.

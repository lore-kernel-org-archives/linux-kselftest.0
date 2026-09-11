Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CD046AEFE;
	Fri, 11 Sep 2026 09:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118477; cv=none; b=jfiSJ3ET8+zuT/eAEuR8Jkvai3xuiIiOxi7vyqfwD7HIyObCKICb1t3ZDLg+geC7bjiEL4PmWIg8G1ySdb0i62tlAs1P9NolEcg/SvLiKBaLK6H9aqwA4bf7Rv+evjZqTE3UbwxVES6H2o+gZeSlsWlGMlmthRZvVnb43lwgwls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118477; c=relaxed/simple;
	bh=fCdlXxq+zUaB2qmtcwWfB3Gqw3tq2DH54BM3orPcxFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ecfh6o77MEj4+eQVvIhy0hJDV1dUop3dStOw5idLwt+mtSh7pCyQYnJL9MydzsXarTdCc4yNGjJraDZCGDuA1GIMxL/seUSXYQXyHBb6eSFNz95S2Y/jGE6VurgPbb/YeVeHICZGeLXucq8VjmLM95apSqO4nX7q/Z1TYZYdeaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=OTvfKVZb; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="OTvfKVZb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=keXq5wLwu+ponDlAGL7vsl7alCL15UlK3Kt51lUl7fw=; b=OTvfKVZbm/pQglYKShkEUvLyWs
	Vq9seAk18LWUTSB3kPUogsbfOt9LCiBNQqaU8JVxdF8I0nVIozzUDXUTilI5Ly7ysFWw56Biox6pC
	aS8af7aVPonx9fl82HTdszxf/NT2yigQ0n7BW7jDOCKelda0wtXF8yyfftBYGfis8fAXhxdf5MTY9
	bNZsrsyRms1pOzGDecYEO5ypFofwLparfNXmrQG60UgkIQlBfdyQZc2zFROAhcJgYm6pGOG/wTqhX
	GaNsB9aAcc5IZdd9uNz2wzLEmlzq1Aedfeeg89+OIcf3zHFFOWz2ayNdydzm8s3fBwFMvtuT7WgWu
	3tQTVy7g==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4xR4-001BZg-0g;
	Fri, 11 Sep 2026 09:20:42 +0000
Date: Fri, 11 Sep 2026 02:20:35 -0700
From: Breno Leitao <leitao@debian.org>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Alexander Duyck <alexanderduyck@fb.com>, 
	Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, 
	Mohsin Bashir <mohsin.bashr@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Dimitri Daskalakis <daskald@meta.com>, 
	Weiming Shi <bestswngs@gmail.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Tao Cui <cuitao@kylinos.cn>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>
Subject: Re: [PATCH net-next v2 1/5] net: Add netdev_config helpers
Message-ID: <aqPHdSYLDWhnRSQ_@gmail.com>
References: <20260910180908.1506533-1-bjorn@kernel.org>
 <20260910180908.1506533-2-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910180908.1506533-2-bjorn@kernel.org>
X-Debian-User: leitao

On Thu, Sep 10, 2026 at 08:09:01PM +0200, Björn Töpel wrote:
> From: Jakub Kicinski <kuba@kernel.org>
> 
> netdev_config manipulation will become slightly more complicated
> soon and will be used by both ethtool and the queue API.
> Encapsulate the logic in helper functions.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Björn Töpel <bjorn@kernel.org>

Reviewed-by: Breno Leitao <leitao@debian.org>

> +void __netdev_free_config(struct netdev_config *cfg)
> +{
> +	kfree(cfg);
> +}

When I read this one, I was expecting __netdev_free_config() to "become
more complicated", but, it continues to alway be a single kfree(). How
is this helper useful?

--breno

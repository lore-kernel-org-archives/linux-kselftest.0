Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89AC258CD9;
	Mon, 23 Mar 2026 16:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283565; cv=none; b=E1zk6BmBgXp9Jkcxc6Mfn1RsGU6bO6D7oVrevd/Yxbb+8EAlzbj4C0uBkYEh6Kpj6ZzOfg5XrE5AjcPUz2giwr7lcIK69pyZwfsygGUEiP5ni/bhjzWY6FUAInhEA/csN6qqOjFS7DBMaISUAKHbQ0BZ+pFMMmDjMs3ngZvBprs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283565; c=relaxed/simple;
	bh=pqu6HRZCgaWB8u/BeO6buPj6Q4iTFosPVH5QVXX3XQo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kxMtJL0I6rRv8S8QH5mm3iXK1zCpVLX9Lxu2aCwATN7a7iFwONpglaMpkxhDLeicfJ2XDNF60z+cgNUuduPJ4QxpkkoimePsW5w2gVKdTcRV0yd3/ivtqw7GJTUmC6ggi3Rpb6QI9gxIcQ7rSeRix/2S6utx6aXwKy7kl9ZO9f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5lyDj06; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5lyDj06"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45C2C4CEF7;
	Mon, 23 Mar 2026 16:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774283565;
	bh=pqu6HRZCgaWB8u/BeO6buPj6Q4iTFosPVH5QVXX3XQo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q5lyDj06CJp3pBtC3gnfCravA4a6NnF0TQFXLR8ixXbnA3+LMLI4dfmuw+3Ljv/CJ
	 XJ7CbCTNH2DdNrJisdNjVRLt7HjGBW1MrNK3tH6KH8YcDq9/ZlrOZiDbhACNU9TXIb
	 58wMaDWQt/DHIgkwULVcO1+TNulkYPr7l3KqPF599OK1sBI15T+uRsmTh6ikcLW0bc
	 ZsdX7UNJIvu/Td5RI3OBMPhbRgEQZ9bk/Iuhy8NczlzJMbaXkqKU8ISuFrqFQCIOLi
	 2I003J2jDd8ByTMKg4Vl7ezjHKz7uO2uBACdH4Me+9dePLoyH15KWV5ehao/IBDw2l
	 wa+0xZEQs62Lw==
Date: Mon, 23 Mar 2026 09:32:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: Cosmin Ratiu <cratiu@nvidia.com>, "andrew+netdev@lunn.ch"
 <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, Dragos
 Tatulea <dtatulea@nvidia.com>, "shuah@kernel.org" <shuah@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "edumazet@google.com"
 <edumazet@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH net v5 0/3] macsec: Add support for VLAN filtering in
 offload mode
Message-ID: <20260323093243.17c14edb@kernel.org>
In-Reply-To: <acFWIxzM-GxpAhjH@krikkit>
References: <20260323123633.756163-1-cratiu@nvidia.com>
	<acFODtfaa8LCKX4r@krikkit>
	<5ae5d08d578fce1a01a548fad8552a14df8c5679.camel@nvidia.com>
	<acFWIxzM-GxpAhjH@krikkit>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Mar 2026 16:02:59 +0100 Sabrina Dubroca wrote:
> 2026-03-23, 14:42:00 +0000, Cosmin Ratiu wrote:
> > On Mon, 2026-03-23 at 15:28 +0100, Sabrina Dubroca wrote:  
> > > Why not? Being able to test without accessing real HW is still
> > > useful.
> > >   
> > The tests now send macsec traffic over VLANs and nsim, it's just that
> > nsim doesn't deal with VLAN filters at all and there are no stubbed
> > vlan filters in debugfs, since real hw doesn't have that interface.  
> 
> Since netdevsim doesn't deal with VLAN filters at all, the "tests
> should be written so that they can run both against ``netdevsim`` and
> a real device" bit of the docs doesn't fully apply here?
> 
> Anyway, I think the original tests had value, even if they're more
> limited in some ways than traffic tests. HW/driver behavior could be
> hiding problems in the stack with VLAN propagation, those simpler
> tests don't have that risk.

To be clear running the HW test without NETIF= should provide
similar functionality to what the old tests could do. It's entirely
okay to add netdevsim-specific subtests/test cases or asserts.

Is there anything specific that you'd like to be tested?
Let's not make this about HW tests vs nsim-only tests.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135757;
	b=woiNLd5AZE/ucECHr9hqrgL+HDYHwxcZHxF3GZqXachjDl1ef7HvJWr58vo7hJothd2R
	 U6ZocQ4nGGWwl4oitoV0uw83XMzFXFP8iwO9M+HmGBspneUxtKEuOMQ1iq5ARS6mf0eh0
	 xXg1JiDZBNp7Ka4c/ltS2DsBF3/8mSoKt0MiQEXGztV0+bSdx4X3TRGnevodnT9dSAu/w
	 18HyWYuXoclxjJF6pjiJHZ9EhKHedmgVQnjwMpGnnqT0aLA8/vuxrEO9mlvNSvGPfj+Zh
	 XDMEN6XZbnJEdkBsjbKnxfoCiq0dR0D3jrsNkJlB2gFSFmhXv7Cq894NPqaKHWDMcsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135757;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1geKdmmBe6wShVVeouzZVWU6ZgEft6JbnCNtrUokX/0=;
	b=BwoyveiEF5IjBxPELqOEC6jaf8tp/vHgbeFCFJl/XiU5ZTjl+GpUrTpGvsnGIarIdIZ5
	 0ZJV/kENNjiz2wRdffhAUQVbFALWOFPN9kHnQcFTEai4aAMq659pLBpTMOrSH601IoQKk
	 DGe1Hfu3vgo3k81wQ1+PNjKF+JCwvKIkYi/qPsfpzJ8Iv6fvybdXsUVxfqNtObp3GuIba
	 jdfJic6SyIzFMnGSrNKHW8Ne3fMCYD627NevgetoHFYuMiLr4PGifHrlcV1idZ9apwsQp
	 IVFzzmBs3QZPaGouHTTzZ2TP/WxF4EA47E5zufiLpe+3y+fbaCE6qyJjsKTploKMi0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMTdTJIq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19636606A321;
	Tue, 27 Oct 2026 21:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMTdTJIq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D5D1F01825;
	Tue, 27 Oct 2026 21:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793135756;
	bh=1geKdmmBe6wShVVeouzZVWU6ZgEft6JbnCNtrUokX/0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iMTdTJIqfd7q3bqiB4lTjK+yCSECZ8NTgHmuEaDypAVHeQ7xRNc5nxvo/gsqIUyRt
	 Ayi7SIyk0hzgw/LkRweXI/fEVljOzlgSAtNf4I8TjksLR/0rtEw+bTJqk0ryJGGnOa
	 +jx/q/y9UaP/zhOYMHiFBeeU1Zx6mSkec5KAhd2WTDVGLwn9T6M3geSNMAb7CI/bpm
	 X/9Wb74ORm6qNrKKAtLrDqYy1cyfBkjpHp3EOLKo18pcilggRxSk/rhSFGId9kLgK1
	 brEZQPImp38oLRdnwS6neMhZ/GHluWmjbkHfxqEU/+tbrH54wcJC9hfZ+an5SG3Lqs
	 7T0NvE7WHvMZw==
Date: Tue, 27 Oct 2026 14:15:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Russell King <linux@armlinux.org.uk>, Shuah Khan
 <skhan@linuxfoundation.org>, Bobby Eshleman <bobbyeshleman@meta.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Breno Leitao <leitao@debian.org>,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net] selftests: drv-net: devmem: Skip when hugetlbfs
 isn't supported
Message-ID: <20261027141555.47156425@kernel.org>
In-Reply-To: <ce8f0d43-0078-41e7-a5d2-cf31c6dc97fb@bootlin.com>
References: <20261021090852.996899-1-maxime.chevallier@bootlin.com>
	<20261023105258.2a6349f9@kernel.org>
	<ce8f0d43-0078-41e7-a5d2-cf31c6dc97fb@bootlin.com>
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

On Mon, 26 Oct 2026 10:38:50 +0100 Maxime Chevallier wrote:
> On 10/23/26 19:52, Jakub Kicinski wrote:
> > On Wed, 21 Oct 2026 11:08:51 +0200 Maxime Chevallier wrote:  
> >> The devmem selftest requires accessing /proc/sys/vm/nr_hugepages,
> >> which is only available when hugetlbfs is supported. This isn't the
> >> case on all CPU architectures, for example it isn't supported on ARM
> >> 32-bits on cores that don't support LPAE.
> >>
> >> On these devices, the devmem kselftest doesn't skip gracefully  
> > 
> > We don't require graceful skipping. If anything IMO hiding the stack
> > traces isn't great.
> > 
> > If the check is extraneous and makes us fail some tests which don't
> > actually require huge pages please make that clear in the commit
> > message. Otherwise the net benefit of the changes is unclear.  
> 
> hugetlbfs isn't required for devmem AFAICS, but the blamed commit
> moved the access to nr_hugepages before the actual "is devmem
> actually supported" test.
> 
> I don't expect the full test suite to gracefully run/skip for devmem
> on these arm32 platforms TBH, it's likely that devmem is only something
> that's been used on platforms that support hugetlbfs anyways, but
> strictly speaking both features are unrelated.

For max clarity I should have simply asked - does it make any test which
previously failed pass on any of your platforms? (incl. some WIP
patches that'd add devmem support) That's basically the criteria 
I think we should use.

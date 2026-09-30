Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7D14BFE79;
	Wed, 30 Sep 2026 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768190; cv=none; b=SK1RV1kxd+3hLqvzFJoANpB+DiNdBYqrGSY35Rj4T/+N8HxfY9CioeNXGPwlE89lZx996c6ylm6yWPFOGSzhShkagGkIu5R/OamR0+5bnmssOMI8Cio3wzHEnknzd3C2wY8RLwmFLtN7SPm2jFmDakLD7YYAZAJVSJxhlzWB9SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768190; c=relaxed/simple;
	bh=Alp02oUhOmw2FInfj3F0v5vxxPMfM7u9OWYEL20KVU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XASwCMknb++hJA6jVmyqKlteR5vk4QXq9e00cJEp5JJJTfbjZ9yX4Jgm0MbduRRsP2lJkHBcv9vCJKDNu2CybDDLIwlNkP5zjw9RS+A+CT6AxDoYdSwutMsGwrRUtqcmrWVMwuZXoxFQm9BWRHUbw6UMjOEhgvofK6bPz/ngVUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGHxBz10; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGHxBz10"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3481F000FF;
	Wed, 30 Sep 2026 11:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790768186;
	bh=HsAD/Bv80VEFgq6hj/7zVyZdaBGnNkrcGt8fEOFmmXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aGHxBz10TBr0qtWPrThz/UPsLSdPaO8WJaF4c3+ezfF4Hx8KWckU6VGFUl0C7/yeB
	 nOr+CbPHFe8N2UboQLQqPdyoahRdF5ZGaA7nkrHMd71GMSD+JerJLf6F5yy5Phhi7Z
	 RR3DFa8o1m9SQiAioGz67LdZd0Gv7hOa6HfHHJ//LL9/0XkBHt9QEBe+DaHJm9sVKU
	 ne1FtXsYofF4jqrHdeIhneqoDiqSFVUKqG9cYjQL4Tt5nNBd3NDDpmWhj2e8QtEPzc
	 7J+aMDQq0SIbRN+buVU+wCkUL7CLAXl5pBCkLkY/QlFsnSAXf0YbPdQJFwJHPkkzx9
	 oOuOCLirNjTLg==
Date: Wed, 30 Sep 2026 12:36:19 +0100
From: Simon Horman <horms@kernel.org>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Breno Leitao <leitao@debian.org>, Tao Cui <cuitao@kylinos.cn>,
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>
Subject: Re: [PATCH net-next v4 0/5] fbnic: Support larger RX pages
Message-ID: <20260930113619.GX13925@horms.kernel.org>
References: <20260925104417.2325213-1-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925104417.2325213-1-bjorn@kernel.org>

On Fri, Sep 25, 2026 at 12:44:07PM +0200, Björn Töpel wrote:
> Hi!
> 
> This series adds support for large io_uring zero-copy RX buffers to
> fbnic.
> 
> fbnic hardware consumes receive memory in 4 KiB device pages, while
> io_uring may expose a larger software buffer, such as 256 KiB. Track
> the device-page geometry per BDQ, represent each large buffer with
> consecutive descriptors, and decode completions to the corresponding
> offset within the buffer. HPQ keeps its existing PAGE_SIZE geometry.
> 
> Larger buffers also reduce pressure on the memory provider. One
> provider allocation supplies multiple 4 KiB device pages, so the same
> amount of receive memory needs fewer net_iov objects and fewer
> allocation, refill, and recycle operations. Hardware descriptor use
> remains unchanged.
> 
> Ring depth and buffer size must be validated together. An ethtool ring
> change can otherwise make an active memory-provider configuration
> invalid. Store RX ring depths in netdev_config, stage proposed values
> in cfg_pending, and validate the default and each RX queue before
> committing the change. Both netlink and ioctl use the same transaction
> helpers.
> 
> The selftest requests a power-of-two buffer larger than twice the MTU,
> checks the reported buffer length, and verifies received data. It does
> not assume how packets are placed within the buffer.
> 
> This series depends on the fbnic real-queue synchronization fix:
> https://lore.kernel.org/netdev/20260924191817.1843726-1-bjorn@kernel.org/

For the series:

Reviewed-by: Simon Horman <horms@kernel.org>


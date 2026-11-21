Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795301410;
	b=xTNFKqy8NfBUKuVQvfKZSDOmYJizCvYj/4a3/o8hm9NDwp4hkqltjlDEv0dyML3EeCUS
	 EfcjdvL2DscJ+aePQyWBbFpUQxJ5fXbhky0r/yCj+hULSUGpo/EJ7pJbbJTLf1gnhP1Qr
	 2kXpB/3wIR1PN2ONL6K+RHszk8yqgCiYhsiMkcEZymoG99r9xmjgZQn9y8WvGkA30dnMa
	 tE5RsR/Yu7zgs8qGm/gfF4lWBKmz2Iqtg/QV9Z7oOU7vVSj1d+/B9qEorczuMHTFvsn+P
	 LJ1rD3M4ulv3jAmLLQFinSJaVQ9aNS5eN+Aej5KL270LFuhV7qnucWk8yLj0NpF/FSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795301410;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=2iCZzRwk6C7esLW5G1RvQgKfzx8/txKy4LGha5BOFO4=;
	b=GXiceD6y6+qWb1pJKBJEb8oOJ1loQenYprjs0YAtEBR4d7gq68IeSCLel0Nqy+tnFg7O
	 BqXqqqRR6kTUQ+1cultdaxYHa9PowyBsVxaTdFUyz7HmXhVbAnsYblBiikxU9US+jmJ+l
	 IaPS2dMKuQ2G11T/EG3qlKBV483WeHlGzUMXo7ZoCLn5wL2qIhhtpmCjS9OZkkoWehvFP
	 keWreEZzfLbPh5eDdEG50lur6USNjE2EWP8pJxZIOOj9I96rjieUUQPjX2lsJP53gxPlo
	 dQ6ijk38c1dRpSJeUv/aDOtSlmaKDI3GJ7Di35w/fW3mpT3tR+juyONZ1E6yvZSgHCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GGyxk0+N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D573606A32A;
	Sat, 21 Nov 2026 22:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GGyxk0+N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC42D1F000C4;
	Sat, 21 Nov 2026 22:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795301409;
	bh=2iCZzRwk6C7esLW5G1RvQgKfzx8/txKy4LGha5BOFO4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GGyxk0+NifKww4fQWIhCiBnMUdB7BVJ3/q0DwkobJ8s2WCM59yIu6msqG4MY9kNDz
	 CGywJUMnWGLTqcwU8jUDtDuN+cKpRWyGNGJ51HQjhpRvl+Y+VArFI4SwUr7ksNjBLX
	 8iClkC9KSdQjgQ8fXhiavd5psrEHOJ1pgD5/J87BezoAwyv3E7x+s/+l93e/rlDFo8
	 9roINwEqEdoRWfQzNQc4gTX1b6NCTUB/aoJhv6Qg/na7w+AKMFmyMue5fJg3EipwLq
	 WmWN5omlxa1wjOaOlFSwhoEDDqUYrjLPf7wbug0oYUUzP5VzoLngQL9KGOtqZOXDSC
	 KqwZcX62Cqe0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4464391B08F;
	Sat, 21 Nov 2026 22:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: drv-net: netpoll_basic: xfail if no
 hits
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179530140827.1198296.16586810100867874440.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 22:50:08 +0000
References: 
 <20261119-net-next-netpoll-basic-xfail-v1-1-206bf59911ea@kernel.org>
In-Reply-To: 
 <20261119-net-next-netpoll-basic-xfail-v1-1-206bf59911ea@kernel.org>
To: Matthieu Baerts (NGI0) <matttbe@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, leitao@debian.org,
 willemb@google.com, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 19 Nov 2026 11:52:01 +0100 you wrote:
> When netpoll_poll_dev() is not called during the test, bpftrace doesn't
> print the '@hits' map, because it is empty. The test then fails instead
> of reporting the expected XFAIL:
> 
>   net.lib.py.ksft.KsftFailEx: bpftrace failed to run!?: {}
> 
> This has been observed regularly in the netdev CI with netdevsim, since
> a recent switch to Fedora 45: hitting this function depends on timings.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: drv-net: netpoll_basic: xfail if no hits
    https://git.kernel.org/netdev/net-next/c/fd5f80a8a427

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



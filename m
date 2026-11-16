Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794872409;
	b=sloj7dwL7Eyt/ZYI1Rhbu/35GNtg3+VY4Ruc/Pd4w1m2x8wjy/JanqYhs8TSl5yucTMk
	 f8OtJXd6jQ9ETnVj9zhBAUPlbWnn5YeUjFKxcSOavVe35BSHXaDoraDJBmgWqlyCM1o/r
	 FH97IWzxGXkYF8RVOBJy5ET1KVVGAx1ltC459gBrYvltFJlOW3xa8PaSlUuAIYsEc0vKi
	 Jeu0PeszX8hrQ1s4lFHLRPD+rBzRlKDGa98dKuqSuv3d4EWgSueg00r/i0vtmiUCslyWC
	 aCxRjeSPQPC1LcvoA3QfbckJWs33wbbJPJaIzp89+bnWhhZE/MOqJ9hrhwGWlC0kKjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794872409;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=n147edC5QewykA3U00AxG7F6yWGjELLc4xXnGupgoMY=;
	b=CITc+bqsUfyHN0HJp+LKCRhig9uPTtR4lZTBH7HcVlHW1Ad00JHyS68S5QZ+kJwup7j8
	 ldNH83C0Li5QYvYa7hGfpYUlJtYjrUmxo/sV7Li3C+9kHomGyMtiAKyeQy7VSKZKT7i9s
	 OCXaFtQRi0rY0+qV/jvxrvYmqaMC9L2Nq5TI/UHMWL/vr2zjhYeBhXZQvluF7PuoQm+sp
	 cfunKT0HrcQy7k4Eg26x22GuR5iurqEOAvWsfB59XWsFfZxYwrNWQXmP9J9EShb1OLCZd
	 nYdad2WkutKiaOKEkD3nLK5Swg24hUSZpXAVJcHL/86eTFUgYnDwN/pfipm9I5fxQEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahZKYDFy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC770606A336;
	Mon, 16 Nov 2026 23:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahZKYDFy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F3B1F000C4;
	Mon, 16 Nov 2026 23:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794872409;
	bh=n147edC5QewykA3U00AxG7F6yWGjELLc4xXnGupgoMY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ahZKYDFyGc2c+ML1zYaQXSQ5H+9/EMOarAKLiFtZSYNQ8auBmURgQpoHCbRXQ/IkD
	 UN8cdheac+1PImEqRKupHuqb2KvH4jtAMeWwAxEcyffd98TWpKjDy56UscmydHADGH
	 ID7pxy4Yl3fHVJp2hqZMWAWNhoeAr9M3BDdlinPfn+cQgDjwQl83VJ6t2J7ixbqGBF
	 /dG+TVRxQGSFgiS1xuVa3BR976WrTnSJ8DpOtGACZeMXnFRu/m15Zb2EXFWMEl/KD7
	 D1HCmATeCV0VRMWJgWDSCGPxYR7ehKFIjuafcvrks3o7+XLvdXw44hBnRTJ4oo8p/f
	 ETutvXm5T5SHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77486391B059;
	Mon, 16 Nov 2026 23:40:09 +0000 (UTC)
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
Subject: Re: [PATCH net v2 0/2] tcp: Fix the SO_REUSEPORT bind cache admitting
 a
 conflicting socket
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179487240802.241382.11382113641449905664.git-patchwork-notify@kernel.org>
Date: Mon, 16 Nov 2026 23:40:08 +0000
References: <20261111174704.24312-1-juanagusnicco@gmail.com>
In-Reply-To: <20261111174704.24312-1-juanagusnicco@gmail.com>
To: Juan Agustin Niccolini <juanagusnicco@gmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, ncardwell@google.com, kuniyu@google.com,
 josef@toxicpanda.com, jbacik@fb.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 11 Nov 2026 12:47:02 -0500 you wrote:
> The SO_REUSEPORT bind cache (tb->fast_*) can let a socket skip a bind
> conflict check that it would fail, so an unprivileged user can bind and
> listen on a port that another user is listening on.
> 
> Patch 1 fixes it. Patch 2 adds the reproducer as a selftest.
> 
> v2:
>  - Shorten the changelog (Eric Dumazet)
>  - Add reproducer as selftest (Eric Dumazet)
> v1: https://lore.kernel.org/all/20261110080008.26112-1-juanagusnicco@gmail.com/
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] tcp: Fix the SO_REUSEPORT bind cache admitting a conflicting socket
    https://git.kernel.org/netdev/net/c/f675070191f2
  - [net,v2,2/2] selftests: net: Add SO_REUSEPORT bind cache test to bind_wildcard.c
    https://git.kernel.org/netdev/net/c/540410997a7d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



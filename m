Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871208;
	b=joEBiayUvYyqtam3dNnc3tZjxJldMEhDO2MTscWhikUghyPmLwJjmj2VlrWm1doh2yYZ
	 bWpwsIunJzGzK1r7pLi2MdMrz2NGbF6NpKy6kY/e0X3GUvqNpr87V/q6gDg1YUjYpIqpj
	 9X4b5/fiI3UP/iehyqFOFaG5CgB+83nf5ZyIfcZZbsVLueHZ0yOUb14xFt9zOr/LvtCQd
	 IGwsPRl/iY/ugGbV7gqCMFzvY/qRjRFoOuPRYiTtTCJUr72rEkm6jkaov7ttTgGh03nly
	 y8WgyP5I9NsO5i5B+HzpVvE04/tfPKdAupZE22ICkIYHPOGcGsR81YJv+LRbmy/BidA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871208;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=ximLAqazxBiE8DrwvOz+FL6zia8QGdRwgF0Cmhi1Ymo=;
	b=l/i/T7iivNCSqCZCcvWIsM6IZS0eDz5h1j370oWsTs05tXzU6dkfT39fantZr+guplgQ
	 A5L/wvfGV7xdCbEv1bc5CfmbTLO2dpwB25kFmJKGBZIjeWjNvJpdF6TsneFKP6MvA0qLw
	 fL/eHdc78gksHa3vwXK4r1xTE7DVRZ5mOh2aUoSRrZMCUp6mMfiZm4HX0gUma3G51i6Jc
	 cVUkGkDIvAd8ipV9fcR1kQHW6rcUBU7N5hAcQL9uGqNEtDWtyuiENl4ALFpLEDz2e4FOY
	 +A6fHRb/UOGIk9gq1CsLLbH9gYBILuca7M5Z4Mp+lay9tGO/bn/yDPNMrbPzeT1N6ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cckya3fI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69747606A31C;
	Mon, 16 Nov 2026 23:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cckya3fI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4317E1F000C4;
	Mon, 16 Nov 2026 23:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794871208;
	bh=ximLAqazxBiE8DrwvOz+FL6zia8QGdRwgF0Cmhi1Ymo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cckya3fIbmZbuB0U7m8erec37dIYNVKlcRtrTMnIy2qv6MPD2G8aMiRlG9GK4+UH/
	 uvOZhqoE99yLOGgveBob4BwRZ2iH/YqSisCbQh7P1w1onvBBjmcGwIP9vt7yQCSRnF
	 JNjWQSIgfFQ5VeXAYuHn5tDbS5JCexHDvDguEtz4fNhLj4Atb/0wX1yDF9qD+G5ZCo
	 cB7Ac38PV+r3dpy1TPrDjnvo5EpnKgnIygB1h8qquIB6+AkLz3xkgXQyuezRU9RwR2
	 Fw6fdBJDj+FwtCsXOP6rfqMLD5FwxZD6ZmrNd7JMA54VXut0h/SXK3M8Cf6McZ7C2V
	 P6iH+cuq+xByw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A38C391B059;
	Mon, 16 Nov 2026 23:20:08 +0000 (UTC)
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
Subject: Re: [PATCH net-next v4 0/4] tcp: fix tcp_base_mss on passive
 connections and test MTU probing
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179487120703.232553.15818759103747706687.git-patchwork-notify@kernel.org>
Date: Mon, 16 Nov 2026 23:20:07 +0000
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com>
To: Esko Mobius <echoowall@gmail.com>
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org,
 horms@kernel.org, kuniyu@google.com, ncardwell@google.com,
 davem@davemloft.net, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 panweiping3@gmail.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 11 Nov 2026 00:45:54 +0800 you wrote:
> With tcp_mtu_probing=2, passive TCP connections can start at the full
> MSS because they sync MSS before initializing MTU probing. Patch 1
> moves initialization next to the existing MSS sync in the passive
> paths and in the active SYN-ACK path. Patch 2 adds a regression test.
> 
> Patches 3 and 4 add coverage for black hole detection and the MTU
> search on active connections.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/4] tcp: initialize MTU probing before syncing MSS at connection setup
    https://git.kernel.org/netdev/net-next/c/6bde47e9c04a
  - [net-next,v4,2/4] selftests/net: packetdrill: test tcp_base_mss on passive connections
    https://git.kernel.org/netdev/net-next/c/beb698cfc334
  - [net-next,v4,3/4] selftests/net: packetdrill: add TCP black hole detection tests
    https://git.kernel.org/netdev/net-next/c/8a83f21ad75d
  - [net-next,v4,4/4] selftests/net: packetdrill: add TCP MTU probing test
    https://git.kernel.org/netdev/net-next/c/c95a797b0253

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



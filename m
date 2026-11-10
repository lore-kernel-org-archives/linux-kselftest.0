Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279303;
	b=STTLfgvx0obsnMQaBihtepnXsa4AMTw0j+kX839ypjMMEsL0iwp2vaqoSglTQCocVAYu
	 Ori7r3RBYAHbe2C82LSia36pfCoz0B0vHSLrPdKCt7rSwZPQby5tCiKcXxAGaDtB1Ziro
	 0RYBrTwT2CGtDbiTa7PNMAZEox7o/9pfVhJFDZjrEqcms1FciVa1OhtVXKE88/zvUWv5l
	 gldchwSC5O7dJXhzM4MYR4ygTAFEfQTi2AykYi2BgtamdOO/HvvwzccEP6bCfz1qb8Grn
	 4uS1X+g0XCIY9OhrH8Recd+mxxmKAQdYmli+u7bM7G8a0tEJRiuSy9ALX6UErz1Lb7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279303;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=dP0+wjyOwX9AjuPhQG9DeKIc+ii1jJ//qhhRI1Y+lHo=;
	b=Z4UjfbR6ExhFb/ozB4C+/IXo4Vyxv6/rYkm702ul0ts2SLphwBZMfgNplcmcxAIlvsoo
	 O2+EJ+zaTN9CJH4sHnEMe21soeHC3c/1Dk4daXCLwmcjMtaHX7wV3XDon2J1jiN38HW8w
	 rEJODFx78DQ7BRq5MQi/fXSND5ofAlghzBlMXf/uxjE/4bdYTtViruNWAYoud47Ujtghq
	 qA6IGiClPvRT2+clybTkkJ7dPjaBCKRQ8qas19YqbDUFYAuqS2SUWlPLeyRcFCleS9E4/
	 vegBwwoaJT8fHfTImcok6l/Rksik+dOXXW8iP7YDv6zX9M5Fv7u6Fy5drju4dzfllOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GJeN6jKQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82144606A338;
	Tue, 10 Nov 2026 02:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GJeN6jKQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86D11F008A1;
	Tue, 10 Nov 2026 02:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794279303;
	bh=dP0+wjyOwX9AjuPhQG9DeKIc+ii1jJ//qhhRI1Y+lHo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GJeN6jKQzhyj09OP6dHKracKVVZV0ist/9C/93qMZkV/rv+SZVIi4TVAXGWqNN/7V
	 CMfG82PYV+UKsxkhKZInCbUoLG7g3wtWmr35dMdswBcIC8dNWsl997s2a1w4zlZwT5
	 UiTwOrIlXTu7ztcgb0P20Zj3Xdq8gSdfHG3jtxlBvGJAErIZ3pgXqLd+Fwko4awBWG
	 7+nEG0wYaf1XiY/yV6mmSALhNxqwQxONJPbgcre0QXd3H1oOrqajm4LB0fNh4UUYPz
	 TGioHGJ/MWSr7gUSHaNvh2TXT7CwlQ+hrSwKtEdNwZNxdZBIEXdVKW7+Kw0MciHmeI
	 5km3lt0HVvXaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D8359391AFCB;
	Tue, 10 Nov 2026 02:55:02 +0000 (UTC)
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
Subject: Re: [PATCH net v2 0/2] ipv6: ignore link state in gateway check
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179427930167.3612825.11874749097898139774.git-patchwork-notify@kernel.org>
Date: Tue, 10 Nov 2026 02:55:01 +0000
References: <20261104195655.1406837-1-aroslavdudkov622@gmail.com>
In-Reply-To: <20261104195655.1406837-1-aroslavdudkov622@gmail.com>
To: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, weiwan@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  4 Nov 2026 19:56:53 +0000 you wrote:
> IPv6 gateway validation can reject routes in non-main tables when
> ignore_routes_with_linkdown is enabled and the nexthop device has
> no carrier, even though these routes should be added.
> 
> Fix this by ignoring link state during gateway validation and add a
> regression selftest covering IPv4 and IPv6 route installation.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] ipv6: ignore link state in gateway check
    https://git.kernel.org/netdev/net/c/b76bcf3fff93
  - [net,v2,2/2] selftests: fib_tests: Add carrier gateway test
    https://git.kernel.org/netdev/net/c/d1b6b27005b4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



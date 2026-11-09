Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267027;
	b=tjZdkUZHmr00M+hwafeM+1r1ZRLGXPImyMvB06+YBk07NKmd3KZ0Z3KVTEvJiNrYgzfV
	 5FwT3lzdzsrsx/wj1l6MlNQYzvF2rOoAlAxpXVBWcnjTOVED8AcoffPqlXlaHmt1cvyrS
	 Ts53iFdifkjKyBKqaUXA5vI2gcfd77iuMnBHda7xZH/NBQRjW9bejIxxibIP1ne5UAp63
	 h4UI4Hc1veFL2uIiqCMN4bA04IkvHElvbtx0IQQRShbs6vSyvJTVqzABdm3ycFL6xVob5
	 SnAHZl8Og1lOYZmU8OyRQlZ8klar+gQi1GVTK9XmEO5+wy6+r0v5p6RObf7TQXmjCpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267027;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Aul0+57KJrHaIZ99Xbi6Jwc/cNCXvRyRs0VsyjGNzjo=;
	b=RMA1Z1EN8vzfoGNmTvETU/5ur/IXJ4A43zuYJ9awzdVyr+y3J6ATmLwaB/N1gjB4Nzhy
	 gFfJRu1BdTClZEYM0TAjb78ogp/72wQ816IFi/7MZjHFCCt0S9yqv4uw3cJ6kss8jUvbU
	 08TzD8OLVAWbA4ULHq1p3oZKlBzEMuC5uq3BTkQNZmyzfwqEHdoM13DArbqF2yfPpC7kW
	 RZKW2R7zm9foIDoRYNI1r0o2DZ7CEznHISrxpMfzUmH4DN/bEzb7C8irlyEcXRm9vbOtj
	 hZUcnwkTD2c3Jhuy+0llel2nGCEVFg1hRNKeFBeRATxNTcfetmKMOr/tdhNQU58wJ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JKMuYezg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2109360A2600;
	Mon,  9 Nov 2026 23:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JKMuYezg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC73B1F0089F;
	Mon,  9 Nov 2026 23:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794267027;
	bh=Aul0+57KJrHaIZ99Xbi6Jwc/cNCXvRyRs0VsyjGNzjo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JKMuYezgzJUgf+6PkJAGgmrkLx2iaJQak262xV8i5njRvYaRlQPMRZh4KGVpQroq5
	 xXyeJnb+hpodlqQMLsyoYJMAqKJ3uRwtuPQZnmrk8xCDOg3uPxbHE5X+C+OA2boT67
	 xwidnV65g0DDxUQG7flm2V2g7D+AEZxhbCHSg3/g+tlwe8PLl5KbscuMGox0J8lrcR
	 a+Apt7fX4ALgCjmDyduCebDxMxqd8MfqvE35JhiLpH26iFYWVcRSDzwh3A04GjLuCG
	 BlCn8lNzd3Bj5fkLPHNAU9gEsMYgbmK5CoBvdTWAxJ0zQlTrVdHyrFn4J43H/EzUf+
	 aeur+vZPxGAiA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D843E391AFA5;
	Mon,  9 Nov 2026 23:30:26 +0000 (UTC)
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
Subject: Re: [PATCH net-next v4 0/5] netconsole: Support messages
 ratelimit-ing
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179426702566.3543549.15081609670268314046.git-patchwork-notify@kernel.org>
Date: Mon, 09 Nov 2026 23:30:25 +0000
References: <20261103-netcons_ratelimit-v4-0-b554c27ba27a@debian.org>
In-Reply-To: <20261103-netcons_ratelimit-v4-0-b554c27ba27a@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, shuah@kernel.org, edumazet@kernel.org,
 rdunlap@infradead.org, paulmck@kernel.org, gustavold@gmail.com,
 asantostc@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@meta.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 03 Nov 2026 02:37:45 -0800 you wrote:
> netconsole hands every console message to every enabled target, with no
> bound on the rate.
> 
> At Meta, a few hosts caused some DoS and netconsd was OOM killed in
> some regions, fed by 3 billion RCU messages from thousand hosts and by
> a swap fault that retries forever, which logged 6 million copies of one
> line on a single host in a few hours.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/5] netconsole: send the oops when oops_only is set
    https://git.kernel.org/netdev/net-next/c/96178f0437dd
  - [net-next,v4,2/5] netconsole: add a per-target message rate limit
    https://git.kernel.org/netdev/net-next/c/cfc3ceefdc96
  - [net-next,v4,3/5] netconsole: allow configuring the rate limit interval through configfs
    https://git.kernel.org/netdev/net-next/c/04d1be8ae2dd
  - [net-next,v4,4/5] netconsole: allow configuring the rate limit burst through configfs
    https://git.kernel.org/netdev/net-next/c/8481c27649b9
  - [net-next,v4,5/5] docs: netconsole: document rate limit feature
    https://git.kernel.org/netdev/net-next/c/ec1e576cd88d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310220;
	b=EzSUCajpf4fyFE/4sRGC4ASthMnekg/nDT6NdKmKyHlZU6oTFisRqJur/TMXQOslmlop
	 0TxAux/SzZKUCJ1V5Xi3yVqlVwtSbNHjCtxwcg9kuSz7AK4P5KCiOEu43LFxUcGHnJRgY
	 +nF4srd+xjqSZgtUIEpzAp/50dD+ceM9Y/nUQGe3/G0Mn9ypUJu2lOScjKqdd0DawPZIi
	 eyPxhFvaxX7eCf9RbC37maLBPwjfQm+1BBHvHqYJ4ybLgBRJjG1rvcUCYxjDqXjvGLm5b
	 sdhwFwlGqUI0kfsX+ErKptVpoAKxzG3XY/hWexO9LSU7+J71BsJSgvItD3+FcbXY1AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310220;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=aUVMLnilPF/4lZLpMPs+hVsh/c7eJoai23cicRWqG5k=;
	b=a5bRACZXnIQKhya+jFlRoUTfOaA3MJSmuFB+lLQWvanzeLYGhGj1konjKr82zNA0v2Jt
	 ZhcBJSwk8H9re5zbGbw77Lzm1h7TtJd5UFRsBWX+03Ku6cq28kCyVlzBU7so6lX/+QWkR
	 jluOvpSpc4Qps8S7j/ScGTLEoUrSst7zHo1Low4nNyyHebqsUX6nzX0u5/tAwBeM1Li3W
	 W6kTKdyxSeVNEFBsPNvrj6x18gPuAVXWQLoqHgoAESpVdOfT4M87fFTWdhbwdZpR+r/M+
	 RXGXyOW/LvOzQ+j305ilBEbPcr07LTRWALLdEQH7SdalM2p8FR+q9PPpaY0e0/p/39g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhQRC33a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AEC606A321;
	Tue, 10 Nov 2026 11:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhQRC33a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2F21F008A6;
	Tue, 10 Nov 2026 11:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794310219;
	bh=aUVMLnilPF/4lZLpMPs+hVsh/c7eJoai23cicRWqG5k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BhQRC33a5DLJFYXantknxoLz+4E8Y91YUxhJExBtYeHCnnzTft9NCC68+6j0cJlFX
	 I+Or3X0S0wtqIGM7jPiyZ2JIJCSH03APr9VFuu7T0riRBO9w9HJGeJAV50fIGiQOTW
	 xwKie1C93ccyuCWLZfI/Oir3am1i5zVW5aYrTQU9UHv89K9WRHd6o+TrwwZYpV8Ger
	 0bWEVC4qGNrmF/hxqKZVvyJczkrdNfV0n1ml6zu0gA9MdoxNFzvBGVYBjaiSU35/cz
	 o3HDA6YDqe/jj8adGHgHUdjpaaAAFDq/NmgaZEJq+ltwzutEsY2Ic7zmmvmwbxH+iG
	 4QTwGjBjumTKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5E12D391B17B;
	Tue, 10 Nov 2026 11:30:19 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2 0/5] seg6: fixes for the PSP flavor of SRv6
 End
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179431021818.3887755.4781870656519300838.git-patchwork-notify@kernel.org>
Date: Tue, 10 Nov 2026 11:30:18 +0000
References: <20261105015715.57-1-andrea.mayer@uniroma2.it>
In-Reply-To: <20261105015715.57-1-andrea.mayer@uniroma2.it>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, dsahern@kernel.org, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, hangbin.liu@linux.dev,
 justin.iurman@gmail.com, nicolas.dichtel@6wind.com, ahabdels@cisco.com,
 stefano.salsano@uniroma2.it, andrea@common-net.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu,  5 Nov 2026 02:57:10 +0100 you wrote:
> This series addresses three related issues of the PSP flavor in the
> SRv6 End behavior, all present since commit bdf3c0b9c10b ("seg6: add PSP
> flavor support for SRv6 End behavior"). The three fixes build on each
> other.
> 
> The main one is a route with both the NEXT-C-SID and PSP flavors.
> RFC 9800 says that the PSP flavor is unchanged when combined with
> NEXT-C-SID (NEXT-CSID in the RFC) [1]. Currently, a packet with a zero
> Argument (i.e. when the IPv6 DA carries no further C-SID) is processed
> as End without flavors, and PSP is not applied. With this series, such
> a packet is processed as End with PSP.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/5] seg6: handle a Fragment or AH header before the SRH consistently in PSP
    https://git.kernel.org/netdev/net-next/c/30ea41774b31
  - [net-next,v2,2/5] seg6: handle a consumed SRH in SRv6 End with the PSP flavor
    https://git.kernel.org/netdev/net-next/c/2316dd2c74c5
  - [net-next,v2,3/5] seg6: apply the PSP flavor together with NEXT-C-SID in SRv6 End
    https://git.kernel.org/netdev/net-next/c/8dd88d5e71ff
  - [net-next,v2,4/5] selftests: seg6: add tests for PSP together with NEXT-C-SID
    https://git.kernel.org/netdev/net-next/c/8eb0267c4802
  - [net-next,v2,5/5] selftests: seg6: add tests for PSP with a consumed SRH
    https://git.kernel.org/netdev/net-next/c/2e9d4b794675

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



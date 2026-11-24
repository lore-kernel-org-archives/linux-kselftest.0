Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522208;
	b=b7wbKhxW6MfH4lA/kZkt3potd40OShoL68gGHavrnttZ/yS9tHA/7TjxYu92hNDYjl0j
	 spKCzk14BMB7J1w7WdflAUX7M8bxpdTwzVSb6w8kTdi8Xd6pNdtEnmPh6Ah18MBAETRUD
	 mnbMhpA6/FRrU47f9vQM9jKfO/Wq/RzwOLEwt+oaw/mc9AoLj0h6NMYy9+KMBFhaV13nX
	 qW9i73BL+/MU0jAvNY89ZC3DZ0kwDv5Mh4V0OwuFLMBytj0+ofXNh4J4Hip9g/OS56HLG
	 coNMwl7GwmBPjRWuCFSlnkZOsAuTMrUCAUaNWTTolkL+71XwatBznbi6P8HNwMZftXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522208;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=EjtuepyeA7Bo4aLR8uqdrfCKAD4TbO0h5NtfzfwWRbg=;
	b=KAipr+bI8mFA+xTnTIMh4CyOCt2j0gWfToKUrvYJJiym14R313B0dS6hRyHXHVfsg7Qx
	 ZYDk6cqSBFm+LTtEAF+EGiQ3cJoQ6Wl2LQ2yJGSdroyasEkn/+xFVFCvY9IF57aGuHcoR
	 NI+EWgLRdktxvR93rcrLk2JLwYu55xJJDatnGZj+dqA7hwwX4a7XJoQnCGZcc0VokkKq2
	 Oz35Yo/GBMEKkItNGV079RoWTl6kmryV8ATh/7Lq0N3B1Gw5WGPBl5G5eOBlUPxobNNox
	 uCIHKO2Vb4sS7CnpEBdkQ2+wL+xJCL08tQILbEr0qRKSxD58Td1F6RfJHy4VHTl4LAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f5AeLHOL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446F3606A31E;
	Tue, 24 Nov 2026 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f5AeLHOL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1621F000D3;
	Tue, 24 Nov 2026 12:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522207;
	bh=EjtuepyeA7Bo4aLR8uqdrfCKAD4TbO0h5NtfzfwWRbg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=f5AeLHOLRJE5QtqFwd42RzF+x8gZA1TwXTV2pyvDtOkcSe6TUwMyiWBt2ozDmVLe4
	 a04XgFx659bohjtYStwfb5c217qGk0PPY4rLqBh7rMjJFCXpkc1nTyTSFSCZdM3SoO
	 xBwDroRTy8pN0L4T5cEIXi/I5pIoz3KKxeiKIbDmIF1iRdBcu++ZDRI9OfX2ik+jXv
	 UzN1P/EabJ9h0QEa8VZhScgdHENRtAZyazBy4Cwn5JeWiLY4sNfEtO19RiBFGkI0n1
	 Ok5xA0u83n09kSbYNxW/3BEOOZIEISDNSgq+pZ+dAWn8u8cYOadgm1WSpe3bPrxv6P
	 +aHGI1azFDuMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44B63931073;
	Tue, 24 Nov 2026 12:10:07 +0000 (UTC)
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
Subject: Re: [PATCH net-next v5 0/6] psp: support rekeying psp protected tcp
 connections
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179552220652.3487745.14058952847452542893.git-patchwork-notify@kernel.org>
Date: Tue, 24 Nov 2026 12:10:06 +0000
References: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
In-Reply-To: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, willemb@google.com

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 06:08:02 -0800 you wrote:
> A note on v3 and later:
> To keep this series short, I have split off some of the content that
> appeared in v2, and also have planned future work that will make this
> feature more robust, but not necessary to start. Here is the current
> queue of follow up series:
>  1. core tracked tx-key-count stat and SADB drain test case (from v2). I
>     see this as able to stand alone as a series, and I also would like
>     to report key deletion errors, but will have to touch mlx5 for that.
>  2. core to end grace period if BQL is stalled. I think this deserves
>     its own series for human discussion.
>  3. Rate limiting rekey uAPIs. This has been suggusted by the bot, but
>     whether or not it is needed depends on a bit on the deployment
>     model.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/6] psp: support rx rekey operation
    https://git.kernel.org/netdev/net-next/c/53e9f9da142f
  - [net-next,v5,2/6] psp: support tx rekey operation
    https://git.kernel.org/netdev/net-next/c/c8b9926ef88d
  - [net-next,v5,3/6] psp: document lock ordering with the netdev instance lock
    https://git.kernel.org/netdev/net-next/c/77c144d4c33d
  - [net-next,v5,4/6] psp: defer tx key deletions for SADB drivers
    https://git.kernel.org/netdev/net-next/c/0fcf5ed532f2
  - [net-next,v5,5/6] selftests: drv-net: psp: factor out psp connection setup
    https://git.kernel.org/netdev/net-next/c/a77edd62cc6a
  - [net-next,v5,6/6] selftests: drv-net: psp: add rekey tests
    https://git.kernel.org/netdev/net-next/c/33db05d42abe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



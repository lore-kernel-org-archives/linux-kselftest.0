Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500411;
	b=UDImvrIEL2aXLsi6EabBmlksKEMFDTTncBJJ6CO6PN7ftF//qOMHncf2nBYT2iPydRV+
	 e0qgQy+BDTMGt0iZXk+qK7lc4t+rghWfaqIHOHraHb2f9qjj4NjDzWotCz54Q0eNAFfcU
	 UFUrj/39tlspNYdgecFMWkJ26o4yQpfOFovb5MmlojvJwEEEUg1P0hYaYzYE0x7w51LNn
	 k2xkQ0Fo88qYRbxue2XgTcF0fQwuqAqBayJuQOKsLwSOfkniu/gD52E6gB4bXVjnVjsoE
	 zJjXf8fbB9qOvkaZPz+Vv9wd1YC/JgxhHEpmj9t/zwes8NbV0UnVZwWR9v/+QQWO0xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500411;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=lIJsoicyLzlTt/RMLlBP9yzkS+ewHy2x6UQEnMwmQNg=;
	b=dwymEwOhlgQrH8yvbXQbftyQ84fteSHaIcGG0UNrYILt1AdsEXsGL/Us/xjeabRQjb0O
	 walA5sfKotHUl/HttJhzkhjQ6Ra7lWHH5KWQQHxroW1zlMz305kFhLXGRa5uK/HSDodCt
	 E7IGvmIwgPbyA6bI6VRTfvEMox+uGYH1Nkmtbiz+GW4UaSV9iSLDRv42XkjlbU02aagr5
	 rX9xZRtKYgkLzA4q5mru+RXlznkIfYuAMfktGaqKZqymKRlLqr1mdP6SpO637cEoyN4Q1
	 K4XhYdZ8A+f+8wCOY7SxQr+3Lbs25GYK8v9sVGVbQEGrba9UzSCWAamDB3yMggbDMEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dMjzy0Je;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9CE606A88C;
	Thu, 12 Nov 2026 16:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dMjzy0Je
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8101D1F000C9;
	Thu, 12 Nov 2026 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794500410;
	bh=lIJsoicyLzlTt/RMLlBP9yzkS+ewHy2x6UQEnMwmQNg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dMjzy0JeEgcsuvR55Gi9I7EJR6uln2Yw7UrtBuUERz+rFQYsY48XY904Iu5ZhipGc
	 um7SKhfvS26SpxlgMd3IpimWksdFvtuuif5VW6ihevQWgyenXk6Ufs7Wk1xLAQRICN
	 weOicgEiMqMJVYBcL18qCv8lLBWgnZsPEuZFUSoAysyYd/fJGychuWJs8GGnCYDdAk
	 DQdd5PrW0CkhuQLBl+ooqEJHkPhM+Q3cU1ujmZMvVzZwTQpGYQsvrPWPc6YreYjsPQ
	 NnEufl9E6h7QA5OWIIQK67NHxnbD9vvjTspOZaxjpplhWxydmcjSFgwbyfA1ytBDxQ
	 uuhZZJzAtN6nA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 772E5380AA5F;
	Thu, 12 Nov 2026 16:20:10 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2 0/2] tcp: fix false exhaustion of odd-sized
 bind
 port ranges
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179450040901.42282.8175323324330757611.git-patchwork-notify@kernel.org>
Date: Thu, 12 Nov 2026 16:20:09 +0000
References: <20261106171442.31811-1-baditaflorin@gmail.com>
In-Reply-To: <20261106171442.31811-1-baditaflorin@gmail.com>
To: Florin Badita-Nistor <baditaflorin@gmail.com>
Cc: netdev@vger.kernel.org, edumazet@kernel.org, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  6 Nov 2026 19:14:40 +0200 you wrote:
> Fix false bind() exhaustion when an odd-sized local port range still
> contains an eligible free port. The wrap can flip parity in odd-sized
> ranges; even-sized scan sequences are unchanged. The namespace-wide
> connect() allocator is not changed by this series.
> 
> Earlier x86-64 KVM validation of this unchanged allocator/test code:
> - Regression test: four failures before, zero after (eight cases).
> - Full port-range suite: four failures before, zero after (80 cases);
>   two existing SCTP XPASS results unchanged.
> - Go net.Listen, 100 attempts per IP version: 100 failures before,
>   zero after; explicit free-port controls succeed in both kernels.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] tcp: avoid false bind exhaustion with odd-sized port ranges
    https://git.kernel.org/netdev/net-next/c/c7d11f97e8a2
  - [net-next,v2,2/2] selftests/net: cover odd-sized local port ranges with one free port
    https://git.kernel.org/netdev/net-next/c/ca133dd5fb20

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



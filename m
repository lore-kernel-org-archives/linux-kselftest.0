Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511208;
	b=CyaZt5v+RhJsTmlHrsSIt+9uxtMvr+BnmCGdm1qYu44P78OJNk2ajhejARspl0ajLtGH
	 wUZ8caX30lNffKdqWN//APUiHU90GfVmBvXIxC3MlQ5eganmuBPdxXrB8GG3pK6xMTlC7
	 KYEl3V1As0ZxFArq8f4GQGXkGgK69rbmipuz4VQUNlYe85zxSYn86NqKtZUuJjE9lck+o
	 JYQQaGwg0t/z2wazAizNNzuiolqMPEzzHE8Yc0yreyOTJ/Lyd6SwOqDXlG65HzboRaxqG
	 89pyppF1pQeKcg73SX71L8unslF6L3gX90AJErNs2yKQXbwR93B3s604yKnzRSIDZ8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511208;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Q6wHwgO5G+c57cKjEl6kAP/TFf8wRK6vv17rmHXwRU0=;
	b=uReBgeDMADuX4L+nSDJn+yhxEAz1IJH8K8E5O4mUYgRV5KCvhomxxhQ76zaJM9a6QrX8
	 QIQ5rQ+kSyZPE17Od8HzjUa8c979zswQkR+Aa01q/wfJ5fKY/i024+ZvCEE/zD56cR9Ib
	 NCmprEaZ3ingmY4yZsFrmzFlwwFX2+lIredAswI+DZK3VB0gM8+MDnfCL5oMc/UujxbO8
	 qluftO+x+E5pPqPrZM3/tUKQ6H4ze+CXAHSJjKdtSAZAIf/Z75gizLMM1IGY6IYk2eAne
	 PtJW/xM8Mxop5hiP8IoHrjZF5S6kxU0A2PYJXIUnPiUfv6uYO9WIGx9fxLKT4W0/rHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RwwJOTX4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76015606A31C;
	Thu, 12 Nov 2026 19:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RwwJOTX4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086671F000C4;
	Thu, 12 Nov 2026 19:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794511208;
	bh=Q6wHwgO5G+c57cKjEl6kAP/TFf8wRK6vv17rmHXwRU0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RwwJOTX4k1xui9bHfKR1mYYhZUkgc+oAxPlifVj+uJFD9pOM3D2f+oxmbfk4VUmI0
	 aRAlOTuI8W2DAe+rKxNT/GC8oqA4QwpOUVr187XLbrm144AwvMtAsuLRGc5O5shaGZ
	 D0MVy7PqK/+9GIMjD47q+/QeDlXanra7gCZmo+d36swCKkpRPpKiVhCI0BHbfElDrc
	 /Ib6hd4NCR3jZI8xGgpleG5jQeGF7Dfbuh06MZTHrT08Z005lMtSpzULyA51AlCprt
	 /kl1aFEU4WAoZZDbghPpvKjVSbTg9Qs9Ui37b/H1+oXYi97ktnAKzJ/zdFVBs4LWXM
	 hbG9cuKRmpwhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15C0392624F;
	Thu, 12 Nov 2026 19:20:07 +0000 (UTC)
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
Subject: Re: [PATCH net v2 0/5] net: tls: break the connection after a burst
 of
 empty data records
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179451120678.604801.8398607800818615102.git-patchwork-notify@kernel.org>
Date: Thu, 12 Nov 2026 19:20:06 +0000
References: <20261111185522.2859004-1-kuba@kernel.org>
In-Reply-To: <20261111185522.2859004-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 sd@queasysnail.net, john.fastabend@gmail.com, shuah@kernel.org,
 cel@kernel.org, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 11 Nov 2026 10:55:17 -0800 you wrote:
> Deal with overload of zero-length TLS records. This is the next iteration
> of Chuck's series. I tried to make it as simple as possible - break the
> connection if sender floods us with zero-length records. Consume / discard
> those records even on PEEK to avoid infinite rx_list growth.
> 
> https://lore.kernel.org/20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org
> 
> [...]

Here is the summary with links:
  - [net,v2,1/5] tls: Break the connection after a burst of empty data records
    https://git.kernel.org/netdev/net/c/201f0531e413
  - [net,v2,2/5] tls: Consume empty data records in tls_sw_splice_read()
    https://git.kernel.org/netdev/net/c/db6a6c6863bd
  - [net,v2,3/5] selftests: tls: Skip the zero_len tests when TLS is unavailable
    https://git.kernel.org/netdev/net/c/77389a6d30a2
  - [net,v2,4/5] selftests: tls: Extend coverage for zero-length records
    https://git.kernel.org/netdev/net/c/512f2cb73664
  - [net,v2,5/5] selftests: tls: Cover the cap on consecutive empty records
    https://git.kernel.org/netdev/net/c/e6dfa7bfdf15

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660212;
	b=yqpe4CyxIl0+r3Out/r72HKJkxDilxfYJnF/v3OcYZ5+mq3odZMfMM2hMPtpXfv5USMK
	 rD7iO7B0vsX1AEU0xvnGaSbwU/Fr0NqMkhN06YrquTv/nVythWYpGF9FSebPFRDpOLllb
	 m6aI6OGNp644AC8F4N1glC6N3FfmvxAAgf+mBTG5WkE5yMHseIwMq03os4xhVn2zgoX87
	 YItrc9Z7aokrhIlJ13OU1c5+cNdmr36OUvNHj6nKPzQucxYe5VgwJnZDPEQmGPdapEERj
	 u4WU/OCzKVWwPE2aaAI13O3Vw91RFbBtSI0uAPN7X6YrDbHczmpvvq4NlczirO2Mn5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660212;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=gx/l0sR3ZKs24DmLh74T4rdqlJqCcCkJCAAHR7SgdOs=;
	b=0YOBHSti30U5BrbA2cAdeztlUP7niVev1W4wo/kp4gKJukqp2B4dMgzzbqVJlLoaGJn9
	 PBiiqu9ekxLiAAEwM4xrLVFxq3G2HgEv57QIlOhRFcCWdVMH+t3HiuIA6NwAowfOkZgKw
	 N/EbGpmSTaoMMeR5/Evx6ko06DWfeXIk7inLmIUKdMC+SqpccQucy+dqPW6WfQxuiLiZ1
	 nvQD70ipV3nj0XzIGZMMCZPcvAys8SAj1PzXBrmyRJC1hevcHsJvRzzaw70wisqSOf9L9
	 AI6nSSkxRsNOqZyfoVwgqYD3x6Mp7pRDh+V0ZJXYkmVWaTs68mnySre8+iIO94VyrAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dtvc54yZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CD9606A33F;
	Thu, 26 Nov 2026 02:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dtvc54yZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE151F000CA;
	Thu, 26 Nov 2026 02:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795660211;
	bh=gx/l0sR3ZKs24DmLh74T4rdqlJqCcCkJCAAHR7SgdOs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Dtvc54yZNfkVhvp0KoWIhRZLZfPK9wu5TxHGjzBmclWItA0FfS2IqEt5dnqVBrrLP
	 ytJmgS70RZIAjW/7mhglFIHH6GcRaMktm589Ck6mVdoHaHelKgVmsw9yO1E5nGjFOh
	 1cCQ9YSaq7HvyYAreXPI6ot7BKpWv63891oEHCnI8ftZeuZRn+cBb8toZ/dzgA8FFB
	 5l4mWW8HA4ohyDb2hokGmo+oPXbsGyEFNTeH0DIn13aYGQyr+KrKqHYEIxysRGBolr
	 wQ0PpYgngCLKDP2au3BeWHTqm3wBnpGOgNZJT+VaXRUj3TdiEPCQu9qQ8obHuBF1RX
	 Q0vpk6ZTT1JIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44163809A24;
	Thu, 26 Nov 2026 02:30:11 +0000 (UTC)
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
Subject: Re: [PATCH net-next] selftests: net: reuseport_addr_any: report
 epoll_wait timeouts honestly
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179566021027.1457344.6083376172578227508.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 02:30:10 +0000
References: <20261120065855.22628-1-emmaonana18@gmail.com>
In-Reply-To: <20261120065855.22628-1-emmaonana18@gmail.com>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Willem de Bruijn <willemb@google.com>:

On Fri, 20 Nov 2026 07:58:55 +0100 you wrote:
> receive_once() waits 3ms for a packet but only checks for errors
> (i < 0). On timeout (i == 0) it falls through and uses ev.data.fd
> uninitialized. recv() on a garbage fd fails with a misleading
> "failed to recv" (or worse, blocks or returns a bogus fd). Report
> the timeout for what it is; errnum 0, since epoll_wait sets no
> errno on timeout.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: net: reuseport_addr_any: report epoll_wait timeouts honestly
    https://git.kernel.org/netdev/net-next/c/9a3d44e379b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



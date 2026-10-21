Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576810;
	b=S4bTkzIQmW8ytcMQA8RTUnAnFj43F08s+Uon8kj+gL1SeulSHS6n8M86JrKo7GbjyWqz
	 bW6ZsVk4dJFygYI5slO6XCXrc0KVsmQiLdlgsX1MHcr5GTn8RjxTGIEAc7hi26x/tH5Hy
	 bOsVTFjAVogMMsltI/9vPJjJ5Vipjj4PYQDk64cnd77f1NzH4bPqr84H8vbNti4xMFFHv
	 iSF+cgX9ioCunJ5QaZMztoJUa6+/27g/UyeMz0qKXgydF4wbcQmF3HDfWGMbiPSgcYUa1
	 X1CpeeIRF4e9C9j+FDSaV3oM8SrlKe0E3s4VE8pQJY6Z2Qe5Gnidrbid+K6xZckiwZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576810;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=IXpdNahMxn9TR1HD+Mn7efw1bbwxmk2HtLEylRRzfSs=;
	b=Ty0pAd5+YipwrPI1n8agbJF0NG0zoZh2fMINka/9+PwX9WOSAddAh79IeLfXldDdmu5S
	 ZICxNg6oQETZPbDZXPC98i0bMyjAIob1Hc+dO2bi8Bjev3REkqGROYuqfJrmAZUdeSJ0J
	 omvuSb+HzWnsjk3KEUmYAvuQhhtt1TYhGe7QLU3Y7f/3jtKxJQ2kviWc94Ai/o+5jykEC
	 8VCZ1zt9BcgAxCkiIMlWf+wnMCP77L63Cw2jcEsYN8LAIvBz5DsQGs+sfo80Hudnq9Rmi
	 mzm0GczjhzAqWOVkostAECGv/CnmCIIho1DRls2agmUN+Tfj9BCSKZ52iCd6tUVUfnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e2gl8tIT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC47B606A31A;
	Wed, 21 Oct 2026 10:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e2gl8tIT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459C31F000C9;
	Wed, 21 Oct 2026 10:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792576809;
	bh=IXpdNahMxn9TR1HD+Mn7efw1bbwxmk2HtLEylRRzfSs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=e2gl8tITQBmN4QlHLt3yS/KRk0nSOvhJhrcf1sBKdJf3kSzPkSDm+JKU0KfIKcHMd
	 bNbOnIQ3LcpAuPkmnMh5+6Bgj3VkAeWuRPVgeYRbrnEG+qMSfymwVGjBACgh9OjU/P
	 jqaaxwnhglq1Uh7rg07YqUIqFGgBv75dEYDSYtR7ZQSqKDAlrAaf5+jNbaJaP5dOKd
	 TIBkVM6WiksGIemHzJ1m7zT+PPSu5gHtwHjddrUbe/FKekT0MMt0jlBpdj6JWl8Bvh
	 5p3dqtTgtsGB467SOtDdV3btFJ8ynJyoSkFOYLZZpeedTrbejfsrXbp6iceH6TIYxq
	 SUJe76fecaLMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A4593809A24;
	Wed, 21 Oct 2026 10:00:09 +0000 (UTC)
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
Subject: Re: [PATCH net-next v7 0/4] gtp: ynl spec for the GTP netlink family,
 two fixes, and a selftest
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179257680778.526483.7395011719912367177.git-patchwork-notify@kernel.org>
Date: Wed, 21 Oct 2026 10:00:07 +0000
References: <20261016093225.1036375-1-anilkaushikwireless@gmail.com>
In-Reply-To: <20261016093225.1036375-1-anilkaushikwireless@gmail.com>
To: Anil Kaushik <anilkaushikwireless@gmail.com>
Cc: pablo@netfilter.org, laforge@gnumonks.org, donald.hunter@gmail.com,
 kuba@kernel.org, davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org,
 sdf.kernel@gmail.com, nicolas.dichtel@6wind.com,
 osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 16 Oct 2026 09:32:21 +0000 you wrote:
> This adds a ynl spec for the gtp genetlink family, two small driver
> fixes, and a selftest.
> 
> Patch 1: the GET and dump replies carried the family id in the command
> field, so ynl dropped them. Use GTP_CMD_GETPDP instead.
> Patch 2: new in v7. On the netdev CI debug kernel, the selftest hit an
> RCU warning: adding a PDP context looks up the device without the RCU
> read lock. Hold it around the lookup.
> Patch 3: the spec (NEWPDP/DELPDP/GETPDP/ECHOREQ), no uapi change.
> Patch 4: a selftest that adds, dumps and deletes PDP contexts.
> 
> [...]

Here is the summary with links:
  - [net-next,v7,1/4] gtp: set a valid genl command in PDP context get and dump replies
    https://git.kernel.org/netdev/net-next/c/758d8928d2c5
  - [net-next,v7,2/4] gtp: hold RCU for the device lookup when adding a PDP context
    https://git.kernel.org/netdev/net-next/c/fe3e1a42fb7e
  - [net-next,v7,3/4] netlink: specs: add genetlink-legacy spec for GTP
    https://git.kernel.org/netdev/net-next/c/8a2f9964fc28
  - [net-next,v7,4/4] selftests: net: add a test for the gtp netlink family
    https://git.kernel.org/netdev/net-next/c/ffb51f75013f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



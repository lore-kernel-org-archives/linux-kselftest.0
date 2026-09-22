Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D9230EF7E;
	Tue, 22 Sep 2026 00:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790037082; cv=none; b=cULKw643XMDSoqc13Kl/Nk7dLA95fXVqWiPis0fc3bjUQwCuoGOuxgTisBnLKnWYtfPsQyJ2P8bFT4xBEIvT3iFrWMGHTtYy/meL6ejQE2x2pNgCJ4SMmdnyok0WcPw0PbsbGP+1n55c9Kj++TR7pxlVgrrhe1mcM4AJv0wDL38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790037082; c=relaxed/simple;
	bh=8AX7IXVVmIbChbJsMIw8NCq0DVvBYXL+kLtvJE4E8Oo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FgtD0LTH22FKHNgcXzZ0D9p1gVNftyf4oFiTeNhgr8WgxdDeH/pw5C111icoBkH4woyeGu8ANeoMlMPu+97NNPJ6kJ6sSXex5gYt8qGKPd3odsqHsRAD2jYU2+lc2pvtgs45XzZr8YYfDFy9+U8f14+nGds8eSTjy5A6CIxUeUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GL+k7w/l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GL+k7w/l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F203C1F00893;
	Tue, 22 Sep 2026 00:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790037081;
	bh=RSWBiwJZK159k3oCHBq/N73H7vQHs7UHgH7z5sIaAMQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GL+k7w/lKaYIc3V4r1XlwSisnqzwwTtDz9WoNEYuGUZruqAiUsKnVpM+8yv9q9j2+
	 HuQ2VtFskTGv/iNcyGiivusnJOG7jU1EIQOa0GoN8sPpNRUWztINsFpcfXuB8fDq+4
	 CFE8zeyCV+qmid1000Be2j7NLRrjzQGC0/LiPv8tDW2wYqXEZ283i/+VUuWXNEuI+w
	 AEWDT5oQNXMqK/0Rw4jTKuQE7yfxnXWUFGS7EQRJ9+bYi1yNO2hVx5MbA88+HmaDKj
	 udlNZPiNiOawyAZO7DM09vNtf/upFofwM13xPn3Srd4BqWIaPDFTZ+X4A8A0m34CtQ
	 m0RLMhXecry1A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939C43930203;
	Tue, 22 Sep 2026 00:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] selftests/net: run tun tests in a dedicated
 network
 namespace
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179003701214.3305732.10828918567557929230.git-patchwork-notify@kernel.org>
Date: Tue, 22 Sep 2026 00:30:12 +0000
References: <20260917111520.2614448-1-edoardo.canepa@canonical.com>
In-Reply-To: <20260917111520.2614448-1-edoardo.canepa@canonical.com>
To: Edoardo Canepa <edoardo.canepa@canonical.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 xudu@redhat.com, po-hsu.lin@canonical.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 17 Sep 2026 13:15:20 +0200 you wrote:
> The tun_vnet_udptnl fixture creates a fresh tap device, assigns it a
> fixed MAC address and installs the outer neighbor entry as
> NUD_PERMANENT.  On systems where systemd-udevd is running and a systemd
> .link file sets
> 
>     MACAddressPolicy=persistent
> 
> [...]

Here is the summary with links:
  - [net,v3] selftests/net: run tun tests in a dedicated network namespace
    https://git.kernel.org/netdev/net-next/c/fcc1a92b7a90

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



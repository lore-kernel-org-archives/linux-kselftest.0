Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B4A175D53;
	Thu, 27 Aug 2026 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847068; cv=none; b=Ephe34FPEUS8It6wT3oEl2OPlpKYx0MJ9uTS5pmfimHlDCJgwSNIs9Z275z3RK4XW/E9cpI+I3ApeXu2aLl41YATaCaOydURg+BIrixAXLpu6sByRGv+FiYLbF4liEHYnKUatiL8OrPMZxYZrD6pINiglKuNobJcvrfVKaTHTII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847068; c=relaxed/simple;
	bh=Ke2BCOLbwafvsjE3CQWrGzHWWQBPU4ZrSTz7dPMFk0Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=l2EIKd7yA2IkfpJ36izr9nHtrUuAWXAoonz0bKHw9fhp6OZaL7JJt771THGKjCJtNB8DFd+FAMQSg5yGFM+DqqFZxpHp6ar3aPZIgDZliwWAN6cTj3jMsY3KYca1hI8PJ/aW+D7RQlVNwkpmXIaFkZKQ+4U5k3cVyllfCHsEkug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5mFkdY9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5mFkdY9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501D11F000E9;
	Thu, 27 Aug 2026 16:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787847066;
	bh=71qrU/5QZkhGJuNFIbp5Z508yEbLKDkq+FkHlRgo6dY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=l5mFkdY90RIulJPpI23qwMOsSU2/UYfYqekHOqBrG2Jruzca1OMkLYiWWFMHRMbVS
	 r701k4iOi3AIwflRvXfB8laJoEOStoyY2DuKBLRZDFIO3pPPK3ySorT2bss2PeTPiJ
	 kuiahpk27C+5RmozdCrMjbR2Ernu0+i8o2Zk5DLs4M2wz9gFQQjYghur6+heDpXlpT
	 sm0Tue/Sx6VYNdPpZsEYpSr5JEDRiXhQOf8rT3naK2J39DJGIgNZMLi1qPD5nNIOIs
	 w2maOEUHzEJi1DsA5EZ/cVCnd3WLcfs8JZwGGRpDl0gKEwfpObc2yhFn2B/w0gNCs8
	 pA9BHOSOQGGSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 197FE3809A3B;
	Thu, 27 Aug 2026 16:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/4] Improve stability of big_tcp_tunnels.sh
 selftest
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178784701189.1722758.11775412488172782378.git-patchwork-notify@kernel.org>
Date: Thu, 27 Aug 2026 16:10:11 +0000
References: <20260822120308.1165200-1-alice.kernel@fastmail.im>
In-Reply-To: <20260822120308.1165200-1-alice.kernel@fastmail.im>
To: Alice Mikityanska <alice.kernel@fastmail.im>
Cc: matttbe@kernel.org, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, davem@davemloft.net, horms@kernel.org, shuah@kernel.org,
 razor@blackwall.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 alice@isovalent.com

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 22 Aug 2026 15:03:04 +0300 you wrote:
> From: Alice Mikityanska <alice@isovalent.com>
> 
> This series addresses flakiness of big_tcp_tunnels.sh discussed at:
> 
> https://lore.kernel.org/netdev/349c582c-73e3-468c-91cd-ad6cc3562700@app.fastmail.com/
> 
> Lower the thresholds to avoid failures like this (number of packets
> below the threshold):
> 
> [...]

Here is the summary with links:
  - [net,v2,1/4] selftests: net: Wait for netserver to launch
    https://git.kernel.org/netdev/net/c/dc170da3347e
  - [net,v2,2/4] selftests: net: Lower threshold on debug kernels for big_tcp_tunnels.sh
    https://git.kernel.org/netdev/net/c/bb42c16f489f
  - [net,v2,3/4] selftests: net: Lower threshold with csum offload off in big_tcp_tunnels.sh
    https://git.kernel.org/netdev/net/c/f7d0400bd345
  - [net,v2,4/4] selftests: net: Fix slow configurations in big_tcp_tunnels.sh
    https://git.kernel.org/netdev/net/c/1d62b83fb751

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



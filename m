Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA52432143D;
	Tue, 12 May 2026 14:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596872; cv=none; b=NZwpMmPKnFGFbeGmptZMHtqxPf+kYUeBgozUIM6Ec2emXpCwrFP+sWJRdS/tRdo3zRcV77oZU9ZOCbaoKrXIEpWeGb2XniMsobjEFulZyIQ2V7NjElh7agIRC89eDDy0GD0KRC3iSmCp2iv9tZzPGRb8u7j9HOS2h4Bi8vccJZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596872; c=relaxed/simple;
	bh=BXG5s7Yd2g7rT7VjpjIRc3pzygNpmdAU8FwMqxST/ys=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fRlyjT9oWzMYOSjmHFzOUXrIFuadQg6LR9ILpkpS+IzY9GTa/QSPksqukUwcmwx/qedgA4LNC9ak452zQHq/wcPrpJ9vPurl0cRUOHdmCsY6jl3PxqJ0bxxa7Jh/T6sGbVxB7QiZs5u7VHdqdRjWg007mFIJ9/9C3rSEeGBg6h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2dNJszl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2dNJszl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60867C2BCB0;
	Tue, 12 May 2026 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778596872;
	bh=BXG5s7Yd2g7rT7VjpjIRc3pzygNpmdAU8FwMqxST/ys=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=h2dNJszlCMJgG6P1X7XIT8yBEL9DAJI4hexe90uTyt0/VUSL2144/LWiUCLccLjVp
	 T6qDq32wLBzLN+rF2lRL3Ls560tn1edEehT5BwLzrDoQ4CHMb8+sdeOkx56QQ4MbCq
	 upaPmfTQe67Wy7N8OVYo3NRIpk4GfNu/gqwpepQqI2utDHSVgV/ccagtfOR8E0GIME
	 YNqkiZ3rbHMEgQQ82uYVlQPNNmCe4hD76f8k78/H9bBpZPH5Jcc8OOwHWqRp/trBzv
	 3VlT24j59ju0Mt4GDiVy9e/pxdppkCs7vq5t82eifioxg3jHOmq1FU9AIwi0yI09lD
	 sne05Jsj+oUng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EE13811A5D;
	Tue, 12 May 2026 14:40:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 00/10] net: shaper: fix various minor bugs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177859681855.2901456.10504449767222718446.git-patchwork-notify@kernel.org>
Date: Tue, 12 May 2026 14:40:18 +0000
References: <20260510192904.3987113-1-kuba@kernel.org>
In-Reply-To: <20260510192904.3987113-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sun, 10 May 2026 12:28:54 -0700 you wrote:
> Fix various minor bugs in the net shaper API.
> 
> First 2 patches deal with ordering issues around inserting
> and publishing new shapers. Shapers are inserted "tentatively"
> and marked valid only after HW op succeeded, this used to
> be slightly racy.
> 
> [...]

Here is the summary with links:
  - [net,v2,01/10] net: shaper: flip the polarity of the valid flag
    https://git.kernel.org/netdev/net/c/7cee43fcb0c3
  - [net,v2,02/10] net: shaper: fix trivial ordering issue in net_shaper_commit()
    https://git.kernel.org/netdev/net/c/235fb5376139
  - [net,v2,03/10] net: shaper: reject duplicate leaves in GROUP request
    https://git.kernel.org/netdev/net/c/a9a2fa1da619
  - [net,v2,04/10] selftests: drv-net: add shaper test for duplicate leaves
    https://git.kernel.org/netdev/net/c/6e8ae9d805d4
  - [net,v2,05/10] net: shaper: set ret to -ENOMEM when genlmsg_new() fails in group_doit
    https://git.kernel.org/netdev/net/c/8054f85b83f4
  - [net,v2,06/10] net: shaper: fix undersized reply skb allocation in GROUP command
    https://git.kernel.org/netdev/net/c/0f9a857e34d0
  - [net,v2,07/10] tools: ynl: add scope qualifier for definitions
    https://git.kernel.org/netdev/net/c/fbf5df34a4db
  - [net,v2,08/10] net: shaper: reject handle IDs exceeding internal bit-width
    https://git.kernel.org/netdev/net/c/8d5806c600fd
  - [net,v2,09/10] net: shaper: enforce singleton NETDEV scope with id 0
    https://git.kernel.org/netdev/net/c/b62b29e6de67
  - [net,v2,10/10] net: shaper: reject QUEUE scope handle with missing id
    https://git.kernel.org/netdev/net/c/ce372e869f9f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



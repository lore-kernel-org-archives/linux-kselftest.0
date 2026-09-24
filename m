Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A264A205F;
	Thu, 24 Sep 2026 15:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263880; cv=none; b=cyEACduPY8fL3UKr4PL7rmNx2/29iQjs6Wh0iUOBR2N6f1Z3DjgXMzVJSZWckM/R+hwZMFZV2gXp4pNGAqRkiotXh9VwJB1xOkQFsPkiK6eh8KIKn0pTKRNoIoCtEX+giaAwfIb1ZUBGt1I3vsUNti2MNUtjl43BetGGCL9HOu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263880; c=relaxed/simple;
	bh=Sr/ZvADe3rhNSqxByBkFHLvSZQ0+5vZeIf08zA21Y1w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=A/wF5lk9/8DrTKUTx8q6pTSoqo46eybmrg55aBaQ0q6gz9TiYOV08pkU8801tYLcJ1HurMhl13nbhcyaogBgU4hii594u5eM7QLnNwwDunTKoku/bh+PpM8TygF6t9iy3YyPC+qLSbpmsPualrea+mcqq3vb/P2X0WNr3ZYYpKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ls7ZITwN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ls7ZITwN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7CE1F000FF;
	Thu, 24 Sep 2026 15:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790263878;
	bh=G+YIn0jWatEzyBxbKACE4zuL7jmhIjynHuzRFkmS27U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ls7ZITwNp2G2ig/Sb7J0ofwUqlqkcUqSY8kpFZGWraQcd1tPhUcTb8Grqg2eFdQtF
	 LsaKu+YgDjl95fOL32Dc8fdcG69JEWvhf+u5hqJlCYueU0gSnkP4KHdfq5rbi+MiHH
	 1/Suq0ZsCoWnhiGfbW6kBBIheEv4ZAXBkL+xnEHxnYXPuVP7H2X1+hZIrO6xXpCjwv
	 gmAZAO4+23QK5T/dCpNNhzV258Rm0grRnIBbcCuuyFLOKZnjVaVGZyM+1dy+ddifVv
	 as9NvuI49Sgrd9ZfQX0v7XstcM9Cf0DcZav2Zm+9Fv+uupZ64mLHC76ejIODRFXPge
	 /XGwfNqvUCSNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198833A566C5;
	Thu, 24 Sep 2026 15:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/3] selftests: drv-net: Add VLAN test
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179026380790.1607156.9912751120912034978.git-patchwork-notify@kernel.org>
Date: Thu, 24 Sep 2026 15:30:07 +0000
References: <20260918112529.96039-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260918112529.96039-1-ovidiu.panait.rb@renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, nb@tipi-net.de,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 18 Sep 2026 11:25:26 +0000 you wrote:
> This series adds a selftest that pings over 802.1q, 802.1ad and
> QinQ VLAN interfaces with RX VLAN stripping offloads enabled
> and disabled.
> 
> This series contains only the selftest part of [1].
> 
> [1] https://lore.kernel.org/all/20260908164309.59282-1-ovidiu.panait.rb@renesas.com/
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] selftests: drv-net: Move _set_ethtool_feat() into lib
    https://git.kernel.org/netdev/net-next/c/d3630df401a8
  - [net-next,v2,2/3] selftests: drv-net: Check the features set by set_ethtool_feat()
    https://git.kernel.org/netdev/net-next/c/a57ddd899004
  - [net-next,v2,3/3] selftests: drv-net: Add VLAN test
    https://git.kernel.org/netdev/net-next/c/efc7f4646c1d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8DE3EB80E;
	Fri,  4 Sep 2026 23:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788564666; cv=none; b=WJBEOISFkOkGBJPtbuAXRW34njeZyXmNp8h2jgshj0bKbsA3jI7GwI6UuF64YRG14aZnKQTsobTnq8c5GYIpmG1OvGxxYDT19UU72RdH/dgEpxo394LDKfJBR2VXxDDI2MrJgdx17asEjT/TK+ICKM7XhC++ugqxx8w9+zrbj5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788564666; c=relaxed/simple;
	bh=ZtreTmFmBHdeAhJRuWlqO4cPkfet9XjhLHrudHSsfoY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Ov/ve+v4PZhzoEeRIggfmSXQ+A6NpvZjQQM1XqoNaNWPd4l3h9hDNuHrUd0KaBacjp7KztxcfjPjlrbJk9OuAtCOdNpaSbfASH7YnjZaZLX8cbpuD9Ynul1Od+MV2hLav5LDbc9dhHtthpMxS7HkphPlTK2goxpDmQ/B2/h3miM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGG4Tr1t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGG4Tr1t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43AF1F00A3D;
	Fri,  4 Sep 2026 23:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788564664;
	bh=IA2cXZBXys+hzvHEv4URTwQ3OOb93LSxEWppdiqc9uc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dGG4Tr1tQg+IPjNTDArjpWzRgpL6UXXBwEE6qKGo6YV4raR0M3XCBLLIm/pin0b0v
	 jNWokqHGJoaIoxZEuqTZ3oslhnUu7J4qYlgqzjdhBGDR0pEVR0WsEDx5pOd6Mq5q/k
	 Mu+XuZEOjwPVBFih/2Q87WONrJJ16U1lw0B4hd2SQ/G8crOGuQjkjw5eUwTkRFjoty
	 NSMCKhoZnVJWdvo1YEf1zyGyeTOQYPpnDVENIY5Oh5JUYrsfJCzFGm2KghSmmWCveP
	 wIu/DltaJC+W+KLHda3IASaP4MoKNLYq+NyF0oSK/cpHWqu2IA0AK4cMbSvQBehvm8
	 5L7dQwaHqdx2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BDA673924FC0;
	Fri,  4 Sep 2026 23:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] vxlan: reject dynamic fdb entries that reference a
 nexthop id
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178856460565.1016359.3887268447112947358.git-patchwork-notify@kernel.org>
Date: Fri, 04 Sep 2026 23:30:05 +0000
References: <20260902155956.296699-1-qotmddnjs@ajou.ac.kr>
In-Reply-To: <20260902155956.296699-1-qotmddnjs@ajou.ac.kr>
To: Seungwon Bae <qotmddnjs@ajou.ac.kr>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, dsahern@kernel.org, idosch@nvidia.com,
 shuah@kernel.org, horms@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  3 Sep 2026 00:59:56 +0900 you wrote:
> The commit cited in the Fixes tag allowed VXLAN FDB entries to point to
> FDB nexthops so that overlay traffic could be load balanced across
> multiple VTEPs. Such entries can only be configured from user space,
> cannot be learned and cannot roam. They only make sense with a user space
> control plane such as E-VPN where data plane learning is disabled.
> 
> Despite that, the VXLAN driver does not currently prevent such entries
> from being configured with the "dynamic" flag. The per-nexthop FDB list
> is only protected by the per-device hash lock, which is not sufficient
> when two VXLAN devices point to the same FDB nexthop and therefore share
> the list. Aging runs in softirq context without RTNL, so an entry deleted
> by one device can race with an addition or deletion from the other,
> leading to list corruption:
> 
> [...]

Here is the summary with links:
  - [net,v3] vxlan: reject dynamic fdb entries that reference a nexthop id
    https://git.kernel.org/netdev/net/c/98fc57d16744

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



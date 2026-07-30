Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2461D5CFE;
	Thu, 30 Jul 2026 23:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453654; cv=none; b=lf8K35id8IKeX9irhrJDQenNfxjAgRhQF0f1F45dj8HtxO2oJoW+2knf6V+XrHltRNJClVHqmcE+aXw+OairW9JyoU8CRBApV2qogdxdmzGKJtrT3pF67eP9UDZ2ntbMSJj47SXia8ppY9ZXrz2jDkTcNosMynq0lVAJyhKplLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453654; c=relaxed/simple;
	bh=8x8lEXNu1ys7aGu2cbi5tQBP2+SOUTvkgvDSLAVE4PQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=m9ueAsC1h1inZbUgGuUYbO+F2A/aAWrLJvmxkix8TvrLUsKVl9rKZEpH4pGOoyQCu8jPOIJzyJhL5VOMF8a0Un6xNviLScSMqAy2Es32A2yC++WWrYZItErQyvFkty8Msk/456U8p4wYf+2sYaIGKwc6/DzRrKgeyY3YhUBzeyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8oVTNyf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8oVTNyf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0BA1F000E9;
	Thu, 30 Jul 2026 23:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785453653;
	bh=Hal3ZHUEy1yTMiKKkMegpPtw7RsTkkGM+Qi9/69gGIo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=C8oVTNyfJJUlA/X2Lo8EDVWJTzchOWGJwdTHTldhPHp1tv/2j7uiCdO8Ufx1tI9Q/
	 RDOOGJCGlwSpC/vAzYmDs0rYg8lLiEd/nUtmz425bJyTO+1JNp9/ydsP76dxo1RAo/
	 vuRBdkuPQD1d95b5BheAgVvIpukl3j/W22lZJGQsfv7wP42hYRuOkbId/Vjn/zyZ6V
	 hs1vnHD+fm2Uk10UXneIw8nsbpoPqJ3M7Xb5tZes0W1ul2N62a9jEMpz4CHzmHuvYZ
	 TlOo6cHcUGUEjBF8+cKh3VHBvGZy9qzlqAFgk1vx4WO5EeTX0FNSWrFhG8jZs8xxMk
	 LO6Gfps1gVF5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A75392445F;
	Thu, 30 Jul 2026 23:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 0/3] net: nexthop: per-nexthop UDP dst port
 for
 fdb (VXLAN) nexthops
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178545361613.33420.12124174635799172963.git-patchwork-notify@kernel.org>
Date: Thu, 30 Jul 2026 23:20:16 +0000
References: <20260724-b4-vxlan-fdb-port-v5-0-cd1c6aeee058@gmail.com>
In-Reply-To: <20260724-b4-vxlan-fdb-port-v5-0-cd1c6aeee058@gmail.com>
To: Jack Ma <jack4it@gmail.com>
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 24 Jul 2026 00:26:15 +0000 you wrote:
> FDB nexthops let a VXLAN fdb entry point at a group of remote VTEPs, with the
> kernel flow-hashing across the group (commit 1274e1cc4226 ("vxlan: ecmp support
> for mac fdb entries")).  Each leg carries its own remote IP, but the UDP
> destination port is always taken from the VXLAN device (vxlan->cfg.dst_port)
> and cannot be set per leg.
> 
> This series adds an optional per-nexthop UDP destination port for fdb nexthops,
> so a group's legs can share a remote IP and differ only in UDP port.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/3] net: nexthop: add NHA_DST_PORT for fdb nexthops
    https://git.kernel.org/netdev/net-next/c/53531e6a644a
  - [net-next,v5,2/3] vxlan: honor per-nexthop fdb destination port
    https://git.kernel.org/netdev/net-next/c/951085f82873
  - [net-next,v5,3/3] selftests: net: add coverage for fdb nexthop dst_port
    https://git.kernel.org/netdev/net-next/c/992965451db7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



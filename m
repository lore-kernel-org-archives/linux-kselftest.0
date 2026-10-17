Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF2437C908;
	Sat, 17 Oct 2026 01:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201812; cv=none; b=JvFLG6l+XqLtb4fAUI4Ry+v+IJ50YVhquG691kmf4+ta+YCefobD3JflDfa0HO8ImHdUF89dhLLgd9+M/6pdx2REdj2CnBZa+7+ZzEiapCMUpKl9Le3dMBCcGUBqJ77XUBLBKml4XDil9uNwQWsoIJbbXhRL72tFJVMsYDRDtZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201812; c=relaxed/simple;
	bh=KxWkG2VVV7cSQnp/jCb2ZwtVELj2hDnv/aqIiMDVGaw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=izd57ZdR5vfScte9HmCvQxeywLtJEuzpu8DU6wLQnyfLkbT4cZFzQnbFAtWIfiP5XUhrawM6dToo66fKdFK0NZOTEMe0k2jAZjc5kbncGgy1mN+wPmuUUTkwtu0K0o4JsdFjboYyHfoFhMrXAHNSpGbD+qCY9FpLQeMikibpij4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evJFUC/J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evJFUC/J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449B31F000C4;
	Sat, 17 Oct 2026 01:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792201811;
	bh=3UV+GBKm47o1/dmcky29Xs+FCywcyP50qtX7jgNyaLc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=evJFUC/JTH6eCmyYfBGTMBRPlrN8hnvw4kqforS9CSZZ9TyZgnJ+/koRYtnDEEQJi
	 qwpFVPjnNHQiPPvacEjgpD2HC/ro3bvzmU1m4MH9pHgIidh8AXmyqnDTqcGjQecJpL
	 gRMQvd/yTxWCGFB1qd+H3PBhoeYEgNvxTgBC9IDFicu4lnVwYZezVySyPxSVLUs0R+
	 6wYU/4zJ63N2dqdvEZYmj3BBWjNqxy93LCQ1G8qR9/7Z+Rlm9NWraDZwy0n53HyQCs
	 56xzI8PHN4usGuU4BHyjA6SMX6C7na8dE7t+1Mc8ZA9UT8yU8LfEhf5lncVY1NfOzK
	 VYFn8hkPiSBJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A5E3380CEDA;
	Sat, 17 Oct 2026 01:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/2] gre: merged GRE-over-FOU/GUE packets are dropped
 (bug report, possible fix)
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179220180976.1055958.15695873779763495713.git-patchwork-notify@kernel.org>
Date: Sat, 17 Oct 2026 01:50:09 +0000
References: <20261011-bradfitz-gre-fou-gro-b4-v1-0-df713aad1531@tailscale.com>
In-Reply-To: 
 <20261011-bradfitz-gre-fou-gro-b4-v1-0-df713aad1531@tailscale.com>
To: Brad Fitzpatrick <bradfitz@tailscale.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, atenart@kernel.org,
 willemb@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 11 Oct 2026 01:41:26 +0000 you wrote:
> I hit this by accident while working on something else: bulk TCP through
> GRE-over-FOU tunnels between some EC2 VMs crawled at about one segment per
> round trip, and turning GRO off on the receiving NIC made it go away. I'm
> not a kernel networking person, so I went to debug it with an LLM coding
> agent, and it found what's below.
> 
> Please consider this series a bug report at best. Feel free to ignore it,
> or to fix it some other way if this isn't the right fix; I may well have
> this wrong. Empirically, though, patch 1 fixes the packet loss we were
> seeing, both on our VMs and in the reproducer in patch 2.
> 
> [...]

Here is the summary with links:
  - [net,1/2] gre: keep the UDP tunnel GSO type when completing GRO
    https://git.kernel.org/netdev/net/c/718f364a20ec
  - [net,2/2] selftests: net: add a test for GRO of GRE over FOU and GUE
    https://git.kernel.org/netdev/net/c/d0eb9632fd98

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B62433A9E8;
	Wed, 30 Sep 2026 00:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790729408; cv=none; b=urMTdUQT0KYS8/6hM3/jDnhucqvTUaBNYDY1iHWthbF4VZLiXM5ycjn5brKgNTpzvmDEQYB+3BfY74sOpQVQ4s9gvoWyASxBcvKjXo1pw4naeoCEKOa2OFjFwFRnvUeIOAv2hZdsGsRlU20IZ7tqiz+Mw4IFPUuoMTvok5lulBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790729408; c=relaxed/simple;
	bh=TjiKnNl1rUdu6C/SiyWkAG/6zIZAFl+XTZQALhS4gCY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=oUP2qkoebX9V4KuLCiqgO2+I1r1CWDnExBCXsjQQgMTNL8EsoaAttlK6aYZqOtCXyufXd6anp9Bsphsix5V7/YGPndlvyVhrGR+6W40BB/Q/RMIDoaKKXADdjQb9S1r1GJHfMePMToyXq8OrAbpp5cc33jFrXVJ+fwHqRsvHzPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUdStqcp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUdStqcp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E081F000FF;
	Wed, 30 Sep 2026 00:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790729407;
	bh=9v1GAkHoBOPWp5VtYA6kIbswGlgJ8597azWdEv7u8Uk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SUdStqcpeiuuetzdR4h0MIN6ogcod0wC07kWe3A4pPeQyt3iJY8/LQqJrv2CLh9NC
	 c9YBs3vupjY1XpUQVnjPMevo0bX+Yk8Ai8yCR+5xPbMAfStVOk+X/LsxPl4gTTerdt
	 or9eFvtuZp/+0oulAej5E9GBRvRHefF3mNC0dKVeu6qAfg7j76rGwLL1ybWMEn99+2
	 fl3SX0W7gYZLs1ReFPb+TWHOaxn/gVRAXd/C9YTZ9od9M3GCP5boXsJW6f+tBGu9TS
	 MXPSR1IV2wuvMr6p/OrCdR19SwEMpHBCkyKEUdflsT6RouNNT1grfV0zgsEv8bQmt9
	 JmSsT4OUbfyOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3803924FEA;
	Wed, 30 Sep 2026 00:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/2] ipv6: update NUD_FAILED neighbors from NA
 messages
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179072940591.1186988.3707181901513774796.git-patchwork-notify@kernel.org>
Date: Wed, 30 Sep 2026 00:50:05 +0000
References: <cover.1790127207.git.lfqlee314@gmail.com>
In-Reply-To: <cover.1790127207.git.lfqlee314@gmail.com>
To: Lawrence Lee <lfqlee314@gmail.com>
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 rdunlap@infradead.org, netdev@vger.kernel.org, aajith@arista.com,
 roopa@nvidia.com, jhpark1013@gmail.com, corbet@lwn.net,
 skhan@linuxfoundation.org, shuah@kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 23 Sep 2026 01:34:17 +0000 you wrote:
> Neighbor Advertisements for existing NUD_FAILED entries are currently
> ignored. This can leave a first-hop router with an unusable neighbor after
> the host becomes reachable and announces itself, particularly when
> forwarding is offloaded away from the kernel and traffic destined to the
> FAILED neighbor is unable to trigger the kernel's normal neighbor
> resolution process.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] ipv6: update NUD_FAILED neighbors from NA messages
    https://git.kernel.org/netdev/net-next/c/24717a02aee4
  - [net-next,v4,2/2] selftests: net: test untracked NA recovery of FAILED neighbors
    https://git.kernel.org/netdev/net-next/c/022e48e20776

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



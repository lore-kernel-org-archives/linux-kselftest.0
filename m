Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16586306B37;
	Fri, 17 Apr 2026 02:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776393652; cv=none; b=lcsm5rffj9Z2YgLiClMl5TPVnaOiM2NTzIpaSYx+Wzq2vYKxAPB8YPFbhdakmF9zBYDHNSouPU8u4zTDR29NLoEC4RrfGYnpimHFmcM3YQhF76eMp0AvtysYQIFTqwWWW4chuIuq60myHg2DZ13pYWwib/1vnPQH3zTKsWcOjPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776393652; c=relaxed/simple;
	bh=kffito/ls8Hc9Kh2cCr8+omLT/wvGSLzVyFGXK9VvBE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=e5OhkVfDxEmWHXR9TusOPZlPE7mBAlmZe9SEFQnfg7BVRmSKRuxsrUu9UMVtw6HT/UUwYmpIQWSS6gwoZds0okaSg45J0xVOANbHwhyvnXIjnA3QeYmIawzaeCFD309VC0z3y+cSoDMJLU8K6081OA5EKFGZ1vxxSaaBMhGMlAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k297crOu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k297crOu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9B5C2BCAF;
	Fri, 17 Apr 2026 02:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776393652;
	bh=kffito/ls8Hc9Kh2cCr8+omLT/wvGSLzVyFGXK9VvBE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=k297crOuxcE5Y0y03Ai9pnJcVPliSpZIm8E8ddIz+uw+ubMcZf1IgGyDtfKQ5njx0
	 2mT9VxPYILB/XwM21PDWMu04TBCpRCntQMI9BtiGLtze6BGzfRg+Dq4lc/WCi/4URz
	 CNAXmEOpElCtCeOkqt1vYbmrmFZcKb9Ujx4oOuYmUzi2/8QlKmvVnjUJtF4iBxg2GU
	 HlqBwj9htEDAHmZ48dWSfdlkGzvFUQOeekyqVZ+AEpPSrYOC4nwydjCUqC9BQRPQm7
	 muJKOZWyCjY3fLQubJugxAqZH5GveKO5y5dtcvk/B9v/PUODx+JjLq1qrmBnjMrnXM
	 5k1tngsabNVMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FC01380AA76;
	Fri, 17 Apr 2026 02:40:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] selftests: net: add missing CMAC to tcp_ao config
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177639362004.3490984.2914709149470297319.git-patchwork-notify@kernel.org>
Date: Fri, 17 Apr 2026 02:40:20 +0000
References: <20260416010439.1053587-1-kuba@kernel.org>
In-Reply-To: <20260416010439.1053587-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 fw@strlen.de, antonio@openvpn.net, matttbe@kernel.org, phil@nwl.cc,
 linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 15 Apr 2026 18:04:39 -0700 you wrote:
> Recent changes to crypto and wifi made CMAC no longer
> selected by default on x86 and tcp_ao needs it.
> Add the missing config.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: shuah@kernel.org
> CC: fw@strlen.de
> CC: antonio@openvpn.net
> CC: matttbe@kernel.org
> CC: phil@nwl.cc
> CC: linux-kselftest@vger.kernel.org
> 
> [...]

Here is the summary with links:
  - [net] selftests: net: add missing CMAC to tcp_ao config
    https://git.kernel.org/netdev/net/c/82c21069028c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



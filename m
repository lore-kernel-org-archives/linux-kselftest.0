Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793057408;
	b=DgCmMvX8kqT8C8CaVI0YirtZI7H1I5v/gPBNtCGcezJI7T0hnQUR+IZrShDPqCfJscM9
	 6A0xUl+u9G6zjPW6Om4kWOMZiiskCGEi4hHZ+HDnGyFlO3n91vgT9rMrpGXrd35Jby1SW
	 LN1rtd8YyBHxeboZQxvEN4YNfZR5A5rcFxgg4BjqRCwQ93QnV2HEMyca4kwVUNOXMwXde
	 VGiLVtFBPnK7WFV2vSQxeOGGQpH9bHEVl5V2Q0XGnsR3t51Ji0lqpd/+b3USTPmXy17mx
	 Yk9xSS76cA/KJw4JJbnTDbMp4LRFfTSvxxVB2yB08dZUSZjo0niFfLqc7VimcDENurg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793057408;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=RbLGsBEMCZR6dsyNcrISqdKBbURIdwfcC5Qi6xfskz4=;
	b=iXbf1H28aFwcfQpE2kCb/o5LrcGFHv8iE7in2PZT2Bws1hhMwlTSb1NhKvFi+lV6TMlw
	 dX+PnaHjnNLA/LzSkbVMA8WMoY2p8Jj37qnflQYMdW6D8xaEI4xs0oUY2DIPbUSiMw2Fi
	 SaXA2ND2WcU+jlHiSG0AW7uXM/3ay28mURzyHMTAUWCXuuWm6Y8lk7UXeLa/BuRytDttM
	 k/w0Z5Il1kTibAPqi7oWqEz0qkJzFI2rYyN6zpksVDQO5FTAVWRxONnu55SSjyNvDOSnm
	 SYSU/hCwHx38mQhaUkz5KfAsDos3EoEwDvmYdN+JEBNpwjuAP/VjzEIue9gtk0T65Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F7mtIRkV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315CA606A31D;
	Mon, 26 Oct 2026 23:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F7mtIRkV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC31E1F01828;
	Mon, 26 Oct 2026 23:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793057407;
	bh=RbLGsBEMCZR6dsyNcrISqdKBbURIdwfcC5Qi6xfskz4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=F7mtIRkVt39Gz0jdlj2+UP2yvtoeuBb4BbrDPxfjqn08TbjaEEpl2fswPnZi2a7Zq
	 v3mLOG/WJb4sN/UZ0tDsUWOcdqhm+jVw8M5oPVoNuGcCGvPXCrqDsCV0KSDmMWEp8/
	 zFE4AVzSyU9WjyBjylamwfHKA6uVx+jJxSGqy6vPIKPccAHfDmq18UlQS44aXk8nI7
	 LQdOq4diN+Wt+l5oAMrVlWIvLzyMS4VXsKfANKVqYZ0JEk+fIZscmSRQjpBdlM3c+p
	 BbaeNaW71w5MD2pwU0innjEttmp2+cXky3zxl0HdW4J9NhWhJH+K+C+ox5BgsaFntP
	 FlZJPgiKpiCnw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B41853AA80F0;
	Mon, 26 Oct 2026 23:30:07 +0000 (UTC)
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
Subject: Re: [PATCH net 0/2] net/sched: act_api: keep the offload flags of
 shared
 actions
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179305740657.3456332.16373555932458354385.git-patchwork-notify@kernel.org>
Date: Mon, 26 Oct 2026 23:30:06 +0000
References: <20261021193222.1318333-1-acassen@corp.free.fr>
In-Reply-To: <20261021193222.1318333-1-acassen@corp.free.fr>
To: Alexandre Cassen <acassen@corp.free.fr>
Cc: jhs@mojatatu.com, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 vladimir.oltean@nxp.com, idosch@nvidia.com, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 21 Oct 2026 21:32:17 +0200 you wrote:
> When a filter reuses an action that another filter created, the action
> also gets the skip_sw and skip_hw flags of the new filter. These flags
> apply to every filter using the action. A software filter thus stops
> running its action once a skip_sw filter reuses it.
> 
> Patch 1 lets only new actions inherit the flags of their filter. Patch 2
> adds tc-testing coverage on a dummy device.
> 
> [...]

Here is the summary with links:
  - [net,1/2] net/sched: act_api: inherit filter offload flags only on new actions
    https://git.kernel.org/netdev/net/c/9463e8d8c692
  - [net,2/2] selftests: tc-testing: test offload flags of reused matchall actions
    https://git.kernel.org/netdev/net/c/4b3a32b56e5b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



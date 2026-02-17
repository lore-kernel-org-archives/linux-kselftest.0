Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABF1318EC2;
	Tue, 17 Feb 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771321818; cv=none; b=cOrAMxrUa7YuoMHMp/Hhrym1hZzIczPj8O8KEIkunEaR8Acb+qdhi2LuckwMyHcycDzdOIOpBkaAeD7M5Y6fEg9HCxyEhXpknGxBgQSBsBPvzfqUJ8qquim4xhnZTQPGHv/hRL87mXtXM6Mh8+Si0qZwZ9wSPQc+rQATSyYJmsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771321818; c=relaxed/simple;
	bh=QlMcz1jL4ZU1sC8P+L8TWMDIrSGK5yzXJIyjLcaeOfs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=D2FueDkDCux9nOAIeJgPPaCSs+cIc/vNLXrnvy3eO2MdeZbZuvQ9gVEKmOV2pfu6X/6hJCNdxZpVKVf7G2kw3Mt/p+EMvLBsGAyQSgKRA8t0MunEhwZsnfGRgxPVAPtxMaeRpeUl6lz4gqfGeqmHTF2Ev8eMP25Hq6u2PMSLjhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKLoodpg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKLoodpg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D855C2BC9E;
	Tue, 17 Feb 2026 09:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771321818;
	bh=QlMcz1jL4ZU1sC8P+L8TWMDIrSGK5yzXJIyjLcaeOfs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IKLoodpgQ1ReA0RVkcZ7fyULqM/gEHkBXhtJNXaSKr4/FRG7PeHHI040UEyBOIvJy
	 L0De8g7zB/E7mhIZnP7LcQhIyvx8KZ3o+7fuTse4/hWQrQCELYyrqUhz7fnduXaBSh
	 WvdohStbxffm9VAKh4l6YaFF51qzr+qR305YouIS0NhqcrX2qP84Rll1w/z3XMr/Am
	 IYeB4+oOgLgnozqXVe+AF0BzS5hrGZTNcFdqlStiK8Hw7Fd4EME24gp50Iid3R7VFA
	 w48qQZa4KmDBwetJFfp8sDQaUhxLAcCOkrATaN7XdTFOBHR9EDzWrWRz2E8Gt0fBkB
	 +lFP6BTQ9CUag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C2191380AACF;
	Tue, 17 Feb 2026 09:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/4] eth: fbnic: fix and improve header/data split
 configuration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177132181061.4191076.11098666008193048812.git-patchwork-notify@kernel.org>
Date: Tue, 17 Feb 2026 09:50:10 +0000
References: <20260211-fbnic-tcp-hds-fixes-v1-0-55d050e6f606@meta.com>
In-Reply-To: <20260211-fbnic-tcp-hds-fixes-v1-0-55d050e6f606@meta.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: alexanderduyck@fb.com, kuba@kernel.org, kernel-team@meta.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, mohsin.bashr@gmail.com, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bobbyeshleman@meta.com

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 11 Feb 2026 17:00:40 -0800 you wrote:
> This series fixes TCP HDS configuration in the fbnic driver and adds a
> devmem selftest for the intended behavior.
> 
> The issues fixed include setting the correct CSR for EN_HDR_SPLIT,
> adjusting the hds threshold clamp to avoid long headers overflowing into
> the payload page, and configuring the device to use L4/L3/L2 header
> boundaries when present by programming the DMA hint bit unconditionally
> for all steering rule types.
> 
> [...]

Here is the summary with links:
  - [net,1/4] eth: fbnic: set FBNIC_QUEUE_RDE_CTL0_EN_HDR_SPLIT on RDE_CTL0
    https://git.kernel.org/netdev/net/c/bbeb3bfbffe0
  - [net,2/4] eth: fbnic: increase FBNIC_HDR_BYTES_MIN from 128 to 256 bytes
    https://git.kernel.org/netdev/net/c/bd254115f38d
  - [net,3/4] eth: fbnic: set DMA_HINT_L4 for all flows
    https://git.kernel.org/netdev/net/c/0f30a31b55c4
  - [net,4/4] selftests: drv-net: add HDS payload sweep test for devmem TCP
    https://git.kernel.org/netdev/net/c/e7a3c1adc127

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



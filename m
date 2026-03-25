Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4167A2EC54A;
	Wed, 25 Mar 2026 04:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774411828; cv=none; b=t5in2P/ZgMqcZVV5l213tq9nRX/ar7tymLSjwZfFEwVZIg3vzj4CPNNphBw0jTK7E58w9ht2xL4jjXcBKzCr68K9nS4+phiXajAigndso5Hn0TisOhKLnSGJCBE07SCa80zY2enjW9EK/xpcysmefOxWTluiCx2R1taoxEYWh0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774411828; c=relaxed/simple;
	bh=akDemQiTVm5UCxXymzjOHOaTXpVPjA89/TYQMzejlEs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rUBYO/zfw6/EQw0IirE4YgtHfLOXiT7oo5HW+J8VrLHuGCitoBtAPU4jThuqwnWYA+6XDCi6rzOIOfiPi7NH1afs+ZxednFn976N9STsySdiJozoW6ksKTmlUCBeV+z2wbaafiLPKr/lIl+p72hHdQnd2Pi/kCVVwDNDt6sF0KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsQY8KaY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsQY8KaY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC632C2BC9E;
	Wed, 25 Mar 2026 04:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774411828;
	bh=akDemQiTVm5UCxXymzjOHOaTXpVPjA89/TYQMzejlEs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WsQY8KaYMnWpYuuTSfeYFP5tZnGZA7X4+iEaPuXMlXAYuav9SJzJ53iW+UGPdGlVC
	 TjxM8JOZn1FGvcr+LcNsjs2eK98anzqKT5no2lXhV0kop2Jg/51V8E2rNM3RyHQ9/r
	 FDreZkJjvtCPd1Bgb24q4Q2vE/sQsG7zMZ7n4EqbL6TR82FhXJvjaGQSyIOfXJ6ciR
	 e5IeTxp9TuQzkg+K1OWMOc1MyQAA12jOgtWkez7EDQsveNKgXySTojEOs9AwSwlpEE
	 r+y7RYwamLUOqsqJQSR0HNtH/zGc+dN94ZIz4haG+kYAsljZSalX7o4rdZz0UtQ1Q8
	 P7HnPgNd+AqXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA1083808203;
	Wed, 25 Mar 2026 04:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] selftests: drv-net: add missing tc config
 options for netkit tests
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177441181528.1422230.1095710333878894810.git-patchwork-notify@kernel.org>
Date: Wed, 25 Mar 2026 04:10:15 +0000
References: <20260323-config-fixes-for-nk-tests-v2-1-6c505d83e52d@meta.com>
In-Reply-To: <20260323-config-fixes-for-nk-tests-v2-1-6c505d83e52d@meta.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, daniel@iogearbox.net,
 dw@davidwei.uk, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, bobbyeshleman@meta.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 23 Mar 2026 17:08:10 -0700 you wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> The NetDrvContEnv env context uses tc clsact qdiscs and BPF tc filters
> for traffic redirection, but the kernel config options are missing from
> the selftests config.
> 
> Without them, the tc qdisc installation trips on:
> 
> [...]

Here is the summary with links:
  - [net-next,v2] selftests: drv-net: add missing tc config options for netkit tests
    https://git.kernel.org/netdev/net-next/c/112f4c632007

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



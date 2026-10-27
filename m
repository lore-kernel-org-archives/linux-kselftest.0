Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793065222;
	b=TValO76TXWf/WvCnbqKLpK1FgXJS3U+QY0+KMInDHBmPE8haD5kkneTEGoA74Z5PFmoJ
	 lzfSZ9hpGNQvKFAgZbJuUpE2WgX5alHN32DLZhiCxkeMpTeLSOWLBlhWpRQeZd5nxAOC2
	 aLCvfCdqP/EoC7EalY7gd7JDu7iEFf7BgVeVswwBblXBHWBZeTd946+NmQZF/4Ca04Cqa
	 pMx2hn4b4B5YTTAVVZAiXrLzwHmO9bcMsa+LYejZdhyOeBIcY46gAJ7H+WVcmsA+ft+RG
	 dt/tMzDPN2Xwjh4PQI+n4yL9hxjhBtZDZya+xJzo6s+s3QwTt2XObd8qHQXci5OAmyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793065222;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=fjhejy/igLQraiqiZTbJTSw1GybJnz6qiTwev6y1yhU=;
	b=QQccJxTUh/Owi7Y5ZtjJqgqptovjY7Kl6vmsY+gJoo5ZWNXxvlPHyy/vBwPfSL/QWcmv
	 Kq4nU72Ya7lMC1bTjmjos3Q2apMk2aszXafNWah1aKzZIbU7oKpg9W9bvw0eNsNktLv2I
	 Mv9YvhYQ6Nqn7K9S1lSH/9LUFDzsP/Mnm8YeAA7SexC4DXHpd2LphVwLqGusiWeKvl0iW
	 jzWG5ExxLOc5fQhe2tQntnB6WbvzznTBUOIy/8p1b+D0FL36woDCvQXbZIHV2bDj/73aJ
	 AhvPXefBX2dyewyA0apanhZNGa/ShLCCEF+3LLtVCIc9c3nHijmAjYwVLJN9sf4nyuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QOUcL/0O";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7389B606A325;
	Tue, 27 Oct 2026 01:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QOUcL/0O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E16C1F01825;
	Tue, 27 Oct 2026 01:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793065208;
	bh=fjhejy/igLQraiqiZTbJTSw1GybJnz6qiTwev6y1yhU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QOUcL/0Op0cxJhMhldeYD5WC1R5dgqjOQ237Ged78C15RisZFDmF3D+ZcZXHwia3z
	 2LNSvDbiG6lxZWPGObNasQbvS5jDr5qD9tc3G2j/620txVgZTov+4CxiUm03auQFZh
	 eq5LfZL3r4lpVPT0/YSDZ5oWtyqeSCX7TuzLitqCAffvV79rIz1MYbONP75hZXfZsx
	 ErNgwoXdAu2yEeuiyQo5G1GG+ObxrDW0csqOL/R6lmkZLQIDyQqA3H82AGV1yvTVPv
	 kEQGCU/tfVJkbvaHrqE3fTmsozFST5aj1rFDVTJDmi7+9FoGSn60iC+DQ/Z63VrQG1
	 6B3Sy3YwB4ooA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4440E3AA80F1;
	Tue, 27 Oct 2026 01:40:08 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] selftests: net: forwarding:
 bridge_vlan_mcast:
 Allow default startup query interval to vary by HZ
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179306520682.3504795.11521290677798073132.git-patchwork-notify@kernel.org>
Date: Tue, 27 Oct 2026 01:40:06 +0000
References: <20261022103023.834927-1-jinli@lanxincomputing.com>
In-Reply-To: <20261022103023.834927-1-jinli@lanxincomputing.com>
To: Jin Li <jinli@lanxincomputing.com>
Cc: idosch@nvidia.com, shuah@kernel.org, dsahern@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 22 Oct 2026 18:30:22 +0800 you wrote:
> The mcast_startup_query_interval default value is calculated as
> 125 * HZ / 4. With CONFIG_HZ=250, this results in 3124 instead of
> 3125 due to integer truncation. The test currently hardcodes 3125,
> which fails on kernels built with CONFIG_HZ=250.
> 
> Allow a +/- 1 tolerance for the default value check to account for
> this rounding, while still catching genuine regressions in the
> default value.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] selftests: net: forwarding: bridge_vlan_mcast: Allow default startup query interval to vary by HZ
    https://git.kernel.org/netdev/net/c/9e2ba4a17735

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



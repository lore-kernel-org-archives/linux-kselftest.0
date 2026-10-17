Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52AC388E76;
	Sat, 17 Oct 2026 01:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201223; cv=none; b=jAei3JqB2okb/B8iEAzc9zwptWBDoRhtq88v6MeFfeFmZNFe28/95GAETTySfGp3thweyYxmE5TkZTyC+t67gM+/QJqENz2g4Y36+x9U/BW+PFYGMd8qsCg/BvTllO+yK770Txhwcq2gu0WN12hRAd5cgpzvIuWKROpdvkLH7BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201223; c=relaxed/simple;
	bh=rvSCcv2B7Q3hmBG6UdlHr2Ahf7694CAXsCjUoWI5Mis=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gPMnZsXm8a6mIFVnBmD2RN5t74bDk/nYuvFWAyNdvCJ68r19dlyEssyMWjPaF/Y85aRZKM+CrkHrTVMlBKGRxEbsGCtgmDfrPHSQQs7/46gG4OuGT53z8WkM2JEc4e7B1CMyuSiiV/3lQNrDQvyOsQe2AvG6ErsA3iGlygFqk9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNoNqe2W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNoNqe2W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821B21F000C4;
	Sat, 17 Oct 2026 01:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792201221;
	bh=hRF1iwVdfPrpTun+FtTH9nio/HLqKk5fIzJM0j7xd2o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PNoNqe2WFBrgkFZdOYdjvgHkMswCfIOHS0OzZKfyyNVqck4ixqglZ4yyxrLzUgzpf
	 YrhON6ne3QZEXvaJWBbT5nC17IfCXxiZZ/Kq55r22fTL634z+LMIpjGcw8f87poXdK
	 RZbwUH3wq58UoNPKMPGD0WAIFHGkl85AzTJ6PLbLZK9GZDVJa+C4HHd2AkQ34dtMOm
	 iQ5lzPHiYIRvGKOy3b2SgL8sjB4Zl0HLjaezTEP+1JmAJ12SzIVJDeVWlbm50gw22p
	 psHqqOF/v3G2Z+QZoAFeFi4MeTwG1NlJCpTJvAIYoQcItvdOhzKhQJFwkSghlyUAgA
	 rpxx3c+Ede7fg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77453380CED9;
	Sat, 17 Oct 2026 01:40:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/2] bareudp: Enable BIG TCP packets
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179220122001.1050340.14067419361177757492.git-patchwork-notify@kernel.org>
Date: Sat, 17 Oct 2026 01:40:20 +0000
References: <20261011102023.1603595-1-yanhaishuang@cmss.chinamobile.com>
In-Reply-To: <20261011102023.1603595-1-yanhaishuang@cmss.chinamobile.com>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, alice.kernel@fastmail.im, daniel@iogearbox.net,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 11 Oct 2026 18:20:21 +0800 you wrote:
> This series allows BIG TCP on bareudp, the same way as on vxlan and
> geneve, and extends the big_tcp_tunnels.sh selftest to cover it.
> 
> Patch 1 bumps tso_max_size of bareudp devices to GSO_MAX_SIZE.
> 
> Patch 2 adds bareudp to big_tcp_tunnels.sh. bareudp only works in
> external mode, so the test attaches the tunnel metadata with a tc
> tunnel_key action on egress.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] bareudp: Enable BIG TCP packets
    https://git.kernel.org/netdev/net-next/c/1240de9e5120
  - [net-next,v4,2/2] selftests: net: big_tcp_tunnels: Cover bareudp
    https://git.kernel.org/netdev/net-next/c/3e3f209961b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E091123ABA9;
	Fri, 30 Jan 2026 02:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769739813; cv=none; b=VQWWasO5O89EcyEdIzFz7Wd781GxYxGz09cMd2D79FWN+yyPnEB07hor9UE45Eb1GzyaGkbj51oo6A2pL8bXm6hHSTtdnw1bIa2JUBcJ3OlDz8Oy+pSPKfUXa16o8SislOuiATlAt1+234H/gfXRxYlCn223jAqfS+9CYJ0XnxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769739813; c=relaxed/simple;
	bh=BlU5eFSesktZyHuG1tmmISURPTtZ6Vo+9lfLjQHeuBw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KULIBcH2SyINN7epSkaRbDBf9OD6wUXATtos7b+9pFE211QCDBGRSUFKLEFrVt74NOaxWXwdbGtx0Rt0hFIP+iAUtVtrUIvNP3tufOJMmQyBdBGSPE/JA9rE+P5Ssff9d9kweAW0blJYYO12RfU3UMgDVYakW4Lu+YmjttzGT3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8cRilcR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8cRilcR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F45C4CEF7;
	Fri, 30 Jan 2026 02:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769739811;
	bh=BlU5eFSesktZyHuG1tmmISURPTtZ6Vo+9lfLjQHeuBw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=b8cRilcRYRNwQmrKFLdbgean3jPbfvHAIrTJu8C2f37BKn9y3yidBWHKqna8g97rJ
	 qH2YnVCVIQddtO1nFlCv/s2RkxqLuc8H+Iq7SqEjgJMAknekv6R45lF9UAVf0HMGkd
	 rTMPXGMM3jWSsIax0Py7kX2Z3rHqNOb5Zl/F0Xr8B0MiEGUJZafvxNs7+mretf85ZQ
	 KAhy2+4aNJvYXBzhMp8SYcxeTWkYFFaKdh/x6Di4yLQmrY/58KVRTFT2AYiXmYQ7D6
	 cX9qnMUf9WKSXZfmdim2aciyz8NYn2jU5an5JkusTbu+O6McyL+9QzwlOTWcTVaXNQ
	 xIuojJX0bkYcw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8CB1380CEE0;
	Fri, 30 Jan 2026 02:23:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] netconsole: selftests: Move netconsole
 selftests to separate target
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176973980465.3141392.7468153319055882341.git-patchwork-notify@kernel.org>
Date: Fri, 30 Jan 2026 02:23:24 +0000
References: <20260127-netcons-selftest-target-v2-1-f509ab65b3bc@gmail.com>
In-Reply-To: <20260127-netcons-selftest-target-v2-1-f509ab65b3bc@gmail.com>
To: Andre Carvalho <asantostc@gmail.com>
Cc: shuah@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, leitao@debian.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 27 Jan 2026 19:39:20 +0000 you wrote:
> This patch moves netconsole selftests from drivers/net to its own target
> in drivers/net/netconsole.
> 
> This change helps saving some resources from CI since tests in
> drivers/net automatically run against real hardware which are not used
> by netconsole tests as they rely solely on netdevsim.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] netconsole: selftests: Move netconsole selftests to separate target
    https://git.kernel.org/netdev/net-next/c/b3827c91cc99

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259D75867DF;
	Wed,  9 Sep 2026 20:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986486; cv=none; b=s7ggDciyF8i37PSFD8IVof/gYoU1iuSu1GZQE3YtKaH+pxP7vlyHgWofVgsepllAftOuncWfg/XouMyL4GKmaxCQxjaQ8Ix3X4dkRfP3USFd7GR83x8j0iRwQmQYerCRxc5y0va4yXbSvmqoMcJqU+Q84hMiy8bk14dR6ISZ9Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986486; c=relaxed/simple;
	bh=HCmeQkOIRmSBst9dyVZU8NzNrGpmnEGzwTzKRB9i9aE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HmE+FIKlVEYje6mcUHBuNbpcL58Y6wNn0ZtE2/H3SqLiPVlW29JE7sDVtMLyCPGq+/9kwwMlK6h+FAC1T9IkWJycGl8k67DDpMOxoRpUKgJ2AL2a0U886P3o10PZfQr5/bl1iuOTASVEC9MnWbWtfOyBZ0+0ZlFJbEAzPMcVLoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=op4lJQWe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="op4lJQWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8CB41F00898;
	Wed,  9 Sep 2026 20:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788986476;
	bh=msTP5Bd54JtgpppJH/rCUKFyLLufcp0laqXzUTVrtOM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=op4lJQWeA5qka0shjc98Jom6/x2G4PaJ3IGTmJeohmptTk+XHilxZQxcmJIqW30kw
	 pbH6LIgJRtFxlr48/v9wIXzbR63ZSzvpxF2J1L3NvEe6/8wuWtXUK9hjG2Ng7E1HXl
	 qEa4PchaopV12MnG8nVqZoA6RtiF93imUQdfvcJT/ftBE2O3tdh/gUgXz8VIZjIriM
	 SoiGAuIFzevq+LszQ8aeduE6gBce/OgmkzzjmYA9X/aY8I2iOJYzziPZYPdJ6ros/S
	 Chnu1cutdpGwU8oF4rscJbitCs3A8q30Fk76CtczBK76jKapvbAuO08qpRoiEdAtDN
	 gxtQeZxLZZOGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0EE0380AAD2;
	Wed,  9 Sep 2026 20:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/2] netdevsim: fix IPsec debugfs byte order
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178898641438.1048067.16597220305587240874.git-patchwork-notify@kernel.org>
Date: Wed, 09 Sep 2026 20:40:14 +0000
References: <20260908140325.13367-1-andrei.gherzan@canonical.com>
In-Reply-To: <20260908140325.13367-1-andrei.gherzan@canonical.com>
To: Andrei Gherzan <andrei.gherzan@canonical.com>
Cc: kuba@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kleber.souza@canonical.com,
 liuhangbin@gmail.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  8 Sep 2026 15:03:23 +0100 you wrote:
> The netdevsim IPsec debugfs file (used by selftests/net/rtnetlink.sh's
> ipsec_offload subtest) prints the SA salt and key in host CPU byte
> order instead of network byte order, because nsim_sa.key[]/salt are
> typed as plain u32 and printed directly with "%08x". This makes the
> reported values differ between little-endian and big-endian hosts for
> the same underlying key material, and breaks the selftest on
> big-endian (e.g. s390x), which hardcodes the little-endian output.
> 
> [...]

Here is the summary with links:
  - [net,1/2] netdevsim: print IPsec salt/key in network byte order
    https://git.kernel.org/netdev/net-next/c/d26840324690
  - [net,2/2] selftests: rtnetlink: update ipsec_offload expected output
    https://git.kernel.org/netdev/net-next/c/a99568611764

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



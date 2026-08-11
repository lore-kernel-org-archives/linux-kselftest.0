Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAF4CA4E;
	Tue, 11 Aug 2026 00:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786406453; cv=none; b=KyQJMDfUoDckZJps2GROcRiRmnEnNPl5c688540w1TOFaRKZ0DDYdsep5163Bv1dcwzv/Ky8Pjj38ry39X++yGWOEYmQWJ+fGDSQO1X5vnf6Z6b0WqCv3e4zXSzjy/EPaDJVMtgjLHk6iEMt3S1d/XkCLoLQ5OTydmWPGmH2dQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786406453; c=relaxed/simple;
	bh=CWQAD2WlweWuEc6uMZeFr3d0VYpCCHUwUbabTlK9aDk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FVs+sDZScA1dZ6VeS7WY+p9ca8QrNX4JYCLqrX+4bHXiT6xjU+1aRES6gwPbEEVIULLplOmr2tJ0cFEnrtkbpP9f+Nu08KZZ1uYUbDxPMtzX8LrZuVno8rCvcIi/o0Qw7ANyJQN88KT+k3TBJ3kl3rspDKS94JqNBrXErt2UUjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERPz+9Lw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERPz+9Lw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46761F000E9;
	Tue, 11 Aug 2026 00:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786406451;
	bh=w9op98tL5JjEiJmc7uQU1o77dhpJn6UwG6jiizJ8r0M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ERPz+9Lwjbm5+mO5d6KuqviGqNCE6r+2KRjVT9Ym6i2J46o1EhriYg85o3hv/yQu4
	 hQ6Me8amsxKJUsndgkNeg47Wgv4DnaMmFCZM2E86RULc2bInvDGHEcOg77G3aOmr3Z
	 uF3D6+AZxUefiRmvUSY19+vMJBEOrmwN6b8QwuoAZ5hu74KA75ssvMc83t6AORzDac
	 8jhP4E5NA5hP5uzd4Ch7iA+J1FvSluE58sFd4aWXh6YUtUC78NT+9OX/8SosqFzpNg
	 uP+KsAtdtSWjyTG5ujVO9FjKZ6LnCHLuJ8SUGymJ/9t34Bf4lsOOUhg5GoMV1xJeEN
	 VpTLOxC5akG9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93974392626C;
	Tue, 11 Aug 2026 00:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 1/2] selftests: drv-net: pace ethtool_std_stats
 packet generation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178640640814.260499.16695015712060305281.git-patchwork-notify@kernel.org>
Date: Tue, 11 Aug 2026 00:00:08 +0000
References: <20260808163653.2460381-1-kuba@kernel.org>
In-Reply-To: <20260808163653.2460381-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, andrew@lunn.ch,
 shuah@kernel.org, petrm@nvidia.com, ioana.ciornei@nxp.com,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat,  8 Aug 2026 09:36:52 -0700 you wrote:
> mausezahn defaults to sending packets back to back at the maximum rate,
> which can cause packet loss, especially if receiver is running a debug
> kernel. Space the generated packets out (-d 10usec), like ethtool_rmon
> already does.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] selftests: drv-net: pace ethtool_std_stats packet generation
    https://git.kernel.org/netdev/net-next/c/f4cf60568747
  - [net-next,2/2] selftests: drv-net: let ethtool stats settle before reading
    https://git.kernel.org/netdev/net-next/c/855631afe0f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



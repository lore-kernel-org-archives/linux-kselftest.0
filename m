Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CD71DB95E;
	Tue, 11 Aug 2026 00:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786406454; cv=none; b=PWjPnrAs4Kaev2W2h1V4ULikJEVHB2Q5cTZXGxCjW9Nd0p4TWOW1eRUXIHW58cfpatAJaW0uxjHvSqjn1wEalt7TaBTMmWUYabiQt5y8mUFKCUFTVOgc22dFFm4fh8KwMvQcfTHo+EziQuVbFQPakBAZY4qrqIPouk2tWWqt88Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786406454; c=relaxed/simple;
	bh=FLCGDxO/pc5qJbCuFhbFnZCBo+GIDO1OXUJL4fvR1+M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VW00/Pngo4pP+z9zAh1d5dVH6E9Qm2t4pRAAaA6dEwwPMJk5ERZp5xkFspQReb7OPqTax+4Be44u66udsjVzv0/S+GlevJGAiESItX0MLxe16y7Luf0+ytQisjFRpfwSx3Td35zU3CfZszG4XTyzksjNW+ajjEaTM0jd5v7zVH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtkGipEp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtkGipEp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588F11F000E9;
	Tue, 11 Aug 2026 00:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786406453;
	bh=wyzbPmx4aGxsCiMToYAbZwZ4E36y+UT5GmC9dyE8aeI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JtkGipEprmCFZMus0Xk1oIQkNWSXLArmCvrp2QKCVLfXjAyGz9i6Ab+OcGpDmMvxS
	 FlAPkrK02Fv8sznRsbPrSrf/jS+7MQbURFrvryEotlyjtLavbXmu/COvCVOmOfqAts
	 P7jM7VYCAckCLCWgu5Z+1Pf4hAyMG5imgmey/5YHQ/eSMu3YE5d+vQ+85Bc1g8Q+AK
	 EuFtQkDAy5XR8YDEfW4AdwaGa2Rt+iJhY5zyri99lSSaYd1Is/EeZbMcEvLKLKlZ5U
	 eqzz3np45qvttcxaZAfh1uJQlJ8Y0XlZ8OPvSQvRHhry39NMJVXS3cj9e9OXlLBeAi
	 fxuVW7ImBYhuQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1999D392626C;
	Tue, 11 Aug 2026 00:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: netdevsim: fix SIGPIPE flake in
 ethtool-coalesce
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178640640963.260499.13355533167020515437.git-patchwork-notify@kernel.org>
Date: Tue, 11 Aug 2026 00:00:09 +0000
References: <20260808163416.2456810-1-kuba@kernel.org>
In-Reply-To: <20260808163416.2456810-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, andrew@lunn.ch,
 shuah@kernel.org, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat,  8 Aug 2026 09:34:16 -0700 you wrote:
> The adaptive-rx and adaptive-tx checks use 'ethtool -c | grep -q' under
> 'set -o pipefail'. grep -q exits as soon as it finds a match, which can
> happen before ethtool finishes writing its output. When that occurs,
> ethtool receives SIGPIPE causing (uninformative):
> 
>  # selftests: drivers/net/netdevsim: ethtool-coalesce.sh
>  # FAILED 1/22 checks
>  not ok 1 selftests: drivers/net/netdevsim: ethtool-coalesce.sh # exit=1
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: netdevsim: fix SIGPIPE flake in ethtool-coalesce
    https://git.kernel.org/netdev/net-next/c/4d2cbd620a7f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



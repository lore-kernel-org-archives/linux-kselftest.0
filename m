Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD293191D6;
	Thu, 22 Jan 2026 03:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769052019; cv=none; b=rb3ohNqs27JH8cASfnw+Jmz6LcXJ5ieviRrCEssNPCqajmBRDdYrQxFyf4jfzGBb04grL3IZ57y7baaaPdf6xKvC+kTW65oy7AlQvBGAE5lOKdU806851HW+M5Ro6j902GRzE+BfMiCcyCveX13eiMYl6bg1w8xVI1vQ+izqAS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769052019; c=relaxed/simple;
	bh=vr2ZkcnO+6O89/c5BIQBXyG5sR4QFk9LeP+1MleSJFc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=f55F1KWLmPTt5Qh3SNgGiDzzVM7LA7TtFdA8ki6In0NiHYK4iNCFUZp6uYHzxE39qWLP0euOwkPuypUhmKLZQCd7XeeKLG/K0XrboV5jdrh3HZjZxGp9Iz/38UYuGfnQ0loHJH3SbSnVhYfdSu7NhPZDK+U6Srh0yhQCxK3jc7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kkUZExu5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kkUZExu5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E957C116C6;
	Thu, 22 Jan 2026 03:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769052017;
	bh=vr2ZkcnO+6O89/c5BIQBXyG5sR4QFk9LeP+1MleSJFc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kkUZExu5R1aICYwPAZwxWd+5xYoa6vXPpboTjio7Y8BaxgVNbfECIHB/jSLy2Uf/s
	 uQ7IZ5yTkltxWIApujM/Kh8nQh64km7c8g99OQkHKnu84r5a0rHrPLCf/33uk7qosd
	 pQQN5fNKXB8u+ehWgIzx3p98v7/7G3p5qtPpcSykSQ1KbBTvh+qBzWYTql8gfdhugf
	 PBF0J7Nl+IIYb8uKzZdVYAUdpMRhfceon9T6gcoBU/KcSCrNEA7up4TTBRJ99q85eJ
	 LiZzfCI5IPRSKs1CPO4udsErVGNror+KakV6QRiHKkETUePxZ2FU6Q3/OnVWDElxRR
	 AGpdDHKOJ8JoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4EC5C3808200;
	Thu, 22 Jan 2026 03:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v11 0/7] netconsole: support automatic target
 recovery
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176905201410.1539362.17348845300711873444.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jan 2026 03:20:14 +0000
References: <20260118-netcons-retrigger-v11-0-4de36aebcf48@gmail.com>
In-Reply-To: <20260118-netcons-retrigger-v11-0-4de36aebcf48@gmail.com>
To: Andre Carvalho <asantostc@gmail.com>
Cc: leitao@debian.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 18 Jan 2026 11:00:20 +0000 you wrote:
> This patchset introduces target resume capability to netconsole allowing
> it to recover targets when underlying low-level interface comes back
> online.
> 
> The patchset starts by refactoring netconsole state representation in
> order to allow representing deactivated targets (targets that are
> disabled due to interfaces unregister).
> 
> [...]

Here is the summary with links:
  - [net-next,v11,1/7] netconsole: add target_state enum
    https://git.kernel.org/netdev/net-next/c/d793db4aa0db
  - [net-next,v11,2/7] netconsole: convert 'enabled' flag to enum for clearer state management
    https://git.kernel.org/netdev/net-next/c/a46bb0103c35
  - [net-next,v11,3/7] netconsole: add STATE_DEACTIVATED to track targets disabled by low level
    https://git.kernel.org/netdev/net-next/c/e8f4005ab2d4
  - [net-next,v11,4/7] netconsole: clear dev_name for devices bound by mac
    https://git.kernel.org/netdev/net-next/c/5b114087438d
  - [net-next,v11,5/7] netconsole: introduce helpers for dynamic_netconsole_mutex lock/unlock
    https://git.kernel.org/netdev/net-next/c/c52861e566db
  - [net-next,v11,6/7] netconsole: resume previously deactivated target
    https://git.kernel.org/netdev/net-next/c/220dbe3c76ed
  - [net-next,v11,7/7] selftests: netconsole: validate target resume
    https://git.kernel.org/netdev/net-next/c/6ecc08329bab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



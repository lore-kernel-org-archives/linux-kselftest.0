Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22244258EE9;
	Tue, 11 Aug 2026 01:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786411253; cv=none; b=eGSbgceYeNk0qhjYxMCJ+CFhkajvCp8BeYVvxxKDpV/tgMkMo62BZBchyXX+1tTyhMN/hSYxONpISMSHVcuKAq6bIsPZJQlLJ5jQw3fXdGBykRp7ffMT1so2wnDJ+gN/uWU6DeMdBGi3UBesrO3Kmj9HkgLDmswUaJAqg8it5cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786411253; c=relaxed/simple;
	bh=ncSPbof2n7XY7GYOlH+ZNFvB1wCwF8USmwa0zYj6IL4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hXwBvVZOlN9MV5TFKDoS1VQMcjIqgs0OEWsyoeQFcvovcO2eqqNTJkJH/MCQKg8kJqWmXgNH0t3apND1FIx85ezkIMPf74JZ57xcSqAMNJdbrVcuFAaO4MzKqCIxlqZdSQWPZ+OvQQp/n/4rXg9eawFY0O5rwcLlOYtGLoPP828=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4YZQDUu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4YZQDUu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16591F000E9;
	Tue, 11 Aug 2026 01:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786411251;
	bh=Pfi0/DCA5eUgtizZugnGEFyBtc4Pqmh70ACc/EItHzY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=F4YZQDUuIQDKUfLWXjPpoeRVtZkoFRK5nM8/7VHl8/QrNm3Ad2J4BttHSlRGMght2
	 uF8QJ6eN7PZFiTSGUB2AIflUxDL2/3R7G28WqBNrANqahVdd7wXgT6bkSbQ1HHzghR
	 Go1iIsS6i3t2HIpc+NC2xExrt8zTZ/CeFZzvqssYvQ8t4KdfJXjnuqTkcLj/22/SUf
	 e8rdH20a5leXEbPeIDyD0un8ALnbDAbYreYF+zaXqwTNyA6YbJS982JkxBWgqfUq6i
	 MjPayCLPrfIDvze5o9TbE8K3pkZPRKIDSlYeXMwF76bmuvKQNfHrWhf1FUe3g7gIFn
	 UUivni+xmbdQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56783392626F;
	Tue, 11 Aug 2026 01:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: bonding: disable DAD for IPv6
 addresses
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178641120814.284305.4899806613461037021.git-patchwork-notify@kernel.org>
Date: Tue, 11 Aug 2026 01:20:08 +0000
References: <20260808162345.2442594-1-kuba@kernel.org>
In-Reply-To: <20260808162345.2442594-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 liuhangbin@gmail.com, jv@jvosburgh.net, shuah@kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat,  8 Aug 2026 09:23:45 -0700 you wrote:
> bond_reset() waits up to 2 seconds for IPv6 connectivity.
> With default settings DAD itself may take almost 2 seconds,
> causing flakes on debug builds. It used to flake once or
> twice a week, recently it started failing once a day.
> Probably some downstream changes to scheduler, or our machines
> go busier.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: bonding: disable DAD for IPv6 addresses
    https://git.kernel.org/netdev/net-next/c/30dbc21f6375

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



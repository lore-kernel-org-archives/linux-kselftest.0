Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F8A1DF248;
	Fri, 13 Mar 2026 01:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773364816; cv=none; b=ZM8MTzBHkANa1IwTsTc5UrywUJDX7cg2DkNbJYBFMhKCxNlnyj2ObKPn+olFiUruGAFE6rixNwhTvM6Upp+mMfQDe7KMD1hUv8/ZjcTuPa6bRiURWzSH9hT34kdXIg4eYNOCyTG/p+MpMsayixaO2+gl79j2yqKaV4ycxExMN2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773364816; c=relaxed/simple;
	bh=P4ZEgW86XX8zZ5kp4HAscbCZWOXTfT0ha0aGANsnC2A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PmUzYmXzgoaDDc8kweESKWjHP9r1nQeaJywEMOt7wHG5oXMx3AUgsTyQ2i5++dSnNseodbzYrmLOZGcUF4GDY5+RI0IQ2g2cdTzbS0vv8mTSOxw347qA7rPpW+ezAREY4c/NzHNXWRySPsSLlX1NeSdIhhlNsFLRkht0GMQsmtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kE+/Pp9x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kE+/Pp9x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11225C4CEF7;
	Fri, 13 Mar 2026 01:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773364816;
	bh=P4ZEgW86XX8zZ5kp4HAscbCZWOXTfT0ha0aGANsnC2A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kE+/Pp9x6ygFSEREwaPZXLi1ydHmkkhiY9z591Sz8i1l44GmEt9dtWIZ2NLGoXp6N
	 APgkAugetZaL2e+LmL6N9EwENbqIG0NsSHKIsPTaDbGOuqQBvyDw+Gbd+dRP//cXOJ
	 OjlxDibJXe97UuXvC43ag1Ia62DSOf03qMf7a1rlu/7mGJ/JnXmeW5RSirOBSwsUUG
	 Kjd5k9sneNUzEXxCfrHiwaQlNG3LoBaWoB35f03aIS+4L91Ti1ApcCrB7DLuHlt6yI
	 bSUSYBC07fgcfS3EHTDkyi3pzrAxy4G1xttW6zJY2HpNXvV6PZfPKDLz7tgusHpcDw
	 /1oj+oWlBx9cQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF803808200;
	Fri, 13 Mar 2026 01:20:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/4] genetlink: apply reject policy for split
 ops
 on the dispatch path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177336481130.624594.17160246209499400936.git-patchwork-notify@kernel.org>
Date: Fri, 13 Mar 2026 01:20:11 +0000
References: <20260311032839.417748-1-kuba@kernel.org>
In-Reply-To: <20260311032839.417748-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 10 Mar 2026 20:28:35 -0700 you wrote:
> Looks like I somehow missed adding default reject policies to commands
> in families using split Netlink ops. I realized this randomly trying
> to dump page pools for a specific device and always getting all of them
> back. The per-device dump is simply not implemented so the request
> should have been rejected. Patch 2 is the real change, the rest is
> just accompaniment.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/4] genetlink: use maxattr of 0 for the reject policy
    https://git.kernel.org/netdev/net-next/c/b93ec16310b4
  - [net-next,v2,2/4] genetlink: apply reject policy for split ops on the dispatch path
    https://git.kernel.org/netdev/net-next/c/e3a5b7f8ef2a
  - [net-next,v2,3/4] selftests: net: make sure that Netlink rejects unknown attrs in dump
    https://git.kernel.org/netdev/net-next/c/e911be835432
  - [net-next,v2,4/4] selftests: net: add test for Netlink policy dumps
    https://git.kernel.org/netdev/net-next/c/c1f9a89b0c90

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



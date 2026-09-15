Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9BFE54B;
	Tue, 15 Sep 2026 00:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789431074; cv=none; b=QffHs00inSgZ7Pjgc3fzachszG4VxzWu7ixGGDhXa7KXRV2iGGsvWMiPCDA+zq+FAe5nnWjUXu5mx3B6HfyMJRkm4iZd74OU/ldx84anoNuJNu8YR2CPVU3VDyKB+4qoVOu5SZq7sPOURGvNst/fJM3W4HNxaTa4AWMzev2Pwkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789431074; c=relaxed/simple;
	bh=QhxTfHInFTqhrle7EOxmefobuQa/90yM/JMBf/bOcGw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bk/G/0KUVpswMFpnEzqzbn8IdbB7hpdXeoswXkJKa6sN7PSkV9c1nDiBd8Bgo0eoAEXQ8SKCqBOKDQrsYr1ZKxRTH9qC/bLLNwsqi+1Rqo9W0gt7oQanHUHOABqu0FAwWuHWhe8Q2OgNoT3BoObcpq1AjGoGgirvEysd8xA52Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hq1ruTaN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hq1ruTaN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFC71F000FF;
	Tue, 15 Sep 2026 00:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789431072;
	bh=nx387GJuNpI+jOOmeEBtSmLHiwQhPoS+YH09XpCtIKc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Hq1ruTaN3r9/v2K7xfPpqm8ZS/ec8or1lHUt/UGy4t2rgPjSzt7QnU/wEd8MGMKAG
	 gV126O2qQNGz98apeh2eqqkKxb3uZI42bd1hc529f/hFsEA1ruiahTkgzNq0PuQwOq
	 Ww7Tlet5oJQRaZeNedx2vAMLqDH0LKMf9xqQvrVml8HeUX5zekPHgp0myvW6ZGGkTi
	 QBVIlnM7AQyK5Qky5SNvB9oThn1b0lKePAcyTZa2RKogFB1opcMJ5We6wS0ERpl6S/
	 ObG1UjrxyXHu9U/qbIKnsJ9qI/RB67wFC0IksFDpMjEhxnWppniX4RP6zDKgVQgUJr
	 yvFQk79eTSd3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1972E3924FFC;
	Tue, 15 Sep 2026 00:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] selftests: net: add ruff linter exclusions
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178943100787.1280100.16064991062279702570.git-patchwork-notify@kernel.org>
Date: Tue, 15 Sep 2026 00:10:07 +0000
References: <20260912233926.304768-1-kuba@kernel.org>
In-Reply-To: <20260912233926.304768-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, nb@tipi-net.de,
 shuah@kernel.org, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 12 Sep 2026 16:39:26 -0700 you wrote:
> Fedora is now shipping ruff 0.16 which added a ton of more
> opinionated rules. Let's add some exclusions for checks
> which are both noisy and IMO of questionable value.
> We can still follow them for new code but it's a matter
> of preference.
> 
>  C401: set(x for x in Y) -> {x for x in Y}
> 
> [...]

Here is the summary with links:
  - [net-next,v2] selftests: net: add ruff linter exclusions
    https://git.kernel.org/netdev/net-next/c/7b37f1109039

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



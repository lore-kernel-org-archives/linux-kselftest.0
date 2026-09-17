Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88153876A4;
	Thu, 17 Sep 2026 02:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611685; cv=none; b=SoMnknThYQY3vUE7Vy/YFxfUyk4qBrWpjE6UzgfoP3gpBORGoNVuNMZNtW8OR5V5VC7IHLTxQ7GK7CcnKdaexuzvgmgLpPYJPAk3uSkSYZjGcIWBc3MZOXkNswyTbAjglUCOK6n0VNZsDe5+pEdCxJ7WcHFE2Ud2gJxV5J4cy48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611685; c=relaxed/simple;
	bh=TMTLMJgYpu75whksZYhSn9D284Ba43NK99sQDZEwjWo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eNPrjxxhSngdbKfatFIXLK4XXLBTXLP5LySJRN8WTWpCrWsdLFw5IdG1pDk8OFmGqVJ3O5LyFoZVn4DHBwHc7nPKuvNl5AqplLuuPtGu4yASLQKwDUyYsscLmefJt1k+sp41F/LANzTVXivBDJS9FDQbmj0njUf9lULwLXNfYE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qwh35LbE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qwh35LbE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08C51F000FF;
	Thu, 17 Sep 2026 02:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789611683;
	bh=oedx0g+V54T/knjUwd3YCijW3tao+D2pCgS2oci+/fg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Qwh35LbENrVmavqflH5zutH//M4ydm45QIijTYfgKBHnS5C+Qz+ojGREyQjGLrSB+
	 lKWyCScUE2JCI3fqiIdIesvbtp0hC0g+vM38eQT0rugY/p1pHgQKfuJt4ZnlZw1cMp
	 1wwqB9t1OgoXW3Fj0ateDogO5j8qOppPsl7yn7PDXfZtA8hiza2P0Ejqg5X8NFlnEf
	 1i//FiOFz3fzJTMPBKGWkjesnml8W58mAsSo8yY2Zhzpphifuc/qy4sQSWQQ3WFLXz
	 OyhXbtPI3RCy0qKSbwiFvZZis8cxD3NNXvmvrk1Q/ufOV3Nz1NIm//qAmG9zdGwQwt
	 Ud9qd7da9+3Nw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A3739E9609;
	Thu, 17 Sep 2026 02:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] selftests: net: gro: fix OOB access when
 under-coalescing
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178961161737.3379718.8594184186847332667.git-patchwork-notify@kernel.org>
Date: Thu, 17 Sep 2026 02:20:17 +0000
References: <20260916010029.50911-1-narcisav.kernel@gmail.com>
In-Reply-To: <20260916010029.50911-1-narcisav.kernel@gmail.com>
To: Narcisa Vasile <narcisav.kernel@gmail.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org, daniel.zahka@gmail.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, willemb@google.com, petrm@nvidia.com,
 anubhavsinggh@google.com, richardbgobert@gmail.com, lixiaoyan@google.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 15 Sep 2026 18:00:29 -0700 you wrote:
> When more packets than expected are received, num_pkt
> could index beyond the end of the array. Add a check to prevent
> OOB access.
> 
> Continue receiving until the FIN is received to obtain
> the total packet count. This helps diagnose issues by
> distinguishing the cases where no coalescing happened from
> the partial-coalescing cases that didn't meet the test check.
> 
> [...]

Here is the summary with links:
  - [net] selftests: net: gro: fix OOB access when under-coalescing
    https://git.kernel.org/netdev/net-next/c/7bc21b740291

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2713AFB0E;
	Tue,  9 Jun 2026 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001009; cv=none; b=SSauT5dOW/FzRljmYOjdPExz2WVeqISHPBFRQ1JW+k4Z831PbD4AC0Aqu66/DA7vy/PhGqoYvv2pQpJRUs0GhAE76vgnW7PvSJlDe2+W9z3aPsKpD7bDnoq8AD8n06MztmOkbi+bQNDhKrnZgGVNhlFWk3K9J/F/W12SI+dhicI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001009; c=relaxed/simple;
	bh=5X90vzjoFVx/DHR4QVYw693XU0Df6dN04GF/l0d9KDY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cTz2xkSPDNNackFg3QMwa119QzeZWeXqILpZed2gs3SwmR7SoUtxLawa8JD5cuMpD3e0JQQ5e8/OVa7km+7p3SjaUvu4FZdmhioZ/3zzpVdzOFhyhO/YAZKfmlt/8tSsvNFo9vq4yaGRtnBUCGKScj2bUhOLR2d86/irHcQDlss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJD15e/8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJD15e/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613871F00893;
	Tue,  9 Jun 2026 10:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781001008;
	bh=tlwk11Uh7KejjBX0N7t+TfseoQWN+UjBMZ2CUOeuEyg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cJD15e/864MgO94DHr/MY9qwtTitY4KDiUZoj99SrSwKykmorrIVIitM7f5TJtFnL
	 hQUuc+ijB1Dr5zwyVDeKn+FI34vR4YoIvtfxKflA6RrNJE03y2kGYnm3JS4P96ZjrD
	 sfuxkWfHqOlMegffKtpC3nWXOjSGO5lOhru97pqUVVtKG+brV9zbhyGHnT+ZI7QfI4
	 VyhU932Z4VVqJEYfGXO+osRFGgnRWD7daWqUIwuuUUujBgh4IfoZyFaow0kq29/9rz
	 xtP9KhMT+B+uUpeG5rH7bg5HDU1ie6JyQpcheWybjb/VOpT1rj24EUMT7p3Pd38SyC
	 SypigNT7mW0gA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 197CE39307B5;
	Tue,  9 Jun 2026 10:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: drv-net: gro: signal over-coalescing
 more
 reliably
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178100100665.1941629.1409035118702282770.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 10:30:06 +0000
References: <20260607002401.212976-1-kuba@kernel.org>
In-Reply-To: <20260607002401.212976-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 willemb@google.com, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sat,  6 Jun 2026 17:24:01 -0700 you wrote:
> GRO test is very timing-sensitive, packets may be delayed
> by the network or just sent slowly. Because of this we retry
> each test case up to 6 times.
> 
> This makes perfect sense for positive cases, in which we want
> to see coalescing. Negative test cases, which modify headers
> and expect no coalescing should have opposite treatment.
> We should really try 6 times and make sure that each time
> the test failed. This would, however, require that we annotate
> each test to indicate whether its positive or negative.
> Let's start with a simpler improvement. Do not allow
> retries if we detected over-coalescing. Previously the negative
> case would have to get lucky at least once in 6 tries to pass.
> Now the first failure breaks the retry loop.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: drv-net: gro: signal over-coalescing more reliably
    https://git.kernel.org/netdev/net-next/c/69a4e74e4cc4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



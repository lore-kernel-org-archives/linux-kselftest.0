Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A190C373BE8;
	Wed, 30 Sep 2026 07:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752808; cv=none; b=BZwhpNgyp1+oZ7jH/u1Ymw3bFyaISBjSbZTB/RPlgaaDO+/p5X1OYtzKOrNSq6OLFIOneXrvkaWjQOr3fzsVoQi4fZ013bUwF7mqFSAljaFVYKaRzixXPg2KBSLGKeEdx8hBwsNbYNa4wMWJry9N7OPAscnlX5fVTUW6AQ2dzQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752808; c=relaxed/simple;
	bh=sd6gkkeG8ZQWKcUfeNjAQn8Tdr2ocdh4K4IqKfSDGS4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fXa3BEykfyvO+qa+nkEq1W7jNICfka/QiUDvjBajQB5+SZFqeECjcHsI98L7zPx1duEaMcNb6z34c6kijTLZW81odTtleHFBGOOLMg0er4xP4v2yI2crOMDz2Q6e80HvhR85fa7O1ZlfwsBIx7Unxql90NlqCWD4pQmehk8nfDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1hsLw5T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1hsLw5T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8143F1F00893;
	Wed, 30 Sep 2026 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790752807;
	bh=u62Zgpb+i05Tt205oStPPNF9koBKiCrEtXPYzDKQ3Kc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=k1hsLw5TOoY/CLuJf77AQ1dO1bsIDTq/AhjYG6PGTIfv7ofgxXGGXA7h4JjAnHKzu
	 THZs5YV0vHzS3BU9v7Xw7DekkbMtHVfk5+z2FGuJ8ZbJ3lTwjF5zqWc6Et247sawWA
	 pB1wn8fmSjvno3o26CqBf6YgKeOlmG0oCEW8tYZ2OHckz1rkWMQbFCKiPH40LAvM1o
	 ZmmEuYkJV3K5c3cJHJqB4GAojmIZtjwTlXyFcORcQRdVIJP+aF+2A7Gso9Ig4vuOv4
	 t0nT23YTsRNp3echfI6ktcWF/LqjAgA1bQlbuH1FdFhZneW8JS+ryxTU6EMGJaRj/F
	 qkpxXLRZqPkDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7734939E37E8;
	Wed, 30 Sep 2026 07:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] tcp: correct timestamp echo for accepted old
 ACKs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179075280628.1300549.5509783868207806215.git-patchwork-notify@kernel.org>
Date: Wed, 30 Sep 2026 07:20:06 +0000
References: <20260924224456.55690-4-jeffjo@openai.com>
In-Reply-To: <20260924224456.55690-4-jeffjo@openai.com>
To: Jeff Jo <jeffjo@openai.com>
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 24 Sep 2026 15:44:57 -0700 you wrote:
> Linux can acknowledge newly received data while echoing an outdated
> TCP timestamp. This happens when a reordered packet fills a receive gap
> but carries an older acknowledgment for traffic in the other direction.
> If the sender uses this echo to measure round-trip time after a long idle
> period, the stale timestamp can inflate its estimate and slow its sending.
> 
> Changes in v2, following Eric Dumazet's review:
> - Remove the redundant SYN_RECV condition and unused flag accumulation.
> - Replace the log-parsing wrapper with a plain packetdrill test that checks
>   the timestamp echo directly, using the existing selftest runner.
> - Rebase on net fc6d80eb5044.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] tcp: refresh TS.Recent for accepted old ACKs
    https://git.kernel.org/netdev/net/c/1b92780ae4fc
  - [net,v2,2/2] selftests: net: check timestamp echo after an old ACK
    https://git.kernel.org/netdev/net/c/81fe707ae58e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



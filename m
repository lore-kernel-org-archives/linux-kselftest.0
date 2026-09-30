Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA69233926;
	Wed, 30 Sep 2026 00:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727609; cv=none; b=ewkX97izhyEzs7du+aZT954mVaheJpCBgh2RN5MKt+NRHQRmYLmMv9mspA1MwES6QVIMt1x2UWRD+qOPqOZYUZ7SBBL7OfdesttH1KYGjsRMgZQO4YP2NNBAKdhkOVN9l2mPAUHGl0crBGR2JPmcp6UtP+jWLIv97T0ZwdG+gV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727609; c=relaxed/simple;
	bh=gdqff96V0Lqq0noPS8J3tfhaL+MaB4HNGkP61vpubVA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=EzAw+pCDDBO598s+3PpOAujLadySaT4dUVYxhTvEywgslEEbVhrBjIzVWfeykvOSPo9alefRGyYHRD/K4oEO8bdrnzXcJHxuKkpHgnPy2QE7/tt4ZEsaQxp/EL1oN2yR1UtE7j2XNLHxlD/MJD6MYKQ+sRI4AN74Y1d/7s8wzV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyODSXN/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oyODSXN/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064F51F000FF;
	Wed, 30 Sep 2026 00:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790727608;
	bh=Rtqmxon+F4y0asMCls4t+EYEy0M7dWEr4lyi913pz/w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=oyODSXN/hTOO0ekAQfwW15BmSeN2GQ0T0kUjn6x35M0FU1in9rWlgXKrWePEXv9Qt
	 CLMGRd6D8+Jvm2XB+jc+KsijOu2l2ktdwxyojrKuNxOqMUAIKHUB1w2v3DC6I30hww
	 RqqwjB3qnUchNvfufS2Nrjxd4vMAwaE2/pD8hi5/vpWOIYv9tcAWGgZIrJj/if+iMP
	 XDoL5e9HFVDnnuAjTTKTFYapcsdWjqvOTtubaF7geUwizri58L1ZF0vnkPiLB0UleA
	 /8Ol5LsJLAkM7LYcswrweNNB0vnQ1wTEx9RSeUm1PcXQVYac+zBgM6lxBD8dDiST2f
	 WDdzAvIzTNMgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14F43808209;
	Wed, 30 Sep 2026 00:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/2] Fix UDP splice checksum alignment across
 fragments
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179072760680.1177515.1580969654477785710.git-patchwork-notify@kernel.org>
Date: Wed, 30 Sep 2026 00:20:06 +0000
References: <20260924-fix-udp-splice-checksum-v1-0-fe61d65447a8@asgari.net>
In-Reply-To: <20260924-fix-udp-splice-checksum-v1-0-fe61d65447a8@asgari.net>
To: Alireza Asgari <alireza@asgari.net>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, dhowells@redhat.com, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 24 Sep 2026 13:00:23 +0000 you wrote:
> When skb_splice_from_iter() appends several pipe fragments, it updates
> skb->len only after the loop. The software-checksum helper nevertheless
> uses that unchanged length as the checksum position for each fragment.
> An odd number of bytes already appended during the call therefore gives
> later fragments the wrong checksum alignment.
> 
> A standalone reproducer primes a UDP socket with sendto(MSG_MORE), splices
> distinct pipe buffers, then uncorks the datagram. The send succeeds, but
> the receiver drops the packet and increments its checksum-error counter.
> 
> [...]

Here is the summary with links:
  - [net,1/2] net: fix checksum offsets in skb_splice_from_iter()
    https://git.kernel.org/netdev/net/c/febec6a70764
  - [net,2/2] selftests: net: cover UDP splice checksum fragment alignment
    https://git.kernel.org/netdev/net/c/1221246d3bd0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



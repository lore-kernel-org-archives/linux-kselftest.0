Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC3745D1B2;
	Thu, 23 Jul 2026 15:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821246; cv=none; b=pw3itcM0nGNUFizV79tU/PMauTorZrdpcxYQRsO2w7EEiVsGtV0lpWeg/2//NS5DFIj9yDsUw0z7bs3LsHPCH/SSykst+ftuacC5TnWOSta4J3Au2tSFRrkvKjg3Q+eLsCp6yQ9oNZRYIbVmy8ATmiLQoSk306NBKLvILZABkYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821246; c=relaxed/simple;
	bh=gtToRZ7LCPow9Kyhulf+xB8no4IFdDA5XDCKAffU5dQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Q35fMPN0pwWugNyECJK6vWnL/LKbfjJjirGWgcf2u2KaaQD5xUwfT5OiH4/JHfuU1dKcfQW2eQIbrPsymcc8zaLoFUxH5zQukRKw4sYs3TajhbE5DqMYbzd44IVCjVYBug1HBaFAzKZLXNwA80Mm84gjL7NRUuYsrSqeTrEPPV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16FC1F000E9;
	Thu, 23 Jul 2026 15:40:45 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9396B3924454;
	Thu, 23 Jul 2026 15:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/2] tcp: validate RST sequence in SYN-RECEIVED
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178482121114.2324960.1921837977854405537.git-patchwork-notify@kernel.org>
Date: Thu, 23 Jul 2026 15:40:11 +0000
References: <20260717081443.809393-1-yangyx22@mails.tsinghua.edu.cn>
In-Reply-To: <20260717081443.809393-1-yangyx22@mails.tsinghua.edu.cn>
To: Yuxiang Yang <yangyx22@mails.tsinghua.edu.cn>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, edumazet@google.com, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, zhaoyz24@mails.tsinghua.edu.cn,
 wangao@seu.edu.cn, fengxw06@126.com, qli01@tsinghua.edu.cn,
 xuke@tsinghua.edu.cn, yyxroy22@gmail.com

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 17 Jul 2026 08:14:41 +0000 you wrote:
> The SYN-RECEIVED request-socket path accepts any in-window RST and
> removes the request, even when SEG.SEQ does not exactly match RCV.NXT.
> RFC 9293 requires a challenge ACK for a non-exact in-window RST.
> 
> Patch 1 applies the RFC 5961 sequence check to request sockets and shares
> the per-netns challenge ACK quota with the established-socket path.
> Patch 2 adds a compact packetdrill regression test for exact, non-exact,
> RST|ACK, and out-of-window cases.
> 
> [...]

Here is the summary with links:
  - [net,1/2] tcp: challenge ACK for non-exact RST in SYN-RECEIVED
    https://git.kernel.org/netdev/net/c/a28c4fcbf774
  - [net,2/2] selftests/net: packetdrill: cover RST validation in SYN-RECEIVED
    https://git.kernel.org/netdev/net/c/7bb18355e599

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795300807;
	b=E4eRNwAZGA42HprgileXGxqDBzOb9q9WFuEArs5T2ZkSzcX3Dbp1zqCbHMBWnyF6lYdU
	 q8o9b03vRpEyDW8m25/uwmzQ0ttLRnYC06Iw347gh02mFVc2ThlpdzoXovBRQWWikqOLR
	 oRTEbUhDm45pYr7MynehmlRtdDRAvUKoVMRgewrA77qmrRhSMmtdDCwhpMCVnLPWN6M6q
	 fxAI97xWbNJU+cuexz9zahh3EvxYxUAlJO+GELZnu8HysZxqqMSLK6mai1megzl/MILXt
	 2Y54qBkEm4WOXa2vgzhen+iulHFTPW4UeSR8sVQvuUhgKqTAvbBfhowf0+lz1m84XWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795300807;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Xq5ZcbWIWjDg1j0CmNwrLuvPn+5eF0DkjzdXnsFK9j4=;
	b=MPPEdWXEk86xw993L86AlYznLEu7eQnFDixTlAglZdzHjzDg5uGWXnmJt2e8dSAxdFXQ
	 2o295t78lE7hAl4vfWBt8LYf4b3gCsKnXWlxUzK5fOxGajTiWYOZMkT1YbhmUGMAoTh4O
	 po4STLDtwDB43YSULUqGRfDI2vfu2S7x8ZtNDb1EL/U86x6POLznGp7juEvRUM6MvBim3
	 LfyW1AWRlmph8he481/t5n7VH1zZKqPwnO2znrP3HrvQFvqMISxR2E08FStbigaCgSVr4
	 XybnUm5ezX1+Pe3A/ICJyhS9YZ/52JgfcWoAxFaF1VLYF7eTx1HFCo7d1gR1jwkO9mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mMsanc0Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4748B606A320;
	Sat, 21 Nov 2026 22:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mMsanc0Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB681F000C0;
	Sat, 21 Nov 2026 22:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795300806;
	bh=Xq5ZcbWIWjDg1j0CmNwrLuvPn+5eF0DkjzdXnsFK9j4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mMsanc0YX42c3ftIkfChoUgWGfia/X1RfPI3dZtH+kk/iwxZ7r2MpXZmMPr3Q1AsU
	 AHb5mWK+8Dxn8BPM3kGfJEeT+TF12gYyoeklyuC5saH+mC59MFOZKmQA/Or3jOeBE0
	 /+VxWpL8UOHZryqSpVnwa9SHIOOlzPgDyOfEvnUMYzm+CLb1f2LCg4aOfV2+VMIhi1
	 fI+s7tFsqrpjwrattDNWNwpISCVyg1NhF7D2itI8O10ScacYUTpd5bp2OO8xpxD0E2
	 Wi7y+SsNUQ9qpMo3Yfc16c3XvNLnXAZRw9FxPsNmHwKU2Xe6gS3bLVNGPiYYGF0r8C
	 GhQpKnypD6giA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43FF391B081;
	Sat, 21 Nov 2026 22:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] tcp: roccet: fix idle restart on RTO
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179530080553.1194596.9415728615841719024.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 22:40:05 +0000
References: <20261118022813.9778-1-zhiqizhangg@gmail.com>
In-Reply-To: <20261118022813.9778-1-zhiqizhangg@gmail.com>
To: Zhiqi Zhang <zhiqizhangg@gmail.com>
Cc: edumazet@kernel.org, ncardwell@google.com, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, kuniyu@google.com, horms@kernel.org,
 shuah@kernel.org, t.fuechsel@gmx.de, lukas.prause@ikt.uni-hannover.de,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Nov 2026 10:28:11 +0800 you wrote:
> Patch 1/2 skips the idle restart when packets are outstanding, so an
> RTO retransmission no longer overwrites the snd_ssthresh preserved by
> roccet_state(TCP_CA_Loss).  Patch 2/2 adds a packetdrill test.
> 
> v1:
> https://lore.kernel.org/all/20261114141315.19007-1-zhiqizhangg@gmail.com/
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] tcp: roccet: do not restart from idle on RTO retransmission
    https://git.kernel.org/netdev/net-next/c/19764eae5794
  - [net,v2,2/2] selftests: net: packetdrill: add ROCCET RTO test
    https://git.kernel.org/netdev/net-next/c/295aaa8398ce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



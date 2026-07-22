Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E52D427A1F;
	Wed, 22 Jul 2026 20:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784751081; cv=none; b=OmSOrHAqWY/KLzaRPf1rbtrBl6h82/cH0Hi+LJ+ZYakyKqLYcFBOFcfbMxIiW9YcoOV8EBQ1ksESdPijWV3JvIFLkUB0VdLCB0cNi5jOcLiLhyNFd1UR96dYVDZJzjG2Iq4LQrDdWvpf8FTP+YgUhG2zYAOnbqsa7qdBg1bg484=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784751081; c=relaxed/simple;
	bh=igHTnZ0X47tsQVg5YT0D4+yw0q+wLmdWERn/yaxvcuE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=J/fKa9I7yR1F4a//DQuLKL7Px7XToOToMyn/MWOgbIoItm3LqhwQ+bHqQfm1SZtbF7z4irSszIhq0Gx5TxxLz0ghHdCn6q/1M/EUeRWclFKw8GwxQLCnNEVmBuLwGblIQpbez946a7OJwgztXo0WrwGqfX53Sap6Go7dsbAV6P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFRrB7Sm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFRrB7Sm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A601F000E9;
	Wed, 22 Jul 2026 20:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784751079;
	bh=uG8B/sO9RISppE7Q6ehHHlhwBn/Q+YrhymoxgV/Rvcs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LFRrB7SmZww54+iS0u04z6Ki5YUVW9pF78QrE0fOr1mxYZ14ZUzVFbTssSzqBd5WK
	 frjFuZDe6nVAI9qS93t66StFP1sPqw7qNFhvFiQD2v0yg4Kgn/lFvbaAe8OAn7oqpH
	 ciu+SFxdkFrV7OI8H/mpi34+IJqIZHIXUO6Ve3yYRvcWRUXtakYhTm0CdaIYLM7Zva
	 YL0nLBJWe5wy7jTOeKIM7LpDdrnP5fgcwGXpz/5XyIJvGeWgDgZCniW4kkS/eEIwxm
	 e5//DuCj36pfFF0cw8OkJpUhTGIYj91EtCr384y449lkBPL/7tR/zhUIsvCteHJbzi
	 baW3eBPhn2NDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 97918380CECF;
	Wed, 22 Jul 2026 20:10:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/3] Extend packet socket selftests
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178475104838.2005094.9584058651934921504.git-patchwork-notify@kernel.org>
Date: Wed, 22 Jul 2026 20:10:48 +0000
References: <20260720122714.759175-1-joe@dama.to>
In-Reply-To: <20260720122714.759175-1-joe@dama.to>
To: Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, linux-kselftest@vger.kernel.org, shuah@kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 20 Jul 2026 05:27:09 -0700 you wrote:
> Greetings:
> 
> I was looking around the packet socket code and noticed there were a few
> features that could be tested by extending the existing packet socket
> tests.
> 
> I extended the test to test stats, drops, and auxdata and re-ran the tests.
> The existing and new tests passed.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/3] selftests/net: Test PACKET_STATISTICS
    https://git.kernel.org/netdev/net-next/c/d6587d0c0f3d
  - [net-next,v3,2/3] selftests/net: Test PACKET_STATISTICS drops
    https://git.kernel.org/netdev/net-next/c/1451e5302941
  - [net-next,v3,3/3] selftests/net: Test PACKET_AUXDATA
    https://git.kernel.org/netdev/net-next/c/707f5c2de046

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



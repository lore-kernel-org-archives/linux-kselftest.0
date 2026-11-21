Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795225809;
	b=Mpa5Ei0mvwM3BY/9rXeADnyPjCHWFjx0d1ySNgiqnBL5pQapJU1uB0lTWesxZTuxiL/2
	 XDuI6L0ri3EoW7F19UU5a3EXXcJ/YKfHmzsF4gvbWw2zEduASwEgYI31aR4/63ZGhYrLv
	 XE96u69VwTSuU6Dm2ZH2cT5tLzM2SDOWcuelV4kwp/Cio+WzNtmq38EtsGGe0RASASham
	 SKmx2UmiyEP7e1i8QG3dPgAP0jli8YvRdyExmTzs2GjLN+r701leveYaHpIiG15TJX6ef
	 bkpAKv4r3Elw6LxvS64ccUb/biLFd/2SgkNtdALFGhCCAWGyyLAzeKw1y9vGgEl+ETg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795225809;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=5y4IxJrjcm1T5YL+nxKNgdDItK+BLU1zQYGnvu1AgNg=;
	b=FvKxr52L6DIukSNNjOz1uFNnWPySTs6J2BdiFqsNjvovQDD3+j9RCNJ3CCBjBKo87uD/
	 BWRkZZiIVz5wjhobJqPfecw04FWDi8ZH3qJIFEGnZ/UpBMSZZKHQ4sKFZ4Av0dsWeuwcm
	 4kDSChrL7edIUnW914HFPE2+vC5iCJU2KOllOr0AM7jT2yzdNHklnOpxjhc1sxNPRQcDE
	 TZog7GkOw2tVkH6dJp+bN6rdJJBjGhIOLTJ7lmDqhhOX8tG1TgcBenxqIlKlScGM/CXIX
	 ZDCe2gxV4n7/xDq4HwMAi9/IqPrAw2ZdFR8HHQk69gDF6gSLs7kleNAWjFH54/3OOvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JsZyyIwB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD97606A699;
	Sat, 21 Nov 2026 01:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JsZyyIwB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D081F000C0;
	Sat, 21 Nov 2026 01:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795225808;
	bh=5y4IxJrjcm1T5YL+nxKNgdDItK+BLU1zQYGnvu1AgNg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JsZyyIwBCuipX9H34Gb8a/l8rBLIj5By/02vUSZZQybX0UPwtc20BjGAKK8pl8wPn
	 DIqcXuuoaep9F4mRlLDZWmDu46VcOElr6zsmo5a/G/BpGlGxq5LAEAXumU6doM21Y6
	 gKBSWIyfEevM+kvwxsGBQ4QQ+Jl2TO3K5q5xFXVFHNVmxZmWa/he133F4VSCUAmp1/
	 FcaasQi84RfUEltYeejhuCMrUTZk9ae671nW+FgAx7TO+dKBYxE0DajGT7kOWajAOj
	 bB/RhiuqsIi+RXTCF3LInnHHCypkQ2bAVeR1ltafkpeu/GicicotXx5rI7dNDGOxxZ
	 AAVKyCJrjDPKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3A2380AA5E;
	Sat, 21 Nov 2026 01:50:08 +0000 (UTC)
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
Subject: Re: [PATCH net v2 0/5] eth: fbnic: miscellaneous driver fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179522580703.882976.11494412446601207725.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 01:50:07 +0000
References: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
In-Reply-To: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
To: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Cc: davem@davemloft.net, alexanderduyck@fb.com, kuba@kernel.org,
 kernel-team@meta.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, hmohsin@meta.com,
 mike.marciniszyn@gmail.com, sdf@fomichev.me, bobbyeshleman@meta.com,
 bjorn@kernel.org, leitao@debian.org, horms@kernel.org,
 almasrymina@google.com, vadim.fedorenko@linux.dev, daskald@meta.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 17 Nov 2026 13:54:11 -0800 you wrote:
> From: Dimitri Daskalakis <daskald@meta.com>
> 
> AI identified several bugs while I was working on unrelated parts of the
> driver. fbnic_queue_stop() always waits on queue 0 to idle for rx queues.
> fbnic_get_ts_stats() dereferences a NULL pointer when the interface is down.
> And fbnic_{set|reset}_netif_napi does not account for disabled rings.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/5] eth: fbnic: wait on the correct queues in fbnic_queue_stop()
    https://git.kernel.org/netdev/net/c/7bc16d84facd
  - [net,v2,2/5] eth: fbnic: skip disabled Tx rings when setting the queue NAPI
    https://git.kernel.org/netdev/net/c/561175f45a23
  - [net,v2,3/5] eth: fbnic: skip freed Tx rings in fbnic_get_ts_stats()
    https://git.kernel.org/netdev/net/c/729f807b58f6
  - [net,v2,4/5] netdevsim: report fake timestamping stats
    https://git.kernel.org/netdev/net/c/a6c99fc2d6dc
  - [net,v2,5/5] selftests: drv-net: stats: query timestamping stats while down
    https://git.kernel.org/netdev/net/c/43cb59e7a47b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



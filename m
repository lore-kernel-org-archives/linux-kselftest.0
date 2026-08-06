Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A73377ECC;
	Thu,  6 Aug 2026 00:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785976866; cv=none; b=jLGqWv9eZGslnWf8/GzHxDYc4b8sJSP5ib9zvH1DgKOPJDq/8TwOEozJR2DmVX5ONWhCj6vlTSTEx+8zymRllgf/nOiZBTgGPtGJXGBj6k6b1a2weeXpd7XrMTsaMRb7XLQgWN70Ki0Uaz6zAMUt7TuzP2faNaRQRNSaoq9SSIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785976866; c=relaxed/simple;
	bh=JG5MyUfvcmXKg8DJPPtwz7p0vUpiitBUz0Qukdh8ORY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=aWKvZM6EzLxpdUi5a7zLow7YH+ieEEnQRnCEgzGmn4zEhwhubGhPUmH5tZRzQEV/f+HnzuIeWWlAZZNtOltpu6n8YKXOYANIDNefVAUvj8u3mp5Hjf1KE1/Sx7QAMhisWktmu9DLLYpb15JGyFFFD49lS6+qvICVWFemD6JvxoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2Hqha1R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2Hqha1R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2671F000E9;
	Thu,  6 Aug 2026 00:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785976865;
	bh=WuJdE7UjthuLNffdO/0dWGbx7mdzN5TPbCmSV5F8Mjo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=T2Hqha1RloCDd2sY4CIGKbiH2KHrg8AKwt8QjXOmCxXY2YXDORcbjMSppc/lY2mYn
	 CIEM2lBsKKqfD5pUkvwZZyS+MRbShtKFtJ3kp/LgpNWmXrg7/BbM//ymFpvn/RKkII
	 qTiD1Z0CHzJny77uMvkLH9MVPjDhWPGGRRgyYtX/R3YMBlCdple/4JGCns0gsxG2kB
	 +ICCYv01zs5q8xcP0KLrbVEjBttBYWHW/bVWb4NsqCI0wPXdaanajqvvML8K5y3KbL
	 JLwFKNct0/lnDmkL3kt09Y2xElFrpZIkQivYcVqVmJOqoBMreJP+Ub+gRL7PFpa/VS
	 8faUhe0BCw7GA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1979D392FFD8;
	Thu,  6 Aug 2026 00:40:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: drv-net: hw: reset HDS mode after
 netkit
 devmem tests
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178597682463.580024.5788453293825407757.git-patchwork-notify@kernel.org>
Date: Thu, 06 Aug 2026 00:40:24 +0000
References: <20260804151040.2755153-1-kuba@kernel.org>
In-Reply-To: <20260804151040.2755153-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me,
 bobbyeshleman@meta.com, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  4 Aug 2026 08:10:40 -0700 you wrote:
> HDS mode has confusing semantics. On GET kernel reports
> effective mode. On SET kernel expects explicit config.
> Effective mode on GET means that we know the current
> state, but we don't know if it's a driver default
> or user setting. This matter because driver default
> can change automatically when e.g. XDP is attached.
> Explicit user setting must not be lost.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: drv-net: hw: reset HDS mode after netkit devmem tests
    https://git.kernel.org/netdev/net-next/c/481e86a82219

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



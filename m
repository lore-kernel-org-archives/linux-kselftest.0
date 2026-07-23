Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D040486B8E;
	Thu, 23 Jul 2026 17:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827263; cv=none; b=Kgba+mq4NrNk8v6+OAY+bMJvirnCiM1VYT/Ib3ChxhcvMzWRLSNmzmCQABmu/El249VDrNWKziTfq8zpBP66zYzsPZJEvM4pCSb8lHsH3rQGr4Qu82BEgy2KrAYmG0VkttoxgB3qp3uJF7EWAP4+RlYNYPuG/nxFRrpIYHW9fqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827263; c=relaxed/simple;
	bh=maGQiTY0P3+G+1Zy0E5LoBNYZFTdKxsBWG7AcLwKJlg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=trS9RXZP4rrydK7L8K3H3PeYg9wMSE6hW3JnRz+ajiEja82/NetiPpyR0r5Q9tt62hYXRDSO4Ak9LpU3f5+c1UQNmfIbcWuyUf2X8y3cTss+gxh8xQRQr0lEAxSjiZeQmMhqUXXOj2ub9QXcsIQT35yaCcNNmzQriWRL+jdspxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6NLIMaB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6NLIMaB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA6B1F000E9;
	Thu, 23 Jul 2026 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784827262;
	bh=TIQMHlITzA0Yu7GLmS5fobF1wkaSvyrgDkoieNIm8fw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=d6NLIMaB+qrLXyKcoLzJgQuqqECzjDXP4K3Hz+yA5szviYytEfJbiEy2n8K+ZwJ9e
	 nBxS70j2Goxu4+Qq32o32n14NKqpACmbsMsYqUW8P6i70cBY3Z/3+FavlFphz+8nIB
	 NTFV1tqvDNhQj88nYkKRNHZOpFFAcxu3OpYlcGITiYKRk3ATi0e1nopYhHEM2COTfb
	 30snyPpHaUSWKp8edogFierDkeN3EAmY/ZUZCV4ijNhKoRSqm01DuzinaioNsQ264x
	 zw+ibPeAYUJusv2GuHarqVueDbq+BiWeSHdIiaBMI7vuEmjN/47EjgW18JG1M6kODp
	 zT5Z7T92Gy9bg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0BD339244CC;
	Thu, 23 Jul 2026 17:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] selftests/net: use MAP_FAILED instead of (void *)-1 in
  tcp_mmap
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178482721438.2793774.4437488998213169704.git-patchwork-notify@kernel.org>
Date: Thu, 23 Jul 2026 17:20:14 +0000
References: <20260722015129.916-1-yanlonglong@kylinos.cn>
In-Reply-To: <20260722015129.916-1-yanlonglong@kylinos.cn>
To: longlong yan <yanlonglong@kylinos.cn>
Cc: pabeni@redhat.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org, horms@kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 22 Jul 2026 09:51:29 +0800 you wrote:
> mmap() is documented to return MAP_FAILED on error, but tcp_mmap.c
> compares the return value against (void *)-1 and (unsigned char *)-1.
> 
> Replace these with the standard MAP_FAILED macro for better readability
> and type safety.
> 
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> 
> [...]

Here is the summary with links:
  - selftests/net: use MAP_FAILED instead of (void *)-1 in tcp_mmap
    https://git.kernel.org/netdev/net-next/c/94cdc6a2c837

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



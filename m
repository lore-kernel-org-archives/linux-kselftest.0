Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA553B5841;
	Mon, 15 Jun 2026 20:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781555414; cv=none; b=Uuc1j4Oz3FvY8w0DaRpphX6OUsLPwm9MeKHPsWUkwEtigYjv9MLCiOLCSr+2K//6IKbQK+l8eKC2I0SBzBT8U3InCLUy147/y5v8xjkcDZmmSx4+dSrRscH79iNDSL/KnkUnf12DiiNc5tli0kQlTz8zH6LRf6TEe33mP70HgD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781555414; c=relaxed/simple;
	bh=bRQr9t8wtT837TG2tr0GdAxazaLA4sfobrPIOzlVmIY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QMVaYgl/COGczKPUqGmAKOjvYLfBo4vbG1ihTKmLp4VKxzNYHaGZ7lieGz8g6AjuG59fkVHjf05Chv9UsmpdzKwwryZAYvQYmNtFoNZ4jV/FPNOt11mWf5KlASRvyVtXHE6QlnOpFc1kwiZyeCx56Me6HEbfnkEoFodL6a8ltzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+1QuY9d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+1QuY9d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86AFC1F000E9;
	Mon, 15 Jun 2026 20:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781555413;
	bh=5aMDLIE5PrNUelkHErz/IH1DPJ9zEL4jKjoADG/7r1c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=O+1QuY9dSV6txVh9SRYv2Trkgbf5SsM9wyjpKZOGTIzfUNa7EMlwhPY0zf1fYFkGZ
	 H5QhLiO25gmCrNaa+MQT7fiMlMszGd8OAcox0m5hYv9cDiFdw1/QBnIbpcykKPCNpG
	 nLjuemRS0BC1X9DLo2b2AcBftZBha5x2QM8aI9fi/TVfB2O1VmDk4HqDpWTQB3iNbA
	 lZd59XyM7UBk+CYmO8Pxb2Vs3pedcO2xEV0D4TbReqwKyrpN/8FpWai+I+weRj8r/h
	 mDxhF+xfTW6NAxIsxg5XV/c2wm8/k13OieJFxt76KtdQO5c8+9a2kvdZXrsqxLmc0q
	 SIS9sg5SaQO4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0D0E3839A06;
	Mon, 15 Jun 2026 20:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/2] netdev: expose page pool order via
 netlink
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178155540839.284807.2185512260142204749.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jun 2026 20:30:08 +0000
References: <20260612211709.1456966-2-dtatulea@nvidia.com>
In-Reply-To: <20260612211709.1456966-2-dtatulea@nvidia.com>
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, asml.silence@gmail.com, axboe@kernel.dk,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 13 Jun 2026 00:17:02 +0300 you wrote:
> This small series exposes io_uring's high order page configuration
> via the page_pool netlink interface and updates the appropriate
> selftest to check this value.
> 
> ---
> v2:
> - Switched from exposing page_pool order to rx_buf_len via nl_fill of
>   the io_uring memory provider.
> - Updated selftest to check rx_buf_len.
> - v1: https://lore.kernel.org/all/20260611161235.3807332-1-dtatulea@nvidia.com/
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] netdev: expose io_uring rx_page_order order via netlink
    https://git.kernel.org/netdev/net-next/c/5c4adb7fb46f
  - [net-next,v2,2/2] io_uring/zcrx: selftests: verify rx_buf_len for large chunks
    https://git.kernel.org/netdev/net-next/c/18f65355e112

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



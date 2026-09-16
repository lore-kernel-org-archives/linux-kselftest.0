Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EB13932F7;
	Wed, 16 Sep 2026 01:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789521673; cv=none; b=Td9DBRgaBg5HcQ/SlgvCAFThE8hYvnkDxNjVfqBWDp4ZsBkGbEFZFofslGZgOorUj2DA7rly9yqPNRCN2EmYlQqDGVEYKWcpt0/CLc6aLsaeGYnYc+fNE3qtoAubCmNpdop1xWoKVFy6XIiRnB9x0FDMBVvup3U3/azwDXQ7iKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789521673; c=relaxed/simple;
	bh=oI92Wam/lQoBwstvPVwR3/HPyFDsnVIDEeKqVR6QMWI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UCdfnJeBs/e6Nuh8sa2sBfMytM2+CXTmKVZz1n4tZvio4YIvrVaEiDDdCAFZe8GR1GOeO6QDUvlbpB62ebZuFR/uq+8dl7YSdrAj6uOaTjYaKU5DqcIZ0YfCH8LyaM3x+oRSiCk5u3JWGNdeqDKDuq4+sgH4EQJi60NXXaMEzK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnKvLkdP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnKvLkdP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DA11F000FF;
	Wed, 16 Sep 2026 01:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789521671;
	bh=tJGnSDJBD7jFz/PgAAhvgU1uY3opvratXJ9XZoONXLQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cnKvLkdPQ+qH5MXhJFJg6u1qg+pkQrrW7kSb/Inysck7+EwYg2ldYToH5YHJvgoWU
	 jxGhByhkgZVc06+8Idzy8KDT6fl6dfbZGoWreuETbezhccl84wCReRJpGBIunL7i6n
	 4vx2wi8GX9UjX2YigAEKryY1L081RQngAox004gWMGrhbyN24U1x5eVGHFx8SdxQWs
	 mZCg5xFFpTXIYzZzmo/8uW3bgXaGqvQzdTz0tZNX6Wtg7WUzazwgk+C8zntac3nYKL
	 HPoCE+55plErNnwx4Bbp5haH40rH91wLcnQfUG1b9HB+A6uNZqQgrDtLOiYQOWQ5hA
	 9NytsZcXZOvTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569E93927075;
	Wed, 16 Sep 2026 01:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/6] psp: correct notifications and device info
 around device assoc
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178952160613.2349576.14604204352404694369.git-patchwork-notify@kernel.org>
Date: Wed, 16 Sep 2026 01:20:06 +0000
References: <20260912200426.121025-1-kuba@kernel.org>
In-Reply-To: <20260912200426.121025-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 daniel.zahka@gmail.com, willemdebruijn.kernel@gmail.com,
 donald.hunter@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 12 Sep 2026 13:04:20 -0700 you wrote:
> We recently added the ability to associate a HW PSP device with
> a software device like netkit or veth to be able to make PSP
> usable from containers. This stretches the visibility of a PSP
> device to multiple netns's.
> 
> Correct two minor issues:
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] selftests: drv-net: psp: fix linter issues
    https://git.kernel.org/netdev/net-next/c/fbcd35eb1871
  - [net-next,2/6] psp: don't report the main netdevice's ifindex to associated namespaces
    https://git.kernel.org/netdev/net-next/c/cf3302111b1a
  - [net-next,3/6] selftests: drv-net: psp: check the ifindex an associated netns sees
    https://git.kernel.org/netdev/net-next/c/4d5d9f3a1968
  - [net-next,4/6] psp: notify about a disassociation once it has happened
    https://git.kernel.org/netdev/net-next/c/fb3ddbe2b577
  - [net-next,5/6] selftests: drv-net: psp: factor out creating a netkit in the test netns
    https://git.kernel.org/netdev/net-next/c/b711865f68ce
  - [net-next,6/6] selftests: drv-net: psp: check the PSP disassociation notifications
    https://git.kernel.org/netdev/net-next/c/4d3c1d963c6f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



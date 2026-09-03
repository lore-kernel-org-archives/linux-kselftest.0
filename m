Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2E732E692;
	Thu,  3 Sep 2026 01:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788399712; cv=none; b=SNlPijTQUjyU9NMMSD1OFIX9XBXPwfQEsTMGEEdeh/Fkt9XplWkF+NdJ3ouDfa5JQ/AbT3AyGEhOLf1Ags3hGGbo0y9GpgdO21sdb7FOBrcBOd28+BFo2eOuGucjssanbYa7hr+6roRURoW7J7Dwa1cPcP3X3HElhzWyM2cssPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788399712; c=relaxed/simple;
	bh=xGLz8tBnseeaMErzReOVoGIPPWG3EzSSjPKUe4xCccA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GWIZwQhLPzJhrhpn4mnkiqBiHQSKG5a73IHzdWiPYTBY0sR8Iu+aObnGaLyDxFaJcu477qOi+WR3Iw5bF8MaPJ0lNYsqJ9/PAIVYDyAMvZcXRtorOom89rxC9HuUGDwa3CJGOwcpJwsOVuwPlkPq66uh5c9LHZtUUn3bcvW4JS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dD+U/y0h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dD+U/y0h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3151F000E9;
	Thu,  3 Sep 2026 01:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788399711;
	bh=bm12L47tDqFfoCdbxcdfRNX6AEUXyzZ8Xy18pTWXtLw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dD+U/y0hEwu7l5urE+c5RcxXP+c83qBMx6SWBLBPvuXnQS7ObjiQDjyST2iXNwarU
	 8MrWuZ24MTOktXGdMBLwa6pQ4+2CQKosD43VEr4/lkNVbFS3k4W1AmOwMZjZAAnYSy
	 PXp6yiO7VSS0lxWutlJsijgri4RHumUIYby1bWNgc2I9fqPw0lDj37t7Rslz/MnMEg
	 Qz+7GtUrkmxkvIlOqgsDw0j3gPlg0f6W/ZYdnS9lIntsWlAgJ8HCUvc28eO0ADTBrE
	 zod4J9RXfW6FpZnbmU+ONiiyIFcl1T3pnHFEF3cg1C0ZrA+GPuAeNdY6w2pwBgtmEP
	 DWv6Hs8ae/ExA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AA73927054;
	Thu,  3 Sep 2026 01:40:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/3] selftests: drv-net: split up gro.py
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178839965238.3035212.7952345035477663016.git-patchwork-notify@kernel.org>
Date: Thu, 03 Sep 2026 01:40:52 +0000
References: <20260901200728.2063720-1-kuba@kernel.org>
In-Reply-To: <20260901200728.2063720-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 willemb@google.com, petrm@nvidia.com, linux-kselftest@vger.kernel.org,
 noren@nvidia.com, joe@dama.to

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  1 Sep 2026 13:07:25 -0700 you wrote:
> gro.py runs its full set of cases three times over - against SW GRO,
> HW GRO and LRO. It's our test with the longest runtime. The 318 cases
> take 12m30s on mlx5 with a debug kernel.
> 
> We will likely add more subcases here as the time goes on, so it's
> time to start splitting it up. Long runtime wastes time on retries
> (if any of the 300+ cases fails we try to check if it's a real failure
> or flake an re-run the whole thing). It also forces us to increase
> timeout for the whole test suite.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] selftests: drv-net: hw: rename gro_hw.py to gro_stats.py
    https://git.kernel.org/netdev/net-next/c/889b0cca6b29
  - [net-next,v2,2/3] selftests: drv-net: split gro.py into one test per coalescing mode
    https://git.kernel.org/netdev/net-next/c/f225a7317c18
  - [net-next,v2,3/3] selftests: drv-net: bump the timeout to 15min
    https://git.kernel.org/netdev/net-next/c/34d89dee719b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



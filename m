Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F7424DFF9;
	Fri, 11 Sep 2026 01:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789091467; cv=none; b=QyAkd776isad2LhEH9TtxCAbLvaIYc5jomwau02UAJIBj1uMoPjAiJdBOPsmoaOtWjtBlxBWexx0Le4vfk42pIaadGh+IkVAVvblRe8jhBBYTqQoLnbdV/74vsA/OIWpga9ynLVSEElsgcka81RT1lB0XlmJ10ZdC5W9J5Oy9YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789091467; c=relaxed/simple;
	bh=jhs4WbVCxP9VrPqbMaJnwEkhKjA1QO4UKAlOUThzjU0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jBxaGOl/Lp2XUPK90Vnmt5Fmmt3DIWUzH1mqJeElMX5oX+/Vw2BWBNoxGJ0JjIindNs25NdLwAqIK8+WMUbFvDWzhS2DOkw9Q9l8/zlT91ZQWJaVI1LnvCk2SY2y06veG3EfHx7wZBgafh7ounAg6kVjuH8uDybFX+T7PrwXRQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIY004O4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIY004O4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B48D1F000FF;
	Fri, 11 Sep 2026 01:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789091466;
	bh=Sqz29Y14soU3BFXv8cAqu1loua7+23t43x+L6D//mMg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NIY004O47GWXZ5uYlzY9KpuXvVd4v4XFmurtvZaOSDn1GXw1f687ZDf7kmgvZg6T7
	 hb1ij9F4hHCAVQFQZ5HgBVO44xLKLLLBTNfiFri6hlMNaGPAgciJvRQeBUvH9zLO30
	 RqzjbQdNwAOPSRRQx8bB1JbcZZaVKaRWlQn6kXZ/lfw8jfzD7MbM3crWIO7oVW03or
	 +YBBjM/X8kwbyp3CZgpwghoqOQ439kRRhQbjJxQYUir1Fjniqh1R5TD4oCY3M/1/Df
	 VAUbWd1tLTBBqeFc5Vye+0DnR9IFEozkHNDB0djYuZKTbk7kp5AA8FR0BwK6f5ikTb
	 PHxYq1BDNm32Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA9113810901;
	Fri, 11 Sep 2026 01:50:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] selftests: net: add ctl_file_write() helper
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178909140364.2178311.5789313045356699959.git-patchwork-notify@kernel.org>
Date: Fri, 11 Sep 2026 01:50:03 +0000
References: <20260909180009.1894019-1-kuba@kernel.org>
In-Reply-To: <20260909180009.1894019-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 bobbyeshleman@gmail.com, shuah@kernel.org, cjubran@nvidia.com,
 cratiu@nvidia.com, noren@nvidia.com, willemb@google.com, petrm@nvidia.com,
 linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  9 Sep 2026 11:00:09 -0700 you wrote:
> Setting a sysctl or a sysfs attribute for the duration of a test and
> putting the old value back has been open coded multiple times.
> 
> We generally avoid creating library helpers but this one is very
> common, and the defer is a little tricky as using the same function
> for defer as the initial write leads to an infinite loop (not that
> I would ever make such mistake!)
> 
> [...]

Here is the summary with links:
  - [net-next,v2] selftests: net: add ctl_file_write() helper
    https://git.kernel.org/netdev/net-next/c/348ea4642f56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



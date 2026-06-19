Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9382532BF41;
	Fri, 19 Jun 2026 01:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781832616; cv=none; b=cdrPKTnk98Dmce8jF8zwX8SvbI2OrULg4KILMpB4FC2+WMGyvE9RdN825xEE5CTSOkGCGH5TXgzni/1omHxbHt1XAYFEVkDUCXAw8pz4pCtevsR9owg9RCasjop+PYXbnro8n+BAtQrdlgKpOU1r6qYahp4DUoXmIhKjDWMgJh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781832616; c=relaxed/simple;
	bh=rqCnPt9UWQZ9N+SmSwpSAaHSK2BHtDKJuRz5iVjhGvc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JQgKPsErQxAeeF5gfJ0WrtHSwb2lMtYDeb0Zi62NncvB0p/KfnFTY3zvzagCyhAAGGNoMg1ad0LjtC5SnRPMqExKPYnYonmjYuIP9x/JGXduUhlzGnKI7AHYPQpPUnpWrKaTBQWt+DiPbEz3FOyoUTZo4pHuP3x51SVeHBwlsgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOTOggpO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOTOggpO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152551F00A3A;
	Fri, 19 Jun 2026 01:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781832615;
	bh=CQxFkWboFGY2OsfQJ3ndg7wjlp98H8xEd0k8qSRbFso=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=AOTOggpOlB2ik6dai44yjrLeCU67F85692QJo9+cBsqTA0OnynuxvJDq8zkECGiUz
	 eBdSuD7Cz6URTMS4kKEdnF+71KPj3Do0eSuIJ0sNTlCjHmBjFDzX/CBer/DMabCLZn
	 zE2R1i0/T6k+XrB8icjKEKo+uB3c+VXw6tHWk1aODQ4ypmVc2ypmyRRN3ug96yjUgN
	 MAppPykLxZHeM+dO0dgMXhxmoODoDiQlW/HBRTpSwPHKvnCUyU4IW471bz8C0VKjKD
	 IAiKCfWyU4nmAGrpoSfWyM3aJShLG34H2Reh9g0tCAI+seRhfrpOFMcsjCd7C5mDOe
	 4TM9gNuK+ONVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939963A78A7C;
	Fri, 19 Jun 2026 01:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/1] selftests: net: fix file owner for
 broadcast_ether_dst
 test
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178183260813.3153236.3577914361274386462.git-patchwork-notify@kernel.org>
Date: Fri, 19 Jun 2026 01:30:08 +0000
References: <20260617061039.79717-1-ross.porter@canonical.com>
In-Reply-To: <20260617061039.79717-1-ross.porter@canonical.com>
To: Ross Porter <ross.porter@canonical.com>
Cc: linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, oscmaes92@gmail.com, bacs@librecast.net,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 17 Jun 2026 18:10:38 +1200 you wrote:
> The broadcast_ether_dst test can spuriously fail due to file
> permissions, depending on which flags tcpdump is compiled with: If
> tcpdump is compiled with the `--with-user` flag then tcpdump will
> step down to the provided user after opening the device. In this
> case the test fails due to permission issues, as the output file
> is owned by a different user.
> Debian ships tcpdump with this flag enabled, so this bug
> appears as part of our kernel testing.
> 
> [...]

Here is the summary with links:
  - [v2,1/1] selftests: net: fix file owner for broadcast_ether_dst test
    https://git.kernel.org/netdev/net/c/b8613e979200

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



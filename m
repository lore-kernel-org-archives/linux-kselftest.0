Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304642641FC;
	Tue, 28 Jul 2026 01:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785201063; cv=none; b=Lhsh5M4CvwD2ngvOOypKi7L9gcl+AZpF3P4ysFlUatbobF69pJfvczmL6Gjv/c2FJUwu+RqjZLG86WRyKAeRqiMZJjZ6NeWPgNRlIFxrT9T++FvNjDVjqfoibjivr/QR6a0BAsvdpNJYAsZk6rUoJHidURiX3RtXTper/fNR7XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785201063; c=relaxed/simple;
	bh=QcTNW/xl76b51zbatSHVNa2jP7l1csY3QI0mJIV3xUA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kyMZHq0tcrU9mJ1HD9hX6t8giU/Q9QZsHw6zu/dlEtlDfkntKsRe+syG+xGh3tP2HXswnpS3wFXxFTIfbbF4nWs7gBjAO5zsGGLIqRlvI/CcEwo12LA+z6otYEZ2kBrud9psRIvN0LSR3QuCSsAeE0WJ+zRYJur/R8Nze0jnMRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6IdMCTP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6IdMCTP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F451F000E9;
	Tue, 28 Jul 2026 01:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785201061;
	bh=XpGz++o1hIG6hggRhPu8aPVTpDuVu7JWAALkS9dQhzs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Q6IdMCTPLhyZnf9mMjOx/v9EaS5oCGR2Yd0HZjrSK0/BAkCFayFnq6v+Q6Psr6R+w
	 D16J/3NaeL6MwxBX40J/ALShOr4DcIjWHp+rqEXFODITxJ0jpdj3b/U8sygdlmBGUc
	 lyjmdRgs5qtoiMbmoLZp+cjSTKMZaiWtFBVrFfM5UeFOOXbfUSwfnN2Ckl/G5p/N8i
	 4dwpe1yznvDhWzhpHWrt42hjBnlhZ28aab2CX0Ep8RvFUtuHjoKa/oS1yam6BIrycF
	 Cbip5JA+t7WhJojox7/i1VunheyrRYnG4S+FDiZQcvMVlJauy6aTmVy61wUDHSw7ZA
	 NlaE3ciYYbYQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19B97380CED8;
	Tue, 28 Jul 2026 01:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: net: Add a missing config option
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178520102663.1486027.17250560117614369813.git-patchwork-notify@kernel.org>
Date: Tue, 28 Jul 2026 01:10:26 +0000
References: <20260723140241.132120-1-alice.kernel@fastmail.im>
In-Reply-To: <20260723140241.132120-1-alice.kernel@fastmail.im>
To: Alice Mikityanska <alice.kernel@fastmail.im>
Cc: kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, alice@isovalent.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 23 Jul 2026 17:02:41 +0300 you wrote:
> From: Alice Mikityanska <alice@isovalent.com>
> 
> Commit 5cb53743e1ff ("selftests: net: Add a test for BIG TCP in UDP
> tunnels") used iptables match comment, which was missed from the CI
> kernel config. Add the missing config option.
> 
> Signed-off-by: Alice Mikityanska <alice@isovalent.com>
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: net: Add a missing config option
    https://git.kernel.org/netdev/net-next/c/8fe79aa2f1d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



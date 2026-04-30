Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4301F7575;
	Thu, 30 Apr 2026 00:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777509656; cv=none; b=PoeePxuntotdXsm9Lep7iyh18Zxzv8lLLfRp/fuurMjo/Od4FAnr7ht3pShwNYSYZKkOqAlfJk/c7JnWluZN3FAS3DSGfEEUsdtCJplWjd7iIdhx6y5SgBERyQ/Z5smIKN6u2Ov6os3hifDJLXO4ZMFUOd1D47SI1i8AHeNnR+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777509656; c=relaxed/simple;
	bh=angfAkeLnu0IY3WPxTaEneZs2FY8D5JBHwT8KMtamcM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=A8abm8cMztDfleeHbEaeT+KIoIWqskwCnnnyFOvc4p14PSYkiP++fHChagnddBGzJslxSvp/1I2yd4VvBRstghcTNwD1xWSfJhAlXxpwDVsTlt3jFB2L5Y5jLs4hzWa1MNtogFey2DCCU4EXWV1RlbhmFFtMYK5jM1GSZg2mv4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sdvxTres; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sdvxTres"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB995C19425;
	Thu, 30 Apr 2026 00:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777509655;
	bh=angfAkeLnu0IY3WPxTaEneZs2FY8D5JBHwT8KMtamcM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sdvxTresNbkpkFLBhOvEC8LfNSXy+8s3d/VsZem//k5yDoHBa8xhntWJPFbx9hyy+
	 o5A1w4Bwxym6fcGJ/sHpMvg/bsok8F/C5OHAmAH5FbiQbsDgNj1nfVNgs+AZVWnRTX
	 h8VYyRvoKbvfkTG6pe4sSWNjqVa/aXTux5/5v1xksKaHV1r6dQGEiGGMOxbK3MBC1H
	 ZDP+enwAOCzGBkFH6bQiGmck0e+yosJcZQM0sWNkLPm8YTocQe5rG2X0f+ZCpxRnCm
	 872O6Uw0UW5cM0+Ag9hHp79KrkCF/BEFYOyMAd6vHJzhPEt5q1lMJgbBJso+2deMOR
	 s00UTmuB1QqmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FC0D3809A2A;
	Thu, 30 Apr 2026 00:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: drv-net: clarify linters and
 frameworks
 in README
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177750961079.2238701.10504743182027421985.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 00:40:10 +0000
References: <20260428203357.1222611-1-kuba@kernel.org>
In-Reply-To: <20260428203357.1222611-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 28 Apr 2026 13:33:57 -0700 you wrote:
> Minor clarifications in the README:
>  - call out what linters we expect to be clean
>  - make it clear that by "frameworks" we mean code under lib/
>    not just factoring code out in the same file
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: drv-net: clarify linters and frameworks in README
    https://git.kernel.org/netdev/net/c/72e9647e2b20

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



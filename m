Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C313451CF;
	Tue, 17 Mar 2026 02:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773714618; cv=none; b=gKyHxogh5DQUdKcW7Ve7Mr0Kgw/0zcAtN2myUa4ajUSi02bgxDKgz1aOWSJtkJNZ68Lq2Qu3pYofdrM1uNbdjJIvdDZ7Sb0Yobfzm4vXkkk1lQxnkICoz9+lITYbI3Oc8xYpx4Mn+AZ46xa7EMqnevqas8DWBELfCEUNUjVTQPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773714618; c=relaxed/simple;
	bh=jUpANb88sBObEKebtzWSQSh8EmC6A9BVVb3gWyUVarU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kegPeQC6h9+w8WV6KIF3rUhPA6dtJFLN7aMHZIeRGhyu2UMd9ITJwWFOyU4cr9dPr0DGaK/LBJO13TtXAKBudy4zclCcsfR30Az5BS9OsdKaKFihQeLHbt8ZrNIjgKyKSrZoCgcSx6nctBNQrwCVdOmmEhKfmYc3OtzxZmmUfCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QO+0bvEj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QO+0bvEj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE708C2BC87;
	Tue, 17 Mar 2026 02:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773714617;
	bh=jUpANb88sBObEKebtzWSQSh8EmC6A9BVVb3gWyUVarU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QO+0bvEjz4+fvBG6eCTXQRqM5Vtq+jFPptttS4Skv0Ud618zzcEQfgIVIpwcsxvGN
	 VuQxhZ8z0b8em9+znL1SmpoBYYqW9ehfch2hZRyiZHMzzFtW3hxRf08JZqRgsh+SbZ
	 +N3NDZmbyul5CMskAg1ii8o5WIzFvz7ocL1az5iLByX9JkzVC4kw3Cm/aajSxcfvC7
	 xvfjJPkAM04cXe2VNjoGwOGVeHyLRVPK9MrAhurDZdMONx8bHLD2789GsbS1+7PbAj
	 ad3WV9m+MXV3u2zglaYN7f7uUBVIB7vPKRn57f/anghIb+NZ8dW4+lcaOvggbk+i43
	 T88Tnw3zh0aSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9ECE3808200;
	Tue, 17 Mar 2026 02:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: net: py: give bpftrace more time to
 start
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177371461053.3397946.6102878609227085799.git-patchwork-notify@kernel.org>
Date: Tue, 17 Mar 2026 02:30:10 +0000
References: <20260315160038.3187730-1-kuba@kernel.org>
In-Reply-To: <20260315160038.3187730-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 petrm@nvidia.com, leitao@debian.org, noren@nvidia.com, gal@nvidia.com,
 linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 15 Mar 2026 09:00:38 -0700 you wrote:
> After commit under Fixes debug runners in the CI hit the following:
> 
>   # subprocess.TimeoutExpired: Command '['bpftrace', '-f', 'json', '-q', '-e', 'kprobe:netpoll_poll_dev { @hits = count(); } interval:s:10 { exit(); }']' timed out after 15 seconds
>   # # Exception| net.lib.py.ksft.KsftFailEx: bpftrace failed to run!?: {}
> 
> in netpoll_basic.py >10% of the time. Let's give bpftool more time
> to start, it can take a while on a debug kernel.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: net: py: give bpftrace more time to start
    https://git.kernel.org/netdev/net-next/c/6a33a706265d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



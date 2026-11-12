Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504010;
	b=pJD3Rq5akf8/xnrFqVNlASvjBf1vR+A7d1lcYMQrP1jWQ0HffEOs/IbuhKadEFgu0f5D
	 p44I/y9p/vf7sfd4Zz7OYAAWh0WX8qFHos+DpINWfhSkE4PIKdTT8inCXJ0HH8oVwjCRQ
	 Esx84Rm5ABs3FkjyPZG5LlKwtAHrUHAnKiVRj4/F3yFrzVsopaPOpubueJowQv87YAcf8
	 5/5LD8UGI/Pgd7rN8l8NJuSLzOctjvEpn2VhMCYlp2nPYlX8ut7iiaUnbdXqzvalOzd+d
	 rsqzBFlPcySW9R6mJWE7xxKqS78AVkTyqA3nqoZIWiHwO8QTbG2Gb/WxpSByxGIlPyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504010;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=qh1V44/qrjqPJqG2SSMDXw9kPp0UwBbtjC0sXrPB5vM=;
	b=03Drz9HWyAqvVPa0hMBK38995hiORMp7mpyrLKR642fGE4rHaMxJ1G7ysj93S1AVZmI1
	 4eujUnsixxdDOjIQ7c2EaeY6DO+JFRmYZjYVabFAgl1fDzaIpgJtw9UADv2VpgsHo5XVs
	 4jvkga2SmSNCHmOGEE0hmXG7rAf1VMDg0tpHVU1oAeEn+W0QoB/+TInnuYFJutHM2QB9e
	 7scV6kVIfrrMq4MDoJVSOR64o+obTBF9j4o4SghEJA8JfGek9IfdTU5p4zqtbanJIos8b
	 84TQRsM1sSuKI1/njnmFyAH70KMb3rwxXCONnsjIfDQXSc1xwKCyKx4oOP5Y171fTjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gZ8FCuym;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA57606A33B;
	Thu, 12 Nov 2026 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gZ8FCuym
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447291F000C4;
	Thu, 12 Nov 2026 17:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794504010;
	bh=qh1V44/qrjqPJqG2SSMDXw9kPp0UwBbtjC0sXrPB5vM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gZ8FCuymDVmjcoz1OcqeOjHS7kOYvCdzOq90aoKN0D36HBSyYkkLatxsuIxXwwah9
	 Udx182mcaR20iUq3PlCAPfFAqrDbK6srs/UksptS1FZ2CmZE4Q4EhSosyEc3n6J/2e
	 2FaI3WLe5Dc0I4UH09cG6NduPyHbxTjjRFaqM7BnyTIQHiT0s4QdlWgDGijSJHt9Wv
	 xB2gpC0EGOJvIp4nUX64ikz2W02ipmo6AtKk10sCMrejusPxF0+uyFPR0CrnY31CqS
	 29gQBuVsXylCUvXNzC7XlYyS6qz1ZZfmbPHknnnQ6cgw8ESLOsDQdcS21XTNF/mJOH
	 fXgbrUpy6Rv0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A322380AA78;
	Thu, 12 Nov 2026 17:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] selftests: net: udpgso_bench_tx: honor CPU zero in
 the
 affinity option
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179450400877.546493.115415908512112502.git-patchwork-notify@kernel.org>
Date: Thu, 12 Nov 2026 17:20:08 +0000
References: <20261110033920.49267-1-xujingjing@cmss.chinamobile.com>
In-Reply-To: <20261110033920.49267-1-xujingjing@cmss.chinamobile.com>
To: Jingjing Xu <xujingjing@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, willemb@google.com, kuba@kernel.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 10 Nov 2026 03:39:20 +0000 you wrote:
> The -C option accepts a CPU number, with -1 meaning that affinity was
> not requested. Testing cfg_cpu > 0 ignores an explicit -C 0, so the
> benchmark can run on other CPUs despite the requested pinning.
> 
> Accept zero as well, keeping the negative default unchanged.
> 
> Discovered by Codex-assisted code inspection. Validated before and after
> the fix with loopback UDP traffic, inheriting CPUs 0 and 1 and reading
> the process affinity with sched_getaffinity(). Before the fix, -C 0
> retains both CPUs; after it, only CPU 0 is allowed. The default and -C 1
> cases retain their expected masks. Built with GCC using -Wall -Werror.
> 
> [...]

Here is the summary with links:
  - [net] selftests: net: udpgso_bench_tx: honor CPU zero in the affinity option
    https://git.kernel.org/netdev/net-next/c/c2d5ef7e600b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



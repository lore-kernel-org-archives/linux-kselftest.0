Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73644223702;
	Sat, 12 Sep 2026 00:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173073; cv=none; b=MGAYdq+RY7fSdPtHR5tRpK06E8noqOWbfX9r70VS9MDsUXpsgN7ZSFWWgVgG5USL7b8YFxqFweTXFRdxt2+C7Bk1SUWOJcyeNUmjIS8l8z2+sQAqsfNorzwIsY/HAT6GDgJLWpHrHPw18h4/bUu/Zswygs0j5HJb2TzCy18BoE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173073; c=relaxed/simple;
	bh=NYMQdMLw/30mVE8/hMKfrppl60/RrWlgL4ABkIM2uPk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WrPfIVyfC5cAS2QlR5PfaSshwcLOBrfpxuDaNWAa60WQmgkr185bkvk4w9tDsBJSnGkUiTMV2eGPtCP7z+EXeTu0B9ADhJT3UUFsZiSRci2UmdYpTMmjDfHmTT1OAJwhQ+RkoW458gA5BZSJDgCWvaziX0mwSAnv3p6zNKw+wmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIrGtqjJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIrGtqjJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09941F000FF;
	Sat, 12 Sep 2026 00:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789173072;
	bh=sYxSiRKUh7aoJ3+oewLHCs/7foU+HqAfnDbty8Xfk+M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UIrGtqjJCYygtDB2ZoZi3/+M0odhKN9qrO4m3Q0/hsoH7cvsecbecwsgQpE30Dpx2
	 eDNbnDlYiQ/MJnTQAKretQ7/9LH51UC/DcoZJ8d8Ariyq8NpmvoZhEWB1UITX2mB+l
	 stZjJ2Dh7EbT6RlgHyPalj8wRfqWCYHNt1lpEPIOqh6HvZNhMtbSKuWKameBu8TvUJ
	 gkxzEl10twrxakmKFiO7/Ro0g8BCw1FsbF+Qp/50NcwEF8bAX9rUrWQwdew2Au5a3p
	 e65hBgvMThFBzBOIjo9+Mhfmps2g83RUVq5MjhPGjm6Ie7Q7YVlXA0BEMZlLN/SH+Q
	 yvqOqWsFqZgyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A3F392445B;
	Sat, 12 Sep 2026 00:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: netdevsim: add TEST_INCLUDES to
 Makefile
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178917300837.3175777.6615620728639382415.git-patchwork-notify@kernel.org>
Date: Sat, 12 Sep 2026 00:30:08 +0000
References: <20260910-nsim_lib-v1-1-0be0d49eaa42@kylinos.cn>
In-Reply-To: <20260910-nsim_lib-v1-1-0be0d49eaa42@kylinos.cn>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: kuba@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, liuhangbin@kylinos.cn

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 10 Sep 2026 16:06:58 +0800 you wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> Some netdevsim selftests source forwarding/lib.sh and other files, but
> the Makefile doesn't have TEST_INCLUDES targets, which makes
> 
>   make INSTALL_PATH=/tmp/kself TARGETS=drivers/net/netdevsim \
>      -C tools/testing/selftests install
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: netdevsim: add TEST_INCLUDES to Makefile
    https://git.kernel.org/netdev/net-next/c/879e280b8486

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



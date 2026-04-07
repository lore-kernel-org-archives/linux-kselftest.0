Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A67B3A4F3F;
	Tue,  7 Apr 2026 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557228; cv=none; b=NVbSwxZ28Esb1Imr6A6o0bQWjg1YvuFuMe7zvBdacMI8lOLXnYI4IqSAgeXhekgMmShmozpaK8yarCbUcWNphiclOIUgiKWZIfOXuKAlzXhevP4VOCxNKUD0wUWzx63+aeT0jyEwA1jFm3CEUC33g7e34+CCVxdL9WrbZcr5R0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557228; c=relaxed/simple;
	bh=BgrqH19s4U795fBMpKD6PT+rWQJV1FNyQlaoQQ7325A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZZb0BoJQ9E7zNL1GqAdEbNnviXv4LADF5pZMouACAt/BbKVE2Z+6Fhc00TYvVTYAvj7b1BrRd3wJbOtEqlV8BdbIfdfFFILgyToW+ImsSeas7QUObpkuHr0BzZqy8nlNhKL3a4Yp2g0P6NLT81cpcYbr8l9Kz/nCXzC6F7y74Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jC7/+l38; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jC7/+l38"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8965C116C6;
	Tue,  7 Apr 2026 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775557227;
	bh=BgrqH19s4U795fBMpKD6PT+rWQJV1FNyQlaoQQ7325A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jC7/+l38ApsiaYucwX5mB3kg3p/WmGnj7KNogOi6EJ59Pg5SiMYwijdSjCb/RVqqo
	 pIZHuGYSkzS/JGiQbD2YJn2M8eqyANMWKBzI8jYdQofvP69CWpQ5vJ8xihi3QGfcUK
	 TxCd+OpNVBhLAVS037XiQ+o3+xS5otI+Ee4jCYH33mIk5Q7w49dfyQf6MjryQMtq9Y
	 h4D9436WJjb55T8Whlctri1ZEOuyOZtEn1uXn8wJihNWAZBTsuh0wjpDSdmW3elntm
	 F+orzVuCjt/g+tuaQl26mDrQddutat0CRvzeY/8hZBRZzRGv+MVLJ/vu3zlPMcX25p
	 /g2w7/eCzmt/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02C893809A28;
	Tue,  7 Apr 2026 10:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v8] selftests: net: add tests for PPP
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177555720555.3496835.4333765541275233582.git-patchwork-notify@kernel.org>
Date: Tue, 07 Apr 2026 10:20:05 +0000
References: <20260403034908.30017-1-qingfang.deng@linux.dev>
In-Reply-To: <20260403034908.30017-1-qingfang.deng@linux.dev>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: linux-ppp@vger.kernel.org, shuah@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 bigeasy@linutronix.de, fmaurer@redhat.com, petrm@nvidia.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org, paulus@ozlabs.org, dianne@skoll.ca, jaco@uls.co.za,
 carlsonj@workingcode.com, andrew@lunn.ch

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri,  3 Apr 2026 11:48:47 +0800 you wrote:
> Add ping and iperf3 tests for ppp_async.c and pppoe.c.
> 
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> ---
> v8:
>  - locate pppoe.so and pass it to pppoe-server
>  - start socat as a syslog listener and dump the log messages if the test fails
>  https://lore.kernel.org/netdev/20260330035604.133073-1-dqfext@gmail.com/
> 
> [...]

Here is the summary with links:
  - [net-next,v8] selftests: net: add tests for PPP
    https://git.kernel.org/netdev/net-next/c/dfecb0c5af3b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



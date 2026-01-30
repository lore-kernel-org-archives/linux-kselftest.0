Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B735C33D6CF;
	Fri, 30 Jan 2026 02:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769741444; cv=none; b=kN8rbCjrasGw+KCRfYot3XfNAyeoIvRBjjZsI9EzNIYlM3eRC5ao0NbduKSGIYj6Drqhy+GmI7rNe8olQ7WW+7RQPSaLimXVjx/UAdnCJ4UBpquvHl+/3ZR5PvZ/M3CZJ54ijQLi+7tYVO8mp9AXalLxj3JvLZQRxg81bFSm8ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769741444; c=relaxed/simple;
	bh=E2ljW2tst12WcrA4YHRudOeA3ZTNyuXhob66mOe0YeI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VvQfKUphsinfw//XDyg6LkS9QpZqFjkP4DHtS7VjnpbqHmn3Io5XJnDjie//MqdLIM/PFoW9UMUBOliMdfrFnl8DWZYiOtvs6/4KaPZQNG1CcVwjr50uJ52UX2sNDCshqXy96YT9qkhz9syAWD/It0BDHGk5atD1EQmTa5fA+4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EM/RrRP4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EM/RrRP4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55147C2BC86;
	Fri, 30 Jan 2026 02:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769741444;
	bh=E2ljW2tst12WcrA4YHRudOeA3ZTNyuXhob66mOe0YeI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EM/RrRP4FOmLW6Zx+K1GP1DEWbht5gfsQK4gqPVqI6qE53y0D67bJw2lrfIKk7tg1
	 hHf8cPPWYiMvykuM+88yUNK5BJsxz8fexS+MBNVhMyTmQw1QaJpvx9nlolUvjMsOlB
	 9WnCNGtYlunP4siFgNMprv/fqBRFmT9KD0Ol6vVw/dNMGN1lLoln8Wk7OiqI0Mk6Fb
	 8wz0XDEYLCSYc5V8zvPchNRWXb11bFLFCnoc6+DLzJNAc4OfF38ZmXvIU20BDRkd1M
	 0EqzmAKTjVbLWTwYhiCqjcZJmwd01Qjq/75zuxcOqd60+k2yUO9PdbrfSN2Yt+/jT4
	 x+LiemHyJri1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4ECDD380CEE0;
	Fri, 30 Jan 2026 02:50:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: drv-net: rss_flow_label: skip
 unsupported
 devices
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176974143685.3149010.1096640918791492655.git-patchwork-notify@kernel.org>
Date: Fri, 30 Jan 2026 02:50:36 +0000
References: <20260128090217.663366-1-noren@nvidia.com>
In-Reply-To: <20260128090217.663366-1-noren@nvidia.com>
To: Nimrod Oren <noren@nvidia.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, gal@nvidia.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 28 Jan 2026 11:02:17 +0200 you wrote:
> The test_rss_flow_label_6only test case fails on devices that do not
> support IPv6 flow label hashing. Make it skip neatly, consistent with
> the behavior of the test_rss_flow_label case.
> 
> Reviewed-by: Gal Pressman <gal@nvidia.com>
> Signed-off-by: Nimrod Oren <noren@nvidia.com>
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: drv-net: rss_flow_label: skip unsupported devices
    https://git.kernel.org/netdev/net-next/c/7b85c7758540

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



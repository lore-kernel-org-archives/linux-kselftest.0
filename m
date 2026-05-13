Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9A73563E8;
	Wed, 13 May 2026 03:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778643992; cv=none; b=d5Ykd607jIfT2y3RBzgrT5Ubij6nhuJd2zYG8H0Oazo9TZXpEoNNmeyMcb0SD/H1YpgYlLbZLx62McGaRgk+fsmQHkAcvHTUIMRiaUvzziisTcQtBoG3q7pdeTfFi44OMVW6MaSMoxKAhNd4fp0HaQlHCiOmfIJSHXgPi27v25U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778643992; c=relaxed/simple;
	bh=I958cKXMRUeIholFCKrb8igOnxRirt/wAdJwV+6Rps8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hDS8LI1DoyAjHnXo/Mx50sj+qshpiRjKyjeUS/b2BgSwCpwAm7WkEvBt72fj78j9VAij0qbPeSA05OP3CXOva1IzPqEnufGnaD2DDdHUSjZtYx6cqYSmI2q0rVkbhlLfAKEnIplN+SVASvdIHEkxvZp/tFnKJxs2Qbh4AtRKRJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XwQTOjUe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwQTOjUe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8014CC2BCC7;
	Wed, 13 May 2026 03:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643992;
	bh=I958cKXMRUeIholFCKrb8igOnxRirt/wAdJwV+6Rps8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XwQTOjUeuQxOB4aaKyj/8fLf3MhQR4/yQ7T6ZvJn3isxy22ETi4xKeAlDZwRZJJji
	 tgsNP7uIiNNWnDG/sz2bXyd4/waffrVr+Hu/PaHZSzGwXpVwkAb0OTypQntGaaU59v
	 eXHfppZH64VZiKVgkpYcfOmf4fFIJeiNjDF6+SYd7T77nox0D6gjib1H/goZH9k/bQ
	 zj/xCDTNRSHV131dfVUhIe4WKwnzUqKtf7QmVmkLN4ZaJrctI+gL1SfKGH1Z3p0fAM
	 Rer8gfrstLakAoqvUcc8tPsfVlp8DydSZ8bTUmh3kzCkRwrk2Ajo37hlwhGoktgUNp
	 12JD5fSWMs8AA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CE593822D60;
	Wed, 13 May 2026 03:45:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: drv-net: cope with slow env in
 so_txtime.py test
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177864393804.3173643.10761886760431638344.git-patchwork-notify@kernel.org>
Date: Wed, 13 May 2026 03:45:38 +0000
References: <20260511222138.2045551-1-willemdebruijn.kernel@gmail.com>
In-Reply-To: <20260511222138.2045551-1-willemdebruijn.kernel@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, willemb@google.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 11 May 2026 18:19:20 -0400 you wrote:
> From: Willem de Bruijn <willemb@google.com>
> 
> This test was converted from shell script to drv-net test.
> 
> The new version is flaky in dbg builds on the netdev.bots dashboard.
> The previous shell script had more protections to avoid these. Added
> in commit a7ee79b9c455 ("selftests: net: cope with slow env in
> so_txtime.sh test").
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: drv-net: cope with slow env in so_txtime.py test
    https://git.kernel.org/netdev/net-next/c/543bdc1578cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A02413AF2;
	Tue, 22 Sep 2026 00:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790036475; cv=none; b=JPeVoAVjmTsXSm2qGfDI5AOFdJFQsFMnveJbpvrkctU3kORVK9XAuMr2BM1K8OQPYRhrA3sQ9Ul+dRxf9FPYYXLm0/GJ4zMw3cMEvkL5BDLihllk+sk20KfCjbPKxC0m/uD0HLomcGfUCobVrAusykb9F4VzSlZGfrSov7GXVvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790036475; c=relaxed/simple;
	bh=evRytcwqs13h6MILKX1qLHYaNQYoboaTEEbJH85GQFc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=a9wZ7cS/zOyLETKohpJgeFLG/A0nMWwEdiIg889NbsjsR+SdNBNEHYQDkkwmsHhRmU+t+DN4tl02A240aDSaQmy/8yMlv+i0iyaRBMgBEolKNwdnhVx9M0LLXf29W+hVDCv0bBZUZ07bTLaQWlpNA+CNs2c+IxLDe79Fx9ifu6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amm9ImR4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amm9ImR4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42F11F000FF;
	Tue, 22 Sep 2026 00:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790036473;
	bh=5RkkFJYFslgndKjYBbOWG951CnsGw6kVa+A/Xj5kRTA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=amm9ImR4ugWY0ahhoL7JqWmfCQoc55mZlGt6etR5odDRRTJ7xpf5KrPbST9XhtCRp
	 hWGFxEGtOiyhOEpYY6rqXLMqS3BKLJYvsKzlYk1xkKxWJZAZBCKaPRVdbU3ly6whvr
	 GKx7Z/nKMGmU3OytJ1Tfv3VsWPpHxbTiA1ljPbmPAm2U0u+nY9Sn6dcwdisQOZER12
	 hKsOG9jI55UmZ4C5wezm3oahIXqOEVbISkHr4FmRqKWMJ/Pwuhonq+LZbcOR9tFrnj
	 I8kii/5C8wpFmYg+i+7edMD4TaUNtjdXCiE+MhPvFF5+h+Kswz+6ElM4Coq0upoxvs
	 kdXHS0K4rTAfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56AF73930203;
	Tue, 22 Sep 2026 00:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] selftests: net: fou_mcast_encap: load the fou
 module
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179003640515.3303074.9625403499092516237.git-patchwork-notify@kernel.org>
Date: Tue, 22 Sep 2026 00:20:05 +0000
References: <20260917033049.792209-1-fuqingshuang@kylinos.cn>
In-Reply-To: <20260917033049.792209-1-fuqingshuang@kylinos.cn>
To: Qingshuang Fu <fuqingshuang@kylinos.cn>
Cc: apw@canonical.com, joe@perches.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, willemb@google.com, littlesmilingcloud@gmail.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 17 Sep 2026 11:30:49 +0800 you wrote:
> setup_ipv4() creates a GRETAP tunnel with FOU encap and configures a FOU
> port via "ip fou add". Both require the fou module, which cannot be
> auto-loaded.
> 
> The test assumes CONFIG_NET_FOU=y, which matches the default selftests
> config, but fails on kernels built with CONFIG_NET_FOU=m. Without the fou
> module, tunnel creation fails and the test reports a false failure with
> 0/100 received packets:
> 
> [...]

Here is the summary with links:
  - [net-next,v2] selftests: net: fou_mcast_encap: load the fou module
    https://git.kernel.org/netdev/net-next/c/6e0ee63cd2c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



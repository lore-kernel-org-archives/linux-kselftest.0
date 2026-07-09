Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5FB3F6C32;
	Thu,  9 Jul 2026 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586434; cv=none; b=aZCQIaMlnaDnYORTwU+qSxkPoTo8GioW6zzquWP41jNomumuHeHgsk29G2J/SJsWgAkfhtBII5dRITeBdk0N4pRTaQf6IFSzdsYFMMUs9he7gywEL9Hxmo+8Y6DqsQ7dAdQEZ6uZ3T5zE+/Up7nc0m6lqI44gp+qstJV5nO7TVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586434; c=relaxed/simple;
	bh=ETuA8VW3hTxL5w4NaDBV1bU9lPayE84dzg0mtfkMLK4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=n8+SSyi2T2t6hoMzcIHM8k3gtMa00XVdWkY1UEIUB5Z/ajPyubyj6wfo0tS2Odhg30z/sZQ86ooyM8bmZCYxxIj2XLggZxKiYNDlQrezLkJAxp7Qbi7aI6yVaB4cAzpZUo8sbjPPHyc9+yanAp/Ux9dVUrRHk2AoGGyBePIvS6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPYldHE4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPYldHE4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D69B1F000E9;
	Thu,  9 Jul 2026 08:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783586431;
	bh=lH9L+vJg/gKOgKVB5afFmv5NL59t/JV2/rahj760Qz4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=CPYldHE4wVmWhpq5ofhvsRGZwvlRWlSWuwZifDjkRc5Vt9WhduA603gmd9ab3F/uA
	 AeNbfUgjcimT7YAnqHh15oKbH9orTJ/60kERIPczBRImS6q171vabaB21bYeyQDTZV
	 HU/5t+t++LnSI/hgISymAD8q7PNYwZCmBUV8Dbqj9AvWppWG134nlLagJTVtGqkUtX
	 iQQH5rYhfDtblr1qGEwKt+QOaFPJIQCTn1Zib8u7PNdLOWVTJwJwn6azqhoq/7HDzl
	 iq73nYVpEZh0T1toAWYwACJ2Wx2FRsRmna993ikz/4UQE+ppZ4Rz58pnRAqmrorxP8
	 ivUxhUEpKmPZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5697B3939F13;
	Thu,  9 Jul 2026 08:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] selftests/net: fix EVP_MD_CTX leak in tcp_mmap
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178358641014.3333608.13910365421023945649.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jul 2026 08:40:10 +0000
References: <20260702025949.442523-1-wangyan01@kylinos.cn>
In-Reply-To: <20260702025949.442523-1-wangyan01@kylinos.cn>
To: Wang Yan <wangyan01@kylinos.cn>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, horms@kernel.org, lixiaoyan@google.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu,  2 Jul 2026 10:59:49 +0800 you wrote:
> In tcp_mmap.c, both child_thread() and main() allocate an EVP_MD_CTX
> via EVP_MD_CTX_new() when integrity checking is enabled, but neither
> function releases the context.  child_thread() misses the free in its
> common cleanup block, and main() returns without freeing the context.
> 
> This results in a SHA256 context leak on every run that uses the
> ‑i (integrity) option.  Add the missing EVP_MD_CTX_free() calls to
> the appropriate cleanup paths to fix the leak.
> 
> [...]

Here is the summary with links:
  - selftests/net: fix EVP_MD_CTX leak in tcp_mmap
    https://git.kernel.org/netdev/net/c/f4ef35efbb49

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



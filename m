Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797007;
	b=Mrahb5kIZTpu+pIf7DhlSYfAPOSzaO6X+mUdzz3C8EddxMMJZmbTXfnHzqi36A8Yfbfl
	 uFPqHZmcJUXkkt7yTSL9vZLVQ+7nCV+Z6b5E2SPhSYPpYmBMK9e+rosBeT2QpENM1PRJf
	 qJXbC3TiX2Z+BelttcPhbvTFnV8gk/e5oiM5k6D13gfzQaY1LCzqdGwpj6Qho4KqOkBsR
	 cS6OcU09n1xbRcdRqJKmw67sDKoOS05eiCYI7Ebi66xaMCQ6L1txhWb6HG8YvIcRIxQD2
	 SR6LdYDcUFa1fgqQoVRL2QvCo/W/8+R6DOQpC9YnBCJiWSxYP6gXX4SwAJHJTh/CwyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797007;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=zHM+aLkD38BiAi+MSbLLo5ugg7Hz6jXiVc5/KY4ht3g=;
	b=HGcHjhpm66MEQkTdezys5SvmY6p2jsFNLGpy5r+YVEzbROrhe3ubRyRShNIkcNRSFeW4
	 Y/BCURqrTPJRX5R8oM6Prgmmn295UiCobYXhmGD096ni3IKkSQpbTu+R9RJqnX9Zw2cRv
	 5MgrclrycvzeKAsKQwZlc8ze44nioWBehcd+/czphIZFgEF7URULq5loV295Jt82SDhNJ
	 hmZyuPvzp8RBX3zh/MqD+hzhe6d/ShaP1k4dvCi549hBy88QBg6fRNFX4EIPrjiKceRO7
	 N6ovhpPrJG0LWiuyyMgTrmhzweRWKqs/7m2QnAV7lTbl4YMGEnlOdpWUNLeeF63s9Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QgoGoZYP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AE5606A31A;
	Fri, 23 Oct 2026 23:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QgoGoZYP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7691F01825;
	Fri, 23 Oct 2026 23:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792797006;
	bh=zHM+aLkD38BiAi+MSbLLo5ugg7Hz6jXiVc5/KY4ht3g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QgoGoZYPi/e6cV2iFUxXOCzmH0Ig5R8L2zq36mgsrRIa59lDrZD1GJPcYsAraJhv9
	 DQYrP1yPnr1t97yT/kty/z5/kLWjCNY8FkHTdHTVw/BAAbFxYwWbrW6ovcnvxhy6/w
	 YWkvirEff55h1Qac39FURO/UCYSHhzBhwVRB+qKLv0ezzjd5sAFNBWSBO9QIlUc1OK
	 rO0KWK1BZb9CIIDMpKSTQQlOmX1UHTEvtkpilvz+IT/nkyoga+vCkwhEAVBOq1eWlI
	 AV3HDu6X1nZp1M73dsQkFwdqp4nJu3tvIzhnANemKyYc48su/DtDSHFLYBohJHgYwn
	 /K+I1ppMYVB9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 44427391B16B;
	Fri, 23 Oct 2026 23:10:06 +0000 (UTC)
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
Subject: Re: [PATCH net] selftests/net: tcp_mmap: remove unused -k option and
 keepflag
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179279700507.1316845.5519230638747198240.git-patchwork-notify@kernel.org>
Date: Fri, 23 Oct 2026 23:10:05 +0000
References: <20261021152658.2618709-1-gthelen@google.com>
In-Reply-To: <20261021152658.2618709-1-gthelen@google.com>
To: Greg Thelen <gthelen@google.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, soheil@google.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 21 Oct 2026 08:26:58 -0700 you wrote:
> Commit aacb0c2e524c ("selftests: net: tcp_mmap must use
> TCP_ZEROCOPY_RECEIVE") removed the only read of keepflag in child_thread(),
> leaving the file-scope keepflag variable set by the -k option in main() but
> never read. This triggers a Clang 23 warning:
> 
>   tcp_mmap.c:91:12: error: variable 'keepflag' set but not used
>   [-Werror,-Wunused-but-set-global]
> 
> [...]

Here is the summary with links:
  - [net] selftests/net: tcp_mmap: remove unused -k option and keepflag
    https://git.kernel.org/netdev/net/c/5536d5553f27

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



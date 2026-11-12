Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504013;
	b=WSu7vW5xCW90iZTEmyTNCvhzRkr0Wv8vkKgZqvzb5WkFLZ+9ACZUaPQBbiMwPJzcAgsx
	 OKr5NxDOV0m7unggnlI9hoQGtiW7+38QR3ZWObbBADpxP7z8l9ulxnrhBkrwlNqtdyMVI
	 gE8CorIEe1sJC1X04hf4wBEWdgDHj1ES3fSR8F8Dw9mVj2fC8s4ombP6PSYkQ1nYuF1cj
	 NrG6oKW4eRiwr4rMhJlVX8I70Uvh1gk8w8UYmKi67KhmKmopBbMNZ4lmxSt8LS8Uno9d8
	 SBlc3zaKFpR+KPuFzDidGAm/f4275g4zP+HoYKaDALUNlFUoxAmQbyvA9VcJ89SaI7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504013;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=LVpa3Wy1O0wr9XarPr+U6SGlwtFgybb7x6MlwZwVYFE=;
	b=CP+EaMkcTKF3uh9wI+klHFAAQHCxR+u7YnTAfgYB2zO6KZrpyoCReenPQN3LAm5OD2Jy
	 yCpBMOuYdB/Xne426Yk/m/Xz8WgVOJ2/KwVeN5Zo5R1z2vlUE9v+7I09VJ1+a676LV8nm
	 MraPt2sGToanf/bsdzDjp9+czUmR69eD+lu7465HQDqxAC9I8H9UZfi2XBWR0Qmq1I23G
	 ceEUb1UZtqJsW5kQ3+9MkjwOvnstFxkzJQBzJdVJWjdi2Fp2QqKqy1TpZQZoRvxR4poeB
	 884S1oJtJUjEEUd4V0koyiM97AEBvE/7dd028oVoNne5nLf5io7M05vu2+K+p89Hg3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hjr0moD1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC85606A8B7;
	Thu, 12 Nov 2026 17:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hjr0moD1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D0D1F000C4;
	Thu, 12 Nov 2026 17:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794504013;
	bh=LVpa3Wy1O0wr9XarPr+U6SGlwtFgybb7x6MlwZwVYFE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Hjr0moD1h356LUcnYiCnVgHlThFImqT5KSR9Wr0vt4hSCLrARnAU7GIzn6tYrv7sQ
	 /9kmU1+Sg4RT9LR3HfL0opiPWHyhR8AH1y3QwStzoJG83zPhX8xVXfS3TCex07EKkd
	 XhHSfjz7ppp9wBRSPjbi/LTo0Xk0UAJeIucsQ01gWcf7on80JwcdIr7Ymn3MBDF/4c
	 Kp59ecVEhwWmhRVUosExnbAOdK6QD+x5qPYm4AtD+N6AefvXxQXsra5eoOsTh6iEgi
	 jhqW4mWANcv04sQk3GTq2aMNcl/QLlRrTxoFwzdhdXgk9UYcWWU11NsPASPkNks1TT
	 UoSpdmW2t3cpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A39F380AA78;
	Thu, 12 Nov 2026 17:20:13 +0000 (UTC)
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
Subject: Re: [PATCH net v2] selftests: net: forwarding: replace bash brace
 expansion with seq
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179450401177.546493.17224349993183681494.git-patchwork-notify@kernel.org>
Date: Thu, 12 Nov 2026 17:20:11 +0000
References: <20261110024123.535210-1-jinli@lanxincomputing.com>
In-Reply-To: <20261110024123.535210-1-jinli@lanxincomputing.com>
To: Jin Li <jinli@lanxincomputing.com>
Cc: hangbin.liu@linux.dev, dsahern@kernel.org, idosch@nvidia.com,
 shuah@kernel.org, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 10 Nov 2026 10:41:23 +0800 you wrote:
> {1..16384} is bash-specific brace expansion and will not work with POSIX
> shells like dash or busybox ash. This breaks the flowlabel test when
> /bin/sh is not bash.
> 
> Use $(seq 1 16384) for portable iteration. Fix the same issue in
> custom_multipath_hash.sh, gre_custom_multipath_hash.sh and
> ip6gre_custom_multipath_hash.sh.
> 
> [...]

Here is the summary with links:
  - [net,v2] selftests: net: forwarding: replace bash brace expansion with seq
    https://git.kernel.org/netdev/net-next/c/e6edbf3e343c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



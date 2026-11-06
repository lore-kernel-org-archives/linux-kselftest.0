Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794005422;
	b=2y4SEttouDBgSIShHp46QLT+10sTHk5WlYoS5JJwVjdc0z/f8GrJCHkw/71i0iytFIYL
	 6gm6I0X2hHm6vYDnAZSFCqncuJxLumML6JLnIWrPdMvZ5oUjhGuZtW+PWZIlDwkxQCkPz
	 Q4964/5pCtt1Ddv7XsW2CXtMvRi1i4mOF7OLet/qPg8ARpeNQZtMe/DXmLAJgL2Y5SjR4
	 H9zUdCbjoZvXC549u/lBBzHh3VUzwRhOWPHuA2o6sUFRqmo+npA62/z8CsxTtfKUcyUM7
	 g/SkVHIcDoRZ7Q6uSVeqlI0QxhGlNiO6W0+AS/BZqdY0/0kj4x3EAD2SDjdGJoaqG3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005422;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=kfk7ZCeGci9OiZ4Iwnox2bUeO0HWUEyxyZkWqW52+rg=;
	b=Bcy6gytpmsoBIjkGki7Qju/qEwaT4Ju5sFuYnrwKcZjr4EtoO6KN3efwuu5BDNaaInJq
	 REYaoJ0fMvyohly0WmpihPgG1/XJsjct4h7ZGO+X4y5GMWfYXhQNr/2up92286UwLpe9K
	 ifIqD9PFBxjRKVD4ltxji3a9mpk8q1KdkDhEJwH6fmlqEIFPpcvuym/ug1WvWEW+f9C67
	 Rt1rvtzM4Aip+5AOhzg0t+20ucXWrkiE234EXqV5m+G8jK5gwBZpEyGFtA4aM8abbHWSL
	 4zQa8ZOQqym0JcJ2+9MVLtqDnp8qhzByGajICELx5Ic3x+PsQ42L6xkXsUrx5Rp/1Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QuHTDkB1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D351E606D82C;
	Fri,  6 Nov 2026 22:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QuHTDkB1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34CA1F0089F;
	Fri,  6 Nov 2026 22:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794005421;
	bh=kfk7ZCeGci9OiZ4Iwnox2bUeO0HWUEyxyZkWqW52+rg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QuHTDkB1rPmNCeKinmT6V4pcTANj/cHiq/0X0FpkAC4yxX7snJoOSaj2lZzP+pwMM
	 JMbe/7xuDKSl7sOupEQbIDlbocy3YPTikc9VTjnxxqg1EtkbEHKR7BLfKsepG0rfVR
	 Q/a2SPmXMpEq+XT+dP63MIGrpz//Fs/U1AUESmkv69w/BEctswX8GjZLKBnfh2zY5Z
	 Goi+Oh8/7LBVlGYxysYaQ2OVHZORuz3rx1QtnHtPG7coujiy/22kWKKtxSQs+BNYpc
	 Fcgnltso8TP2mDmofPzM/BphoHWI9GdC1yx4gy8BOmFYzBjJCjL3f078VVrKR5cKTj
	 GpQIVTq3MsBEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9B09B3A55EC2;
	Fri,  6 Nov 2026 22:50:21 +0000 (UTC)
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
Subject: Re: [PATCH] selftests: net: fix format warnings on 32-bit
 architectures
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179400542017.914342.7300604920872948742.git-patchwork-notify@kernel.org>
Date: Fri, 06 Nov 2026 22:50:20 +0000
References: <20261103155503.534876-1-sashal@kernel.org>
In-Reply-To: <20261103155503.534876-1-sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 willemdebruijn.kernel@gmail.com, horms@kernel.org, shuah@kernel.org,
 kerneljasonxing@gmail.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  3 Nov 2026 10:55:03 -0500 you wrote:
> On 32-bit architectures ssize_t is an int, tv_sec is a long long with a
> 64-bit time_t, and uint64_t is not a size_t, so ipsec, txtimestamp and
> the tcp_ao library warn when printing them with %ld, %lu and %zu:
> 
>   txtimestamp.c:191:42: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__time64_t' {aka 'long long int'} [-Wformat=]
> 
> Print ssize_t with %zd, tv_sec as long long, and the net namespace
> cookies with PRIu64 as the rest of ftrace-tcp.c already does. While at
> it, print tv_nsec, a long, with %ld instead of %lu, and cast it to long,
> as it is a long long on x32.
> 
> [...]

Here is the summary with links:
  - selftests: net: fix format warnings on 32-bit architectures
    https://git.kernel.org/netdev/net-next/c/205f10778a94

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



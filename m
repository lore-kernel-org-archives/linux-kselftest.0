Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794005415;
	b=MfnZVtFWouk0Dct5rdePj1VRiEB0Kk+ZmZGrEYGFwtU47Hll1wS0pES6h9TvhS1TGe4r
	 G7w+vIDazodRPqfWU+/3p4cFgU6yhpIApcsy6Eo6vTDTwGSt23wcUIgUV5epjfbtzQw25
	 6ntcH21feZxRoq6GbuKN8DJhr+U5eFBLFxeGUjxyuhMH7p0Sf5zwVuPfk/cv6S4/Kf1Sy
	 vdxBOE/Wg/d7oY/vpOvFEsQyWKdJcqq7spV7HsjQTWs4raXZhKl/OVYJ1JirYm+jogjkb
	 2biyYxcj78/JajaXDvlkMeOqcsjxDtR9pcRCU3Q5s60z9YginOtyEi71S2OI0xe7S+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005415;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=oq7Q0sZymrgyh6DArpBQPyCYxYpbptvr9hfbW+1t4VE=;
	b=4kxYmZWeEa/jUdIL4/O7RplZKhU+4GI0DrHkx6JFU6hH7uZc7j3VQ/R/bcsfCitIbsgA
	 OmgEqHYrDsWG1M7Y+JWYqaCLimQhu+bm6YgxKCfPzaKm0CXSzDVdQaV1Vo8dmSnJ5/tea
	 8uOMLFwBf6IacWVzgLvr9cqiVcqnUYqvAbysLS0f64x0AbBkav7ulZNfxPelSc1fdJwg7
	 ZLBNn+mD4phaeMg4j7aZUTIFMkE4I7CZa/9J5wmazRQF4wB9jFno2iGscmEIw/zqhK3Rk
	 BVoVZZLEev31v01TX7x1QVO+lU4lM9yq5NqvL39DUrkTzGH6nkua/X7BN5U2mCuJRbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JP46gEzg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91451606A335;
	Fri,  6 Nov 2026 22:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JP46gEzg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A62E1F008A2;
	Fri,  6 Nov 2026 22:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794005415;
	bh=oq7Q0sZymrgyh6DArpBQPyCYxYpbptvr9hfbW+1t4VE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JP46gEzgO72VU43tad1Q0GDHpk6hfltA7JqenV7QQijxxr/BBfilE4yXkhbzTKE4D
	 PEQHk+MIlE3/MD3T1+KEihhSbJ2uLhocwjJcgFCbgrfWEsUzm5zWmaQCygPJBRLRF6
	 Patp85D+b6p0MWo0bh+wDVnGQa61Bfqj+I/AzYKGL3DwiGQ1+2ftsRylTh0TOmgpwi
	 yDlWyFanYPhfiy+7k8feYDjvuMDT4XOQwfuLt7APcatQouKMFCNnUlcEQDVJbiDWLL
	 WN5HqvoQ+XegiuClqYLB+Qefy8ywFjxYYlhj7sEkVm7dvGKwVxPz/zF1p7MG0p/Y8j
	 JrqybyJ60Qb+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 210693A55EC2;
	Fri,  6 Nov 2026 22:50:15 +0000 (UTC)
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
Subject: Re: [PATCH net-next] selftests: net: tcp_ao: make the netstat column
 pointer const
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179400541366.914342.261781909192561321.git-patchwork-notify@kernel.org>
Date: Fri, 06 Nov 2026 22:50:13 +0000
References: <20261103165419.687806-6-sashal@kernel.org>
In-Reply-To: <20261103165419.687806-6-sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, 0x7f454c46@gmail.com, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  3 Nov 2026 11:54:19 -0500 you wrote:
> lookup_get_column() stores the result of strchr() on a const string in
> a plain char pointer. Since glibc 2.43, strchr() returns a const char
> pointer for a const argument when C23 features are enabled, as they
> are with _GNU_SOURCE, so gcc and clang warn:
> 
>   lib/proc.c:61:16: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: net: tcp_ao: make the netstat column pointer const
    https://git.kernel.org/netdev/net-next/c/f13fc72ba243

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



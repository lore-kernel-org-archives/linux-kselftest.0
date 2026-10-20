Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488009;
	b=0Q8zQ08dWDsjl2B4Q2kHeNv3px4zLW1PAaHmm9IzFbh5HWSw479RNCDhFn1p5y8Pv/2A
	 Z1MRPee1dPkzQnZRgn+/zeIvf10nza3vbAJ3F6QhE2LHECmCCug/kyUsfrrlv20f9nQf3
	 owZd8Q16iqOjm8r45TUbdPKI62s0o9s4Tz+5dtfDeIrAlsc13tXJh1f7nXrbDQVzul3j2
	 vvlfg1+vse8q2wS1HGPk+9TU8sRyNTOaUBXsbGn7bnBIaob9MZvNLg/4CoxIyJn0fyR2+
	 n1tx3ex6YR6KPJkJi4Iy/NTnlBOFN1W9NPisa4XL0fGt6Pns9VzUuigKzgrrKv3wEHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488009;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=5y63LO8K1OCznULxQHwWfMhQvv8jfPHcfHJ8c5j0ul0=;
	b=oHJdixpE6avJ1eggUZzQ+FbYNtrYcIeWz4zygdNcH9WBcR+FLSzKjbmHHjhVccuk1Dpa
	 vS6sht598LP0X7J6S27lmYgxIqPgD7/3HFueq8knlEV+M0mZ5+Tafw7nlieq7emzEPx6q
	 oVhoZqo5OykG9OVonE1W68lLyO0LXJArquUYG3rjsHAzEJQVykXG8IhNtaWgEOF2cJYA6
	 D4mPE7fe0fH0KJfSw2h+AiIbH3EARsfPJlK/cRpeBdDeu+VEBQaC/oDl5CIdsUgb5M1fO
	 8yN7Dk950+Hh4Yr+uNvbT4cteT3tm5WpFBBeJXEHS+cAxzxVXWbBX0M8JgMZA5Y5oMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kEY+wVHT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C76606A331;
	Tue, 20 Oct 2026 09:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kEY+wVHT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA4B1F000C4;
	Tue, 20 Oct 2026 09:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792488008;
	bh=5y63LO8K1OCznULxQHwWfMhQvv8jfPHcfHJ8c5j0ul0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kEY+wVHTeudtPuBhkmpr/azpG6rDUEWGsD/0LxSH9PhEN9Vr92DvgG3YWU5Wb8kMp
	 GmmR/tzccolphTyi4/tQKiXmRg4PZa7hyFaSopkMa/XQCiARR5HXrRd41RbjalBh2p
	 t8Q7lWuj6XrvdZjscB5m6HDjOdA6xAdMNXgBsy/OgWHPiOMDQ+Nl/p87D+27szz9IK
	 yGTzxbKklk3X7NWbH5GU7vdhp6PuFfzRnIluWs3kPu/DNvAto+Qmp7d5EZuRQ3gT4C
	 Up/tsVpvfywBVnrBDxcKsOrSTu0y6ykmLB2suKptbmWonndqDc9qlnuOgKS/sQaE+o
	 BRB22XmMWvSpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 774E43808209;
	Tue, 20 Oct 2026 09:20:08 +0000 (UTC)
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
Subject: Re: [PATCH net] selftests: tc-testing: use $IP in hfsc test 8c39
 setup
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179248800729.3606430.14897745214644926489.git-patchwork-notify@kernel.org>
Date: Tue, 20 Oct 2026 09:20:07 +0000
References: <20261014121414.2373985-1-ivecera@redhat.com>
In-Reply-To: <20261014121414.2373985-1-ivecera@redhat.com>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
 shuah@kernel.org, victor@mojatatu.com, kuba@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 14 Oct 2026 14:14:12 +0200 you wrote:
> Test 8c39 brings up lo with a bare "ip" command. nsPlugin runs it as
> "$IP netns exec <ns> ip ...", and as tdc runs commands with an empty
> environment, "ip netns exec" searches only the default execvp() path
> (/bin:/usr/bin). On systems that install ip only in /sbin, like Fedora,
> the setup fails:
> 
>   # ./tdc.py -e 8c39
>   Test 8c39: HFSC classify walk still reaches leaf after lateral drift
> 
> [...]

Here is the summary with links:
  - [net] selftests: tc-testing: use $IP in hfsc test 8c39 setup
    https://git.kernel.org/netdev/net/c/b6ef0d965fe8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



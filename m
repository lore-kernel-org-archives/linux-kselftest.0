Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795221008;
	b=FUbl5Mt5+N+JiuNPZKFdya1Qeq5qwIWfhai/2YuGmZQqvfl6HY3u1bW1g8BizQGRNrJD
	 ENrV3WgI91p8205z4Q8jsUkPox7yZbWI53DUMPJ2LDwoBglVPXYQulZRiHnBpPq1M84IB
	 yahRYUQ3/I4/6MqIKqexNGs2rs12jDaGpx0lGSE+wFHvYipi5mCPxECXgfGGf70kWP3ag
	 2KcV2YTgwmIT/HQmiNWmcQtUv8LskGdR7lsAntH6wIX4aMmRW/MjpejpE3mJV0qRDioKK
	 BFYc5gJnDTyK5HiDJKBoUzy0xNQFdls2jxFRhcmz2Trf4WJUY5T3DAzwkjeG8/vCQNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795221008;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=bJsBR9xFNxBE9L9/4DqISqmvoAkbXZrq/wuv7yBNLo4=;
	b=ZYTqANAORLWUPg6Ugi5CoDmsP2JzCAOkoLt4BR78841lftyludV4EHCjHmvyYcWQkVtH
	 7hKXmsvppGptB9+GBh/UkHWG1Js+gBVgGKBP+mmeMlxPyLS2Bgwg/hNiEVB3HKYYY6nwj
	 LR00KUktra2egwwKoQutgmzqtnGNjHX9gRLcoUwb5QNocQYUdIJV1nh7BZqEGlJcN2stJ
	 6wGv+phmilNKvXjtTVYu+EmZorAidEd3h6cWxKXI/sQv81+PXsBk4+QWPfezDtJkGYH+G
	 qpcw+doe3ohNEJFFWPjpaLMj6bTTj+2Ync0QaCSbudHYxwoZGqPj1ulMfPc+SlYlLOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fidmq9h3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2494C606A6BD;
	Sat, 21 Nov 2026 00:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fidmq9h3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459331F000CA;
	Sat, 21 Nov 2026 00:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795221007;
	bh=bJsBR9xFNxBE9L9/4DqISqmvoAkbXZrq/wuv7yBNLo4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=fidmq9h35PebspB+dzJPM5MNK1tmMyUr86mXM1wGg92iZUA0Li+TKyVYp27xCQ1Ne
	 TWfaPginIIoUmZjpi8nJa8njwaWCedYfOJy5CNOFe6K0k4GYvImvRe2oEylwerNALo
	 9BlLOKLWPlPUmXHzezvzgyIRUOtiFCdHLNGqUdhMmwsfdNyugrSfvpRADyMyLo73Or
	 orHPJxCPe9cx7S0pW9CYS6xLq5INkqPrrfcKTqqBg1hWP6twaScfBXkL6elCuSVXHp
	 n7uo8vw0VxXKGncihmGOAYgKW8P4kKb/Sy/dMBuLCQ8nocgSNn0l5TxshPAStOLnsm
	 QhqJbP5v0KfhQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A34F380AA4D;
	Sat, 21 Nov 2026 00:30:07 +0000 (UTC)
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
Subject: Re: [PATCH net-next v5 0/8] vxlan: vnifilter: bound a single request
 and
 account per-VNI memory
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179522100603.856366.12879815292143114431.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 00:30:06 +0000
References: <20261114221412.255825-1-alishmery18@gmail.com>
In-Reply-To: <20261114221412.255825-1-alishmery18@gmail.com>
To: Ali Firas <alishmery18@gmail.com>
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@kernel.org,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, kuniyu@google.com, petrm@nvidia.com, aroulin@nvidia.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 15 Nov 2026 01:14:04 +0300 you wrote:
> The VNI filter interface accepts a VNI range with no bound on either
> endpoint or on how many VNIs one message may ask for, and the memory it
> allocates per VNI is not charged to the caller's cgroup. Charging it
> makes adding a VNI, or changing its remote, fail routinely at a cgroup
> limit, which exposes two error paths that leave configuration state
> inconsistent; patches 5 and 6 fix those first.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/8] vxlan: vnifilter: reject VNIs outside the 24-bit space
    https://git.kernel.org/netdev/net-next/c/4d00df6019f8
  - [net-next,v5,2/8] vxlan: vnifilter: clamp the dumped VNI range to the request limit
    (no matching commit)
  - [net-next,v5,3/8] vxlan: vnifilter: bound the number of VNIs one request may touch
    (no matching commit)
  - [net-next,v5,4/8] vxlan: vnifilter: account per-VNI memory to memcg
    https://git.kernel.org/netdev/net-next/c/39508fb293a9
  - [net-next,v5,5/8] vxlan: leave FDB state and flags unchanged when an update fails
    (no matching commit)
  - [net-next,v5,6/8] vxlan: vnifilter: roll back a VNI add that fails
    (no matching commit)
  - [net-next,v5,7/8] vxlan: vnifilter: account the default FDB entry to memcg
    (no matching commit)
  - [net-next,v5,8/8] selftests: net: test the vxlan vnifilter request limit and dump replay
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE91234B1B4;
	Tue, 10 Mar 2026 02:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773109214; cv=none; b=sEdM6gFpAfLiyIezUvcQYLSogkDS4B09KwRdvm7h4pXzGc0BZ4k11QCIM5mObf4MC0XdGIRZwTz9tliYc6esNnMeb0dk8SIgfKvaYE1vbPsXWY1+nnfvqYsaDYgjUzVZ91PfCIxZkqdu+phdrvNkpPQsMA3AyDHv4r+AttObHI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773109214; c=relaxed/simple;
	bh=oTSh/kw+OUkh1tLxiw8JgTdXx/xu9BaWLaXV3ZGgwTk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VF2+7erakDw1e7DR5WJ/LB5MR1n67N18/fkzt3LyYfMSa8DkK+Zauy4K8bWm5zypDTumeOI49PRMAozp9CONzNPFGvgmOftd6XsgP/AJKfkSvmHCQ/YMlNGtPx/eMkS+o5bZk2Irg13NG14vSP195At89UvVQkDYN/KIjpYeF/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MByCov5S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MByCov5S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D21C4CEF7;
	Tue, 10 Mar 2026 02:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773109214;
	bh=oTSh/kw+OUkh1tLxiw8JgTdXx/xu9BaWLaXV3ZGgwTk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MByCov5ShaVqGpSChi4Lj7hvm3LWR1GJ+e8978HUULLhXpJit2ZUVASnRyBXR2C7t
	 vfIk8LQLM/3dlD+SlK6QOpJnTjhRryqJ+cB6RcbWMETzrCmS6mX/MQUZcFFeLb3dE+
	 IVXxYmFC9PoEfdO329YnftrV52M2XbKjOEak4jOQJYtixl0D6saF5P0wMGK/HorRNI
	 1yT7C8xx6iyEpKHOCeeZEQQZmdbFR/ZgotvjdBlHcaanpys4Mq2XDzUM7oHUe4Fy0a
	 E0XGY30Ku6k7TSs5F+gST+c/ONVdGgAb3KXQkuBnoHLnT7soZzjhb3uWAvsq8VMA0S
	 dfeR2YARPSAlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D4A3808200;
	Tue, 10 Mar 2026 02:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: fib_tests: fix link-local retrieval
 in
 fib6_nexthop()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177310921180.2028885.17350447083922952372.git-patchwork-notify@kernel.org>
Date: Tue, 10 Mar 2026 02:20:11 +0000
References: <20260306180830.2329477-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20260306180830.2329477-1-alok.a.tiwari@oracle.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 alok.a.tiwarilinux@gmail.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  6 Mar 2026 10:08:19 -0800 you wrote:
> fib6_nexthop() retrieves the link-local address for two interfaces used
> in the test. However, both lldummy and llv1 are obtained from dummy0.
> 
> llv1 is expected to be retrieved from veth1, which is the interface used
> later in the test. The subsequent check and error message also expect
> the address to be retrieved from veth1.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: fib_tests: fix link-local retrieval in fib6_nexthop()
    https://git.kernel.org/netdev/net-next/c/dc9c9193c7c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A203D39098E;
	Tue,  3 Mar 2026 04:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772513149; cv=none; b=XKsSKYuzyzIDyRF1YspdQPOvP/gNEhdp8TtGhbPjGGhh9/WkifLqiD4bh0oPs6eHXrKVop4DPp6jNNLclNTnJVdlz8BtyGrWg9L3+dXm0iLRPgiYfHJR7WegtLLMJ2sVDFI3PnxBAVyqi4kaGxwxFbjGWV5HdQwUe8NP7/d9+a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772513149; c=relaxed/simple;
	bh=0hHa3PRLNTqZRZb4O0Pqr4m5Ozn7pW0ThAPDCAnQo7M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ILR94P21E7d3WzH/Yr9H/dCGjb7Baw54aEPJQ3VaX/3G5LGpeVuQ4iHgPftoSo5k5mWUPK7zupYVwEfugJZUqED72Kx4j0XxpxNo+uFnDTiQH/e/brFeZbKizawvENknDY2VBDSdJYp4HSILGZGFSLJ+1BV6WZa8kVsLqiUjmAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBGvN+s3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBGvN+s3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D54DC116C6;
	Tue,  3 Mar 2026 04:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772513149;
	bh=0hHa3PRLNTqZRZb4O0Pqr4m5Ozn7pW0ThAPDCAnQo7M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UBGvN+s3hKMujlq13mivY5VP1764tRFFzhNmpVp/rPvzlF3t3G2gD4gu8q78+9/9h
	 J0soVhMX9BbKlquabQifq7dy8IpamGiacXztd+z3Pj2VEM39Ed02EyrzWwuxDGqU+U
	 fUcb1n90V3so3vgEgeSw4ClM+FpKRLkk2zFwtthfk4cpmxrUSL3F7m/S9SX77N/zKi
	 JK+LZLqdNQ3MKKEz2sS197yxVl7V6CdFkQbaiD6tp4xUeowjmBC8iE/yqlUEWyvL0K
	 k24Z4LaeHiIvVHyaq3riUoqljFvbnVw6laBWbeAvOFJvXLCncKdMHUw2R/WAazGvE/
	 GnRfHyq2UGRyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02F0B3809A80;
	Tue,  3 Mar 2026 04:45:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] selftests/net: packetdrill: restore
 tcp_rcv_big_endseq.pkt
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177251315080.625663.5571489173567456265.git-patchwork-notify@kernel.org>
Date: Tue, 03 Mar 2026 04:45:50 +0000
References: <20260301-tcp_rcv_big_endseq-v1-1-86ab7415ab58@gmail.com>
In-Reply-To: <20260301-tcp_rcv_big_endseq-v1-1-86ab7415ab58@gmail.com>
To: Simon Baatz <gmbnomis@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 01 Mar 2026 09:41:33 +0100 you wrote:
> From: Simon Baatz <gmbnomis@gmail.com>
> 
> Commit 1cc93c48b5d7 ("selftests/net: packetdrill: remove tests for
> tcp_rcv_*big") removed the test for the reverted commit 1d2fbaad7cd8
> ("tcp: stronger sk_rcvbuf checks") but also the one for commit
> 9ca48d616ed7 ("tcp: do not accept packets beyond window").
> 
> [...]

Here is the summary with links:
  - selftests/net: packetdrill: restore tcp_rcv_big_endseq.pkt
    https://git.kernel.org/netdev/net/c/3f10543c5bdd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



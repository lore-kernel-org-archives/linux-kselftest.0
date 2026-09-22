Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04BA2580F2;
	Tue, 22 Sep 2026 00:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790037674; cv=none; b=nAUHJGN2yrL4ttT08j/UoSZ7DmdEv8gMzqN8l3DZqWFuL3n0zJ/5H0Jwewt12PK2AobjPfeX/tNLWlOZNzAL1saZfWKQRWrgv/p5coqnbNKQo5MKtE832Z2tsswooDotbU1ZA4nLYtSO+as7ArnjYkK3tX9edsfmru4eRPDJ1gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790037674; c=relaxed/simple;
	bh=7WMtoxMfp9iuadpmf1+6I5cZsEe/LoVArtKwionLqg0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RQ//VAN3VrRdqits+q/R1crXOQId/PDxEhdRn82/gj/Q5mD7Rae7kWKLbHJ9Oj67C8RcjMeh1CF+RTpqMYycejnt5TOoFTpxG/d9raMgpg+LRqZMU8+jJzfzhmyX4kjpDLz5WBqsSKsIootTGuuNCSR4S3ttwdYtuDybi9xKj78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8bWF5re; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8bWF5re"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AD21F000FF;
	Tue, 22 Sep 2026 00:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790037673;
	bh=RqZ2DjvArY1upDnTuUHRuqSN87mcqUp9AUBiPNdpbjI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=n8bWF5reR+xw7+zgsTd2C0A6oqllHzKlqeV7HtFgrqij9mzZRQQspyPAMU0J/Qpvp
	 aUuCrcGeiyzwuLOz9i7f4+AZW55i+/m3iZMHr2PU/Uy0maTDpgcXxxkL8WAF8dQdD4
	 vzCdQT8e9C3wM3h8iMxxdTQNTwGsYRCvKQZMcmj0p7JmqXu5DtGy8RkmFG8JYNY+ao
	 qwlG3ytpC2A8ewjl7QuOVl2Mf4NCH7QegP+8Rty9NZIR4AXG72gXdhIAQ/6Vf//RzC
	 nTOsAK3hn9ewv+1dfI4dmdmaF+QK8oeH8TUKHc0OC8du88dguI9OFeqIrGMU3vYt5l
	 QHB32Wck8P5hQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B003930203;
	Tue, 22 Sep 2026 00:40:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] selftests: net: fix CONFIG_SYSCTL sort order in
 configs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179003760470.3308999.1992968258415011140.git-patchwork-notify@kernel.org>
Date: Tue, 22 Sep 2026 00:40:04 +0000
References: <20260918-selftests-net-config-sort-v1-1-968ea6e8c1b7@gmail.com>
In-Reply-To: <20260918-selftests-net-config-sort-v1-1-968ea6e8c1b7@gmail.com>
To: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, oleg@redhat.com,
 joel.granados@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 18 Sep 2026 22:49:30 +0900 you wrote:
> Commit 8d75c338f0bc ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors
> CONFIG_SYSCTL") renamed CONFIG_PROC_SYSCTL to CONFIG_SYSCTL in place,
> which left the entry out of alphabetical order in the net and
> packetdrill configs. The netdev CI check for sorted selftest configs
> now fails for every patch that touches either file.
> 
> Fixes: 8d75c338f0bc ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL")
> Assisted-by: LLM
> Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net] selftests: net: fix CONFIG_SYSCTL sort order in configs
    https://git.kernel.org/netdev/net/c/be581d663557

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



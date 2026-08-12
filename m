Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A963372B50;
	Wed, 12 Aug 2026 01:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786498890; cv=none; b=OacwZ5+1UiDnEHzP5SmaEZg4usaoM7gyGExertzimmwQrMdW1oS/a0ubGntNkGsyEEzPEErQFJqCzaU4gAbWUwoHBlNolLch82VJvVv9zDepJDBUwgDgGJJShiVpkdjeLCo9HGa9Kwy5r9j4yqgTC1fB0uJ+tsSz8qbbj1AokuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786498890; c=relaxed/simple;
	bh=/QFNZ3rYIvJdrIk9tqWZAH3M5OrCXJdh1vp1XT4ydMg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DK1/XCwxjdo8rvTAI6ULJ5kIeHkxYAc+ElZfYhzTAOZBtMptrGNTfsCKiDwD4y12K/nNHxNa93fJrulwFvU9uNOUqrWPJWgpSG54TN3CLun+ZmwoOijBGSKhwIUoIRj8GgGfbnkLfxmUQSBJgSO1Uao0oxX4l61aPit3+15Z31w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8tkZ6sw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8tkZ6sw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E9E1F000E9;
	Wed, 12 Aug 2026 01:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786498889;
	bh=dwyfCgf0wh8bDzoxNJiM1CqBKVjN1uwC+r1tb2jnWt8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=f8tkZ6swDCm3Csp2nd2XlX98uo95/nzLyfpLXlskYzCDtDuwxPmnTT4SUZNtp/ARa
	 Lda/Nk1AVRngPeGXRvPLcGcE24uT0RCZu03kU2cIIt4Rto46V7iazGLSkrOdsGaaxU
	 38Ky7rxm0PEkec7NLNzDEvOn58AqB75to4Vu3iKcCJlDKKeLtowQMkyRCsJOCjg0f5
	 pZGnXLR7TQga82256IPrRA3by0NwpuhhUe4F7/zADAtQ4SrjpGngDwIDs5ScAR+/ry
	 Pn/Qdfg7ExKaaOPzJWDB2MiA1ttu0XaAU0O9h0aLwFxGkKAWIMJKMV+5Q52427wHOY
	 BrL0RtuLRWRkA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 197C93809A3C;
	Wed, 12 Aug 2026 01:40:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] selftests: drv-net: hide the devlink
 port_split
 test
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178649884463.1230679.5255640578685529301.git-patchwork-notify@kernel.org>
Date: Wed, 12 Aug 2026 01:40:44 +0000
References: <20260811004645.1072124-1-kuba@kernel.org>
In-Reply-To: <20260811004645.1072124-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, petrm@nvidia.com,
 danieller@nvidia.com, shuah@kernel.org, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 10 Aug 2026 17:46:45 -0700 you wrote:
> The devlink port_split test has limited applicability.
> NICs (as opposed to switches) require at least a re-probe
> to apply the split configuration.
> 
> On top of that the test is not compatible with our driver env,
> it just splits all ports on the system, not only what NETIF
> points at.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] selftests: drv-net: hide the devlink port_split test
    https://git.kernel.org/netdev/net-next/c/878b56de01e2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



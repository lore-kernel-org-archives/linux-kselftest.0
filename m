Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2C1175A87;
	Sat,  2 May 2026 00:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777681257; cv=none; b=o0TJYsRbphABF1x1/vJu9D4mxgQniC1WBUZ5viPNaeNvAKT4j53J9LA8QvcNrhgrMIjp2qoui988dY5fCiu/hhWuploTZA1e8pqxfaf9nC51+RLArwMkF2envlYKDFPo1X97trIlFXYBRj0qbHQh8fm4TGR6umWcTVOtw+R1s+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777681257; c=relaxed/simple;
	bh=ep4QXwIRZE2I4OvnK+628xwa99YHht0PXylXoEYyX/Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qQnsgLd8PGKOjsQrtgELTGYiMrmgWE3b03z/oIuwOsLCIzrDFOTUVmr8FBY3lG4PrA3eCNzz9/h7nzSMYOJ7YrG70klbMrt5kxbZfRBd3PPTzW/GtazXwZgkjuq5vhi8Hgi7Agefm+lLeZnJ7tvspnho8dkLXUrWtybNa8DyWII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxA2BAv1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxA2BAv1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B5AC2BCB4;
	Sat,  2 May 2026 00:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777681256;
	bh=ep4QXwIRZE2I4OvnK+628xwa99YHht0PXylXoEYyX/Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QxA2BAv1z+jQl2YLgYfqLA3Xt01U1WrHLmo2HKhghHZfDS2LxkzerKr2dqjaFOmhZ
	 SSv46dQbuq/2haDcpiHCcL9S7S80DEkMxklDWKKBXOP84k6gaEWY/uHVKAI7xG3ruV
	 lgVlSlSBzGLdFvcs1Nn+ZHSjmK6gFjQNXn7XVjyYmMkliGBat/57x19r/USOY9f8VT
	 KXn01gNCFQQNgD0QO2LZkpMs4fLAzqchOvrjGYmhKzIlxsvFxvrvMiLoF0XSNQJ4Zh
	 /CpCvSGgBoX7GJZ5OLRMl8HnvvRq0ftwe2uYkjXhPDp+MaAiTAbVQIzivhHkSu+lkH
	 SQWxeIB/JbWug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FF2C380CEF5;
	Sat,  2 May 2026 00:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: drv-net: Enable ntuple-filters if
 supported
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177768120979.3671363.11481466980694696257.git-patchwork-notify@kernel.org>
Date: Sat, 02 May 2026 00:20:09 +0000
References: <20260430165217.3700469-1-dimitri.daskalakis1@gmail.com>
In-Reply-To: <20260430165217.3700469-1-dimitri.daskalakis1@gmail.com>
To: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Cc: davem@davemloft.net, andrew+netdev@lunn.ch, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, daskald@meta.com,
 dw@davidwei.uk, joe@dama.to, dtatulea@nvidia.com, vishs@fb.com,
 asml.silence@gmail.com, horms@kernel.org, pavan.chebbi@broadcom.com,
 michael.chan@broadcom.com, gal@nvidia.com, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 30 Apr 2026 09:52:17 -0700 you wrote:
> From: Dimitri Daskalakis <daskald@meta.com>
> 
> Certain devices which support ntuple-filters do not enable the feature
> by default. The existing tests will skip (if they check for the feature),
> or fail if they blindly attempt to install rules. Therefore, attempt to turn
> on ntuple-filters if the device supports them.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: drv-net: Enable ntuple-filters if supported
    https://git.kernel.org/netdev/net-next/c/c301658dfe08

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



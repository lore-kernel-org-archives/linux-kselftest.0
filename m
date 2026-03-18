Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DBF348465;
	Wed, 18 Mar 2026 23:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773877813; cv=none; b=qAfm0wOhNuiApkSOEwF5MmH/UMdQO3OPIOjKL3gxWQz/MkUu4pT3+pkqrAwDAnC2Yr2tF8irsGH4GA3yCzPnaDScdHIZ5xuaJ1tczw1PN20fb7eeZbRtHhMFQxBvsAXbP7KMB5ABNsdYT9ywWgxbMVYErigq4CURlPvVUxyy2IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773877813; c=relaxed/simple;
	bh=5JA79JU19f2KgNteNjpjuxJsxAP+LSqy9JcrAphS25s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=M0EjDbCWexTSbRC39Qw8rEvUqRAAb7yDPrlkaGuaqFey/x3gG4SdT7xjdSAAvY3mNLNj7x/yDfgo9hYM7KOHx9E93fwjF+Fimzgwzg71t7/Lt1/1BDeamhfJzagYkWGH9Ea0HwjWzpKhxOdpxeawBeIYkK6gO8MyQ+K7iN7Geuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYZXPodG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYZXPodG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3C6C2BC9E;
	Wed, 18 Mar 2026 23:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773877813;
	bh=5JA79JU19f2KgNteNjpjuxJsxAP+LSqy9JcrAphS25s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CYZXPodG7HB4rXy9vESx/he9B3zxcT7mwI7s/NBHgiDu+D6+Prx4H1Q9wrdAEtWH3
	 WiPvxxprGrnQTblG6EWLaD2ICP4QC6V3DSQ/jD7ENuMJRRV83UqhZrggIE5LK2iBxF
	 lBX3gLemyjl/A+OgMgHpqErEzqQjHHZTR3sFQonpXAdKpoG7fs5FY+O93bRxSMbSL0
	 UKb3zf/HnmrRklCQfA0z4zGzCsXQ1VpJT3bI6Qja6U5VtuDtl18cIk7iy8rgBOYd3M
	 m9H1coTn2sjdRlwu+xbN/Oh+HqDHHW++Ow4oE2qiDFX8RqnbfeHNOBbDdsWupOVV7A
	 WylriGkhAMNIA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E923808200;
	Wed, 18 Mar 2026 23:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] tools: ynl: rework policy access to support
 recursion
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177387780455.929276.520388067019747283.git-patchwork-notify@kernel.org>
Date: Wed, 18 Mar 2026 23:50:04 +0000
References: <20260313232047.2068518-1-kuba@kernel.org>
In-Reply-To: <20260313232047.2068518-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 donald.hunter@gmail.com, shuah@kernel.org, sdf@fomichev.me,
 linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Mar 2026 16:20:47 -0700 you wrote:
> Donald points out that the current naive implementation using dicts
> breaks if policy is recursive (child nest uses policy idx already
> used by its parent).
> 
> Lean more into the NlPolicy class. This lets us "render" the policy
> on demand, when user accesses it. If someone wants to do an infinite
> walk that's on them :) Show policy info as attributes of the class
> and use dict format to descend into sub-policies for extra neatness.
> 
> [...]

Here is the summary with links:
  - [net-next] tools: ynl: rework policy access to support recursion
    https://git.kernel.org/netdev/net-next/c/17a55ddb1956

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



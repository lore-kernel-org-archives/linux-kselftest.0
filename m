Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7927B4F0558;
	Wed, 30 Sep 2026 00:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790726408; cv=none; b=pZHGRWNOupioJlopAuhhBHajj1HM0OY64huMcDFKm1IF+nvqmygXz8iEX5LvPmMh/pdmkDNpPk8MBzxlAig71nk21oo06KOrxGvwVI7cfmLyJRdZV6U2Wn/vIDbusMrSvRywBQqZ+awar+5Xnr1yRi1VF9fz+FXWD1/MLt3oek4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790726408; c=relaxed/simple;
	bh=TZeSj+fHNAiwPHF9/XwUVCs9Y+cih8HuKWjhCp7w9YY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=g8wYz6OonrRPs3hmB5pIyTw9USHJV75fvvB+c6XILzM7Z0+J6qN5tFkVB0riZpmD2RhR9s9AmASd3nvgLAgN/EsBEEoZXhiYW68S1oL07QEmYuXwYPHCtBDgspBdHfAPNIr871tVGjs2MXmOi6gywwu8HtvRO1mSSYIHS6a8rXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5owVWuG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5owVWuG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A60F1F00893;
	Wed, 30 Sep 2026 00:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790726407;
	bh=B5RRyMKFDlig0DPrO6Mnd0x4gvEt+2HEpUuDZ5zC5C4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Z5owVWuGAqxYHTPm8CFjqTkSNcJDSMkCgloIeTqsMdHCu6MKxI0EarHU+gJQVMZ2q
	 YbUjO9NHGVvnG9q5ONarYfh5JuH3rgk3vvZOp20EsEByKt4K8SbN8qeNG3oafMVEzR
	 6TyhgBUsa9M25z+8BllJHWsobywgY6LIehVAS2O9tCMHL+7nqg1lw0Enippfn9MADK
	 YeFHb5y8lqntdpITft0Vy28kRX+PEBzeACrmvLe15ve4YqxOtHXYqC+cGfNlnP6u0/
	 4I6HJOjfzt4ms185G4Cm8j5rKEgmx7XqK2JpmxwNYJRIvBOEKqKwQ+klUCyaTsA+5+
	 hWAw70ItstANA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F161A39D5FDD;
	Wed, 30 Sep 2026 00:00:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 1/2] udp: fix auto-selected port colliding
 with an
 existing SO_REUSEPORT socket
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179072640545.1172483.6005581645683359247.git-patchwork-notify@kernel.org>
Date: Wed, 30 Sep 2026 00:00:05 +0000
References: <20260928023145.301855-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260928023145.301855-1-jiayuan.chen@linux.dev>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, stable+noautosel@kernel.org,
 willemdebruijn.kernel@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 therbert@google.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 28 Sep 2026 10:31:41 +0800 you wrote:
> Observed with two independent servers in the same process:
> 
>   fd1 = socket(AF_INET, SOCK_DGRAM, 0);
>   setsockopt(fd1, SOL_SOCKET, SO_REUSEPORT, ...);
>   bind(fd1, port 0);          /* got 40000 */
> 
>   fd2 = socket(AF_INET, SOCK_DGRAM, 0);
>   setsockopt(fd2, SOL_SOCKET, SO_REUSEPORT, ...);
>   bind(fd2, port 0);          /* got 40000 as well */
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] udp: fix auto-selected port colliding with an existing SO_REUSEPORT socket
    https://git.kernel.org/netdev/net-next/c/20d020a07536
  - [net-next,v2,2/2] selftests/net: check auto-selected port with reuse options
    https://git.kernel.org/netdev/net-next/c/883c308be425

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



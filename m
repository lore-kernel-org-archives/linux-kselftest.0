Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AD535975;
	Thu, 27 Aug 2026 20:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787860871; cv=none; b=Je2YmJWRZQRF14m1DMo71miLTI/SPw0buDE7mh5aBLrG3tBDGyEqqCOvoXgssel2hSpVVsXnS6NOAMNskGKUbschJvYrunuq6tQMuhlgyDbn5N/Dn82KkDllvpTM9RASSeqP45I8NEM2p0TaSu2pupvaO1LKDCCHU4FH2C59LQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787860871; c=relaxed/simple;
	bh=nLnDL6iCGmYZ+X1G5NjM9C3fc3u18fx7fE/3tvhf/qQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=InmvlVjgaYmyqIvHh8cDVoL+emvAtbzLp/Q94Zaz6Xa9CCOWZeh+jllvDMGDDVTCSlx/yWLuyUZ6CVERaitp+GUdlJWtlHS60rdmaMz6L3jwFZpMGSAdqUQ9l54r9xs9js+dXmIvPGYjog6fPl/yj+iFFjE6zkFCdvdq6eYInbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBKE/+jg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBKE/+jg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23B21F000E9;
	Thu, 27 Aug 2026 20:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787860868;
	bh=Jr3YzkKn1AKKZtAkXaou55vEY9E/Ugb5WVls1H19Tfs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QBKE/+jgJJImSrcFd10cxP4wcrsV8AVdYk5N/fZ2/AN/O8l5rr/QOGAtcZTaIQ/hD
	 S7KNM3n4V/ZFAptuID90sVBK/e0ZMvMka7Dw027oYpEEgxObH4QPHPb36wOU6ykmX+
	 Gub+gLaxZoUMvQKZt18wlo9FZjx6hoSpB+Hw94xjWWzWRDNEovGnSJO+aBeY8PKuxt
	 hBdGEd/NjZny3NCq6NetOw9JNSPNEM3YooMSS7jN6K0x3bhM8zMEirtKGLlTPJiO5P
	 fiXKTDWhEWc5+p6Zkb/PLiU6gC9GIFxjG8yVeyNH9VKrDIZCP32HBIqUXbCNnrNgwt
	 bffKqW/eu2wJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939D73809A8D;
	Thu, 27 Aug 2026 20:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 1/2] tcp: fix corruption of urgent data on
 multi-segment
 retransmit
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178786081439.1822702.13897009869068904545.git-patchwork-notify@kernel.org>
Date: Thu, 27 Aug 2026 20:00:14 +0000
References: <20260826141145.67823-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260826141145.67823-1-jiayuan.chen@linux.dev>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, ycheng@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 26 Aug 2026 22:11:26 +0800 you wrote:
> On the normal xmit path, while in urgent mode we refuse to build a
> multi-segment TSO packet, so every segment gets its own urg_ptr:
> 
> 	/* tcp_write_xmit() */
> 	limit = mss_now;
> 	if (tso_segs > 1 && !tcp_urg_mode(tp))
> 		limit = tcp_mss_split_point(...);
> 
> [...]

Here is the summary with links:
  - [net,1/2] tcp: fix corruption of urgent data on multi-segment retransmit
    https://git.kernel.org/netdev/net/c/ce2b807f42ed
  - [net,2/2] selftests/net: packetdrill: add tcp_urg_ptr_retransmit
    https://git.kernel.org/netdev/net/c/6a7e91f890ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



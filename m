Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38424361945;
	Thu,  1 Oct 2026 00:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814633; cv=none; b=OMh0/nXsF8GO2PB6GdZfCza8O7v2Ch2RlTpRYbN+FzqyouT08ZoAKestJ2uOVNWTKUbbwwGpwXX/jGIef6f4VIgEeDdMwB87qGQINdPLqZjVYb24VaAnabl5lHCpjEnOMNFinL0dHK0+G067cSjgHUyv6/WDU4559paHdRu0g/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814633; c=relaxed/simple;
	bh=Io9XRw9085n6HprCix5InZlE5PTSFJmwAC62HSZE3PU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AiB+IB+SKL1vJbBQS3SLFrYlpZ/lQfb2m3VDxwxPqK9Kv9SOVEfPuSEdCni5QGuUnvevgRwQlmLtFS7Wl+3DpneuWJd8iWc2pDZs/DfRvkwMm1TfsFVonr9Lmh3cCCz82ARb02LipdBVkCNViaZibS//70KxmQv1liQBdhjRT1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/EsbUs2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/EsbUs2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBE41F000FF;
	Thu,  1 Oct 2026 00:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790814621;
	bh=5rlV6Cu40VfdWQZttJDmAmTE+aTUJchEDgIpgFDVVcI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=O/EsbUs2U2zdRXUCWeRLzEOV4lbR2V1rmBW2p6GTnxnZOl2zQjCj7dUnCL0P+B7c2
	 gNMEUVdTJ+KpObRLoslF6ZgW5m6y3uYHyAE+u0mzVxYEH8g3M7Cp7qYVB47mE9Yf4i
	 /DXOY2ejiGAAzT+5SRPUyc0dJJCpdu5NWlfIX+8yeMsiB71hEHYhy9U30sF5s4rmv9
	 TLnmmi2531ZCMX2dG8L+WdZMXMARlYudU51S4GhEk+P9G84HfcbI6pXFXLWCdWgIuI
	 xT64nH11B7+qaEPeIQTF5G7kTNEOfC1ZjKbd9hkDx6AxD7jTZyby83pd2NTnc+89lM
	 8t7r7/NrzgkiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D1D723AA6A61;
	Thu,  1 Oct 2026 00:30:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/5] fbnic: Support larger RX pages
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179081462052.2189941.6876682885439352016.git-patchwork-notify@kernel.org>
Date: Thu, 01 Oct 2026 00:30:20 +0000
References: <20260925104417.2325213-1-bjorn@kernel.org>
In-Reply-To: <20260925104417.2325213-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: alexanderduyck@fb.com, kuba@kernel.org, kernel-team@meta.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, daniel@iogearbox.net,
 mike.marciniszyn@gmail.com, mohsin.bashr@gmail.com, sdf@fomichev.me,
 bobbyeshleman@meta.com, daskald@meta.com, bestswngs@gmail.com,
 maxime.chevallier@bootlin.com, jacob.e.keller@intel.com, leitao@debian.org,
 cuitao@kylinos.cn, asml.silence@gmail.com, dw@davidwei.uk

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 25 Sep 2026 12:44:07 +0200 you wrote:
> Hi!
> 
> This series adds support for large io_uring zero-copy RX buffers to
> fbnic.
> 
> fbnic hardware consumes receive memory in 4 KiB device pages, while
> io_uring may expose a larger software buffer, such as 256 KiB. Track
> the device-page geometry per BDQ, represent each large buffer with
> consecutive descriptors, and decode completions to the corresponding
> offset within the buffer. HPQ keeps its existing PAGE_SIZE geometry.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/5] net: Add netdev_config helpers
    https://git.kernel.org/netdev/net-next/c/c978ff0f1e85
  - [net-next,v4,2/5] fbnic: Track BDQ device-page geometry per ring
    https://git.kernel.org/netdev/net-next/c/0d5c23f827d3
  - [net-next,v4,3/5] net: Revalidate queue config for ringparam changes
    https://git.kernel.org/netdev/net-next/c/f092b749e11c
  - [net-next,v4,4/5] fbnic: Support larger memory-provider RX pages
    https://git.kernel.org/netdev/net-next/c/54491a1dbd68
  - [net-next,v4,5/5] selftests: drv-net: Request larger zcrx buffers
    https://git.kernel.org/netdev/net-next/c/b7fb14dff027

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



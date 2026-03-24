Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3866221FB1;
	Tue, 24 Mar 2026 02:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774320017; cv=none; b=IfBoRZPRb/xm5euSz7ufeSPtf6U50oKbXEPRO0NcNwnuW3mUHN374MBy/hCDsrQD1l5aqRsOdkYe2UYCiZdmrRqHiInAF7ojtpX4MJ2g3YsQMpfFPYXgI6K1MyYm20005TaFKYBUmxuQVaInHhgwqWh6FgvTPvi8lUvmYwGFl1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774320017; c=relaxed/simple;
	bh=jLMwkM/Kk6IXGfECYaTeFhRwCR1+gPXUUrmg2hEjYgc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=aBNss78o5lHjHR5isqra84Nnfxq1WaC3n6c+vdNa1prawUEMOiezUo+EBytj0dctfT7gM5Zbp8GcH6aOaOAny+SIPTQwKDiwFyx+XJhiHM7bSRGCEYty1iSkLmMp0bD4HMmTiNp1U1/XZWAkhGohryK0Elg7KCaj9XVrIzQDFss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cieswuf6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cieswuf6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A770C4CEF7;
	Tue, 24 Mar 2026 02:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774320017;
	bh=jLMwkM/Kk6IXGfECYaTeFhRwCR1+gPXUUrmg2hEjYgc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Cieswuf62v3k4aOiEo9F9vx4HJ0OQbk3+pzODXSgfQUjIjYTHZ+Y+iYQ+agvOoX2i
	 xp9MpDSSCfeuUtTHBuPSYfqIiWwDZzs5a0e2lHHLXr8N0knYj6jD5cZWu8r2SphIcT
	 4VAYLP/R8KMTTy2/+CVEZa2VrcabFZKdEo0GW7kjc4GWVytXsXfqU2xBQ7+nHOEQB6
	 RzfAy9j5XYrA/j7g8dfF+OohF+2kEvI+WeJHr66d7x084D2dmePJqhq3B0VylTWwus
	 ByoZAcKEnfTFyQg7MlElRM6l+bDE5Op3DAmccpjIFdClACGPJZ69kolfSMc5F9Jg0P
	 QTHxLYLnJuAxQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E913808200;
	Tue, 24 Mar 2026 02:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4] selftests: bonding: add test for stacked bond
 header_parse recursion
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177432000554.430232.17307373899036604056.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 02:40:05 +0000
References: <20260320022245.392384-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260320022245.392384-1-jiayuan.chen@linux.dev>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, jiayuan.chen@shopee.com, jv@jvosburgh.net,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 20 Mar 2026 10:22:39 +0800 you wrote:
> From: Jiayuan Chen <jiayuan.chen@shopee.com>
> 
> Add a selftest to reproduce the infinite recursion in bond_header_parse()
> when bonds are stacked (bond1 -> bond0 -> gre). When a packet is received
> via AF_PACKET SOCK_DGRAM on the topmost bond, dev_parse_header() calls
> bond_header_parse() which used skb->dev (always the topmost bond) to get
> the bonding struct. This caused it to recurse back into itself
> indefinitely, leading to stack overflow.
> 
> [...]

Here is the summary with links:
  - [net-next,v4] selftests: bonding: add test for stacked bond header_parse recursion
    https://git.kernel.org/netdev/net-next/c/e81cf512c1bd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



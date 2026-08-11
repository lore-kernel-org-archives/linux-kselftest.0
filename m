Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3328F40F740;
	Tue, 11 Aug 2026 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456263; cv=none; b=O8qbHG2ahQBNMc6r1kmUJa+1EAYdHLbU9SHCJFWr73oKmv4/E+DtFLc2H5eFBTjSDxeOZ9u7DzfoB3plABJHTNKJwQA6SCnFOq0jO3zYPnrWmXPKOKttMLookQFVKR68fiSM5OY5MC5QOpp+R0v8ZxLKJz9OSXj64kasbBkRSLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456263; c=relaxed/simple;
	bh=XQnR3FwMk43aX3E6wiqFSGbhBRnjD7g3DycvM9/dCuQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=D3X1GMCGYzNFpsDo2uRkqzHsq02OFJLhb/E49OxAqioYElSrAzwM87sYKXb7amOaKRupPJrf/1bTox4514OA76a5UYb8hN859notoEEfrviUAlBPYuoaCimPsBoQnsndpPqmDjU5/s1ONm/mHi0DVXttJgPBQHCzSyUJmofO19k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCdElYSt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCdElYSt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32D61F000E9;
	Tue, 11 Aug 2026 13:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456255;
	bh=BIbM2EuvbgXn7Yp0pCHKcZ2yAr1UuFLoWeHyxVzgAVk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jCdElYStzQpkBAscxnOGCuZvQEdKZKxSKhdD2ZVZILD0opEWmMOsOJxHqd7VuMaKu
	 cNAJ5QeAqzl3FuEH6UNeTkmneJtknnzAi3A/q/yIHmYHGEM7hkCQYQS+IJhMoRKT+Q
	 dIynMCPFs3qB8gtLrAD3OnPebVFw2SyLvuUhyjebPEVw6UiqxpXIbpc3nrvvDoi7zQ
	 slvuHz5zqNgvfeJvYet+JjCyBnNVcJLkxOtgj7IZ0BA/N1gUfIrOr73uPY7ZbfJcJJ
	 BTF70TVm3ufEXZAWDb4H+f/Th0V9zkfwgGKVkkoW0POuJzusj82pxSi0WsmKpdpwhc
	 qo29UujUZ3bSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568EB3810900;
	Tue, 11 Aug 2026 13:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/2] net/tls: Fail splice after a failed async decrypt
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178645621096.532553.2035307199203449109.git-patchwork-notify@kernel.org>
Date: Tue, 11 Aug 2026 13:50:10 +0000
References: <20260806-tls-splice-crypto-fix-v1-0-a2624005a286@kernel.org>
In-Reply-To: <20260806-tls-splice-crypto-fix-v1-0-a2624005a286@kernel.org>
To: Chuck Lever <cel@kernel.org>
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 06 Aug 2026 20:44:06 -0400 you wrote:
> tls_sw_recvmsg() and tls_sw_read_sock() both read ctx->async_wait.err
> once they hold the reader lock, so a record that failed
> authentication fails the call. tls_sw_splice_read() has no such
> check. sk_err does not stand in for one. The first reader to reach
> sock_error() clears sk_err, while async_wait.err persists. A splice
> therefore keeps delivering records on a connection the other two
> readers have already refused.
> 
> [...]

Here is the summary with links:
  - [net,1/2] net/tls: Fail tls_sw_splice_read() after a failed async decrypt
    https://git.kernel.org/netdev/net/c/976df67f463d
  - [net,2/2] selftests: tls: cover splice after a failed decrypt
    https://git.kernel.org/netdev/net/c/8a4222973913

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295BF344046;
	Thu, 24 Sep 2026 09:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243492; cv=none; b=sFE7LWqNe1GRCUXuY8m4ejQwW5e1qqgcwdUSiC0ybVVHecuSm3uMGyDg2ilf1BaS3vCe9XAukv4egpft2BZlArthpCUCHDdNZsiHQdfyn/+ryOl7sdTB4BmkQvl8YO0J2nXytNm54N/5/ZZ0J5v6BAM1/1ak5UhAluScnNwTvsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243492; c=relaxed/simple;
	bh=ZY33p742c5s+IhOdnZaWs8PxNA91JYu/vNkdjuKAZlg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=H6O5u9kXYZZUCDt5fLaehn8lc7qk4PyRAmYjKu4Iox5CzRCqfatt/DYcGeq4AatPNeovB8V0cuJAm8RCGfGMKDphjpi7/gzrCCe5aOCyjUbxj65AhmR8+VdETtWtAqR7eYr/uM3qN+Y21TESnIgMMzbvD7BmK6PNPq+An91Y9uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JxNDxRly; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JxNDxRly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32771F000FF;
	Thu, 24 Sep 2026 09:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790243478;
	bh=0HKf48JwOM0/bONEUgVSYt5R5KcIHOz7ZZ2M//mXHYc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JxNDxRlyzjvQuf0YiJZ88ZB7db1YuuSWtoz4y9xcOB7MHN3lo5cofv+sMHOlM9sJ6
	 oDtiD7WNF+97EYhY/EZvhAPUM00ywqj1ydLnqYTMdS9+3LMqYSf1S+GfmRhQOsw0FA
	 S7r0FV5ZX/uQtSgf4kAqdWvSufjSENJk7LF1rh39kKxNKzrv2ocBXjOSr8NZtlWF9N
	 3geX5VwIjxiJCAM/a5Q05/jSEM1cZEit5K9jln7OrDWJfHKLWeCruAjtSrv6gMU9eK
	 gPpFRBKcukoBfXY+P/MCrkT1mN1L92aOlrSa8AOYdAQmBKNXB0/xdkhg417jjowieE
	 zgWmelVG4j4SA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5677939EB064;
	Thu, 24 Sep 2026 09:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests/net: packetdrill: check rcv_ssthresh
 vs
 scaling_ratio changes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179024340815.1438212.13121071424202164830.git-patchwork-notify@kernel.org>
Date: Thu, 24 Sep 2026 09:50:08 +0000
References: <20260918045021.42138-1-zcgao@amazon.com>
In-Reply-To: <20260918045021.42138-1-zcgao@amazon.com>
To: Nathan Gao <zcgao@amazon.com>
Cc: edumazet@google.com, ncardwell@google.com, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, kuniyu@google.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 17 Sep 2026 21:50:21 -0700 you wrote:
> tcp_measure_rcv_mss() recomputes tp->scaling_ratio from
> skb->len/skb->truesize and updates tp->window_clamp accordingly. Commit
> f5da7c45188e ("tcp: adjust rcvq_space after updating scaling ratio")
> made that update go through tcp_set_window_clamp(), which also shrinks
> tp->rcv_ssthresh, so every scaling_ratio dip cut the advertised window
> as well. Commit 0e125ecfe20c ("tcp: do not change rcv_ssthresh in
> tcp_measure_rcv_mss()") restored the plain window_clamp update.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests/net: packetdrill: check rcv_ssthresh vs scaling_ratio changes
    https://git.kernel.org/netdev/net-next/c/6516ac5e6b16

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



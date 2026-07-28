Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82795224AF9;
	Tue, 28 Jul 2026 01:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785200453; cv=none; b=mPmJCXtr6SOWiIH+MtpKHg8OQHi3fEgZFgI5VRpxmJzYOcYsAwoxadgrDo/FH3xv1zSQCMSQ53YbKeHtwprMqT0Eh9enO82qL5MQysMkWY45SolVoXHjx+juvjfQdHP+yS6C4/m+DnNauwrDw/7r2CVvBwUAN+Woar2Q+DVdnDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785200453; c=relaxed/simple;
	bh=G41FB6TNc4RhNWnN8KNmrBRPiMbKOXrXLw4QcK9NUkI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Svb7e5COV9ckNVgJSg0QnlzTSjd9wWOwMjoPAPMr/JR4EplZ9j6BkO9sR+eHdfSpN1q+KpEe6tgFUlVAcuksJi7zK86simAT04XPwmb02eXRvjS7N9+kWVXRk3fwHIN8LKEFfbQGLg/pqs0j98+qgYLCkYDJ3QnSVtlPPiKPTJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWtWv3au; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWtWv3au"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF011F000E9;
	Tue, 28 Jul 2026 01:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785200452;
	bh=gHFobzq67GrWBYtIDtiRYs6qPIdpeN0f1jJtlnCLfyw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=CWtWv3auzq9wmkJqE5f9QuOgBLKTCOQTJQmLWix2b2Po+nHsH2yb+c59F3jx15y0N
	 n9vBqo6ZKS/UJqKTOk9eyZigafteUS1Sih/1gy68Rks2G+iw195Xa4aOJvEJbsbob7
	 /Zqkr02eTom6yojQL94yHwuomj44zQLnvSeibzpOvW7DBwc0g7lDWRnrGYYuFyRzkH
	 +J57C1dIv+bJUZ+riAr8cJZhzwF9dCw/Niq0hrHlax84BBTji48R5UYiljwhl0W1Qi
	 VI0GhqAOrb3EMpm+5vlMSOe5kSRNYL927vOjRD5Q9EyDCXb+E2Nw+woGLFcp6xfoZu
	 6aX8CZETLhbiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939CD380CED8;
	Tue, 28 Jul 2026 01:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/4] net: hsr: PRP RedBox (PRP-SAN) support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178520041713.1482784.3169503778350930252.git-patchwork-notify@kernel.org>
Date: Tue, 28 Jul 2026 01:00:17 +0000
References: <20260717201457.54-1-xiexinet@gmail.com>
In-Reply-To: <20260717201457.54-1-xiexinet@gmail.com>
To: Xin Xie <xiexinet@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 wsa+renesas@sang-engineering.com, jie.luo@oss.qualcomm.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 fmancera@suse.de, bigeasy@linutronix.de, fmaurer@redhat.com,
 luka.gejak@linux.dev

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 17 Jul 2026 22:14:53 +0200 you wrote:
> This series adds PRP RedBox support to the hsr driver: a PRP node that
> proxies one or more SANs sitting behind an interlink port (IEC 62439-3,
> PRP-SAN). HSR-SAN has been supported since commit 5055cccfc2d1 ("net: hsr:
> Provide RedBox support (HSR-SAN)"); this extends the equivalent capability
> to PRP, reusing the existing protocol-neutral proxy machinery
> (proxy_node_db, hsr_proxy_announce(), hsr_prune_proxy_nodes()).
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/4] net: hsr: add PRP interlink (RedBox) datapath and duplicate discard
    https://git.kernel.org/netdev/net-next/c/841afc9143ee
  - [net-next,v4,2/4] net: hsr: emit RedBox-MAC TLV in PRP RedBox supervision frames
    https://git.kernel.org/netdev/net-next/c/852c6a8d7cbe
  - [net-next,v4,3/4] net: hsr: allow PRP RedBox (interlink) creation
    https://git.kernel.org/netdev/net-next/c/85abc2db7ba3
  - [net-next,v4,4/4] selftests: net: hsr: add PRP RedBox test
    https://git.kernel.org/netdev/net-next/c/6d548d0fc160

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDFE37419B;
	Sat, 17 Oct 2026 01:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792198807; cv=none; b=cVId5VOKnPILEe3SiKf/WGkjunRj40dtH8bFPpF40x952rRhE5WxvatKbubEz9YTdtsotw8AocXXVEjvCbM/kG25UsJD1OvLXHa9eftRHuRXJpJH/BCoJZ908bJKRpy6oMcKuBNq5t3jcJvg35BAAHGJHh35zIMcB3lRvY9oMWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792198807; c=relaxed/simple;
	bh=6D1KBTlxFcezAygHJL9f9Xuyf7zFNIujGSGTqDL7ffs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OX04ZtZJtf5LTzv44956wt0bBNltkuee8nMQhDEXYz/7mbjZHNCWwy2qhtauFTzlWRargMunzDlVTCUMjAE83Ct2A3JdYoLpHcuAofqFOTAzz+bqcyGLHf8j9NiZi/hNOzaahOnleFi9UdxqrS8PJQgGT20DffOCD/iqJyTR74Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oy3EnsIS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oy3EnsIS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74011F000C4;
	Sat, 17 Oct 2026 01:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792198805;
	bh=L96xegFXJFtmUoolVD5Y5x7b6XvE5pQG9fb8eOvFaP4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=oy3EnsIS4G94Qhxtco2UtFjih6JB0DtQX3IbfzswliOBr/KKRSOpQvioq0m84+q94
	 LoRI/fVQcZiZYdBIsEZGA+mBqPZbv6yAdtmCeEUhTqJmxGxIXe/oi7E7IeH0HbCFle
	 CEsufghhoZVRSIo+XWGynsOyk57+BtIO74qcUe7724/DPc0GjgRtdhbCp+/iHbGywW
	 vqRYTMtL4q4QCXmsDaHvtHy5jnxIolofGcFD8subL9ZV+DUs5jhFVGHxhqH+7W5mVa
	 Etm8WSCPbrkMFuXEiBvz35zVBEFm+KDAgf1dhU1MG7yhDYypDIXWrGJegpYdrkkSVq
	 4lQbhsjRkbFSQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B2E91380CED8;
	Sat, 17 Oct 2026 01:00:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] selftests: net: bareudp: Add stream tests
 with
 software GSO
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179219880453.1036979.10660617907631873516.git-patchwork-notify@kernel.org>
Date: Sat, 17 Oct 2026 01:00:04 +0000
References: <20261011104300.1606351-1-yanhaishuang@cmss.chinamobile.com>
In-Reply-To: <20261011104300.1606351-1-yanhaishuang@cmss.chinamobile.com>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 willemb@google.com, martin.varghese@nokia.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 11 Oct 2026 18:43:00 +0800 you wrote:
> The bareudp tests only send pings, which are not GSO packets, so the
> segmentation path of bareudp is not covered.
> 
> Copy a file over TCP from NS0 to NS3 with socat after the IPv4 and IPv6
> ping tests, with UDP tunnel segmentation offload disabled on the
> underlay veths, so that the GSO packets encapsulated by bareudp are
> segmented in software. Raise the MTU of the underlay veths, so that full
> sized packets fit with the encapsulation, as there is no path MTU
> discovery through bareudp.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] selftests: net: bareudp: Add stream tests with software GSO
    https://git.kernel.org/netdev/net-next/c/f42d67a5044e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



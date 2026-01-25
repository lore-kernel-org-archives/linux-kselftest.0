Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9512730DEB8;
	Sun, 25 Jan 2026 21:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769377811; cv=none; b=F7pFiLwYbMRY8cssitxEv8W/NKFDkIJrXP152qyOzCjlRGTeIhOww9chFmf/7Vvq17heGyabyUGftl8YIoBvnulGGkd7kPjC+COmCQX1fRWO4VDdNvE2+hpLyjyL39mqvrTZwzsBb2ZXHaxLh6In1C0xU9FeIrGZmt4rJQ5TdfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769377811; c=relaxed/simple;
	bh=2jG1gq+PpXwjMDT/82fxWck9L3IIxPK0gQWT5K3Nfhs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QghGW6CcGXbYptTFI9IutOSNaSXyuve2pv3HDp0cs8RkOavZ3mLl0QKF4YK8mr7aYsOp1zYgWHcX28EnEQjhHjOuHR9njGY+n1i6ZfN8NUuezzc8Uegs/EPzdIKtwvkpEV1wusnhVcVkVkXq2IMYHRImZPKw0i3hY4owLtcyr4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XDIi9dqf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDIi9dqf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742A4C16AAE;
	Sun, 25 Jan 2026 21:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769377811;
	bh=2jG1gq+PpXwjMDT/82fxWck9L3IIxPK0gQWT5K3Nfhs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XDIi9dqf14pJNpzxqDTp37L4kNMZmT1WiARJlYzp90Kvp74Peo04ZXhdhp3KBn7g5
	 f/Up5GgWnXvfUNM+aOjNJji8+ar/ZybQWx2ByRRYvN+0uWU2UEcwXe41elMU24jxP4
	 thzDEmj5Xj6A3jLD483K7L016U56uoEO4kY2nIt1SiPOH7alE0X16lFImOx5N6vUJY
	 n93I91UWTO2zh+/IIMg/dwXWijDgaB6EULVKZGVkOgzX3TT7iCE5ZRHe9qDeGDZRn/
	 ZDFEEZc5zH5mMRrb9mpMbVBHOmXKiNk7bkJXW59zAfCN5sYTX8n+s1wDuQiukb9WqJ
	 TJMybIY1XGMUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BD323809A15;
	Sun, 25 Jan 2026 21:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2 net-next v3] ipv6: use the right ifindex when replying
 to
 icmpv6 from localhost
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176937780636.3593758.11533069681163455532.git-patchwork-notify@kernel.org>
Date: Sun, 25 Jan 2026 21:50:06 +0000
References: <20260121194409.6749-1-fmancera@suse.de>
In-Reply-To: <20260121194409.6749-1-fmancera@suse.de>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: netdev@vger.kernel.org, davem@davemloft.net, dsahern@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, haleyb.dev@gmail.com

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 21 Jan 2026 20:44:08 +0100 you wrote:
> When replying to a ICMPv6 echo request that comes from localhost address
> the right output ifindex is 1 (lo) and not rt6i_idev dev index. Use the
> skb device ifindex instead. This fixes pinging to a local address from
> localhost source address.
> 
> $ ping6 -I ::1 2001:1:1::2 -c 3
> PING 2001:1:1::2 (2001:1:1::2) from ::1 : 56 data bytes
> 64 bytes from 2001:1:1::2: icmp_seq=1 ttl=64 time=0.037 ms
> 64 bytes from 2001:1:1::2: icmp_seq=2 ttl=64 time=0.069 ms
> 64 bytes from 2001:1:1::2: icmp_seq=3 ttl=64 time=0.122 ms
> 
> [...]

Here is the summary with links:
  - [1/2,net-next,v3] ipv6: use the right ifindex when replying to icmpv6 from localhost
    https://git.kernel.org/netdev/net/c/03cbcdf93866
  - [2/2,net-next,v3] selftests: net: add ipv6 ping to local address from localhost
    https://git.kernel.org/netdev/net/c/1742272bd3fa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



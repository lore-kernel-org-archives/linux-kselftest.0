Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204BA34BA5A;
	Wed, 22 Jul 2026 15:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733046; cv=none; b=cm6bttVfSbDpWctITD/B1P5gDFAdeRuR5zJSTvA61uZDzYV3WKKYMKt9nEiRrF2vkRK+xSGjwn22cJcTFSK31NVsqDfXt+TmFTooEIt96m+VlGLKD5WhENu7NcGeA4eo2GaH190YZ5Te36nHymp7iGGhwMgpdIQRb69l+UlOY3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733046; c=relaxed/simple;
	bh=n7caGpxCXP/wVhclGf+FpBpgY1f2y+CLLUvMOF1Z+cI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XCxMx8EwDWCY9psMco1kf7m12dmPK2Gon4G14IuuyJULoyt6fzvY5aUJVzqkms11lkHc6kPo4fQdPerM8urBINYQXM0yNbwDw1FYPdTF1u+AK7cHFrkGheW8Smn3ze16sRQwDnEwMF8p0sE9IE+NHVflnuzXJp+/FnduFfZVd48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDbAKJRI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDbAKJRI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40EC1F00A3A;
	Wed, 22 Jul 2026 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784733045;
	bh=RftAxEfh6auBpwR0QTYp1eKRQIF63akuT4VbFvJLxiY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=fDbAKJRIXbHlxqQMiS2dOPQ6kwhbLxhuxwdWLHhA6EUJOHx3N84Ooxt4zPCGrkHoY
	 VAUSrIA/80r5jXKaY1IqhpArq1S7as3b0j/kx8BuQadRl0UgpzTkldfmp3Ij5NuP0q
	 1tPxv5R+awDIkeQVqOOxhRAKqpfTsdpQOq3z1zEnll6pAnTODp3wTtaL+qK638bILL
	 liLZOAa4sguzcATu99RQvJrB5yPhq8cdha+T+XuaDQZBprPp3TQER/F1DeU30pcaLG
	 JFy30uuyOCEB5WXkL3ojQmUgfcumF1abteKFBAriZZlDGcTaiI1VnyufF+QsO8/SnE
	 I8gD/7iF2Lopw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19A83380AA5D;
	Wed, 22 Jul 2026 15:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] seg6: add FIB table attribute for post-encap
 SID
 route lookup
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178473301364.1448721.2497452827952748866.git-patchwork-notify@kernel.org>
Date: Wed, 22 Jul 2026 15:10:13 +0000
References: <20260711162907.6521-1-andrea.mayer@uniroma2.it>
In-Reply-To: <20260711162907.6521-1-andrea.mayer@uniroma2.it>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, dsahern@kernel.org, horms@kernel.org, shuah@kernel.org,
 nicolas.dichtel@6wind.com, justin.iurman@6wind.com,
 anthony.doeraene@uclouvain.be, stefano.salsano@uniroma2.it,
 ahabdels@cisco.com, paolo.lungaroni@uniroma2.it, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 11 Jul 2026 18:29:05 +0200 you wrote:
> After SRv6 encapsulation the kernel looks up the route for the first SID,
> the outer IPv6 destination of the encapsulated packet. This post-encap SID
> route lookup uses the FIB table of the current routing context. When the
> encap route is installed in a VRF, the VRF's table may not have a route for
> the SID, which should be handled by another table, e.g. one used for
> underlay connectivity.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] seg6: add FIB table attribute for post-encap SID route lookup
    https://git.kernel.org/netdev/net-next/c/ffdc1ee2d6d6
  - [net-next,2/2] selftests: seg6: add test for post-encap SID route lookup
    https://git.kernel.org/netdev/net-next/c/1016a547c685

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



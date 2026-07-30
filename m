Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66A2175A97;
	Thu, 30 Jul 2026 00:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785370265; cv=none; b=qjZUDeTcPseo4n1t+9BxcHTDu4ldFBr5rmA1GxTJ5qZHCNsTg2+5Div2JBjb8DpHzGHCCIKzBWDAgxkuERJUNy556XUVuZyERcFJeFyeTKUWzLHiNuV9IgMxxAuvJf4lpRD6UFIxms80rGybnQyu/chl4IyXFPWyf/2vvNtiIOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785370265; c=relaxed/simple;
	bh=l0Kjke7ci9wJl/UXiC6nBW1xUktZiAKap9ViTmSI3Rc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=B2p82LtMfzfYVd4IAAr4pUKgeE9ynRujBrWiOjfRyEwpxp8LsLj5TaDmedpDkj99bg5i9Fh3LPVE0pBbdPBY/K/Qv36G6QZzKHtvV+fj2H0ioMJJzbJ+6MjVLPIJC7h5wAWhT9I7cNVFYFjMAHIM7fbGR1M0oAWrpJ1+7kdrEsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1BBOe8d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1BBOe8d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B401F000E9;
	Thu, 30 Jul 2026 00:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785370263;
	bh=WNBf7vcnRnqBuJySp5fZ+6YEWR3zYmPQ3c974AuSIFE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=o1BBOe8dKkbHutesBG/qLY1E1j5dj2zcwQQZ60Jvko8KKwPKB0Iaj4/J2lz8XdtC+
	 /Om8kPFuSqnoBRYT0Op99O3LL63kuimNQRnvvDPg+lj2uvLBQ7y6oV3BQpoax05blu
	 j96i/tWNPDlrfSnn/mjlzoGe4S0IbazGBr9Jr/Jtx2a4SlBK4/IfYJ+/DpI3yQhe9z
	 IlfwSljwYcBnPYaL+MM4B6oZww8gQ55eh+F4dwRdtHfx4hWi03/LNiRBk8v024gGrv
	 eul95NtpLQsV443ae5t1LosAk0ucgN3b4l7pmTTFYELn8K+UyMJXPAMaVg0pdj18ul
	 e6WX1w16PGKug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569EB3926250;
	Thu, 30 Jul 2026 00:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/5] Add PACKET_IGNORE_OUTGOING selftest for
 packet
 sockets
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178537022688.3290991.16102834801090577683.git-patchwork-notify@kernel.org>
Date: Thu, 30 Jul 2026 00:10:26 +0000
References: <20260728160935.4128982-1-joe@dama.to>
In-Reply-To: <20260728160935.4128982-1-joe@dama.to>
To: Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 28 Jul 2026 09:09:25 -0700 you wrote:
> Greetings:
> 
> Following up on my previous series [1] and further extending the selftests
> for packet sockets to test PACKET_IGNORE_OUTGOING.
> 
> I re-ran the tests and the existing and new tests all pass.
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] selftests/net: psock: Generalize psock bind
    https://git.kernel.org/netdev/net-next/c/0982666c1bb0
  - [net-next,2/5] selftests/net: psock: Generalize stats check
    https://git.kernel.org/netdev/net-next/c/9404fe514efc
  - [net-next,3/5] selftests/net: psock_snd: unify on recvmsg()
    https://git.kernel.org/netdev/net-next/c/2544d30c11eb
  - [net-next,4/5] selftests/net: psock_snd: Verify sll_pkttype
    https://git.kernel.org/netdev/net-next/c/f5a445d2a2a3
  - [net-next,5/5] selftests/net: test PACKET_IGNORE_OUTGOING
    https://git.kernel.org/netdev/net-next/c/b75609e42bbc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



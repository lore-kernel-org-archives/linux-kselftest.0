Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0503DD867;
	Fri, 14 Aug 2026 03:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786677908; cv=none; b=WukG7VGxUkfOCu3E4Mvf854pDAo1UcuSGVEWnRcsKUMVNUBQDhONLzP2mN3ynYXCl3ypxhehgsmMrgk+N3hHorGDyiMhyAD0E75PhTkU+YeLKNCaijB+Yj94L5thgyuGU5b1TfNLtll1Z78yQckRfgMMx3Z8IL5yJGiFCZAZAEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786677908; c=relaxed/simple;
	bh=hiuOb9mLTgzxkzWra2Jsqk1XqW6Itffmw3SJeK5BZ4U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=N6zjkt1wJeXW9O9ZzBJy9Wn3jBA/IT4JzvbIPi3jZjzIo233FdJzn9bbJwvfJMg+cgMPSZ+OftWyyxXIYl4r7L+boLMeP0Lfa9Za1mZ1GDstCxb40YwuflkFSm9SbjE42yxAYx08jYa9TVxkzIBVip9fqPEpqt1mGvv4EfHzB7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=no0Nym9g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="no0Nym9g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A189D1F000E9;
	Fri, 14 Aug 2026 03:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786677906;
	bh=vCT0qdQhfQSbZw5isYG4GE84Wg3N/y5lMkvApTL2Qwg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=no0Nym9gI1uJXovVGlux48XGRxiIGtzJ8I0OHIyKqgXo2PcgLTZEOg4ErsFeL7B4n
	 dtd9eY7oL7v1giraU85MjTCl7NTkvw+NGQ76llkUEFefyi7qXGyijc9tmTd5Bhaoqx
	 2QFODpzWwH0mr6qaNFIbCONVVb9MRR0C4lsH29PTLz8PwNKYtP1HuY+VKhS9fMI25k
	 ts9UGSZBpNWJJuae1LK8lxsFq2yzAOKP8/p3Zo7HTbIUZlHqzrXwkHrOIlB4e6+iW3
	 YrE9v/4h/5ncua8OfnTfDaTODdeO/NdIwb3nducqIceaZTZNiijzar6eqluBgAzNeE
	 B4I5nXJbs1UbQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568BC3810900;
	Fri, 14 Aug 2026 03:24:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v10] selftests/net/openvswitch: add SCTP flow key
 support and test
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178667786089.3150297.9426672814575487514.git-patchwork-notify@kernel.org>
Date: Fri, 14 Aug 2026 03:24:20 +0000
References: <20260811181645.1918420-1-houminxi@gmail.com>
In-Reply-To: <20260811181645.1918420-1-houminxi@gmail.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org, aconole@redhat.com, davem@davemloft.net,
 dev@openvswitch.org, echaudro@redhat.com, edumazet@google.com,
 horms@kernel.org, i.maximets@ovn.org, i.maximets@redhat.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 pabeni@redhat.com, shuah@kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 11 Aug 2026 14:16:45 -0400 you wrote:
> The ovskey flow-string parser has no OVS_KEY_ATTR_SCTP entry, so a
> flow string containing sctp(src=.../dst=...) parses without error but
> silently drops the L4 key. The resulting flow carries only
> ipv4(proto=132), and the kernel rejects it: match_validate() in
> flow_netlink.c requires OVS_KEY_ATTR_SCTP when the IP protocol is
> IPPROTO_SCTP and returns -EINVAL for the missing key.
> 
> [...]

Here is the summary with links:
  - [net-next,v10] selftests/net/openvswitch: add SCTP flow key support and test
    https://git.kernel.org/netdev/net-next/c/07a9e3975039

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



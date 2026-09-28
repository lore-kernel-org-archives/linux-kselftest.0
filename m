Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5487349D581;
	Mon, 28 Sep 2026 23:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790638289; cv=none; b=euhCAPqE1uHM3wlyT+4q+ux7vsFzpMjO4Lr3HQxAV5PIT2WgEB+WY0RgiLv0PB4FATBNKhwXfut+oPZfsfyZHRa52xtlEd7lK0sf4RmZw1ZeWlB/5tckv5lCF9PjphWFDU+IbTHWfqRD/ewo2S+jXgakHIkrHTKnlAsLmsju/i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790638289; c=relaxed/simple;
	bh=S+Uw/0WtdZaOYyywIy5D6MNBzh1f+wNfHoc/BvDzB38=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ucuZ28XAVU3SvVz190rsrjuvu5MDNuLx814wmdZqLZpkiGUGuY5dLSfPez9Pzr+YAJymSSc7EbjROoHVIh3xQHQumgBqfaPyAKyoBQvgonQ9X3wRb4PmHaxH1AkVwLlIXoXPldnjlEcLy1SJnzDYjve6Eu4eUjUCSqQ+3OW4F0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLtvvT6F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLtvvT6F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAA11F000FF;
	Mon, 28 Sep 2026 23:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790638288;
	bh=N7tH57G3bjBEBmvSHKajlxChx2aCHZLfCUEw08v1UCE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NLtvvT6Fy/98uI46pS1aEcqSn6/CYvSN/mH/4bxImIC8RI5+2DEMJEY0fSYldVaIP
	 zgPxCBHciK4kHqn696Q0oQJiKV1MvGDQR3ldr1hD9CzeBu7Mq3ia5ANJqiV7xVvsyL
	 fK7/dp6G6Ui50xR2CprCWI7H2VYTIJksCSj8L5uSA8Iy0YEMGpBPFmoSd3rSgE5QSD
	 VHltB8BKrN8A7HO9dtiZPWsvg7unsNVNaU9ja9XzgQBj+Jiz2TKw8l8HivaeDHDY+J
	 8Wiz+GAfRfvlZ/N8zgw5PJ684fOaBZ78WEfXVk3Ip4X/t+iL1zco4wOkk88jHq7Yef
	 ooAhRltuP7Jqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A943924FE4;
	Mon, 28 Sep 2026 23:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 0/2] selftests: openvswitch: SCTP flow key
 coverage (IPv6 + NAT)
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179063821213.174580.11443408950385438893.git-patchwork-notify@kernel.org>
Date: Mon, 28 Sep 2026 23:30:12 +0000
References: <20260918144647.2024095-1-houminxi@gmail.com>
In-Reply-To: <20260918144647.2024095-1-houminxi@gmail.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 dev@openvswitch.org, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 18 Sep 2026 10:46:45 -0400 you wrote:
> The merged IPv4 SCTP flow-key test covers only IPv4 and only the
> plain forwarding path. This series adds SCTP over IPv6, and SCTP
> across conntrack NAT (ovs_nat_update_key() rewrites L4 ports on the
> recirculated skb). Patch 2 translates the destination port so that
> SCTP branch is load-bearing; address-only NAT cannot tell a working
> branch from a missing one.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/2] selftests/net/openvswitch: add SCTP flow key test over IPv6
    https://git.kernel.org/netdev/net-next/c/392551884f44
  - [net-next,v5,2/2] selftests/net/openvswitch: add SCTP flow key test across conntrack NAT
    https://git.kernel.org/netdev/net-next/c/3e5e024c2075

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



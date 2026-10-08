Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F965733E;
	Thu,  8 Oct 2026 00:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791418808; cv=none; b=NP6IKgYtJAbVZn9hxn68/1cXnLLmjWlfcPaOhhZd8yfrYRD+wphLoS6s1b2L9tSt3rQsEIcAhjxtZZVQWAZn/LnXp7FeKFCUTpJD8SpfukrTkQVIVg/bIscrt0ZKYyztSs8weyDwDUCHsNV/aqoHe2daoytKjCBUA4kmWr+1qu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791418808; c=relaxed/simple;
	bh=I4RhPGa4gJMBEoDoCqnTTZuyfg1CnQ63wUh1uMU0NGs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ENjlByZ7wRqQ8V2AI7YvDIbQyXekJ5Vv1Sn4UE+yaTSfX//sysa8h4ARfkkrWec2WUuF6sT1e9IlXMvW63zT86bKjXoEhztsADvdWDftzqR/gLWodBub/5wtJ73/78Zi3MYxkHlLD6cqXIs6eWc0fPtkkSaP5b91tXs8MfW50wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGFvac5M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGFvac5M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4898B1F000FF;
	Thu,  8 Oct 2026 00:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791418807;
	bh=DEnJiyjKOrrg1K81N6QQME9RnF3lvjtDjnLL+PJLLBc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RGFvac5MePtFluwQW45WemVIl30EuW0rYwCm8d6LltVuNMQOzeEh4DdKICaw7PGJs
	 LJ3d16n04cTPg3EkHmCo/z76Muy51vkzq/wvC9bE/cWjgvhQvckhxrkKq/AeAlGtMX
	 F4gJeFUDNefZgqLsABbzs4obcoqVYhVIYnHeH97UsjIuHQ+iXE6ScyibEdrvgvrkcp
	 wULlMZOdZwgztIBsZ16ZGrCejlyrkjukmXH8rBYLYuxt76qmdTb5aO+JkIcaN4U/JU
	 7/KS4I6i9c/LSCHVN2n3iSHCTbo89HXhOsVn5B3G2EVJFNsblWMRWvz5MMsokPtC8s
	 tp1yp3BwYLTnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2E53809A08;
	Thu,  8 Oct 2026 00:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3 1/2] macsec: check the resolved SCI for duplicates
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179141880579.3746804.6020729436279289676.git-patchwork-notify@kernel.org>
Date: Thu, 08 Oct 2026 00:20:05 +0000
References: <20261001-fix-macsec-duplicate-sci-v3-1-0f179fbe1f2d@gmail.com>
In-Reply-To: <20261001-fix-macsec-duplicate-sci-v3-1-0f179fbe1f2d@gmail.com>
To: Haseeb Malik <haseebulhaq55@gmail.com>
Cc: sd@queasysnail.net, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 shuah@kernel.org, hannes@stressinduktion.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 01 Oct 2026 22:33:57 -0400 you wrote:
> From: Haseeb Malik <haseebulhaq55@gmail.com>
> 
> An all-ones IFLA_MACSEC_SCI selects the default SCI derived from the
> MACsec device's MAC address and port 1. macsec_init_secy() resolves this
> value and stores the result in secy.sci, but macsec_newlink() checks for
> duplicates using the unchanged local sci argument.
> 
> [...]

Here is the summary with links:
  - [net,v3,1/2] macsec: check the resolved SCI for duplicates
    https://git.kernel.org/netdev/net-next/c/2554c08e16aa
  - [net,v3,2/2] selftests: net: test MACsec undefined SCI uniqueness
    https://git.kernel.org/netdev/net-next/c/2dcf7c1af689

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



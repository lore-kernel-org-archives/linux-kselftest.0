Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797113B8BCB;
	Tue, 17 Mar 2026 12:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748819; cv=none; b=dfuzwi3x8lIEtQXcLdlYOeCYGFT3Y2bSGCEKmSVNPspk9N0OZ/WQ+hZ9eWFvxf9iXOBMeZZZA8+ETz8Ob7QFepeYrXGeLq96aBFjNL4wPLxZ88uWxlRCpjmd+vXdMET2VWjaOgUoUk35FAlOeD14rvWxsVKkUl8RANeswJxzU9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748819; c=relaxed/simple;
	bh=ObyeGWjZtHrymyhtE8GDuhc5g0y8cyThbPdP6d9yYY4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lu4UHuw8b0zCDrYTBYNDJvpwlmITFiujcQdbQhzQf4DmbWmXqpemFWYiTb5cLaE9MhEsZ8Wf/n8SFTXoUIq74bzcmHkQOcJJWV111ND96kbkFKbbb3MtkNvG0GI0rHYi4oIxaA+pXUMV68XzAsK8kvDYnhesG5OyImdzZ9CZE38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMpXUNEz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMpXUNEz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309DCC4CEF7;
	Tue, 17 Mar 2026 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773748819;
	bh=ObyeGWjZtHrymyhtE8GDuhc5g0y8cyThbPdP6d9yYY4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hMpXUNEzjlOBeJpEzQgy7xrveSW8A+vEoevMJ8D+6cM2PkXe9tMH6KO1nfC5fMZMu
	 PgSrUwsnpo0tH0Ux3XTsCGNfyQsXnBqkJPcVp2rz+TY7uzOPQAXPG0I6A2EgbPCrAM
	 lWKZ+Xqvpk31J94HVCiJrRo4Nx8s8FJsz31MbrfL2+DzxjHigT2XWzmlOT+DCTSLHW
	 y8A9ZDgwmiSo+aeM0qQhbys5X2AxRwYKSxSZ38AlXRpxQsun6kfIdWhOKJHpbfZtSE
	 3vtiia7MLvkdQw5X3AazwL1LMaMekEj4q29aWiyQEYOOltoMMIn2GecfkmIhKFbsfy
	 PYpgsGyM1NUWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8B4A3808200;
	Tue, 17 Mar 2026 12:00:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] selftests: net: add ipv6 RA route to ECMP
 merge
 test
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177374881156.3585799.4575178253875930759.git-patchwork-notify@kernel.org>
Date: Tue, 17 Mar 2026 12:00:11 +0000
References: <20260313124827.3945-1-fmancera@suse.de>
In-Reply-To: <20260313124827.3945-1-fmancera@suse.de>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 13 Mar 2026 13:48:27 +0100 you wrote:
> As commit bbf4a17ad9ff ("ipv6: Fix ECMP sibling count mismatch when
> clearing RTF_ADDRCONF") pointed out, RA routes are not elegible for ECMP
> merging.
> 
> Add a test scenario mixing RA and static routes with gateway to check
> that they are not getting merged.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] selftests: net: add ipv6 RA route to ECMP merge test
    https://git.kernel.org/netdev/net-next/c/fdd973148a11

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



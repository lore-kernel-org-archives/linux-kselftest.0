Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C721486B8E;
	Thu, 23 Jul 2026 17:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827259; cv=none; b=TJs5uYjiAVzpRquZmC4biaykiqrrzd53o8QC/FQfGadaRxnnr1r8L0Ctdz/bxT/pLBpTGrrFtFBFK2YjHpu1am96P+/rHAftVatRDNpPzjbm+mbOP5s5fOBs1Zh4+rj7ER7WmXJzGTANMNxbwblUGlZCgv5wf04M6YkR3WZMNwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827259; c=relaxed/simple;
	bh=eg2EDBfms3wplILxobi8XAXY/AQEHIWEC9GQzLWfOOc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uicKkR/l7pXXDxtv++k0wLilI+Y/tcVvmWqPU9YmsSl1wcIBRic70x4sxNzT83bqaEp93l4jnNUtAYlEbQtB8ymkP84Lhq/oFbIctgEzwbLET6uFl/80OVx3Hd/bpkjJaAXZ9gZGxP0o3QMHzsJSjzFTV8dl5EVQNDQVMxnYFR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377A71F000E9;
	Thu, 23 Jul 2026 17:20:58 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A5739244CB;
	Thu, 23 Jul 2026 17:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] selftests: drv-net: Fix csum path in doc
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178482721290.2793774.14367887979673851139.git-patchwork-notify@kernel.org>
Date: Thu, 23 Jul 2026 17:20:12 +0000
References: <20260720215149.631145-1-pvorel@suse.cz>
In-Reply-To: <20260720215149.631145-1-pvorel@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Cc: netdev@vger.kernel.org, petr.vorel@gmail.com, kuba@kernel.org,
 willemb@google.com, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 20 Jul 2026 23:51:48 +0200 you wrote:
> From: Petr Vorel <petr.vorel@gmail.com>
> 
> C source was moved in 1d0dc857b5d87.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Changes v1->v2 (both asked by Jakub):
> * Sent to netdev
> * Remove Fixes tag
> 
> [...]

Here is the summary with links:
  - [v2,1/2] selftests: drv-net: Fix csum path in doc
    https://git.kernel.org/netdev/net-next/c/b8363908ea1e
  - [v2,2/2] selftests: drv-net: Fix TSO test doc
    https://git.kernel.org/netdev/net-next/c/1306cf6dc1df

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



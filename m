Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314853EBF2C;
	Wed,  4 Feb 2026 03:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770175814; cv=none; b=fOn55ztRvqjTGffNIMmpo2ysCWXYDcUgceZ5eKIoyMnhYujWohGBAwxm7raaIpZ/KV+tuSS2ahhyFWeSdukru8EGu46HZYQThWE8dpR6O6NpFAaJZB3IGloQrg2GtWIWqkor5wo5IQpyNA9f4r8Jgzb8XZBZch6kNMsdhxSNdkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770175814; c=relaxed/simple;
	bh=/ltIFtMHxrJoVz6/htqMCrh88VyW+vU0E8kF5ArtNpM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pExMjHXZZe43rLwOlkyJE6W37t1QvtQj6CYKRiGLHrm6rxqE49atwZ7GEmEhZnZ9gp5shIm3lLVi2me9j5v/ea+PIG3zy7bUJCQQAfzLOJcAiGp9fLui+DkBZ8z+Nm7gmGHcNXXXoWxOT88MQK49xftMuVHlv5smpmAOXyHKy2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gts7s8yM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gts7s8yM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C2FC4CEF7;
	Wed,  4 Feb 2026 03:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770175813;
	bh=/ltIFtMHxrJoVz6/htqMCrh88VyW+vU0E8kF5ArtNpM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Gts7s8yMRJQf57v+jfCo8QPu0POxlFJZwJUP6fKDsRRSxvAIbTAZ9aIM2HIi5bgl+
	 9lJJXH+q71tCLHLBVDq10j1Q7FO+M+po6cH34bzvwkU4YnRMigTOv/wlJRi+hWdZnS
	 XKQPls5Uty8yG1hzuXPUTMoMdUKdPXIjzv2mVVwii5W/rslUAzvw1vyC7DIuQIE13f
	 QHqZ3ErauSYC+ZzVSM9ZhapnQEDzRZJpLlwwVD5War1V8RfTOsUFw6SMep4/ZAkPRD
	 snVkXSEzPG7GH8zbPKYKjNkwc86LUeU4ePVtjBoyg5fy3jOuyoc49XsephXY/wj75I
	 Uq2fkhf+43ADw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 16DF13808201;
	Wed,  4 Feb 2026 03:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net 0/2] net: gro: fix outer network offset
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177017580987.2166000.3434486648244735239.git-patchwork-notify@kernel.org>
Date: Wed, 04 Feb 2026 03:30:09 +0000
References: <cover.1770032084.git.pabeni@redhat.com>
In-Reply-To: <cover.1770032084.git.pabeni@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, horms@kernel.org, shuah@kernel.org, willemb@google.com,
 richardbgobert@gmail.com, linux-kselftest@vger.kernel.org,
 aleksander.lobakin@intel.com

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  2 Feb 2026 12:43:13 +0100 you wrote:
> The GRO stage has still problems in some edge scenarios when dealing
> with encapsulated traffic: the first patch address an issue there
> leading to bad checksums.
> 
> The second patch introduces a test case covering the relevant scenario:
> S/W segmentation after GRO for encapsulated traffic.
> 
> [...]

Here is the summary with links:
  - [v2,net,1/2] net: gro: fix outer network offset
    https://git.kernel.org/netdev/net/c/5c2c3c38be39
  - [v2,net,2/2] selftest: net: add a test-case for encap segmentation after GRO
    https://git.kernel.org/netdev/net/c/bee60ce21b75

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



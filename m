Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47A01EA7CB;
	Tue,  7 Apr 2026 00:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775523026; cv=none; b=O/QNJIjjC/cA9beSJkyO+kZjb3EfELHwRy9KbVhCCEE9wIQG6pLZLSVcS57mGu3fYYKP6ddn9yr91+nhqUVmejztRClxOFMvmqJaxCtMbnVGJ8if17ar7hajH9haIcYnY2b7wVavveBSYT/Js7rvgT+sIABR8NpOBPbqG5NfKyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775523026; c=relaxed/simple;
	bh=T07CYO6L0r6pmV66smEgTJRarzcfWbqMTR2vkiU3IuE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Fvhu3sYODeNp7gxk6KtK+BI0OGUiED9nKxGlehILM0hQraS69FfuW+dX7rdBQFkaQbNv0MD14F2mzkp8jfTFr8rm3VYoj1s8bfPguBXVnV90zTCipFSgevkN8TeW1vahlEg1HL0lbhtISVshncfzhhawMrCSP/bEH2W1Ge8XFR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BeHxDOrl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BeHxDOrl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B76DC4CEF7;
	Tue,  7 Apr 2026 00:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775523026;
	bh=T07CYO6L0r6pmV66smEgTJRarzcfWbqMTR2vkiU3IuE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BeHxDOrlT5hOpEAs/B2FEVdoNd9D4je+Akb1bxx7BnCmraQfvqGTinfQd0GF7PiXr
	 VbDEj2I0eX1yhPipQo/jb6ECfj0Lnz9Q8z2DpkKkNoBiiw+todQJF4h3Al3yUerb/2
	 kr7CSuw7AbgklHPrZMlgyLinOtyDVlTLxq8huqcptnI9+zCmAx3cd2PARZxTvGocFq
	 3R8OY1KTEHrTBbotXsh7pz0UFmaNY6bAAEpANSQBdFV1JkzLwQ5CUtoW7+9/Q+pb+e
	 x9jBpaysIMl0k5qqXpPc6dYATSgZYZF0UjoTO8AH0XNVLrlCwAVYa8y1BLi8iPUK02
	 ui2EJHdD2nPDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02C163809A28;
	Tue,  7 Apr 2026 00:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] selftests: net: py: color the basics in the
 output
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177552300479.3319505.1157746963786214137.git-patchwork-notify@kernel.org>
Date: Tue, 07 Apr 2026 00:50:04 +0000
References: <20260402215444.1589893-1-kuba@kernel.org>
In-Reply-To: <20260402215444.1589893-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, sdf@fomichev.me,
 willemb@google.com, joe@dama.to, shuah@kernel.org, petrm@nvidia.com,
 linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  2 Apr 2026 14:54:44 -0700 you wrote:
> Sometimes it's hard to spot the ok / not ok lines in the output.
> This is especially true for the GRO tests which retries a lot
> so there's a wall of non-fatal output printed.
> 
> Try to color the crucial lines green / red / yellow when running
> in a terminal.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] selftests: net: py: color the basics in the output
    https://git.kernel.org/netdev/net-next/c/3b45559f6c0a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



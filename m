Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4BC1D54FA;
	Fri, 19 Jun 2026 00:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781830217; cv=none; b=dhPMIUgSeSU8NyKCp1Kn70iVtlLXyUon5ncAP8mWkDjkhdkKWtfEA9J4x3kpYiqdpHB7kSBR1lnE0uwPrVM9sv+hhhlR6HPn+vSGYqzhsQK4gAFsW8V7bNkXzG+zWMpFUiUpCPFU5mzUf30cAVJ+pofVUeNETAuu7ndPtUfprq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781830217; c=relaxed/simple;
	bh=ljapTYUk+iI2916K4rVkMhaew5z1/Ryu8ZrZdApYIFM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=sLDgeMLZ34LNIrYAivHYRRQCbMoaTLteoowwhH7uFwogc2713ci/ZjHSjv4mGPTUGTtTbQtlEUzhrCSiY6kZU6pScG+1FW8ySNXT0unTzwD89ACeuNz93y0Euaqj338HO6chNMYYYPeUepB5RYJhgbeiiFVC1tZ9v8SWh3YF00I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSjAq2uB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSjAq2uB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E721F000E9;
	Fri, 19 Jun 2026 00:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781830216;
	bh=/Ee6UxM3eqdSKl8aP3jGS8jgNlHyeBntU9DGP47sSqA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=HSjAq2uBov88nWyM1Ism+6BsXH8WfDWKzCAtAHpS4GVb2C1qz5npyVYbWq2ddR41s
	 6b2HYhI0cgnBu12wMD3haT9Omm0bTs+GLRLGbpXcKnrobrAyTjeLXncqkouNg9af6e
	 gYsoGy+9W89asVKeXNM3myZyLVV1klsfCVBjKo1hkMNjWvOK9BIU6hJ0ESyp5pscs9
	 mMiTmtn5q6DOReK4KC7TSefqvAKKcESfjlgiXnKgD2FAIq+Kfxsy4d5z92MXTs3xcO
	 fq8PhmRiuc19G6o+ZzrkoJabd+iyfkH5/xvUz3j7MS790p0BqlOXaE7Es05e0HbNCN
	 rv99dW69pCslA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939983A78A7C;
	Fri, 19 Jun 2026 00:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] net/sched: act_ct: preserve tc_skb_cb across
 defragmentation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178183020939.3143278.4950135322607643333.git-patchwork-notify@kernel.org>
Date: Fri, 19 Jun 2026 00:50:09 +0000
References: <cover.1781358691.git.xizh2024@lzu.edu.cn>
In-Reply-To: <cover.1781358691.git.xizh2024@lzu.edu.cn>
To: Ren Wei <n05ec@lzu.edu.cn>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
 kuba@kernel.org, paulb@nvidia.com, victor@mojatatu.com, yuantan098@gmail.com,
 yifanwucs@gmail.com, tomapufckgml@gmail.com, bird@lzu.edu.cn,
 xizh2024@lzu.edu.cn

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 14 Jun 2026 01:42:38 +0800 you wrote:
> From: Zihan Xi <xizh2024@lzu.edu.cn>
> 
> Hi Linux kernel maintainers,
> 
> We found and validated an issue in net/sched/act_ct.c. The bug is
> reachable when configuring TC with act_ct on a netdev (requires
> CAP_NET_ADMIN). We have tested it, and the fix should not affect
> other functionality.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net/sched: act_ct: preserve tc_skb_cb across defragmentation
    https://git.kernel.org/netdev/net/c/9092e15defbe
  - [net,v2,2/2] selftests/tc-testing: act_ct: add TDC test for skb cb preservation across defrag
    https://git.kernel.org/netdev/net/c/1fd8f80a199d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



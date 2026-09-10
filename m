Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237D84BE45F;
	Thu, 10 Sep 2026 16:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057274; cv=none; b=e+jYgAQ4/ZE+jdv/PQ76G/37tWSHmgX3P5wuYSwvRXKaOiFIu1G/PZFwb3XkuxGdPsGSfO4l1rcepiijZyhqfGRjMApCwWpnkQPICTH7xWXaR7ydo4TlPaFftdzIj2VHPHLKbZG7kQdhFf/GiwzOuKXpY4DDowKGofXKDy6TOvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057274; c=relaxed/simple;
	bh=1a+FFcD+5oZJkBlNJtjhMgTdDUTCnlJt62NgsE+MhL4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ijm6eZ807ww3hJyBBVPm28Hko92Nyw2X1tMAO3sPJORY7FQDGb6dpyWPgm5kCNfJXTAgxn8gZCnxKtIOoDya41amzvkpO1XQxI0u4i5X9SC/87jpzxMMbCUr2IVLyblSdyc5d6H0ueuZ1siRhu/472LBfp4TMAmgrKAmRY7+KZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvrlrWYx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvrlrWYx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE511F00893;
	Thu, 10 Sep 2026 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789057272;
	bh=JmIsJVFsR3FJC3kgQfxThyx3Dwayr1ISryIIDTaRZzA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KvrlrWYxcUjTh/mqCIXmG5ybbEnTisl6SHAbfwugrJAtg3stsmfP+PGIicL1MLSrB
	 Qim4i4KAQPB/rL2+WRaqeJpksMmjPjMYB92QRSDPfirtxGomUUHFSFlOBavEBKwk2S
	 /KcD5yV5Bbq5gnJBWGWQpdUcyOgt2d23Yr0NtqeRRa+afxRJtj5fnA4v4fj5tKnTe6
	 v9XRMTGd/bUqwo+aoEfqSqPbXKAw795VDNjXzK0OCt0/7/kJEXc6KtzeNYXrDpGRFx
	 IQEJEdjRDzHoY2Qj4eHBsomnZ4FhT9kju1PYtsLyue0aeri/Kof51QNwulRx6vkSJS
	 2PU68xPy6if+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19B57380CFFC;
	Thu, 10 Sep 2026 16:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v1 0/2] net/sched: fix action batch failure cleanup
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178905720988.1524130.17486629819639799377.git-patchwork-notify@kernel.org>
Date: Thu, 10 Sep 2026 16:20:09 +0000
References: <20260909070336.32979-1-xuanqiang.luo@linux.dev>
In-Reply-To: <20260909070336.32979-1-xuanqiang.luo@linux.dev>
To: Xuanqiang Luo <xuanqiang.luo@linux.dev>
Cc: netdev@vger.kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, luoxuanqiang@kylinos.cn

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  9 Sep 2026 15:03:34 +0800 you wrote:
> From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
> 
> Failed batched RTM_NEWACTION requests can leak action references and
> reserved IDR indices when cleanup encounters a filter-bound action.
> 
> Patch 1 fixes the failure cleanup.
> 
> [...]

Here is the summary with links:
  - [net,v1,1/2] net/sched: act_api: release all action references on NEWACTION failure
    https://git.kernel.org/netdev/net/c/478eb5abb519
  - [net,v1,2/2] selftests: tc-testing: test action batch failure cleanup
    https://git.kernel.org/netdev/net/c/2a86bbed9f60

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



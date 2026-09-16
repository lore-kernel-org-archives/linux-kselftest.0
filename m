Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B394E56A;
	Wed, 16 Sep 2026 00:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789517472; cv=none; b=qsZTSzAy0cO1d6czN/Mq1h5IWcxxkGqcmUlemFPdM9P/HbpIyvlR1SCE0HSHUh/zCV8OaXoKabc6C2XwPd8Nq0s0MpUc0kS0qMNnCoKCqkkArvuY6hIqHLgQLEiYZeCDPe8wGodjoMsiFdieM9jMIsaTkHfEpkdcPqv3SRcGucw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789517472; c=relaxed/simple;
	bh=dC2PXNhvoAVmcaZT4ab4cw4yNQLZlHBdXXMyn+ZPHDY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=h9KaugXp2ZlfAse4BYqEKCIXDxqhCbYNulXSTo39TpusOYPntWv1/aoWLDSBn1lmXW79wvMqngK/i/Mu99/NswIvjHEREutmLcEFfUSy1Yn44pPa4K6krBeX7NGv5uVmPUsPDYY6Y+56/dl0uAw8NUY5GLfEngzZ5Teucg069f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBNGgWjo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBNGgWjo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767AB1F000FF;
	Wed, 16 Sep 2026 00:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789517470;
	bh=MgMHrwJ+0Jm82bZetIYM9u3Vtj9CEZUq5PfDcpYw5Ak=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SBNGgWjoTxPVQCIAL0q2PJ5ffKZCaqGvMpzQZi/KCc/6dsHHlK5P3y5jak8ROEXRn
	 SU7sa6RAezFOGy+rpv7WH2XdKc3iUjQOzfKbTsPzyGL8bkJ8McCP9fg1sACFsd8Ldz
	 ZuRNFe3BujmhxO50A9qdHdw2GH31hMXzPhf9IQZc9ND/8s0skKxmikVeIAyxQAsYYI
	 CEppMqScOtlXZ15i7RIhOcgDiu7JaHrHAI9iLNRnqSoMw8og69wS1T0P2Hwh26QYrA
	 /LQx80bymXPIwQHz8h9DgOghh/I601/LCUbzXLd/KL8EG2dE7RjUVLKw02ci4Thi9n
	 YLKEVBpDvWn+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19891392706C;
	Wed, 16 Sep 2026 00:10:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v1 0/2] net/sched: fix action batch deletion cleanup
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178951740488.2328807.12518597226919472176.git-patchwork-notify@kernel.org>
Date: Wed, 16 Sep 2026 00:10:04 +0000
References: <20260910093413.34509-1-xuanqiang.luo@linux.dev>
In-Reply-To: <20260910093413.34509-1-xuanqiang.luo@linux.dev>
To: Xuanqiang Luo <xuanqiang.luo@linux.dev>
Cc: netdev@vger.kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, marcelo.leitner@gmail.com,
 pctammela@mojatatu.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, luoxuanqiang@kylinos.cn

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 10 Sep 2026 17:34:11 +0800 you wrote:
> From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
> 
> Batched RTM_DELACTION requests can leak references to unprocessed actions
> when deletion stops at a filter-bound action.
> 
> Patch 1 fixes the failure cleanup.
> 
> [...]

Here is the summary with links:
  - [net,v1,1/2] net/sched: act_api: release tail references on DELACTION failure
    https://git.kernel.org/netdev/net/c/6e05e46fa821
  - [net,v1,2/2] selftests: tc-testing: test action batch deletion failure cleanup
    https://git.kernel.org/netdev/net/c/14c5eb685cde

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



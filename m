Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6990625E469;
	Thu,  6 Aug 2026 13:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786023651; cv=none; b=MfGkvcLtAu9tQxx+2oqwBeKt7QYPLHCVcZhHK5QquT4ERDkuhe25gXiOysGcHko4/92nWhoFKs+xEmhuzfHoSqjWiEYp63jQYn0NUmr4eo7XkX36TZiJpG/NHKvZ5Egn0RwIJck8LvPwxTT1xpqRAV05IJI6vD6WLYs9g9cHfaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786023651; c=relaxed/simple;
	bh=CojrNNHbbdfekP+pifbRa7082HKxNOkhtbwP7hfJhpc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=epFPfovsxIxg9K6AEwzgj5dJhnKZg40cuzdmGesYeRdiKmVZwphgf7ryrdNKt5gvdu4rlWfWL4bCvT0DxPSbmzq9J/scnvyd2uYHdBlsaXNslGLnnI+dm0LUctEjrloTYRPn9bMcMK2rEiJjlDQMtJd/WTsOCR0/uHAWQhGearI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBxCPHJ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBxCPHJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0545B1F000E9;
	Thu,  6 Aug 2026 13:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786023650;
	bh=jKg/nycgpoB4SYx8flmD78QUGVZ+EE1ZLPiyKBInbZk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gBxCPHJ1lL+AUuoN7aHaZg+8lRwIUSUF6AL7jsFrhCJ5FW0ZU8WUHJeTBletG5ZxB
	 W92O6nF+6w4NcHTyk18BZ6TsrqRDisA4eolBMQ8MhjrHZOS6gQqutqUq4q6qIwWr+h
	 0LIEotrIy1FM2vie/8nAnzWdqiI9k2fpqbdEH8CGKXxY2XgRmmM1RylHu4m/r/Hxsi
	 fp1q6zLUvOIGssmYBEK5j18IJmWSei8hECWAWXtbkn/n/3vxnFqZEmoKd+ujVn+JrA
	 6RPjQqFNoL6KWG3redMO0YpP03S/PA9yQAaK+/rE00wo1QO7O9CHvtV9zllKgh4ymO
	 MvFznDelNzM4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93C0F380820D;
	Thu,  6 Aug 2026 13:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] net/sched: fix qdisc graft hierarchy
 validation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178602360915.850457.17785473105479323370.git-patchwork-notify@kernel.org>
Date: Thu, 06 Aug 2026 13:40:09 +0000
References: <cover.1785434373.git.milkory@outlook.com>
In-Reply-To: <cover.1785434373.git.milkory@outlook.com>
To: Ren Wei <enjou1224z@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jhs@mojatatu.com,
 jiri@resnulli.us, vega@nebusec.ai, milkory@outlook.com

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sat,  1 Aug 2026 21:42:32 +0800 you wrote:
> From: Zijie Huang <milkory@outlook.com>
> 
> Hi Linux kernel maintainers,
> 
> We found and validated a issue in net/sched/sch_api.c. The bug is reachable
> by a non-root user via user and net namespace. We've tested it, and it
> should not affect any other functionality.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net/sched: reject overly deep qdisc hierarchies
    https://git.kernel.org/netdev/net/c/dedd34b0f231
  - [net,v2,2/2] selftests/tc-testing: add qdisc hierarchy depth tests
    https://git.kernel.org/netdev/net/c/d8eb9a06b922

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



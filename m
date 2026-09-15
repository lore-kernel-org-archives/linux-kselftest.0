Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E4B4BEE58;
	Tue, 15 Sep 2026 02:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439475; cv=none; b=bdInm+/dsVoFU8/pZ98uWL52rZheDIjrI7vr4I99GxV16eM0nkp1ohx+zzwiTWERpPApK6bZun8UUzlYRK/+nPADc3fzdmwBeMYPuSd7eepU4UMenNcu4ytRNtJ8pAE91OXA5BDm0B1XqRC5uacLTnEPKF4pPcWWiyph1SJdNTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439475; c=relaxed/simple;
	bh=luqtAzHVneMO5hE6o1ty72px2HAbirr34tfXI/OEyts=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=CVlqvnwPf7QU1eTZP/rcrCYFw4b3DFVOwgsjtGDAkIrZE3KF+iBnW3qHUlquMzbgHtvgHx5tzIPjNkkqnT6JewX+aBG/dBCASoL1UfjyuwYbvAPD7szCFEaRJWCAlo7uYrYMkCsARL7wynSmCv0jZNmm8L4JVnlGYeokUa0cIHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAOfJCyA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAOfJCyA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECD41F000FF;
	Tue, 15 Sep 2026 02:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789439474;
	bh=gCCdDu0r6XiRTBz5xhKjaNE2OFCHBkKTyIEK8W3Gf7k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=iAOfJCyAjxw83okjEicyR1+RPmLSid0m4i+jdxOvDe7XfuGtEuvPZMYXZWXKFuMbs
	 1gFbPVMDkGZQPhcQEyM51nsnD89+xJH9JW0JCusv2WMSQzYuPsP0MXTRVeqBw4TTdL
	 K7Hkt47D2Tm4hz5J+0cXg/wkBsMGuVKS9m+sS27a7k+ZQeZGf6wlCKlLwLnRFderGK
	 O2vSFPWN9Ku9gCI5cOSP/7jKrUoNE+U1LYFZR05/acqPikZPZQYu552c3mS/VtFrTE
	 Jh1zg4++GoLsbZsr050tTwNOwMIck3l73FP9QoAQBM/tVhIKmKmjomIrdMtlTwsx1W
	 aCIGNgQ60m3kg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199AD3924FFE;
	Tue, 15 Sep 2026 02:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v7 0/6] selftests: net: make iou-zcrx tests
 multithreaded
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178943940862.1322157.740585578841979975.git-patchwork-notify@kernel.org>
Date: Tue, 15 Sep 2026 02:30:08 +0000
References: <20260909-iou-zcrx-v7-0-6b5d48a2a922@fastmail.com>
In-Reply-To: <20260909-iou-zcrx-v7-0-6b5d48a2a922@fastmail.com>
To: Juanlu Herrero <juanlu@fastmail.com>
Cc: dw@davidwei.uk, netdev@vger.kernel.org, io-uring@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org, asml.silence@gmail.com, pabeni@redhat.com, shuah@kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 09 Sep 2026 14:51:22 -0500 you wrote:
> This series extends the iou-zcrx selftests to be multithreaded while
> preserving existing single-threaded tests.
> 
> Patches 1 and 2 are prep fixes/cleanups. Patch 3 refactors the server's
> global state. Patches 4 and 5 add the multithreaded client and server.
> Finally, patch 6 adds the python side multithreaded test case.
> 
> [...]

Here is the summary with links:
  - [net-next,v7,1/6] selftests: net: fix get_refill_ring_size() to use its local variable
    https://git.kernel.org/netdev/net-next/c/649936a0daaa
  - [net-next,v7,2/6] selftests: net: remove unused variable in process_recvzc()
    https://git.kernel.org/netdev/net-next/c/3fb289238244
  - [net-next,v7,3/6] selftests: net: refactor server state into struct thread_ctx
    https://git.kernel.org/netdev/net-next/c/72ac4f0c5398
  - [net-next,v7,4/6] selftests: net: add multithread client support to iou-zcrx
    https://git.kernel.org/netdev/net-next/c/280189574629
  - [net-next,v7,5/6] selftests: net: add multithread server support to iou-zcrx
    https://git.kernel.org/netdev/net-next/c/5d3416ebe555
  - [net-next,v7,6/6] selftests: net: add rss_multiqueue test variant to iou-zcrx
    https://git.kernel.org/netdev/net-next/c/9814d2fa8742

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972607;
	b=stJ1SlfXZT8C3ojMJU/RLfHOzRZdiNZK2Yt2DSU9pvEKbOvI7PGObGrnkF/bL4+YhqpS
	 Q9PlF+WM0xAWPMRQz98NhCQu9LYPfR8BFoIMbboOdMW+LjdbisWNVB6rUB6bOIjQd6byA
	 yfuX+n5lckvrRmD5AwSd/qc+FkI7sNnvM87icaZUJCJvMnKPHOr3XzcJ8KPMSRLsMNR+I
	 /D2SHSCASF7vwy1mFid4C5RcqJ8CuTSB33ZkVEP+FOsjvstAlQI+YNiP8EUY8O2wWdrn6
	 UeSBEPPkmzZWuPM/0W+QM0fO/dRfOvrSX9TWC+LUamWn3X2hCOjpPVsJjGFAWgCbt1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972607;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=AGMAhnXtc43b9IR2967bQRs6CtgqCl1Ghq4YYDHir44=;
	b=KY6cy7C3ddm2yV1v8sjKv/B2Vgbn7aCobxDn3jb7VWN86Sg/ax8bfxbHPQ8kYv/dZquK
	 /pq95a0MM5h8uRIepC5djaHav5x6hHwhw/mDLpFLmj0bd4UXG4mxot3WYcBzggahYdrkz
	 TYGb6pBeIQw+j+I1bf2CukazvAuj/Ty0w82BdOchIHlQdJgL+ITM0GvhnaDUEfneEhtWN
	 X22SzECA177c6NnYJcO8SUX7VSqLEPg/xVScj0HRicPjzMGG/BYCLGEL8gCQVS+23A3ZI
	 m2Q+DyjUZG7dgsjdbCpiYpjXRZ3CaAK/+FEiHYW1qy3ZpmWkRTJnvERMIUoadHCKb6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmQYkYcT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBD6606A31C;
	Wed, 18 Nov 2026 03:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmQYkYcT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823AD1F000C4;
	Wed, 18 Nov 2026 03:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794972607;
	bh=AGMAhnXtc43b9IR2967bQRs6CtgqCl1Ghq4YYDHir44=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=bmQYkYcTxwXsV7jVqj7xtKLQBbp8bJtz2Rvd6sUGtG7m+YALLuHG1EQvH8LgRtuR9
	 qfLPJzz8nlFbtLxIMRoUGdLHLw6/Gw7Wo3v81IqtJNYhAFRtHzIViUXuLI1SR2SlZz
	 CPekOnA7AFxlZ7v/Pwn69PdyQY0a1W8FmXvBR/dTDzRf1RCo8y8Vfn51FetnphWb5J
	 h+b5vHdRmBjPNCDkMpWFGp8inI8dRE66H28ENPUqIp+Dy0nX/9sOd/0ZAwFNLJ/qS3
	 9R9q+KDVeL+IwfEOH712q0Osa/D+5EMDROTqrNhFVPaCoH5EaBr6WV9MtCM4fmywLR
	 aZKg/yVacdvZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7732A392E982;
	Wed, 18 Nov 2026 03:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3 0/2] af_unix: Fix scm_stat.nr_fds leak in
 unix_dgram_disconnected()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179497260640.1442014.622308386192174457.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 03:30:06 +0000
References: <20261114162632.16346-1-sidchintamaneni@gmail.com>
In-Reply-To: <20261114162632.16346-1-sidchintamaneni@gmail.com>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: kuniyu@google.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 tkhai@ya.ru, apais@microsoft.com, hargar@linux.microsoft.com,
 rlmenge@gmail.com, egoriluk@gmail.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 14 Nov 2026 16:26:30 +0000 you wrote:
> This series fixes a u->scm_stat.nr_fds accounting leak in
> unix_dgram_disconnected() when purging queued skbs from
> sk->sk_receive_queue on disconnect, along with a selftest:
> 
> - Patch 1 splices sk->sk_receive_queue onto a local list in
>   unix_dgram_disconnected() and calls scm_stat_del() before freeing each
>   purged skb.
> - Patch 2 adds dgram_disconnect_fdinfo to scm_rights.c verifying scm_fds
>   in /proc/self/fdinfo/<fd> across connect(AF_UNSPEC) and dead-peer
>   send() disconnects.
> 
> [...]

Here is the summary with links:
  - [net,v3,1/2] af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
    https://git.kernel.org/netdev/net/c/2c0d5e36aaf3
  - [net,v3,2/2] selftest: af_unix: Test scm_fds on dgram disconnect.
    https://git.kernel.org/netdev/net/c/c550cea62c1e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



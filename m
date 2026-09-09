Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EAF3D1709;
	Wed,  9 Sep 2026 20:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986483; cv=none; b=Y3rZo3y5iT2kV6ZIEyNXvR5x3aEbvqM/aKu/w+sN4x+3DQm1cTa7tviTr8pCZ2BnpPc4QFLRNUiUnrw5OUDFmFzDjNorqJ08UWl6FImqLRPo/J5qoSbYisnQBR7nwoHMvAg9XV8l3eCK9eX1lVKFnlaZM8sX8K9KchTRCinERBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986483; c=relaxed/simple;
	bh=BzLX1ZZliKiOD2oXK5aMHbVlgkXSOf00xqrFRfJqXsc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cyOSJ8STgIa1NwtnWa+bXQzvAPydBkWg6VXFLR3mxHe3OdcbMGxwGVnsZjum3W1jgyQerbI/CD/J7jXG68X9mZCSmkYmhbSx8Vn+Gu6i3D4CaUzNV1eQdxVAM/s1D2pq3iI3RV2T+ZhCSY1SfZ4tnXU0EhmHMCqZ/WWE38SGHak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5aj+gTO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5aj+gTO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FAB71F00899;
	Wed,  9 Sep 2026 20:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788986478;
	bh=RQGpXLYzSZuCg3HpEhznx8AmP9FCItLaNuyIxXd5/dg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=B5aj+gTO1Zn80uHx8IY1CUeHvvq5x0M4yKxm1Nf6lS1QHZPBiHX4l4Yk0IZWMTPh7
	 Mo4Pa1b4DnEbG7t96tglN+5S5Kny5hWCm03WYmh9t8JpzN3JKPxGf0BxAx2JXB/aEf
	 KTLPB4hCrvjr8DqYjjVKoEn1MsdL8/ZUvGwH6d+zZMp+CqYFY1OyKYI6+6xT5H+urB
	 rTvNCF79KczZO8tV6ouhQwcWXjB4EX64TOdyBF0pB5w+C5h/Wgk0WV0SWNCFCedFDB
	 iu5NLP4fdU0YrQlcAiilB6cZ3Qqm1mpGaTvl5PLxyQCeplTNrvJDbpJXQ0H9IJZ5+X
	 sUdv8rnB1EDpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56897380AAD2;
	Wed,  9 Sep 2026 20:40:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: drv-net: warn if LOCAL_V6 has DAD or
 not
 kept on link down
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178898641588.1048067.1729889964684658940.git-patchwork-notify@kernel.org>
Date: Wed, 09 Sep 2026 20:40:15 +0000
References: <20260908181956.1357684-1-kuba@kernel.org>
In-Reply-To: <20260908181956.1357684-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 adrian.pielech@intel.com, sheenamo@google.com, przemyslaw.kitszel@intel.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  8 Sep 2026 11:19:56 -0700 you wrote:
> napi_id.py intermittently fails to start its helper on Intel and Google
> HW runners:
> 
>   CMD: /srv/netdev/drivers/net/napi_id_helper 3001::1 37569
>     EXIT: 1
>     STDERR: bind failed: Cannot assign requested address
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: drv-net: warn if LOCAL_V6 has DAD or not kept on link down
    https://git.kernel.org/netdev/net-next/c/3929f55da21f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



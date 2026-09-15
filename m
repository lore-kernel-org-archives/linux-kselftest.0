Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636D83BB665;
	Tue, 15 Sep 2026 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478477; cv=none; b=q5TVSpo6MDB55Tnnb6+1GrG2/OM5708W1LW2LxDYWMiU0UGk9CZmFYz4OVBrP38AABKvt9oqPx4UkxzhHf2lJ/ZN41aixuk1YM7mZzqa26xaq4RG/cCww0oN2sGF+Tm+2qPwMJF1jotJbnBE3tyMNttyIHjmhYU53IGNrvUivbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478477; c=relaxed/simple;
	bh=+JsWzmN2x7ok/jbVtK4ryUsxYFRqDmntcO4U2+A7bwg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MwnNlNwhqOfH3B0gVTQo2P0JWkrbONEiwtBlvAuQ5rjvIMHu3tFlQITBX/6tZ25+5ECEaGkJxAi1YliYOryboxpQfX0hvqVnxQspdy6BdZkDZxRZQlqyKjXRdxGj1Q+zXkL8CPd7af2Xvg7YOwu2QayIygI1Wb3TkR98pHlnXYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbaBz4Rw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbaBz4Rw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3701F1F00899;
	Tue, 15 Sep 2026 13:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789478476;
	bh=iZ0OT81GnnfBo2UbN0m1x6+zUTdGfgm9PS+qco9aLzQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LbaBz4Rwlp8d+BVARhq1NHMFTRL6WBfyRGGbRxbj+NM2vRk0OiOM2Ks0/wPwsd93A
	 dDhvcgurOhhsbBVWFPo5v+P0AaZBaEb5+xUrJWbxtt0SeGo14XtJuRVER9bowG2S9v
	 JmcM95nLioO8NGDJYm7dL1DEZU08M2ldAQNi+bvr+8hKTC4JIvKrQZ2f/dOaiM7HKo
	 g0WbPDpQmJdNCBxEPosXtU5AiBeyYHXlJU2cHadmKyTX4VvL3AkEXgGjeUJCUZiOvH
	 WY9j7cxXURmK837KCBBG0grpi201dkcoI4bkCBs/K1TL16DOZzyzZsAsw4Oj4dpjDF
	 lXtopKLHFAPPQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1977F39263A5;
	Tue, 15 Sep 2026 13:20:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] selftests: drv-net: devmem: set reuseaddr on
 the
 sender's source port
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178947841062.1617434.1531485800956403325.git-patchwork-notify@kernel.org>
Date: Tue, 15 Sep 2026 13:20:10 +0000
References: <20260912203101.153688-1-kuba@kernel.org>
In-Reply-To: <20260912203101.153688-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 leitao@debian.org, bobbyeshleman@meta.com, shuah@kernel.org, sdf@fomichev.me,
 razor@blackwall.org, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sat, 12 Sep 2026 13:31:01 -0700 you wrote:
> devmem.py fails on the HW runners with:
> 
>   CMD[remote]: dd if=/dev/zero bs=512 count=1 2>/dev/null | socat -b 512 \
>     -u - TCP6:[fd00:2::1]:50051,bind=[fd00:2::2]:50051,nodelay
>     STDERR: socat[41018] W bind(5, {AF=10 [fd00:2::2]:50051}, 28): \
>             Address already in use
> 
> [...]

Here is the summary with links:
  - [net-next,v2] selftests: drv-net: devmem: set reuseaddr on the sender's source port
    https://git.kernel.org/netdev/net-next/c/b8e9e7d82e7e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



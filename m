Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33D73E1718;
	Wed,  8 Jul 2026 08:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498231; cv=none; b=WTb3FbA9NU8jRVLY4KUB9DPTM6hnlwGJynQnhx4teWiiUZJtvejVu98dLA1DonHa5UMOwYHWkKN8TY/+8gEzrzzqxqyRfijc87qC7mySrrAWjIVqCj+DZQ0Jmx0wgpXcerEt1VgK1JZXKbcWvfxgqFDOSsDzALyeWaUZq8SzfIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498231; c=relaxed/simple;
	bh=iLIjsb8tRTcX/YPNIypN3llBDzQOK/o6qMYkp7pjJdQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SM0+MecKf6l/KTdlQotPyqB3dDa9ADqbT4FSNDdhg6Tj/dpb97pT/YX9hLHMo2h/CFcai6gwYAD7+VFbvsDPXy/G0ZZcz3D0rfLIqBrCkpRHp7abSnVFRxORbH6/LwSJ6tPPnee+7PWx1HmK8VX78B2y3EdJVgoQFA7DQXinj9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RwVZm9cC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RwVZm9cC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E051F000E9;
	Wed,  8 Jul 2026 08:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783498229;
	bh=BWUQKtaGcIWy+3Ddut53BrtJ3jcIrpB39/3J4wJRA9c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RwVZm9cC6SmHA3bTPiMNYwTL4P1dFncP1udZRWx0HYzAFZ+AllKR54NbZBLEVnK0y
	 w0QqDCQ4CKC1U/cXz8bBx99FYAbjh8iaXKZjJVbdFDFG0Vh+lr174hUxWCrQbk1/DR
	 tlhtNq04usSmvgYMzehIAwl3d1FjcnkhgqaZkvtcP79kDYNaPsq3UyII0x1/GD5dhh
	 QgMlMr05fCoG49ON/SpOqqw6WfDOM+6aPVVSk6YgDUX05fJkcQ/jcuy03H6zid37xn
	 zgVBgX7jyizVeGVAWXZcGG5Sds4eYPK51xaHFio8NSXFjBSxodV6m3g3if5HtC68e6
	 DTV/ENpFtBZLg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A9A3926383;
	Wed,  8 Jul 2026 08:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] selftests/net/openvswitch: add output
 truncation
 test
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178349820913.2361978.12788467344075013470.git-patchwork-notify@kernel.org>
Date: Wed, 08 Jul 2026 08:10:09 +0000
References: <20260702074926.1174810-1-houminxi@gmail.com>
In-Reply-To: <20260702074926.1174810-1-houminxi@gmail.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 dev@openvswitch.org, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu,  2 Jul 2026 03:49:26 -0400 you wrote:
> Add test_trunc exercising the OVS_ACTION_ATTR_TRUNC action. The test
> verifies truncation limits in four steps: reject trunc(1) and
> trunc(13) which are below ETH_HLEN, confirm normal forwarding works,
> apply trunc(14) which truncates packets to the Ethernet header and
> verify ping fails, then restore normal forwarding and verify recovery.
> 
> The kernel requires max_len >= ETH_HLEN (14 bytes). trunc(14) sets
> OVS_CB(skb)->cutlen so pskb_trim strips the IP payload at output
> time; the receiver drops the runt frame and no echo reply is
> generated.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] selftests/net/openvswitch: add output truncation test
    https://git.kernel.org/netdev/net-next/c/a211b03fee2c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



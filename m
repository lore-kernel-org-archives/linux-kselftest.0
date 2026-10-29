Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793232607;
	b=feqGLE0CPi5DS99OVVfocgki7Sx/i9hfT9ZAPF+BFAD/LbTR40LY0oYrPuNHgfyuWH9I
	 6ig03gyY+cytSF1KtQ0M+jqGRNEkxN0vGDRnuxZdRMJsLhtrBOP8peCqjNUkSTqnW7I9D
	 dshZi0HlKww7Ua8jUBVuWSsEZr5jA7fYaBuSDi5KTX4TUuEbGlmpjBSW3She8oEcH0hBP
	 uTufEENFv+6sqVJIfkzodrEgXJRD4QatTo6IQLLHtfd9/l0zxj1qgT9XFL4CIMhN53ocX
	 wI06sS/DEXGhLZro7ayux3lWZpAKwvm4YhJlYFMq7w5CmVOJwzBStpW2+ADtALQE61Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793232607;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=3OfQ2QSCA9DJafXL9xcwhSxMAk4hs6Y1SWNeM5iir/s=;
	b=fsVim/YjJ7iyPK2FMCru6BVx7Z8Dl4YO4VUOCwwKH9RYYmWOhR9N/ku5cTm5O9g1KQkX
	 EmikJQlXiJS9vrNxa6a791E6AmU6iDIRwgC2TWNs60Bz8MvQH15b7t04UBIqyAQ4X+V9M
	 0P46e+IoPrc6HQpo17EYgpvlT6g4qi5E3cwLT0qw+jG6QKyZvXHfUkXdHGkDIZT8H4FQy
	 IUbVZOXndwl3DxTDExJQKBr8w/xHZZbG0XtzWYJE8ji/4Hds/kUglfVsIuJ2/ChakLHpl
	 431+m24GV/rfzG23VpnwiRmxK4rul6KIgSnRF8XEbDLSp4tPR6dn7CbyQX5g2ZWOvTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GC9n5+AE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF337606A31A;
	Thu, 29 Oct 2026 00:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GC9n5+AE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6B31F01825;
	Thu, 29 Oct 2026 00:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793232606;
	bh=3OfQ2QSCA9DJafXL9xcwhSxMAk4hs6Y1SWNeM5iir/s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GC9n5+AEcEImq2OnRRCiTvlvbuvBMi5fA8l/nxnEYh6VCoNh2XIWKNSRlkDLvPiKJ
	 kAZnp3Zg6eX4Kxxc88631fotQ7N4XkyiYQP57eDZsq3oUMlfI20XNqllE7DDpdBzqF
	 Hzdsdc1MEzR32PHBd8npAB+6c0WpmD4xjzhxVrHpF2d0FJ0fyUe0yru+eg8vTSl8dB
	 CRXrpNo3t7QR9vUSpNuG0zJaQ0HeYAcotG98U3ck+C1ks7Upl66Dnjn/z27bocQeRV
	 GUASe1l7Jf2TGnDsBiGd7Yf9lIuy+iLP0nG6RdmjYGbdhfJRsMrntPFDpWDt9NnDVG
	 dGJUnkhe98F8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 444B53AAFC4C;
	Thu, 29 Oct 2026 00:10:06 +0000 (UTC)
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
Subject: Re: [PATCH net 0/2] tls: Honor O_NONBLOCK in tls_sw_splice_read()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179323260507.1489873.3011023044538122487.git-patchwork-notify@kernel.org>
Date: Thu, 29 Oct 2026 00:10:05 +0000
References: <20261027015215.605919-1-kuba@kernel.org>
In-Reply-To: <20261027015215.605919-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 sd@queasysnail.net, john.fastabend@gmail.com, shuah@kernel.org,
 cel@kernel.org, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 26 Oct 2026 18:52:13 -0700 you wrote:
> Extract the O_NONBLOCK fix from Chuck's zero-len record series:
> https://lore.kernel.org/20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org
> 
> The first patch carries the fix. LLMs love to point out the missing
> O_NONBLOCK as a risk for the zero-len record change so let's get
> it out of the way before working on the zero-len record fix which
> is more complex.
> 
> [...]

Here is the summary with links:
  - [net,1/2] tls: Honor O_NONBLOCK in tls_sw_splice_read()
    https://git.kernel.org/netdev/net/c/78ded647d43e
  - [net,2/2] selftests: tls: Cover splice on a nonblocking socket
    https://git.kernel.org/netdev/net/c/7c5d62eff700

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



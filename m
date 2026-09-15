Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E5E19CC0F;
	Tue, 15 Sep 2026 00:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789431075; cv=none; b=ckt5BDtlGH3eEw6XA6EXjrHG2vqMAz9ySP6WnuZSjoADp3k2lpbk/fxZh9xCqZxjFrnbU3oUGIhwMfnu65aaWpTy8DjRDe9adZExkbL3kZpkVSFH88/Cc2yIRly4hZPaLBNWdOyq3Dcp0xYORDXK1363ZplhzCk3cNp044pVrlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789431075; c=relaxed/simple;
	bh=GQf/BOAkMo/P6Fsf2BTiwDKiS7JANHnzXWDy/njbSpw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=s0u3pDEm/OOJxmdu6+Va9bLk2M3abVZrnGNk2jSaXNmEFajvDrKLrDJd7TTyJfLL7HiG4T0SXskCfAtYqetknh8JJGaiCcMv/l64RFjpEv5pSty2xe4HYyMTPeyUdc9nQ70fJK2VT1Iy+Kzxw6TJg6/CbM1HNcIjlSIh1vO2L2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SgzKZgvu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SgzKZgvu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6769E1F00893;
	Tue, 15 Sep 2026 00:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789431074;
	bh=rGAC2hWYbGNcmeEOj46QW2ijtXzbJ/hXq1FZVsuTiiM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SgzKZgvuVnTd1nbgi3EUmRworHHvxsPg6FrheWI+iFVc4OxKCtjcrgFLStKYyyvIn
	 Pdi3dB9A2hU2YNkZOrijiR+MbFxEuSmV7qVoENlJb/duPZnrElOMlGX0XJNDE1i3kx
	 ij6QpfvlvEeU/xVuxm7v2yAnAeolIDlWgim8Pp55NsYTZRcXBHnAtJ7CPDPKC0S0f9
	 Da9YA4GSX5f+/0wBC5DGHKm6E+UrtTGhqxVcQ444Dfv5u0OEOUGC+05gBqXrVCWHv9
	 YQArxBCgQKd8S/8UHV4Rys50KDzuvlJaKE4bblDMpyPSmapgoe+yhM6iYXFrRGMYqt
	 k5qYBasN4pILQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A133924FFC;
	Tue, 15 Sep 2026 00:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] tools: ynl: Fix out-of-tree build for ynltool
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178943100912.1280100.2980454318334356104.git-patchwork-notify@kernel.org>
Date: Tue, 15 Sep 2026 00:10:09 +0000
References: <20260911164135.1428140-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260911164135.1428140-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, bobbyeshleman@gmail.com,
 donald.hunter@gmail.com, horms@kernel.org, shuah@kernel.org,
 matttbe@kernel.org, sdf@fomichev.me, nb@tipi-net.de, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 11 Sep 2026 18:41:33 +0200 you wrote:
> After the blamed commit, running a out-of-tree build for ynltool fails :
> 
>   # make -C tools/net/ynl/ynltool O=/tmp/o1
>   make: Entering directory 'tools/net/ynl/ynltool'
>   make: *** No rule to make target '/tmp/o1/json_writer.o', needed by '/tmp/o1/ynltool'.  Stop.
> 
> ynltool's Makefile correctly accounts for $(OUTPUT) to get the list of
> object files to generate :
> 
> [...]

Here is the summary with links:
  - [net-next,v2] tools: ynl: Fix out-of-tree build for ynltool
    https://git.kernel.org/netdev/net-next/c/c0bb05f2d19e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



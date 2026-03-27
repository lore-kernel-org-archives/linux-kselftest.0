Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5935519DFAB;
	Fri, 27 Mar 2026 02:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774576823; cv=none; b=A45K981+kjZwADhVmt/qDbNV7Tj6eGxYgNJYhCNpcOMZzCr5U18GUz6su+/O7RISnvsIWkkB1NhzymAnC+I1MlZBubd65imzE5aVJpESTDcDjSIQTyw9x+I+bdgRrbyRwUQOCc71ynPGDuiRXhmXPgHBp0aA7XdAdJ2fsrhEW7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774576823; c=relaxed/simple;
	bh=TCG5jlX9DJKAtBu1/6DKurvT+cHPOipTgn1Rr2S3Vxw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YG514Xti0TQcKQzYPugg1amkCX/drtJxdFqWZNS54kAve0VPdD2K1VLlNubS31F3mOyGlTYiTD+ukvMRgS68dBgv9KWiC+sQjIQQD1ffGyENp4sIXO68aRXWihBehOoi+n+8Vzr/aY1Eytv4zMOPwBqi7ra3j/LkksGr2c2j/kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=km4u8iZL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="km4u8iZL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA1FC116C6;
	Fri, 27 Mar 2026 02:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774576822;
	bh=TCG5jlX9DJKAtBu1/6DKurvT+cHPOipTgn1Rr2S3Vxw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=km4u8iZL/2TVux6hMiZQI7TpCWoQCnoUF0HIwPWVwuhICN4cbyxMb3kTGDmphkImP
	 ZMG7daXAYVTC3f0SraiTMYYSSR1QIh/bKMS/Kut9HJjlWY8EjA6K5srYvGvR+XM8kS
	 QHzBlyjWpd1XYPXpp0/ZuG6L+I791x+48zmc+dW7E8upY6H6sFEZtivYxN5M6RZbz/
	 A3yFdED66xru3cmg0LmQjNglVaiMZoz+vgXJOnVCVFUqMY6IYvoN4+BnNIReVSzaBb
	 M8ryc6kz3zD6+S3jcIvSkzTu1U9Xqd4hs8Jjqgl1jBvhS3kNtMJhUQA/yBHqKhalSk
	 hxYD0/NkXdg0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE7E3809A07;
	Fri, 27 Mar 2026 02:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: net: Remove unnecessary backslashes
 in
 fq_band_pktlimit.sh
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177457680880.3259194.10020144008504466264.git-patchwork-notify@kernel.org>
Date: Fri, 27 Mar 2026 02:00:08 +0000
References: 
 <dd0bbd48cdf468da56ec34fd61cecd4d2111d7ba.1774372510.git.yk@y-koj.net>
In-Reply-To: 
 <dd0bbd48cdf468da56ec34fd61cecd4d2111d7ba.1774372510.git.yk@y-koj.net>
To: Yohei Kojima <yk@y-koj.net>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 25 Mar 2026 02:20:28 +0900 you wrote:
> Address "grep: warning: stray \ before white space" warning from GNU
> grep 3.12. This warns the misplaced backslashes before whitespaces
> (e.g. \\' ' or '\ ') which leads to unspecified behavior [1].
> 
> We can just remove the backslashes before whitespaces as POSIX says:
> 
>   Enclosing characters in single-quotes ('') shall preserve the literal
>   value of each character within the single-quotes.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: net: Remove unnecessary backslashes in fq_band_pktlimit.sh
    https://git.kernel.org/netdev/net-next/c/5f70b0aa08ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



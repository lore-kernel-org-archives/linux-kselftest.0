Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794005419;
	b=gbFoDYjnIPH5lo77JWDMAID+AN/n8ipKN2HMKWB7bGk4w8oXbF5imVZCQTSQX2CRkM/8
	 VLoS8+uWxLN+xWKB/3eO0M94bRs5SYEcX3h5ZVwQlZ146TLaOrqR3/ZEuCSYd0mfI9Yuu
	 iJWh806Dfn/VR98ouINxWF8JxeI1/9cULamvKyN7S5utoGifLYXuqNFm3ueH3yTcHQNp7
	 KmDiYk1dLpUrf74BlY3FFCBM28k7kFuX5GSVMeSdCjOWNy6dYtqktLnnk4nOR1nFVmjS7
	 qCH8z5vuxsuPsMOFH4WYE7fLbZfc0XCN6sjMjplQBtNjl2f6OwuOuGHZKKBP7LEz2Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005419;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=kVSZlg+coqlqTtd3KHIlKa1aqrcGGov3aTo34aCUlHc=;
	b=dnJlUJURRzNqZQiaCMtY9UZH5jVq4aBIdJJdtC8Nwy1tbcRq1H26kyN2QbuhxdugFvmY
	 /kGJuGyhqvtcToYExK6D5NEH1HO29BDJmeS0H81ye2Spr51z46LASW1DU1Twi/1GuQAg3
	 RnyoFQ98pQbGJTnvi2qoJoIho/3+I5if/SFf2FbRIbSK8Bgu+DjyxZzZCusMpFbBCwvGS
	 DkptdYAQZko0QksoZARs8ifUh5Z4l/KN3eNL3KBUIkcw8qH7okbDuFZkufK/HRmjp2DB1
	 9ww/vRkhIXrT7KSe5dDijUCIBAewHBVS2IqP0I2lb4sWay50pXg4HH/HllLZdwPtWAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2ULX21t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE392606A32E;
	Fri,  6 Nov 2026 22:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2ULX21t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64FD1F0089F;
	Fri,  6 Nov 2026 22:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794005418;
	bh=kVSZlg+coqlqTtd3KHIlKa1aqrcGGov3aTo34aCUlHc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=N2ULX21tEXOFl+r5WH/Ku0lNrjfaxwKzGkvluZpS6HkJY1yd06l6H/MkLpxMKpLgL
	 lDRNKhyXX1rpbd+OqRvtfyg2HrzR+YeBA9VkImBEWRAUZ17TQGAfX5kRcaO1/BZsCX
	 1xB7w+oRYWYtDwcWt7eJdr9TVXy4R3Ek+1cR9xZAxYNkg4d91xXwHt2vvIBqCisfpt
	 pdt2oP4fWqTJrXD+007Jt8/cDyWROETzxMLu3jfHLmUA9rno5EDNBM99Y8Jpysv4s/
	 QwDzaA0zyIQ+13WIFys1Dc/pVlQiLHSdWHbn+GXmhU8CZ5ZxQlR1cjmb7tEa6yZfsz
	 LJyThCu+xTwUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9B06E3A55EC2;
	Fri,  6 Nov 2026 22:50:18 +0000 (UTC)
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
Subject: Re: [PATCH] selftests: net: tcp_ao: don't shift a size_t by 32
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179400541710.914342.1000916058615747382.git-patchwork-notify@kernel.org>
Date: Fri, 06 Nov 2026 22:50:17 +0000
References: <20261103163921.641347-1-sashal@kernel.org>
In-Reply-To: <20261103163921.641347-1-sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, 0x7f454c46@gmail.com, horms@kernel.org, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  3 Nov 2026 11:39:21 -0500 you wrote:
> gen_tcp_addr() shifts the size_t n right by 32 and masks it with BIT(32)
> - 1. On 32-bit architectures both shifts are as wide as the type, which
> is undefined:
> 
>   aolib.h:230:40: warning: right shift count >= width of type [-Wshift-count-overflow]
> 
> Convert n to uint64_t first and mask with 0xffffffff.
> 
> [...]

Here is the summary with links:
  - selftests: net: tcp_ao: don't shift a size_t by 32
    https://git.kernel.org/netdev/net-next/c/dc8410e0aad5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284806;
	b=Z4tj4qnvn2M8qM5HuDrc2RD5s1mIKe7yXltt9DxoTWOCgVcoceI9qBsBKzpDc42TNOw0
	 TCpX+FYFBLQW+ouKrBE3oprqRiJU5EzIz74tkBICwrC8dgD5t60iLM0FISDoo34xukGd6
	 +JtSmTFOgWYnk0xPjgntoXhHdGT9iLfAjdwk2UC2hTbuxZ4rffrjOoxem91N4og4bE2WT
	 +HWHZhEX4jm7rhauU2ciERJkVBqQDx5poVpUEfB0KlQMpkAZPg0KGgNlVJDgAJfCaBtA1
	 cwf8AFHZp3N/X790QITpSJKTCqb8oxBXzjaS9R0Byn6PT72iUpTt/BLHbVaCHrso4NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284806;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=BJy8jN0yBfhdZXtjLtbSjYoRw/ncuFMRQddUFR4swPY=;
	b=v6bXoCXZXQ8wraW48WeDgDgtbNzzwZhok08tlKx/i3WeelpZXNnzgnCmmTPrqzDT39Cc
	 QPZY4VPjz4w3Eo8OQ5Rr69y2tMREuMTHszUC4J4RwQWlZ8YzBuyEUMVGUBcxWB3PBXSDh
	 ziCunzgWJDN2623etQ7ElrwcrD2zMs8tGyiJDy8+wWO520qqxwLiHNLW2UHOyD69W/red
	 93wJUzB95bZs9KoxABW1LKs3WCVzfCTbA5KG9pDjpHLPXeow/ta4V3sBf3fxaSCUyFJlG
	 ojsGoPt6IQUGGZaHJcm4GCTVbqW4IVs7K2z+mmy/chd0UHaVxykfaXawXiOT543Dm7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Fp3ufC/Q";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD60606A31A;
	Thu, 29 Oct 2026 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fp3ufC/Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEE81F01825;
	Thu, 29 Oct 2026 14:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793284806;
	bh=BJy8jN0yBfhdZXtjLtbSjYoRw/ncuFMRQddUFR4swPY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Fp3ufC/QrGFHMg7LnePVZdqzzwvMyr/qs5pFm1/JrrD4IOWSc/pFdkf2lZwk/fKu2
	 K5vQz0Yp8SEa25USPt4emKJotAWJBAeeX/z4cKyYCsC4hN4GacWic0FjMtdTgBoK2a
	 hvTbyHKnPiIvXcdp9QVUmkJn8RaQrKA6kMpPMVq46OlPWrsKhxGxdUjqTPtButNBvA
	 Dd+l/u8Vdi9KRPpc5g2RfU0oEzqGrIQf5rrhlhHH7m2UV74jkQtxhfKINxHHXQx71P
	 l7BYetbTk8/T9A/OeFJkxxNpA6puscM0H3L0leU/kjvwxNZfagUSXdO9ESv7wbslF8
	 JkZY5puAu2cXQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 031F5380821F;
	Thu, 29 Oct 2026 14:40:06 +0000 (UTC)
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
Subject: Re: [PATCH net] selftests: net: txtimestamp: fix out-of-bounds read
 in
 raw UDP checksum
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179328480480.499212.1458877940988302168.git-patchwork-notify@kernel.org>
Date: Thu, 29 Oct 2026 14:40:04 +0000
References: <20261027162945.2122306-1-jamien@nvidia.com>
In-Reply-To: <20261027162945.2122306-1-jamien@nvidia.com>
To: Jamie Nguyen <jamien@nvidia.com>
Cc: willemdebruijn.kernel@gmail.com, netdev@vger.kernel.org,
 kerneljasonxing@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 27 Oct 2026 09:29:45 -0700 you wrote:
> With -r (SOCK_RAW, IPPROTO_UDP) the test writes only the UDP header and
> payload, and the kernel adds the IP header. get_udp_csum() still expects
> the IP source and destination addresses to directly precede the UDP
> header, and reads 2 * alen bytes before the start of the buffer: 8 bytes
> for IPv4, 32 bytes for IPv6.
> 
> ASan reports a heap-buffer-overflow for both -4 -r and -6 -r. Without
> ASan the read usually goes unnoticed, but it faults when the buffer is
> the first chunk in the heap. That happens on Ubuntu 26.04, where the
> kselftest runner wraps the test in uutils stdbuf, and txtimestamp.sh
> fails with SIGSEGV on every run.
> 
> [...]

Here is the summary with links:
  - [net] selftests: net: txtimestamp: fix out-of-bounds read in raw UDP checksum
    https://git.kernel.org/netdev/net/c/8daacee78b3d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



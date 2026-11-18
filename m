Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964813;
	b=wbDND8HvEHwooa2+D+nK5W6g/JbZj4iMp+5ER1A9TKDPRKv2Qz/hwiGRjBbNW3G+fuy5
	 IdTugUeXIVkFW8oa5LMuZ6p1II2cRw88BF2kOApgV/t0jr8XmCThzoGCu1KfJoUgxoE5a
	 MpEVWkR7QmbRVq9tyBmPOeSw+Y7xuy3uFj5S+h+2s/ypkWvvhg5FQO2hYnDCtiuOGLJV8
	 4Bb2fzcGc9lSEZnOoCRMsm8ydZJpKbl3fHA8CjpY24Pz+3wQnlpvwiBfc/k9OR3ceT9U8
	 bQ50mK/m+glAj9dwfmezYrgdAKvye1nHOXJ8xriDACV3MxDWg+RUWqhhqZxUS0X3fdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964813;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=YSeB2zSn19zr00abruzS6S5cQ9cct1WiCzWW+NfHq68=;
	b=A3qKesHbG8RCbmZoi67tM0QzPrlQEP2Gj9nO5WWNGgdTAoCi7BViUd/V4PpvuGJwhaCD
	 6oKlhSQslxSdnGCfroh3pHOW0mD6cBK6MC0azJaHwgMyMPJ9uMi85m4+W0FIVEJJkfiMD
	 h8nhSDXYODziWq/HaKGxw+l4ZcDe1QKbAtLRjttlen7nWaJJp24FeIJlxofZMNxz0EiX/
	 CuMVNSE2/CddSKP9Ay5nps+cInMEoOLGL/qB08B6UtFrmSgHJgogyXiZ0cmdKmUSka0JA
	 eZoPYbxN//ZjoC013xQK3o52YirBBG+JKqPu+umSnXQxWZDUso0+FRsQvImJLqqY+/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hN8JR59+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C19606A32F;
	Wed, 18 Nov 2026 01:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hN8JR59+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456341F000C8;
	Wed, 18 Nov 2026 01:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794964813;
	bh=YSeB2zSn19zr00abruzS6S5cQ9cct1WiCzWW+NfHq68=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=hN8JR59+lwxUPJNzOvu+1zB/mXWQJoJ/iz98r/82DaqlWvs9Hl/dkBH079DNBOhTd
	 ld8/AAhvPI1N9AjTf9ZJ12i3qZtZmMlDPIv2kUBJPF1f64JTgwCzLTHgL9mFbGTJlb
	 QO4C8C3tQgRkP9YEBDYA5JXW7CExbeFcicglzmAxMiufzgNISJO1mmULmKi8xY86z/
	 dbTSJKuF0fydwm7PFMyFJhWqKlXGCtoOpUFzljZ2/V+mg6HQrxN/t82i4ABcxTSJhC
	 xE2OKGiha7h3A9zRw6MegLXk1KO9rogbgRjbnM5bPreLr/4oy/BYMZHih+l0Pavdn0
	 NtZzrMzifPWYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A591392B1FE;
	Wed, 18 Nov 2026 01:20:13 +0000 (UTC)
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
Subject: Re: [PATCH net-next v4 0/5] net: devmem: size TX net_iovs from the
 dmabuf
 layout
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179496481177.1388923.4503800514498050793.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 01:20:11 +0000
References: <20261111224740.2744522-1-sdf@fomichev.me>
In-Reply-To: <20261111224740.2744522-1-sdf@fomichev.me>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 horms@kernel.org, shuah@kernel.org, almasrymina@google.com, sdf@fomichev.me,
 leitao@debian.org, dtatulea@nvidia.com, asml.silence@gmail.com,
 bobbyeshleman@meta.com, daniel@iogearbox.net, razor@blackwall.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 11 Nov 2026 14:47:35 -0800 you wrote:
> TX bindings use PAGE_SIZE net_iovs, so a frag covers at most a page.
> A 64KB skb needs 16 frags, and MAX_SKB_FRAGS caps devmem skbs at about
> 68KB, which makes BIG TCP ineffective for devmem TX.
> 
> This series picks the TX net_iov size from the dmabuf sg table instead:
> the largest power of 2, up to 2MB, which aligns every DMA segment. With
> a 2MB hugepage-backed udmabuf a BIG TCP skb takes a few frags. There's
> no UAPI change since TX addresses are dmabuf offsets.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/5] bnxt_en: let the stack segment GSO skbs with too many frags
    (no matching commit)
  - [net-next,v4,2/5] net: devmem: charge the frag length to TX skb truesize
    https://git.kernel.org/netdev/net-next/c/1268fc7c33ec
  - [net-next,v4,3/5] net: devmem: use niov_shift in net_devmem_get_niov_at()
    https://git.kernel.org/netdev/net-next/c/695c74bca865
  - [net-next,v4,4/5] net: devmem: size TX net_iovs from the dmabuf sg table
    https://git.kernel.org/netdev/net-next/c/2f6aaddcfadc
  - [net-next,v4,5/5] selftests: drv-net: devmem: TX from a hugepage-backed dmabuf
    https://git.kernel.org/netdev/net-next/c/3aa96a8a7c7e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



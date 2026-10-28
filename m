Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793231893;
	b=hfPocCVPfKC5y8vhf03wLRqpDzcVqD1oxzuqGINjglGAAvsmwu5jb/fL+jwZtcradAu7
	 kDh2NCTyDa4qDxnMK9y/S6FpxXWC0ia1HP7MKhyNFPAgBPb/jnL0r/Bo2MrFnOasURmIl
	 dDKTX4oTchlRVHeCE/hLVnK/QX67/6NaKV8NgVvs6w9TR5Q0w5gXy6dlqASdwD3tR+laB
	 uk0C1wXg32f9WPFy6xvZAhjejSVJf7Ca5gsIA4LoWhi9lSZ6/GIIRhVl0xmE1bUwLhzyj
	 n152pBEDajT1efhUsA5lDiC1jx5po09iuulp4LJyKMaVimXCYqCRiNjXqOqObbq/Jig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793231893;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bnrI5z48giTBpUWcqK7pPuvlc0Wx2KKMmU5dejUop0Q=;
	b=GHtVEnQzDE2mxw3t7b+I/Dc+QIGrCp/xI4hUkCGIn4xySbMVFX7uGSbfOyoBXp4cojr5
	 UBAlaYlbgLcocCOu0XEUoUSQl0arCFxjiKd294P0Bjy68evVBKLdG2riWRqvv6Pz9WOKw
	 zcF80xrgvK927p9m3Owl0ep5u1lGDZxiJ4lbJeDYtgOVLtZkFxb8evkj3FWwF+64kb16D
	 gO5SUkYHRUEwAtMVZ8VxxtFtY/PrQR5b//rj07OI0a0T7MrhBXr4fAxntMWTFyMrYkyvn
	 3zp1XRW2nl/dh5veye//siMDRQvHIcNIPAtaLN+zBe24iBk7WPyTPEPC2cAHVp3wpow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K7EDLGRw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3FA606A31A;
	Wed, 28 Oct 2026 23:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K7EDLGRw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0421F01825;
	Wed, 28 Oct 2026 23:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793231893;
	bh=bnrI5z48giTBpUWcqK7pPuvlc0Wx2KKMmU5dejUop0Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=K7EDLGRwjHjvtAv2lwMgY+1zn41qCMQDJ6TYGDCpuRRhorZtbVCdwIGpFT6k8+e2r
	 Wf6sd1uO+EN6RRknM6P/Z5+2d/pyGElHYfxavugtopH3UHU7iKIpIPt9MjWHaEr8xo
	 ucC8HY0dxcmVrTSdkaOt0j5bX8/e+7eL+Wb3bl7Igf3V2cpFep7on/DF2NlGRK7MFG
	 RHazaEmuUV6a98HJAQr0E5Kgw3sAYXhsyTLziqSj+vy7TRUN3Lzmax6iitYv79502z
	 qOQRR0WNvXeEch7eimXFq0coGCHoWiKZAWYt1yXTbY95SdOkw7uRWydntzUIgVd/Yt
	 NZNLouJ7E+DJg==
Date: Wed, 28 Oct 2026 16:58:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Justin Iurman <justin.iurman@gmail.com>, Shuah Khan
 <shuah@kernel.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH 0/3] net: ioam6: makes IOAM insertion transparent to
 IPv6 ECMP
Message-ID: <20261028165812.1b40d1d4@kernel.org>
In-Reply-To: <auGryXdPv2mx0qlp@fedora>
References: <20261028-ipv6_ioam_ecmp-v1-0-9b6715b6f4c0@kylinos.cn>
	<auGryXdPv2mx0qlp@fedora>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Oct 2026 16:01:13 +0800 Hangbin Liu wrote:
> On Wed, Oct 28, 2026 at 01:45:28PM +0800, Hangbin Liu wrote:
> > This series makes IOAM insertion transparent to IPv6 ECMP, as required
> > by RFC 9486 (C2): a packet carrying IOAM options must be forwarded
> > along the same path as the identical packet without them.  
> 
> Sorry, forgot to add target repo "net". I will add it in next version.

CI bot says:

The new selftest added alongside this series (tools/testing/selftests/net/ioam6_ecmp.sh)
is failing in our CI on the "Transit input ECMP with/without IOAM" scenario:

  TEST: Transit input ECMP with/without IOAM (diverged on seed 1: without IOAM via
        link A, with IOAM via link B)   [FAIL]
  TEST: Transit input ECMP with/without IOAM (seed 2..12)                [ OK ]
  TEST: Encapsulating node re-lookup ECMP with/without IOAM (seed 1..12) [ OK ]

11 of the 12 "transit input" seeds pass, and the whole "encapsulating node re-lookup"
scenario passes on all seeds, so this looks like an edge case in the Hop-by-Hop
nexthdr-recovery logic used for the policy-0 multipath hash, rather than a test
infra/flake issue. Could you take a look at whether the recovered "virtual" nexthdr
(or the padding/option-length walk used to compute it) is correct for all IOAM option
layouts/trace sizes, since one specific packet still ends up hashed to a different ECMP
sibling than the equivalent packet without IOAM?

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078086;
	b=FZHJfcQ0Pbm75H8rOuM5bK1tfE8BVvWIN8igoBmEsiDbv3SdUcc76WwRmdeSDOEDUBSW
	 QAzL3x6ntDwcrwZ/MKQLscvosQPZhc1gVlMeNTjfj4I46HKtBycplCCj4Nc8E+9fvksjC
	 BsGxdFFIFmCO2hnFH5GQvjsZOJZP4YNa5xi3rxncPMkLxW7zhCvn0UA5Byoz2r1m5GrAM
	 TufMWy/375TFgwHXfrig2tOCsBV7YTON543cuob69ThQp1ckq5fkLMt1Eo6Dhh9cE54vD
	 xCfFoMVg9wAIf+ls1pYhhTyqSXQA6BTvhc/utkHlJqzt9wFCO7Q2Hzog+kn1fcQ4t8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078086;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=H1bhQLtIfRhu5KAqAjgC9nCVZmy6r3NXMjolwdRpzaA=;
	b=eg8X6kzcCW2OW4iEsNRsLZRWbEoB/qWWCrYTt0wDbYJOW4Uf1OkDGsSeBqbnPKsQPwha
	 YUgSLcUuhM1QeNQxJJl2PQEd/ntuKb4qzmFGtJCsDMaC/l5J9PkwxIhdm5vXoObR6IwD/
	 WGxQ2O5gi3RgCBLMXTzVEnXvhTAGCdBue4/0ebhmOoqKIe+PTXw4L28MNCMuJ2Q9GE2Gw
	 HYau0afnjM4MoYUzl1lixzSLZ52IHO4zv0eFlYLXISsjpkJDzZWhVld2KxOCWF0zc+J3e
	 nsHhYL75FscWf39nSgq4Ufv3+lckvRBYAZxLMxxC533lB67wBkQduk7jVxyj+x1Usog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=X5uQIsei;
	arc=none smtp.remote-ip=95.215.58.122
Received: from mta1.migadu.com (out-122.mta1.migadu.com [95.215.58.122])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AC2606A324
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 08:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46AC2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=X5uQIsei
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Y9EVLqGCLJb6bEWtsztP5YW7dfjn2JrAKJzkvnEfwzE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795078083; v=1; x=1795682883;
 b=X5uQIseiNdtIy5kUc5kkUN0fHVDdotCpin2O6LAb54zpbTe7M5FhgnjCAX5I6iMf5sVh8Akh
 SN1nOFFeCGfrpDamjcrNbFOWa71kQECZG5eiq0BoXvc0IpGMQ3/4BVf1T7Zz0ZtCh2OxMeKeOCH
 t63HNmA4ww8XIGjUpfRPpY0E=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id d0654b647b7ec1a7;
	Thu, 19 Nov 2026 08:48:03 +0000
X-Mizu-Trace-ID: d0654b647b7ec1a7
X-Migadu-Flow: FLOW_OUT
Date: Thu, 19 Nov 2026 16:47:50 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
	David Lebrun <david.lebrun@uclouvain.be>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Mathieu Xhonneux <m.xhonneux@gmail.com>,
	David Lebrun <dlebrun@google.com>,
	Justin Iurman <justin.iurman@gmail.com>,
	Stefano Salsano <stefano.salsano@uniroma2.it>,
	Andrea Mayer <andrea@common-net.org>
Subject: Re: [PATCH net v2 5/6] seg6: account for the MAC header in skb
 checksum on L2 encapsulation
Message-ID: <av63tgNtC6__wjWS@fedora>
References: <20261118150251.65-1-andrea.mayer@uniroma2.it>
 <20261118150251.65-6-andrea.mayer@uniroma2.it>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118150251.65-6-andrea.mayer@uniroma2.it>

On Wed, Nov 18, 2026 at 04:02:50PM +0100, Andrea Mayer wrote:
> In L2ENCAP and L2ENCAP_RED mode, seg6_do_srh() puts the MAC header back
> in front of the frame with skb_push(), without adding it to skb->csum.
> The encapsulation then calls skb_postpush_rcsum() only for the outer
> headers. With CHECKSUM_COMPLETE the MAC header is missing from
> skb->csum, which no longer covers the whole packet as required.
> 
> For a forwarded packet, ip6_forward() sets ip_summed to CHECKSUM_NONE with
> skb_forward_csum(), and End.DX2 does the same before sending the frame.
> When the packet is delivered on the same node, a raw socket with
> IPV6_CHECKSUM still reads skb->csum. With skb->csum computed by the device,
> the kernel can then log a "hw csum failure", as if the device had computed
> a wrong skb->csum.
> 
> Use skb_push_rcsum(), which also calls skb_postpush_rcsum() for the MAC
> header.
> 
> Found by manual code inspection of the skb->csum updates in the SRv6 code,
> and observed in a VM without kernel changes or error injection: with
> skb->csum computed by a tc ct action, a BPF tracing program on
> ip6_forward() shows skb->csum missing the MAC header. With this patch,
> skb->csum covers it. Also tested against the srv6 selftests, and with a
> ConnectX-6 Lx NIC (mlx5) that provides CHECKSUM_COMPLETE.
> 
> Fixes: 38ee7f2d4756 ("ipv6: sr: add support for encapsulation of L2 frames")
> Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
> ---
>  net/ipv6/seg6_iptunnel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/ipv6/seg6_iptunnel.c b/net/ipv6/seg6_iptunnel.c
> index 3bc47c5614ff..82b3c2af03f7 100644
> --- a/net/ipv6/seg6_iptunnel.c
> +++ b/net/ipv6/seg6_iptunnel.c
> @@ -472,7 +472,7 @@ static int seg6_do_srh(struct sk_buff *skb, struct dst_entry *cache_dst)
>  			return err;
>  
>  		skb_mac_header_rebuild(skb);
> -		skb_push(skb, skb->mac_len);
> +		skb_push_rcsum(skb, skb->mac_len);
>  
>  		if (tinfo->mode == SEG6_IPTUN_MODE_L2ENCAP)
>  			err = __seg6_do_srh_encap(skb, tinfo->srh,
> -- 
> 2.43.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>

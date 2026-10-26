Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793056950;
	b=f+1YUj9/Xl/P2ZPRl8yDxc67L4vm/p+BFDW6C+h8NWOGdmRIlbpGTUsg5V0mM9oLxohV
	 4OvLRg/bzOpHZg996ILRYc00eJwYUb/nhrDekPEKwbZTif9nh7YxjWUs0qOQlACK//G4F
	 nzJ0BvTmY4CI3zsEBoTl0hDuHGmhhJUczmHoIneJ/q5Q4HFrTITYeSSFJYv9JdnHNflvv
	 HXSu/2t4pWf95inAnyYxIkB7i4ZMvw/NYJh2nW4Ngw043vv0cEFjJ2p9OU9kykhUKE/eZ
	 Nf3cifa4k023UMvcw6g77DzJ89dBIlQAagK5TH2U6aC19ZiUJPxsOdWmSaObrZQevXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793056950;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=VQi76aZsHSnfP5+RWnTNJp9RYYg8+NeBCNLcRHQmMbo=;
	b=1kj29DpypyZTSUrpaJ3n1xG0JV7ogOXCS5QPwxMDyC9XMY8peMo2ibPeenZCrw51x/nU
	 L9n/REj8S+3KGdwmFPoLIahwq6Ou0GRc3Z8mIgRggBusHtKN3hf/Ysr8hNqVXnXauQIk3
	 1ljrgHQM1BcfDIa2Zbzoo6xJoOeNYXrpWah3e30ZUaB5eaUvh0LnIhNBJoRP55aoKlrx0
	 0knWysvJmrawsxuEaAYYZDVaQSiHI8OID47fvq7VQHuies177YMLUQtBEJUrME60+OjBK
	 pYfm32SmCdzs15qNMz+uRtBFqyUX44Lh0Mrk+HKhanI96W/MPQtC0+wuNghGxzF0+AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1acaGHA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C75606A322;
	Mon, 26 Oct 2026 23:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1acaGHA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A689B1F01828;
	Mon, 26 Oct 2026 23:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793056949;
	bh=VQi76aZsHSnfP5+RWnTNJp9RYYg8+NeBCNLcRHQmMbo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=n1acaGHAVUUzPJs65rtszWmauyrOg2LYJUYCYKXtC9YshIYeAyp46aLezhDULMxTg
	 UGOLl5DYfICbGiypWgJDFA7C0aeYojsoA5zeLMpXGz0qdpymRDboLcnFPitm8DIrNb
	 i9wXYatq3EsU3xvivVZ4SOhkU6qsmLqDslS2A+aVqdfKn3gijCNx8vHsGBNpDPROJD
	 1cM/wLmb6Kk6plw6CZBtZT7YZVz9uUSfD7DHBdC6op6ux67Dxc74hV2C9RNlTSYn/+
	 O27yQ67eEZW0DdjbMH0L0MLeExdJ7+yWgUfYbGvBwO99Tkj/OlRwhNJ8KORrgq+a5d
	 7b1h8pYgKNFWA==
Subject: Re: [PATCH net v2 1/2] psp: fix transport mode encap with ipv6
 extension headers
From: netdev-bot+sashiko@kernel.org
To: toddfreed@meta.com
Cc: netdev@vger.kernel.org, daniel.zahka@gmail.com, kuba@kernel.org,
 willemdebruijn.kernel@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org,
 raeds@nvidia.com, rrameshbabu@nvidia.com, cratiu@nvidia.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bjorn@kernel.org
Date: Mon, 26 Oct 2026 23:22:28 +0000
Message-ID: <179305694824.3134.18415422493301271111@kernel.org>
In-Reply-To: <20261022223014.556388-2-toddfreed@meta.com>
References: <20261022223014.556388-2-toddfreed@meta.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The updated kernel-doc comment on the exported
  psp_dev_encapsulate() says "With IPv6, they go after any extension…

--

psp: fix transport mode encap with ipv6 extension headers

This patch changes psp_dev_encapsulate() to walk the IPv6 extension
header chain. It now rewrites the nexthdr of the last header in the chain
to UDP, instead of always rewriting the fixed header. Fragment, routing,
NEXTHDR_NONE and unknown header types are rejected, and psp_dev_rcv()
does the reverse on receive using ipv6_skip_exthdr().

> diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
> index c9c1a8826b7f9..0c009d7b08c00 100644
> --- a/net/psp/psp_main.c
> +++ b/net/psp/psp_main.c

[ ... ]

> +static int psp_ipv6_nexthdr_off(const u8 *hdr, unsigned int len)
> +{

[ ... ]

> +		if (!ipv6_ext_hdr(type) || type == NEXTHDR_NONE ||
> +		    type == NEXTHDR_FRAGMENT || type == NEXTHDR_ROUTING)
> +			return -1;

[ ... ]

> @@ -243,7 +280,7 @@ static void psp_write_headers(struct net *net, struct sk_buff *skb, __be32 spi,
>  }
>  
>  /* Encapsulate a TCP packet with PSP by adding the UDP+PSP headers and filling
> - * them in.
> + * them in. With IPv6, they go after any extension headers.
>   */
>  bool psp_dev_encapsulate(struct net *net, struct sk_buff *skb, __be32 spi,
>  			 u8 ver, __be16 sport)
> @@ -251,10 +288,17 @@ bool psp_dev_encapsulate(struct net *net, struct sk_buff *skb, __be32 spi,
>  	u32 network_len = skb_network_header_len(skb);
>  	u32 ethr_len = skb_mac_header_len(skb);
>  	u32 bufflen = ethr_len + network_len;
> -
> -	if (skb->protocol != htons(ETH_P_IP) &&
> -	    skb->protocol != htons(ETH_P_IPV6))
> +	int nh_off = 0;
> +
> +	if (skb->protocol == htons(ETH_P_IPV6)) {
> +		/* UDP + PSP after the extension headers, if any */
> +		nh_off = psp_ipv6_nexthdr_off(skb_network_header(skb),
> +					      network_len);
> +		if (nh_off < 0)
> +			return false;

[Severity: Low]
This isn't a bug, but do the comments on psp_dev_encapsulate() describe
more than the code accepts?

The kernel-doc says "With IPv6, they go after any extension headers", and
the inline comment says "UDP + PSP after the extension headers, if any".
However, psp_ipv6_nexthdr_off() rejects routing, fragment, NEXTHDR_NONE
and unknown header types. For those, psp_dev_encapsulate() returns false.

Callers such as mlx5e_psp_handle_tx_skb() and nsim_do_psp() drop the skb
in that case. In the selftest, a socket with IPV6_RTHDR set ends up with
its data stuck in the send queue.

On the RX side, psp_dev_rcv() already says that fragment and routing
headers are not supported in transport mode. Could the TX helper's
comment state the same restriction, so driver authors know that some
extension header layouts make encapsulation fail?

> +	} else if (skb->protocol != htons(ETH_P_IP)) {
>  		return false;
> +	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261022223014.556388-1-toddfreed%40meta.com

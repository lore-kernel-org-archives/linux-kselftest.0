Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754638;
	b=tYXGOnHzxWysq42TDA79375zAgTsTLKXygwJ5BQ706T457WvDnYQfUJp6zkYEwNXYFHI
	 xpjMYsFwo6CAG286z/Zrc33DnBoVY+T8jyqjCjFkZ2GzuQ4rwx7Aop3DKL315kLCL7eGk
	 a8MW9fGjcuqi0iAcy0Ue1qDFmCgbFZFgPNDbRI9KHxgujvyXRBMcXgtPJGaWbcgm5EJWr
	 4/Rhj2zdmFqNb2+POf+VdjUUDbjjXIMAUNhxlTviE+CPMr5XOL3DDH3cEzdreuIzpV7wB
	 k38DgAIh/pfZ1zAZ+7fnKTYbihz5yOW1rT5OWQ6XT+QSEjwDiMJXB8cZEjApL8pkfHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=N1uafdkSoG45teNOXMHIESgP5w0nSF1SWyeyKNWtWPU=;
	b=gwk3wIY+kwKiHG2kZKJazTZIKmNBX3ochAJKFJS/PLWs4ZxS2feUz4oBdg0nW9hMleQ7
	 gszlLuPok03aJHUj6SPNEmK7AvDW4wv/1X01Mw490l3Eob2eHfhiWBt3v6Ht/03NDSw3d
	 uBcmt/JfNbxaXLz286MS8wx7VVrT3z7Aom55bG0TamgUlAGw0iMcx7i0zq/nKOqggSX6Q
	 C4wIpoJf0DmVNRLZ7iVC0ur5CPbi5w0Nc7Jg3MhPAtSHqUyin54sUXvs7lU8bK+cJK37E
	 XB8SBDUkpxkuTaCG7/bqaVho0NiRgnRAVMp9aW9U4PMlKu8YTVZuVXjVNG9hPZMumow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dUOuUlHv;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1248606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 11:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1248606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dUOuUlHv
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917a04338c1so5445586d6.0
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 04:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792754636; x=1793359436; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N1uafdkSoG45teNOXMHIESgP5w0nSF1SWyeyKNWtWPU=;
        b=dUOuUlHvcfkvN7k4IoY3LaypXMKcJIvvcyVW7aGhsepJ3HvFBywVGaBERoSlUNzRwe
         Op7xspvjrXDmqprWmlnwEjP+ZZ0qAuUKTI0Dh9+j6O5lno/rA5okVvKXeCAuR059O23Z
         rLJCKNchI1fraEsobuGk9ON6kcc9Ezba3wxBCgCjFC9AVGi7uBgLDizERG8fq+vDSIry
         BvqAZrQWH6Ax59//88mjaM1Y9Zq9EH7zuWlOnoZcuWwiJyUZl+0iwtt9pQCe6I7cY/B4
         gnWsk4YnIXW18iIntHz0cW741gXaHTiN6ihpIOHTzQ0WWglDFNdK+V3F4dNAZ8yxLrVj
         WGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792754636; x=1793359436;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1uafdkSoG45teNOXMHIESgP5w0nSF1SWyeyKNWtWPU=;
        b=P3V5eagx2uEMewN2fXqfpucaTrJN6ZuYS8E8iFOS0ChFF0spcBPSa8J7TZBJiXA8oI
         wML+1opCG8LnWxQ9B3VdsPIQGPaj9ypt+hMfxEMLP0gF9NO7KPK/7o05eteu7V0DfUbQ
         47Tot3DtcTxio9KoIObBlaRtFoFFoIbzge70DjscQERRBgvUMGv7GfjPENIiI+QCir92
         QA2tfiV7d2J6Qu3vVL1h/t3Qcgs83rvZiTcsokgUca3FTzTfPw2rUNalCy8/qrZwo+hm
         NMZxE4F6Sz9YoZPh0qhNUiXkj1KA0clhkWmBGj8UMPXwMZF0JxCkcS5AcQwU/hfifaV4
         MyOg==
X-Forwarded-Encrypted: i=1; AKwUvBzyWs+ZRLABwWj0lGYr0JPi7HShQk2kE1y/WdRV3fAQzsb6PdIwg3O7svUjowJ6VSurezqdLKCKlQuTxqDfSVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFVezeKuWQU9wFKshNYvslXdlPIQNSE7ONi/dVwclH1kK4ES82
	Ar4n71pLEKAgs7N5SiNxeN60RrCfGjfdvHtC856yKeoFjVQ69WHH3ii1
X-Gm-Gg: AYBFou0O8ocCZAZ64nZ4y6EX46af8tldeOnnqf/dIN71FvLWjszPHPw2yPZuU9kM+QL
	E4DSWW4bFC+zwjJOYfXf0BR+UCoR0YUXrW1AEysEhCNzWx1mdrbi/+AkhI/jBB7oiXo4vbVJKSa
	NmDdfZ+1eqCjCkIZ9UVAHP8udXJVtexaok29KF7igr/YiI/H9HOae6F/xESNv13hqDWiNOmgo+5
	F+v7LYmohcezF6SBX2lUcCCiLe7qCCxw5pxzY25U38Z7E0emOScFI5CNTA4L0ll5sbssnj1hyMS
	jycSAT6tgANB4BxATalOU0yVrf1Ml2piy/+fw2ld2HwWMo8vw1bTyzjJ0rcRNxZrSHFmv59mCHZ
	SNOKpbBOQ+091I7UX2rzNBvuWjSVgNHlCXmH3J1G5XVi+R0ihc1knxKiv3ucoHtmgnWf98awS7m
	ockkUnU42MDEg+U9hsAkCpSD4qgJSFBeoOdD19sdRaz2LqoetIvSCklvkVieqXttGGbZVeUyag2
	9iDsbDvSFbIIm01HdqHkdRyiIMsKstcM9oq2VKw4GADUsyqCHS3bT+8ExdZ
X-Received: by 2002:a05:6214:623:b0:919:5f43:99f1 with SMTP id 6a1803df08f44-91c3a8a8e6dmr21752026d6.30.1792754636437;
        Fri, 23 Oct 2026 04:23:56 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c396f314bsm17620076d6.24.2026.10.23.04.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 04:23:55 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Oct 2026 07:23:55 -0400
Message-Id: <DMC6H9OT57RA.30RKA7CO0856R@gmail.com>
To: "Todd Freed" <toddfreed@meta.com>, <netdev@vger.kernel.org>
Cc: "Daniel Zahka" <daniel.zahka@gmail.com>, "Jakub Kicinski"
 <kuba@kernel.org>, "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman"
 <horms@kernel.org>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "Shuah Khan"
 <shuah@kernel.org>, "Raed Salem" <raeds@nvidia.com>, "Rahul Rameshbabu"
 <rrameshbabu@nvidia.com>, "Cosmin Ratiu" <cratiu@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH net v2 1/2] psp: fix transport mode encap with ipv6
 extension headers
From: "Daniel Zahka" <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261022223014.556388-1-toddfreed@meta.com>
 <20261022223014.556388-2-toddfreed@meta.com>
In-Reply-To: <20261022223014.556388-2-toddfreed@meta.com>

On Thu Oct 22, 2026 at 6:30 PM EDT, Todd Freed wrote:
> psp_dev_encapsulate() inserts the udp and psp headers and rewrites the
> l3 next header to udp.
>
> if the packet is an ipv6 packet with extension headers, the transport
> header comes after them, so rewriting the next header of the ipv6 fixed
> header produces a malformed packet.
>
> a psp tcp socket emits such packets if certain socket options are set on
> it (e.g. IPV6_DSTOPTS). with mlx5, these packets also go out
> unencrypted.
>
> fix by walking the extension header chain to rewrite the nexthdr on the
> last one in the chain instead. the walk looks at the extension header
> types only to find their lengths, and to reject these,
>
> - NEXTHDR_FRAGMENT. this could work, but udp+psp would need to come
>   before it, which is different than how the other option types are
>   handled. for now, keep fragments unsupported for transport mode.
>
> - NEXTHDR_ROUTING. the tcp checksum covers the final destination, but
>   drivers seed tso checksums from the daddr in the fixed hdr
>   (mlx5e_psp_handle_tx_skb()), so this would produce bad checksums.
>   could be supported with more work.
>

The stack should seed the tcp check correctly with the sk dst addr. If
mlx5's lso implementation can't take that into account, I'm not sure a
generic helper should be the one rejecting the skb.

> - NEXTHDR_NONE, and types which ipv6_ext_hdr() doesn't know.
>
> on rx, the inverse process is performed in psp_dev_rcv(). transport mode
> psp fragments are rejected on this path as before.
>
> note that the stack doesn't fragment ipv6 tcp packets, so a psp socket
> won't be able to exercise the tx fragment path.
>
> Suggested-by: Daniel Zahka <daniel.zahka@gmail.com>
> Fixes: fc724515741a ("psp: provide encapsulation helper for drivers")
> Fixes: 0eddb8023cee ("psp: provide decapsulation and receive helper for d=
rivers")
> Signed-off-by: Todd Freed <toddfreed@meta.com>
> ---
>  net/psp/psp_main.c | 78 +++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 70 insertions(+), 8 deletions(-)
>
> diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
> index c9c1a8826b7f..0c009d7b08c0 100644
> --- a/net/psp/psp_main.c
> +++ b/net/psp/psp_main.c
> @@ -4,6 +4,7 @@
>  #include <linux/list.h>
>  #include <linux/netdevice.h>
>  #include <linux/xarray.h>
> +#include <net/ipv6.h>
>  #include <net/net_namespace.h>
>  #include <net/psp.h>
>  #include <net/udp.h>
> @@ -185,6 +186,42 @@ unsigned int psp_key_size(u32 version)
>  }
>  EXPORT_SYMBOL(psp_key_size);
> =20
> +/**
> + * psp_ipv6_nexthdr_off() - find the offset to the l4 proto nexthdr
> + * @hdr:  ipv6 fixed header
> + * @len:  l3 header total length
> + *
> + * Return: offset from @hdr, or -1 to drop the packet
> + */
> +static int psp_ipv6_nexthdr_off(const u8 *hdr, unsigned int len)
> +{
> +	unsigned int nh =3D offsetof(struct ipv6hdr, nexthdr);
> +	unsigned int off =3D sizeof(struct ipv6hdr);
> +	const struct ipv6_opt_hdr *eh;
> +	unsigned int rem;
> +	u8 type;
> +
> +	while (off < len) {
> +		eh =3D (const void *)(hdr + off);
> +		type =3D hdr[nh];
> +
> +		if (!ipv6_ext_hdr(type) || type =3D=3D NEXTHDR_NONE ||
> +		    type =3D=3D NEXTHDR_FRAGMENT || type =3D=3D NEXTHDR_ROUTING)
> +			return -1;

return an error code instead of -1?

> +		rem =3D len - off;
> +		if (rem < sizeof(*eh))
> +			return -1;
> +
> +		nh =3D off + offsetof(struct ipv6_opt_hdr, nexthdr);
> +		if (type =3D=3D NEXTHDR_AUTH)
> +			off +=3D ipv6_authlen(eh);

I was expecting auth header to be part of the reject list.

> +		else
> +			off +=3D ipv6_optlen(eh);
> +	}
> +
> +	return off =3D=3D len ? nh : -1;
> +}
> +
>  static void psp_write_headers(struct net *net, struct sk_buff *skb, __be=
32 spi,
>  			      u8 ver, unsigned int udp_len, __be16 sport)
>  {
> @@ -243,7 +280,7 @@ static void psp_write_headers(struct net *net, struct=
 sk_buff *skb, __be32 spi,
>  }
> =20
>  /* Encapsulate a TCP packet with PSP by adding the UDP+PSP headers and f=
illing
> - * them in.
> + * them in. With IPv6, they go after any extension headers.
>   */
>  bool psp_dev_encapsulate(struct net *net, struct sk_buff *skb, __be32 sp=
i,
>  			 u8 ver, __be16 sport)
> @@ -251,10 +288,17 @@ bool psp_dev_encapsulate(struct net *net, struct sk=
_buff *skb, __be32 spi,
>  	u32 network_len =3D skb_network_header_len(skb);
>  	u32 ethr_len =3D skb_mac_header_len(skb);
>  	u32 bufflen =3D ethr_len + network_len;
> -
> -	if (skb->protocol !=3D htons(ETH_P_IP) &&
> -	    skb->protocol !=3D htons(ETH_P_IPV6))
> +	int nh_off =3D 0;
> +
> +	if (skb->protocol =3D=3D htons(ETH_P_IPV6)) {
> +		/* UDP + PSP after the extension headers, if any */
> +		nh_off =3D psp_ipv6_nexthdr_off(skb_network_header(skb),
> +					      network_len);
> +		if (nh_off < 0)
> +			return false;
> +	} else if (skb->protocol !=3D htons(ETH_P_IP)) {
>  		return false;
> +	}
> =20
>  	if (skb_cow_head(skb, PSP_ENCAP_HLEN))
>  		return false;
> @@ -272,7 +316,7 @@ bool psp_dev_encapsulate(struct net *net, struct sk_b=
uff *skb, __be32 spi,
>  		ip_hdr(skb)->check =3D
>  			ip_fast_csum((u8 *)ip_hdr(skb), ip_hdr(skb)->ihl);
>  	} else {
> -		ipv6_hdr(skb)->nexthdr =3D IPPROTO_UDP;
> +		skb_network_header(skb)[nh_off] =3D IPPROTO_UDP;
>  		be16_add_cpu(&ipv6_hdr(skb)->payload_len, PSP_ENCAP_HLEN);
>  	}
> =20
> @@ -331,8 +375,23 @@ int psp_dev_rcv(struct sk_buff *skb, u16 dev_id, u8 =
generation, bool strip_icv)
>  			return -EINVAL;

If you send a v3, I think you should put the psp_dev_rcv() in a
serparate patch.

>  	} else {
>  		struct ipv6hdr *ipv6h =3D (struct ipv6hdr *)(skb->data + l2_hlen);
> +		u8 nexthdr =3D ipv6h->nexthdr;
> +		__be16 frag_off;
> +		int off;
> =20
> -		is_udp =3D ipv6h->nexthdr =3D=3D IPPROTO_UDP;
> +		/* UDP + PSP come after any extension headers. Fragment and
> +		 * routing headers are not supported in transport mode.
> +		 */
> +		off =3D ipv6_skip_exthdr(skb, l2_hlen + sizeof(*ipv6h), &nexthdr,
> +				       &frag_off);
> +		if (unlikely(off < 0 || frag_off))
> +			return -EINVAL;
> +
> +		is_udp =3D nexthdr =3D=3D IPPROTO_UDP;
> +		l3_hlen =3D off - l2_hlen;
> +		if (l3_hlen !=3D sizeof(struct ipv6hdr) &&
> +		    !pskb_may_pull(skb, l2_hlen + l3_hlen + PSP_ENCAP_HLEN))
> +			return -EINVAL;
>  	}
> =20
>  	if (unlikely(!is_udp))
> @@ -386,11 +445,14 @@ int psp_dev_rcv(struct sk_buff *skb, u16 dev_id, u8=
 generation, bool strip_icv)
>  		iph->check =3D ip_fast_csum((u8 *)iph, iph->ihl);
>  	} else {
>  		struct ipv6hdr *ipv6h =3D (struct ipv6hdr *)(skb->data + l2_hlen);
> +		int nh_off =3D psp_ipv6_nexthdr_off((u8 *)ipv6h, l3_hlen);
> =20
> -		if (unlikely(ntohs(ipv6h->payload_len) < encap))
> +		if (unlikely(nh_off < 0 ||
> +			     ntohs(ipv6h->payload_len) <
> +			     l3_hlen - sizeof(*ipv6h) + encap))
>  			return -EINVAL;
> =20
> -		ipv6h->nexthdr =3D psph->nexthdr;
> +		((u8 *)ipv6h)[nh_off] =3D psph->nexthdr;
>  		ipv6h->payload_len =3D htons(ntohs(ipv6h->payload_len) - encap);
>  	}
> =20


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837038;
	b=44MEGuz714KI8ZplXMuAGZ1l45lfLu5+LYs5pNdI6t5rFye74MciAj2RL4VYfd7EqDy3
	 Hy8qzP2VNQQYmCdbHGSPZ6jXArCV7pFA8bfLQ5J+VKWRJgMj/dIQJzfPHToFow3dSLQFb
	 PgMFJiUnqImKY6V4Yo+vGU6LwtvP+blOQLstigddcWqyoqBVLDGjQrZMzvVjMczfojgxt
	 BAQvPI3spCzhGFPCboNohFzLbs5s7DLxydbM0EvtYAuIleR/rSLz8Aq6z1emw8NOC+JjM
	 BttOjaDS2efutNo/wgV68vrvmyWKTLOMOoR0wp5gGW9RHDVsHTW5TLZdJZiTXrYxdoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837038;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=HaFJtg8Mam/lIIHljkvLlQgM5vfR2sOsD6/dKSGbv/M=;
	b=W/UICX+SSnHpX4IosDTcv7kQ9eBsuC913crnP3BfRpJQn5ou8YxMOg+6ZTAdt6sdhVxV
	 WmSXrZcp0GbYshvRcwsRjHgXGKcMSrzlQrCVVCyOynf1Pn+2qmN6ksc1/4lSeakZzaPg8
	 Ydm0p/GoFjpOm0pYeKC49WkcEbfZTgbJ95H3j5Z5dcS6wWpxowwh3PO0v+IsEqFTdvNII
	 kIxn8JcG1G4RpGyhc/BQb8s4QRIZy0M+SifF85kFwGgTjy8fylzErZ7Fg7tkAFav+ATGY
	 SN1pgSH1oeFMQzvctb66w1GNDrdt4L6uZJnrKi41j7k8vjjgZu6vI88/69131j7nOWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MkWBzwM9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E251606A8AA;
	Mon, 16 Nov 2026 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MkWBzwM9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E371F000C5;
	Mon, 16 Nov 2026 13:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837037;
	bh=HaFJtg8Mam/lIIHljkvLlQgM5vfR2sOsD6/dKSGbv/M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MkWBzwM9xPQbE+1B2a85lO6M4oyBQZHAAXFHJmkY/gdaep7cwukUbnuaTZprr4kpK
	 JODfHTaaLTLSZAS/1WpleZaEcteiWcSR82hf7tQXuIvHPTppV9UzNBiuiXHY3RbVpM
	 flHrPs/W+fbSNJ2QIidpGBj5z3Foy2PVbSd8BW5+pCEZIb7eevXkKAP197orw19CSg
	 J1zwH9o//UFnq6Jbq3rbz8h/646vGQ/+Y+SmEGzGB/dEgduQ8pQIUouRiGy74gHKdA
	 zv1wvr25nlLAMVe9031VNPP6QZSBWmNNWzXDFd3H6B/kDqSthBjx1DoSAuzYJkUsrY
	 ItdCAci7O0jbw==
Subject:
 Re: [PATCH net 1/2] udp: restore outer transport header after tunnel GRO
From: netdev-bot+sashiko@kernel.org
To: bryon@fryer.io
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 horms@kernel.org, jasowangio@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 pabeni@redhat.com, shuah@kernel.org
Date: Mon, 16 Nov 2026 13:50:36 +0000
Message-ID: <179483703667.3136.1173201547098616400@kernel.org>
In-Reply-To: <20261112030708.1915665-2-bryon@fryer.io>
References: <20261112030708.1915665-2-bryon@fryer.io>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch fixes only one producer: udp_gro_complete().

--

udp: restore outer transport header after tunnel GRO

This patch changes udp_gro_complete() so that skb->transport_header points
back at the outer UDP header (nhoff) after the inner gro_complete()
callback succeeds. Without that, the virtio tunnel exporter reports the
inner transport offset as outer_th_offset, and the receiving TAP rejects
the aggregate.

> diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
> index b77ae2f00c626..1a1d1a125d23e 100644
> --- a/net/ipv4/udp_offload.c
> +++ b/net/ipv4/udp_offload.c
> @@ -948,6 +948,8 @@ int udp_gro_complete(struct sk_buff *skb, int nhoff,
>  		skb->encapsulation = 1;
>  		err = udp_sk(sk)->gro_complete(sk, skb,
>  				nhoff + sizeof(struct udphdr));
> +		if (!err)
> +			skb_set_transport_header(skb, nhoff);

[Severity: High]
The commit message describes the problem in general terms:

  "UDP tunnel GRO can produce invalid virtio tunnel headers, causing
  virtio-net to drop whole aggregates."

The fix only covers aggregates that reach udp_gro_complete(). Can
UDP-tunnel GSO skbs that never pass through gro_complete() still reach
virtio_net_hdr_tnl_from_skb() with the same bad offsets?

The HW-GRO paths in bnxt (bnxt_gro_func_5731x() with bnxt_gro_tunnel())
and bnge (bnge_gro_func() with bnge_gro_tunnel()) build aggregates with
gso_type set to SKB_GSO_TCPV4/6 plus SKB_GSO_UDP_TUNNEL[_CSUM]. These
aggregates also have:

- transport_header on the inner TCP header
- skb->encapsulation never set
- inner_network_header never set

For example, in bnxt_gro_tunnel():

	if (uh) {
		if (uh->check)
			skb_shinfo(skb)->gso_type |= SKB_GSO_UDP_TUNNEL_CSUM;
		else
			skb_shinfo(skb)->gso_type |= SKB_GSO_UDP_TUNNEL;
	}

dev_gro_receive() accepts these TCP-GSO skbs into software GRO. However,
tcp_gro_receive() sets NAPI_GRO_CB(skb)->flush when len !=
count * gso_size, or when the header has PSH/URG/RST/SYN/FIN set. Both
cases are common at the end of a bulk TCP burst.

A flush is also forced when udp_gro_receive() finds no matching tunnel
socket, or when the outer tot_len check in inet_gro_receive() fails. In
each of these cases, dev_gro_receive() takes this path:

	if (NAPI_GRO_CB(skb)->flush)
		goto normal;

and neither gro_complete() nor udp_gro_complete() runs.

If the skb is then bridged to a TAP that negotiated TUN_F_UDP_TUNNEL_GSO,
virtio_net_hdr_tnl_from_skb() does:

	inner_nh = skb->inner_network_header - skb_headroom(skb);
	outer_th = skb->transport_header - skb_headroom(skb);

That gives outer_th_offset equal to the inner TCP offset and
inner_nh_offset equal to (u16)(0 - headroom). On the peer side,
virtio_net_hdr_tnl_to_skb() then fails its inner_th < inner_nh +
inner_l3min check and returns -EINVAL. That is the same dropped-aggregate
symptom described in the commit message.

These aggregates also cannot be re-segmented in software.
udp4_ufo_fragment() returns -EINVAL when encapsulation is 0 and neither
SKB_GSO_UDP nor SKB_GSO_UDP_L4 is set. That suggests the root cause for
this path is in the drivers.

The change itself looks correct. Should it be extended to cover this
path? One option would be to have the bnxt/bnge HW-GRO paths set
encapsulation and the inner mac/network/transport headers, and leave
transport_header on the outer UDP header. Otherwise, could the commit
message be narrowed to the software GRO completion path?

Separately, would it make sense for virtio_net_hdr_tnl_from_skb() to
reject tunnel-GSO skbs with !skb->encapsulation rather than emit these
offsets?

>  	} else {
>  		err = udp_gro_complete_segment(skb);
>  	}

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112030708.1915665-1-bryon%40fryer.io

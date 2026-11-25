Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570497;
	b=F1sZK/FmwAkgU0xMHV1MyLBM/X/EbMurnKD5tUulDAkV3B4glkvB0Fc17r5LOvcCP8fw
	 QlqwIr/N6sQdDfmdq/CKjmyShQQa0bP3zwFn52Cblj/wjgyPd+milQ82JVazESvVYyXrb
	 2lZrfddVP5FbVKv6zE1jn4n+8cz0P48Ml/HGMaD2X536ua4kuLXs3wRx2zXQX+p/L1Dw8
	 A2L4tT7v8AbLB8w5zDpYd1S6g/8vCJQrlWi5abpEtmWLboBNbYFBzc2W9qnI0X8HKEq1K
	 1Cd7xsbk9XjiRSCHmrdZLn9qKZOf13VoIkshT6jFWEZqQPD4eZFXE02QJoaCMLXT5KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570497;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=DA59jyb89Y1wxXmPx1cwYGs8UOHaUM5ztUYSrDEo/88=;
	b=vwhYbwIhMDJgtaramw1iYVt33phmQHx0PO9q3khxmf3HkABBPaj8pnBlMU1qnoqNgtLT
	 vEm9UvwOpYrNGWM4bpB9nZffGVRHYx6cuf/Ev7V5WId1bjMeyo5N0grOZRZBJ2PH5pN90
	 LPELZfgcghRTSps1iGzZSN8rigb6IIZfwO7DTImKXMH8e4/G80HIEk0Z5ny92obfbTqH7
	 DQWrlBRRS1+QaYi4A7VS0gdDGUpFCvWDkj8rHCRoMiZI4elz/XE5PuH/g3zAb6YuM81/h
	 BKuJu/uxLqC57aoIwGyRply3VLg/L/0GZoWdrcNX0fZfcrdQRdaA2yg7HpaoeIUuaiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VAaa+eIv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5208606A681;
	Wed, 25 Nov 2026 01:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VAaa+eIv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4BD71F000E1;
	Wed, 25 Nov 2026 01:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795570496;
	bh=DA59jyb89Y1wxXmPx1cwYGs8UOHaUM5ztUYSrDEo/88=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VAaa+eIvaBoQmnXpkApc6jm4WQecmvkX58MDKhJZONqlGKlLTjblnSFdgqhLtveYo
	 u4MNnJzvAxtc761OHVU+pw6wN0HH9C11yPJjNFBPZqyC68PlYDRaOJSXfdh05iJmin
	 jGHxa7p7SXCZpjfiXCXfzb4OFmBU7IBBSjUhsAn65Kq6NYHrlVMaBmoTFCEBrhTGx/
	 m5Uz+/GXlbhb69wdqb3figGMhFlPZxkdZz84xwlW5NXIkLLoSwYaDmnINMAOi/9Vpb
	 v1oMvxeloA57PyJkDd8xvCoDZ3ATdYoui+Xs89KZ5x0qBfbrw70m9C8N5vfFsVPxpt
	 YsUryFCEC+GPg==
Subject: Re: [PATCH net-next 2/6] gre: Enable BIG TCP packets
From: netdev-bot+sashiko@kernel.org
To: yanhaishuang@cmss.chinamobile.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, alice.kernel@fastmail.im,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 25 Nov 2026 01:34:55 +0000
Message-ID: <179557049527.3135.5031926005314724834@kernel.org>
In-Reply-To: <20261124013124.3693-3-yanhaishuang@cmss.chinamobile.com>
References: <20261124013124.3693-3-yanhaishuang@cmss.chinamobile.com>
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

- [Low] This patch turns on BIG TCP for gre and gretap (tso_max_size =
  GSO_MAX_SIZE in ipgre_tunnel_setup()/ipgre_tap_setup()).

--

gre: Enable BIG TCP packets

This commit raises tso_max_size to GSO_MAX_SIZE for gre and gretap
devices, so an admin can use BIG TCP on them by raising gso_max_size and
gso_ipv4_max_size. erspan is not changed, and the defaults stay at 64KB.

> diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
> index f8a7c43535020..41ec54dcbfdcc 100644
> --- a/net/ipv4/ip_gre.c
> +++ b/net/ipv4/ip_gre.c
> @@ -1007,6 +1007,7 @@ static void ipgre_tunnel_setup(struct net_device *dev)
>  {
>  	dev->netdev_ops		= &ipgre_netdev_ops;
>  	dev->type		= ARPHRD_IPGRE;
> +	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
>  	ip_tunnel_setup(dev, ipgre_net_id);
>  }

[Severity: Low]

The commit message says FOU and GUE are covered because they "set the UDP
length with udp_set_len()". That covers transmit. Is the receive side in
net/ipv4/fou_core.c also ready for these packets?

Take gre over FOU/GUE with gso_ipv4_max_size raised. A GSO packet larger
than 64KB leaves __ip_local_out() with an outer tot_len of 0, set by
iph_set_totlen(). udp_set_len() also sets uh->len to 0.

On the receiver, ip_rcv_core() accepts this through iph_totlen(), and
__udp4_lib_rcv() accepts it through udp_get_len(). The skb then reaches
fou_recv_pull() and gue_udp_recv(). Both of them do this:

net/ipv4/fou_core.c:fou_recv_pull() {
    ...
	if (fou->family == AF_INET)
		ip_hdr(skb)->tot_len = htons(ntohs(ip_hdr(skb)->tot_len) - len);
    ...
}

Doesn't this wrap when tot_len is 0? For plain FOU it becomes 0 - 8 =
65528. For GUE it becomes 0 - (8 + 4 + optlen).

That non-zero length is written back into the outer header, while the skb
can hold up to 512KB. It breaks the convention that a tot_len of 0 means
"use skb->len".

No in-kernel reader seems to misbehave on this value. After the pull, the
skb is resubmitted as IPPROTO_GRE and goes through
gre_rcv()->ipgre_rcv()->ip_tunnel_rcv(). That path only reads daddr and
tos from the outer header before it drops the header.

The wrong length is still visible in two places:

- raw IPPROTO_GRE sockets, which get the outer header back through the
  skb_push() in raw_rcv()
- the header quoted by icmp_send() when no tunnel matches

The big_tcp_tunnels.sh extension later in this series runs this path with
FOU and GUE.

The AF_INET6 branch in both functions has the same pattern for
payload_len. The later ip6_tunnel and ip6_gre patches in the series make
that branch reachable, and no later patch changes fou_core.c.

Would something like iph_set_totlen(iph, iph_totlen(skb, iph) - len) fit
here? Another option is to skip the adjustment when tot_len is 0.

The gretap change in ipgre_tap_setup() exposes the same path.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124013124.3693-1-yanhaishuang%40cmss.chinamobile.com

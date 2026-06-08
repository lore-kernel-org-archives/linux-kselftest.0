Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC47C3D092F
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 17:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939314; cv=pass; b=OHhO6Z/fNAadxAsqXG8odq/bVhpzg6tojSpLbqGd4T7tqgOKjW0xQcjogAMmPLWs3ZDZEp1FdmoZ/b4QVW9gj6OL64MLtM5V0G/BEyAqkLg0/9i3b7HjZJAkD6Ky2NjS/LN2Bjp7Y+PMsZZcyvNirbBKGlcBJBlQ0b+/Ly8ULLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939314; c=relaxed/simple;
	bh=QhL6+Og5Q/2hRDexNOZHX54YQpZaWEITisbjv1OZ03M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UHK6g8LrZhONlnNiYDsajVN7NXsSHFBOk1jpG+3DQCHN0/SbcUFAWD1HR58Mn/RUhM4GNVgTfrA6cLIHcSEwfAMYbSgTVugRaToqlPyS/xTZXaJgxR0xwEy+3vXzIa9tP4ow3HObzN0FRkcG+K0gaBZHwNHl4xcS1cJQo3154j0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pr+zHCYK; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pr+zHCYK"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1382c509485so1057915c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 10:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780939312; cv=none;
        d=google.com; s=arc-20240605;
        b=ZyzBhMxynJQcFztnDNjwdehL7S1OVtLMtBwFbnockOP/4dcUlS+BmBOo7rWE9AQK2O
         ueC6rourkAN0wTxNS0GNIxEK/Ck6lDTbbKlPFNPw+ePLPQkHciVMZVgxERl6kA4rMztz
         JjiyFfVkL+ieCE0VUhldSPcxcjvzvjtXH9APhKyPNZuwosUqESbQeZgiyY3hlmZDUR97
         Ovuhr7qrKwRxnruPIQH8jSR2ZFom6wwJJkS7JywGnzfRctGlyHHYe+ulTvqZNWHpZtrp
         LRmGB/W0H/T/t4Cy/hjBUT1ubbIrQnEg6QNpTUSDkD05Q4frYM3CIkAk+mURcayHPDJP
         tjWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wd8GNmsbbskCMjCK+uQDvW4BClWHx0VSsIW/uXHLcIQ=;
        fh=HBk3fl3X4L63MBRjL81DN/4rZbZaQUDW+dCgQcz/RIs=;
        b=NZT8cVK6jXnaokLvt0kTzqvluAntQbpKqPxdI6qAVt6Hl7ypYoP78GgXR0kell3slW
         otkmaGT0lvIoR79HHJY0pfXhl8Wufy+YMsTkfgEM/OIYVXHgZv/v8K8JpI/WZh84ERPc
         u7YZI57VSzsTRUIB8GBPkyGFLmUXrN4nc7PJuHPg3YiNX2G66HJNVI+n7L620eG73xwz
         Rvx6wYQdkYkjlSlCys/ZPJg4/36yI2q8Tf4hqwuSfAzlIeIXgo1RsqJbAa3LWKWxm8nl
         JrtGi/bI8dpohQFum2MxNR0rpI5afZ9z6FEZcBY3y3dyWJYYuRuJS1ZtwY8jLRDDhNRu
         wlxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780939312; x=1781544112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wd8GNmsbbskCMjCK+uQDvW4BClWHx0VSsIW/uXHLcIQ=;
        b=Pr+zHCYKZ61QQRxYPxO77pfbp9wONivQ5ufwLdbowWyUhXqeKmoOKiblLJW4SlzJQj
         2TQFJmAlM8oeZke4LLhcdLhFA2yoeJvWwN4sVlOlSZGmqOB0iLaKSYJ9XByVPLy+ISEH
         lMtKmDmiNwriLYzuDoeLMSqa8ccw85OEo/36sbw7LaxEOSTXmJCNUnyCgEXg9lzN9n3V
         gmR9yOsJeYaCBnsS+1lIAB6PAVUxSg5P82CguyVXA6HSsEc8TLRBf3gqCZFbfeHpVmcS
         8g8zZBf+XDKVqlQ967m9QL8r4SYrYHAnxHCg8LpFo+1o+tGfWiVsfwi0sBDG2G3WAGvt
         0wNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780939312; x=1781544112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wd8GNmsbbskCMjCK+uQDvW4BClWHx0VSsIW/uXHLcIQ=;
        b=q73XULU0kTJ1QzgjBiq8wx/0DU949tNKRgdyDCQXjfR24RwrtDpyEyQ2FbFYaOfzyb
         ehwws85cxJG4iPfkHI9xXtYp5qcfDtkOCuMp9np2BqAwox5xsV/38NtfEscLuqZ6/1sT
         Q3jfoaxp5JYaPGMJ+Sr0yjvegHHoGMqOb2iWUqI6yNLRDI9U+PN2KIMzyjNWd+cE3tbp
         6bwerEWl6RR1B7A+IZCa8ItS5g+cUq3Nnw01vqBLJ+5WW5Bfbl/LI505jcP6syr6XP7w
         tneirYBHs4ZnDipgfwCt8vpes3h3PsOonlXx6IS9wVjgyJhCu7zcL6UdV5ET+T7J3Gm6
         BLtg==
X-Forwarded-Encrypted: i=1; AFNElJ9roiAWbhpvhMGBPqZVfNcbe7pKhtZywMWZlvoIoW2LRQ1fyJ3pDUxzkt4cwV2DGk7/w5LqtxyLtAQw0oPHXH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzprkigwlKINtKfhOFjIcM9/kQyQteo/0fqBr9sksLxyr7NDUnw
	ze4B4whRo2449zl+FrzxGXcL8nuAMjVulB7XfrA5K1mDgzUz22kXhFrjhUFIdgVGVkYJ3mrbhRy
	MeM6VwSKpn9BJo8KIXZFS0CH7hO2uZsn09b7uYOx9
X-Gm-Gg: Acq92OG5uxus9pOM81sBGDB5juHKvgJtmbh8P7CIYjz+D/oUbFNGK5xvir547CkLgLR
	78Q5LmoQhSwwHe636WhqUFRYzpQppRyCFokMkfOYWOM3pmZR20ZQRqm5ptjuZqiBqMpKwlULoZB
	CkbAQFqlD5/s5HUg3UVkjwP/Mh2tzMYBnIx/LpkYBjlqEuLjPK1+3K9isHwpa0z2uC8jPLVmDt/
	cRus6gqhig9VxGylgS3hRBQju48j1nk8lDyRt6Ei6WDV4ez41awWjMdLyB5JoK3IQKA/pMKyUy6
	Xaw/oVHJGhUzc/uLQvaBjKTUvyNSzzG8YESdyNVIM84xRssLzP7QiMQAl1MxKpVr3Gjs05N2nj7
	d7s+yR+3ZywzVEjpFXzTFJloOKPGm/gs2MkDz+O6wpzxJh19TIeHixmDUb5Gxe6Blrdn5MCk=
X-Received: by 2002:a05:7022:439a:b0:137:ef27:e2b1 with SMTP id
 a92af1059eb24-13806731a20mr8368591c88.29.1780939311188; Mon, 08 Jun 2026
 10:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608125846.157004-1-jiayuan.chen@linux.dev> <20260608125846.157004-2-jiayuan.chen@linux.dev>
In-Reply-To: <20260608125846.157004-2-jiayuan.chen@linux.dev>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 8 Jun 2026 10:21:40 -0700
X-Gm-Features: AVVi8CdEYEu_V10M8S7Ftf79tPIdsLj4WF1IsqTeM2icUsCKu5PzvQ1A8P3-Rcc
Message-ID: <CAAVpQUDZoEVEX1kXok-29dzVHk=ZK_2MkZyZY8kRHCJCfAWVFg@mail.gmail.com>
Subject: Re: [PATCH bpf v8 1/2] net: Validate protocol in skb_steal_sock() for
 BPF-assigned sockets
To: Jiayuan Chen <jiayuan.chen@linux.dev>, Alexei Starovoitov <ast@kernel.org>
Cc: bpf@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Joe Stringer <joe@wand.net.nz>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 5:59=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.dev=
> wrote:
>
> bpf_sk_assign_tcp_reqsk() can assign a TCP reqsk to a non-TCP skb,
> causing a panic when the skb enters the wrong L4 receive path [1].
> An initial attempt tried to fix this in the BPF helper by checking
> iph->protocol, but Sashiko [2] revealed that BPF programs can bypass
> this check via a TOCTOU attack by modifying iph->protocol around the
> call:
>
>     iph->protocol =3D IPPROTO_TCP;
>     bpf_sk_assign_tcp_reqsk(udp_skb, tcp_sk);
>     iph->protocol =3D IPPROTO_UDP;
>
> Furthermore, bpf_sk_assign() has had the same class of vulnerability
> since its introduction =E2=80=94 it can assign any socket type to any skb
> without protocol validation.  Since the BPF helper check alone cannot
> prevent a malicious BPF program from crashing the kernel, add protocol

I'm curious about the BPF maintainers' stance on this kind of "bug"
where admin tries to shoot oneself in the foot.

I saw Alexei said this recently, and I guess it applies here as well ?
https://lore.kernel.org/bpf/CAADnVQLh7VEKAtckzz=3DXOVPT8ovpDQshvPPCWHDQu2OW=
Qx27_w@mail.gmail.com/

---8<---
Not every "bug" needs a fix.
If a malicious bpf user wants to crash the kernel they will
find a way to do so. Especially with agents.
We cannot realistically close all of the holes.
Right now the priority is to fix the issues that normal
users can hit and not bots.
---8<---


> validation in skb_steal_sock() to reject mismatched sockets regardless
> of how they were assigned.
>
> The check is applied to all prefetched sockets.  Early demux paths
> already only assign matching protocols (e.g., UDP early demux only
> assigns UDP sockets to UDP skbs), so they pass the check naturally and
> the extra branch is negligible.
>
> Pass the expected protocol from callers rather than extracting it from
> the IP header.  For IPv6, walking extension headers to find the L4
> protocol is complex and unnecessary since each caller already knows
> the protocol it handles.
>
> [1] https://lore.kernel.org/bpf/20260403015851.148209-1-jiayuan.chen@linu=
x.dev/
> [2] https://sashiko.dev/#/patchset/20260403015851.148209-1-jiayuan.chen%4=
0linux.dev
>
> Fixes: cf7fbe660f2d ("bpf: Add socket assign support")
> Fixes: e472f88891ab ("bpf: tcp: Support arbitrary SYN Cookie.")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  include/net/inet6_hashtables.h |  7 ++++---
>  include/net/inet_hashtables.h  |  7 ++++---
>  include/net/request_sock.h     | 16 +++++++++++++++-
>  net/ipv4/udp.c                 |  2 +-
>  net/ipv6/udp.c                 |  2 +-
>  5 files changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/include/net/inet6_hashtables.h b/include/net/inet6_hashtable=
s.h
> index 2cc5d416bbb5a..218498373a9c1 100644
> --- a/include/net/inet6_hashtables.h
> +++ b/include/net/inet6_hashtables.h
> @@ -106,12 +106,13 @@ static inline
>  struct sock *inet6_steal_sock(struct net *net, struct sk_buff *skb, int =
doff,
>                               const struct in6_addr *saddr, const __be16 =
sport,
>                               const struct in6_addr *daddr, const __be16 =
dport,
> -                             bool *refcounted, inet6_ehashfn_t *ehashfn)
> +                             bool *refcounted, inet6_ehashfn_t *ehashfn,
> +                             int protocol)
>  {
>         struct sock *sk, *reuse_sk;
>         bool prefetched;
>
> -       sk =3D skb_steal_sock(skb, refcounted, &prefetched);
> +       sk =3D skb_steal_sock(skb, refcounted, &prefetched, protocol);
>         if (!sk)
>                 return NULL;
>
> @@ -153,7 +154,7 @@ static inline struct sock *__inet6_lookup_skb(struct =
sk_buff *skb, int doff,
>         struct sock *sk;
>
>         sk =3D inet6_steal_sock(net, skb, doff, &ip6h->saddr, sport, &ip6=
h->daddr, dport,
> -                             refcounted, inet6_ehashfn);
> +                             refcounted, inet6_ehashfn, IPPROTO_TCP);
>         if (IS_ERR(sk))
>                 return NULL;
>         if (sk)
> diff --git a/include/net/inet_hashtables.h b/include/net/inet_hashtables.=
h
> index 6e2fe186d0dcb..a2a044f93cc4b 100644
> --- a/include/net/inet_hashtables.h
> +++ b/include/net/inet_hashtables.h
> @@ -446,12 +446,13 @@ static inline
>  struct sock *inet_steal_sock(struct net *net, struct sk_buff *skb, int d=
off,
>                              const __be32 saddr, const __be16 sport,
>                              const __be32 daddr, const __be16 dport,
> -                            bool *refcounted, inet_ehashfn_t *ehashfn)
> +                            bool *refcounted, inet_ehashfn_t *ehashfn,
> +                            int protocol)
>  {
>         struct sock *sk, *reuse_sk;
>         bool prefetched;
>
> -       sk =3D skb_steal_sock(skb, refcounted, &prefetched);
> +       sk =3D skb_steal_sock(skb, refcounted, &prefetched, protocol);
>         if (!sk)
>                 return NULL;
>
> @@ -494,7 +495,7 @@ static inline struct sock *__inet_lookup_skb(struct s=
k_buff *skb,
>         struct sock *sk;
>
>         sk =3D inet_steal_sock(net, skb, doff, iph->saddr, sport, iph->da=
ddr, dport,
> -                            refcounted, inet_ehashfn);
> +                            refcounted, inet_ehashfn, IPPROTO_TCP);
>         if (IS_ERR(sk))
>                 return NULL;
>         if (sk)
> diff --git a/include/net/request_sock.h b/include/net/request_sock.h
> index 5a9c826a7092d..c2b8c6350b624 100644
> --- a/include/net/request_sock.h
> +++ b/include/net/request_sock.h
> @@ -89,9 +89,11 @@ static inline struct sock *req_to_sk(struct request_so=
ck *req)
>   * @skb: sk_buff to steal the socket from
>   * @refcounted: is set to true if the socket is reference-counted
>   * @prefetched: is set to true if the socket was assigned from bpf
> + * @protocol: expected L4 protocol
>   */
>  static inline struct sock *skb_steal_sock(struct sk_buff *skb,
> -                                         bool *refcounted, bool *prefetc=
hed)
> +                                         bool *refcounted, bool *prefetc=
hed,
> +                                         int protocol)
>  {
>         struct sock *sk =3D skb->sk;
>
> @@ -103,6 +105,18 @@ static inline struct sock *skb_steal_sock(struct sk_=
buff *skb,
>
>         *prefetched =3D skb_sk_is_prefetched(skb);
>         if (*prefetched) {
> +               /* A non-full socket here is either a reqsk or a
> +                * timewait sock, both only contain sock_common and
> +                * lack sk_protocol. Since both can only be TCP,
> +                * use IPPROTO_TCP as the protocol.
> +                */
> +               if (unlikely(((sk_fullsock(sk) ? sk->sk_protocol : IPPROT=
O_TCP) !=3D protocol))) {
> +                       skb_orphan(skb);
> +                       *prefetched =3D false;
> +                       *refcounted =3D false;
> +                       return NULL;
> +               }
> +
>  #if IS_ENABLED(CONFIG_SYN_COOKIES)
>                 if (sk->sk_state =3D=3D TCP_NEW_SYN_RECV && inet_reqsk(sk=
)->syncookie) {
>                         struct request_sock *req =3D inet_reqsk(sk);
> diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
> index 0ac2bf4f8759b..ceb4d29a64aca 100644
> --- a/net/ipv4/udp.c
> +++ b/net/ipv4/udp.c
> @@ -2618,7 +2618,7 @@ int udp_rcv(struct sk_buff *skb)
>                 goto csum_error;
>
>         sk =3D inet_steal_sock(net, skb, sizeof(struct udphdr), saddr, uh=
->source, daddr, uh->dest,
> -                            &refcounted, udp_ehashfn);
> +                            &refcounted, udp_ehashfn, IPPROTO_UDP);
>         if (IS_ERR(sk))
>                 goto no_sk;
>
> diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
> index 15e032194eccc..d9c12cce5acef 100644
> --- a/net/ipv6/udp.c
> +++ b/net/ipv6/udp.c
> @@ -1106,7 +1106,7 @@ INDIRECT_CALLABLE_SCOPE int udpv6_rcv(struct sk_buf=
f *skb)
>
>         /* Check if the socket is already available, e.g. due to early de=
mux */
>         sk =3D inet6_steal_sock(net, skb, sizeof(struct udphdr), saddr, u=
h->source, daddr, uh->dest,
> -                             &refcounted, udp6_ehashfn);
> +                             &refcounted, udp6_ehashfn, IPPROTO_UDP);
>         if (IS_ERR(sk))
>                 goto no_sk;
>
> --
> 2.43.0
>

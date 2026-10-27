Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793068135;
	b=nO5J9pp1AfFb3Yjd2t0Aen1IOMUVaKYzbxmm7n8XjrdBlNOZsQ7+6tQLUSEY+ohB6MPY
	 ufLq+mnqLscFlx8Ysh94jVfLVmjLAx7XF2Aha9P4Mob+rioPBPTZKIToZl/6uM9psP5q1
	 xU8JoMLLEL3J2rAtGHnUWidMWfbbIjod0PmE43iPZJQmfBJqJJHw3ygskT04dl7iy6b3y
	 I7mFATJOGnmNNK3wdGn39gPbrQCK9AGDu6JjSeRCvnjpHwWH4aKIUQUaJHbIL0GKeqaLp
	 GHsjXFFUxjoVI5f11yWg50XFAqwcLvsjTm4HGXpQ2xnVfAMpI5EHovEDAn0IrwCaODQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793068135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=0DKYkKim1zCQPtEbSstx8AMdlP0KYJRU77N3GxfZjCQ=;
	b=oDMKc1NV2eBSCMOPWaKKnRiyE5anCd1uG1BYYQ/TQcSDYYXhG+bvFmLg11fKJ5Ota1Bg
	 I22pyGmTNnAwZ8EgEg39Uibws5Vg1g9jKhc2Mx+N+g478IYC3r/H3WZUnOIjs30YW6mCO
	 jNhlESmBSeIO6cXbvnzqN5E7IdQ6aoP42bEIkFWhGxu6pugCuQm1QZMU1Pesf9dNOSRX6
	 YqUddp9Zn1h2+tbaph9wYTefRUvaZBHyCjrtmDk0ZKFgXDh7tj0V02RWIwANgP7O1Fd5P
	 n8CifXShQM286LnAEdaj+RwzbDYEHVQ/79XcOYOyZ70gDpSBNndeoWBy5B08zg72cVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Qh9HjegA;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1539606A31D
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 02:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1539606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Qh9HjegA
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so4791259a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 19:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793068134; x=1793672934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0DKYkKim1zCQPtEbSstx8AMdlP0KYJRU77N3GxfZjCQ=;
        b=Qh9HjegAyEtpn6PG1OPFrqSgqRSnAT+UgBbUz6YO/svCJETYoLjJh3Xbyh6i3MFnHo
         0mT1hXeXE6AoQERRJDjzqP6egkXGq+qGL/pjaQpKzcjYf71ePPRxVT4Agph23mcdKRMe
         hGwSatkqZjIz8eypALgUtTYx6MTXjWuJ6kNks3g+hL2FODNfeVDDDsChdJm47LfTVP7X
         BE6C7QiHgucjS8AF3PCPSnkfeLnKR9A5a5oKMxfAD09nTrinGvadnqVPN7wD80lzAyJk
         cdccKhOiORVJG4FjBCfmhllHamFSCPzAQoMJZVdRjkoPT+nqIdyV3D4Nv5LNNbL7XJ3/
         c6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793068134; x=1793672934;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0DKYkKim1zCQPtEbSstx8AMdlP0KYJRU77N3GxfZjCQ=;
        b=H08PXJksgbABB52NRMliRMlecLM9M1ZmRnNBC+Wd//3WUbF6muJ2F83DnAzVdPlTyy
         UHdFJT9uLq8JQPsRhBl/i3BsdYxOL0+QtiBGe/7m4tRiQMxxx+e3ORfqW6J3k/GbPBbf
         RwdZowYL3pNs1GH8Mkz2Mqg/k/35wJpXKKLNSWBHgWdOqEg5JWFZSk/ZwFWm2z04V8+Z
         8jZh2VzETKZPcSpT14exa09RHM8totPDEf7veLEa0KUxRu+aZHPoZA1KX+x8ZTFIaYux
         Wp1rP5Tdo9wQBgP9dVRKcLu99W9UZ5zeSYHQT8OK/IdVxlcWD0hlB8U/onbWMswaZG70
         GJrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwft8Vb7Z8GqIWeNsztucT9VSIn4LcONEkzbSQRqwhRR+v8XNjQ1mpX9/5glcyJBO94kuwH2wtQg8jijWEiIZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmgZ/1kqAsU9IxLla5JoYBZIxJCQF7ctd3+NAQLycLGkOOBbvP
	xBwqGSm0AkhxDFiNhWd4tvssLNB+3WaIsT76RNKuRhueb+ZcXTfoA/kfl2sDBqxsocyPGe0D3lH
	4FrGn3w==
X-Received: from pfak4.prod.google.com ([2002:aa7:92c4:0:b0:887:8dda:c9e4])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3f90:b0:3e2:8ca9:5c6c
 with SMTP id adf61e73a8af0-3e7bfbd65f6mr5850646637.20.1793068133781; Mon, 26
 Oct 2026 19:28:53 -0700 (PDT)
Date: Tue, 27 Oct 2026 02:28:53 +0000
In-Reply-To: <CAL4WiiqQ3cychvCccpNW+WOU2SYCfNt6L=wgPkNmfTLHLy605Q@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026032216.1145201-1-tavip@google.com> <20261026032216.1145201-2-tavip@google.com>
 <CAL4WiiqQ3cychvCccpNW+WOU2SYCfNt6L=wgPkNmfTLHLy605Q@mail.gmail.com>
Message-ID: <auALgSUuoYmfKSz3@google.com>
Subject: Re: [PATCH net v4 1/2] tcp: clamp return value of tcp_wmem_schedule()
 to non-negative
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: Octavian Purdila <tavip@google.com>, Eric Dumazet <edumazet@google.com>, 
	Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Oct 2026 13:06:56 +0100, Eric Dumazet wrote:
> Le lun. 26 oct. 2026 =C3=A0 04:22, Octavian Purdila <tavip@google.com> a =
=C3=A9crit :
> >
> > When sk_wmem_schedule(sk, copy) fails under TCP memory pressure and
> > sk->sk_wmem_queued already reaches or exceeds sysctl_tcp_wmem[0],
> > tcp_wmem_schedule() returns min(copy, sk->sk_forward_alloc).
> >
> > However, sk->sk_forward_alloc is a signed int that can transiently
> > become negative when tcp_collapse() re-packs partially read or high
> > payload-to-truesize SKBs in the receive queue and charges newly
> > allocated SKBs via sk_mem_charge() before freeing the original SKB.
> >
> > If tcp_wmem_schedule() returns a negative value, tcp_sendmsg_locked()
> > passes that negative copy length to skb_copy_to_page_nocache() ->
> > copy_from_iter_full() -> check_copy_size(), where it is converted to an
> > unsigned size_t > INT_MAX, triggering a WARN_ON_ONCE(bytes > INT_MAX)
> > in production and returning -EFAULT instead of waiting for memory or
> > returning -EAGAIN:
> >
> >   WARNING: CPU: 1 PID: 939331 at include/linux/thread_info.h:249 tcp_se=
ndmsg+0x10c1/0x1530
> >   Call Trace:
> >    <TASK>
> >    __sys_sendmsg+0x292/0x490
> >    do_syscall_64+0x88/0x340
> >    entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >
> > Clamp the return value of tcp_wmem_schedule() to [0, copy] so callers
> > treat negative sk_forward_alloc as 0 available bytes.
> >
> > Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under memory =
pressure")
> > Assisted-by: LLM
> > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> > Reviewed-by: Eric Dumazet <edumazet@kernel.org>
> > Signed-off-by: Octavian Purdila <tavip@google.com>
> > ---
> >  net/ipv4/tcp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> > index 87ef6d5cbfeba..0e062fcd94a6c 100644
> > --- a/net/ipv4/tcp.c
> > +++ b/net/ipv4/tcp.c
> > @@ -1037,7 +1037,7 @@ int tcp_wmem_schedule(struct sock *sk, int copy)
> >         left =3D READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_wmem[0]) - sk-=
>sk_wmem_queued;
> >         if (left > 0)
> >                 sk_forced_mem_schedule(sk, min(left, copy));
> > -       return min(copy, sk->sk_forward_alloc);
> > +       return clamp(sk->sk_forward_alloc, 0, copy);
> >  }
> >
> >  void tcp_free_fastopen_req(struct tcp_sock *tp)
>=20
> I do wonder if the following fix could be better (no change in the fast p=
ath)

Exactly, this looks better too, we can avoid negative
sk_forward_alloc and clamp().

The packetdrill will need to be adjusted as it triggers cgroup
OOM with this approach, or we could defer the test to net-next too.


>=20
> Before a complete fix in tcp_collapse() (in net-next)
>=20
>     tcp: do not let tcp_collapse() drive sk_forward_alloc negative
>=20
>     tcp_collapse() charges each newly allocated skb with skb_set_owner_r(=
)
>     before the skbs it replaces are freed, without scheduling memory firs=
t.
>=20
>     Since sk_mem_uncharge() reclaims eagerly, sk->sk_forward_alloc has no
>     cushion and can become negative. This can be durable when the collaps=
ed
>     skbs had a high payload/truesize ratio or were partially read, becaus=
e
>     the new skbs can have a bigger total truesize than the old ones.
>=20
>     A negative sk_forward_alloc then confuses tcp_wmem_schedule(), which
>     can return a negative length to tcp_sendmsg_locked(), triggering
>     a WARN_ON_ONCE(bytes > INT_MAX) in check_copy_size().
>=20
>     Call sk_forced_mem_schedule() before charging nskb.
>=20
>     Fixes: 4890b686f408 ("net: keep sk->sk_forward_alloc as small as poss=
ible")
>=20
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 1ddce9c4b7e8cf91bfd4f5361abec3925fe25046..e879bdfddf1abe2ced80b12ea=
8a40c1f7c958708
> 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -5847,6 +5847,10 @@ tcp_collapse(struct sock *sk, struct
> sk_buff_head *list, struct rb_root *root,
>                         __skb_queue_before(list, skb, nskb);
>                 else
>                         __skb_queue_tail(&tmp, nskb); /* defer rbtree
> insertion */
> +               /* nskb is charged before the skbs it replaces are freed.
> +                * Make sure sk->sk_forward_alloc can not become negative=
.
> +                */
> +               sk_forced_mem_schedule(sk, nskb->truesize);
>                 skb_set_owner_r(nskb, sk);
>                 mptcp_skb_ext_move(nskb, skb);

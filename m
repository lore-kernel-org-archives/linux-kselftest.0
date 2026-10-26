Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016430;
	b=BTHebIAOLK3yVXtuaM55K7ZZ//qsSx9uPYhVyh5zEDAdI3ATe2u1POVadGJFY9JYiFda
	 SWO/y3yRwxOuxaZM3DGrsO4IPZ6MlC9f9SzzR+1KxFT9Y8U8PmRpsqRycVfaVk4aliycl
	 W1lXHww9WEeVyQqAowbFzNTykmboomZIAhvrbIz0WgMgiC4VcHw9pn40DJ3a7xZeMWsDd
	 25Ym7pqbYGi8E4AJX6aQozA21+wWtIFvLNPoAdI42OGWsIl75Vk4oNe10Ile/1kHvvxtB
	 HkHKNOwDFnhVkC19BddF7thgXQFf7V1kRQkowHy4fhoMXWhydlZ686lxnSsepgwYouw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016430;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=luljZsF+iWnO3KszIjhYznebYyZpvyomwy+SI1LfIaU=;
	b=ZfZzZBGxVhfnbtj4xqfxk21Wrkq7vITa5Y7z1HHUstHmn6flvy7o8YFGoveeY/ALSBpw
	 VXXtAXrtSabtvlPxCPp0P4P6EoMRl8QeMdjKm+kPkuCBKWR89Cgqlp6vTa3EeFaJwPSvG
	 Wc8sX4w9HTL7HtY55g6C9Zw5a3xeiGo7mfLJLz27vZOaBqjNNkYlrz9t2D7qCc0SatfQg
	 ayBoBxL0Zaqcqfs3buY1g8cDBP2yYHDSMncHkzVa1IIulekD3oRjGlX21SosIDeLF53Rt
	 BiKlxgmIECZVoYfXb70RLYfkU9Mn12ioIWPLe7JlNdbG0n9T/iOLhMu5PjoMJgyjaVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NHwjHkeO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F29606A31E
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NHwjHkeO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378AF1F01828
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 12:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016429;
	bh=luljZsF+iWnO3KszIjhYznebYyZpvyomwy+SI1LfIaU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NHwjHkeOkstPEJqCjHX8/2xdRelRt4agBTWQ3Twr9HTsmkxSEUFvN+HcXUjuIGYaB
	 WpJbiqLAbUW6qgFIyqQk3SdmfvrtlLo4eI6xtE/YJZ4YUwuW9GWK6NT64IpZI6hZPy
	 h7BNGKljhKfH+dnaoqKiYC08vaLiPzYkwRbL3jTTnwMeKHyAEw+GrGmVnYJfei9mo8
	 tE0tq54Uv7bjLYbr42jj0mpmNSVZTOSR6EuwDJvIOjGAnsSVuObumKZddJEZVVfkFM
	 Joxah5gfTQrt91IbyiGhj30pF4BO0iL8M6daodIRIVicRWawwAMBEuTsXWOVA6tDHT
	 jpRof49PCO9GQ==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6dd7070699eso2089840eaf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 05:07:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxGn9LiR3mweU1rcWby1HU4gEvNx/Fj7x3IoYJO0dQ0q3vEoels8zeWsh/XjGSOdyfpsaAe/VMTRyqtzIBwSLs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPBfEN43RB0ddF9H2Obj8Evsn04iA4LkBjJzSpVx9YrmjA7Syp
	smYV5duclrceJC0z5evXFFF6wtaMnt0UVbeW6JbzWVa1Hty8h7xKbdTuGLKK2Y1GGdu7cqb53NH
	DAaacydNzzng/QsTIIxsQI9oonaOEKqQ=
X-Received: by 2002:a05:6820:5601:b0:703:a9bc:b7f4 with SMTP id
 006d021491bc7-70ba0da2fb8mr2169046eaf.17.1793016428464; Mon, 26 Oct 2026
 05:07:08 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026032216.1145201-1-tavip@google.com> <20261026032216.1145201-2-tavip@google.com>
In-Reply-To: <20261026032216.1145201-2-tavip@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 26 Oct 2026 13:06:56 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqQ3cychvCccpNW+WOU2SYCfNt6L=wgPkNmfTLHLy605Q@mail.gmail.com>
X-Gm-Features: AclHuK8KFiQyICMplHqTxpaHZz8TgAR3YnqBxsQA3a7KGxLqx573_i0CLVWtPMI
Message-ID: <CAL4WiiqQ3cychvCccpNW+WOU2SYCfNt6L=wgPkNmfTLHLy605Q@mail.gmail.com>
Subject: Re: [PATCH net v4 1/2] tcp: clamp return value of tcp_wmem_schedule()
 to non-negative
To: Octavian Purdila <tavip@google.com>
Cc: Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 26 oct. 2026 =C3=A0 04:22, Octavian Purdila <tavip@google.com> a =
=C3=A9crit :
>
> When sk_wmem_schedule(sk, copy) fails under TCP memory pressure and
> sk->sk_wmem_queued already reaches or exceeds sysctl_tcp_wmem[0],
> tcp_wmem_schedule() returns min(copy, sk->sk_forward_alloc).
>
> However, sk->sk_forward_alloc is a signed int that can transiently
> become negative when tcp_collapse() re-packs partially read or high
> payload-to-truesize SKBs in the receive queue and charges newly
> allocated SKBs via sk_mem_charge() before freeing the original SKB.
>
> If tcp_wmem_schedule() returns a negative value, tcp_sendmsg_locked()
> passes that negative copy length to skb_copy_to_page_nocache() ->
> copy_from_iter_full() -> check_copy_size(), where it is converted to an
> unsigned size_t > INT_MAX, triggering a WARN_ON_ONCE(bytes > INT_MAX)
> in production and returning -EFAULT instead of waiting for memory or
> returning -EAGAIN:
>
>   WARNING: CPU: 1 PID: 939331 at include/linux/thread_info.h:249 tcp_send=
msg+0x10c1/0x1530
>   Call Trace:
>    <TASK>
>    __sys_sendmsg+0x292/0x490
>    do_syscall_64+0x88/0x340
>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Clamp the return value of tcp_wmem_schedule() to [0, copy] so callers
> treat negative sk_forward_alloc as 0 available bytes.
>
> Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under memory pr=
essure")
> Assisted-by: LLM
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>
> Signed-off-by: Octavian Purdila <tavip@google.com>
> ---
>  net/ipv4/tcp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> index 87ef6d5cbfeba..0e062fcd94a6c 100644
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@ -1037,7 +1037,7 @@ int tcp_wmem_schedule(struct sock *sk, int copy)
>         left =3D READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_wmem[0]) - sk->s=
k_wmem_queued;
>         if (left > 0)
>                 sk_forced_mem_schedule(sk, min(left, copy));
> -       return min(copy, sk->sk_forward_alloc);
> +       return clamp(sk->sk_forward_alloc, 0, copy);
>  }
>
>  void tcp_free_fastopen_req(struct tcp_sock *tp)

I do wonder if the following fix could be better (no change in the fast pat=
h)

Before a complete fix in tcp_collapse() (in net-next)

    tcp: do not let tcp_collapse() drive sk_forward_alloc negative

    tcp_collapse() charges each newly allocated skb with skb_set_owner_r()
    before the skbs it replaces are freed, without scheduling memory first.

    Since sk_mem_uncharge() reclaims eagerly, sk->sk_forward_alloc has no
    cushion and can become negative. This can be durable when the collapsed
    skbs had a high payload/truesize ratio or were partially read, because
    the new skbs can have a bigger total truesize than the old ones.

    A negative sk_forward_alloc then confuses tcp_wmem_schedule(), which
    can return a negative length to tcp_sendmsg_locked(), triggering
    a WARN_ON_ONCE(bytes > INT_MAX) in check_copy_size().

    Call sk_forced_mem_schedule() before charging nskb.

    Fixes: 4890b686f408 ("net: keep sk->sk_forward_alloc as small as possib=
le")

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 1ddce9c4b7e8cf91bfd4f5361abec3925fe25046..e879bdfddf1abe2ced80b12ea8a=
40c1f7c958708
100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5847,6 +5847,10 @@ tcp_collapse(struct sock *sk, struct
sk_buff_head *list, struct rb_root *root,
                        __skb_queue_before(list, skb, nskb);
                else
                        __skb_queue_tail(&tmp, nskb); /* defer rbtree
insertion */
+               /* nskb is charged before the skbs it replaces are freed.
+                * Make sure sk->sk_forward_alloc can not become negative.
+                */
+               sk_forced_mem_schedule(sk, nskb->truesize);
                skb_set_owner_r(nskb, sk);
                mptcp_skb_ext_move(nskb, skb);

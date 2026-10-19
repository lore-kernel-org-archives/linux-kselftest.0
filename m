Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792425223;
	b=JdxEKcM82s+gXHZLG1YwF7huc6RoCXwSjFhSAvQcKH54YKqKfz+6/YBBuQI1WZ3wCJ+q
	 c0TTCZRjIvMl+FpoxdmBzfjGwhXkcapaNDLs0BNM2ejzRY7NqkPDp9bJ2vmr5xttACTeC
	 rqWeFfsF4vxocVfUONyaQmU2oP2Ea7i3mYqbnD8/uXqJInlZjWV5A068bg8qhg2Fvmf7d
	 /NBlt4MHgvvxIGLnguGYXf7SLoc7frYzqC27qHNfyL0wemxEnpQ8/GGITyf1asfugc6mh
	 4n48oy0sdOcCSc5ZXZmyKyrud4hjnKx2FXPkkINx29jyiM/zrODdt0O7GB7poSohxuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6NcDKQ3CQHRlm94fb+y6wjDFmyC79P2GiX9bB2T9H8w=;
	b=WGXo6f8zeFR9mtc6SoXajjRQa2ddIhNkqLrMGkywe3yM4xCQL4P1/rv+jz/5uU+WFv4p
	 hxABM2WQIjF1EzujWMXNY93DY9xpm+Kl0IPuBobkqpMhDbnnWWVlIEqJPRS+QUnXfkz0w
	 zuUQMwleOh07kpp9EOTqJ3ZcLp1j4MkJ77JikkWvtbWnlExJZX6nUUFxlK3Idp1wrofjD
	 lHcFMGeckmDWVtqizmw9yNYAAi6Kv0EBhIeSt0T6D3IHJNcCkAb3jmki3kkmUofHPp+Vs
	 LBoiQcOrjqX0yMk0xcmZKNWxcnqR8XrDa6dRWy792UpKPF5UcTiKqWsut7Oo0z1cx0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=j8QIRNZG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7922606C141
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 15:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7922606C141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=j8QIRNZG
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-535f598d126so441791cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 08:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792425222; cv=none;
        d=google.com; s=arc-20260327;
        b=DGc1PUcdw1/nOSOKC5lUummhepVtJq7Bj45bE60s8RIVxeyA/S4XK2Xarbx+fbT9mg
         ivafucZWGjRoSVGGAKY3hEDOKgi9T6EJ99tFkQhLIJjFgFCPqhcNKATxBgLZ0CE2Gl7V
         fFJizbPfCjvZ+qqrijt9TTvQTFrvAnGTV4qpc47vcM27kag1qLohjXkcBz8biVGhAdk2
         YMT768up/h9BJva+hjc0WomNJQie+u87G12L/NBfmW1/cG/7YP17qXpmXXPDzs8sxalC
         T2kN0i0z7tYikbdKWr8kh0HAx3VDcs1DK6jPIuHkAQTXfYQJO3JXE0z4KnGiMEjUjeUH
         yDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6NcDKQ3CQHRlm94fb+y6wjDFmyC79P2GiX9bB2T9H8w=;
        fh=bKoU6fefK4PdCCzaJMRK+Losa8GZxS/T1v7O9G6gLi8=;
        b=I5t4stcSj3wqWD2awi28sOV8OJYFf1On2JEm3dnQeeS2huobcZsVTy5aqIQNLnota8
         t3gp81HDxHovbDDAcReU3w42CtXJfZm16b0CK+LrzW50FkES3rFRgFvJPnxD49SR8lE5
         06kyneULb39xXhdZ8ltyR1sgEAKAhoOdBbp1XbWiiPhpsumkCK6nc+EaLlfQa+RdgVIT
         XJb7Xlrz16HtRxlE6uVX4F2caZ7J0VWjW/OogdQ0YAovK+t07R4FZQ/2hKIKjtc/XQ9e
         lAWBZp33n8s7XcNBt3nbeJ7NSNiLWoYxIYtQ7sCo5tZk1shIwL8v9jqRv6TWnxkakbCt
         TaoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792425222; x=1793030022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6NcDKQ3CQHRlm94fb+y6wjDFmyC79P2GiX9bB2T9H8w=;
        b=j8QIRNZG/23tV3Revk/89RapDA8SLIALCMDC4OfP+3wNIPO4c0pgErcPmoH/Xo9pdl
         7qypAi4avGX8jr7s8MIudiuD1r6Ie40XYAKYeCHR6W9O7Oiei2NJSsmMd2UfAjz8lRMi
         mX6TlOTdi7S4wwtSt+8Yo+rs0FjfZDkHC91rc+koH6iT0q0c/gZdCs+9w0Xkmy2YrCtr
         GMooPJaqL9vEQC+pbO16duP0MhxyhPu8995ZPv97Q2n8q2AORNzr1BuBqDs0goSHpZ3E
         3GmpxwORydzl5YCXe6OdNIvYkHaP+XXlaLJzkfU1MKpJDweZ0KmNi5EoGrRs99vYHdm3
         6khA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792425222; x=1793030022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NcDKQ3CQHRlm94fb+y6wjDFmyC79P2GiX9bB2T9H8w=;
        b=rbaunn7897gT5b+mD8/HIKheMmucKOHJXYy0bm3UFeq2M60Acj8J/F4WFslVDHT6WF
         S7yYPDqdCN5oqye99rck0LLC91nYu1Y1UJcXzHlHXHLL4c4kSutXMoqHKFZj0mTbRGnZ
         bdYLqOQu1VW/CeMA1LEG8Vavg80YMTcQmlQWsThsiKr6rh+pF/i/vUCNe/dr+rEEB/l5
         6FaMM8qkgQpE8lLarB6eM1lJH2ZuuKVicMFssOX2j+MygwVIYKDD9wE3hcpmRQLKxKmj
         Pukm0tB1F8eGgz1C6z520+F8vWy/nvy8gKXdc/gWJHPvcAZyxSZcM4eQRCMj8EoijfBm
         3lrQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+/Yv/PE2c1QZO09qtLmRf/foTyRpXRomyZopEKZzG4zaQTzC4zok/KkXq1nRSZWCLeFqZkiAFD/9aIlMEdCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtPMscdTLihTJEfChLE4zvYDgp0Qor4VKZVgcAWVayp6yEFPR3
	v4fEP8SxQPoqC3mBravIxzuv/uHNqb+QVLRE2IyNlNVGXUrwoJASwp9+T66F9/8iNmOP/0XF198
	HV3kCWqwKEO17MbHembCvw96PZ7BOmNd3Ls5d7Ye8
X-Gm-Gg: AYBFou0oZRzKu9k3CCzOwQIGsrNYGhkkt7xqeCae63qf/BstuLLKB9OX0ogDYxTtRHN
	uz02DpMBfbidt2BV/I4S6VcY2KPzwo0Gj3G7v3yUoF3oGnmCJy5PmL6u0K9nwvRMLW4ieLhLTT1
	sJZxkoF4A1j1kZfWlniVjyTAYWUHjysHX9VZdj9H2pN4OtJI+VV0geHn0/yGOc2XNaTXH/WzrjV
	aAQilSCAzE6FDm1JBIJn48lQFQTlBliB7e4/l2G4W9WJXUxIt4m5ZdZCfLyvLTBofzJne+NmOod
	ZXki8CZS6t0tmo9fOxn+zgsg0NdYVPOWZP+ANshp2lKokH9hwWacXLS2Zyn8wX4cDM7qW4AaekY
	4XI1sAZWJ8wtroBL7EeBhXCNAHf1lnNH4Pc1AOVxRVonj
X-Received: by 2002:a05:622a:4ccd:b0:535:30a:76c7 with SMTP id
 d75a77b69052e-53649a535b1mr41412171cf.3.1792425220585; Mon, 19 Oct 2026
 08:53:40 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018211514.2817293-1-chia-yu.chang@nokia-bell-labs.com> <20261018211514.2817293-4-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20261018211514.2817293-4-chia-yu.chang@nokia-bell-labs.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Mon, 19 Oct 2026 11:53:23 -0400
X-Gm-Features: AclHuK_1jUVxI4Ba9SwLVrMjxrP5yi_6VMujUmIp5B2h4zHaQtt1sXCgtYIXGeA
Message-ID: <CADVnQyn1sjYzfCRiVKOxvyXbx0j2_3y5t9FsyTr81YG9XjdvxA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/3] tcp: Add mss_cache_set_by_cca for CC
 algorithm to set MSS
To: chia-yu.chang@nokia-bell-labs.com
Cc: ihor.solodrai@linux.dev, john.fastabend@gmail.com, jakub@cloudflare.com, 
	jiayuan.chen@linux.dev, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, linux-kselftest@vger.kernel.org, 
	shuah@kernel.org, horms@kernel.org, dsahern@kernel.org, pabeni@redhat.com, 
	jhs@mojatatu.com, stephen@networkplumber.org, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, kuniyu@google.com, 
	ij@kernel.org, koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com, Mike_Rudolph@comcast.com, Jeff_Howe@comcast.com, 
	srichard@netapp.com, Eric Dumazet <edumazet@kernel.org>, 
	Yuchung Cheng <ycheng@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 5:15=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Make the CC module set the mss_cache smaller than path mtu. This is usefu=
l

Since many CC modules will not set the mss_cache value, rather than
"Make the CC module set" I think it's important to say "Allow the CC
module to set".

> for a CC module that maintains an internal fractional cwnd less than 2 at
> very low speed (<100kbps) and very low RTT (<1ms). In this case, the
> minimum snd_cwnd for the stack remains at 2, but the CC module will limit
> the pacing rate to ensure that its internal fractional cwnd takes effect.
> Therefore, the CC algorithm can enable fine-grained control without
> causing big rate saw-tooth and delay jitter.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  include/linux/tcp.h   | 3 ++-
>  net/ipv4/tcp.c        | 1 +
>  net/ipv4/tcp_output.c | 5 +++--
>  3 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/tcp.h b/include/linux/tcp.h
> index e4d1720f49f0..428d63e46206 100644
> --- a/include/linux/tcp.h
> +++ b/include/linux/tcp.h
> @@ -232,7 +232,8 @@ struct tcp_sock {
>                 tcp_usec_ts : 1, /* TSval values in usec */
>                 is_sack_reneg:1,    /* in recovery from loss with SACK re=
neg? */
>                 is_cwnd_limited:1,/* forward progress limited by snd_cwnd=
? */
> -               recvmsg_inq : 1;/* Indicate # of bytes in queue upon recv=
msg */
> +               recvmsg_inq : 1,/* Indicate # of bytes in queue upon recv=
msg */
> +               mss_cache_set_by_cca:1;/* mss_cache set by CCA */
>         __cacheline_group_end(tcp_sock_read_txrx);
>
>         /* RX read-mostly hotpath cache lines */
> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> index f4c9101e5996..708e1830227b 100644
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@ -457,6 +457,7 @@ void tcp_init_sock(struct sock *sk)
>         tp->snd_ssthresh =3D TCP_INFINITE_SSTHRESH;
>         tp->snd_cwnd_clamp =3D ~0;
>         tp->mss_cache =3D TCP_MSS_DEFAULT;
> +       tp->mss_cache_set_by_cca =3D false;
>
>         tp->reordering =3D READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_reorde=
ring);
>         tcp_assign_congestion_control(sk);
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index 3248f3895b15..c53d70718830 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -2082,7 +2082,7 @@ unsigned int tcp_sync_mss(struct sock *sk, u32 pmtu=
)
>         struct inet_connection_sock *icsk =3D inet_csk(sk);
>         int mss_now;
>
> -       if (icsk->icsk_mtup.search_high > pmtu)
> +       if (icsk->icsk_mtup.search_high > pmtu && !tp->mss_cache_set_by_c=
ca)
>                 icsk->icsk_mtup.search_high =3D pmtu;

This looks suspicious, or at least I don't understand the motivation
here. What's the motivation for this?

>         mss_now =3D tcp_mtu_to_mss(sk, pmtu);
> @@ -2096,6 +2096,7 @@ unsigned int tcp_sync_mss(struct sock *sk, u32 pmtu=
)
>
>         return mss_now;
>  }
> +EXPORT_SYMBOL(tcp_sync_mss);
>
>  /* Compute the current effective MSS, taking SACKs and IP options,
>   * and even PMTU discovery events into account.
> @@ -2111,7 +2112,7 @@ unsigned int tcp_current_mss(struct sock *sk)
>
>         mss_now =3D tp->mss_cache;
>
> -       if (dst) {
> +       if (dst && !tp->mss_cache_set_by_cca) {
>                 u32 mtu =3D dst_mtu(dst);
>                 if (mtu !=3D inet_csk(sk)->icsk_pmtu_cookie)
>                         mss_now =3D tcp_sync_mss(sk, mtu);

How is this going to work if the path MTU reduces? For example, if the
sysadmin lowers the MTU to be lower than what's consistent with the
MSS value the CC module chose? Won't the packets from the connection
all be bigger than the MTU, causing weird fragmentation or
black-holing?

AFAICT, to be safe, if the dst_mtu() changes then we still have to
call tcp_sync_mss(), even if the CC module wants some input into the
MSS decision.

Wouldn't it be safer to propose that the CC module optionally sets a
ceiling for the MSS value, rather than giving it direct control over
the MSS value? Along those lines, perhaps CC modules that want to do
this could export a new optional CC module callback that we use in
__tcp_mtu_to_mss(), perhaps something like this?

        /* Clamp it (mss_clamp does not include tcp options) */
        if (mss_now > tp->rx_opt.mss_clamp)
                mss_now =3D tp->rx_opt.mss_clamp;
+       /* Optionally clamp MSS based on CC module: */
+       if (ca_ops->max_mss)
+               mss_now =3D min(mss_now, ca_ops->max_mss(sk));

Perhaps Eric or Yuchung will have a better idea. :-)

Best,
neal

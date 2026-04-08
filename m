Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A877533FE09
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 01:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775610600; cv=pass; b=us+wcH5rzvskOO8n2PLiHx2uRjKE5hNZNmzdOFm8UIX+f1oCys8FLz7fIAMSqDMnfFFSX+xOKC5iUoRzHnryhnuxY8g0paGTrolQX3M4UYd+ViSwhNKE/AcFDBoY1z7ke4Irq+1HKNuqOj9WZnALDjmK29QXyn/1mw8YO5+QBr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775610600; c=relaxed/simple;
	bh=HLGbLzprX3o7Q33ND9CNMaeFSbXEBCSoLXtKU9cKgOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nkndbfFtJvikFXgh3zDlD2DKYh1IG6KOP/HkSIN+pBLfV6qrhsfJfe9vFn9DH15H4M1HCzxNkEM87eRfHu+4xLjEU16l4Wbd1t1hprABxfcEQv3tHdhd54f6I8Demh+QuQm03UVF5d4fcOBKJmGkcCgiwynJIPY/TEF78SezEWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g02kY4s2; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g02kY4s2"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8a049a767c3so4715666d6.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 18:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775610597; cv=none;
        d=google.com; s=arc-20240605;
        b=jPTvejE3ouumqEQ/YkiQVDoOT+5fRJVJYHBmpg7jH/AEM95lSCCFpccTIe/H4eWcss
         QeGrXr92t8QWx1qzO5sqp+HCPg5h9+ik3bXH0hpsUa3kohF8e96Fn4W/dcnwFnRpOvrh
         vLxtwzaJ3E6HhZ98Mxbp6tZLo1NqThq0u1kROHZhbjbwVGbpO+xgAe4yfOkWGTItHAhT
         D7TVRRA9jNIbWcFCP7Nrc3QvDb+V2GpiJcURPz552a4Z26jRp8vhSGBK8uZWlIY6t9Bd
         hs8Sa8vM/wa3BGgELn4I7MHkNF8l3asHXc03hDS/bTLRQBY3pyp4HcAjJ6pTf48h1BSs
         lntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6CnllyHcmL42d+sntBlRrvIMxVfxG4aHz1wIWuprY20=;
        fh=kOf+nnfmUgipjR4eOqZzHDBlJ9C82DpEwtbHU/Prxpk=;
        b=WgF9ENcHyIEQoetC1/B0HV4o6BXOxRBAdQwkXlEV1EcE4th7v7BTQXQy/VUz8dNVTS
         AR6DLtk6REOuYiN+PSjydaxiMUQfIDlYObRMTplc88HgdRDTAJBhxLQpX6WDpfbKUS7x
         k4NGRBA1CEcHK7Edttznjx0ZZ6Jj+Unbfb0vTIjMU0a9KPRoY8DW4l3gDFZHaVwVcek8
         0409FtXgbC9d9PU2AtzPt/Sb26njpPewfwIXQ3EXheBPuGZsNtghdU/RmxTOUqrNnoBp
         g9AVBa90QJpGxB2UijfQHWz7FtWWxhLDVB1qZP72PZ5Igny8CFYJlkqcaXB3WYexynsB
         449g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775610597; x=1776215397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CnllyHcmL42d+sntBlRrvIMxVfxG4aHz1wIWuprY20=;
        b=g02kY4s2ukmhHMhgeUBacSfG49ryglqa6miKT0mk4imzF2QqnXZEa2cEZFRIUwrsbe
         2lSfWsIx0A4b6DWO09fZyyOpQ+gOykasrTJNDlSkGUF3jSRgp9sAWuZs9v/CcNZxorNy
         lXvydGEfGstlFJ4Gmk4skGXYOzyTbNsI1wiiR3mk5gixF5ZfihS+VyX5VOo4T7haYAJH
         zg4Vz8i7+PwSymtzaVpkY/yI32arn4RdI6TAZFDM98xskRvcWAv5q88rE68Ri0fxRCQ/
         8At7siMQQuOQEjNe1lNAhqspG1vPCzCTcP9YiabcjOhCSxxj7dE3sGDyiM0Y/KYHvNmx
         8wIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775610597; x=1776215397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6CnllyHcmL42d+sntBlRrvIMxVfxG4aHz1wIWuprY20=;
        b=lq2741WaVNqTGhbDBtKMF+EJGtv0ZSfI5N7JWyHFtVQnwXK7Cb1PxEduy/CMHBmEA2
         sjQGHuwTxson1B/v2ADX0OSqruqQz65+ily0+MFQaRXtPEpXJ4TayQgF1hVCXT9lIaNH
         sXfMskLbI+fYsmRIxh1qdqkGMcOPx2RZ+BQnvu32BHOmKNL9Ncpkywh0LCgNwnyprso8
         nXQ1uBkPHVdCBX2JNP0rWCtXoV6GmOUfCNZS/GacrKONxn7U5Q8O1qW7KH+w1laPMqUZ
         c6gsgunsa3ya/pe9z9UiaW4ETY9zCLCtyR1eg2aQFOjXgEmTuBZl0kXGgl3LPzLtUsOE
         Ar1A==
X-Forwarded-Encrypted: i=1; AJvYcCVMmO5PXAPswOfEzfxQbptpw6yksKwyoSKkGo3i5OvwGR0Se75QljzCU4TRDJvgBia16KflUfuebeWpsndVGno=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNNE2pkBkVZcFXhc2qpYno0HdraWX8DyZ3B51RNhcorl4djWUl
	C0pTVbQx9cBhvJF5d3vQ6pDFozjsSdnCL1USmsE7aoP7rmK8MzZxO4yUixTkA3LrSO9T1srVUkx
	Un/ojQxO8gScmW0iYWJwSXAAbNvMj/ozF6du6/q4j
X-Gm-Gg: AeBDieuSJLukTQSFg2CNix+IK521KTkXpbO5qDVtCh2QGSC/lt3nUr7Mzpydn7bByvQ
	g5ufZD4h30So5YPmDRIHoIO8wUwKSKWpvhFlYPzeRw4wMAl8wdQ6BelEEH+rBqD93/yjYGcRwUn
	W4pdS2p8bxeGd4XauEJUdC5yGeVfNnfHUkLNLfFjn0xjguZBQKMX9JXugWkTGADY2zx5zh5CX1V
	dDczfvtA72KFYjCkcI3h7NjYCOq7yB57UqoRTwWPXD6JRYF+6yFzyfLbUUmppY7M5tmX1oUblAf
	EP5jIA==
X-Received: by 2002:a05:6214:300b:b0:89c:ac42:e119 with SMTP id
 6a1803df08f44-8a5eb234eafmr309305806d6.8.1775610597101; Tue, 07 Apr 2026
 18:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408002802.2448424-1-ntspring@meta.com> <20260408002802.2448424-2-ntspring@meta.com>
In-Reply-To: <20260408002802.2448424-2-ntspring@meta.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 7 Apr 2026 18:09:45 -0700
X-Gm-Features: AQROBzDN6Bjc7JHGf3pJNRJZD6llfhcIh61WMtfBNKyiuVxyBGROyIH2L8JlWyo
Message-ID: <CANn89iKEgkbS=FEssas9upr4kTpAuH2PRehthBC4Oc4bBfW8hQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] tcp: rehash onto different ECMP path on
 retransmit timeout
To: Neil Spring <ntspring@meta.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	Ido Schimmel <idosch@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 5:28=E2=80=AFPM Neil Spring <ntspring@meta.com> wrot=
e:
>
> Add sk_dst_reset() alongside sk_rethink_txhash() in the RTO, PLB,
> and spurious-retrans paths so that the next transmit triggers a fresh
> route lookup.  Propagate sk_txhash into fl6->mp_hash in
> inet6_csk_route_req() and inet6_csk_route_socket() so
> fib6_select_path() uses the socket's current hash for ECMP selection.
>
> The ir_iif update in tcp_check_req() covers both IPv4 and IPv6
> because it was cleaner than gating on address family; IPv4 is
> otherwise unaltered, and not having autoflowlabel in IPv4 means
> I wouldn't expect a new path on timeout.
>
> It is possible that PLB does not need this (that there are other
> methods of reacting to local congestion); I added the sk_dst_reset
> for consistency.
>
> Signed-off-by: Neil Spring <ntspring@meta.com>
> ---
>  net/ipv4/tcp_input.c             | 4 +++-
>  net/ipv4/tcp_minisocks.c         | 9 +++++++++
>  net/ipv4/tcp_plb.c               | 1 +
>  net/ipv4/tcp_timer.c             | 1 +
>  net/ipv6/inet6_connection_sock.c | 8 ++++++++
>  5 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 7171442c3ed7..3d42ab45066c 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -5014,8 +5014,10 @@ static void tcp_rcv_spurious_retrans(struct sock *=
sk,
>             skb->protocol =3D=3D htons(ETH_P_IPV6) &&
>             (tcp_sk(sk)->inet_conn.icsk_ack.lrcv_flowlabel !=3D
>              ntohl(ip6_flowlabel(ipv6_hdr(skb)))) &&
> -           sk_rethink_txhash(sk))
> +           sk_rethink_txhash(sk)) {
>                 NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPDUPLICATEDATAREH=
ASH);
> +               sk_dst_reset(sk);
> +       }
>
>         /* Save last flowlabel after a spurious retrans. */
>         tcp_save_lrcv_flowlabel(sk, skb);
> diff --git a/net/ipv4/tcp_minisocks.c b/net/ipv4/tcp_minisocks.c
> index 199f0b579e89..ef4b3771e9d8 100644
> --- a/net/ipv4/tcp_minisocks.c
> +++ b/net/ipv4/tcp_minisocks.c
> @@ -750,6 +750,15 @@ struct sock *tcp_check_req(struct sock *sk, struct s=
k_buff *skb,
>                  * Reset timer after retransmitting SYNACK, similar to
>                  * the idea of fast retransmit in recovery.
>                  */
> +

What is the following part doing?
tcp_v6_init_req() uses something quite different before setting ir_iif
A comment explaining the rationale would be nice.

> +#if IS_ENABLED(CONFIG_IPV6)
> +               if (sk->sk_family =3D=3D AF_INET6)
> +                       inet_rsk(req)->ir_iif =3D tcp_v6_iif(skb);
> +               else
> +#endif
> +                       inet_rsk(req)->ir_iif =3D
> +                               inet_request_bound_dev_if(sk, skb);
> +
>                 if (!tcp_oow_rate_limited(sock_net(sk), skb,
>                                           LINUX_MIB_TCPACKSKIPPEDSYNRECV,
>                                           &tcp_rsk(req)->last_oow_ack_tim=
e)) {
> diff --git a/net/ipv4/tcp_plb.c b/net/ipv4/tcp_plb.c
> index 68ccdb9a5412..d7cc00a58e53 100644
> --- a/net/ipv4/tcp_plb.c
> +++ b/net/ipv4/tcp_plb.c
> @@ -79,6 +79,7 @@ void tcp_plb_check_rehash(struct sock *sk, struct tcp_p=
lb_state *plb)
>                 return;
>
>         sk_rethink_txhash(sk);
> +       sk_dst_reset(sk);
>         plb->consec_cong_rounds =3D 0;
>         tcp_sk(sk)->plb_rehash++;
>         NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPPLBREHASH);
> diff --git a/net/ipv4/tcp_timer.c b/net/ipv4/tcp_timer.c
> index ea99988795e7..acc22fc532c2 100644
> --- a/net/ipv4/tcp_timer.c
> +++ b/net/ipv4/tcp_timer.c
> @@ -299,6 +299,7 @@ static int tcp_write_timeout(struct sock *sk)
>         if (sk_rethink_txhash(sk)) {
>                 tp->timeout_rehash++;
>                 __NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPTIMEOUTREHASH)=
;
> +               sk_dst_reset(sk);
>         }
>
>         return 0;
> diff --git a/net/ipv6/inet6_connection_sock.c b/net/ipv6/inet6_connection=
_sock.c
> index 37534e116899..2fe753bb38b4 100644
> --- a/net/ipv6/inet6_connection_sock.c
> +++ b/net/ipv6/inet6_connection_sock.c
> @@ -48,6 +48,11 @@ struct dst_entry *inet6_csk_route_req(const struct soc=
k *sk,
>         fl6->flowi6_uid =3D sk_uid(sk);
>         security_req_classify_flow(req, flowi6_to_flowi_common(fl6));
>
> +       if (req->num_retrans)
> +               fl6->mp_hash =3D jhash_1word(req->num_retrans,
> +                                          (__force u32)ireq->ir_rmt_port=
)
> +                               >> 1;

Why not setting mp_hash to sk_txhash ?

Why are you using ">> 1" ?

rt6_multipath_hash() seems to be bypassed, it might be time to add a
comment there
explaining that mp_hash needs to be 31-bit only...

Perhaps use rt6_multipath_hash() and expand it to use a socket pointer
to retrieve sk->sk_txhash when/if possible
instead of yet another flow dissection.

> +
>         if (!dst) {
>                 dst =3D ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_=
p);
>                 if (IS_ERR(dst))
> @@ -70,6 +75,9 @@ struct dst_entry *inet6_csk_route_socket(struct sock *s=
k,
>         fl6->saddr =3D np->saddr;
>         fl6->flowlabel =3D np->flow_label;
>         IP6_ECN_flow_xmit(sk, fl6->flowlabel);
> +
> +       if (sk->sk_txhash)
> +               fl6->mp_hash =3D sk->sk_txhash >> 1;

Seems inconsistent, and same question about the right shift.


>         fl6->flowi6_oif =3D sk->sk_bound_dev_if;
>         fl6->flowi6_mark =3D sk->sk_mark;
>         fl6->fl6_sport =3D inet->inet_sport;
> --
> 2.52.0
>

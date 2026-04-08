Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B35C28FA91
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 07:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775631630; cv=fail; b=GLGXTURDMhU/qtz4UBdrdIDXP/tEYLT00dkFPBnKKHa9PDloT0BCDUPvqHeBggVvFT3rzqwysc1Tq5SqsIp18F2YeYhAumV9fUhq8AHSGdsRhnKee00kIYVfebYBh5mC3/Auorc3jRH6mMPmIMMVHf5uvuUeEgY9jRLjC4Ln3pM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775631630; c=relaxed/simple;
	bh=1MdQSuI3nvNc/eDzyoUNjEXCFBFBmsJotRJYHXhbUB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tB+nZleQhhUV1e5BKJf+iBDup+cxrL6xiALpHPhXxOMRpxoxZF9A5PFBte1sH/f0JERod/0VN7FExwrMQqk3gYxwno/g0C/WTSekVDac1T/YoH5NavddUDM+SC0ITvGpRKsqul4prEtBAIP6j8nskjEx6m3TVp/wM1z50DEmT/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=kAGNiGv2; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="kAGNiGv2"
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637J5PxU2446830
	for <linux-kselftest@vger.kernel.org>; Wed, 8 Apr 2026 00:00:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=h0EamnadhOTpD/0Bd/G+aA8kqz1sRrXwxveYTUbSEto=; b=kAGNiGv2nh1U
	DO/jKpyL1+1Thtj9B+kIhZS5rv3bug8qzR58yChytUNTo0j/hfmhiec3U+sdZ3+x
	kvSKok+EVFPCX0FOQr2dJIA2KQoG4WiuPz5jghHKZDqmPvEZkQeejGumBNPJxGwx
	WfsEk3AQ4j9w8BD3p/RlVLosqOTkOnAtYmrBgwX4EDme9P13rBDqLsSYvtvftd6x
	l+KKLUCuaXBW8uiYV3UOtL6oIH969HB6O5HIf5JbEMAfgh4k6CwSZh2Gps+HVIP0
	mVg0F7pRbg4NZLLggmwrPlXtPtDhnVCmu0JM/la8Xz3hr6qLrl51QakNpe8NygA/
	9ypkFirqJg==
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dcmsdhc69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 00:00:18 -0700 (PDT)
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b9c2bce2affso389333766b.1
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 00:00:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775631617; cv=none;
        d=google.com; s=arc-20240605;
        b=SyQFI0t+M6CCF3eov7ZDUj8NkrD58XROfUI06Uf3rAbtE9uxYqs4La0YGxnSVfBRs6
         OJs1Bvkiqr0USwkmYGJsI8Np84RDmcELdHOevuIc8oh+abzxL72rTwNIxK436ZyRhKP0
         QZX7KDjiTHjhJjrYwA++moC9ggxhfguTeuWdnKoWvAEYx7Ficqq5qOMjb8AvD/xu1LFR
         2wbY6p6gkTHDMROLKH0EZHSnr/Xp33s3bvK7MSNBOT6xQQfH8xQ/Fihh3MZM+qlP2uzY
         Jeq4BqmXjilMSq1C3TAOhVNgwhsmdDc2MS1N2lrld7fAYmBcfBv5r0T/rbLWle8Scbo7
         QQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=3eMzaszELn0E8mw1f+wWiQKidENOH8YD54nKWgR4c6o=;
        fh=pdtgR/hVm9RgkZ7Hs+lzuOigKPxv3E8fMMLcP8N/OXM=;
        b=UapDoazXeCNZo/C+RemXfwNmDxXibSO1oOqedu65kfTqCqNS59FyHw8MqWtwfTU3r2
         U29G1xFBYbWMAtgH058tSVMW/C2prVV7RrHTq3giosu5YuRAf/Ib4SuxK/wyOvCl3R7X
         JNrVQgP9DWz0391vLAotRk4uOoUuUsmef3obTCeSQkS81imNK+2VWyzg6W4GWG6onwAL
         QeM7r1liavhUjTOglpJEKstFKUsMfWXA2cVK5/wD1hWBFeNa8MBekmJ05YKnwudBQfmW
         /cqT/oVA6j2O/JwbShVo4gZ70lkwZOagf4V521tipbpNp5q4zrVtAph0kdDsz0xmggIB
         0vhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775631617; x=1776236417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3eMzaszELn0E8mw1f+wWiQKidENOH8YD54nKWgR4c6o=;
        b=qtlrHguGms54VfVrBlKpi0qaTRfWXqYObUE1AdeoqZl0UZbzTc9pfgxTBNAqPl+z+c
         DteG+2IGaiGLq/e9CrPLHb6Tv1CDPJheFY3CF2mrUrKUlqe7xQ901mow8DqnWlvAzsuX
         PWQD4Mo0YfLuNzm2JRjZ9SsZqB3K5Oi17ewqWbENby0Lv7umDKOY9rD27HszPWjubWJL
         eesiHMVYclWofeU8HBv1LbrRBgBrLpdRmy6UYfsVTTCzIw2GJu+qys3IhlPLC7QnBhh1
         Psv/9Duc1YqHFXX8Djaz3KeQcHGn9Wo8MAaUi10vLWbAfcHmdrrTqvp3Ijmqs2qs+2/3
         6kCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPlRo2sn4RvSEKHoy3HAL3xbABfZxg6Tah7dZ9ufY4QLD2dpa3DqeumH8R7/GCLnDKTEfxUSwy1FZx4Vuj764=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRlKkQx6HkQYpadu0CccudATooHsuJEb0nAsp7wIuLA3mo8FbB
	a+1UMk0AJRcUcXcyMPYsvukrfnXNwdqUP8rQQQlusUg65qpbYKkQZAJ0A46if7/eKouA7Hz2vqn
	FqH0qmONVuKtAh/cJ3s0Wz47bC2VT/f2d/ru6aJ3KlVHaOvYbNqBVRSX6xz8Ncav0UdX6W+r7uT
	7bF+xX6SIPprlRZPUZpCVRZt6BoUT7YaIxVvoOs7Xaig==
X-Gm-Gg: AeBDiesyoS+Gw3r4zCc2L13EkTB8QKMjt1Ql9rODt+07XhLSEPvwtwhZtMrb83UKnAZ
	GvDkuwD9V4EFdQGUTUr5zH1DuJVoma4urNffdCykZSfYcIrawl8jsqdK5N8Bvr2IPypoGFL8Ex7
	/M6acAVnjaePMRuVmALUM+oA02iAR0LspPGY3RPKEkQV0XmqoFtU4vS75Gl4Ic9XiTAvF+pfB01
	ipJUxPe1kviDAgYl6Pj
X-Received: by 2002:a17:906:2081:b0:b98:5b2:77f7 with SMTP id a640c23a62f3a-b9c672fc811mr608412266b.12.1775631616856;
        Wed, 08 Apr 2026 00:00:16 -0700 (PDT)
X-Received: by 2002:a17:906:2081:b0:b98:5b2:77f7 with SMTP id
 a640c23a62f3a-b9c672fc811mr608410266b.12.1775631616132; Wed, 08 Apr 2026
 00:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408002802.2448424-1-ntspring@meta.com> <20260408002802.2448424-2-ntspring@meta.com>
 <CANn89iKEgkbS=FEssas9upr4kTpAuH2PRehthBC4Oc4bBfW8hQ@mail.gmail.com>
In-Reply-To: <CANn89iKEgkbS=FEssas9upr4kTpAuH2PRehthBC4Oc4bBfW8hQ@mail.gmail.com>
From: Neil Spring <ntspring@meta.com>
Date: Tue, 7 Apr 2026 23:59:50 -0700
X-Gm-Features: AQROBzCc3z2TzBzLUH87d8G6LUS3qCJYYgcvgfsOpGzjtAwX0tHc5xN1dfvW6_I
Message-ID: <CAGy2EQbzLLV5WfrrnoNn1ocuE1oojQ1HB6xfQ8FH1Mgp5iR-Gw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] tcp: rehash onto different ECMP path on
 retransmit timeout
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com,
        davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org,
        pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, Ido Schimmel <idosch@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=d4rFDxjE c=1 sm=1 tr=0 ts=69d5fd03 cx=c_pps
 a=jJvPsHQLKLf2UdvVr97r4g==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=03ozwUkBphtHgyqjj1sw:22 a=1XWaLZrsAAAA:8 a=VabnemYjAAAA:8
 a=N6M6QLLqE6vfnKd7XjcA:9 a=QEXdDO2ut3YA:10 a=q7aydO1c4wibL4nb3gNS:22
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2MSBTYWx0ZWRfXx28E7XT0/qDG
 HMP4VhyZmqWrkQ+aVUSX6Pk8c0AfdMHM9ZwUKqFAAzXPwoj9VG0bToGFuhk5QC7nWGLXDh2W7cI
 Iz0T/BkDinAQSSlJrF13URmgzRMEWCFUy77R8nSalZNBxgmxPfeemqYDnD+oawiUiHgxKxj5UM4
 GMNGZlWtux4uvahkjBYJ3Z+Vfj/11/M7NZiK/rCLCLQG7dWlQwFoYvmaDMnUk+gA5ELbLF/r4g0
 6PiQf61QLtw+D9lg8bsd4PQyYpiNzRZkUFFCM2OP0lccMUhLHBmQLw5CdRDf0u2vjL1r2nntvi7
 U+5UU5hn9FhJ4bwiE/V5/wP4pR2s1tLyX3RdPWgkMXvhuI7DvP7diDwHFaToIzQ0SCNXoePoCoN
 S1veoy8WwQsXwUUaMN3MDBxGFE4aekyMblZf1JJR0n4lCYqikk0su9TfP9uspZ3eT4NV3esUzZc
 02Nswfe8fvaGJPX1DIA==
X-Proofpoint-GUID: fAoOkDz_US16vH0ALnhQhv6ZAc5BS-Iw
X-Proofpoint-ORIG-GUID: fAoOkDz_US16vH0ALnhQhv6ZAc5BS-Iw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01

Thanks Eric for looking at this; sorry for the duplicate email as I
failed to reply all; comments below.

On Tue, Apr 7, 2026 at 6:09=3DE2=3D80=3DAFPM Eric Dumazet <edumazet@google.=
com> w=3D
rote:
> On Tue, Apr 7, 2026 at 5:28=3DE2=3D80=3DAFPM Neil Spring <ntspring@meta.c=
om> wr=3D
ote:
> >
> > Add sk_dst_reset() alongside sk_rethink_txhash() in the RTO, PLB,
> > and spurious-retrans paths so that the next transmit triggers a fresh
> > route lookup.  Propagate sk_txhash into fl6->mp_hash in
> > inet6_csk_route_req() and inet6_csk_route_socket() so
> > fib6_select_path() uses the socket's current hash for ECMP selection.
> >
> > The ir_iif update in tcp_check_req() covers both IPv4 and IPv6
> > because it was cleaner than gating on address family; IPv4 is
> > otherwise unaltered, and not having autoflowlabel in IPv4 means
> > I wouldn't expect a new path on timeout.
> >
> > It is possible that PLB does not need this (that there are other
> > methods of reacting to local congestion); I added the sk_dst_reset
> > for consistency.
> >
> > Signed-off-by: Neil Spring <ntspring@meta.com>
> > ---
> >  net/ipv4/tcp_input.c             | 4 +++-
> >  net/ipv4/tcp_minisocks.c         | 9 +++++++++
> >  net/ipv4/tcp_plb.c               | 1 +
> >  net/ipv4/tcp_timer.c             | 1 +
> >  net/ipv6/inet6_connection_sock.c | 8 ++++++++
> >  5 files changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > index 7171442c3ed7..3d42ab45066c 100644
> > --- a/net/ipv4/tcp_input.c
> > +++ b/net/ipv4/tcp_input.c
> > @@ -5014,8 +5014,10 @@ static void tcp_rcv_spurious_retrans(struct sock=
=3D
 *sk,
> >             skb->protocol =3D3D=3D3D htons(ETH_P_IPV6) &&
> >             (tcp_sk(sk)->inet_conn.icsk_ack.lrcv_flowlabel !=3D3D
> >              ntohl(ip6_flowlabel(ipv6_hdr(skb)))) &&
> > -           sk_rethink_txhash(sk))
> > +           sk_rethink_txhash(sk)) {
> >                 NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPDUPLICATEDATAR=
=3D
EHASH);
> > +               sk_dst_reset(sk);
> > +       }
> >
> >         /* Save last flowlabel after a spurious retrans. */
> >         tcp_save_lrcv_flowlabel(sk, skb);
> > diff --git a/net/ipv4/tcp_minisocks.c b/net/ipv4/tcp_minisocks.c
> > index 199f0b579e89..ef4b3771e9d8 100644
> > --- a/net/ipv4/tcp_minisocks.c
> > +++ b/net/ipv4/tcp_minisocks.c
> > @@ -750,6 +750,15 @@ struct sock *tcp_check_req(struct sock *sk, struct=
=3D
 sk_buff *skb,
> >                  * Reset timer after retransmitting SYNACK, similar to
> >                  * the idea of fast retransmit in recovery.
> >                  */
> > +
>
> What is the following part doing?
> tcp_v6_init_req() uses something quite different before setting ir_iif
> A comment explaining the rationale would be nice.

Comment added in v2.  The behavior I thought I observed was that the
ir_iif goes into fl6->flowi6_oif in inet6_csk_route_req(), limiting options
to any next hop on that interface, so if we received a retransmitted syn
on a new interface, we should try to use the new interface for the
response.

>
> > +#if IS_ENABLED(CONFIG_IPV6)
> > +               if (sk->sk_family =3D3D=3D3D AF_INET6)
> > +                       inet_rsk(req)->ir_iif =3D3D tcp_v6_iif(skb);
> > +               else
> > +#endif
> > +                       inet_rsk(req)->ir_iif =3D3D
> > +                               inet_request_bound_dev_if(sk, skb);
> > +
> >                 if (!tcp_oow_rate_limited(sock_net(sk), skb,
> >                                           LINUX_MIB_TCPACKSKIPPEDSYNREC=
=3D
V,
> >                                           &tcp_rsk(req)->last_oow_ack_t=
=3D
ime)) {
> > diff --git a/net/ipv4/tcp_plb.c b/net/ipv4/tcp_plb.c
> > index 68ccdb9a5412..d7cc00a58e53 100644
> > --- a/net/ipv4/tcp_plb.c
> > +++ b/net/ipv4/tcp_plb.c
> > @@ -79,6 +79,7 @@ void tcp_plb_check_rehash(struct sock *sk, struct tcp=
=3D
_plb_state *plb)
> >                 return;
> >
> >         sk_rethink_txhash(sk);
> > +       sk_dst_reset(sk);
> >         plb->consec_cong_rounds =3D3D 0;
> >         tcp_sk(sk)->plb_rehash++;
> >         NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPPLBREHASH);
> > diff --git a/net/ipv4/tcp_timer.c b/net/ipv4/tcp_timer.c
> > index ea99988795e7..acc22fc532c2 100644
> > --- a/net/ipv4/tcp_timer.c
> > +++ b/net/ipv4/tcp_timer.c
> > @@ -299,6 +299,7 @@ static int tcp_write_timeout(struct sock *sk)
> >         if (sk_rethink_txhash(sk)) {
> >                 tp->timeout_rehash++;
> >                 __NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPTIMEOUTREHAS=
=3D
H);
> > +               sk_dst_reset(sk);
> >         }
> >
> >         return 0;
> > diff --git a/net/ipv6/inet6_connection_sock.c b/net/ipv6/inet6_connecti=
=3D
on_sock.c
> > index 37534e116899..2fe753bb38b4 100644
> > --- a/net/ipv6/inet6_connection_sock.c
> > +++ b/net/ipv6/inet6_connection_sock.c
> > @@ -48,6 +48,11 @@ struct dst_entry *inet6_csk_route_req(const struct s=
=3D
ock *sk,
> >         fl6->flowi6_uid =3D3D sk_uid(sk);
> >         security_req_classify_flow(req, flowi6_to_flowi_common(fl6));
> >
> > +       if (req->num_retrans)
> > +               fl6->mp_hash =3D3D jhash_1word(req->num_retrans,
> > +                                          (__force u32)ireq->ir_rmt_po=
=3D
rt)
> > +                               >> 1;
>
> Why not setting mp_hash to sk_txhash ?

To be honest, I was trying to avoid adding #include <tcp.h> to the top of
inet6_connection_sock.c, which is needed to get tcp_rsk(req)->txhash, but
that does make better code, using that in v2.

> Why are you using ">> 1" ?

The >> 1 is due to rt6_multipath_hash returning its computed
value shifted right one before going into mp_hash in route.c sites.
I understood mp_hash can't have the high bit set and still work
due to fib6_select_path treating it as a signed integer when comparing
to fib_nh_upper_bound.

> rt6_multipath_hash() seems to be bypassed, it might be time to add a
> comment there
> explaining that mp_hash needs to be 31-bit only...
>
> Perhaps use rt6_multipath_hash() and expand it to use a socket pointer
> to retrieve sk->sk_txhash when/if possible
> instead of yet another flow dissection.

I think thyour comment above (grabbing txhash) avoids the dissection.

>
> > +
> >         if (!dst) {
> >                 dst =3D3D ip6_dst_lookup_flow(sock_net(sk), sk, fl6, fi=
na=3D
l_p);
> >                 if (IS_ERR(dst))
> > @@ -70,6 +75,9 @@ struct dst_entry *inet6_csk_route_socket(struct sock =
=3D
*sk,
> >         fl6->saddr =3D3D np->saddr;
> >         fl6->flowlabel =3D3D np->flow_label;
> >         IP6_ECN_flow_xmit(sk, fl6->flowlabel);
> > +
> > +       if (sk->sk_txhash)
> > +               fl6->mp_hash =3D3D sk->sk_txhash >> 1;
>
> Seems inconsistent, and same question about the right shift.

Adding comment and standardizing on
* tcp_rsk(req)->txhash >> 1 for request sockets,
* sk->sk_txhash >> 1 for established sockets.

>
>
> >         fl6->flowi6_oif =3D3D sk->sk_bound_dev_if;
> >         fl6->flowi6_mark =3D3D sk->sk_mark;
> >         fl6->fl6_sport =3D3D inet->inet_sport;
> > --
> > 2.52.0
> >

On Tue, Apr 7, 2026 at 6:09=E2=80=AFPM Eric Dumazet <edumazet@google.com> w=
rote:
>
> >
> On Tue, Apr 7, 2026 at 5:28=E2=80=AFPM Neil Spring <ntspring@meta.com> wr=
ote:
> >
> > Add sk_dst_reset() alongside sk_rethink_txhash() in the RTO, PLB,
> > and spurious-retrans paths so that the next transmit triggers a fresh
> > route lookup.  Propagate sk_txhash into fl6->mp_hash in
> > inet6_csk_route_req() and inet6_csk_route_socket() so
> > fib6_select_path() uses the socket's current hash for ECMP selection.
> >
> > The ir_iif update in tcp_check_req() covers both IPv4 and IPv6
> > because it was cleaner than gating on address family; IPv4 is
> > otherwise unaltered, and not having autoflowlabel in IPv4 means
> > I wouldn't expect a new path on timeout.
> >
> > It is possible that PLB does not need this (that there are other
> > methods of reacting to local congestion); I added the sk_dst_reset
> > for consistency.
> >
> > Signed-off-by: Neil Spring <ntspring@meta.com>
> > ---
> >  net/ipv4/tcp_input.c             | 4 +++-
> >  net/ipv4/tcp_minisocks.c         | 9 +++++++++
> >  net/ipv4/tcp_plb.c               | 1 +
> >  net/ipv4/tcp_timer.c             | 1 +
> >  net/ipv6/inet6_connection_sock.c | 8 ++++++++
> >  5 files changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > index 7171442c3ed7..3d42ab45066c 100644
> > --- a/net/ipv4/tcp_input.c
> > +++ b/net/ipv4/tcp_input.c
> > @@ -5014,8 +5014,10 @@ static void tcp_rcv_spurious_retrans(struct sock=
 *sk,
> >             skb->protocol =3D=3D htons(ETH_P_IPV6) &&
> >             (tcp_sk(sk)->inet_conn.icsk_ack.lrcv_flowlabel !=3D
> >              ntohl(ip6_flowlabel(ipv6_hdr(skb)))) &&
> > -           sk_rethink_txhash(sk))
> > +           sk_rethink_txhash(sk)) {
> >                 NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPDUPLICATEDATAR=
EHASH);
> > +               sk_dst_reset(sk);
> > +       }
> >
> >         /* Save last flowlabel after a spurious retrans. */
> >         tcp_save_lrcv_flowlabel(sk, skb);
> > diff --git a/net/ipv4/tcp_minisocks.c b/net/ipv4/tcp_minisocks.c
> > index 199f0b579e89..ef4b3771e9d8 100644
> > --- a/net/ipv4/tcp_minisocks.c
> > +++ b/net/ipv4/tcp_minisocks.c
> > @@ -750,6 +750,15 @@ struct sock *tcp_check_req(struct sock *sk, struct=
 sk_buff *skb,
> >                  * Reset timer after retransmitting SYNACK, similar to
> >                  * the idea of fast retransmit in recovery.
> >                  */
> > +
>
> What is the following part doing?
> tcp_v6_init_req() uses something quite different before setting ir_iif
> A comment explaining the rationale would be nice.
>
> > +#if IS_ENABLED(CONFIG_IPV6)
> > +               if (sk->sk_family =3D=3D AF_INET6)
> > +                       inet_rsk(req)->ir_iif =3D tcp_v6_iif(skb);
> > +               else
> > +#endif
> > +                       inet_rsk(req)->ir_iif =3D
> > +                               inet_request_bound_dev_if(sk, skb);
> > +
> >                 if (!tcp_oow_rate_limited(sock_net(sk), skb,
> >                                           LINUX_MIB_TCPACKSKIPPEDSYNREC=
V,
> >                                           &tcp_rsk(req)->last_oow_ack_t=
ime)) {
> > diff --git a/net/ipv4/tcp_plb.c b/net/ipv4/tcp_plb.c
> > index 68ccdb9a5412..d7cc00a58e53 100644
> > --- a/net/ipv4/tcp_plb.c
> > +++ b/net/ipv4/tcp_plb.c
> > @@ -79,6 +79,7 @@ void tcp_plb_check_rehash(struct sock *sk, struct tcp=
_plb_state *plb)
> >                 return;
> >
> >         sk_rethink_txhash(sk);
> > +       sk_dst_reset(sk);
> >         plb->consec_cong_rounds =3D 0;
> >         tcp_sk(sk)->plb_rehash++;
> >         NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPPLBREHASH);
> > diff --git a/net/ipv4/tcp_timer.c b/net/ipv4/tcp_timer.c
> > index ea99988795e7..acc22fc532c2 100644
> > --- a/net/ipv4/tcp_timer.c
> > +++ b/net/ipv4/tcp_timer.c
> > @@ -299,6 +299,7 @@ static int tcp_write_timeout(struct sock *sk)
> >         if (sk_rethink_txhash(sk)) {
> >                 tp->timeout_rehash++;
> >                 __NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPTIMEOUTREHAS=
H);
> > +               sk_dst_reset(sk);
> >         }
> >
> >         return 0;
> > diff --git a/net/ipv6/inet6_connection_sock.c b/net/ipv6/inet6_connecti=
on_sock.c
> > index 37534e116899..2fe753bb38b4 100644
> > --- a/net/ipv6/inet6_connection_sock.c
> > +++ b/net/ipv6/inet6_connection_sock.c
> > @@ -48,6 +48,11 @@ struct dst_entry *inet6_csk_route_req(const struct s=
ock *sk,
> >         fl6->flowi6_uid =3D sk_uid(sk);
> >         security_req_classify_flow(req, flowi6_to_flowi_common(fl6));
> >
> > +       if (req->num_retrans)
> > +               fl6->mp_hash =3D jhash_1word(req->num_retrans,
> > +                                          (__force u32)ireq->ir_rmt_po=
rt)
> > +                               >> 1;
>
> Why not setting mp_hash to sk_txhash ?
>
> Why are you using ">> 1" ?
>
> rt6_multipath_hash() seems to be bypassed, it might be time to add a
> comment there
> explaining that mp_hash needs to be 31-bit only...
>
> Perhaps use rt6_multipath_hash() and expand it to use a socket pointer
> to retrieve sk->sk_txhash when/if possible
> instead of yet another flow dissection.
>
> > +
> >         if (!dst) {
> >                 dst =3D ip6_dst_lookup_flow(sock_net(sk), sk, fl6, fina=
l_p);
> >                 if (IS_ERR(dst))
> > @@ -70,6 +75,9 @@ struct dst_entry *inet6_csk_route_socket(struct sock =
*sk,
> >         fl6->saddr =3D np->saddr;
> >         fl6->flowlabel =3D np->flow_label;
> >         IP6_ECN_flow_xmit(sk, fl6->flowlabel);
> > +
> > +       if (sk->sk_txhash)
> > +               fl6->mp_hash =3D sk->sk_txhash >> 1;
>
> Seems inconsistent, and same question about the right shift.
>
>
> >         fl6->flowi6_oif =3D sk->sk_bound_dev_if;
> >         fl6->flowi6_mark =3D sk->sk_mark;
> >         fl6->fl6_sport =3D inet->inet_sport;
> > --
> > 2.52.0
> >

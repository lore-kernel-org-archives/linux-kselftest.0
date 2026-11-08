Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794107853;
	b=ovgCLuBWJ6SD6d8nfIa48xpIUYjwOmkrfq4BVuiD6R6Hgk7sDuc8uqIBwHA3km4xt3jD
	 8VaDTBnYih5rzoCB/v0YZgW6AqU48Iq6Zn3artlNilpdBo5vel5jC3j0AsW59Piw8LWXk
	 M21agBEhHw+t7OrWE9JjJL8kIQTfLpIXUS5ULSxsr+3aEU161huuTx62x5oX3AIRH0OGg
	 mnzFy5TbtMgqnr2ANerWNwXRxtxmF3zLBmT9OJ7tbKKuhubMJnpR+d79CJI62b3RhnfoV
	 VEnLg3q4XoCQHzmjK43hK7wN4nygLEshfhg9ykYKOerTcCHkyaBHTjZhMgfEzRHBMwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794107853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2I+093n0UIY5U+GFcKHbH0n1dxSizOMfEkvs86TkO6k=;
	b=PGNUYqw03UscR6bnnqWjAyPPR/WfPy26eXoF8x6fiTx75aQtbYn3TUWhy47Ou/unK2iH
	 XhrzEFSbnsHRb9M5OUD7tdtQjx9a+a01ABVGv1zh77KCumJPh90iG1Wd+BzgU0MyQvoLK
	 gxI6MqNaZ2BR4FeSKLJ0qJp21Q8i5Wfp8pz2lK52+M6bNcIgXK/X+ZOt/PNqCY+7AzVH2
	 qJGM71k1TS6y1C1lG4O5sW8XKXR1TfEl1ywh45+QepApXCvMFKX2lDJS+Pn91yLc/Oiho
	 6h5nZJwDBghHw76+0LeqSV09HG54EQQMMexVrdjMuXkwl3hGsjx9BkkUUZQKYk8SWEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="IAvay/DA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659E3606A31D
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 03:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 659E3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IAvay/DA
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-535f598d126so1451cf.1
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 19:17:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794107851; cv=none;
        d=google.com; s=arc-20260327;
        b=heAcCgf3JLMP0xhYc3rQ7c1a5fIJ9BM9bpboqanheUYV/hPee29Eo4RL9dTQUENuUf
         /0gVhRg6/Dw4GPOW5hPjAHTFzmTCggzl0+tzoOT/uqvpTxOab3UtVIA9oURwi4Vxrd5G
         VChGj44mJ8VQq5FzrVhSW2GZJDfWNO59Fsv3S6uYRv2ZAngX49xHAs/rDSzoIZ4y5THh
         j95KL9uAar2vqqRM2pRHjVBo7/oHgRfb4jcpA/ajMJ/hgDVByA5C7pDrhASY8GqzkgBy
         P0nWeYr47IywqGPfMYpYhCJQD2cIw+b5gl15GuOKaOAkc9/3IJTWBoEqvbX+v/GHuBAW
         Xljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2I+093n0UIY5U+GFcKHbH0n1dxSizOMfEkvs86TkO6k=;
        fh=mD34qrTjO9mX7i0Xr96Mm7IsvwUH0jamTKeDHIQqmEo=;
        b=Xq9jScgHDzTGWWwIfiCjI8fzcgCisBHFqwP8vl6wWYtaiglpdynUhiVMgBZUj+aGL7
         5MceMfwpntxoqo5uYoSRuysLkggSzKgzDZkWn7K/tSqJUkxenMppM2MlmHK8RPmjPlGf
         0Lviana5P508FcodLjQ6KXlXU57DvOAKSVfKb9nDwAruxeFXMUbSwJOc/Nc9YXjQiMSE
         ITUumTOFoo8rFqJE0XLWzSdlpkzZc+DzM/h5Rm7mrdsa6sIo7NtNqIicrYc2QfCJ7ZE6
         Dj/ibX5rXLACfuZrlM5Xv7M9otYs4KDgrj9UjhlYqvyxnf7RUI2e9lQK3souZiPs97pD
         I0qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794107851; x=1794712651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2I+093n0UIY5U+GFcKHbH0n1dxSizOMfEkvs86TkO6k=;
        b=IAvay/DAoBXnCYRsuvPIfgM1EqwkTz4a4tmBKkexani6vdcOk6tvyJW1llJbr50Ant
         rtpnr3ZKB2H6NfViDuTZ9Kne5WzwAplnbA3ercPCvpo2hhET+pgv59Pp/1mYx7n20FCQ
         FZvGdx1l2QpDSu6koxOSTM4tXoVg75xD1Q1MEZCaIhirg1MvP2YrApQ8T/nQOlyLojrZ
         gQ3gAQK7OFQIVyCgdPW7XP2k898mmgu181MvyNqN4nWzyf6NYJpkK/9ghQ+t+ZpE9ysA
         1hTZPZmYjb0cD1vy5p6JUSoA9TrXJqZ89eWBXClmcJytcdrNv9PgJR6TpWDkB1VNmwZ0
         USrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794107851; x=1794712651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2I+093n0UIY5U+GFcKHbH0n1dxSizOMfEkvs86TkO6k=;
        b=wq60aZTdEQj8pgUNM5fIQvEgPtUIuF7mAGej46f/4UhMJwyEDzhfXZ+vhFWT/9UrLd
         QCe7FMoFtwz5kw/dUB28FljUH9Ykwe3eQr8G4TFxACP3XEWwTSkrsOl0WahGiVVP6kLa
         JaAXcKXP7RSAakDrf+VoSC7Rf6VUyYn8B59+TiXuRf1ij4As/1D9q0vsFtekODnvEuD3
         u4kS5Ule95/v1G+vM+hhKMhqovLt/xkHgWzoBefvUIK8zNPGpjYuxOu8v2oAVq9qOTFK
         Amnq+T2crSXufNWoXenICAowGnhRDp0lSWJxHUjM4ghWD7VbiHR1Gfz0V5RG3UlKIRW/
         jt+g==
X-Forwarded-Encrypted: i=1; AKwUvBwMutnxGImzup/6sCW4EGyeEwmiCJlmr6cM/qF8Dplxp74QVv2MRkKqP4AnB86Ia20r4jFsi4tVuVwLVHaEvvs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3L96uS9gtlr8khy3zRC/Y8w+q/WBtXUPfzeBi9lDEmJXD4ei6
	36TSXNYiSfheH0V9pmAmQ8EUM6LfTzTZQ2oPIPp9+3M1lzO3PoinXV1ArlujpJ99W1iCUbLKgqn
	WxTtMqD+xjLdqfPi9zRqK6tvHmGucznak9O58smRR
X-Gm-Gg: AYBFou092NKR8p3ZXSN/5G4EddGKVL+uYyl+qHQwbOpNk7f7XuEKW9tFHKGIezZIeri
	QG0HePEb+MJ+UKYDmlfgBJn0/AosAeUVgvm3OAz3Q1j6+9iWMzGtz2hcKkRlNgqssIoJcO64NxX
	us6Rd6A8cilnn6fMWsHYYaKZ25w61fGYyW+kvBXgCKtYN5uSVtkU6hI9Tur/huuEs37pKsmFtT7
	tLKBPTV/yUnLRKsHr8HdI370Aq7wYl/pGXr4IVG4EyvVTc7aDXgdUQhTQNeX+BNwb3qXUjOuI2F
	kXF42tJx6Dmxu+yoJ5C/65DEPx019JGAEoqTXgqadkYE3ZuqD7xo2YK5JUiZMqS4ZkLqItLEccH
	UKL91gl+ygSz2X4u6KeIbUfPw8kW5qJMNmpuZ9Wa/HCpEKzc4EzdhTfM6HYvP4VYodSF9AabJzZ
	j8w04DRblKEQB4F4dbyQvm+Y28sZQ=
X-Received: by 2002:a05:622a:5985:b0:535:bb33:6351 with SMTP id
 d75a77b69052e-54f9f0c1cbcmr18824881cf.1.1794107850713; Sat, 07 Nov 2026
 19:17:30 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com>
 <20261103-mtu-probing-series-v1-1-a2809e725aaa@gmail.com> <CADVnQy=AHpy6UoiAFopRUmHLNv6Arw07PysXVijiR=qERuzeww@mail.gmail.com>
 <au9zxblIQx7OF_gx@google.com>
In-Reply-To: <au9zxblIQx7OF_gx@google.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sat, 7 Nov 2026 22:17:11 -0500
X-Gm-Features: AclHuK_hiKxuy2XPBtNnUtx6z7qgzENFTmDz_HcsklNHSgevwIjrhp-FGceyzzc
Message-ID: <CADVnQy=6mDzR6XQxnasHECbq7=9f54AH8cjny+rAdR_yR_ZsTw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/4] tcp: sync MSS after enabling MTU probing on
 passive connections
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: echoowall@gmail.com, horms@kernel.org, edumazet@kernel.org, 
	kuba@kernel.org, shuah@kernel.org, davem@davemloft.net, pabeni@redhat.com, 
	netdev@vger.kernel.org, panweiping3@gmail.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 2:15=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.com=
> wrote:
>
> On Sat, 07 Nov 2026 12:53:36 -0500, Neal Cardwell wrote:
> > On Tue, Nov 3, 2026 at 2:09=E2=80=AFAM Yongjian Wang via B4 Relay
> > <devnull+echoowall.gmail.com@kernel.org> wrote:
> > >
> > > From: Yongjian Wang <echoowall@gmail.com>
> > >
> > > tcp_v4_syn_recv_sock() and tcp_v6_syn_recv_sock() call tcp_sync_mss()
> > > before MTU probing is enabled, and tcp_init_transfer() enables it lat=
er
> > > without syncing the MSS again.
> > >
> > > With net.ipv4.tcp_mtu_probing=3D2, a passive connection therefore sta=
rts
> > > at the full MSS instead of tcp_base_mss as documented, while an activ=
e
> > > connection starts at tcp_base_mss. This has two visible effects, show=
n
> > > here with tcp_base_mss=3D1024:
> > >
> > >  - The MSS drops when the first probe is acknowledged, from 1460 to 1=
242,
> > >    although that probe has just shown the path can carry more.
> > >
> > >  - On a black hole path the MSS never tries tcp_base_mss. It goes fro=
m
> > >    1460 straight to 512, since MTU probing is already enabled when bl=
ack
> > >    hole detection triggers.
> > >
> > > Sync the MSS right after tcp_mtup_init(). tcp_sync_mss() only applies
> > > search_low when MTU probing is enabled, so the other tcp_mtu_probing
> > > values keep their behaviour.
> > >
> > > The Fixes commit kept tcp_mtup_init() in a single place on purpose, s=
o
> > > sync the MSS next to it instead of moving it back into the
> > > syn_recv_sock() handlers.
> > >
> > > Fixes: 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()"=
)
> > > Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> > > ---
> > >  net/ipv4/tcp_input.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > > index e1f2d9765..c13f005b2 100644
> > > --- a/net/ipv4/tcp_input.c
> > > +++ b/net/ipv4/tcp_input.c
> > > @@ -6760,6 +6760,7 @@ void tcp_init_transfer(struct sock *sk, int bpf=
_op, struct sk_buff *skb)
> > >         struct tcp_sock *tp =3D tcp_sk(sk);
> > >
> > >         tcp_mtup_init(sk);
> > > +       tcp_sync_mss(sk, icsk->icsk_pmtu_cookie);
> > >         icsk->icsk_af_ops->rebuild_header(sk);
> > >         tcp_init_metrics(sk);
> > >
> > >
> > > --
> >
> > Functionally this seems correct. But I'm wondering about the
> > performance impact, and whether there is a way to achieve this without
> > adding this call to the code path for every connection establishment?
> >
> > Eric and Kuniyuki, WDYT?
>
> Looking at history, initially it seems we properly called
> tcp_mtup_init() right before tcp_sync_mss() in ->syn_recv_sock(),
> but 4d83e1773031 removed them.
>
> The dup tcp_mtup_init() mentioned in the commit is the one in
> tcp_init_transfer() today.
>
> Then, 27204aaa9dc6 moved only tcp_mtup_init() to tcp_init_transfer()
> without tcp_sync_mss().
>
> The dup exists in tcp_rcv_state_process() from day 0 (5d424d5a674f),
> and 168a8f58059a copy-and-pasted the unnecessary tcp_mtup_init().
>
> So, 4d83e1773031 removed the correct one.
>
> Instead of restoring the 2nd set of calls, I think we should
> revert 4d83e1773031 and remove tcp_mtup_init() in tcp_init_transfer().
>
> ---8<---
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index e1f2d9765f81..8d009c0d9359 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -6759,7 +6759,6 @@ void tcp_init_transfer(struct sock *sk, int bpf_op,=
 struct sk_buff *skb)
>         struct inet_connection_sock *icsk =3D inet_csk(sk);
>         struct tcp_sock *tp =3D tcp_sk(sk);
>
> -       tcp_mtup_init(sk);
>         icsk->icsk_af_ops->rebuild_header(sk);
>         tcp_init_metrics(sk);
>
> diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> index a7f9242f1e42..579a88472abf 100644
> --- a/net/ipv4/tcp_ipv4.c
> +++ b/net/ipv4/tcp_ipv4.c
> @@ -1740,6 +1740,7 @@ struct sock *tcp_v4_syn_recv_sock(const struct sock=
 *sk, struct sk_buff *skb,
>
>         tcp_ca_openreq_child(newsk, dst);
>
> +       tcp_mtup_init(newsk);
>         tcp_sync_mss(newsk, dst4_mtu(dst));
>         newtp->advmss =3D tcp_mss_clamp(tcp_sk(sk), tcp_dst_advmss(dst));
>
> diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
> index e006a30360ea..c465fd97baec 100644
> --- a/net/ipv6/tcp_ipv6.c
> +++ b/net/ipv6/tcp_ipv6.c
> @@ -1489,6 +1489,7 @@ static struct sock *tcp_v6_syn_recv_sock(const stru=
ct sock *sk, struct sk_buff *
>
>         tcp_ca_openreq_child(newsk, dst);
>
> +       tcp_mtup_init(newsk);
>         tcp_sync_mss(newsk, dst6_mtu(dst));
>         newtp->advmss =3D tcp_mss_clamp(tcp_sk(sk), tcp_dst_advmss(dst));
>
> ---8<---

Thanks, Kuniyuki. I agree that seems like a good approach. Though
since 27204aaa9dc6 also moved the tcp_mtup_init() out of
tcp_rcv_synsent_state_process(), I think with your nice approach we'd
also want to place a call to tcp_mtup_init(sk) right before the
tcp_sync_mss() call on the active connect code path as well, something
like:

--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -7015,6 +7015,7 @@ static int tcp_rcv_synsent_state_process(struct
sock *sk, struct sk_buff *skb,
                  tp->tcp_header_len =3D sizeof(struct tcphdr);
          }

+        tcp_mtup_init(sk);
          tcp_sync_mss(sk, icsk->icsk_pmtu_cookie);
          tcp_initialize_rcv_mss(sk);

WDYT?

neal

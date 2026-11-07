Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794078935;
	b=J5fC+dlMiXdxN3LU9Bmrc2TCSNewoxCg6lQRhc1x9mwk18JW9pQ2UcYzhNQPARmZ3i/n
	 mSJuzxbV9HoVHvrhNMKINboNQkdi+/tXY8Dmvcw5+/OKMM8yPxtalGf++dfvPkpvIIKCZ
	 jD/Q7gZ0y74EyOTzUCrOyhvNkfNpzwDaJU2m7eDADl7w0CVo5svZsJuA4vjN6zptrLHy1
	 BHMwWCANXqTiB8BOALV5dHXOAhQ9bBJlRWBc92qpB9s/82rnja/jPhwGhQ/9zAxgOPmFl
	 TBEQ418AezCvetPOlITuMrB3adPSq8f0nJZLH5NAmz1Y7mIVv6gyZWRTRWkhQtUBJMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794078935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=mafEGEdrVUw8NHEcO8SJv6Z5WTJzza2tDmHJlOhN/14=;
	b=FFsX004U6Ys81QrKSwFvF+afIZzJF0nYmbFPH7iDTfdpsfSNAUpJdMYcc941APGl4oyn
	 hXSO5tuiqgwM+FZWOyc/xUDeInZSvffODOfWf4pkPE01oqIkHkMeief7D7vxnYKworMSa
	 MzaJfGR6ya1UAoTuNdNWNcY34LOd8Mlyg/qsrtXTlUT9cru8uEgQ52uk442o3+hri8n8e
	 OmSZK8ot5QjKRPNxKuu+KQOCUWfBDtNfnqi7r/o6UAA0cAguiR7mOARYblrTz1MbGNHFN
	 1xN647s6Kj+K6xoVieHemBavCW0xt/aMttoZmt39MAJFvd58c5MIRY8Qf1F1koTcbuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="dC6J/aT7";
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88FF606A32C
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 19:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D88FF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dC6J/aT7
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed08b07232so16058355ad.3
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 11:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794078934; x=1794683734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mafEGEdrVUw8NHEcO8SJv6Z5WTJzza2tDmHJlOhN/14=;
        b=dC6J/aT7bfCHFAgBwL9fqX1e+XMB4+JBfvLSPEI8QMnQp2rB5ihlxHSZcZ4lG1siSt
         at8n0Fcu7d6uRniKJQJ6R60b0eUq+EL+T2S578q5VnXp2yUGL8wSDnrO4jvcj/c08q8D
         74EkV0l2nM3hyeCj16HmTGFs2gJ6fG0Sx1o2NzZwVtCkHSzSpTRt31QoQzMi10woPj2R
         sVshTgt+yHiuT3OYIAtd+hNBnscKhi7yyFEa0DJiWHLjPbaeiwbdKXtAcsYATXrUkrng
         uGqELtm8cv1gB+KeW64o7KjpCnL0U9avz5K4guIoqjIFrBb9VFiS+/62xlEirGpyGuOH
         VXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794078934; x=1794683734;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mafEGEdrVUw8NHEcO8SJv6Z5WTJzza2tDmHJlOhN/14=;
        b=tkqL3LOdw0uf62FrbOVL/cI5bvREM6spWvLeuQTJ85mh0zwYSnwPQM7rX7d8F23bvc
         3ufLitTGXqqTdtZZWtp02jhtDSUa+U3U/JhkUtNMyEw9jyuZQXpvFvW6xlmMqGLggh1i
         te7jt/wjDymzX/MXAKwFCf5UMujMgbf4zFqfREC0o0JAOIWxcl3V3hKvxiLNh+Q6haak
         CKH8tEizyX6DXm49tKkDPtAoOYpMtwtxWI4ZC3Q8tcWHNFWUVzx1ckC4Z/0+JycQCR5D
         zKwCnaI80J+yBk8KSUgoD7b5ygxSb+6S0v2822YYvpcZRMl0yzot0l9HIk6wh+glhOAN
         eD7Q==
X-Forwarded-Encrypted: i=1; AL+hErG4LbnDyhcNLucZ5zwBG4H5aBXPtOLlzsVpZ0Bc7oNYSoLn6qB7hNmeAfQmFyV9wBrtRa7UUn/27LtdLdKm770=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nVmSh13XsqXQZ5du5sqaEmPOKkk+tF9AsI75EwE6xJEwrMzrJ
	OYd3XL1eDcYCOjKV7DeQtSys11q7oxJEDDRdWUzxeealRpzB0XdqQAohJe4wjl3PfTBj+55lv2/
	AoGPfyw==
X-Received: from plsl4.prod.google.com ([2002:a17:903:2444:b0:2eb:6048:4647])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b28:b0:2ed:2e3a:1faf
 with SMTP id d9443c01a7336-2ed40c937e4mr67561865ad.47.1794078933562; Sat, 07
 Nov 2026 11:15:33 -0800 (PST)
Date: Sat, 7 Nov 2026 19:15:33 +0000
In-Reply-To: <CADVnQy=AHpy6UoiAFopRUmHLNv6Arw07PysXVijiR=qERuzeww@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com>
 <20261103-mtu-probing-series-v1-1-a2809e725aaa@gmail.com> <CADVnQy=AHpy6UoiAFopRUmHLNv6Arw07PysXVijiR=qERuzeww@mail.gmail.com>
Message-ID: <au9zxblIQx7OF_gx@google.com>
Subject: Re: [PATCH net-next 1/4] tcp: sync MSS after enabling MTU probing on
 passive connections
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Neal Cardwell <ncardwell@google.com>
Cc: echoowall@gmail.com, horms@kernel.org, edumazet@kernel.org, 
	kuba@kernel.org, shuah@kernel.org, davem@davemloft.net, pabeni@redhat.com, 
	netdev@vger.kernel.org, panweiping3@gmail.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 07 Nov 2026 12:53:36 -0500, Neal Cardwell wrote:
> On Tue, Nov 3, 2026 at 2:09=E2=80=AFAM Yongjian Wang via B4 Relay
> <devnull+echoowall.gmail.com@kernel.org> wrote:
> >
> > From: Yongjian Wang <echoowall@gmail.com>
> >
> > tcp_v4_syn_recv_sock() and tcp_v6_syn_recv_sock() call tcp_sync_mss()
> > before MTU probing is enabled, and tcp_init_transfer() enables it later
> > without syncing the MSS again.
> >
> > With net.ipv4.tcp_mtu_probing=3D2, a passive connection therefore start=
s
> > at the full MSS instead of tcp_base_mss as documented, while an active
> > connection starts at tcp_base_mss. This has two visible effects, shown
> > here with tcp_base_mss=3D1024:
> >
> >  - The MSS drops when the first probe is acknowledged, from 1460 to 124=
2,
> >    although that probe has just shown the path can carry more.
> >
> >  - On a black hole path the MSS never tries tcp_base_mss. It goes from
> >    1460 straight to 512, since MTU probing is already enabled when blac=
k
> >    hole detection triggers.
> >
> > Sync the MSS right after tcp_mtup_init(). tcp_sync_mss() only applies
> > search_low when MTU probing is enabled, so the other tcp_mtu_probing
> > values keep their behaviour.
> >
> > The Fixes commit kept tcp_mtup_init() in a single place on purpose, so
> > sync the MSS next to it instead of moving it back into the
> > syn_recv_sock() handlers.
> >
> > Fixes: 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
> > Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> > ---
> >  net/ipv4/tcp_input.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > index e1f2d9765..c13f005b2 100644
> > --- a/net/ipv4/tcp_input.c
> > +++ b/net/ipv4/tcp_input.c
> > @@ -6760,6 +6760,7 @@ void tcp_init_transfer(struct sock *sk, int bpf_o=
p, struct sk_buff *skb)
> >         struct tcp_sock *tp =3D tcp_sk(sk);
> >
> >         tcp_mtup_init(sk);
> > +       tcp_sync_mss(sk, icsk->icsk_pmtu_cookie);
> >         icsk->icsk_af_ops->rebuild_header(sk);
> >         tcp_init_metrics(sk);
> >
> >
> > --
>=20
> Functionally this seems correct. But I'm wondering about the
> performance impact, and whether there is a way to achieve this without
> adding this call to the code path for every connection establishment?
>=20
> Eric and Kuniyuki, WDYT?

Looking at history, initially it seems we properly called
tcp_mtup_init() right before tcp_sync_mss() in ->syn_recv_sock(),
but 4d83e1773031 removed them.

The dup tcp_mtup_init() mentioned in the commit is the one in
tcp_init_transfer() today.

Then, 27204aaa9dc6 moved only tcp_mtup_init() to tcp_init_transfer()
without tcp_sync_mss().

The dup exists in tcp_rcv_state_process() from day 0 (5d424d5a674f),
and 168a8f58059a copy-and-pasted the unnecessary tcp_mtup_init().

So, 4d83e1773031 removed the correct one.

Instead of restoring the 2nd set of calls, I think we should
revert 4d83e1773031 and remove tcp_mtup_init() in tcp_init_transfer().

---8<---
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index e1f2d9765f81..8d009c0d9359 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -6759,7 +6759,6 @@ void tcp_init_transfer(struct sock *sk, int bpf_op, s=
truct sk_buff *skb)
 	struct inet_connection_sock *icsk =3D inet_csk(sk);
 	struct tcp_sock *tp =3D tcp_sk(sk);
=20
-	tcp_mtup_init(sk);
 	icsk->icsk_af_ops->rebuild_header(sk);
 	tcp_init_metrics(sk);
=20
diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index a7f9242f1e42..579a88472abf 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -1740,6 +1740,7 @@ struct sock *tcp_v4_syn_recv_sock(const struct sock *=
sk, struct sk_buff *skb,
=20
 	tcp_ca_openreq_child(newsk, dst);
=20
+	tcp_mtup_init(newsk);
 	tcp_sync_mss(newsk, dst4_mtu(dst));
 	newtp->advmss =3D tcp_mss_clamp(tcp_sk(sk), tcp_dst_advmss(dst));
=20
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index e006a30360ea..c465fd97baec 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -1489,6 +1489,7 @@ static struct sock *tcp_v6_syn_recv_sock(const struct=
 sock *sk, struct sk_buff *
=20
 	tcp_ca_openreq_child(newsk, dst);
=20
+	tcp_mtup_init(newsk);
 	tcp_sync_mss(newsk, dst6_mtu(dst));
 	newtp->advmss =3D tcp_mss_clamp(tcp_sk(sk), tcp_dst_advmss(dst));
=20
---8<---


Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4DC481FDB
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 15:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129450; cv=pass; b=ottNm1jIiJ31Ie9vsTjGEqkSLHoM1+J9ajvGfrvC2hCvgAw/trcoyXes1TJIxr1HYH2C91j2GPvWYmwkrWmdSKawBnv4Mt7uvwkR1HCIBIK1DLp9ZD3ZKXV9gl0dWDyZYn429JfxG7LGPuiLuQThuQOAQ/yVlpAwT0Grn40r9gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129450; c=relaxed/simple;
	bh=a5mdkI2L/Dbv1+W+Y3MrrreSzCjtlRhjsUjoxEMa4d0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKK88NCO9fabTiBVyavuA/P80tMSZLy4esVrQPsnwKqIC74bLVuUz28MF8/UVSAv+4I7tKVIfynA8izy623VsXX4gpES3tBvvCnb/JrDCSO42f3OntQR41vtjiyfvonm53cB2HpaqLKPkQ50opDi4h1nPMxepzygbwPrdF6RKl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wwqk7p4s; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wwqk7p4s"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c08df8513so15354911cf.3
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 08:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784129448; cv=none;
        d=google.com; s=arc-20260327;
        b=b/OWECuI5zYY5z4vpj9C04alCYI1ytqlFb8YPB+k/cE+LhfkwO04DwGqv0Zv/3TxhS
         TiTaa3stJjz9e+F/Jqh1wPOSOUAggRqBnNhunYbkd86IsiKusCvQvoNMsghYWQ4nO5ra
         /+xLJgahtsKVyntCuwMUrCs2hECPjRrjqRrrb2yf0ZqUXqwmK60oZYrfcnVBkbUmx6y1
         thSsn0AOfAQqhgcN1GsYG9hRNytCSLDsEr2fPkfw9/TdqRp7jOjnqrAOy/690CNDlatZ
         y0fBAMLzsSzp2fLVKo9EqenIwZM/T2KT3TP3SNX/8BqNiBv5E5/6iXovpNK4ohpaYe+s
         r7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YVV2ZbfQNvN6Fg6uxe70CkyOoUGkDw0WBSeQAqc4p6s=;
        fh=P8JNgFKVTf12oGOdMPhwfFPFQAyDTg1ceb4Ui2Yzh+8=;
        b=isU1wrdacPDRy77MHi+AAEuurhey5MxbKupJdZkNDOpLwn4Ju+/wnpLTHrIKji8t+x
         3HaHj/RQdyAmrQ0om6iJwlbdWUP3zv/4+qnHLrLphO8ao+FWmGFVeo/75J/rTshRx52c
         8ZH8BoEnyLqHslrVZuFKGLnWugV0xL5WDEdIhLKwH8DkowhJ6HVdlicEO6P0tuDUndcG
         +0NDg9DoOVDLZCUKGlH/aej0/yTxfSRDK1N/mxaW51b+6DL9Sso3hfQf6C2ZkMdIJXas
         sitpuwdlAFW17Js3/uizxEVpzmR/KrCRT1epbNwnW9cPmcN214X1pBtaHdBooQ0Fw7pc
         rftA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784129448; x=1784734248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YVV2ZbfQNvN6Fg6uxe70CkyOoUGkDw0WBSeQAqc4p6s=;
        b=Wwqk7p4sYWz/0i+KkwtuzmR5u49LxegFq1+corwSUFTk6KO9ovfkBuV+ftmGO+QD6W
         GtNhj0+xHsOT41Gm84Dg7XSsOm2d8b6WW1jX1R5raIk+oSDfTJFRXn2Fz+TMvjLp3D9W
         RIqaEw6auog+LdjIIQGkjwRCY9JZK3pBydMPilp4tOonZNyaoB5bo027nyk9+pxgJeq8
         hHLm8yN5FvgizY/cTKxlmIxbzAYlVvKFTW20O2ZDIh1SgifIqqhSH7/Wj06m2io363Nl
         JKkXelCsgmfIKzdqbMkRu3oMusxwObiYu/ZUxIVzDYBY9FWFfEVzuzYZDHrE5N9R/VMc
         Lqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784129448; x=1784734248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVV2ZbfQNvN6Fg6uxe70CkyOoUGkDw0WBSeQAqc4p6s=;
        b=JqEnsVMvMW3TRuH+u08T8Q3HqQ4IxEmJC6lMQ9G8zussHn7yQuPCRXbb65PY4gr7q0
         GWkWEAbAu9oKBTaMK7Zyoi1K8SXHJYxjDrTwQlk9gT3wNcqCcBbPH+6CPkqvKowAjt+w
         Ce0zbbtDKojdB8NsIq7uNkdxyXxIIOiUd0M8azJ/8bzidAynXz68yKKjz7MpESmyD1aj
         YyMBfwG1K0TMxtWqbF5JebITjgPnM/9H1WbKCcL0TCf8ir7bewC8E9Wn/6dMSr65zK6D
         flPYlhxHblkMk96RgzLu/4iz1OdnFHTXsLfZlkDuJGvgmTZWUWGLsRLQnkglZ0aXziyF
         wyvA==
X-Forwarded-Encrypted: i=1; AHgh+RojJzFQOF5hfewtYYNWQN8Pjgi8co/HCnCi11+bpZsSf2nN6xmlB2Dn8zr3dLqWVUDcOJuW/aEZe85W8HYZKf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCOJzOhDH8DEsLg905oglUEFDPdRopt6qnM66BvTXFU5epD8ma
	vkLk2uX83OsN+I3lnvSGrS/8ydg46Em5UzhT6dWNzTMA8CLfPW0d1uRcreIZ+v61k9E8U+IE4+R
	jhJNmSofMHsB/A/eSFvsRH6SJwseuQfyjKPp/h4mQ
X-Gm-Gg: AfdE7cliXCSPa3gsmIe1K9Z6k/JTOTrKAPwk05sDLkayOhyyedXSzfQg7xv4fjC6QK/
	2g/fKXBQoyawO5VmrNq4B1GSjEJCFqgCfRQ8DLc1EQxNVKsavN2EzhS0t5298ipA4MeJzMY3lvn
	6s0uP+1lzEV+sgpCos2KqNSDjvMaX6i4P0qEHNClCFC1LsDZamVxWxaoTtZVUOR7Zf6Y6xeC53w
	I0eH6s603fSOFQ7tndDEJO+hWff6sPLPSobQI4/1PBX1pBbnhiYuF9cVP1ctWviQ1GCiEqwtUBp
	iCJjK6Vgudgmw0p/W9kcEnfseWhe5Nb2bFX3cqjGehppdesQ3PdyK44AGD1TuBQAfuYTic1v/fW
	zuir/x9W1zjK4kUP4IyvBgg==
X-Received: by 2002:a05:622a:55:b0:51c:17cd:1fe8 with SMTP id
 d75a77b69052e-51cbf0e6241mr163158791cf.33.1784129447058; Wed, 15 Jul 2026
 08:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715145328.54597-1-leon.hwang@linux.dev> <20260715145328.54597-2-leon.hwang@linux.dev>
 <CANn89iLyeAPNV2VHTM3w0-zpzjZNFy3aJDsVUERYyniLN4ub7A@mail.gmail.com> <2dc3d52b-ce4a-411d-9c30-934318ee98b0@linux.dev>
In-Reply-To: <2dc3d52b-ce4a-411d-9c30-934318ee98b0@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 15 Jul 2026 17:30:35 +0200
X-Gm-Features: AUfX_mzy7J4tzxjjlmG1HjDmg9aSDxMDxT9_M1uN2gCzgz8_R9SHMTPEMeYAqpY
Message-ID: <CANn89iLV9pyCKU4vyNMzW5FFv4=Xcq_pgvZaFhzJHAAbCK0h7w@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v2 1/2] tcp: Add net.ipv4.tcp_purge_receive_queue
 sysctl
To: Leon Hwang <leon.hwang@linux.dev>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ij@kernel.org>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Yung Chih Su <yuuchihsu@gmail.com>, 
	Wyatt Feng <bronzed_45_vested@icloud.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Lance Yang <lance.yang@linux.dev>, Jiayuan Chen <jiayuan.chen@linux.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:26=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> On 2026/7/15 23:15, Eric Dumazet wrote:
> > On Wed, Jul 15, 2026 at 4:54=E2=80=AFPM Leon Hwang <leon.hwang@linux.de=
v> wrote:
>
> [...]
>
> >> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> >> index 61045a8886e4..4f1027173e95 100644
> >> --- a/net/ipv4/tcp_input.c
> >> +++ b/net/ipv4/tcp_input.c
> >> @@ -4853,6 +4853,7 @@ void tcp_done_with_error(struct sock *sk, int er=
r)
> >>  /* When we get a reset we do this. */
> >>  void tcp_reset(struct sock *sk, struct sk_buff *skb)
> >>  {
> >> +       const struct net *net =3D sock_net(sk);
> >>         int err;
> >>
> >>         trace_tcp_receive_reset(sk);
> >> @@ -4869,6 +4870,27 @@ void tcp_reset(struct sock *sk, struct sk_buff =
*skb)
> >>                 err =3D ECONNREFUSED;
> >>                 break;
> >>         case TCP_CLOSE_WAIT:
> >> +               /* RFC9293 3.10.7.4. Other States
> >> +                *   Second, check the RST bit:
> >> +                *     CLOSE-WAIT STATE
> >> +                *
> >> +                * If the RST bit is set, then any outstanding RECEIVE=
s and
> >> +                * SEND should receive "reset" responses.  All segment=
 queues
> >> +                * should be flushed.  Users should also receive an un=
solicited
> >> +                * general "connection reset" signal.  Enter the CLOSE=
D state,
> >> +                * delete the TCB, and return.
> >> +                *
> >> +                * If net.ipv4.tcp_purge_receive_queue is enabled,
> >> +                * sk_receive_queue will be flushed too.
> >> +                */
> >> +               if (unlikely(READ_ONCE(net->ipv4.sysctl_tcp_purge_rece=
ive_queue))) {
> >> +                       struct tcp_sock *tp =3D tcp_sk(sk);
> >> +
> >> +                       skb_queue_purge(&sk->sk_receive_queue);
> >> +                       WRITE_ONCE(tp->copied_seq, tp->rcv_nxt);
> >> +                       WRITE_ONCE(tp->urg_data, 0);
> >> +                       sk_set_peek_off(sk, -1);
> >> +               }
> >>                 err =3D EPIPE;
> >>                 break;
> >>         case TCP_CLOSE:
> >> --
> >> 2.55.0
> >>
> >
> > My thoughts are:
> >
> > out_of_order_queue has been forgotten. skbs could be there and still
> > 'block devmem'
> >
> > WRITE_ONCE(tp->copied_seq, tp->rcv_nxt) is certainly wrong, because
> > read() will return 0, instead of -1 (errno =3D EPIPE or ECONNRESET)
> > So the application will not know a RST was received :/
> >
> > I think that BSD and linux implementations have historically retained
> > acknowledged,
> > buffered receive data upon RST to allow applications to drain data
> > already ACKed prior to the reset.
> >
> > Adding a narrow sysctl specifically for CLOSE_WAIT creates
> > inconsistent behavior across TCP states.
>
>
> Got it. I won't pursue this sysctl approach in the future. Thanks for
> the review.

My intention was not to kill your proposal, only to start a conversation...

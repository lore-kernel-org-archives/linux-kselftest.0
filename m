Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7424F265CDD
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 21:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779051704; cv=pass; b=fbtprE3Ao4E0L98SH3co/dnfZ2Xi5TuPPyitSqtiV8v7ec8DRdcnwHikQD8sOaHjeLcKfWMtip0lWg6UH2WwI0Gbx8GVmuhYZjHVAajwFzNlXINUwCONzceOTRZhcLe7bkQ9qNefsYcrHkoR+BvbnBoRlIImBJnTP11daoIEZWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779051704; c=relaxed/simple;
	bh=XcwF+voGzyrihir2UXqIAtpfc5HHpxMkkJMOJyMYcN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQvZmP+47URAvhrY/N/wtRfJBtUFtc6xusLOHFvdG12qncyV/bG8N39R+imfSElnjQd2F6yFYzfQWCEFyUpcvaLixH5yTk0A7WWLkAm0z/aFGyzmrW3Q8Fj1kCyxgRLIjKYZYuaLeXI4Dcmp9hz4RK8CtM1tRkpRl81umD8I84c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VJzJnKKS; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VJzJnKKS"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c1a170a50so1773126c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 14:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779051702; cv=none;
        d=google.com; s=arc-20240605;
        b=bPL6TUff+fKcZ6OeAZKUDOIIvdEpokhIXFwMjtqUxGMU1lEaevcZ836OfiRu+wCzqy
         atuw3QZXY1cx934aZ9yKiinWjausqqJKgVQJOeapVUn/WRjUbK+60idWUoyZe/KoEbZn
         /mw+FOV2mlwz4qLtmot7cu9P8+WgzQQEumo6MyjPud7DPpFbuu+gHINVepYPYT3d8Rua
         vVXEjLEU7P3+nDFUYYxKJdI9DpPl43W/kuA6obg8JqWybZzb/biWMhiSbH8v+a9kt33d
         83VjtaYZ+otxGHs63msNC9lE2jYkkHJnYUyfB1OJIaP3My0v0oE3gujPvALi4jsTWq5W
         +iLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l1e7nsqB0SkleMMtfALLI715YnnZXMRJ3Z3H4ARzTzQ=;
        fh=WGFnbmyLeR7QofyXL8LpL2K/U/gcozPyOmstRfHNnr0=;
        b=cJmklVasNzsselB25jj0x7SANqLy598y2f05G91CtNygoGKgoa+EnMVQWBDebaEysW
         sTwXIyJhtHVMD2ZIBcZ2Wjp4XF1qf2izC99dDPtmeL/k4oDQY2qnv6NqCDOzXlSk8HKH
         qNRNlZ0k4FVE0NdMo9eyIrXsvNHAgN/tKRSC6MnHyhNZI++23ZrsUiMWybG4mU8V3l2Q
         J659zfIXxqLedTgI2PUi9eSfLnUC5Lom31jnaGWKL+3Ii2YkU4ODkwbVEbKoLIcT83Tq
         yoQW8zCCSVyVtIYQXCgqVvJOikHvC+QXeqF1iN/8NLzsZBreBlnmrbAS8UzUF/dFfBzL
         OsPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779051702; x=1779656502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1e7nsqB0SkleMMtfALLI715YnnZXMRJ3Z3H4ARzTzQ=;
        b=VJzJnKKSmhu/ypVImCnpd7zj/yPyHn9vuTuMuORX0pXFhHMaSYEBJnqFMzUlu8kCxj
         rQUzWNTZFBg04jeYObKtB8FFeeJJaQxWXSMCLBqx/u5/sDuRecW8cVwbpTC7POqrYs9S
         zDBNPxvcX5lVVsHZEFxzL0YOyyUdFVX4kKd3drOpuVnrxOfjpc+mLNbnO9kZJCezfOQS
         Tb6ORzgqWtxfVzGwJ8IiXCF5BM/L63TY4Vn1d6QlQpoQ4O26d7+E2Y959N1bsv31EOGe
         hxl+VKh5fmyMt1UW9fgPOzKtq8qYh/PfmCG7XbFWzvQsbQd0Fn1MLOfoZUsSZz1OI5lb
         Hdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779051702; x=1779656502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l1e7nsqB0SkleMMtfALLI715YnnZXMRJ3Z3H4ARzTzQ=;
        b=GZnOyLRyyo7tZqrjAoUC2whjeBdX4Onioo5r6x+utVwAD+zUvd7aYQ4z0wei3Q+JTI
         O+MSwkHEx+EeSVy4gRCjCpPaVnPTYv1z89Qqxh/79eC2WotikjwPOrcYREgrSJ77ZPWb
         xIpUzM2bztsp/cA0Sc7QJbc36XmDuV2pNeFKqNZrimVsLI8St8g9X16EMkH4s6ihj4Sn
         iLXESXqOVWi5ZrxuZ7p4PwcCpRui3JZWrCpdiV8/He5jSJg91oZ7fBYkMQZOlHkuI0cb
         8qLsur3nCepB96DaHKnVCkrtkhOB8/dpDYv3QWvg9ZHOeypPO7VZmSvu4lkNh+xBDEnc
         GhqA==
X-Forwarded-Encrypted: i=1; AFNElJ+jtqsRpwvqcRh5fjuKrcfTZMkT28AU+GIxVpmzVpDyyw61vJ8quw40K4A+nGWYS5c/x9hI5NV4O68pwoQTuQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlCO3mJOWZIvqBVVj9hFom2e2fzHfGs2IQKyhUQ41RLCfsrx7S
	odixv4XwP7IQiJpwFCYnLA0OadMyDXM3/uDOKzgBAA8gGsJrW97wZO9nGTt0lbBW4y9kyBktYPi
	relwkv/WcPVrplb0B6HW5Gdt9eKe4gxSxLiEC2Kx/
X-Gm-Gg: Acq92OHUagfW2FVL/2ygOC8/amRVoAkWSdjPyTqTzsAp3lMYKY/MxPXuBYCYriWtBtO
	aRcsZicUvqjBcJvO5AHof8TTOMgr85Ir9pAttbZkcf4D3n/MxoxIPOYppU4H4Xqb5KPFPeCcyxE
	BjJzuz7sWLkEZefsIbsfPJxyxL0cVbyeIu3cga4u9CfPbVn6VRiDMrWZ+foCxKJMkc4kF4szX/g
	wcJc2mnzKun3CISJ5tmj0qE9OupG/HZJuvTHp2Ninqh9O8x3ZKD66JHLizfNPGQkkW/aX+TyNa0
	9Vli/s1E3qDkLzGzH5QZsrtOA7xwFX/Mooc9ajSCuJxXnegeQ6EDNzsPLee5O9euFz7Ccw9E6Cq
	jzWIV5d4ZS+M3TuAYOBSLddlSZLhyC74=
X-Received: by 2002:a05:7022:62aa:b0:12d:ca32:59f with SMTP id
 a92af1059eb24-1350441967emr5074414c88.11.1779051700738; Sun, 17 May 2026
 14:01:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517184158.2757505-1-sbrivio@redhat.com> <20260517184158.2757505-2-sbrivio@redhat.com>
 <CAAVpQUCiHA=z62udnWLVyv0LeGsAHr+A=_o-8fomHZfJZJO2aQ@mail.gmail.com> <20260517215307.13cda56a@elisabeth>
In-Reply-To: <20260517215307.13cda56a@elisabeth>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sun, 17 May 2026 14:01:29 -0700
X-Gm-Features: AVHnY4IPALeNMOec3ibBVeNtMM0x9yg72S-FBK_8amrAxaDvHFzHy5p-jJRusjg
Message-ID: <CAAVpQUDc5FL2Ab-J3GHCU-LxPAwsZVfo=BG3chun6zRxOPVQtA@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: Don't accept data when socket is in repair mode
To: Stefano Brivio <sbrivio@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Pavel Emelyanov <xemul@scylladb.com>, Laurent Vivier <lvivier@redhat.com>, Jon Maloy <jmaloy@redhat.com>, 
	Dmitry Safonov <dima@arista.com>, Andrei Vagin <avagin@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Neal Cardwell <ncardwell@google.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 12:53=E2=80=AFPM Stefano Brivio <sbrivio@redhat.com=
> wrote:
>
> On Sun, 17 May 2026 12:05:45 -0700
> Kuniyuki Iwashima <kuniyu@google.com> wrote:
>
> > On Sun, May 17, 2026 at 11:41=E2=80=AFAM Stefano Brivio <sbrivio@redhat=
.com> wrote:
> > >
> > > Once a socket enters repair mode (TCP_REPAIR socket option with
> > > TCP_REPAIR_ON value), it's possible to dump the receive sequence
> > > number (TCP_QUEUE_SEQ) and the contents of the receive queue itself
> > > (using TCP_REPAIR_QUEUE to select it).
> > >
> > > If we receive data after the application fetched the sequence number
> > > or saved the contents of the queue, though, the application will now
> > > have outdated information, which defeats the whole functionality,
> > > because this leads to gaps in sequence and data once they're restored
> > > by the target instance of the application, resulting in a hanging or
> > > otherwise non-functional TCP connection.
> > >
> > > This type of race condition was discovered in the KubeVirt integratio=
n
> > > of passt(1), using a remote iperf3 client connected to an iperf3
> > > server running in the guest which is being migrated. The setup allows
> > > traffic to reach the origin node hosting the guest during the
> > > migration.
> > >
> > > If passt dumps sequence number and contents of the queue *before*
> > > further data is received and acknowledged to the peer by the kernel,
> > > once the TCP data connection is migrated to the target node, the
> > > remote client becomes unable to continue sending, because a portion
> > > of the data it sent *and received an acknowledgement for* is now lost=
.
> > >
> > > Schematically:
> > >
> > > 1. client --seq 1:100--> origin host --> passt --> guest --> server
> > >
> > > 2. client <--ACK: 100-- origin host
> > >
> > > 3. migration starts,
> >
> > Here, a netfilter rule or bpf prog must be installed to
> > drop packets temporarily until migration completes.
>
> Thanks for the review.
>
> I have to say it's rather unexpected to have to work around obvious
> kernel issues in userspace: TCP_REPAIR implies that queues are frozen,
> and this is handled correctly on the sending side (see
> tcp_write_xmit()), but was clearly forgotten on the receiving side.
>
> TCP_REPAIR also allows to dump queues, not just sequence numbers, so
> this really is a bad race condition making the whole functionality
> unreliable.
>
> But anyway, even looking for a practical workaround of the kind you
> suggested, I see two issues with it:
>
> 1. we would still have a race condition, because userspace doesn't have
>    a way to synchronise application of nftables rules (or even a BPF
>    program) with the effects of TCP_REPAIR.

Note that setsockopt(TCP_REPAIR) is under lock_sock(), so the
backlog is always cleared before returning to userspace, and the
following getsockopt() will have stable view.


> We could apply nftables
>    rules "a while before" just to be sure, but this is severely going to
>    impact migration downtime

So it's "just before", not "a while before".


>
> 2. passt(1) runs unprivileged and uses a very simple helper to set
>    TCP_REPAIR on the socket.

I guess it uses userns ?

setsockopt(TCP_REPAIR) requires CAP_NET_ADMIN in the
userns tied to the socket's netns (in tcp_can_repair_sock()),
so you should be able to use netfilter anyway.


> Expanding helpers of this kind to directly
>    manipulate nftables rules, or installing BPF programs, looks like a
>    substantial security drawback
>
> > We do not want unlikely tests in the fast path.
>
> I understand, but note that this doesn't really add a branch to the
> fast path: there's already a list of (more expensive) conditions under
> which we need to fall back to slow path, with 'tp' definitely
> prefetched at that point, so I don't expect any fast path cost from
> doing this. Everything else is handled in the slow path.
>
> To be sure, I also checked throughput with delivery to local sockets as
> that's the only case affected (veth setup similar to the one from the
> selftests from patch 2/2) and there's no visible difference.
>
> > You can find a similar issue:
> > https://lore.kernel.org/netdev/20260130145122.368748-1-me@linux.beauty/
>
> That one is not a kernel issue: in that case, the socket is closed, so
> it's actually expected that the kernel will reset the connection. As
> Jakub pointed out, that patch introduces a race condition on its own,
> and it's a hack rather than a fix.
>
> We happened to have that kind of issue in passt as well (the
> implementation is inspired by CRIU), but that's something entirely
> different which userspace clearly needs to take care of, so we fixed it
> here:
>
>   https://passt.top/passt/commit/?id=3Da8782865c342eb2682cca292d5bf92b567=
344351
>
> > > passt enables repair mode, dumps the sequence
> > >    number (101) and sends it to the target node of the guest migratio=
n
> > >
> > > 4. client --seq 101:201--> origin host (passt not receiving anymore)
> > >
> > > 5. client <--ACK: 201-- origin host
> > >
> > > 6. migration completes, and passt restores sequence number 101 on the
> > >    migrated socket
> > >
> > > 7. client --seq 201:301--> target host (now seeing a sequence jump)
> > >
> > > 8. client <--ACK: 100-- target host
> > >
> > > ...and the connection can't recover anymore, because the client can't
> > > resend data that was already (erroneously) acknowledged. We need to
> > > avoid step 5. above.
> > >
> > > This would equally affect CRIU (the other known user of TCP_REPAIR),
> > > should data be received while the original container is frozen: the
> > > sequence dumped and the contents of the saved incoming queue would
> > > then depend on the timing.
> > >
> > > The race condition is also illustrated in the kselftests introduced
> > > by the next patch.
> > >
> > > To prevent this issue, discard data received for a socket in repair
> > > mode, with a new reason, SKB_DROP_REASON_SOCKET_REPAIR.
> > >
> > > Fixes: ee9952831cfd ("tcp: Initial repair mode")
> > > Tested-by: Laurent Vivier <lvivier@redhat.com>
> > > Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
> > > ---
> > >  include/net/dropreason-core.h |  3 +++
> > >  net/ipv4/tcp_input.c          | 14 +++++++++++++-
> > >  2 files changed, 16 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/net/dropreason-core.h b/include/net/dropreason-c=
ore.h
> > > index 2f312d1f67d6..19ab9e6ffc33 100644
> > > --- a/include/net/dropreason-core.h
> > > +++ b/include/net/dropreason-core.h
> > > @@ -9,6 +9,7 @@
> > >         FN(SOCKET_CLOSE)                \
> > >         FN(SOCKET_FILTER)               \
> > >         FN(SOCKET_RCVBUFF)              \
> > > +       FN(SOCKET_REPAIR)               \
> > >         FN(UNIX_DISCONNECT)             \
> > >         FN(UNIX_SKIP_OOB)               \
> > >         FN(PKT_TOO_SMALL)               \
> > > @@ -158,6 +159,8 @@ enum skb_drop_reason {
> > >         SKB_DROP_REASON_SOCKET_FILTER,
> > >         /** @SKB_DROP_REASON_SOCKET_RCVBUFF: socket receive buff is f=
ull */
> > >         SKB_DROP_REASON_SOCKET_RCVBUFF,
> > > +       /** @SKB_DROP_REASON_SOCKET_REPAIR: socket is in repair mode =
*/
> > > +       SKB_DROP_REASON_SOCKET_REPAIR,
> > >         /**
> > >          * @SKB_DROP_REASON_UNIX_DISCONNECT: recv queue is purged whe=
n SOCK_DGRAM
> > >          * or SOCK_SEQPACKET socket re-connect()s to another socket o=
r notices
> > > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > > index d5c9e65d9760..6eca34274f97 100644
> > > --- a/net/ipv4/tcp_input.c
> > > +++ b/net/ipv4/tcp_input.c
> > > @@ -6457,6 +6457,7 @@ static bool tcp_validate_incoming(struct sock *=
sk, struct sk_buff *skb,
> > >   *       or pure receivers (this means either the sequence number or=
 the ack
> > >   *       value must stay constant)
> > >   *     - Unexpected TCP option.
> > > + *     - Socket is in repair mode.
> > >   *
> > >   *     When these conditions are not satisfied it drops into a stand=
ard
> > >   *     receive procedure patterned after RFC793 to handle all cases.
> > > @@ -6506,7 +6507,8 @@ void tcp_rcv_established(struct sock *sk, struc=
t sk_buff *skb)
> > >
> > >         if ((tcp_flag_word(th) & TCP_HP_BITS) =3D=3D tp->pred_flags &=
&
> > >             TCP_SKB_CB(skb)->seq =3D=3D tp->rcv_nxt &&
> > > -           !after(TCP_SKB_CB(skb)->ack_seq, tp->snd_nxt)) {
> > > +           !after(TCP_SKB_CB(skb)->ack_seq, tp->snd_nxt) &&
> > > +           !tp->repair) {
> > >                 int tcp_header_len =3D tp->tcp_header_len;
> > >                 s32 delta =3D 0;
> > >                 int flag =3D 0;
> > > @@ -6632,6 +6634,11 @@ void tcp_rcv_established(struct sock *sk, stru=
ct sk_buff *skb)
> > >                 goto discard;
> > >         }
> > >
> > > +       if (tp->repair) {
> > > +               reason =3D SKB_DROP_REASON_SOCKET_REPAIR;
> > > +               goto discard;
> > > +       }
> > > +
> > >         /*
> > >          *      Standard slow path.
> > >          */
> > > @@ -7125,6 +7132,11 @@ tcp_rcv_state_process(struct sock *sk, struct =
sk_buff *skb)
> > >         int queued =3D 0;
> > >         SKB_DR(reason);
> > >
> > > +       if (tp->repair) {
> > > +               SKB_DR_SET(reason, SOCKET_REPAIR);
> > > +               goto discard;
> > > +       }
> > > +
> > >         switch (sk->sk_state) {
> > >         case TCP_CLOSE:
> > >                 SKB_DR_SET(reason, TCP_CLOSE);
> > > --
> > > 2.43.0
>
> --
> Stefano
>

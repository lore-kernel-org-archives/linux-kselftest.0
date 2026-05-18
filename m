Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781053DEAD2
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 11:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104103; cv=none; b=ELxBdTb9Zf946kP0aaipnl6r3UXIWZ0zc9TBO1Pi7JjYU13xr0FuE03Lz3hZMvB/LfbnJM81d+kZ8KrLmLiO5epjD+VNv8CaEjAOMUAzoRZX2gJNORjr+xXZHALnUD/XW/TsSrt8h6fXEiFFx9prUPiVXFeU1FuTYw/OAoabgIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104103; c=relaxed/simple;
	bh=uRqgpJQDvSNjyFzu8WpFAXTfCd5Yymnm3C1VNqMUoAc=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Date; b=Tix0PAru5vvaLHdyblTkqraccjNlhmv15V4D1jPXMp+P2lALD0k14kV1/QsdRROJuIbf7Bl0B5/qXlhfrS2gyXgI643qEsuZSaFEbm8Nt2wkQjRHqcZGg2IdpiFm3qqEh4tHIycn4+3f55UPUmQgaI+ftYjI2XjN10R9vt+2cDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IbTBlQuZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kWRvgJj8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IbTBlQuZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kWRvgJj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779104093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7BFsKyRIl+lKDTkw/Af1w2S9ANPorpkXTXQJBZlVUjQ=;
	b=IbTBlQuZDbg2AJM2kBmTB/r3cLURn4YSEO2hSdWN14ru+GYllbItLqYxHHuXBCCQCGQJS8
	s+ek/TRgfeJauetukWAVh/NRKTgmNkdxeMk2mR2odZF0nBV9uCn84a/U7cjdqZiuksUIyD
	Kbmh+kqZeRrG5WMJA/WhwMJvjg83trs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-rtt37U8NN9qSKi0k3p0HRw-1; Mon, 18 May 2026 07:34:50 -0400
X-MC-Unique: rtt37U8NN9qSKi0k3p0HRw-1
X-Mimecast-MFC-AGG-ID: rtt37U8NN9qSKi0k3p0HRw_1779104089
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-449dcfe8005so1815786f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 04:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779104089; x=1779708889; darn=vger.kernel.org;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BFsKyRIl+lKDTkw/Af1w2S9ANPorpkXTXQJBZlVUjQ=;
        b=kWRvgJj8t3D4ViQ3mCprqAjgRHmX66wsfMqDYIM8Qg29UJdAFd8Oir8BPgpER0q6Y1
         X9FjAA8dzKB0Sh+K7uPBvCobKhbP17K17PjVwcHq8R7BDfDWtUpFH5otV2WdUh3Au1B/
         OjATzLkRSXjpachBfnmIARsOrYM0lTjcCnMQeX1/pvX5wxmJowxokx3Cilz2dMRdjvnl
         QktOqAmuFTOxgxFVPCc7ptXNYUE0cwwsskjnhSlEcBfy61bMkYoLn6ULYlIZCNAtXgHi
         LX3a9o3auWGxeE3jaRw9g/GRsiiT9ohOIEJsCHS//KOxupMy14m3ErkVWJJ3AjU7jJ8n
         dmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104089; x=1779708889;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7BFsKyRIl+lKDTkw/Af1w2S9ANPorpkXTXQJBZlVUjQ=;
        b=o06AQodeyONN1SC6aKzS2Dco4MVOju+oNLd3G65qPigaJTtOK/IVqPydGijxpq+7N/
         SLFiK0pc2b2IpRrD6cS3yZswopOKylXGsABq9m2pn1oJLhSeN6gM2WE6ADuN5q6SjWCW
         xlYm8cH7gOPgr8OnzUH4mwnE9PJ5vL9L5Rw9eqdKkYICiyn7mUzTJ3d3PolHC9Tilbbb
         /XN7pwKtTr9zV6Kg830AeJO/zEgSeIJta0KqohzqQORLBAL8phYVb9UX+4nqG8Nx2XWS
         wyOjxqsM+1sZKBck7HR+NndppqPl6ps9oVbmEuWs0s8xU9uxIqtUm9xZi7q32+0haFA0
         yMtg==
X-Forwarded-Encrypted: i=1; AFNElJ9N6wiAkzft4z3Fn4mh2yuAv5HVcD4hYGiyrXApCXqCwGXJVHYelzn9V5RNwX+kh6Gh+/uJEPrwrAbQu+bUr/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhjNP1aM2jS/Bck+mB5PFmeTYujrlxHGzH2+X2uoVo68yZyEwa
	as19569Pdp6Pbt2cyedEswWntln8ixqaricgLw/YoUuXrsa3yldDbViF9DSDNBRC8fnGf4Fff9C
	JGSPPUCSiOA+zCEAYKEW8SpYfiFKfb75ABIOvppp/dmz6WZTuYI2O2tuDX6ALFWGPXvmnpg==
X-Gm-Gg: Acq92OF8U1MrjeSdo1Pg+s2VGAsqbNn0WR8Iq3h6FlX81wq8cLQZjA3aeUlOb5WZLs/
	+AadTz3E+75O5ImL75cW/JP7rshMH5hY9KZBPFKtPVy0S/AN6nP3drE2mJq12BTfbubWu3670Dv
	LiwA8Q/Px/1GzLEnH28JdRt8reo9Cr+RdCPuh8p04fWqsK1X9GYx0TKTo55pEkiYGtTK5t9NeUA
	MxWHSn8OWQBNv/3Ct16UicAqGCBs3Vn17Av6VCrn/wnMoQTcIF9PhPoMBfWN4FvQrjzrM1WWjAm
	oX+GsdHrMFiDFnB8gUwaUM9PNqUnv1RgkJ8U6w6SaxIvWrbl14s7xOMy8yQmAZBdxEgrDa205vo
	pWnDBeaoHF+1obJHxpwwtExpQNKZTMaV+WWiFV1JocpRUdMneog==
X-Received: by 2002:a05:600c:821b:b0:488:b811:51c4 with SMTP id 5b1f17b1804b1-48fe6515831mr212438605e9.25.1779103730904;
        Mon, 18 May 2026 04:28:50 -0700 (PDT)
X-Received: by 2002:a05:600c:821b:b0:488:b811:51c4 with SMTP id 5b1f17b1804b1-48fe6515831mr212437835e9.25.1779103730317;
        Mon, 18 May 2026 04:28:50 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [176.103.220.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb029180sm118110505e9.4.2026.05.18.04.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:28:49 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima
 <kuniyu@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Pavel Emelyanov
 <xemul@scylladb.com>, Laurent Vivier <lvivier@redhat.com>, Jon Maloy
 <jmaloy@redhat.com>, Dmitry Safonov <dima@arista.com>, Andrei Vagin
 <avagin@google.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Neal
 Cardwell <ncardwell@google.com>, Simon Horman <horms@kernel.org>, Shuah
 Khan <shuah@kernel.org>, David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH net 1/2] tcp: Don't accept data when socket is in repair
 mode
Message-ID: <20260518132831.5b9eb0a8@elisabeth>
In-Reply-To: <CANn89iKLfBmh3_t4xJz3dDJ8VkMsEtHRifg0mRV1PPAryNY1-g@mail.gmail.com>
References: <20260517184158.2757505-1-sbrivio@redhat.com>
	<20260517184158.2757505-2-sbrivio@redhat.com>
	<CAAVpQUCiHA=z62udnWLVyv0LeGsAHr+A=_o-8fomHZfJZJO2aQ@mail.gmail.com>
	<20260517215307.13cda56a@elisabeth>
	<CANn89iKLfBmh3_t4xJz3dDJ8VkMsEtHRifg0mRV1PPAryNY1-g@mail.gmail.com>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 13:28:48 +0200 (CEST)

On Mon, 18 May 2026 00:57:16 -0700
Eric Dumazet <edumazet@google.com> wrote:

> On Sun, May 17, 2026 at 12:53=E2=80=AFPM Stefano Brivio <sbrivio@redhat.c=
om> wrote:
> >
> > On Sun, 17 May 2026 12:05:45 -0700
> > Kuniyuki Iwashima <kuniyu@google.com> wrote:
> > =20
> > > On Sun, May 17, 2026 at 11:41=E2=80=AFAM Stefano Brivio <sbrivio@redh=
at.com> wrote: =20
> > > >
> > > > Once a socket enters repair mode (TCP_REPAIR socket option with
> > > > TCP_REPAIR_ON value), it's possible to dump the receive sequence
> > > > number (TCP_QUEUE_SEQ) and the contents of the receive queue itself
> > > > (using TCP_REPAIR_QUEUE to select it).
> > > >
> > > > If we receive data after the application fetched the sequence number
> > > > or saved the contents of the queue, though, the application will now
> > > > have outdated information, which defeats the whole functionality,
> > > > because this leads to gaps in sequence and data once they're restor=
ed
> > > > by the target instance of the application, resulting in a hanging or
> > > > otherwise non-functional TCP connection.
> > > >
> > > > This type of race condition was discovered in the KubeVirt integrat=
ion
> > > > of passt(1), using a remote iperf3 client connected to an iperf3
> > > > server running in the guest which is being migrated. The setup allo=
ws
> > > > traffic to reach the origin node hosting the guest during the
> > > > migration.
> > > >
> > > > If passt dumps sequence number and contents of the queue *before*
> > > > further data is received and acknowledged to the peer by the kernel,
> > > > once the TCP data connection is migrated to the target node, the
> > > > remote client becomes unable to continue sending, because a portion
> > > > of the data it sent *and received an acknowledgement for* is now lo=
st.
> > > >
> > > > Schematically:
> > > >
> > > > 1. client --seq 1:100--> origin host --> passt --> guest --> server
> > > >
> > > > 2. client <--ACK: 100-- origin host
> > > >
> > > > 3. migration starts, =20
> > >
> > > Here, a netfilter rule or bpf prog must be installed to
> > > drop packets temporarily until migration completes. =20
> >
> > Thanks for the review.
> >
> > I have to say it's rather unexpected to have to work around obvious
> > kernel issues in userspace: TCP_REPAIR implies that queues are frozen,
> > and this is handled correctly on the sending side (see
> > tcp_write_xmit()), but was clearly forgotten on the receiving side. =20
>=20
> Have you contacted TCP repair authors for best practices?

I Cc'ed them here, Pavel is the author (but as far as I understand not
active in kernel development anymore), and I know that Andrei did some
substantial work on it in the past, so he's Cc'ed here as well.

But we are following what CRIU (the userspace reference implementation)
does, and CRIU would be affected by this issue as well (depending on
usage).

> Please do not add code to TCP fast path.

My understanding was that we should avoid adding *computational
overhead* to it, which this patch doesn't _seem_ to add. The actual
overhead it adds is in the slow path.

But, regardless of that, I hope I found a solution that would address
your potential concern as well.

There seems to be a common way to disable fast path for a given socket
(and to re-enable it later), courtesy of those tp->pred_flags that are
checked in the existing condition in tcp_rcv_established().

The idea looking at other functions seems to be:

- set pred_flags to 0 to disable the fast path (which I would do once
  TCP_REPAIR_ON is set)

- call __tcp_fast_path_on(), which recalculates it, to re-enable fast
  path (which I would do for TCP_REPAIR_OFF / TCP_REPAIR_OFF_NO_WP)

That's what other implementations dealing with rare / corner cases, such
as tcp_data_queue_ofo(), or tcp_check_urg(), seem to be handling
this. It looks rather idiomatic. I wasn't aware of that.

I plan to post a v2 doing this instead, in a bit.

> Instead make sure TCP repair inserts in ehash table sockets ready to be u=
sed.

I guess you're referring to the other issue / hack Kuniyuki linked,
where the kernel is sending RST segments for sockets that have been
closed and (not yet) reopened?

For the specific race condition I'm dealing with here I don't think
that would help. Here it's about incoming data being queued when it
shouldn't. The sockets are already in the ehash table ready to be used
(...that's actually the problem, in some sense).

> Yes, it is more complex, but I am sure it can be done properly.
>=20
> > TCP_REPAIR also allows to dump queues, not just sequence numbers, so
> > this really is a bad race condition making the whole functionality
> > unreliable.
> >
> > But anyway, even looking for a practical workaround of the kind you
> > suggested, I see two issues with it:
> >
> > 1. we would still have a race condition, because userspace doesn't have
> >    a way to synchronise application of nftables rules (or even a BPF
> >    program) with the effects of TCP_REPAIR. We could apply nftables
> >    rules "a while before" just to be sure, but this is severely going to
> >    impact migration downtime
> >
> > 2. passt(1) runs unprivileged and uses a very simple helper to set
> >    TCP_REPAIR on the socket. Expanding helpers of this kind to directly
> >    manipulate nftables rules, or installing BPF programs, looks like a
> >    substantial security drawback
> > =20
> > > We do not want unlikely tests in the fast path. =20
> >
> > I understand, but note that this doesn't really add a branch to the
> > fast path: there's already a list of (more expensive) conditions under
> > which we need to fall back to slow path, with 'tp' definitely
> > prefetched at that point, so I don't expect any fast path cost from
> > doing this. Everything else is handled in the slow path.
> >
> > To be sure, I also checked throughput with delivery to local sockets as
> > that's the only case affected (veth setup similar to the one from the
> > selftests from patch 2/2) and there's no visible difference.
> > =20
> > > You can find a similar issue:
> > > https://lore.kernel.org/netdev/20260130145122.368748-1-me@linux.beaut=
y/ =20
> >
> > That one is not a kernel issue: in that case, the socket is closed, so
> > it's actually expected that the kernel will reset the connection. As
> > Jakub pointed out, that patch introduces a race condition on its own,
> > and it's a hack rather than a fix.
> >
> > We happened to have that kind of issue in passt as well (the
> > implementation is inspired by CRIU), but that's something entirely
> > different which userspace clearly needs to take care of, so we fixed it
> > here:
> >
> >   https://passt.top/passt/commit/?id=3Da8782865c342eb2682cca292d5bf92b5=
67344351
> > =20
> > > > passt enables repair mode, dumps the sequence
> > > >    number (101) and sends it to the target node of the guest migrat=
ion
> > > >
> > > > 4. client --seq 101:201--> origin host (passt not receiving anymore)
> > > >
> > > > 5. client <--ACK: 201-- origin host
> > > >
> > > > 6. migration completes, and passt restores sequence number 101 on t=
he
> > > >    migrated socket
> > > >
> > > > 7. client --seq 201:301--> target host (now seeing a sequence jump)
> > > >
> > > > 8. client <--ACK: 100-- target host
> > > >
> > > > ...and the connection can't recover anymore, because the client can=
't
> > > > resend data that was already (erroneously) acknowledged. We need to
> > > > avoid step 5. above.
> > > >
> > > > This would equally affect CRIU (the other known user of TCP_REPAIR),
> > > > should data be received while the original container is frozen: the
> > > > sequence dumped and the contents of the saved incoming queue would
> > > > then depend on the timing.
> > > >
> > > > The race condition is also illustrated in the kselftests introduced
> > > > by the next patch.
> > > >
> > > > To prevent this issue, discard data received for a socket in repair
> > > > mode, with a new reason, SKB_DROP_REASON_SOCKET_REPAIR.
> > > >
> > > > Fixes: ee9952831cfd ("tcp: Initial repair mode")
> > > > Tested-by: Laurent Vivier <lvivier@redhat.com>
> > > > Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
> > > > ---
> > > >  include/net/dropreason-core.h |  3 +++
> > > >  net/ipv4/tcp_input.c          | 14 +++++++++++++-
> > > >  2 files changed, 16 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/net/dropreason-core.h b/include/net/dropreason=
-core.h
> > > > index 2f312d1f67d6..19ab9e6ffc33 100644
> > > > --- a/include/net/dropreason-core.h
> > > > +++ b/include/net/dropreason-core.h
> > > > @@ -9,6 +9,7 @@
> > > >         FN(SOCKET_CLOSE)                \
> > > >         FN(SOCKET_FILTER)               \
> > > >         FN(SOCKET_RCVBUFF)              \
> > > > +       FN(SOCKET_REPAIR)               \
> > > >         FN(UNIX_DISCONNECT)             \
> > > >         FN(UNIX_SKIP_OOB)               \
> > > >         FN(PKT_TOO_SMALL)               \
> > > > @@ -158,6 +159,8 @@ enum skb_drop_reason {
> > > >         SKB_DROP_REASON_SOCKET_FILTER,
> > > >         /** @SKB_DROP_REASON_SOCKET_RCVBUFF: socket receive buff is=
 full */
> > > >         SKB_DROP_REASON_SOCKET_RCVBUFF,
> > > > +       /** @SKB_DROP_REASON_SOCKET_REPAIR: socket is in repair mod=
e */
> > > > +       SKB_DROP_REASON_SOCKET_REPAIR,
> > > >         /**
> > > >          * @SKB_DROP_REASON_UNIX_DISCONNECT: recv queue is purged w=
hen SOCK_DGRAM
> > > >          * or SOCK_SEQPACKET socket re-connect()s to another socket=
 or notices
> > > > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > > > index d5c9e65d9760..6eca34274f97 100644
> > > > --- a/net/ipv4/tcp_input.c
> > > > +++ b/net/ipv4/tcp_input.c
> > > > @@ -6457,6 +6457,7 @@ static bool tcp_validate_incoming(struct sock=
 *sk, struct sk_buff *skb,
> > > >   *       or pure receivers (this means either the sequence number =
or the ack
> > > >   *       value must stay constant)
> > > >   *     - Unexpected TCP option.
> > > > + *     - Socket is in repair mode.
> > > >   *
> > > >   *     When these conditions are not satisfied it drops into a sta=
ndard
> > > >   *     receive procedure patterned after RFC793 to handle all case=
s.
> > > > @@ -6506,7 +6507,8 @@ void tcp_rcv_established(struct sock *sk, str=
uct sk_buff *skb)
> > > >
> > > >         if ((tcp_flag_word(th) & TCP_HP_BITS) =3D=3D tp->pred_flags=
 &&
> > > >             TCP_SKB_CB(skb)->seq =3D=3D tp->rcv_nxt &&
> > > > -           !after(TCP_SKB_CB(skb)->ack_seq, tp->snd_nxt)) {
> > > > +           !after(TCP_SKB_CB(skb)->ack_seq, tp->snd_nxt) &&
> > > > +           !tp->repair) {
> > > >                 int tcp_header_len =3D tp->tcp_header_len;
> > > >                 s32 delta =3D 0;
> > > >                 int flag =3D 0;
> > > > @@ -6632,6 +6634,11 @@ void tcp_rcv_established(struct sock *sk, st=
ruct sk_buff *skb)
> > > >                 goto discard;
> > > >         }
> > > >
> > > > +       if (tp->repair) {
> > > > +               reason =3D SKB_DROP_REASON_SOCKET_REPAIR;
> > > > +               goto discard;
> > > > +       }
> > > > +
> > > >         /*
> > > >          *      Standard slow path.
> > > >          */
> > > > @@ -7125,6 +7132,11 @@ tcp_rcv_state_process(struct sock *sk, struc=
t sk_buff *skb)
> > > >         int queued =3D 0;
> > > >         SKB_DR(reason);
> > > >
> > > > +       if (tp->repair) {
> > > > +               SKB_DR_SET(reason, SOCKET_REPAIR);
> > > > +               goto discard;
> > > > +       }
> > > > +
> > > >         switch (sk->sk_state) {
> > > >         case TCP_CLOSE:
> > > >                 SKB_DR_SET(reason, TCP_CLOSE);
> > > > --
> > > > 2.43.0 =20
> >
> > --
> > Stefano

--=20
Stefano


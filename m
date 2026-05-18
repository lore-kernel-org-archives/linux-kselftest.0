Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B071C861D
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 07:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779091052; cv=pass; b=hU2oQVVltcN6xBrgMdcvE2JeqbjldfWewKCdr2iHTJmjitW67ypdPknWA4n0x+sQ3GPqC4SXI9z1jB/cd/WsSQoLH99N4ZZdMXq8/v4n7mEtr+2Vft4UONiZgA56hdN1mxWfJKDryejZ5jlgTH+2qncpSajVcrCjWCqyhVbjzf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779091052; c=relaxed/simple;
	bh=4xB2B9zc4CCWQlPP/GC5eeqzWlvXjQmImSfaPFUPpOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UnGCgzdfPYKPVsfVpDI3e8cbbQaTHVdjJP1KtAIk2zOtqsz7R5IPpL6NCcYz7Ch9dZsYqiS8mPjnmRpjllTMZ2rPvrStbQzlnlglFGcappATV/TuM01lZIWUFa5cHP3y4ZR2LfaAXUEGCIPmrfbFaQY0bD4mpJvPm5D1aKUQHXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j5p3k6Ju; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j5p3k6Ju"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-512f09ecc67so14874751cf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 00:57:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779091048; cv=none;
        d=google.com; s=arc-20240605;
        b=KS88n+gywbaAJtr+NbbL4f+62WndGw1H/7Hf0T56JOC66t2+fPX75i0xqaRE5d5hum
         AKLgpOli58au3Gujy3tUNHI8A1EaIZTsvCcMMhzc0wS3kXM7FV2Si4s4coWawn1zJ0i+
         LfytlHdZfDnLI1pnKq/OcLwg5bi+VkPEfyOUhCR+YR5Fel42m5YsjjVsn/WgfwWTzi/w
         PjZUa6l9uZg1A2cQT90tpX9N/+HySHlM+zSeKb84xhC+E/1s98F6ph/9/blpPeOzvJwC
         GMOiUrO6fI1fXCZ7UJgTO3Z6p4Re06bx2ZGPGIAMYORpv0f9BgEZE5ae662IePtG5GNy
         UfQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ycc0wSl3+Drf46KKdfSMrZoXhkLDSPLUS21PV8OVhOg=;
        fh=4J6PgucshkGHDa9vuvnR32z1W4icoQ2uZ6JfHLOND3I=;
        b=eqaNPia7BYT8SVha6SkPVWoTRUW8KJDKlKpI/za0oAhHSTrkATBakucqlkGdHfh0cW
         qmdLJrFcA7YCvyXLrEgPLtxFgViR5F8g9WCPxCkaamtrl9O+Bd915jxk9yUXbM+8JXMM
         qe/1gynjis/AgL3BkR12AOwSiuuxII3Oxp7tqxISNeSH2afcV3m1y+rGQLPxY3YPnIoA
         CnRK1+ZmP+86I+gyvw2dGZuHV4EwmySitFrsji4Fq9RFHOt1IIMDheSARacUuVSPXyfl
         FRYuWvOJQANcFbdKi914aHXDei2H7fBV2Rq01Pq50XHDFYHEWqiKsOHEp8E/GIVv4D66
         mozg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779091048; x=1779695848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycc0wSl3+Drf46KKdfSMrZoXhkLDSPLUS21PV8OVhOg=;
        b=j5p3k6JumHiQu/t95kK9PZiP8cX2NdRN8KGyv1TrBj41dqBwUj1lp/LzvYxZpPM89y
         RXGgJ8TDsmU9tr7/GeLbSQRHcAJ3nseZdCQQl4zgwKAYQ2ImqsMBM9BoDfaB0eyQ3dip
         4rWbgCQ8BUxMgkkijWmxk0hqpsFKHq24HeL87m3HFIl2jTb5WU5ytiT0MECiENfJ84GQ
         BTiNBwY3UwGtOb7OILk/BGFLA9Hw6UZ2C61RSX3yEQ4/TosVGU7c4UoB9qs+TZSGLT8v
         LZTVgDkLR+jhkTWVzDHfXrb0XHlMA3+kgZYMfg9FnWHhjokg1ijBiC/OCgl73bCJclQm
         qDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779091048; x=1779695848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ycc0wSl3+Drf46KKdfSMrZoXhkLDSPLUS21PV8OVhOg=;
        b=HoatvPSbcL6BM5nBIspqtAVyHR5dtRO32XANXJeEwJAjPrDSxWMn23xroF+ozLTDmh
         dIfhQ2aY52kdlA4dTx/hsI6jQ9m/qUWP2+nrpl6LQ3I+yibcwCFyyclAMIq7CvJvcZ83
         iO8bYYrtMB/ybc0gzHJaYhQ8Gj88WWGJjzGf8vBDKxSAmc0TkIYKCF3VoOyfnpFyMqNh
         vX2klUNgj+stWtPpgGbd+pUwiMluQtdthrIz02QzC7ZQXa3EaDvyklW/U/aG+mzRjby/
         C9i2LeG3rDh3tDO9UbBevzUJJH15PvQBYgBo1CFpQZd5Qf8tlMrj8fW6Ma0sT9nad0dx
         4OkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7upQEq+7eicH6F5hwaUn6i3aSdFh8J/xW4pzzowmCN/SrQm0wqywevIBey7745oUQwbKIGzAVW4kCuSz1Rrs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4eJwG7M9p1cgYuwda+JlNKAVvZSFC5RI/UhGgcKfJHUEI/R7Q
	p+d8aE9XCCtcOVJDYr1+0uJNGqKveZ+iibmwUHJ8wA7T1Zjs5eaAEOZ7J+mxlae44BqAPrRX3Sm
	8gVBFVyGw8C259lL71OnBdKWtm7txrH+sUKMYi2QI
X-Gm-Gg: Acq92OGgTAvG4wfYDraIMJhMKyB1f/Kt5K4XT/BY9kJSHOnnvPlezXPPZyPBTt48OJN
	bd0eRhx93fZ1sySsd2JTOY89CdoW786c8NTZdU420NHpMiaDgfGa8M/3W7CtJIBiSbLd/0TpgWE
	78b6o9Sah/vh3otJteAJrQU9WwrikZeyiuobFM02QYZyWS2MCwVa5y3fylXsbY7MMbVyMqIxBGg
	iygNtFcKVk5N89MTzXdjXIQD7l4Yk1DMgq4cXVARquApXSzv1lD6UnaDnC6FH1dW5qoNyfTLXny
	pEShUzBw9eJvZf+3V7LZqZ+6tdKhPqRV69gbSrvqVwyCV1i6Sqg+bbSwpYXqJ/i44dhPMHFF0bR
	Nz5mnUYTxegq0xvQ8TATgKEYHdnby
X-Received: by 2002:a05:622a:13d0:b0:50d:69cb:d603 with SMTP id
 d75a77b69052e-5165a21a2dcmr199875891cf.47.1779091047308; Mon, 18 May 2026
 00:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517184158.2757505-1-sbrivio@redhat.com> <20260517184158.2757505-2-sbrivio@redhat.com>
 <CAAVpQUCiHA=z62udnWLVyv0LeGsAHr+A=_o-8fomHZfJZJO2aQ@mail.gmail.com> <20260517215307.13cda56a@elisabeth>
In-Reply-To: <20260517215307.13cda56a@elisabeth>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 18 May 2026 00:57:16 -0700
X-Gm-Features: AVHnY4K6JJt1R3LyuzLt561bBFmlUBBiw-JfMG_b8grEqoNoW-nAMpX95JutlNQ
Message-ID: <CANn89iKLfBmh3_t4xJz3dDJ8VkMsEtHRifg0mRV1PPAryNY1-g@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: Don't accept data when socket is in repair mode
To: Stefano Brivio <sbrivio@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, 
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

Have you contacted TCP repair authors for best practices?

Please do not add code to TCP fast path.

Instead make sure TCP repair inserts in ehash table sockets ready to be use=
d.

Yes, it is more complex, but I am sure it can be done properly.

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
>    program) with the effects of TCP_REPAIR. We could apply nftables
>    rules "a while before" just to be sure, but this is severely going to
>    impact migration downtime
>
> 2. passt(1) runs unprivileged and uses a very simple helper to set
>    TCP_REPAIR on the socket. Expanding helpers of this kind to directly
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

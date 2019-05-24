From: willemdebruijn.kernel@gmail.com (Willem de Bruijn)
Date: Fri, 24 May 2019 00:53:37 -0400
Subject: [PATCH net 1/4] net/udp_gso: Allow TX timestamp with UDP GSO
In-Reply-To: <AE8E0772-7256-4B9C-A990-96930E834AEE@appneta.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-2-fklassen@appneta.com>
 <CAF=yD-Jf95De=z_nx9WFkGDa6+nRUqM_1PqGkjwaFPzOe+PfXg@mail.gmail.com>
 <AE8E0772-7256-4B9C-A990-96930E834AEE@appneta.com>
Message-ID:
 <CAF=yD-LtAKpND601LQrC1+=iF6spSUXVdUapcsbJdv5FYa=5Jg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190524045337.JmUmgduonKoTc_80uq-msarTAbhhp-ARh56McO-xdL4@z>

On Thu, May 23, 2019@9:38 PM Fred Klassen <fklassen@appneta.com> wrote:
>
> > Thanks for the report.
> >
> > Zerocopy notification reference count is managed in skb_segment. That
> > should work.
> >
> > Support for timestamping with the new GSO feature is indeed an
> > oversight. The solution is similar to how TCP associates the timestamp
> > with the right segment in tcp_gso_tstamp.
> >
> > Only, I think we want to transfer the timestamp request to the last
> > datagram, not the first. For send timestamp, the final byte leaving
> > the host is usually more interesting.
>
> TX Timestamping the last packet of a datagram is something that would
> work poorly for our application. We need to measure the time it takes
> for the first bit that is sent until the first bit of the last packet is received.
> Timestaming the last packet of a burst seems somewhat random to me
> and would not be useful. Essentially we would be timestamping a
> random byte in a UDP GSO buffer.
>
> I believe there is a precedence for timestamping the first packet. With
> IPv4 packets, the first packet is timestamped and the remaining fragments
> are not.

Interesting. TCP timestamping takes the opposite choice and does
timestamp the last byte in the sendmsg request.

It sounds like it depends on the workload. Perhaps this then needs to
be configurable with an SOF_.. flag.

Another option would be to return a timestamp for every segment. But
they would all return the same tskey. And it causes different behavior
with and without hardware offload.

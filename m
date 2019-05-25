From: willemdebruijn.kernel@gmail.com (Willem de Bruijn)
Date: Sat, 25 May 2019 11:20:16 -0400
Subject: [PATCH net 1/4] net/udp_gso: Allow TX timestamp with UDP GSO
In-Reply-To: <90E3853F-107D-45BA-93DC-D0BE8AC6FCBB@appneta.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-2-fklassen@appneta.com>
 <CAF=yD-Jf95De=z_nx9WFkGDa6+nRUqM_1PqGkjwaFPzOe+PfXg@mail.gmail.com>
 <AE8E0772-7256-4B9C-A990-96930E834AEE@appneta.com>
 <CAF=yD-LtAKpND601LQrC1+=iF6spSUXVdUapcsbJdv5FYa=5Jg@mail.gmail.com>
 <AFC1ECC8-BFAC-4718-B0C9-97CC4BD1F397@appneta.com>
 <CAF=yD-Le-eTadOi7PL8WFEQCG=yLqb5gvKiks+s5Akeq8TenBQ@mail.gmail.com>
 <90E3853F-107D-45BA-93DC-D0BE8AC6FCBB@appneta.com>
Message-ID:
 <CA+FuTScNr9Srsn9QFBSj=oT4TnMh1QuOZ2h40g=joNjSwccqMg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190525152016.ZRmEWcmqOtiTNaki4DUZzdvG3cTRr_vHYECra_r6BM8@z>

On Fri, May 24, 2019@6:01 PM Fred Klassen <fklassen@appneta.com> wrote:
>
>
>
> > On May 24, 2019,@12:29 PM, Willem de Bruijn <willemdebruijn.kernel@gmail.com> wrote:
> >
> > It is the last moment that a timestamp can be generated for the last
> > byte, I don't see how that is "neither the start nor the end of a GSO
> > packet”.
>
> My misunderstanding. I thought TCP did last segment timestamping, not
> last byte. In that case, your statements make sense.
>
> >> It would be interesting if a practical case can be made for timestamping
> >> the last segment. In my mind, I don’t see how that would be valuable.
> >
> > It depends whether you are interested in measuring network latency or
> > host transmit path latency.
> >
> > For the latter, knowing the time from the start of the sendmsg call to
> > the moment the last byte hits the wire is most relevant. Or in absence
> > of (well defined) hardware support, the last byte being queued to the
> > device is the next best thing.

Sounds to me like both cases have a legitimate use case, and we want
to support both.

Implementation constraints are that storage for this timestamp
information is scarce and we cannot add new cold cacheline accesses in
the datapath.

The simplest approach would be to unconditionally timestamp both the
first and last segment. With the same ID. Not terribly elegant. But it
works.

If conditional, tx_flags has only one bit left. I think we can harvest
some, as not all defined bits are in use at the same stages in the
datapath, but that is not a trivial change. Some might also better be
set in the skb, instead of skb_shinfo. Which would also avoids
touching that cacheline. We could possibly repurpose bits from u32
tskey.

All that can come later. Initially, unless we can come up with
something more elegant, I would suggest that UDP follows the rule
established by TCP and timestamps the last byte. And we add an
explicit SOF_TIMESTAMPING_OPT_FIRSTBYTE that is initially only
supported for UDP, sets a new SKBTX_TX_FB_TSTAMP bit in
__sock_tx_timestamp and is interpreted in __udp_gso_segment.

> >
> > It would make sense for this software implementation to follow
> > established hardware behavior. But as far as I know, the exact time a
> > hardware timestamp is taken is not consistent across devices, either.
> >
> > For fine grained timestamped data, perhaps GSO is simply not a good
> > mechanism. That said, it still has to queue a timestamp if requested.
>
> I see your point. Makes sense to me.
>
> >> When using hardware timestamping, I think you will find that nearly all
> >> adapters only allow one timestamp at a time. Therefore only one
> >> packet in a burst would get timestamped.
> >
> > Can you elaborate? When the host queues N packets all with hardware
> > timestamps requested, all N completions will have a timestamp? Or is
> > that not guaranteed?
> >
>
> It is not guaranteed. The best example is in ixgbe_main.c and search for
> ‘SKBTX_HW_TSTAMP’.  If there is a PTP TX timestamp in progress,
> ‘__IXGBE_PTP_TX_IN_PROGRESS’ is set and no other timestamps
> are possible. The flag is cleared after transmit softirq, and only then
> can another TX timestamp be taken.

Interesting, thanks. I had no idea.

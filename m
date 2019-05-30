From: willemdebruijn.kernel at gmail.com (Willem de Bruijn)
Date: Thu, 30 May 2019 15:17:20 -0400
Subject: [PATCH net-next v3 1/1] net/udp_gso: Allow TX timestamp with UDP
 GSO
In-Reply-To: <8A1636C9-7476-43B2-BAE0-B03675B3920E@appneta.com>
References: <20190528184415.16020-1-fklassen@appneta.com>
 <20190528184415.16020-2-fklassen@appneta.com>
 <CAF=yD-JvNFdWCBJ6w1_XWSHu1CDiG_QimrUT8ZCxw=U+OVvBMA@mail.gmail.com>
 <8A1636C9-7476-43B2-BAE0-B03675B3920E@appneta.com>
Message-ID: <CAF=yD-JW1ZA-LA6iJ0X83UMJxmNLh7VfmUK7B=7LbYMY--wO6w@mail.gmail.com>

> > Asked elsewhere, but best answered here: given that xmit_more delays
> > delivery to the NIC until the last segment in a train, is the first
> > segment in your opinion still the best to attach the timestamp request
> > to?
> >
> > To reiterate, we do not want to need a follow-up patch to disable
> > xmit_more when timestamps are requested.
> >
>
> I think it would be worthwhile. I was playing with this patch …
>
> +               /* software TX timeststamps are sent immediately */
> +               if (tsflags & SKBTX_SW_TSTAMP)
> +                       seg->xmit_more = 0;
>
> … which attempts to address this issue. I believe that the patch
> should be applied for software timestamps only.

Disagree, sorry.

Timestamped packets should take the same path as non-timestamped, so
that sampled timestamps are representative of the overall workload.

Moreover, due to how xmit_more works, applying the timestamp request
to the last segment will give you exactly the behavior that you are
looking for (bar requeue events): a timestamp before the NIC starts
working on any byte in the request. And that approach will be useful
for measuring host latency as well, unlike timestamping the first
segment.

Timestamping the first, then arguing that it is not useful as is and
requires more changes is the wrong path imho.

Perhaps it is easiest to just not split off a segment from the GSO
train when timestamp that independently. That works today.

> However when
> I applied in net-next I got the following compile error, which suggests
> there is more investigation needed, and therefore requires a separate
> patch.
>
> net/ipv4/udp_offload.c: In function ‘__udp_gso_segment’:
> net/ipv4/udp_offload.c:251:7: error: ‘struct sk_buff’ has no member named ‘xmit_more’
>     seg->xmit_more = 0;

Yes, this has been moved to a percpu variable.

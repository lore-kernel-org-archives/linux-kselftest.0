From: fklassen at appneta.com (Fred Klassen)
Date: Sat, 25 May 2019 11:47:41 -0700
Subject: [PATCH net 1/4] net/udp_gso: Allow TX timestamp with UDP GSO
In-Reply-To: <CA+FuTScNr9Srsn9QFBSj=oT4TnMh1QuOZ2h40g=joNjSwccqMg@mail.gmail.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-2-fklassen@appneta.com>
 <CAF=yD-Jf95De=z_nx9WFkGDa6+nRUqM_1PqGkjwaFPzOe+PfXg@mail.gmail.com>
 <AE8E0772-7256-4B9C-A990-96930E834AEE@appneta.com>
 <CAF=yD-LtAKpND601LQrC1+=iF6spSUXVdUapcsbJdv5FYa=5Jg@mail.gmail.com>
 <AFC1ECC8-BFAC-4718-B0C9-97CC4BD1F397@appneta.com>
 <CAF=yD-Le-eTadOi7PL8WFEQCG=yLqb5gvKiks+s5Akeq8TenBQ@mail.gmail.com>
 <90E3853F-107D-45BA-93DC-D0BE8AC6FCBB@appneta.com>
 <CA+FuTScNr9Srsn9QFBSj=oT4TnMh1QuOZ2h40g=joNjSwccqMg@mail.gmail.com>
Message-ID: <4032C02B-EA43-4540-8283-8466CDD0B8D2@appneta.com>



> On May 25, 2019, at 8:20 AM, Willem de Bruijn <willemdebruijn.kernel at gmail.com> wrote:
> 
> On Fri, May 24, 2019 at 6:01 PM Fred Klassen <fklassen at appneta.com> wrote:
>> 
>> 
>> 
>>> On May 24, 2019, at 12:29 PM, Willem de Bruijn <willemdebruijn.kernel at gmail.com> wrote:
>>> 
>>> It is the last moment that a timestamp can be generated for the last
>>> byte, I don't see how that is "neither the start nor the end of a GSO
>>> packet”.
>> 
>> My misunderstanding. I thought TCP did last segment timestamping, not
>> last byte. In that case, your statements make sense.
>> 
>>>> It would be interesting if a practical case can be made for timestamping
>>>> the last segment. In my mind, I don’t see how that would be valuable.
>>> 
>>> It depends whether you are interested in measuring network latency or
>>> host transmit path latency.
>>> 
>>> For the latter, knowing the time from the start of the sendmsg call to
>>> the moment the last byte hits the wire is most relevant. Or in absence
>>> of (well defined) hardware support, the last byte being queued to the
>>> device is the next best thing.
> 
> Sounds to me like both cases have a legitimate use case, and we want
> to support both.
> 
> Implementation constraints are that storage for this timestamp
> information is scarce and we cannot add new cold cacheline accesses in
> the datapath.
> 
> The simplest approach would be to unconditionally timestamp both the
> first and last segment. With the same ID. Not terribly elegant. But it
> works.
> 
> If conditional, tx_flags has only one bit left. I think we can harvest
> some, as not all defined bits are in use at the same stages in the
> datapath, but that is not a trivial change. Some might also better be
> set in the skb, instead of skb_shinfo. Which would also avoids
> touching that cacheline. We could possibly repurpose bits from u32
> tskey.
> 
> All that can come later. Initially, unless we can come up with
> something more elegant, I would suggest that UDP follows the rule
> established by TCP and timestamps the last byte. And we add an
> explicit SOF_TIMESTAMPING_OPT_FIRSTBYTE that is initially only
> supported for UDP, sets a new SKBTX_TX_FB_TSTAMP bit in
> __sock_tx_timestamp and is interpreted in __udp_gso_segment.
> 

I don’t see how to practically TX timestamp the last byte of any packet
(UDP GSO or otherwise). The best we could do is timestamp the last
segment,  or rather the time that the last segment is queued. Let me
attempt to explain.

First let’s look at software TX timestamps which are for are generated
by skb_tx_timestamp() in nearly every network driver’s xmit routine. It
states:

—————————— cut ————————————
 * Ethernet MAC Drivers should call this function in their hard_xmit()
 * function immediately before giving the sk_buff to the MAC hardware.
—————————— cut ————————————

That means that the sk_buff will get timestamped just before rather
than just after it is sent. To truly capture the timestamp of the last
byte, this routine routine would have to be called a second time, right
after sending to MAC hardware. Then the user program would have
sort out the 2 timestamps. My guess is that this isn’t something that
NIC vendors would be willing to implement in their drivers.

So, the best we can do is timestamp is just before the last segment.
Suppose UDP GSO sends 3000 bytes to a 1500 byte MTU adapter.
If we set SKBTX_HW_TSTAMP flag on the last segment, the timestamp
occurs half way through the burst. But it may not be exactly half way
because the segments may get queued much faster than wire rate.
Therefore the time between segment 1 and segment 2 may be much
much smaller than their spacing on the wire. I would not find this
useful.

I propose that we stick with the method used for IP fragments, which
is timestamping just before the first byte is sent. Put another way, I 
propose that we start the clock in an automobile race just before the
front of the first car crosses the start line rather than when the front
of the last car crosses the start line.

TX timestamping in hardware has even more limitations. For the most
part, we can only do one timestamp per packet or burst.  If we requested
a timestamp of only the last segment of a packet, we would have work
backwards to calculate the start time of the packet, but that would
only be be a best guess. For extremely time sensitive applications
(such as the one we develop), this would not be practical.

We could still consider setting a flag that would allow the timestamping
the last segment rather than the first. However since we cannot 
truly measure the timestamp of the last byte, I would question the value
in doing so.

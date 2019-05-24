From: fklassen at appneta.com (Fred Klassen)
Date: Fri, 24 May 2019 15:01:24 -0700
Subject: [PATCH net 1/4] net/udp_gso: Allow TX timestamp with UDP GSO
In-Reply-To: <CAF=yD-Le-eTadOi7PL8WFEQCG=yLqb5gvKiks+s5Akeq8TenBQ@mail.gmail.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-2-fklassen@appneta.com>
 <CAF=yD-Jf95De=z_nx9WFkGDa6+nRUqM_1PqGkjwaFPzOe+PfXg@mail.gmail.com>
 <AE8E0772-7256-4B9C-A990-96930E834AEE@appneta.com>
 <CAF=yD-LtAKpND601LQrC1+=iF6spSUXVdUapcsbJdv5FYa=5Jg@mail.gmail.com>
 <AFC1ECC8-BFAC-4718-B0C9-97CC4BD1F397@appneta.com>
 <CAF=yD-Le-eTadOi7PL8WFEQCG=yLqb5gvKiks+s5Akeq8TenBQ@mail.gmail.com>
Message-ID: <90E3853F-107D-45BA-93DC-D0BE8AC6FCBB@appneta.com>



> On May 24, 2019, at 12:29 PM, Willem de Bruijn <willemdebruijn.kernel at gmail.com> wrote:
> 
> It is the last moment that a timestamp can be generated for the last
> byte, I don't see how that is "neither the start nor the end of a GSO
> packet”.

My misunderstanding. I thought TCP did last segment timestamping, not
last byte. In that case, your statements make sense.

>> It would be interesting if a practical case can be made for timestamping
>> the last segment. In my mind, I don’t see how that would be valuable.
> 
> It depends whether you are interested in measuring network latency or
> host transmit path latency.
> 
> For the latter, knowing the time from the start of the sendmsg call to
> the moment the last byte hits the wire is most relevant. Or in absence
> of (well defined) hardware support, the last byte being queued to the
> device is the next best thing.
> 
> It would make sense for this software implementation to follow
> established hardware behavior. But as far as I know, the exact time a
> hardware timestamp is taken is not consistent across devices, either.
> 
> For fine grained timestamped data, perhaps GSO is simply not a good
> mechanism. That said, it still has to queue a timestamp if requested.

I see your point. Makes sense to me.

>> When using hardware timestamping, I think you will find that nearly all
>> adapters only allow one timestamp at a time. Therefore only one
>> packet in a burst would get timestamped.
> 
> Can you elaborate? When the host queues N packets all with hardware
> timestamps requested, all N completions will have a timestamp? Or is
> that not guaranteed?
> 

It is not guaranteed. The best example is in ixgbe_main.c and search for
‘SKBTX_HW_TSTAMP’.  If there is a PTP TX timestamp in progress,
‘__IXGBE_PTP_TX_IN_PROGRESS’ is set and no other timestamps
are possible. The flag is cleared after transmit softirq, and only then
can another TX timestamp be taken.  

>> There are exceptions, for
>> example I am playing with a 100G Mellanox adapter that has
>> per-packet TX timestamping. However, I suspect that when I am
>> done testing, all I will see is timestamps that are representing wire
>> rate (e.g. 123nsec per 1500 byte packet).
>> 
>> Beyond testing the accuracy of a NIC’s timestamping capabilities, I
>> see very little value in doing per-segment timestamping.
> 
> Ack. Great detailed argument, thanks.

Thanks. I’m a timestamping nerd and have learned lots with this 
discussion.

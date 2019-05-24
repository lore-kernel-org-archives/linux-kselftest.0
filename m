From: fklassen@appneta.com (Fred Klassen)
Date: Fri, 24 May 2019 09:34:54 -0700
Subject: [PATCH net 1/4] net/udp_gso: Allow TX timestamp with UDP GSO
In-Reply-To: <CAF=yD-LtAKpND601LQrC1+=iF6spSUXVdUapcsbJdv5FYa=5Jg@mail.gmail.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-2-fklassen@appneta.com>
 <CAF=yD-Jf95De=z_nx9WFkGDa6+nRUqM_1PqGkjwaFPzOe+PfXg@mail.gmail.com>
 <AE8E0772-7256-4B9C-A990-96930E834AEE@appneta.com>
 <CAF=yD-LtAKpND601LQrC1+=iF6spSUXVdUapcsbJdv5FYa=5Jg@mail.gmail.com>
Message-ID: <AFC1ECC8-BFAC-4718-B0C9-97CC4BD1F397@appneta.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190524163454.EeZU4iEDZhYtibBCiIn6RxvZcz1CAB_GemvXimk-x2c@z>

> Interesting. TCP timestamping takes the opposite choice and does
> timestamp the last byte in the sendmsg request.
> 

I have a difficult time with the philosophy of TX timestamping the last
segment. The actual timestamp occurs just before the last segment
is sent. This is neither the start  nor the end of a GSO packet, which
to me seems somewhat arbitrary. It is even more arbitrary when using
software TX tiimestamping. These are timestamps represent the
time that the packet is queued onto the NIC’s buffer, not actual
time leaving the wire. Queuing to a ring buffer is usually much faster
than wire rates. Therefore, say the timestamp of the last 1500 byte 
segment of a 64K GSO packet may in reality be representing a time
about half way through the burst.

Since the timestamp of a TX packet occurs just before any data is sent,
I have found it most valuable to timestamp just before the first byte of 
the packet or burst. Conversely, I find it most valuable to get an RX
timestamp  after the last byte arrives.

> It sounds like it depends on the workload. Perhaps this then needs to
> be configurable with an SOF_.. flag.
> 

It would be interesting if a practical case can be made for timestamping
the last segment. In my mind, I don’t see how that would be valuable.

> Another option would be to return a timestamp for every segment. But
> they would all return the same tskey. And it causes different behavior
> with and without hardware offload.

When it comes to RX packets, getting per-packet (or per segment)
timestamps is invaluable. They represent actual wire times. However
my previous research into TX timestamping has led me to conclude
that there is no practical value when timestamping every packet of 
a back-to-back burst.

When using software TX timestamping, The inter-packet timestamps
are typically much faster than line rate. Whereas you may be sending
on a GigE link, you may measure 20Gbps. At higher rates, I have found
that the overhead of per-packet software timestamping can produce
gaps in packets.

When using hardware timestamping, I think you will find that nearly all
adapters only allow one timestamp at a time. Therefore only one
packet in a burst would get timestamped. There are exceptions, for
example I am playing with a 100G Mellanox adapter that has
per-packet TX timestamping. However, I suspect that when I am
done testing, all I will see is timestamps that are representing wire
rate (e.g. 123nsec per 1500 byte packet).

Beyond testing the accuracy of a NIC’s timestamping capabilities, I
see very little value in doing per-segment timestamping.

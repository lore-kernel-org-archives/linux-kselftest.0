From: fklassen@appneta.com (Fred Klassen)
Date: Thu, 23 May 2019 18:38:44 -0700
Subject: [PATCH net 1/4] net/udp_gso: Allow TX timestamp with UDP GSO
In-Reply-To: <CAF=yD-Jf95De=z_nx9WFkGDa6+nRUqM_1PqGkjwaFPzOe+PfXg@mail.gmail.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-2-fklassen@appneta.com>
 <CAF=yD-Jf95De=z_nx9WFkGDa6+nRUqM_1PqGkjwaFPzOe+PfXg@mail.gmail.com>
Message-ID: <AE8E0772-7256-4B9C-A990-96930E834AEE@appneta.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190524013844.DUoUqj17W0mea-OPgZ_OhSv5LbcKsWj9IVTO0GI_cTU@z>

> Thanks for the report.
> 
> Zerocopy notification reference count is managed in skb_segment. That
> should work.
> 
> Support for timestamping with the new GSO feature is indeed an
> oversight. The solution is similar to how TCP associates the timestamp
> with the right segment in tcp_gso_tstamp.
> 
> Only, I think we want to transfer the timestamp request to the last
> datagram, not the first. For send timestamp, the final byte leaving
> the host is usually more interesting.

TX Timestamping the last packet of a datagram is something that would
work poorly for our application. We need to measure the time it takes
for the first bit that is sent until the first bit of the last packet is received.
Timestaming the last packet of a burst seems somewhat random to me
and would not be useful. Essentially we would be timestamping a 
random byte in a UDP GSO buffer.

I believe there is a precedence for timestamping the first packet. With
IPv4 packets, the first packet is timestamped and the remaining fragments
are not.

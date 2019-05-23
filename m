From: willemdebruijn.kernel at gmail.com (Willem de Bruijn)
Date: Thu, 23 May 2019 17:59:29 -0400
Subject: [PATCH net 1/4] net/udp_gso: Allow TX timestamp with UDP GSO
In-Reply-To: <20190523210651.80902-2-fklassen@appneta.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-2-fklassen@appneta.com>
Message-ID: <CAF=yD-+4g-HjmCnDWaVfdsyruePXqYeUDJgnffz9ro+rgNGv1g@mail.gmail.com>

On Thu, May 23, 2019 at 5:09 PM Fred Klassen <fklassen at appneta.com> wrote:
>
> Fixes an issue where TX Timestamps are not arriving on the error queue
> when UDP_SEGMENT CMSG type is combined with CMSG type SO_TIMESTAMPING.
> This can be illustrated with an updated updgso_bench_tx program which
> includes the '-T' option to test for this condition.
>
>     ./udpgso_bench_tx -4ucTPv -S 1472 -l2 -D 172.16.120.18
>     poll timeout
>     udp tx:      0 MB/s        1 calls/s      1 msg/s
>
> The "poll timeout" message above indicates that TX timestamp never
> arrived.
>
> It also appears that other TX CMSG types cause similar issues, for
> example trying to set SOL_IP/IP_TOS.
>
>     ./udpgso_bench_tx -4ucPv -S 1472 -q 182 -l2 -D 172.16.120.18
>     poll timeout
>     udp tx:      0 MB/s        1 calls/s      1 msg/s

what exactly is the issue with IP_TOS?

If I understand correctly, the issue here is that the new 'P' option
that polls on the error queue times out. This is unrelated to
specifying TOS bits? Without zerocopy or timestamps, no message is
expected on the error queue.

From: willemdebruijn.kernel@gmail.com (Willem de Bruijn)
Date: Tue, 28 May 2019 16:09:07 -0400
Subject: [PATCH net-next v2 2/3] net/udpgso_bench.sh add UDP GSO audit
 tests
In-Reply-To: <20190528184708.16516-3-fklassen@appneta.com>
References: <20190528184708.16516-1-fklassen@appneta.com>
 <20190528184708.16516-3-fklassen@appneta.com>
Message-ID:
 <CAF=yD-KozDxhwf1Arkbz5X_dYfZ5M40xr9hcxKGDRmeg1BOE=Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190528200907.ru6ieLK1A9r-J0N7PM6PAfuRsuTYJIEo4VNI4uNB-MA@z>

On Tue, May 28, 2019@3:24 PM Fred Klassen <fklassen@appneta.com> wrote:
>
> Audit tests count the total number of messages sent and compares
> with total number of CMSG received on error queue. Example:
>
>     udp gso zerocopy timestamp audit
>     udp rx:   1599 MB/s  1166414 calls/s
>     udp tx:   1615 MB/s    27395 calls/s  27395 msg/s
>     udp rx:   1634 MB/s  1192261 calls/s
>     udp tx:   1633 MB/s    27699 calls/s  27699 msg/s
>     udp rx:   1633 MB/s  1191358 calls/s
>     udp tx:   1631 MB/s    27678 calls/s  27678 msg/s
>     Summary over 4.000 seconds...
>     sum udp tx:   1665 MB/s      82772 calls (27590/s)      82772 msgs (27590/s)
>     Tx Timestamps:               82772 received                 0 errors
>     Zerocopy acks:               82772 received                 0 errors
>
> Errors are thrown if CMSG count does not equal send count,
> example:
>
>     Summary over 4.000 seconds...
>     sum tcp tx:   7451 MB/s     493706 calls (123426/s)     493706 msgs (123426/s)
>     ./udpgso_bench_tx: Unexpected number of Zerocopy completions:    493706 expected    493704 received
>
> Also reduce individual test time from 4 to 3 seconds so that
> overall test time does not increase significantly.
>
> Signed-off-by: Fred Klassen <fklassen at appneta.com>

Acked-by: Willem de Bruijn <willemb at google.com>

If respinning the series, please add a comment about adding -P to the
tcp zerocopy test.

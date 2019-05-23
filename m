From: willemdebruijn.kernel at gmail.com (Willem de Bruijn)
Date: Thu, 23 May 2019 17:39:36 -0400
Subject: [PATCH net 1/4] net/udp_gso: Allow TX timestamp with UDP GSO
In-Reply-To: <20190523210651.80902-2-fklassen@appneta.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-2-fklassen@appneta.com>
Message-ID: <CAF=yD-Jf95De=z_nx9WFkGDa6+nRUqM_1PqGkjwaFPzOe+PfXg@mail.gmail.com>

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
>
> This patch preserves tx_flags for the first UDP GSO segment. This
> mirrors the stack's behaviour for IPv4 fragments.
>
> Fixes: ee80d1ebe5ba ("udp: add udp gso")
> Signed-off-by: Fred Klassen <fklassen at appneta.com>
> ---
>  net/ipv4/udp_offload.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
> index 065334b41d57..33de347695ae 100644
> --- a/net/ipv4/udp_offload.c
> +++ b/net/ipv4/udp_offload.c
> @@ -228,6 +228,10 @@ struct sk_buff *__udp_gso_segment(struct sk_buff *gso_skb,
>         seg = segs;
>         uh = udp_hdr(seg);
>
> +       /* preserve TX timestamp and zero-copy info for first segment */
> +       skb_shinfo(seg)->tskey = skb_shinfo(gso_skb)->tskey;
> +       skb_shinfo(seg)->tx_flags = skb_shinfo(gso_skb)->tx_flags;
> +

Thanks for the report.

Zerocopy notification reference count is managed in skb_segment. That
should work.

Support for timestamping with the new GSO feature is indeed an
oversight. The solution is similar to how TCP associates the timestamp
with the right segment in tcp_gso_tstamp.

Only, I think we want to transfer the timestamp request to the last
datagram, not the first. For send timestamp, the final byte leaving
the host is usually more interesting.

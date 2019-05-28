From: willemdebruijn.kernel@gmail.com (Willem de Bruijn)
Date: Tue, 28 May 2019 17:44:01 -0400
Subject: [PATCH net-next v3 1/1] net/udp_gso: Allow TX timestamp with UDP
 GSO
In-Reply-To: <20190528184415.16020-2-fklassen@appneta.com>
References: <20190528184415.16020-1-fklassen@appneta.com>
 <20190528184415.16020-2-fklassen@appneta.com>
Message-ID:
 <CAF=yD-JvNFdWCBJ6w1_XWSHu1CDiG_QimrUT8ZCxw=U+OVvBMA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190528214401.AlHyXZDd7wlAQJ4Iq9RygClCN45UzBnswmUSzLi2NwM@z>

On Tue, May 28, 2019@3:10 PM Fred Klassen <fklassen@appneta.com> wrote:
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

See previous comment in v2

http://patchwork.ozlabs.org/patch/1105564/

>
>     ./udpgso_bench_tx -4ucPv -S 1472 -q 182 -l2 -D 172.16.120.18
>     poll timeout
>     udp tx:      0 MB/s        1 calls/s      1 msg/s
>
> This patch preserves tx_flags for the first UDP GSO segment.
>
> v2: Remove tests as noted by Willem de Bruijn <willemb at google.com>
>     Moving tests from net to net-next
>
> v3: Update only relevant tx_flag bits as per
>     Willem de Bruijn <willemb at google.com>
>
> Fixes: ee80d1ebe5ba ("udp: add udp gso")
> Signed-off-by: Fred Klassen <fklassen at appneta.com>

FYI, no need for a cover letter for a single patch. Also, I think the
cc list can be more concise. Mainly netdev.

> ---
>  net/ipv4/udp_offload.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
> index 065334b41d57..de8ecba42d55 100644
> --- a/net/ipv4/udp_offload.c
> +++ b/net/ipv4/udp_offload.c
> @@ -228,6 +228,11 @@ struct sk_buff *__udp_gso_segment(struct sk_buff *gso_skb,
>         seg = segs;
>         uh = udp_hdr(seg);
>
> +       /* preserve TX timestamp and zero-copy info for first segment */

Same as above. This is not about zerocopy.

> +       skb_shinfo(seg)->tskey = skb_shinfo(gso_skb)->tskey;
> +       skb_shinfo(seg)->tx_flags |=
> +                       (skb_shinfo(gso_skb)->tx_flags & SKBTX_ANY_TSTAMP);

Asked elsewhere, but best answered here: given that xmit_more delays
delivery to the NIC until the last segment in a train, is the first
segment in your opinion still the best to attach the timestamp request
to?

To reiterate, we do not want to need a follow-up patch to disable
xmit_more when timestamps are requested.


> +
>         /* compute checksum adjustment based on old length versus new */
>         newlen = htons(sizeof(*uh) + mss);
>         check = csum16_add(csum16_sub(uh->check, uh->len), newlen);
> --
> 2.11.0
>

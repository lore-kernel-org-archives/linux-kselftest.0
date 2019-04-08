From: willemdebruijn.kernel at gmail.com (Willem de Bruijn)
Date: Mon, 8 Apr 2019 15:07:39 -0400
Subject: [PATCH v2 bpf-next 2/4] bpf: add layer 2 encap support to
 bpf_skb_adjust_room
In-Reply-To: <1554742668-28313-3-git-send-email-alan.maguire@oracle.com>
References: <1554742668-28313-1-git-send-email-alan.maguire@oracle.com>
 <1554742668-28313-3-git-send-email-alan.maguire@oracle.com>
Message-ID: <CAF=yD-K9Ld3jqCtE29P0n4noWYgC0i5A2TJvKyJAUkssnDOJ2w@mail.gmail.com>

On Mon, Apr 8, 2019 at 12:59 PM Alan Maguire <alan.maguire at oracle.com> wrote:
>
> commit 868d523535c2 ("bpf: add bpf_skb_adjust_room encap flags")
> introduced support to bpf_skb_adjust_room for GSO-friendly GRE
> and UDP encapsulation.
>
> For GSO to work for skbs, the inner headers (mac and network) need to
> be marked.  For L3 encapsulation using bpf_skb_adjust_room, the mac
> and network headers are identical.  Here we provide a way of specifying
> the inner mac header length for cases where L2 encap is desired.  Such
> an approach can support encapsulated ethernet headers, MPLS headers etc.
> For example to convert from a packet of form [eth][ip][tcp] to
> [eth][ip][udp][inner mac][ip][tcp], something like the following could
> be done:
>
>         headroom = sizeof(iph) + sizeof(struct udphdr) + inner_maclen;
>
>         ret = bpf_skb_adjust_room(skb, headroom, BPF_ADJ_ROOM_MAC,
>                                   BPF_F_ADJ_ROOM_ENCAP_L4_UDP |
>                                   BPF_F_ADJ_ROOM_ENCAP_L3_IPV4 |
>                                   BPF_F_ADJ_ROOM_ENCAP_L2(inner_maclen));
>
> Signed-off-by: Alan Maguire <alan.maguire at oracle.com>

>  static int bpf_skb_net_grow(struct sk_buff *skb, u32 off, u32 len_diff,
>                             u64 flags)
>  {
> +       u16 mac_len = 0, inner_mac = 0, inner_net = 0, inner_trans = 0;
>         bool encap = flags & BPF_F_ADJ_ROOM_ENCAP_L3_MASK;
> -       u16 mac_len = 0, inner_net = 0, inner_trans = 0;
>         unsigned int gso_type = SKB_GSO_DODGY;
> +       u8 inner_mac_len = flags >> BPF_ADJ_ROOM_ENCAP_L2_SHIFT;
>         int ret;
>
>         if (skb_is_gso(skb) && !skb_is_gso_tcp(skb)) {
> @@ -3008,6 +3011,9 @@ static int bpf_skb_net_grow(struct sk_buff *skb, u32 off, u32 len_diff,
>
>                 mac_len = skb->network_header - skb->mac_header;
>                 inner_net = skb->network_header;
> +               if (inner_mac_len > len_diff)
> +                       return -EINVAL;
> +               inner_mac = inner_net - inner_mac_len;

nit: variable inner_mac is not needed.

> @@ -3031,7 +3036,7 @@ static int bpf_skb_net_grow(struct sk_buff *skb, u32 off, u32 len_diff,
>                         gso_type |= SKB_GSO_GRE;
>                 else if (flags & BPF_F_ADJ_ROOM_ENCAP_L3_IPV6)
>                         gso_type |= SKB_GSO_IPXIP6;
> -               else
> +               else if (flags & BPF_F_ADJ_ROOM_ENCAP_L3_IPV4)
>                         gso_type |= SKB_GSO_IPXIP4;

Nice catch. L2 encap should also work without L3 encap.

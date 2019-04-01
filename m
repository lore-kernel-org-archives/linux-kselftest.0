From: willemdebruijn.kernel at gmail.com (Willem de Bruijn)
Date: Mon, 1 Apr 2019 13:30:16 -0400
Subject: [PATCH bpf-next 2/4] bpf: add layer 2 encap support to
 bpf_skb_adjust_room
In-Reply-To: <1554132731-3095-3-git-send-email-alan.maguire@oracle.com>
References: <1554132731-3095-1-git-send-email-alan.maguire@oracle.com>
 <1554132731-3095-3-git-send-email-alan.maguire@oracle.com>
Message-ID: <CAF=yD-KRFNiRk24CVkNsJBkfw=im8J67J5jCe2gkM28BXs_zSw@mail.gmail.com>

On Mon, Apr 1, 2019 at 11:33 AM Alan Maguire <alan.maguire at oracle.com> wrote:
>
> In
>
> commit 868d523535c2 ("bpf: add bpf_skb_adjust_room encap flags")
>
> ...Willem introduced support to bpf_skb_adjust_room for GSO-friendly
> GRE and UDP encapsulation.
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
> ---

> +#define        BPF_F_ADJ_ROOM_ENCAP_L2(len)    (((__u64)len & 0xff) << 56)

Here ..

>
>  /* Mode for BPF_FUNC_skb_adjust_room helper. */
>  enum bpf_adj_room_mode {
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 22eb2ed..02ae8c0 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -2969,14 +2969,16 @@ static u32 bpf_skb_net_base_len(const struct sk_buff *skb)
>  #define BPF_F_ADJ_ROOM_MASK            (BPF_F_ADJ_ROOM_FIXED_GSO | \
>                                          BPF_F_ADJ_ROOM_ENCAP_L3_MASK | \
>                                          BPF_F_ADJ_ROOM_ENCAP_L4_GRE | \
> -                                        BPF_F_ADJ_ROOM_ENCAP_L4_UDP)
> +                                        BPF_F_ADJ_ROOM_ENCAP_L4_UDP | \
> +                                        BPF_F_ADJ_ROOM_ENCAP_L2(0xff))

.. and here ..
>
>  static int bpf_skb_net_grow(struct sk_buff *skb, u32 off, u32 len_diff,
>                             u64 flags)
>  {
> +       u16 mac_len = 0, inner_mac = 0, inner_net = 0, inner_trans = 0;
>         bool encap = flags & BPF_F_ADJ_ROOM_ENCAP_L3_MASK;
> -       u16 mac_len = 0, inner_net = 0, inner_trans = 0;
>         unsigned int gso_type = SKB_GSO_DODGY;
> +       u8 inner_mac_len = flags >> 56;

.. and here: please do not use hardcoded constants. Define explicit
constant integers or macros for readability and consistency.

>         int ret;
>
>         if (skb_is_gso(skb) && !skb_is_gso_tcp(skb)) {
> @@ -3003,11 +3005,19 @@ static int bpf_skb_net_grow(struct sk_buff *skb, u32 off, u32 len_diff,
>                     flags & BPF_F_ADJ_ROOM_ENCAP_L4_UDP)
>                         return -EINVAL;
>
> +               if (flags & BPF_F_ADJ_ROOM_ENCAP_L4_UDP &&
> +                   flags & BPF_F_ADJ_ROOM_FIXED_GSO &&
> +                   inner_mac_len > 0)
> +                       return -EINVAL;
> +

Why is UDP encap with inner MAC (or MPLS) not allowed with fixed GSO?

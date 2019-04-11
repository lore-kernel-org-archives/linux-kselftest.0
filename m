From: willemdebruijn.kernel@gmail.com (Willem de Bruijn)
Date: Thu, 11 Apr 2019 17:18:59 -0400
Subject: [PATCH v3 bpf-next 2/4] bpf: add layer 2 encap support to
 bpf_skb_adjust_room
In-Reply-To: <12f9cef4-f5ff-78a4-ec0f-42f737696735@iogearbox.net>
References: <1554818803-4070-1-git-send-email-alan.maguire@oracle.com>
 <1554818803-4070-3-git-send-email-alan.maguire@oracle.com>
 <12f9cef4-f5ff-78a4-ec0f-42f737696735@iogearbox.net>
Message-ID:
 <CAF=yD-LMZF2gU+AmKSgtzN3YDDiO=XF19kf7RNg5_8zNp2m93w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190411211859.y5belT7FjfCeJHGdp2ArJqwKTiBhIYaX5nsb_2f1acs@z>

On Thu, Apr 11, 2019@5:09 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> On 04/09/2019 04:06 PM, Alan Maguire wrote:
> > commit 868d523535c2 ("bpf: add bpf_skb_adjust_room encap flags")
> > introduced support to bpf_skb_adjust_room for GSO-friendly GRE
> > and UDP encapsulation.
> >
> > For GSO to work for skbs, the inner headers (mac and network) need to
> > be marked.  For L3 encapsulation using bpf_skb_adjust_room, the mac
> > and network headers are identical.  Here we provide a way of specifying
> > the inner mac header length for cases where L2 encap is desired.  Such
> > an approach can support encapsulated ethernet headers, MPLS headers etc.
> > For example to convert from a packet of form [eth][ip][tcp] to
> > [eth][ip][udp][inner mac][ip][tcp], something like the following could
> > be done:
> >
> >       headroom = sizeof(iph) + sizeof(struct udphdr) + inner_maclen;
> >
> >       ret = bpf_skb_adjust_room(skb, headroom, BPF_ADJ_ROOM_MAC,
> >                                 BPF_F_ADJ_ROOM_ENCAP_L4_UDP |
> >                                 BPF_F_ADJ_ROOM_ENCAP_L3_IPV4 |
> >                                 BPF_F_ADJ_ROOM_ENCAP_L2(inner_maclen));
> >
> > Signed-off-by: Alan Maguire <alan.maguire at oracle.com>
> > ---
> >  include/uapi/linux/bpf.h | 10 ++++++++++
> >  net/core/filter.c        | 12 ++++++++----
> >  2 files changed, 18 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> > index 8370245..912391c 100644
> > --- a/include/uapi/linux/bpf.h
> > +++ b/include/uapi/linux/bpf.h
> > @@ -1500,6 +1500,10 @@ struct bpf_stack_build_id {
> >   *           * **BPF_F_ADJ_ROOM_ENCAP_L4_UDP **:
> >   *             Use with ENCAP_L3 flags to further specify the tunnel type.
> >   *
> > + *           * **BPF_F_ADJ_ROOM_ENCAP_L2(len) **:
> > + *             Use with ENCAP_L3/L4 flags to further specify the tunnel
> > + *             type; **len** is the length of the inner MAC header.
> > + *
> >   *           A call to this helper is susceptible to change the underlaying
> >   *           packet buffer. Therefore, at load time, all checks on pointers
> >   *           previously done by the verifier are invalidated and must be
> > @@ -2641,10 +2645,16 @@ enum bpf_func_id {
> >  /* BPF_FUNC_skb_adjust_room flags. */
> >  #define BPF_F_ADJ_ROOM_FIXED_GSO     (1ULL << 0)
> >
> > +#define      BPF_ADJ_ROOM_ENCAP_L2_MASK      0xff
> > +#define      BPF_ADJ_ROOM_ENCAP_L2_SHIFT     56
>
> Would appreciate a small whitespace cleanup in that tab after the define
> is replaced with a normal space like in the rest of the file.
>
> >  #define BPF_F_ADJ_ROOM_ENCAP_L3_IPV4 (1ULL << 1)
> >  #define BPF_F_ADJ_ROOM_ENCAP_L3_IPV6 (1ULL << 2)
> >  #define BPF_F_ADJ_ROOM_ENCAP_L4_GRE  (1ULL << 3)
> >  #define BPF_F_ADJ_ROOM_ENCAP_L4_UDP  (1ULL << 4)
> > +#define      BPF_F_ADJ_ROOM_ENCAP_L2(len)    (((__u64)len & \
> > +                                       BPF_ADJ_ROOM_ENCAP_L2_MASK) \
> > +                                      << BPF_ADJ_ROOM_ENCAP_L2_SHIFT)
>
> Ditto here.
>
> >  /* Mode for BPF_FUNC_skb_adjust_room helper. */
> >  enum bpf_adj_room_mode {
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index 22eb2ed..a1654ef62 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> > @@ -2969,11 +2969,14 @@ static u32 bpf_skb_net_base_len(const struct sk_buff *skb)
> >  #define BPF_F_ADJ_ROOM_MASK          (BPF_F_ADJ_ROOM_FIXED_GSO | \
> >                                        BPF_F_ADJ_ROOM_ENCAP_L3_MASK | \
> >                                        BPF_F_ADJ_ROOM_ENCAP_L4_GRE | \
> > -                                      BPF_F_ADJ_ROOM_ENCAP_L4_UDP)
> > +                                      BPF_F_ADJ_ROOM_ENCAP_L4_UDP | \
> > +                                      BPF_F_ADJ_ROOM_ENCAP_L2( \
> > +                                       BPF_ADJ_ROOM_ENCAP_L2_MASK))
> >
> >  static int bpf_skb_net_grow(struct sk_buff *skb, u32 off, u32 len_diff,
> >                           u64 flags)
> >  {
>
> One thing that it seems missing in this but also in Willem's earlier set
> is that we reject these flags in bpf_skb_net_shrink(). Both are called from
> bpf_skb_adjust_room(), so if we don't support decap yet we should reject
> such flags so we can extend in future. Could you or Willem send a follow-up?

Indeed. Thanks for bringing that up, Daniel. I only thought of that
after submitting the original patchset, too. Will send a patch.

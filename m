From: willemdebruijn.kernel at gmail.com (Willem de Bruijn)
Date: Mon, 1 Apr 2019 13:45:37 -0400
Subject: [PATCH bpf-next 4/4] selftests_bpf: extend test_tc_tunnel.sh test
 for L2 encap
In-Reply-To: <1554132731-3095-5-git-send-email-alan.maguire@oracle.com>
References: <1554132731-3095-1-git-send-email-alan.maguire@oracle.com>
 <1554132731-3095-5-git-send-email-alan.maguire@oracle.com>
Message-ID: <CAF=yD-++bp-MN2WiThMsVzR+cxtz25LKL+yC_Fpfd_xe5xy+SQ@mail.gmail.com>

On Mon, Apr 1, 2019 at 11:33 AM Alan Maguire <alan.maguire at oracle.com> wrote:
>
> Update test_tc_tunnel to verify adding inner L2 header
> encapsulation (an MPLS label) works.
>
> Signed-off-by: Alan Maguire <alan.maguire at oracle.com>
> ---


> @@ -84,23 +95,39 @@ static __always_inline int encap_ipv4(struct __sk_buff *skb, __u8 encap_proto)
>                 return TC_ACT_OK;
>
>         olen = sizeof(h_outer.ip);
> +       elen = 0;

nit: could you pick a (slightly) more descriptive name? I don't get
what e is an abbreviation for here.

>
>         flags = BPF_F_ADJ_ROOM_ENCAP_L3_IPV4;
> +
> +       if (l2_proto == ETH_P_MPLS_UC) {
> +               elen = sizeof(mpls_label);
> +               flags |= BPF_F_ADJ_ROOM_ENCAP_L2(elen);
> +       }
> +
>         switch (encap_proto) {
>         case IPPROTO_GRE:

To verify that this L2 encap method is generic, it would be useful to
also test IPPROTO_GRE + ETH_P_TEB, if that's not too much work to add.

>                 flags |= BPF_F_ADJ_ROOM_ENCAP_L4_GRE | BPF_F_ADJ_ROOM_FIXED_GSO;
>                 olen += sizeof(h_outer.l4hdr.gre);
> -               h_outer.l4hdr.gre.protocol = bpf_htons(ETH_P_IP);
> +               h_outer.l4hdr.gre.protocol = bpf_htons(l2_proto);
>                 h_outer.l4hdr.gre.flags = 0;
>                 break;
>         case IPPROTO_UDP:
>                 flags |= BPF_F_ADJ_ROOM_ENCAP_L4_UDP;
>                 olen += sizeof(h_outer.l4hdr.udp);
> -               h_outer.l4hdr.udp.source = __bpf_constant_htons(cfg_udp_src);
> -               h_outer.l4hdr.udp.dest = __bpf_constant_htons(cfg_udp_dst);
>                 h_outer.l4hdr.udp.check = 0;
>                 h_outer.l4hdr.udp.len = bpf_htons(bpf_ntohs(iph_inner.tot_len) +
> -                                                 sizeof(h_outer.l4hdr.udp));
> +                                                 sizeof(h_outer.l4hdr.udp) +
> +                                                 elen);
> +               h_outer.l4hdr.udp.source = __bpf_constant_htons(cfg_udp_src);
> +               switch (l2_proto) {
> +               case ETH_P_IP:
> +                       dst = cfg_udp_dst;
> +                       break;
> +               case ETH_P_MPLS_UC:
> +                       dst = cfg_mplsudp_dst;
> +                       break;
> +               }
> +               h_outer.l4hdr.udp.dest = bpf_htons(dst);

nit: more concise:

      h_outer.l4hdr.udp.dest = bpf_htons(l2_proto == ETH_P_IP ?
cfg_udp_dst :  cfg_mplsudp_dst);

>                 break;
>         case IPPROTO_IPIP:
>                 break;
> @@ -108,6 +135,13 @@ static __always_inline int encap_ipv4(struct __sk_buff *skb, __u8 encap_proto)
>                 return TC_ACT_OK;
>         }
>
> +       /* add L2 encap (if specified) */
> +       if (l2_proto == ETH_P_MPLS_UC)
> +               __builtin_memcpy((__u8 *)&h_outer + olen, &mpls_label,
> +                                sizeof(mpls_label));

nit: no need for memcpy, can cast to __u32 and use regular integer assignment.

> +
> +       olen += elen;
> +
>         /* add room between mac and network header */
>         if (bpf_skb_adjust_room(skb, olen, BPF_ADJ_ROOM_MAC, flags))
>                 return TC_ACT_SHOT;
> @@ -124,18 +158,19 @@ static __always_inline int encap_ipv4(struct __sk_buff *skb, __u8 encap_proto)
>         if (bpf_skb_store_bytes(skb, ETH_HLEN, &h_outer, olen,
>                                 BPF_F_INVALIDATE_HASH) < 0)
>                 return TC_ACT_SHOT;
> -

nit: irrelevant change



>
> -if [[ "$#" -ne "3" ]]; then
> +if [[ "$#" -ne "4" ]]; then
>         echo "Usage: $0"
> -       echo "   or: $0 <ipv4|ipv6> <tuntype> <data_len>"
> +       echo "   or: $0 <ipv4|ipv6> <tuntype> <none|mpls> <data_len>"
>         exit 1
>  fi
>
> @@ -148,9 +150,10 @@ case "$1" in
>  esac
>
>  readonly tuntype=$2
> -readonly datalen=$3
> +readonly mactype=$3
> +readonly datalen=$4
>
> -echo "encap ${addr1} to ${addr2}, type ${tuntype}, len ${datalen}"
> +echo "encap ${addr1} to ${addr2}, tun ${tuntype} mac ${mactype} len ${datalen}"
>
>  trap cleanup EXIT
>
> @@ -167,7 +170,7 @@ verify_data
>  ip netns exec "${ns1}" tc qdisc add dev veth1 clsact
>  ip netns exec "${ns1}" tc filter add dev veth1 egress \
>         bpf direct-action object-file ./test_tc_tunnel.o \
> -       section "encap_${tuntype}"
> +       section "encap_${tuntype}_${mactype}"
>  echo "test bpf encap without decap (expect failure)"
>  server_listen
>  ! client_connect
> @@ -176,11 +179,11 @@ server_listen
>  # server is still running
>  # client can connect again
>
> -# Skip tunnel tests for ip6udp.  For IPv6, a UDP checksum is required
> -# and there seems to be no way to tell a fou6 tunnel to allow 0
> -# checksums.  Accordingly for both these cases, we skip tests against
> -# tunnel peer, and test encap using BPF decap only.
> -if [[ "$tuntype" != "ip6udp" ]]; then
> +# Skip tunnel tests for L2 encap and ip6udp.  For IPv6, a UDP checksum
> +# is required and there seems to be no way to tell a fou6 tunnel to
> +# allow 0 checksums.

Please update comment for L2 encap: why can we not test with a device
for MPLS decap? I am not suggesting adding it if complex. But note
that I added the tunnel device decap before the bpf decap especially
to have some verification that our logic matches that generated by
real tunnel devices. With our own BPF code on both sides, that cannot
be tested.

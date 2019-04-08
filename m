From: willemdebruijn.kernel@gmail.com (Willem de Bruijn)
Date: Mon, 8 Apr 2019 15:07:35 -0400
Subject: [PATCH v2 bpf-next 4/4] selftests_bpf: add L2 encap to
 test_tc_tunnel
In-Reply-To: <1554742668-28313-5-git-send-email-alan.maguire@oracle.com>
References: <1554742668-28313-1-git-send-email-alan.maguire@oracle.com>
 <1554742668-28313-5-git-send-email-alan.maguire@oracle.com>
Message-ID:
 <CAF=yD-+AR7567TotUCO1y0Ch3TRw8mOV63zqXK4DXxP3YTUirA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190408190735.pCPNQg4UjBhhfiO1JygP4qEqelCj_P0p1HYgeHMFfQo@z>

On Mon, Apr 8, 2019@12:59 PM Alan Maguire <alan.maguire@oracle.com> wrote:
>
> Update test_tc_tunnel to verify adding inner L2 header
> encapsulation (an MPLS label or ethernet header) works.
>
> Signed-off-by: Alan Maguire <alan.maguire at oracle.com>

>  static const int cfg_udp_src = 20000;
>  static const int cfg_udp_dst = 5555;
> +/* MPLSoverUDP */
> +#define MPLS_OVER_UDP_PORT 6635
> +static const int cfg_mplsudp_dst = MPLS_OVER_UDP_PORT;
> +#define        ETH_OVER_UDP_PORT 7777
> +static const int cfg_ethudp_dst = ETH_OVER_UDP_PORT;

nit: static const variables not really needed if duplicating the macro.


> -static __always_inline int encap_ipv4(struct __sk_buff *skb, __u8 encap_proto)
> +static __always_inline int encap_ipv4(struct __sk_buff *skb, __u8 encap_proto,
> +                                     __u16 l2_proto)
>  {
> +       __u32 udp_dst = cfg_udp_dst;

nit: __u16 (as in encap_ipv6)

> -static int decap_ipv4(struct __sk_buff *skb)
> +static __always_inline int decap_ipv4(struct __sk_buff *skb)

unnecessary change? also for decap_ipv6

> +elif [[ "$mac" == "mpls" ]]; then
> +       modprobe mpls_iptunnel ||true
> +       modprobe mpls_gso ||true

this requires adding CONFIG_MPLS and CONFIG_MPLS_IPTUNNEL to
tools/testing/selftests/bpf/config


> +       ip netns exec "${ns2}" sysctl -qw net.mpls.platform_labels=65536
> +       ip netns exec "${ns2}" ip -f mpls route add 1000 dev lo
> +       ip netns exec "${ns2}" ip link set lo up
> +       ip netns exec "${ns2}" sysctl -qw net.mpls.conf.testtun0.input=1
> +       ip netns exec "${ns2}" sysctl -qw net.ipv4.conf.lo.rp_filter=0
> +fi

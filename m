From: willemdebruijn.kernel at gmail.com (Willem de Bruijn)
Date: Mon, 8 Apr 2019 15:07:43 -0400
Subject: [PATCH v2 bpf-next 1/4] selftests_bpf: add UDP encap to
 test_tc_tunnel
In-Reply-To: <1554742668-28313-2-git-send-email-alan.maguire@oracle.com>
References: <1554742668-28313-1-git-send-email-alan.maguire@oracle.com>
 <1554742668-28313-2-git-send-email-alan.maguire@oracle.com>
Message-ID: <CAF=yD-KkWQJDrjRH1mS0KcaWPANJ_Twwmhs-2R+=V2fMNj=0VA@mail.gmail.com>

On Mon, Apr 8, 2019 at 1:01 PM Alan Maguire <alan.maguire at oracle.com> wrote:
>
> commit 868d523535c2 ("bpf: add bpf_skb_adjust_room encap flags")
> introduced support to bpf_skb_adjust_room for GSO-friendly GRE
> and UDP encapsulation and later introduced associated test_tc_tunnel
> tests.  Here those tests are extended to cover UDP encapsulation also.
>
> Signed-off-by: Alan Maguire <alan.maguire at oracle.com>

> +       struct v4hdr h_outer;
> +       struct udphdr *udph;

nit: unused?

>  # serverside, insert decap module
>  # server is still running
>  # client can connect again
> -ip netns exec "${ns2}" ip link add dev testtun0 type "${tuntype}" \
> -       remote "${addr1}" local "${addr2}"
> -# Because packets are decapped by the tunnel they arrive on testtun0 from
> -# the IP stack perspective.  Ensure reverse path filtering is disabled
> -# otherwise we drop the TCP SYN as arriving on testtun0 instead of the
> -# expected veth2 (veth2 is where 192.168.1.2 is configured).
> +
> +if [[ "$tuntype" =~ "udp" ]]; then
> +       # Set up fou tunnel.
> +       ttype="${foutype}"
> +       targs="encap fou encap-sport auto encap-dport $udpport"
> +       # fou may be a module; allow this to fail.
> +       modprobe "${foumod}" ||true
> +       ip netns exec "${ns2}" ip fou add port 5555 ipproto ${fouproto}
> +else
> +       ttype=$tuntype
> +       targs=""
> +fi
> +ip netns exec "${ns2}" ip link add name testtun0 type "${ttype}" \
> +       remote "${addr1}" local "${addr2}" $targs
> +# Because packets are decapped by the tunnel they arrive on testtun0
> +# from the IP stack perspective.  Ensure reverse path filtering is
> +# disabled otherwise we drop the TCP SYN as arriving on testtun0
> +# instead of the expected veth2 (veth2 is where 192.168.1.2 is
> +# configured).

nit: these lines are not really part of the change

>  ip netns exec "${ns2}" sysctl -qw net.ipv4.conf.all.rp_filter=0
>  # rp needs to be disabled for both all and testtun0 as the rp value is
>  # selected as the max of the "all" and device-specific values.
> @@ -172,13 +208,13 @@ ip netns exec "${ns2}" ip link set dev testtun0 up
>  echo "test bpf encap with tunnel device decap"
>  client_connect
>  verify_data
> +ip netns exec "${ns2}" ip link del dev testtun0
>
> +server_listen
>  # serverside, use BPF for decap
> -ip netns exec "${ns2}" ip link del dev testtun0

nit: not needed to move this outside of this block.


>  ip netns exec "${ns2}" tc qdisc add dev veth2 clsact
>  ip netns exec "${ns2}" tc filter add dev veth2 ingress \
>         bpf direct-action object-file ./test_tc_tunnel.o section decap
> -server_listen
>  echo "test bpf encap with bpf decap"
>  client_connect
>  verify_data
> --
> 1.8.3.1
>

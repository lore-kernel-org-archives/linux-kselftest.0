From: willemdebruijn.kernel@gmail.com (Willem de Bruijn)
Date: Mon, 25 Mar 2019 09:17:02 -0400
Subject: [PATCH bpf-next] bpf: test_tc_tunnel.sh needs reverse path
 filtering disabled
In-Reply-To: <alpine.LRH.2.20.1903250930270.2818@dhcp-10-175-167-141.vpn.oracle.com>
References: <alpine.LRH.2.20.1903250930270.2818@dhcp-10-175-167-141.vpn.oracle.com>
Message-ID:
 <CAF=yD-KJrFPoA26VvLhu-myeFHJErShYz4Fmx9h3G0o8eOTwGw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190325131702.sqm9VDGqfKFTu06BxeyVjEyxShJzPTRJegWc-yV6VS8@z>

On Mon, Mar 25, 2019@5:36 AM Alan Maguire <alan.maguire@oracle.com> wrote:
>
> test_tc_tunnel.sh sets up a pair of namespaces connected by a
> veth pair to verify encap/decap using bpf_skb_adjust_room.  In
> testing this, it uses tunnel links as the peer of the bpf-based
> encap/decap.  However because the same IP header is used for inner
> and outer IP, when packets arrive at the tunnel interface they will
> be dropped by reverse path filtering as those packets are expected
> on the veth interface (where the destination IP of the decapped
> packet is configured).
>
> To avoid this, ensure reverse path filtering is disabled for the
> namespace using tunneling.
>
> Fixes: 98cdabcd0798 ("selftests/bpf: bpf tunnel encap test")
> Signed-off-by: Alan Maguire <alan.maguire at oracle.com>

Acked-by: Willem de Bruijn <willemb at google.com>

Thanks, Alan. Indeed, I had been developing on a platform with reverse
path filter off by default (debian stretch).

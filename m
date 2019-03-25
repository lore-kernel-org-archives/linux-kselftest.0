From: daniel@iogearbox.net (Daniel Borkmann)
Date: Mon, 25 Mar 2019 15:03:34 +0100
Subject: [PATCH bpf-next] bpf: test_tc_tunnel.sh needs reverse path
 filtering disabled
In-Reply-To: <alpine.LRH.2.20.1903250930270.2818@dhcp-10-175-167-141.vpn.oracle.com>
References: <alpine.LRH.2.20.1903250930270.2818@dhcp-10-175-167-141.vpn.oracle.com>
Message-ID: <43e1c55b-3072-ce55-460b-279187dba2c2@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190325140334.a3XRiqI_aDoD89XGYmVmKs0CvcNwYY0XBDazfXeJyH8@z>

On 03/25/2019 10:36 AM, Alan Maguire wrote:
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

Applied, thanks!

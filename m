From: alan.maguire@oracle.com (Alan Maguire)
Date: Mon, 25 Mar 2019 09:36:37 +0000 (GMT)
Subject: [PATCH bpf-next] bpf: test_tc_tunnel.sh needs reverse path filtering
 disabled
Message-ID:
 <alpine.LRH.2.20.1903250930270.2818@dhcp-10-175-167-141.vpn.oracle.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190325093637.r3_-NqcZ10zJ7uDhVSL-rZY5Jb_2JMl55yIgtJcuqos@z>

test_tc_tunnel.sh sets up a pair of namespaces connected by a
veth pair to verify encap/decap using bpf_skb_adjust_room.  In
testing this, it uses tunnel links as the peer of the bpf-based
encap/decap.  However because the same IP header is used for inner
and outer IP, when packets arrive at the tunnel interface they will
be dropped by reverse path filtering as those packets are expected
on the veth interface (where the destination IP of the decapped
packet is configured).

To avoid this, ensure reverse path filtering is disabled for the
namespace using tunneling.

Fixes: 98cdabcd0798 ("selftests/bpf: bpf tunnel encap test")
Signed-off-by: Alan Maguire <alan.maguire at oracle.com>
---
 tools/testing/selftests/bpf/test_tc_tunnel.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/bpf/test_tc_tunnel.sh b/tools/testing/selftests/bpf/test_tc_tunnel.sh
index dcf3206..c805adb 100755
--- a/tools/testing/selftests/bpf/test_tc_tunnel.sh
+++ b/tools/testing/selftests/bpf/test_tc_tunnel.sh
@@ -160,6 +160,14 @@ server_listen
 # client can connect again
 ip netns exec "${ns2}" ip link add dev testtun0 type "${tuntype}" \
 	remote "${addr1}" local "${addr2}"
+# Because packets are decapped by the tunnel they arrive on testtun0 from
+# the IP stack perspective.  Ensure reverse path filtering is disabled
+# otherwise we drop the TCP SYN as arriving on testtun0 instead of the
+# expected veth2 (veth2 is where 192.168.1.2 is configured).
+ip netns exec "${ns2}" sysctl -qw net.ipv4.conf.all.rp_filter=0
+# rp needs to be disabled for both all and testtun0 as the rp value is
+# selected as the max of the "all" and device-specific values.
+ip netns exec "${ns2}" sysctl -qw net.ipv4.conf.testtun0.rp_filter=0
 ip netns exec "${ns2}" ip link set dev testtun0 up
 echo "test bpf encap with tunnel device decap"
 client_connect
-- 
1.8.3.1

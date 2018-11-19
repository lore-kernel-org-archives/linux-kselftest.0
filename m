From: idosch@mellanox.com (Ido Schimmel)
Date: Mon, 19 Nov 2018 16:11:24 +0000
Subject: [PATCH net-next 15/18] selftests: forwarding: vxlan_bridge_1d: Add an
 ECN decap test
In-Reply-To: <20181119161006.5405-1-idosch@mellanox.com>
References: <20181119161006.5405-1-idosch@mellanox.com>
Message-ID: <20181119161006.5405-16-idosch@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181119161124.2UFncHd5zUNw_jNBfTUWa0zWRSKMevGF6peNpr_mDG0@z>

From: Petr Machata <petrm@mellanox.com>

Test that when decapsulating from VXLAN, the values of inner and outer
TOS are handled appropriately. Because VXLAN driver on its own won't
produce the arbitrary TOS combinations necessary to test this feature,
simply open-code a single ICMP packet and have mausezahn assemble it.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 .../net/forwarding/vxlan_bridge_1d.sh         | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
index 82a124cbd523..5cc6ac74eb74 100755
--- a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
+++ b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
@@ -71,6 +71,7 @@ export VXPORT
 	test_ttl
 	test_tos
 	test_ecn_encap
+	test_ecn_decap
 	reapply_config
 	ping_ipv4
 	test_flood
@@ -547,6 +548,121 @@ test_ecn_encap()
 	__test_ecn_encap 0x03 0x02
 }
 
+vxlan_encapped_ping_do()
+{
+	local count=$1; shift
+	local dev=$1; shift
+	local next_hop_mac=$1; shift
+	local dest_ip=$1; shift
+	local dest_mac=$1; shift
+	local inner_tos=$1; shift
+	local outer_tos=$1; shift
+
+	$MZ $dev -c $count -d 100msec -q \
+		-b $next_hop_mac -B $dest_ip \
+		-t udp tos=$outer_tos,sp=23456,dp=$VXPORT,p=$(:
+		    )"08:"$(                      : VXLAN flags
+		    )"00:00:00:"$(                : VXLAN reserved
+		    )"00:03:e8:"$(                : VXLAN VNI
+		    )"00:"$(                      : VXLAN reserved
+		    )"$dest_mac:"$(               : ETH daddr
+		    )"$(mac_get w2):"$(           : ETH saddr
+		    )"08:00:"$(                   : ETH type
+		    )"45:"$(                      : IP version + IHL
+		    )"$inner_tos:"$(              : IP TOS
+		    )"00:54:"$(                   : IP total length
+		    )"99:83:"$(                   : IP identification
+		    )"40:00:"$(                   : IP flags + frag off
+		    )"40:"$(                      : IP TTL
+		    )"01:"$(                      : IP proto
+		    )"00:00:"$(                   : IP header csum
+		    )"c0:00:02:03:"$(             : IP saddr: 192.0.2.3
+		    )"c0:00:02:01:"$(             : IP daddr: 192.0.2.1
+		    )"08:"$(                      : ICMP type
+		    )"00:"$(                      : ICMP code
+		    )"8b:f2:"$(                   : ICMP csum
+		    )"1f:6a:"$(                   : ICMP request identifier
+		    )"00:01:"$(                   : ICMP request sequence number
+		    )"4f:ff:c5:5b:00:00:00:00:"$( : ICMP payload
+		    )"6d:74:0b:00:00:00:00:00:"$( :
+		    )"10:11:12:13:14:15:16:17:"$( :
+		    )"18:19:1a:1b:1c:1d:1e:1f:"$( :
+		    )"20:21:22:23:24:25:26:27:"$( :
+		    )"28:29:2a:2b:2c:2d:2e:2f:"$( :
+		    )"30:31:32:33:34:35:36:37"
+}
+export -f vxlan_encapped_ping_do
+
+vxlan_encapped_ping_test()
+{
+	local ping_dev=$1; shift
+	local nh_dev=$1; shift
+	local ping_dip=$1; shift
+	local inner_tos=$1; shift
+	local outer_tos=$1; shift
+	local stat_get=$1; shift
+	local expect=$1; shift
+
+	local t0=$($stat_get)
+
+	in_ns ns1 \
+		vxlan_encapped_ping_do 10 $ping_dev $(mac_get $nh_dev) \
+			$ping_dip $(mac_get $h1) \
+			$inner_tos $outer_tos
+
+	local t1=$($stat_get)
+	local delta=$((t1 - t0))
+
+	# Tolerate a couple stray extra packets.
+	((expect <= delta && delta <= expect + 2))
+	check_err $? "Expected to capture $expect packets, got $delta."
+}
+export -f vxlan_encapped_ping_test
+
+__test_ecn_decap()
+{
+	local orig_inner_tos=$1; shift
+	local orig_outer_tos=$1; shift
+	local decapped_tos=$1; shift
+
+	RET=0
+
+	tc filter add dev $h1 ingress pref 77 prot ip \
+		flower ip_tos $decapped_tos action pass
+	sleep 1
+	vxlan_encapped_ping_test v2 v1 192.0.2.17 \
+				 $orig_inner_tos $orig_outer_tos \
+				 "tc_rule_stats_get $h1 77 ingress" 10
+	tc filter del dev $h1 ingress pref 77
+
+	log_test "VXLAN: ECN decap: $orig_outer_tos/$orig_inner_tos->$decapped_tos"
+}
+
+test_ecn_decap_error()
+{
+	local orig_inner_tos=00
+	local orig_outer_tos=03
+
+	RET=0
+
+	vxlan_encapped_ping_test v2 v1 192.0.2.17 \
+				 $orig_inner_tos $orig_outer_tos \
+				 "link_stats_rx_errors_get vx1" 10
+
+	log_test "VXLAN: ECN decap: $orig_outer_tos/$orig_inner_tos->error"
+}
+
+test_ecn_decap()
+{
+	# In accordance with INET_ECN_decapsulate()
+	__test_ecn_decap 00 00 0x00
+	__test_ecn_decap 01 01 0x01
+	__test_ecn_decap 02 01 0x02
+	__test_ecn_decap 01 03 0x03
+	__test_ecn_decap 02 03 0x03
+	test_ecn_decap_error
+}
+
 test_all()
 {
 	echo "Running tests with UDP port $VXPORT"
-- 
2.19.1

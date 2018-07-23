From: petrm@mellanox.com (Petr Machata)
Date: Mon, 23 Jul 2018 12:33:08 +0200
Subject: [PATCH net-next] selftests: forwarding: gre_multipath: Drop IPv6 tests
Message-ID:
 <cf0e380baf6a6aa5cf384017e8d69fec79750cfe.1532341813.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180723103308.AC9TbeJmpaklpaOwjQP9iH6sYhZ24n3YTmjj3aG9vUo@z>

Support for device-only IPv6 multipath next hops was dropped in
commit 33bd5ac54dc4 ("net/ipv6: Revert attempt to simplify route replace
and append") and as of commit b5d2d75e079a ("net/ipv6: Do not allow
device only routes via the multipath API"), attempts to add a next hop
like that yield an explicit diagnostic.

Correspondingly, drop the IPv6 parts of GRE multipath test that are
supposed to test that code.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../selftests/net/forwarding/gre_multipath.sh      | 113 ++-------------------
 1 file changed, 6 insertions(+), 107 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/gre_multipath.sh b/tools/testing/selftests/net/forwarding/gre_multipath.sh
index 982cc8c23200..3b1e047f7617 100755
--- a/tools/testing/selftests/net/forwarding/gre_multipath.sh
+++ b/tools/testing/selftests/net/forwarding/gre_multipath.sh
@@ -8,14 +8,12 @@
 # | H1                      |
 # |               $h1 +     |
 # |      192.0.2.1/28 |     |
-# |  2001:db8:1::1/64 |     |
 # +-------------------|-----+
 #                     |
 # +-------------------|------------------------+
 # | SW1               |                        |
 # |              $ol1 +                        |
 # |      192.0.2.2/28                          |
-# |  2001:db8:1::2/64                          |
 # |                                            |
 # |  + g1a (gre)          + g1b (gre)          |
 # |    loc=192.0.2.65       loc=192.0.2.81     |
@@ -49,22 +47,17 @@
 # |                                            |
 # |              $ol2 +                        |
 # |     192.0.2.17/28 |                        |
-# |  2001:db8:2::1/64 |                        |
 # +-------------------|------------------------+
 #                     |
 # +-------------------|-----+
 # | H2                |     |
 # |               $h2 +     |
 # |     192.0.2.18/28       |
-# |  2001:db8:2::2/64       |
 # +-------------------------+
 
 ALL_TESTS="
 	ping_ipv4
-	ping_ipv6
 	multipath_ipv4
-	multipath_ipv6
-	multipath_ipv6_l4
 "
 
 NUM_NETIFS=6
@@ -74,19 +67,17 @@ h1_create()
 {
 	simple_if_init $h1 192.0.2.1/28 2001:db8:1::1/64
 	ip route add vrf v$h1 192.0.2.16/28 via 192.0.2.2
-	ip route add vrf v$h1 2001:db8:2::/64 via 2001:db8:1::2
 }
 
 h1_destroy()
 {
-	ip route del vrf v$h1 2001:db8:2::/64 via 2001:db8:1::2
 	ip route del vrf v$h1 192.0.2.16/28 via 192.0.2.2
 	simple_if_fini $h1 192.0.2.1/28
 }
 
 sw1_create()
 {
-	simple_if_init $ol1 192.0.2.2/28 2001:db8:1::2/64
+	simple_if_init $ol1 192.0.2.2/28
 	__simple_if_init $ul1 v$ol1
 	vlan_create $ul1 111 v$ol1 192.0.2.129/28
 	vlan_create $ul1 222 v$ol1 192.0.2.145/28
@@ -102,9 +93,6 @@ sw1_create()
 	ip route add vrf v$ol1 192.0.2.16/28 \
 	   nexthop dev g1a \
 	   nexthop dev g1b
-	ip route add vrf v$ol1 2001:db8:2::/64 \
-	   nexthop dev g1a \
-	   nexthop dev g1b
 
 	tc qdisc add dev $ul1 clsact
 	tc filter add dev $ul1 egress pref 111 prot 802.1q \
@@ -117,7 +105,6 @@ sw1_destroy()
 {
 	tc qdisc del dev $ul1 clsact
 
-	ip route del vrf v$ol1 2001:db8:2::/64
 	ip route del vrf v$ol1 192.0.2.16/28
 
 	ip route del vrf v$ol1 192.0.2.82/32 via 192.0.2.146
@@ -131,12 +118,12 @@ sw1_destroy()
 	vlan_destroy $ul1 222
 	vlan_destroy $ul1 111
 	__simple_if_fini $ul1
-	simple_if_fini $ol1 192.0.2.2/28 2001:db8:1::2/64
+	simple_if_fini $ol1 192.0.2.2/28
 }
 
 sw2_create()
 {
-	simple_if_init $ol2 192.0.2.17/28 2001:db8:2::1/64
+	simple_if_init $ol2 192.0.2.17/28
 	__simple_if_init $ul2 v$ol2
 	vlan_create $ul2 111 v$ol2 192.0.2.130/28
 	vlan_create $ul2 222 v$ol2 192.0.2.146/28
@@ -152,14 +139,10 @@ sw2_create()
 	ip route add vrf v$ol2 192.0.2.0/28 \
 	   nexthop dev g2a \
 	   nexthop dev g2b
-	ip route add vrf v$ol2 2001:db8:1::/64 \
-	   nexthop dev g2a \
-	   nexthop dev g2b
 }
 
 sw2_destroy()
 {
-	ip route del vrf v$ol2 2001:db8:1::/64
 	ip route del vrf v$ol2 192.0.2.0/28
 
 	ip route del vrf v$ol2 192.0.2.81/32 via 192.0.2.145
@@ -173,21 +156,19 @@ sw2_destroy()
 	vlan_destroy $ul2 222
 	vlan_destroy $ul2 111
 	__simple_if_fini $ul2
-	simple_if_fini $ol2 192.0.2.17/28 2001:db8:2::1/64
+	simple_if_fini $ol2 192.0.2.17/28
 }
 
 h2_create()
 {
-	simple_if_init $h2 192.0.2.18/28 2001:db8:2::2/64
+	simple_if_init $h2 192.0.2.18/28
 	ip route add vrf v$h2 192.0.2.0/28 via 192.0.2.17
-	ip route add vrf v$h2 2001:db8:1::/64 via 2001:db8:2::1
 }
 
 h2_destroy()
 {
-	ip route del vrf v$h2 2001:db8:1::/64 via 2001:db8:2::1
 	ip route del vrf v$h2 192.0.2.0/28 via 192.0.2.17
-	simple_if_fini $h2 192.0.2.18/28 2001:db8:2::2/64
+	simple_if_fini $h2 192.0.2.18/28
 }
 
 setup_prepare()
@@ -250,77 +231,11 @@ multipath4_test()
 	sysctl_restore net.ipv4.fib_multipath_hash_policy
 }
 
-multipath6_l4_test()
-{
-	local what=$1; shift
-	local weight1=$1; shift
-	local weight2=$1; shift
-
-	sysctl_set net.ipv6.fib_multipath_hash_policy 1
-	ip route replace vrf v$ol1 2001:db8:2::/64 \
-	   nexthop dev g1a weight $weight1 \
-	   nexthop dev g1b weight $weight2
-
-	local t0_111=$(tc_rule_stats_get $ul1 111 egress)
-	local t0_222=$(tc_rule_stats_get $ul1 222 egress)
-
-	ip vrf exec v$h1 \
-	   $MZ $h1 -6 -q -p 64 -A 2001:db8:1::1 -B 2001:db8:2::2 \
-	       -d 1msec -t udp "sp=1024,dp=0-32768"
-
-	local t1_111=$(tc_rule_stats_get $ul1 111 egress)
-	local t1_222=$(tc_rule_stats_get $ul1 222 egress)
-
-	local d111=$((t1_111 - t0_111))
-	local d222=$((t1_222 - t0_222))
-	multipath_eval "$what" $weight1 $weight2 $d111 $d222
-
-	ip route replace vrf v$ol1 2001:db8:2::/64 \
-	   nexthop dev g1a \
-	   nexthop dev g1b
-	sysctl_restore net.ipv6.fib_multipath_hash_policy
-}
-
-multipath6_test()
-{
-	local what=$1; shift
-	local weight1=$1; shift
-	local weight2=$1; shift
-
-	ip route replace vrf v$ol1 2001:db8:2::/64 \
-	   nexthop dev g1a weight $weight1 \
-	   nexthop dev g1b weight $weight2
-
-	local t0_111=$(tc_rule_stats_get $ul1 111 egress)
-	local t0_222=$(tc_rule_stats_get $ul1 222 egress)
-
-        # Generate 16384 echo requests, each with a random flow label.
-	for ((i=0; i < 16384; ++i)); do
-		ip vrf exec v$h1 $PING6 2001:db8:2::2 -F 0 -c 1 -q &> /dev/null
-	done
-
-	local t1_111=$(tc_rule_stats_get $ul1 111 egress)
-	local t1_222=$(tc_rule_stats_get $ul1 222 egress)
-
-	local d111=$((t1_111 - t0_111))
-	local d222=$((t1_222 - t0_222))
-	multipath_eval "$what" $weight1 $weight2 $d111 $d222
-
-	ip route replace vrf v$ol1 2001:db8:2::/64 \
-	   nexthop dev g1a \
-	   nexthop dev g1b
-}
-
 ping_ipv4()
 {
 	ping_test $h1 192.0.2.18
 }
 
-ping_ipv6()
-{
-	ping6_test $h1 2001:db8:2::2
-}
-
 multipath_ipv4()
 {
 	log_info "Running IPv4 multipath tests"
@@ -329,22 +244,6 @@ multipath_ipv4()
 	multipath4_test "Weighted MP 11:45" 11 45
 }
 
-multipath_ipv6()
-{
-	log_info "Running IPv6 multipath tests"
-	multipath6_test "ECMP" 1 1
-	multipath6_test "Weighted MP 2:1" 2 1
-	multipath6_test "Weighted MP 11:45" 11 45
-}
-
-multipath_ipv6_l4()
-{
-	log_info "Running IPv6 L4 hash multipath tests"
-	multipath6_l4_test "ECMP" 1 1
-	multipath6_l4_test "Weighted MP 2:1" 2 1
-	multipath6_l4_test "Weighted MP 11:45" 11 45
-}
-
 trap cleanup EXIT
 
 setup_prepare
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

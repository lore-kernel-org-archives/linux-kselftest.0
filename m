From: petrm at mellanox.com (Petr Machata)
Date: Thu, 03 May 2018 12:37:13 +0200
Subject: [PATCH net-next mlxsw 2/3] selftests: forwarding: Use sysctl_set(),
 sysctl_restore()
In-Reply-To: <cover.1525343276.git.petrm@mellanox.com>
References: <cover.1525343276.git.petrm@mellanox.com>
Message-ID: <67a3198c509636683bee16954eda1034265b3726.1525343276.git.petrm@mellanox.com>

Instead of hand-managing the sysctl set and restore, use the wrappers
sysctl_set() and sysctl_restore() to do the bookkeeping automatically.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh                | 11 ++++-------
 tools/testing/selftests/net/forwarding/mirror_gre_changes.sh |  7 ++-----
 tools/testing/selftests/net/forwarding/router_multipath.sh   | 12 ++++--------
 3 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 426b294..a7a6750 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -420,17 +420,14 @@ sysctl_restore()
 
 forwarding_enable()
 {
-       ipv4_fwd=$(sysctl -n net.ipv4.conf.all.forwarding)
-       ipv6_fwd=$(sysctl -n net.ipv6.conf.all.forwarding)
-
-       sysctl -q -w net.ipv4.conf.all.forwarding=1
-       sysctl -q -w net.ipv6.conf.all.forwarding=1
+	sysctl_set net.ipv4.conf.all.forwarding 1
+	sysctl_set net.ipv6.conf.all.forwarding 1
 }
 
 forwarding_restore()
 {
-       sysctl -q -w net.ipv6.conf.all.forwarding=$ipv6_fwd
-       sysctl -q -w net.ipv4.conf.all.forwarding=$ipv4_fwd
+	sysctl_restore net.ipv6.conf.all.forwarding
+	sysctl_restore net.ipv4.conf.all.forwarding
 }
 
 tc_offload_check()
diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh b/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh
index fdb612f..50ab346 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh
@@ -36,9 +36,7 @@ setup_prepare()
 
 	# This test downs $swp3, which deletes the configured IPv6 address
 	# unless this sysctl is set.
-	local key=net.ipv6.conf.$swp3.keep_addr_on_down
-	SWP3_KEEP_ADDR_ON_DOWN=$(sysctl -n $key)
-	sysctl -qw $key=1
+	sysctl_set net.ipv6.conf.$swp3.keep_addr_on_down 1
 
 	ip address add dev $swp3 192.0.2.129/28
 	ip address add dev $h3 192.0.2.130/28
@@ -57,8 +55,7 @@ cleanup()
 	ip address del dev $h3 192.0.2.130/28
 	ip address del dev $swp3 192.0.2.129/28
 
-	local key=net.ipv6.conf.$swp3.keep_addr_on_down
-	sysctl -qw $key=$SWP3_KEEP_ADDR_ON_DOWN
+	sysctl_restore net.ipv6.conf.$swp3.keep_addr_on_down
 
 	mirror_gre_topo_destroy
 	vrf_cleanup
diff --git a/tools/testing/selftests/net/forwarding/router_multipath.sh b/tools/testing/selftests/net/forwarding/router_multipath.sh
index 6c43762..8b6d0fb 100755
--- a/tools/testing/selftests/net/forwarding/router_multipath.sh
+++ b/tools/testing/selftests/net/forwarding/router_multipath.sh
@@ -205,13 +205,11 @@ multipath4_test()
        local weight_rp13=$3
        local t0_rp12 t0_rp13 t1_rp12 t1_rp13
        local packets_rp12 packets_rp13
-       local hash_policy
 
        # Transmit multiple flows from h1 to h2 and make sure they are
        # distributed between both multipath links (rp12 and rp13)
        # according to the configured weights.
-       hash_policy=$(sysctl -n net.ipv4.fib_multipath_hash_policy)
-       sysctl -q -w net.ipv4.fib_multipath_hash_policy=1
+       sysctl_set net.ipv4.fib_multipath_hash_policy 1
        ip route replace 198.51.100.0/24 vrf vrf-r1 \
                nexthop via 169.254.2.22 dev $rp12 weight $weight_rp12 \
                nexthop via 169.254.3.23 dev $rp13 weight $weight_rp13
@@ -233,7 +231,7 @@ multipath4_test()
        ip route replace 198.51.100.0/24 vrf vrf-r1 \
                nexthop via 169.254.2.22 dev $rp12 \
                nexthop via 169.254.3.23 dev $rp13
-       sysctl -q -w net.ipv4.fib_multipath_hash_policy=$hash_policy
+       sysctl_restore net.ipv4.fib_multipath_hash_policy
 }
 
 multipath6_l4_test()
@@ -243,13 +241,11 @@ multipath6_l4_test()
        local weight_rp13=$3
        local t0_rp12 t0_rp13 t1_rp12 t1_rp13
        local packets_rp12 packets_rp13
-       local hash_policy
 
        # Transmit multiple flows from h1 to h2 and make sure they are
        # distributed between both multipath links (rp12 and rp13)
        # according to the configured weights.
-       hash_policy=$(sysctl -n net.ipv6.fib_multipath_hash_policy)
-       sysctl -q -w net.ipv6.fib_multipath_hash_policy=1
+       sysctl_set net.ipv6.fib_multipath_hash_policy 1
 
        ip route replace 2001:db8:2::/64 vrf vrf-r1 \
 	       nexthop via fe80:2::22 dev $rp12 weight $weight_rp12 \
@@ -272,7 +268,7 @@ multipath6_l4_test()
 	       nexthop via fe80:2::22 dev $rp12 \
 	       nexthop via fe80:3::23 dev $rp13
 
-       sysctl -q -w net.ipv6.fib_multipath_hash_policy=$hash_policy
+       sysctl_restore net.ipv6.fib_multipath_hash_policy
 }
 
 multipath6_test()
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

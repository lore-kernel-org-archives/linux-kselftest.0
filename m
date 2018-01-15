From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 15 Jan 2018 21:18:48 +0200
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 07/12] selftests:
	forwarding: Test IPv6 weighted nexthops
In-Reply-To: <20180115191853.26129-1-idosch@mellanox.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
Message-ID: <20180115191853.26129-8-idosch@mellanox.com>

Have one host generate 16K IPv6 echo requests with a random flow label
and check that they are distributed between both multipath links
according to the provided weights.

Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 .../selftests/forwarding/router_multipath.sh       | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/testing/selftests/forwarding/router_multipath.sh b/tools/testing/selftests/forwarding/router_multipath.sh
index 45c5fc0a6448..58f6e75c627e 100755
--- a/tools/testing/selftests/forwarding/router_multipath.sh
+++ b/tools/testing/selftests/forwarding/router_multipath.sh
@@ -219,12 +219,47 @@ multipath4_test()
        sysctl -w -q net.ipv4.fib_multipath_hash_policy=$hash_policy
 }
 
+multipath6_test()
+{
+       local t0_rp12 t0_rp13 t1_rp12 t1_rp13
+       local weight_rp12=$1 weight_rp13=$2
+       local packets_rp12 packets_rp13
+
+       ip route replace 2001:db8:2::/64 vrf vrf-r1 \
+	       nexthop via fe80:2::22 dev $rp12 weight $weight_rp12 \
+	       nexthop via fe80:3::23 dev $rp13 weight $weight_rp13
+
+       t0_rp12=$(link_stats_tx_packets_get $rp12)
+       t0_rp13=$(link_stats_tx_packets_get $rp13)
+
+       # Generate 16384 echo requests, each with a random flow label.
+       for _ in $(seq 1 16384); do
+	       ip vrf exec vrf-h1 ping 2001:db8:2::2 -F 0 -c 1 -q &> /dev/null
+       done
+
+       t1_rp12=$(link_stats_tx_packets_get $rp12)
+       t1_rp13=$(link_stats_tx_packets_get $rp13)
+
+       let "packets_rp12 = $t1_rp12 - $t0_rp12"
+       let "packets_rp13 = $t1_rp13 - $t0_rp13"
+       multipath_eval $weight_rp12 $weight_rp13 $packets_rp12 $packets_rp13
+
+       ip route replace 2001:db8:2::/64 vrf vrf-r1 \
+	       nexthop via fe80:2::22 dev $rp12 \
+	       nexthop via fe80:3::23 dev $rp13
+}
+
 multipath_test()
 {
        echo "Performing IPv4 multipath tests"
        multipath4_test 1 1
        multipath4_test 2 1
        multipath4_test 11 45
+
+       echo "Performing IPv6 multipath tests"
+       multipath6_test 1 1
+       multipath6_test 2 1
+       multipath6_test 11 45
 }
 
 setup_prepare()
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

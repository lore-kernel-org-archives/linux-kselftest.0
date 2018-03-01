From: dsahern at gmail.com (David Ahern)
Date: Thu,  1 Mar 2018 11:09:47 -0800
Subject: [PATCH net-next 5/5] selftests: forwarding: Add description to the
 multipath tests
In-Reply-To: <20180301190947.7299-1-dsahern@gmail.com>
References: <20180301190947.7299-1-dsahern@gmail.com>
Message-ID: <20180301190947.7299-6-dsahern@gmail.com>

Add a better description to the summary for multipath tests. e.g.,

INFO: Running IPv6 multipath tests
TEST: Multipath: ECMP                                               [PASS]
INFO: Expected ratio 1.00 Measured ratio 1.02
TEST: Multipath: Weighted MP 2:1                                    [PASS]
INFO: Expected ratio 2.00 Measured ratio 2.02
TEST: Multipath: Weighted MP 11:45                                  [PASS]
INFO: Expected ratio 4.09 Measured ratio 4.03

Signed-off-by: David Ahern <dsahern at gmail.com>
---
 .../selftests/net/forwarding/router_multipath.sh   | 37 ++++++++++++----------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/router_multipath.sh b/tools/testing/selftests/net/forwarding/router_multipath.sh
index e227ec052804..f03f628b6dd6 100755
--- a/tools/testing/selftests/net/forwarding/router_multipath.sh
+++ b/tools/testing/selftests/net/forwarding/router_multipath.sh
@@ -161,10 +161,11 @@ router2_destroy()
 
 multipath_eval()
 {
-       local weight_rp12=$1
-       local weight_rp13=$2
-       local packets_rp12=$3
-       local packets_rp13=$4
+       local desc="$1"
+       local weight_rp12=$2
+       local weight_rp13=$3
+       local packets_rp12=$4
+       local packets_rp13=$5
        local weights_ratio packets_ratio diff
 
        RET=0
@@ -193,14 +194,15 @@ multipath_eval()
 
        test "$(echo "$diff / $weights_ratio > 0.1" | bc -l)" -eq 0
        check_err $? "Too large discrepancy between expected and measured ratios"
-       log_test "Multipath"
+       log_test "$desc"
        log_info "Expected ratio $weights_ratio Measured ratio $packets_ratio"
 }
 
 multipath4_test()
 {
-       local weight_rp12=$1
-       local weight_rp13=$2
+       local desc="$1"
+       local weight_rp12=$2
+       local weight_rp13=$3
        local t0_rp12 t0_rp13 t1_rp12 t1_rp13
        local packets_rp12 packets_rp13
        local hash_policy
@@ -225,7 +227,7 @@ multipath4_test()
 
        let "packets_rp12 = $t1_rp12 - $t0_rp12"
        let "packets_rp13 = $t1_rp13 - $t0_rp13"
-       multipath_eval $weight_rp12 $weight_rp13 $packets_rp12 $packets_rp13
+       multipath_eval "$desc" $weight_rp12 $weight_rp13 $packets_rp12 $packets_rp13
 
        # Restore settings.
        ip route replace 198.51.100.0/24 vrf vrf-r1 \
@@ -236,8 +238,9 @@ multipath4_test()
 
 multipath6_test()
 {
-       local weight_rp12=$1
-       local weight_rp13=$2
+       local desc="$1"
+       local weight_rp12=$2
+       local weight_rp13=$3
        local t0_rp12 t0_rp13 t1_rp12 t1_rp13
        local packets_rp12 packets_rp13
 
@@ -258,7 +261,7 @@ multipath6_test()
 
        let "packets_rp12 = $t1_rp12 - $t0_rp12"
        let "packets_rp13 = $t1_rp13 - $t0_rp13"
-       multipath_eval $weight_rp12 $weight_rp13 $packets_rp12 $packets_rp13
+       multipath_eval "$desc" $weight_rp12 $weight_rp13 $packets_rp12 $packets_rp13
 
        ip route replace 2001:db8:2::/64 vrf vrf-r1 \
 	       nexthop via fe80:2::22 dev $rp12 \
@@ -268,14 +271,14 @@ multipath6_test()
 multipath_test()
 {
 	log_info "Running IPv4 multipath tests"
-	multipath4_test 1 1
-	multipath4_test 2 1
-	multipath4_test 11 45
+	multipath4_test "ECMP" 1 1
+	multipath4_test "Weighted MP 2:1" 2 1
+	multipath4_test "Weighted MP 11:45" 11 45
 
 	log_info "Running IPv6 multipath tests"
-	multipath6_test 1 1
-	multipath6_test 2 1
-	multipath6_test 11 45
+	multipath6_test "ECMP" 1 1
+	multipath6_test "Weighted MP 2:1" 2 1
+	multipath6_test "Weighted MP 11:45" 11 45
 }
 
 setup_prepare()
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

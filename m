From: petrm at mellanox.com (Petr Machata)
Date: Tue, 26 Jun 2018 02:06:06 +0200
Subject: [PATCH net-next 1/6] selftests: forwarding: Move multipath_eval() to
 lib.sh
In-Reply-To: <cover.1529971148.git.petrm@mellanox.com>
References: <cover.1529971148.git.petrm@mellanox.com>
Message-ID: <1c9b763812fcda15c928f03a64e800aa670959b5.1529971148.git.petrm@mellanox.com>

This function will be useful for the GRE multipath test that is coming
later.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh      | 39 ++++++++++++++++++++++
 .../selftests/net/forwarding/router_multipath.sh   | 39 ----------------------
 2 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 7b18a53aa556..7fae805147ae 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -557,6 +557,45 @@ tests_run()
 	done
 }
 
+multipath_eval()
+{
+       local desc="$1"
+       local weight_rp12=$2
+       local weight_rp13=$3
+       local packets_rp12=$4
+       local packets_rp13=$5
+       local weights_ratio packets_ratio diff
+
+       RET=0
+
+       if [[ "$packets_rp12" -eq "0" || "$packets_rp13" -eq "0" ]]; then
+              check_err 1 "Packet difference is 0"
+              log_test "Multipath"
+              log_info "Expected ratio $weights_ratio"
+              return
+       fi
+
+       if [[ "$weight_rp12" -gt "$weight_rp13" ]]; then
+               weights_ratio=$(echo "scale=2; $weight_rp12 / $weight_rp13" \
+		       | bc -l)
+               packets_ratio=$(echo "scale=2; $packets_rp12 / $packets_rp13" \
+		       | bc -l)
+       else
+               weights_ratio=$(echo "scale=2; $weight_rp13 / $weight_rp12" | \
+		       bc -l)
+               packets_ratio=$(echo "scale=2; $packets_rp13 / $packets_rp12" | \
+		       bc -l)
+       fi
+
+       diff=$(echo $weights_ratio - $packets_ratio | bc -l)
+       diff=${diff#-}
+
+       test "$(echo "$diff / $weights_ratio > 0.15" | bc -l)" -eq 0
+       check_err $? "Too large discrepancy between expected and measured ratios"
+       log_test "$desc"
+       log_info "Expected ratio $weights_ratio Measured ratio $packets_ratio"
+}
+
 ##############################################################################
 # Tests
 
diff --git a/tools/testing/selftests/net/forwarding/router_multipath.sh b/tools/testing/selftests/net/forwarding/router_multipath.sh
index 8b6d0fb6d604..79a209927962 100755
--- a/tools/testing/selftests/net/forwarding/router_multipath.sh
+++ b/tools/testing/selftests/net/forwarding/router_multipath.sh
@@ -159,45 +159,6 @@ router2_destroy()
 	vrf_destroy "vrf-r2"
 }
 
-multipath_eval()
-{
-       local desc="$1"
-       local weight_rp12=$2
-       local weight_rp13=$3
-       local packets_rp12=$4
-       local packets_rp13=$5
-       local weights_ratio packets_ratio diff
-
-       RET=0
-
-       if [[ "$packets_rp12" -eq "0" || "$packets_rp13" -eq "0" ]]; then
-              check_err 1 "Packet difference is 0"
-              log_test "Multipath"
-              log_info "Expected ratio $weights_ratio"
-              return
-       fi
-
-       if [[ "$weight_rp12" -gt "$weight_rp13" ]]; then
-               weights_ratio=$(echo "scale=2; $weight_rp12 / $weight_rp13" \
-		       | bc -l)
-               packets_ratio=$(echo "scale=2; $packets_rp12 / $packets_rp13" \
-		       | bc -l)
-       else
-               weights_ratio=$(echo "scale=2; $weight_rp13 / $weight_rp12" | \
-		       bc -l)
-               packets_ratio=$(echo "scale=2; $packets_rp13 / $packets_rp12" | \
-		       bc -l)
-       fi
-
-       diff=$(echo $weights_ratio - $packets_ratio | bc -l)
-       diff=${diff#-}
-
-       test "$(echo "$diff / $weights_ratio > 0.15" | bc -l)" -eq 0
-       check_err $? "Too large discrepancy between expected and measured ratios"
-       log_test "$desc"
-       log_info "Expected ratio $weights_ratio Measured ratio $packets_ratio"
-}
-
 multipath4_test()
 {
        local desc="$1"
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

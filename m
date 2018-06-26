From: petrm@mellanox.com (Petr Machata)
Date: Tue, 26 Jun 2018 02:07:08 +0200
Subject: [PATCH net-next 2/6] selftests: forwarding: multipath_eval(): Improve
 style
In-Reply-To: <cover.1529971148.git.petrm@mellanox.com>
References: <cover.1529971148.git.petrm@mellanox.com>
Message-ID:
 <8fe4847c65e75c633f20740a8144e1d35944004a.1529971148.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180626000708.OA6YAHk888p_kyVlV6_UCpwdxkkG2RyEYspEUkmokn0@z>

- Change the indentation of the function body from 7 spaces to one tab.
- Move initialization of weights_ratio up so that it can be referenced
  from the error message about packet difference being zero.
- Move |'s consistently to continuation line, which reindent.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 74 ++++++++++++++-------------
 1 file changed, 39 insertions(+), 35 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 7fae805147ae..911d753c4ff0 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -559,41 +559,45 @@ tests_run()
 
 multipath_eval()
 {
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
+	local desc="$1"
+	local weight_rp12=$2
+	local weight_rp13=$3
+	local packets_rp12=$4
+	local packets_rp13=$5
+	local weights_ratio packets_ratio diff
+
+	RET=0
+
+	if [[ "$weight_rp12" -gt "$weight_rp13" ]]; then
+		weights_ratio=$(echo "scale=2; $weight_rp12 / $weight_rp13" \
+				| bc -l)
+	else
+		weights_ratio=$(echo "scale=2; $weight_rp13 / $weight_rp12" \
+				| bc -l)
+	fi
+
+	if [[ "$packets_rp12" -eq "0" || "$packets_rp13" -eq "0" ]]; then
+	       check_err 1 "Packet difference is 0"
+	       log_test "Multipath"
+	       log_info "Expected ratio $weights_ratio"
+	       return
+	fi
+
+	if [[ "$weight_rp12" -gt "$weight_rp13" ]]; then
+		packets_ratio=$(echo "scale=2; $packets_rp12 / $packets_rp13" \
+				| bc -l)
+	else
+		packets_ratio=$(echo "scale=2; $packets_rp13 / $packets_rp12" \
+				| bc -l)
+	fi
+
+	diff=$(echo $weights_ratio - $packets_ratio | bc -l)
+	diff=${diff#-}
+
+	test "$(echo "$diff / $weights_ratio > 0.15" | bc -l)" -eq 0
+	check_err $? "Too large discrepancy between expected and measured ratios"
+	log_test "$desc"
+	log_info "Expected ratio $weights_ratio Measured ratio $packets_ratio"
 }
 
 ##############################################################################
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

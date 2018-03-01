From: dsahern at gmail.com (David Ahern)
Date: Thu,  1 Mar 2018 13:49:31 -0800
Subject: [PATCH v2 net-next 2/4] selftests: forwarding: Handle 0 for packet
 difference in multipath tests
In-Reply-To: <20180301214933.20199-1-dsahern@gmail.com>
References: <20180301214933.20199-1-dsahern@gmail.com>
Message-ID: <20180301214933.20199-3-dsahern@gmail.com>

If the packet stats have a difference of 0, the test output shows:
INFO: Expected ratio 2.00 Measured ratio
Runtime error (func=(main), adr=9): Divide by zero
(standard_in) 2: syntax error
(standard_in) 1: syntax error
./router_multipath.sh: line 187: test: : integer expression expected
TEST: Multipath                                                     [FAIL]
	Too large discrepancy between expected and measured ratios

Handle the 0 and display a cleaner message:
INFO: Running IPv6 multipath tests
TEST: Multipath                                                     [FAIL]
	Packet difference is 0

Signed-off-by: David Ahern <dsahern at gmail.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/router_multipath.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/router_multipath.sh b/tools/testing/selftests/net/forwarding/router_multipath.sh
index d31888e3133e..c1a437c5b15f 100755
--- a/tools/testing/selftests/net/forwarding/router_multipath.sh
+++ b/tools/testing/selftests/net/forwarding/router_multipath.sh
@@ -168,6 +168,13 @@ multipath_eval()
 
        RET=0
 
+       if [[ "$packets_rp12" -eq "0" || "$packets_rp13" -eq "0" ]]; then
+              check_err 1 "Packet difference is 0"
+              log_test "Multipath"
+              log_info "Expected ratio $weights_ratio"
+              return
+       fi
+
        if [[ "$weight_rp12" -gt "$weight_rp13" ]]; then
                weights_ratio=$(echo "scale=2; $weight_rp12 / $weight_rp13" \
 		       | bc -l)
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

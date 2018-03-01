From: dsahern at gmail.com (David Ahern)
Date: Thu,  1 Mar 2018 13:49:32 -0800
Subject: [PATCH v2 net-next 3/4] selftests: forwarding: Use PING6 instead of
 ping for ipv6 multipath test
In-Reply-To: <20180301214933.20199-1-dsahern@gmail.com>
References: <20180301214933.20199-1-dsahern@gmail.com>
Message-ID: <20180301214933.20199-4-dsahern@gmail.com>

On Debian jessie ping can not handle IPv6 addresses so the command
fails. Use PING6 which is set to ping6.

Signed-off-by: David Ahern <dsahern at gmail.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/router_multipath.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/forwarding/router_multipath.sh b/tools/testing/selftests/net/forwarding/router_multipath.sh
index c1a437c5b15f..745fb40bfa44 100755
--- a/tools/testing/selftests/net/forwarding/router_multipath.sh
+++ b/tools/testing/selftests/net/forwarding/router_multipath.sh
@@ -249,7 +249,7 @@ multipath6_test()
 
        # Generate 16384 echo requests, each with a random flow label.
        for _ in $(seq 1 16384); do
-	       ip vrf exec vrf-h1 ping 2001:db8:2::2 -F 0 -c 1 -q &> /dev/null
+	       ip vrf exec vrf-h1 $PING6 2001:db8:2::2 -F 0 -c 1 -q &> /dev/null
        done
 
        t1_rp12=$(link_stats_tx_packets_get $rp12)
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

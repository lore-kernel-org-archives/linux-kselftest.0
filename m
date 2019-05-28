From: fklassen@appneta.com (Fred Klassen)
Date: Tue, 28 May 2019 11:47:07 -0700
Subject: [PATCH net-next v2 2/3] net/udpgso_bench.sh add UDP GSO audit tests
In-Reply-To: <20190528184708.16516-1-fklassen@appneta.com>
References: <20190528184708.16516-1-fklassen@appneta.com>
Message-ID: <20190528184708.16516-3-fklassen@appneta.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190528184707.wETSqX3ix18ZmzVPWZzcGDe96ool3QdzqoVkYkcYrXY@z>

Audit tests count the total number of messages sent and compares
with total number of CMSG received on error queue. Example:

    udp gso zerocopy timestamp audit
    udp rx:   1599 MB/s  1166414 calls/s
    udp tx:   1615 MB/s    27395 calls/s  27395 msg/s
    udp rx:   1634 MB/s  1192261 calls/s
    udp tx:   1633 MB/s    27699 calls/s  27699 msg/s
    udp rx:   1633 MB/s  1191358 calls/s
    udp tx:   1631 MB/s    27678 calls/s  27678 msg/s
    Summary over 4.000 seconds...
    sum udp tx:   1665 MB/s      82772 calls (27590/s)      82772 msgs (27590/s)
    Tx Timestamps:               82772 received                 0 errors
    Zerocopy acks:               82772 received                 0 errors

Errors are thrown if CMSG count does not equal send count,
example:

    Summary over 4.000 seconds...
    sum tcp tx:   7451 MB/s     493706 calls (123426/s)     493706 msgs (123426/s)
    ./udpgso_bench_tx: Unexpected number of Zerocopy completions:    493706 expected    493704 received

Also reduce individual test time from 4 to 3 seconds so that
overall test time does not increase significantly.

Signed-off-by: Fred Klassen <fklassen at appneta.com>
---
 tools/testing/selftests/net/udpgso_bench.sh | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/udpgso_bench.sh b/tools/testing/selftests/net/udpgso_bench.sh
index 5670a9ffd8eb..89c7de97b832 100755
--- a/tools/testing/selftests/net/udpgso_bench.sh
+++ b/tools/testing/selftests/net/udpgso_bench.sh
@@ -38,6 +38,18 @@ run_udp() {
 
 	echo "udp gso zerocopy"
 	run_in_netns ${args} -S 0 -z
+
+	echo "udp gso timestamp"
+	run_in_netns ${args} -S 0 -T
+
+	echo "udp gso zerocopy audit"
+	run_in_netns ${args} -S 0 -z -a
+
+	echo "udp gso timestamp audit"
+	run_in_netns ${args} -S 0 -T -a
+
+	echo "udp gso zerocopy timestamp audit"
+	run_in_netns ${args} -S 0 -T -z -a
 }
 
 run_tcp() {
@@ -48,10 +60,14 @@ run_tcp() {
 
 	echo "tcp zerocopy"
 	run_in_netns ${args} -t -z
+
+	# excluding for now because test fails intermittently
+	#echo "tcp zerocopy audit"
+	#run_in_netns ${args} -t -z -P -a
 }
 
 run_all() {
-	local -r core_args="-l 4"
+	local -r core_args="-l 3"
 	local -r ipv4_args="${core_args} -4 -D 127.0.0.1"
 	local -r ipv6_args="${core_args} -6 -D ::1"
 
-- 
2.11.0

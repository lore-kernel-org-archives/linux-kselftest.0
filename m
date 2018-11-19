From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 19 Nov 2018 16:11:13 +0000
Subject: [PATCH net-next 06/18] selftests: forwarding: lib: Add
 link_stats_rx_errors_get()
In-Reply-To: <20181119161006.5405-1-idosch@mellanox.com>
References: <20181119161006.5405-1-idosch@mellanox.com>
Message-ID: <20181119161006.5405-7-idosch@mellanox.com>

From: Petr Machata <petrm at mellanox.com>

Such a function will be useful for counting malformed packets in the ECN
decap test.

To that end, introduce a common handler for handling stat-fetching, and
reuse it in link_stats_tx_packets_get() and link_stats_rx_errors_get().

Signed-off-by: Petr Machata <petrm at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index e916663a1019..7af5a03bcb32 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -477,11 +477,24 @@ master_name_get()
 	ip -j link show dev $if_name | jq -r '.[]["master"]'
 }
 
+link_stats_get()
+{
+	local if_name=$1; shift
+	local dir=$1; shift
+	local stat=$1; shift
+
+	ip -j -s link show dev $if_name \
+		| jq '.[]["stats64"]["'$dir'"]["'$stat'"]'
+}
+
 link_stats_tx_packets_get()
 {
-       local if_name=$1
+	link_stats_get $1 tx packets
+}
 
-       ip -j -s link show dev $if_name | jq '.[]["stats64"]["tx"]["packets"]'
+link_stats_rx_errors_get()
+{
+	link_stats_get $1 rx errors
 }
 
 tc_rule_stats_get()
-- 
2.19.1

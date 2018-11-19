From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 19 Nov 2018 16:11:12 +0000
Subject: [PATCH net-next 05/18] selftests: forwarding: ping{6,}_do(): Allow
 passing ping arguments
In-Reply-To: <20181119161006.5405-1-idosch@mellanox.com>
References: <20181119161006.5405-1-idosch@mellanox.com>
Message-ID: <20181119161006.5405-6-idosch@mellanox.com>

From: Petr Machata <petrm at mellanox.com>

Make the ping routine more generic by allowing passing arbitrary ping
command-line arguments.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index fa734ddce2e9..e916663a1019 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -801,10 +801,11 @@ ping_do()
 {
 	local if_name=$1
 	local dip=$2
+	local args=$3
 	local vrf_name
 
 	vrf_name=$(master_name_get $if_name)
-	ip vrf exec $vrf_name $PING $dip -c 10 -i 0.1 -w 2 &> /dev/null
+	ip vrf exec $vrf_name $PING $args $dip -c 10 -i 0.1 -w 2 &> /dev/null
 }
 
 ping_test()
@@ -820,10 +821,11 @@ ping6_do()
 {
 	local if_name=$1
 	local dip=$2
+	local args=$3
 	local vrf_name
 
 	vrf_name=$(master_name_get $if_name)
-	ip vrf exec $vrf_name $PING6 $dip -c 10 -i 0.1 -w 2 &> /dev/null
+	ip vrf exec $vrf_name $PING6 $args $dip -c 10 -i 0.1 -w 2 &> /dev/null
 }
 
 ping6_test()
-- 
2.19.1

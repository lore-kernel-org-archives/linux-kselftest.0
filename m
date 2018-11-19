From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 19 Nov 2018 16:11:08 +0000
Subject: [PATCH net-next 02/18] selftests: forwarding: lib: Support NUM_NETIFS
 of 0
In-Reply-To: <20181119161006.5405-1-idosch@mellanox.com>
References: <20181119161006.5405-1-idosch@mellanox.com>
Message-ID: <20181119161006.5405-3-idosch@mellanox.com>

From: Petr Machata <petrm at mellanox.com>

So far the case of NUM_NETIFS of 0 has not been interesting. However if
one wishes to reuse the lib.sh routines in a setup of a separate
namespace, being able to import like this is handy.

Therefore replace the {1..$NUM_NETIFS} references, which cause iteration
over 1 and 0, with an explicit for loop like we do in setup_wait() and
tc_offload_check(), so that for NUM_NETIFS of 0 no iteration is done.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 85d253546684..bb0e9fdf893e 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -104,7 +104,7 @@ create_netif_veth()
 {
 	local i
 
-	for i in $(eval echo {1..$NUM_NETIFS}); do
+	for ((i = 1; i <= NUM_NETIFS; ++i)); do
 		local j=$((i+1))
 
 		ip link show dev ${NETIFS[p$i]} &> /dev/null
@@ -135,7 +135,7 @@ if [[ "$NETIF_CREATE" = "yes" ]]; then
 	create_netif
 fi
 
-for i in $(eval echo {1..$NUM_NETIFS}); do
+for ((i = 1; i <= NUM_NETIFS; ++i)); do
 	ip link show dev ${NETIFS[p$i]} &> /dev/null
 	if [[ $? -ne 0 ]]; then
 		echo "SKIP: could not find all required interfaces"
-- 
2.19.1

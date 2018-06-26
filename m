From: petrm@mellanox.com (Petr Machata)
Date: Tue, 26 Jun 2018 02:08:00 +0200
Subject: [PATCH net-next 4/6] selftests: forwarding: lib: Extract
 interface-init functions
In-Reply-To: <cover.1529971148.git.petrm@mellanox.com>
References: <cover.1529971148.git.petrm@mellanox.com>
Message-ID:
 <5c9a2c980ce03e57d6fc81e819fe2816a45f73fc.1529971148.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180626000800.p2hUfXTejCjfJ2NJeLoJ1r9gXhCXdjjlMiDlbpPfRnY@z>

The function simple_if_init() does two things: it creates a VRF, then
moves an interface into this VRF and configures addresses. The latter
comes in handy when adding more interfaces into a VRF later on. The
situation is similar for simple_if_fini().

Therefore split the interface remastering and address de/initialization
logic to a new pair of helpers __simple_if_init() / __simple_if_fini(),
and defer to these helpers from simple_if_init() and simple_if_fini().

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 32 +++++++++++++++++++++------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index f94ea4bafa13..1dfdf14894e2 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -287,6 +287,29 @@ __addr_add_del()
 	done
 }
 
+__simple_if_init()
+{
+	local if_name=$1; shift
+	local vrf_name=$1; shift
+	local addrs=("${@}")
+
+	ip link set dev $if_name master $vrf_name
+	ip link set dev $if_name up
+
+	__addr_add_del $if_name add "${addrs[@]}"
+}
+
+__simple_if_fini()
+{
+	local if_name=$1; shift
+	local addrs=("${@}")
+
+	__addr_add_del $if_name del "${addrs[@]}"
+
+	ip link set dev $if_name down
+	ip link set dev $if_name nomaster
+}
+
 simple_if_init()
 {
 	local if_name=$1
@@ -298,11 +321,8 @@ simple_if_init()
 	array=("${@}")
 
 	vrf_create $vrf_name
-	ip link set dev $if_name master $vrf_name
 	ip link set dev $vrf_name up
-	ip link set dev $if_name up
-
-	__addr_add_del $if_name add "${array[@]}"
+	__simple_if_init $if_name $vrf_name "${array[@]}"
 }
 
 simple_if_fini()
@@ -315,9 +335,7 @@ simple_if_fini()
 	vrf_name=v$if_name
 	array=("${@}")
 
-	__addr_add_del $if_name del "${array[@]}"
-
-	ip link set dev $if_name down
+	__simple_if_fini $if_name "${array[@]}"
 	vrf_destroy $vrf_name
 }
 
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

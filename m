From: petrm@mellanox.com (Petr Machata)
Date: Thu, 24 May 2018 16:27:26 +0200
Subject: [PATCH net-next 04/10] selftests: forwarding: lib: Support VLAN
 devices
In-Reply-To: <cover.1527171860.git.petrm@mellanox.com>
References: <cover.1527171860.git.petrm@mellanox.com>
Message-ID:
 <8f2315290ed342c054168a424962219b151a990c.1527171860.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180524142726.1oXPmRxY__Ux6eDLVUE6kXReEENtAHIkfQw2oEhFUK0@z>

Add vlan_create() and vlan_destroy() to manage VLAN netdevices.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index d5aa864..11c481c 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -362,6 +362,31 @@ tunnel_destroy()
 	ip link del dev $name
 }
 
+vlan_create()
+{
+	local if_name=$1; shift
+	local vid=$1; shift
+	local vrf=$1; shift
+	local ips=("${@}")
+	local name=$if_name.$vid
+
+	ip link add name $name link $if_name type vlan id $vid
+	if [ "$vrf" != "" ]; then
+		ip link set dev $name master $vrf
+	fi
+	ip link set dev $name up
+	__addr_add_del $name add "${ips[@]}"
+}
+
+vlan_destroy()
+{
+	local if_name=$1; shift
+	local vid=$1; shift
+	local name=$if_name.$vid
+
+	ip link del dev $name
+}
+
 master_name_get()
 {
 	local if_name=$1
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

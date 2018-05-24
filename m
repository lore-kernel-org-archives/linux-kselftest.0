From: petrm at mellanox.com (Petr Machata)
Date: Thu, 24 May 2018 16:27:10 +0200
Subject: [PATCH net-next 01/10] selftests: forwarding: Split
 mirror_gre_topo_lib.sh
In-Reply-To: <cover.1527171860.git.petrm@mellanox.com>
References: <cover.1527171860.git.petrm@mellanox.com>
Message-ID: <addb3679a348a0bef04f1cabf0484892a46b0890.1527171860.git.petrm@mellanox.com>

Move generic parts of mirror_gre_topo_lib.sh into a new file
mirror_topo_lib.sh. Reuse the functions in GRE topo, adding the tunnel
devices as necessary.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../net/forwarding/mirror_gre_topo_lib.sh          | 53 ++----------
 .../selftests/net/forwarding/mirror_topo_lib.sh    | 99 ++++++++++++++++++++++
 2 files changed, 108 insertions(+), 44 deletions(-)
 create mode 100644 tools/testing/selftests/net/forwarding/mirror_topo_lib.sh

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_topo_lib.sh b/tools/testing/selftests/net/forwarding/mirror_gre_topo_lib.sh
index b3ceda2..2534195 100644
--- a/tools/testing/selftests/net/forwarding/mirror_gre_topo_lib.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_topo_lib.sh
@@ -33,29 +33,11 @@
 #   |                                                                         |
 #   +-------------------------------------------------------------------------+
 
-mirror_gre_topo_h1_create()
-{
-	simple_if_init $h1 192.0.2.1/28
-}
-
-mirror_gre_topo_h1_destroy()
-{
-	simple_if_fini $h1 192.0.2.1/28
-}
-
-mirror_gre_topo_h2_create()
-{
-	simple_if_init $h2 192.0.2.2/28
-}
-
-mirror_gre_topo_h2_destroy()
-{
-	simple_if_fini $h2 192.0.2.2/28
-}
+source mirror_topo_lib.sh
 
 mirror_gre_topo_h3_create()
 {
-	simple_if_init $h3
+	mirror_topo_h3_create
 
 	tunnel_create h3-gt4 gretap 192.0.2.130 192.0.2.129
 	ip link set h3-gt4 vrf v$h3
@@ -71,49 +53,32 @@ mirror_gre_topo_h3_destroy()
 	tunnel_destroy h3-gt6
 	tunnel_destroy h3-gt4
 
-	simple_if_fini $h3
+	mirror_topo_h3_destroy
 }
 
 mirror_gre_topo_switch_create()
 {
-	ip link set dev $swp3 up
-
-	ip link add name br1 type bridge vlan_filtering 1
-	ip link set dev br1 up
-
-	ip link set dev $swp1 master br1
-	ip link set dev $swp1 up
-
-	ip link set dev $swp2 master br1
-	ip link set dev $swp2 up
+	mirror_topo_switch_create
 
 	tunnel_create gt4 gretap 192.0.2.129 192.0.2.130 \
 		      ttl 100 tos inherit
 
 	tunnel_create gt6 ip6gretap 2001:db8:2::1 2001:db8:2::2 \
 		      ttl 100 tos inherit allow-localremote
-
-	tc qdisc add dev $swp1 clsact
 }
 
 mirror_gre_topo_switch_destroy()
 {
-	tc qdisc del dev $swp1 clsact
-
 	tunnel_destroy gt6
 	tunnel_destroy gt4
 
-	ip link set dev $swp1 down
-	ip link set dev $swp2 down
-	ip link del dev br1
-
-	ip link set dev $swp3 down
+	mirror_topo_switch_destroy
 }
 
 mirror_gre_topo_create()
 {
-	mirror_gre_topo_h1_create
-	mirror_gre_topo_h2_create
+	mirror_topo_h1_create
+	mirror_topo_h2_create
 	mirror_gre_topo_h3_create
 
 	mirror_gre_topo_switch_create
@@ -124,6 +89,6 @@ mirror_gre_topo_destroy()
 	mirror_gre_topo_switch_destroy
 
 	mirror_gre_topo_h3_destroy
-	mirror_gre_topo_h2_destroy
-	mirror_gre_topo_h1_destroy
+	mirror_topo_h2_destroy
+	mirror_topo_h1_destroy
 }
diff --git a/tools/testing/selftests/net/forwarding/mirror_topo_lib.sh b/tools/testing/selftests/net/forwarding/mirror_topo_lib.sh
new file mode 100644
index 0000000..5b787972
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/mirror_topo_lib.sh
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# This is the standard topology for testing mirroring. The tests that use it
+# tweak it in one way or another--typically add more devices to the topology.
+#
+#   +---------------------+                             +---------------------+
+#   | H1                  |                             |                  H2 |
+#   |     + $h1           |                             |           $h2 +     |
+#   |     | 192.0.2.1/28  |                             |  192.0.2.2/28 |     |
+#   +-----|---------------+                             +---------------|-----+
+#         |                                                             |
+#   +-----|-------------------------------------------------------------|-----+
+#   | SW  o--> mirror                                                   |     |
+#   | +---|-------------------------------------------------------------|---+ |
+#   | |   + $swp1                    BR                           $swp2 +   | |
+#   | +---------------------------------------------------------------------+ |
+#   |                                                                         |
+#   |     + $swp3                                                             |
+#   +-----|-------------------------------------------------------------------+
+#         |
+#   +-----|-------------------------------------------------------------------+
+#   | H3  + $h3                                                               |
+#   |                                                                         |
+#   +-------------------------------------------------------------------------+
+
+mirror_topo_h1_create()
+{
+	simple_if_init $h1 192.0.2.1/28
+}
+
+mirror_topo_h1_destroy()
+{
+	simple_if_fini $h1 192.0.2.1/28
+}
+
+mirror_topo_h2_create()
+{
+	simple_if_init $h2 192.0.2.2/28
+}
+
+mirror_topo_h2_destroy()
+{
+	simple_if_fini $h2 192.0.2.2/28
+}
+
+mirror_topo_h3_create()
+{
+	simple_if_init $h3
+}
+
+mirror_topo_h3_destroy()
+{
+	simple_if_fini $h3
+}
+
+mirror_topo_switch_create()
+{
+	ip link set dev $swp3 up
+
+	ip link add name br1 type bridge vlan_filtering 1
+	ip link set dev br1 up
+
+	ip link set dev $swp1 master br1
+	ip link set dev $swp1 up
+
+	ip link set dev $swp2 master br1
+	ip link set dev $swp2 up
+
+	tc qdisc add dev $swp1 clsact
+}
+
+mirror_topo_switch_destroy()
+{
+	tc qdisc del dev $swp1 clsact
+
+	ip link set dev $swp1 down
+	ip link set dev $swp2 down
+	ip link del dev br1
+
+	ip link set dev $swp3 down
+}
+
+mirror_topo_create()
+{
+	mirror_topo_h1_create
+	mirror_topo_h2_create
+	mirror_topo_h3_create
+
+	mirror_topo_switch_create
+}
+
+mirror_topo_destroy()
+{
+	mirror_topo_switch_destroy
+
+	mirror_topo_h3_destroy
+	mirror_topo_h2_destroy
+	mirror_topo_h1_destroy
+}
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

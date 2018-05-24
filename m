From: petrm at mellanox.com (Petr Machata)
Date: Thu, 24 May 2018 16:27:21 +0200
Subject: [PATCH net-next 03/10] selftests: forwarding: Add $h3's clsact to
 mirror_topo_lib.sh
In-Reply-To: <cover.1527171860.git.petrm@mellanox.com>
References: <cover.1527171860.git.petrm@mellanox.com>
Message-ID: <4119543d66caca1a06e70d55bb41c7748c36d28a.1527171860.git.petrm@mellanox.com>

Having a clsact qdisc on $h3 is useful in several tests, and will be
useful in more tests to come. Move the registration from all the tests
that need it into the topology file itself.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/mirror_gre.sh         | 2 --
 tools/testing/selftests/net/forwarding/mirror_gre_changes.sh | 2 --
 tools/testing/selftests/net/forwarding/mirror_topo_lib.sh    | 2 ++
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre.sh b/tools/testing/selftests/net/forwarding/mirror_gre.sh
index c6786d1..e6fd7a1 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre.sh
@@ -72,7 +72,6 @@ test_span_gre_mac()
 	RET=0
 
 	mirror_install $swp1 $direction $tundev "matchall $tcflags"
-	tc qdisc add dev $h3 clsact
 	tc filter add dev $h3 ingress pref 77 prot $prot \
 		flower ip_proto 0x2f src_mac $swp3mac dst_mac $h3mac \
 		action pass
@@ -80,7 +79,6 @@ test_span_gre_mac()
 	mirror_test v$h1 192.0.2.1 192.0.2.2 $h3 77 10
 
 	tc filter del dev $h3 ingress pref 77
-	tc qdisc del dev $h3 clsact
 	mirror_uninstall $swp1 $direction
 
 	log_test "$direction $what: envelope MAC ($tcflags)"
diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh b/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh
index e22a9e4..aa29d46 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh
@@ -73,7 +73,6 @@ test_span_gre_ttl()
 	RET=0
 
 	mirror_install $swp1 ingress $tundev "matchall $tcflags"
-	tc qdisc add dev $h3 clsact
 	tc filter add dev $h3 ingress pref 77 prot $prot \
 		flower ip_ttl 50 action pass
 
@@ -84,7 +83,6 @@ test_span_gre_ttl()
 
 	ip link set dev $tundev type $type ttl 100
 	tc filter del dev $h3 ingress pref 77
-	tc qdisc del dev $h3 clsact
 	mirror_uninstall $swp1 ingress
 
 	log_test "$what: TTL change ($tcflags)"
diff --git a/tools/testing/selftests/net/forwarding/mirror_topo_lib.sh b/tools/testing/selftests/net/forwarding/mirror_topo_lib.sh
index 5b787972..04979e5 100644
--- a/tools/testing/selftests/net/forwarding/mirror_topo_lib.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_topo_lib.sh
@@ -46,10 +46,12 @@ mirror_topo_h2_destroy()
 mirror_topo_h3_create()
 {
 	simple_if_init $h3
+	tc qdisc add dev $h3 clsact
 }
 
 mirror_topo_h3_destroy()
 {
+	tc qdisc del dev $h3 clsact
 	simple_if_fini $h3
 }
 
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

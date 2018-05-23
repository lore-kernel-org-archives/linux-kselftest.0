From: petrm at mellanox.com (Petr Machata)
Date: Wed, 23 May 2018 18:35:01 +0200
Subject: [PATCH net-next 2/3] selftests: forwarding: Test removal of underlay
 route
In-Reply-To: <cover.1527093017.git.petrm@mellanox.com>
References: <cover.1527093017.git.petrm@mellanox.com>
Message-ID: <0f1c5fd8a2e601ac13f3343a8de1cdd845da559e.1527093017.git.petrm@mellanox.com>

When underlay route is removed, the mirrored traffic should not be
forwarded.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../selftests/net/forwarding/mirror_gre_changes.sh | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh b/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh
index a35fd55..e22a9e4 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh
@@ -13,6 +13,7 @@ ALL_TESTS="
 	test_egress_up
 	test_remote_ip
 	test_tun_del
+	test_route_del
 "
 
 NUM_NETIFS=6
@@ -189,6 +190,29 @@ test_span_gre_tun_del()
 	log_test "$what: tunnel deleted ($tcflags)"
 }
 
+test_span_gre_route_del()
+{
+	local tundev=$1; shift
+	local edev=$1; shift
+	local route=$1; shift
+	local what=$1; shift
+
+	RET=0
+
+	mirror_install $swp1 ingress $tundev "matchall $tcflags"
+	quick_test_span_gre_dir $tundev ingress
+
+	ip route del $route dev $edev
+	fail_test_span_gre_dir $tundev ingress
+
+	ip route add $route dev $edev
+	quick_test_span_gre_dir $tundev ingress
+
+	mirror_uninstall $swp1 ingress
+
+	log_test "$what: underlay route removal ($tcflags)"
+}
+
 test_ttl()
 {
 	test_span_gre_ttl gt4 gretap ip "mirror to gretap"
@@ -221,6 +245,12 @@ test_tun_del()
 			      2001:db8:2::1 2001:db8:2::2 "mirror to ip6gretap"
 }
 
+test_route_del()
+{
+	test_span_gre_route_del gt4 $swp3 192.0.2.128/28 "mirror to gretap"
+	test_span_gre_route_del gt6 $swp3 2001:db8:2::/64 "mirror to ip6gretap"
+}
+
 test_all()
 {
 	slow_path_trap_install $swp1 ingress
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

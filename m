From: petrm at mellanox.com (Petr Machata)
Date: Wed, 23 May 2018 18:34:56 +0200
Subject: [PATCH net-next 1/3] selftests: forwarding: Test mirroring to deleted
 device
In-Reply-To: <cover.1527093017.git.petrm@mellanox.com>
References: <cover.1527093017.git.petrm@mellanox.com>
Message-ID: <d483f29572ab5b8f8a87e1ebe05a2e7f315a254d.1527093017.git.petrm@mellanox.com>

Tests that the mirroring code catches up with deletion of a mirrored-to
device.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../selftests/net/forwarding/mirror_gre_changes.sh | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh b/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh
index 50ab346..a35fd55 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh
@@ -12,6 +12,7 @@ ALL_TESTS="
 	test_tun_up
 	test_egress_up
 	test_remote_ip
+	test_tun_del
 "
 
 NUM_NETIFS=6
@@ -159,6 +160,35 @@ test_span_gre_remote_ip()
 	log_test "$what: remote address change ($tcflags)"
 }
 
+test_span_gre_tun_del()
+{
+	local tundev=$1; shift
+	local type=$1; shift
+	local flags=$1; shift
+	local local_ip=$1; shift
+	local remote_ip=$1; shift
+	local what=$1; shift
+
+	RET=0
+
+	mirror_install $swp1 ingress $tundev "matchall $tcflags"
+	quick_test_span_gre_dir $tundev ingress
+	ip link del dev $tundev
+	fail_test_span_gre_dir $tundev ingress
+
+	tunnel_create $tundev $type $local_ip $remote_ip \
+		      ttl 100 tos inherit $flags
+
+	# Recreating the tunnel doesn't reestablish mirroring, so reinstall it
+	# and verify it works for the follow-up tests.
+	mirror_uninstall $swp1 ingress
+	mirror_install $swp1 ingress $tundev "matchall $tcflags"
+	quick_test_span_gre_dir $tundev ingress
+	mirror_uninstall $swp1 ingress
+
+	log_test "$what: tunnel deleted ($tcflags)"
+}
+
 test_ttl()
 {
 	test_span_gre_ttl gt4 gretap ip "mirror to gretap"
@@ -183,6 +213,14 @@ test_remote_ip()
 	test_span_gre_remote_ip gt6 ip6gretap 2001:db8:2::2 2001:db8:2::4 "mirror to ip6gretap"
 }
 
+test_tun_del()
+{
+	test_span_gre_tun_del gt4 gretap "" \
+			      192.0.2.129 192.0.2.130 "mirror to gretap"
+	test_span_gre_tun_del gt6 ip6gretap allow-localremote \
+			      2001:db8:2::1 2001:db8:2::2 "mirror to ip6gretap"
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

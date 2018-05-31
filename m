From: petrm at mellanox.com (Petr Machata)
Date: Thu, 31 May 2018 19:52:37 +0200
Subject: [PATCH net-next 7/9] selftests: forwarding:
 mirror_gre_vlan_bridge_1q: Rename two tests
In-Reply-To: <cover.1527788672.git.petrm@mellanox.com>
References: <cover.1527788672.git.petrm@mellanox.com>
Message-ID: <cd515afe036264c88b91a5470ae788b0716e78c2.1527788672.git.petrm@mellanox.com>

Rename test_gretap_forbidden() and test_ip6gretap_forbidden() to a more
specific test_gretap_forbidden_cpu() and test_ip6gretap_forbidden_cpu().
This will make it clearer which is which when further down a patch is
introduced that forbids a VLAN on regular bridge port.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh  | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh b/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
index 0a3bac9..d91b347 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
@@ -10,8 +10,8 @@
 ALL_TESTS="
 	test_gretap
 	test_ip6gretap
-	test_gretap_forbidden
-	test_ip6gretap_forbidden
+	test_gretap_forbidden_cpu
+	test_ip6gretap_forbidden_cpu
 "
 
 NUM_NETIFS=6
@@ -77,7 +77,7 @@ test_ip6gretap()
 	test_vlan_match gt6 'vlan_id 555 vlan_ethtype ipv6' "mirror to ip6gretap"
 }
 
-test_span_gre_forbidden()
+test_span_gre_forbidden_cpu()
 {
 	local tundev=$1; shift
 	local what=$1; shift
@@ -102,14 +102,14 @@ test_span_gre_forbidden()
 	log_test "$what: vlan forbidden at a bridge ($tcflags)"
 }
 
-test_gretap_forbidden()
+test_gretap_forbidden_cpu()
 {
-	test_span_gre_forbidden gt4 "mirror to gretap"
+	test_span_gre_forbidden_cpu gt4 "mirror to gretap"
 }
 
-test_ip6gretap_forbidden()
+test_ip6gretap_forbidden_cpu()
 {
-	test_span_gre_forbidden gt6 "mirror to ip6gretap"
+	test_span_gre_forbidden_cpu gt6 "mirror to ip6gretap"
 }
 
 test_all()
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

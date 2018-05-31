From: petrm@mellanox.com (Petr Machata)
Date: Thu, 31 May 2018 19:52:26 +0200
Subject: [PATCH net-next 5/9] selftests: forwarding:
 mirror_gre_vlan_bridge_1q: Fix tunnel name
In-Reply-To: <cover.1527788672.git.petrm@mellanox.com>
References: <cover.1527788672.git.petrm@mellanox.com>
Message-ID:
 <9abf361236d8ef198d390a49fde874087491231e.1527788672.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180531175226.BBgwuGTGKvNjZti4vL284IsRiMAA2oUxyDayXedOzOs@z>

The "ip6gretap" in the test name refers to the tunnel device type that
the test is supposed to be testing. However test_ip6gretap_forbidden()
tests, due to a typo, a gretap tunnel. Fix the typo.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh b/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
index 01ec28a..29fde73 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
@@ -108,7 +108,7 @@ test_gretap_forbidden()
 
 test_ip6gretap_forbidden()
 {
-	test_span_gre_forbidden gt4 "mirror to ip6gretap"
+	test_span_gre_forbidden gt6 "mirror to ip6gretap"
 }
 
 test_all()
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

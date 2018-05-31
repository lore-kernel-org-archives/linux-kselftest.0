From: petrm@mellanox.com (Petr Machata)
Date: Thu, 31 May 2018 19:52:32 +0200
Subject: [PATCH net-next 6/9] selftests: forwarding:
 mirror_gre_vlan_bridge_1q: Test final config
In-Reply-To: <cover.1527788672.git.petrm@mellanox.com>
References: <cover.1527788672.git.petrm@mellanox.com>
Message-ID:
 <68dcc17b4f98dfda3b9f408edee906698b1a2313.1527788672.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180531175232.R-aaYrGqHm8jzj12y7Hx9Qgwy2QkoC-gu7OtO7iedSU@z>

After the final change reestablishes the original configuration, make
sure the traffic flows again as it should.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh b/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
index 29fde73..0a3bac9 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
@@ -91,12 +91,13 @@ test_span_gre_forbidden()
 	# Now forbid the VLAN at the bridge and see it fail.
 	bridge vlan del dev br1 vid 555 self
 	sleep 1
-
 	fail_test_span_gre_dir $tundev ingress
-	mirror_uninstall $swp1 ingress
 
 	bridge vlan add dev br1 vid 555 self
 	sleep 1
+	quick_test_span_gre_dir $tundev ingress
+
+	mirror_uninstall $swp1 ingress
 
 	log_test "$what: vlan forbidden at a bridge ($tcflags)"
 }
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

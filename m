From: petrm@mellanox.com (Petr Machata)
Date: Fri, 01 Jun 2018 00:37:44 +0200
Subject: [PATCH net-next 1/2] selftests: forwarding: mirror_vlan: Uninstall
 trap
In-Reply-To: <cover.1527805500.git.petrm@mellanox.com>
References: <cover.1527805500.git.petrm@mellanox.com>
Message-ID:
 <72a086d8bfd94ec0bc438b00a9ebf4f5d6515f2c.1527805500.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180531223744.w_wEb4O4l7_eC40Q7k1oIFI2a04aIwfCS7rRTmtcibk@z>

Instead of installing a trap before tests run and uninstalling it after
they run, mirror_vlan.sh installs it twice due to a typo. Fix the typo.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/mirror_vlan.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/forwarding/mirror_vlan.sh b/tools/testing/selftests/net/forwarding/mirror_vlan.sh
index 1e10520..c22e949 100755
--- a/tools/testing/selftests/net/forwarding/mirror_vlan.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_vlan.sh
@@ -146,7 +146,7 @@ test_all()
 
 	tests_run
 
-	trap_install $h3 ingress
+	trap_uninstall $h3 ingress
 	slow_path_trap_uninstall $swp1 egress
 	slow_path_trap_uninstall $swp1 ingress
 }
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

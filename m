From: petrm at mellanox.com (Petr Machata)
Date: Fri, 01 Jun 2018 00:37:47 +0200
Subject: [PATCH net-next 2/2] selftests: forwarding: mirror_vlan: Change test
 description
In-Reply-To: <cover.1527805500.git.petrm@mellanox.com>
References: <cover.1527805500.git.petrm@mellanox.com>
Message-ID: <2771471a59b715ec664cb95b17a2fc4f33a98803.1527805500.git.petrm@mellanox.com>

The test description is displayed with the PASS/FAIL resolution after
the test is ran. There however already is one other test described
exactly like this, which makes it unclear which of the tests passed or
failed. Make the description unique.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/mirror_vlan.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/forwarding/mirror_vlan.sh b/tools/testing/selftests/net/forwarding/mirror_vlan.sh
index c22e949..efade19 100755
--- a/tools/testing/selftests/net/forwarding/mirror_vlan.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_vlan.sh
@@ -129,7 +129,7 @@ test_tagged_vlan_dir()
 				  192.0.2.17 192.0.2.18
 	mirror_uninstall $swp1 $direction
 
-	log_test "$direction mirror to vlan ($tcflags)"
+	log_test "$direction mirror tagged to vlan ($tcflags)"
 }
 
 test_tagged_vlan()
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

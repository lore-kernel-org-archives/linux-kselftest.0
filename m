From: petrm@mellanox.com (Petr Machata)
Date: Thu, 03 May 2018 12:37:21 +0200
Subject: [PATCH net-next mlxsw 3/3] selftests: forwarding: mirror_gre_nh:
 Unset RP filter
In-Reply-To: <cover.1525343276.git.petrm@mellanox.com>
References: <cover.1525343276.git.petrm@mellanox.com>
Message-ID:
 <f60f46c811adc40c4749320085899fd8f7425d56.1525343276.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180503103721.35XlfG5bhr7IFtoYSZXGgtcdf79EznIjcPkpJ0-LNxw@z>

The test fails to work if reverse-path filtering is in effect on the
mirrored-to host interface, or for all interfaces.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/mirror_gre_nh.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_nh.sh b/tools/testing/selftests/net/forwarding/mirror_gre_nh.sh
index a0d1ad4..8fa681e 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_nh.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_nh.sh
@@ -29,6 +29,9 @@ setup_prepare()
 	swp3=${NETIFS[p5]}
 	h3=${NETIFS[p6]}
 
+	sysctl_set net.ipv4.conf.all.rp_filter 0
+	sysctl_set net.ipv4.conf.$h3.rp_filter 0
+
 	vrf_prepare
 	mirror_gre_topo_create
 
@@ -60,6 +63,9 @@ cleanup()
 
 	mirror_gre_topo_destroy
 	vrf_cleanup
+
+	sysctl_restore net.ipv4.conf.$h3.rp_filter
+	sysctl_restore net.ipv4.conf.all.rp_filter
 }
 
 test_gretap()
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: petrm@mellanox.com (Petr Machata)
Date: Tue, 10 Jul 2018 14:44:26 +0200
Subject: [PATCH net-next] selftests: forwarding: mirror_gre_nh: Unset
 rp_filter on host VRF
Message-ID:
 <a1d9001969381681ce4c3891ef8404b74aef177f.1531226547.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180710124426.GgvkGi4L_MsE8PeLjK8ZZWb1E1IrRkmU80nPvpDeAI4@z>

The mirrored packets arrive at $h3 encapsulated in GRE/IPv4, with IP
address from 192.0.2.128/28 network. However the interface is configured
as a member of 192.0.2.160/28 and there's no route directing traffic
from the former network through that interface. Correspondingly, the RP
filter on the VRF rejects it.

Therefore turn off the VRF's RP filter.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/mirror_gre_nh.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_nh.sh b/tools/testing/selftests/net/forwarding/mirror_gre_nh.sh
index 8fa681eb90e7..6f9ef1820e93 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_nh.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_nh.sh
@@ -35,6 +35,8 @@ setup_prepare()
 	vrf_prepare
 	mirror_gre_topo_create
 
+	sysctl_set net.ipv4.conf.v$h3.rp_filter 0
+
 	ip address add dev $swp3 192.0.2.161/28
 	ip address add dev $h3 192.0.2.162/28
 	ip address add dev gt4 192.0.2.129/32
@@ -61,6 +63,8 @@ cleanup()
 	ip address del dev $h3 192.0.2.162/28
 	ip address del dev $swp3 192.0.2.161/28
 
+	sysctl_restore net.ipv4.conf.v$h3.rp_filter 0
+
 	mirror_gre_topo_destroy
 	vrf_cleanup
 
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
